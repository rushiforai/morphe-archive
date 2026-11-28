/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.register
import app.fakh.patches.github.shared.Constants.SHOW_ASSET_DOWNLOAD_COUNT
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val COUNT = "Lapp/fakh/extension/github/AssetDownloadCount;"

private const val STRING = "Ljava/lang/String;"

/** The start of the file list in the query of a release, up to where the new fields go. */
private const val ASSETS = "releaseAssets(first: \$number, after: \$after) { pageInfo { hasNextPage endCursor } nodes { "

/**
 * Replaces the single size chip of a release asset with a row holding the size chip and, when known, a second chip
 * showing the download icon and count.
 */
private fun addCountChip(method: MutableMethod, assetType: String, itemType: String, chipAt: Int) {
    val instructions = method.instructions
    val chipCall = instructions[chipAt].method!!
    val modifier = chipCall.types[0]
    val composer = chipCall.types[3]

    // Grab the Compose node helpers right from the surrounding Column in this method.
    val before = instructions.take(chipAt)
    val after = instructions.drop(chipAt + 1)
    fun beforeCall(what: String, match: (MethodReference) -> Boolean) =
        before.lastOrNull { it.method?.let(match) == true }?.method
            ?: throw PatchException("Release asset row: $what not found")
    fun beforeField(opcode: Opcode, what: String, match: (FieldReference) -> Boolean) =
        before.lastOrNull { it.opcode == opcode && it.field?.let(match) == true }?.field
            ?: throw PatchException("Release asset row: $what not found")

    val keyHash = beforeField(Opcode.IGET_WIDE, "composite key hash") { it.definingClass == composer && it.type == "J" }
    val locals = beforeCall("composition locals") {
        it.definingClass == composer && it.types.isEmpty() && it.returnType.startsWith("L")
    }
    val materialize = beforeCall("materialize") { it.types == listOf(composer, modifier) && it.returnType == modifier }
    val inserting = beforeField(Opcode.IGET_BOOLEAN, "inserting") { it.definingClass == composer }
    val insertingAt = before.indexOfLast { it.field == inserting }
    val nodeCalls = before.drop(insertingAt - 1).mapNotNull { it.method }.filter { it.definingClass == composer }
    val startNode = before.take(insertingAt).last { it.method?.definingClass == composer }.method!!
    val createNode = nodeCalls.first { it.types.size == 1 && it.returnType == "V" && it.types[0].startsWith("L") }
    val useNode = nodeCalls.first { it.types.isEmpty() && it.returnType == "V" && it.name != startNode.name }
    val factory = instructions.firstNotNullOfOrNull {
        it.field?.takeIf { field ->
            it.opcode == Opcode.SGET_OBJECT &&
                classDefByOrNull(field.type)?.interfaces?.contains(createNode.types[0]) == true
        }
    } ?: throw PatchException("Release asset row: node factory not found")
    val setters = before.drop(insertingAt).filter { it.opcode == Opcode.SGET_OBJECT }.take(4).map { it.field!! }
    val set = before.drop(insertingAt).mapNotNull { it.method }.first {
        it.types.size == 3 && it.types[1] == composer && it.types[2] == "Ljava/lang/Object;"
    }
    val applied = before.drop(insertingAt).mapNotNull { it.method }.first {
        it.definingClass == set.definingClass && it.types == listOf(composer)
    }
    val startGroup = after.mapNotNull { it.method }.firstOrNull {
        it.definingClass == composer && it.types == listOf("I") && it.returnType == "V"
    } ?: before.mapNotNull { it.method }.firstOrNull {
        it.definingClass == composer && it.types == listOf("I") && it.returnType == "V"
    } ?: throw PatchException("Release asset row: start group not found")
    val endGroup = after.mapNotNull { it.method }.firstOrNull {
        it.definingClass == composer && it.types == listOf("Z") && it.returnType == "V"
    } ?: throw PatchException("Release asset row: end group not found")
    val companion = beforeField(Opcode.SGET_OBJECT, "Modifier companion") {
        it.type == it.definingClass && classDefByOrNull(it.type)?.interfaces?.contains(modifier) == true
    }

    // Grab the Row measure policy (Alignment.CenterVertically) and Arrangement.spacedBy (`su4`) from the app.
    var rowMeasure: MethodReference? = null
    var rowAlign: FieldReference? = null
    var spacedInit: MethodReference? = null
    var commitType: String? = null
    classDefForEach { classDef ->
        if (classDef.methods.any { m -> m.name == "toString" && m.instructions.any { it.string == "SimpleCommit(id=" } }) {
            commitType = classDef.type
        }
        if (spacedInit == null && classDef.methods.any { m ->
                m.name == "toString" && m.instructions.any { it.string == "Arrangement#spacedAligned(" }
            }
        ) {
            spacedInit = classDef.methods.singleOrNull { m ->
                m.name == "<init>" && m.types.size == 3 && m.types[0] == "F" && m.types[1] == "Z"
            }
        }
    }
    classDefForEach { classDef ->
        if (rowMeasure != null) return@classDefForEach
        classDef.methods.forEach { m ->
            val body = m.instructions
            val commitAt = body.indexOfFirst { it.field?.definingClass == commitType }
            if (commitAt < 0) return@forEach
            // Right after SimpleCommit is read, the next measurePolicy call is the author Row (CenterVertically).
            val at = (commitAt until body.size).firstOrNull { i ->
                val call = body[i].method ?: return@firstOrNull false
                call.types.size == 4 && call.types[2] == composer && call.types[3] == "I" &&
                    call.returnType.startsWith("L")
            } ?: return@forEach
            rowMeasure = body[at].method
            val mRef = rowMeasure!!
            rowAlign = body.take(at).last {
                it.opcode == Opcode.SGET_OBJECT && it.field?.let { f ->
                    f.type == mRef.types[1] || classDefByOrNull(f.type)?.interfaces?.contains(mRef.types[1]) == true
                } == true
            }.field!!
        }
    }
    val measure = rowMeasure ?: throw PatchException("Release asset row: Row measure policy not found")
    val align = rowAlign ?: throw PatchException("Release asset row: Row alignment not found")
    val spaced = spacedInit ?: throw PatchException("Release asset row: Arrangement.spacedBy not found")

    // SimpleMetadataItem constructor and fields: (text, drawableRes, drawableTint, contentDescription, bg, stroke, style, mask)
    val itemClass = classDefByOrNull(itemType) ?: throw PatchException("SimpleMetadataItem not found")
    val itemInit = itemClass.methods.single { it.name == "<init>" && it.types.size == 8 }
    val itemFields = itemInit.instructions.filter { it.opcode == Opcode.IPUT_OBJECT }.mapNotNull { it.field }
    val tintField = itemFields[2] // drawableTint (nm8)

    // The asset id is the first String field stored by ReleaseAsset's constructor.
    val assetId = classDefByOrNull(assetType)!!.methods.single { it.name == "<init>" }
        .instructions.filter { it.opcode == Opcode.IPUT_OBJECT }.mapNotNull { it.field }
        .first { it.type == STRING }

    // Capture the ReleaseAsset right where its size field is read, because the register may be reused for SimpleMetadataItem.
    val sizeReadAt = before.indexOfLast { it.opcode == Opcode.IGET_OBJECT && it.field?.definingClass == assetType }
    val assetReg = (before[sizeReadAt] as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerB

    val chipInstr = instructions[chipAt]
    val (heightReg, itemReg, composerReg) = when (chipInstr) {
        is RegisterRangeInstruction -> Triple(
            chipInstr.startRegister + 1,
            chipInstr.startRegister + 2,
            chipInstr.startRegister + 3,
        )
        is FiveRegisterInstruction -> Triple(chipInstr.registerD, chipInstr.registerE, chipInstr.registerF)
        else -> throw PatchException("Release asset row: unexpected chip call format")
    }

    val owner = method.definingClass
    val ownerClass = mutableClassDefBy(owner)
    ownerClass.staticFields.add(
        com.android.tools.smali.dexlib2.immutable.ImmutableField(
            owner,
            "fakhAsset",
            assetType,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            null,
        ).toMutable(),
    )
    ownerClass.methods.add(
        ImmutableMethod(
            owner,
            "fakhSetAsset",
            listOf(ImmutableMethodParameter(assetType, null, null)),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(1),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    sput-object p0, $owner->fakhAsset:$assetType
                    return-void
                """,
            )
        },
    )
    ownerClass.methods.add(
        ImmutableMethod(
            owner,
            "fakhAssetRow",
            listOf(
                ImmutableMethodParameter(modifier, null, null),
                ImmutableMethodParameter(itemType, null, null),
                ImmutableMethodParameter(composer, null, null),
            ),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(15),
        ).toMutable().apply {
            // p0 = heightModifier, p1 = sizeItem, p2 = composer
            addInstructionsWithLabels(
                0,
                """
                    new-instance v0, ${spaced.definingClass}
                    const/high16 v1, 0x41000000
                    const/4 v2, 0x1
                    const/4 v3, 0x0
                    invoke-direct { v0, v1, v2, v3 }, ${spaced.smali}
                    sget-object v1, ${align.smali}
                    const/16 v2, 0x36
                    invoke-static { v0, v1, p2, v2 }, ${measure.smali}
                    move-result-object v0
                    iget-wide v1, p2, ${keyHash.smali}
                    invoke-static { v1, v2 }, Ljava/lang/Long;->hashCode(J)I
                    move-result v1
                    invoke-virtual { p2 }, ${locals.smali}
                    move-result-object v2
                    sget-object v3, ${companion.smali}
                    invoke-static { p2, v3 }, ${materialize.smali}
                    move-result-object v3
                    invoke-virtual { p2 }, ${startNode.smali}
                    iget-boolean v4, p2, ${inserting.smali}
                    if-eqz v4, :reuse
                    sget-object v4, ${factory.smali}
                    invoke-virtual { p2, v4 }, ${createNode.smali}
                    goto :update
                    :reuse
                    invoke-virtual { p2 }, ${useNode.smali}
                    :update
                    sget-object v4, ${setters[0].smali}
                    invoke-static { v4, p2, v0 }, ${set.smali}
                    sget-object v4, ${setters[1].smali}
                    invoke-static { v4, p2, v2 }, ${set.smali}
                    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                    move-result-object v1
                    sget-object v4, ${setters[2].smali}
                    invoke-static { v4, p2, v1 }, ${set.smali}
                    invoke-static { p2 }, ${applied.smali}
                    sget-object v4, ${setters[3].smali}
                    invoke-static { v4, p2, v3 }, ${set.smali}

                    const/4 v0, 0x0
                    move-object/from16 v1, p0
                    move-object/from16 v2, p1
                    move-object/from16 v3, p2
                    const/4 v4, 0x0
                    const/4 v5, 0x1
                    invoke-static/range { v0 .. v5 }, ${chipCall.smali}

                    const v0, 0x66616b63
                    invoke-virtual { p2, v0 }, ${startGroup.smali}
                    sget-object v0, $owner->fakhAsset:$assetType
                    if-eqz v0, :done
                    iget-object v0, v0, ${assetId.smali}
                    invoke-static { v0 }, $COUNT->text($STRING)$STRING
                    move-result-object v1
                    if-eqz v1, :done

                    new-instance v0, $itemType
                    invoke-static {}, $COUNT->icon()I
                    move-result v2
                    invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                    move-result-object v2
                    iget-object v3, p1, ${tintField.smali}
                    const/4 v4, 0x0
                    const/4 v5, 0x0
                    const/4 v6, 0x0
                    const/4 v7, 0x0
                    const/16 v8, 0xf4
                    invoke-direct/range { v0 .. v8 }, ${itemInit.smali}

                    const/4 v1, 0x0
                    move-object/from16 v2, p0
                    move-object v3, v0
                    move-object/from16 v4, p2
                    const/4 v5, 0x0
                    const/4 v6, 0x1
                    invoke-static/range { v1 .. v6 }, ${chipCall.smali}

                    :done
                    const/4 v0, 0x0
                    invoke-virtual { p2, v0 }, ${endGroup.smali}
                    const/4 v0, 0x1
                    invoke-virtual { p2, v0 }, ${endGroup.smali}
                    return-void
                """,
            )
        },
    )

    if (listOf(heightReg, itemReg, composerReg).all { it <= 15 }) {
        method.replaceInstruction(
            chipAt,
            "invoke-static { v$heightReg, v$itemReg, v$composerReg }, " +
                "$owner->fakhAssetRow($modifier$itemType$composer)V",
        )
    } else {
        val base = (chipInstr as RegisterRangeInstruction).startRegister + 1
        method.replaceInstruction(
            chipAt,
            "invoke-static/range { v$base .. v${base + 2} }, " +
                "$owner->fakhAssetRow($modifier$itemType$composer)V",
        )
    }
    method.addInstructions(
        sizeReadAt,
        "invoke-static/range { v$assetReg .. v$assetReg }, $owner->fakhSetAsset($assetType)V",
    )
}

@Suppress("unused")
val showAssetDownloadCountPatch = patch(
    name = "Show download count for assets",
    description = "Shows how many times each file of a release was downloaded, next to its size.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(SHOW_ASSET_DOWNLOAD_COUNT)
        val names = setOf("id", "name", "size", "url", "contentType", "__typename")
        var model: String? = null
        var metaItem: String? = null
        val queries = mutableListOf<Pair<String, String>>()
        val parsers = mutableListOf<String>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val read = method.instructions.mapNotNull { it.string }
                if (read.any { ASSETS in it }) queries += classDef.type to method.name
                if (method.name == "toString" && "ReleaseAsset(id=" in read) model = classDef.type
                if (method.name == "toString" && "SimpleMetadataItem(text=" in read) metaItem = classDef.type
                // The file's parser lists exactly these field names.
                if (method.name == "<clinit>" && read.toSet() == names &&
                    classDef.methods.any { other -> other.instructions.any { it.selectsName } }
                ) {
                    parsers += classDef.type
                }
            }
        }
        val asset = model ?: throw PatchException("Release file model not found")
        val item = metaItem ?: throw PatchException("SimpleMetadataItem not found")
        if (queries.isEmpty() || queries.size != parsers.size) {
            throw PatchException("Release queries and parsers do not match: $queries, $parsers")
        }

        // Find the composable that draws a ReleaseAsset's size using SimpleMetadataItem.
        var target: Triple<String, String, Int>? = null
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val body = method.instructions
                if (body.none { it.field?.definingClass == asset }) return@forEach
                val chipAt = body.indices.firstOrNull { i ->
                    val call = body[i].method ?: return@firstOrNull false
                    call.returnType == "V" && call.types.size == 6 && call.types[2] == item &&
                        call.types[4] == "I" && call.types[5] == "I"
                } ?: return@forEach
                if (target != null) throw PatchException("More than one release asset row composable")
                target = Triple(classDef.type, method.name + method.parameterTypes.joinToString(""), chipAt)
            }
        }
        val (owner, sig, chipAt) = target ?: throw PatchException("Release asset row composable not found")
        val method = mutableClassDefBy(owner).methods.first {
            it.name + it.parameterTypes.joinToString("") == sig
        }
        addCountChip(method, asset, item, chipAt)

        queries.forEach { (type, name) ->
            mutableClassDefBy(type).methods.filter { it.name == name }.forEach {
                it.addToQuery(ASSETS, "fakhKey: id downloadCount")
            }
        }
        parsers.forEach { readAddedFields(it, COUNT, "id", "count") }
    }
}
