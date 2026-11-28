/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.register
import app.fakh.patches.github.shared.Constants.SHOW_REPOSITORY_AGE
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val AGE = "Lapp/fakh/extension/github/RepositoryAge;"

private const val STRING = "Ljava/lang/String;"

/** The start of the fragment every repository query shares, up to the field the new ones go after. */
private const val DETAILS = "fragment RepositoryDetailsFragment on Repository { __typename id "

/**
 * Draws the line under the stars and forks of the repository screen. Every Compose call in it is copied from the row
 * the header draws for the homepage link, since R8 renames them in each version.
 *
 * @param header The method that draws the top of the repository screen.
 * @param stats The composable that draws the stars and forks: `(Modifier, onStars, onForks, model, Composer, Int)`.
 */
private fun addAgeRow(header: MutableMethod, stats: Method) {
    val instructions = header.instructions
    val model = stats.types[3]
    val composer = stats.types[4]
    val rowAt = instructions.indexOfFirst { it.method?.isIconRow(composer) == true }
    val row = instructions[rowAt].method!!
    val modifier = row.types[0]
    val before = instructions.take(rowAt)
    fun lastCall(what: String, match: (MethodReference) -> Boolean) =
        before.lastOrNull { it.method?.let(match) == true }?.method
            ?: throw PatchException("Repository age row: $what not found")

    val icon = lastCall("icon") { it.types.size == 4 && it.returnType.startsWith("L") && it.types[3] == "I" && it.types[0] == "Ljava/lang/Integer;" }
    val insets = lastCall("icon padding") { it.name == "<init>" && it.types == listOf("F", "F", "F", "F") }
    val tint = lastCall("tint") { it.name == "<init>" && it.types == listOf("J") }
    val colorAt = before.indexOfLast { it.opcode == Opcode.IGET_WIDE && it.field?.type == "J" }
    val color = before[colorAt].field!!
    val colorLocal = before.take(colorAt).last { it.opcode == Opcode.SGET_OBJECT }.field!!
    val styleAt = before.indexOfLast { it.opcode == Opcode.IGET_OBJECT && it.field?.type == row.types[11] }
    val style = before[styleAt].field!!
    val readAt = before.take(styleAt).indexOfLast { it.method?.definingClass == composer }
    val read = before[readAt].method!!
    // The typography local is loaded early into a register the call reads it from.
    val localRegister = (before[readAt] as Instruction35c).registerD
    val styleLocal = before.take(readAt).lastOrNull {
        it.opcode == Opcode.SGET_OBJECT && (it as OneRegisterInstruction).registerA == localRegister &&
            it.field!!.type == colorLocal.type
    }?.field ?: throw PatchException("Repository age row: typography not found")
    // The text takes the style of the stars and forks, which is gray, instead of the link's.
    val gray = stats.instructions.firstNotNullOfOrNull {
        it.field?.takeIf { field ->
            it.opcode == Opcode.IGET_OBJECT && field.type == style.type && field.definingClass == style.definingClass
        }
    } ?: throw PatchException("Repository age row: stars and forks text style not found")
    val padding = instructions.firstNotNullOfOrNull {
        it.method?.takeIf { ref -> ref.types == listOf(modifier, "F", "F", "F", "F", "I") && ref.returnType == modifier }
    } ?: throw PatchException("Repository age row: padding not found")
    val companion = instructions.firstNotNullOfOrNull {
        it.field?.takeIf { field ->
            it.opcode == Opcode.SGET_OBJECT && field.type == field.definingClass &&
                classDefByOrNull(field.type)?.interfaces?.contains(modifier) == true
        }
    } ?: throw PatchException("Repository age row: Modifier companion not found")
    val after = instructions.drop(rowAt + 1).mapNotNull { it.method }.filter { it.definingClass == composer }
    val startGroup = after.firstOrNull { it.types == listOf("I") && it.returnType == "V" }
        ?: throw PatchException("Repository age row: start group not found")
    val endGroup = after.firstOrNull { it.types == listOf("Z") && it.returnType == "V" }
        ?: throw PatchException("Repository age row: end group not found")

    val owner = header.definingClass
    mutableClassDefBy(owner).methods.add(
        ImmutableMethod(
            owner,
            "fakhAge",
            listOf(ImmutableMethodParameter(model, null, null), ImmutableMethodParameter(composer, null, null)),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(20),
        ).toMutable().apply {
            // v0 to v17 are the arguments of the row; v14 is the composer throughout.
            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v14, p1
                    const v0, 0x66616b61
                    invoke-virtual { v14, v0 }, ${startGroup.smali}
                    invoke-static/range { p0 .. p0 }, $AGE->text(Ljava/lang/Object;)$STRING
                    move-result-object v6
                    if-eqz v6, :end

                    sget-object v0, ${companion.smali}
                    const/4 v1, 0x0
                    const/4 v2, 0x0
                    const/4 v3, 0x0
                    const/high16 v4, 0x41000000
                    const/4 v5, 0x7
                    invoke-static/range { v0 .. v5 }, ${padding.smali}
                    move-result-object v0
                    invoke-static {}, $AGE->icon()I
                    move-result v1
                    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                    move-result-object v1
                    const/4 v2, 0x0
                    const/16 v3, 0xe
                    invoke-static { v1, v2, v2, v3 }, ${icon.smali}
                    move-result-object v1
                    new-instance v2, ${insets.definingClass}
                    const/high16 v3, 0x40800000
                    invoke-direct { v2, v3, v3, v3, v3 }, ${insets.smali}
                    sget-object v3, ${colorLocal.smali}
                    invoke-virtual { v14, v3 }, ${read.smali}
                    move-result-object v3
                    check-cast v3, ${color.definingClass}
                    iget-wide v4, v3, ${color.smali}
                    new-instance v3, ${tint.definingClass}
                    invoke-direct { v3, v4, v5 }, ${tint.smali}
                    sget-object v4, ${styleLocal.smali}
                    invoke-virtual { v14, v4 }, ${read.smali}
                    move-result-object v4
                    check-cast v4, ${style.definingClass}
                    iget-object v12, v4, ${gray.smali}
                    const/4 v4, 0x0
                    const/4 v5, 0x0
                    const/4 v7, 0x0
                    const-wide/16 v8, 0x0
                    const/4 v10, 0x0
                    const/4 v11, 0x0
                    const/4 v13, 0x0
                    const/4 v15, 0x0
                    const/16 v16, 0x0
                    const/16 v17, 0x37b0
                    invoke-static/range { v0 .. v17 }, ${row.smali}

                    :end
                    const/4 v0, 0x0
                    invoke-virtual { v14, v0 }, ${endGroup.smali}
                    return-void
                """,
            )
        },
    )

    val statsAt = instructions.indexOfFirst { it.method?.smali == stats.smali }
    val first = (instructions[statsAt] as RegisterRangeInstruction).startRegister
    header.addInstructions(
        statsAt + 1,
        "invoke-static/range { v${first + 3} .. v${first + 4} }, $owner->fakhAge($model$composer)V",
    )
}

/** Whether this is the app's row of an icon and a text: `(Modifier, icon, …, String, …, Composer, Int, Int, Int)`. */
private fun MethodReference.isIconRow(composer: String) =
    types.size == 17 && types[6] == STRING && types[8] == "J" && types[13] == composer

@Suppress("unused")
val showRepositoryAgePatch = patch(
    name = "Show repository age",
    description = "Shows when a repository was created, under its stars and forks.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(SHOW_REPOSITORY_AGE)
        var model: String? = null
        val queries = mutableListOf<Pair<String, String>>()
        val parsers = mutableListOf<String>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val read = method.instructions.mapNotNull { it.string }
                if (read.any { DETAILS in it }) queries += classDef.type to method.name
                if (method.name == "toString" && "Repository(name=" in read && ", forkCount=" in read) {
                    model = classDef.type
                }
                // The fragment's parser lists its field names; its serializer only writes them.
                if (method.name == "<clinit>" && "contributorsCount" in read && "viewerBlockedByOwner" in read &&
                    classDef.methods.any { other -> other.instructions.any { it.selectsName } }
                ) {
                    parsers += classDef.type
                }
            }
        }
        val repository = model ?: throw PatchException("Repository model not found")
        if (queries.isEmpty() || queries.size != parsers.size) {
            throw PatchException("Repository queries and parsers do not match: $queries, $parsers")
        }

        var stats: Method? = null
        val headers = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val types = method.parameterTypes.map(CharSequence::toString)
                if (AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && types.size == 6 &&
                    types[3] == repository && types[1] == types[2] && types[5] == "I"
                ) {
                    if (stats != null) throw PatchException("More than one stars and forks composable")
                    stats = method
                }
            }
        }
        val statsRow = stats ?: throw PatchException("Stars and forks composable not found")
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val calls = method.instructions.mapNotNull { it.method }
                if (calls.any { it.smali == statsRow.smali } && calls.any { it.isIconRow(statsRow.types[4]) }) {
                    headers += classDef.type to method.name
                }
            }
        }
        val (headerType, headerName) = headers.singleOrNull()
            ?: throw PatchException("Repository header not found: $headers")

        addAgeRow(
            mutableClassDefBy(headerType).methods.first { method ->
                method.name == headerName && method.instructions.any { it.method?.smali == statsRow.smali }
            },
            statsRow,
        )
        queries.forEach { (type, name) ->
            mutableClassDefBy(type).methods.filter { it.name == name }.forEach {
                it.addToQuery(DETAILS, "fakhKey: id createdAt")
            }
        }
        parsers.forEach { readAddedFields(it, AGE, "id", "created") }
    }
}
