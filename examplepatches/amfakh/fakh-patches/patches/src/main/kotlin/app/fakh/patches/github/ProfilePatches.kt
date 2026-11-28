/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.fakh.patches.github.shared.Constants.SHOW_FOLLOWS_YOU
import app.fakh.patches.github.shared.Constants.LINKIFY_LOCATION
import app.fakh.patches.shared.register
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val PROFILE_EXTRAS = "Lapp/fakh/extension/github/ProfileExtras;"

private const val LOCATION_CLICK = "Lapp/fakh/extension/github/FakhLocationClick;"

private const val STRING = "Ljava/lang/String;"

private const val OBJECT = "Ljava/lang/Object;"

private const val FOLLOWS_FIELD = "fakhFollowsYou"

/** Finds the profile header composable (`bzo.j`) and its icon+text row helper (`bzo.i`). */
private fun findProfileComposables(headerItem: String): Pair<Method, Method> {
    var header: Method? = null
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            val types = method.types
            if (AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                types.size == 15 && types[0] == headerItem && types[13] == "I" && types[14] == "I"
            ) {
                header = method
            }
        }
    }
    val headerMethod = header ?: throw PatchException("Profile header composable not found")
    val composer = headerMethod.types[12]
    val rowMethod = classDefByOrNull(headerMethod.definingClass)?.methods?.singleOrNull { method ->
        val types = method.types
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && types.size == 8 &&
            types[1] == "I" && types[2] == STRING && types[3] == STRING &&
            types[5] == composer && types[6] == "I" && types[7] == "I"
    } ?: throw PatchException("Profile icon row composable not found")
    return headerMethod to rowMethod
}

/** Extracts a boolean field read right after [label] in [cls]'s `toString` method. */
private fun booleanFieldAfter(cls: ClassDef, label: String): FieldReference {
    val toString = cls.methods.single { it.name == "toString" }.instructions
    val at = toString.indexOfFirst { it.string == label }
    if (at < 0) throw PatchException("Field label $label not found in ${cls.type}")
    return toString.drop(at).firstNotNullOfOrNull {
        it.field?.takeIf { f -> it.opcode == Opcode.IGET_BOOLEAN && f.definingClass == cls.type }
    } ?: throw PatchException("Boolean field after $label not found in ${cls.type}")
}

@Suppress("unused")
val showFollowsYouPatch = patch(
    name = "Show if a profile follows you",
    description = "Shows on user profiles when that user follows you.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(SHOW_FOLLOWS_YOU)

        var userClass: ClassDef? = null
        var headerClass: ClassDef? = null
        classDefForEach { classDef ->
            classDef.methods.filter { it.name == "toString" }.forEach { method ->
                val read = method.instructions.mapNotNull { it.string }
                if ("UserOrOrganization(id=" in read) userClass = classDef
                if ("ProfileHeaderItem(avatar=" in read) headerClass = classDef
            }
        }
        val user = userClass ?: throw PatchException("UserOrOrganization model not found")
        val headerItem = headerClass ?: throw PatchException("ProfileHeaderItem model not found")

        // Add `fakhFollowsYou` field and single-arg helpers to avoid register-number limits in `hw`.
        val mutableHeader = mutableClassDefBy(headerItem.type)
        mutableHeader.instanceFields.add(
            ImmutableField(headerItem.type, FOLLOWS_FIELD, "Z", AccessFlags.PUBLIC.value, null, null, null).toMutable(),
        )
        val mutableUser = mutableClassDefBy(user.type)
        mutableUser.staticFields.add(
            ImmutableField(user.type, "fakhLastFollows", "Z", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, null).toMutable(),
        )
        mutableUser.methods.add(
            ImmutableMethod(
                user.type,
                "fakhCapture",
                listOf(ImmutableMethodParameter(user.type, null, null)),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(2),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        invoke-static { p0 }, $PROFILE_EXTRAS->isFollowingViewer($OBJECT)Z
                        move-result v0
                        sput-boolean v0, ${user.type}->fakhLastFollows:Z
                        return-void
                    """,
                )
            },
        )
        mutableHeader.methods.add(
            ImmutableMethod(
                headerItem.type,
                "fakhApplyFollows",
                listOf(ImmutableMethodParameter(headerItem.type, null, null)),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(2),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        sget-boolean v0, ${user.type}->fakhLastFollows:Z
                        iput-boolean v0, p0, ${headerItem.type}->$FOLLOWS_FIELD:Z
                        return-void
                    """,
                )
            },
        )

        // Hook every ProfileHeaderItem constructor call in methods that read UserOrOrganization.
        val builders = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val body = method.instructions
                if (body.any { it.method?.let { m -> m.definingClass == headerItem.type && m.name == "<init>" } == true } &&
                    body.any { it.field?.definingClass == user.type }
                ) {
                    builders += classDef.type to method.name + method.parameterTypes.joinToString("")
                }
            }
        }
        if (builders.isEmpty()) throw PatchException("ProfileHeaderItem builder not found")
        var hookedBuilders = 0
        builders.forEach { (type, sig) ->
            val method = mutableClassDefBy(type).methods.first { it.name + it.parameterTypes.joinToString("") == sig }
            val body = method.instructions
            val inits = body.indices.filter {
                body[it].method?.let { m -> m.definingClass == headerItem.type && m.name == "<init>" } == true
            }
            inits.asReversed().forEach { initAt ->
                val userReadAt = (0 until initAt).lastOrNull { i ->
                    val ins = body[i]
                    (ins.opcode == Opcode.IGET_OBJECT || ins.opcode == Opcode.IGET_BOOLEAN || ins.opcode == Opcode.IGET) &&
                        ins.field?.definingClass == user.type
                } ?: return@forEach
                val userReg = (body[userReadAt] as TwoRegisterInstruction).registerB
                val builtReg = when (val instr = body[initAt]) {
                    is RegisterRangeInstruction -> instr.startRegister
                    is FiveRegisterInstruction -> instr.registerC
                    else -> return@forEach
                }
                method.addInstructions(
                    initAt + 1,
                    "invoke-static/range { v$builtReg .. v$builtReg }, ${headerItem.type}->fakhApplyFollows(${headerItem.type})V",
                )
                method.addInstructions(
                    userReadAt,
                    "invoke-static/range { v$userReg .. v$userReg }, ${user.type}->fakhCapture(${user.type})V",
                )
                hookedBuilders++
            }
        }
        if (hookedBuilders == 0) throw PatchException("No ProfileHeaderItem constructions hooked")

        val (headerRef, rowRef) = findProfileComposables(headerItem.type)
        val composer = headerRef.types[12]
        val owner = mutableClassDefBy(headerRef.definingClass)
        val headerMethod = owner.methods.first {
            it.name == headerRef.name && it.parameterTypes == headerRef.parameterTypes
        }
        val body = headerMethod.instructions
        val startGroup = body.mapNotNull { it.method }.firstOrNull {
            it.definingClass == composer && it.types == listOf("I") && it.returnType == "V"
        } ?: throw PatchException("Profile header: startGroup not found")
        val endGroup = body.mapNotNull { it.method }.firstOrNull {
            it.definingClass == composer && it.types == listOf("Z") && it.returnType == "V"
        } ?: throw PatchException("Profile header: endGroup not found")

        // Find the followers/following count row call: static void in bzo taking (gpl, m9i, m9i, composer, int).
        val followersAt = body.indices.firstOrNull { i ->
            val m = body[i].method ?: return@firstOrNull false
            m.definingClass == headerRef.definingClass && m.returnType == "V" &&
                m.types.size == 5 && m.types[0] == headerItem.type && m.types[3] == composer && m.types[4] == "I"
        } ?: throw PatchException("Profile followers row call not found")

        owner.methods.add(
            ImmutableMethod(
                owner.type,
                "fakhFollowsYou",
                listOf(
                    ImmutableMethodParameter(headerItem.type, null, null),
                    ImmutableMethodParameter(composer, null, null),
                ),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(10),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    """
                        const v0, 0x66616b66
                        invoke-virtual { p1, v0 }, ${startGroup.smali}
                        iget-boolean v0, p0, ${headerItem.type}->$FOLLOWS_FIELD:Z
                        if-eqz v0, :end
                        invoke-static {}, $PROFILE_EXTRAS->followsYouEnabled()Z
                        move-result v0
                        if-eqz v0, :end

                        const/4 v0, 0x0
                        invoke-static {}, $PROFILE_EXTRAS->followsYouIcon()I
                        move-result v1
                        invoke-static {}, $PROFILE_EXTRAS->followsYouText()$STRING
                        move-result-object v2
                        const/4 v3, 0x0
                        const/4 v4, 0x0
                        move-object/from16 v5, p1
                        const/4 v6, 0x0
                        const/16 v7, 0x19
                        invoke-static/range { v0 .. v7 }, ${rowRef.smali}

                        :end
                        const/4 v0, 0x0
                        invoke-virtual { p1, v0 }, ${endGroup.smali}
                        return-void
                    """,
                )
            },
        )

        val followersInstr = body[followersAt]
        val (itemReg, composerReg) = when (followersInstr) {
            is FiveRegisterInstruction -> followersInstr.registerC to followersInstr.registerF
            is RegisterRangeInstruction -> followersInstr.startRegister to (followersInstr.startRegister + 3)
            else -> throw PatchException("Unexpected followers row call format")
        }
        // A plain invoke takes registers up to 15 only.
        if (itemReg > 15 || composerReg > 15) {
            throw PatchException("Followers row registers out of range: $itemReg, $composerReg")
        }
        headerMethod.addInstructions(
            followersAt + 1,
            "invoke-static { v$itemReg, v$composerReg }, ${owner.type}->fakhFollowsYou(${headerItem.type}$composer)V",
        )
    }
}

@Suppress("unused")
val linkifyLocationPatch = patch(
    name = "Linkify user location",
    description = "Makes the location on a user profile open in Maps when tapped.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(LINKIFY_LOCATION)

        var headerItemType: String? = null
        classDefForEach { classDef ->
            if (classDef.methods.any { m -> m.name == "toString" && m.instructions.any { it.string == "ProfileHeaderItem(avatar=" } }) {
                headerItemType = classDef.type
            }
        }
        val headerItem = headerItemType ?: throw PatchException("ProfileHeaderItem not found")
        val (headerRef, rowRef) = findProfileComposables(headerItem)
        val modifier = rowRef.types[0]
        val textStyle = rowRef.types[4]
        val composer = rowRef.types[5]

        // Borrow clickable (`pta.m`), Modifier.Companion, TextStyle.copy, typography, colors, and Function0 from `bzo.j`.
        val headerBody = headerRef.instructions
        val clickable = headerBody.mapNotNull { it.method }.firstOrNull {
            it.returnType == modifier && it.types.size == 6 &&
                it.types[0] == modifier && it.types[1] == "Z" && it.types[2] == STRING && it.types[5] == "I"
        } ?: throw PatchException("Compose clickable helper not found in profile header")
        val function0 = clickable.types[4]
        val fn0Method = classDefByOrNull(function0)?.methods?.singleOrNull {
            it.types.isEmpty() && it.returnType == OBJECT
        } ?: throw PatchException("Function0 invoke method not found in $function0")

        // Grab the X/Twitter link's TextStyle.copy call (right after clickable) to get typography & primary text color.
        val clickAt = headerBody.indexOfFirst { it.method == clickable }
        val afterClick = headerBody.drop(clickAt)
        val copyAt = afterClick.indexOfFirst {
            val m = it.method ?: return@indexOfFirst false
            m.definingClass == textStyle && m.returnType == textStyle && m.types.size >= 12 && m.types[1] == "J"
        }
        if (copyAt < 0) throw PatchException("Link TextStyle.copy not found in profile header")
        val styleCopy = afterClick[copyAt].method!!
        val beforeCopy = afterClick.take(copyAt)
        val consume = beforeCopy.last { it.method?.definingClass == composer && it.method?.types?.size == 1 }.method!!
        val colorField = beforeCopy.last { it.opcode == Opcode.IGET_WIDE && it.field?.type == "J" }.field!!
        val colorLocal = beforeCopy.take(beforeCopy.indexOfLast { it.field == colorField })
            .last { it.opcode == Opcode.SGET_OBJECT }.field!!
        val typoField = beforeCopy.last { it.opcode == Opcode.IGET_OBJECT && it.field?.type == textStyle }.field!!
        val typoLocal = beforeCopy.take(beforeCopy.indexOfLast { it.field == typoField })
            .last { it.opcode == Opcode.SGET_OBJECT }.field!!
        val companion = headerBody.first {
            it.opcode == Opcode.SGET_OBJECT && it.field?.let { f ->
                f.type == f.definingClass && classDefByOrNull(f.type)?.interfaces?.contains(modifier) == true
            } == true
        }.field!!

        // Wire `FakhLocationClick` to implement `Function0<Object>`.
        val clickInvoke = ImmutableMethod(
            LOCATION_CLICK,
            fn0Method.name,
            emptyList(),
            OBJECT,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    iget-object v0, p0, $LOCATION_CLICK->location:$STRING
                    invoke-static { v0 }, $PROFILE_EXTRAS->openLocation($STRING)V
                    const/4 v0, 0x0
                    return-object v0
                """,
            )
        }
        mutableClassDefBy(LOCATION_CLICK).apply {
            interfaces.add(function0)
            methods.add(clickInvoke)
        }

        // Find the single call to `bzo.i` outside `bzo` that uses default mask 17 (the location row in `pd1`).
        var locationTarget: Triple<String, String, Int>? = null
        classDefForEach { classDef ->
            if (classDef.type == rowRef.definingClass) return@classDefForEach
            classDef.methods.forEach { method ->
                val body = method.instructions
                body.indices.forEach { i ->
                    if (body[i].method?.smali != rowRef.smali) return@forEach
                    val maskLoaded = body.subList(maxOf(0, i - 6), i).any {
                        (it as? NarrowLiteralInstruction)?.narrowLiteral == 17
                    }
                    if (maskLoaded) {
                        if (locationTarget != null) throw PatchException("More than one profile location row found")
                        locationTarget = Triple(classDef.type, method.name + method.parameterTypes.joinToString(""), i)
                    }
                }
            }
        }
        val (ownerType, sig, callAt) = locationTarget ?: throw PatchException("Profile location row not found")
        val owner = mutableClassDefBy(ownerType)
        val method = owner.methods.first { it.name + it.parameterTypes.joinToString("") == sig }

        owner.methods.add(
            ImmutableMethod(
                ownerType,
                "fakhLocation",
                listOf(
                    ImmutableMethodParameter("I", null, null),
                    ImmutableMethodParameter(STRING, null, null),
                    ImmutableMethodParameter(STRING, null, null),
                    // The row's text style, which the call leaves empty; it only keeps the arguments in one range.
                    ImmutableMethodParameter(textStyle, null, null),
                    ImmutableMethodParameter(composer, null, null),
                ),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(24),
            ).toMutable().apply {
                // p0 = iconId, p1 = location, p2 = contentDesc, p4 = composer
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {}, $PROFILE_EXTRAS->linkifyLocationEnabled()Z
                        move-result v0
                        if-eqz v0, :plain

                        new-instance v4, $LOCATION_CLICK
                        move-object/from16 v5, p1
                        invoke-direct { v4, v5 }, $LOCATION_CLICK-><init>($STRING)V
                        sget-object v0, ${companion.smali}
                        const/4 v1, 0x0
                        const/4 v2, 0x0
                        const/4 v3, 0x0
                        const/16 v5, 0xf
                        invoke-static/range { v0 .. v5 }, ${clickable.smali}
                        move-result-object v17

                        sget-object v0, ${typoLocal.smali}
                        move-object/from16 v2, p4
                        invoke-virtual { v2, v0 }, ${consume.smali}
                        move-result-object v0
                        check-cast v0, ${typoField.definingClass}
                        iget-object v0, v0, ${typoField.smali}

                        sget-object v1, ${colorLocal.smali}
                        invoke-virtual { v2, v1 }, ${consume.smali}
                        move-result-object v1
                        check-cast v1, ${colorField.definingClass}
                        iget-wide v1, v1, ${colorField.smali}

                        const-wide/16 v3, 0x0
                        const/4 v5, 0x0
                        const/4 v6, 0x0
                        const/4 v7, 0x0
                        const-wide/16 v8, 0x0
                        const/4 v10, 0x0
                        const-wide/16 v11, 0x0
                        const/4 v13, 0x0
                        const/4 v14, 0x0
                        const v15, 0xfffffe
                        invoke-static/range { v0 .. v15 }, ${styleCopy.smali}
                        move-result-object v4

                        move-object/from16 v0, v17
                        move/from16 v1, p0
                        move-object/from16 v2, p1
                        move-object/from16 v3, p2
                        move-object/from16 v5, p4
                        const/4 v6, 0x0
                        const/4 v7, 0x0
                        invoke-static/range { v0 .. v7 }, ${rowRef.smali}
                        return-void

                        :plain
                        const/4 v0, 0x0
                        move/from16 v1, p0
                        move-object/from16 v2, p1
                        move-object/from16 v3, p2
                        const/4 v4, 0x0
                        move-object/from16 v5, p4
                        const/4 v6, 0x0
                        const/16 v7, 0x11
                        invoke-static/range { v0 .. v7 }, ${rowRef.smali}
                        return-void
                    """,
                )
            },
        )

        // The range holds the modifier, icon, location, description, text style and composer; the helper takes all but
        // the first, so no register changes.
        val base = (method.instructions[callAt] as RegisterRangeInstruction).startRegister
        method.replaceInstruction(
            callAt,
            "invoke-static/range { v${base + 1} .. v${base + 5} }, " +
                "$ownerType->fakhLocation(I$STRING$STRING$textStyle$composer)V",
        )
    }
}
