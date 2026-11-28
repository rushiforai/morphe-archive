/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.fakh.patches.github.shared.Constants.HOME_HEADER_TEXT
import app.fakh.patches.shared.register
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val HOME_FRAGMENT = "Lcom/github/android/home/HomeFragment;"

private const val HOME_HEADER_TEXT_CLASS = "Lapp/fakh/extension/github/HomeHeaderText;"

private const val STRING = "Ljava/lang/String;"

@Suppress("unused")
val homeHeaderTextPatch = patch(
    name = "Home header text",
    description = "Shows your username or display name in the Home header instead of Home.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(HOME_HEADER_TEXT)

        val homeClass = mutableClassDefBy(HOME_FRAGMENT)

        // The account class is the one made from its preferences and its id. HomeFragment has a getter of an account
        // holder, whose getter returns the account.
        fun isAccount(type: String) = classDefByOrNull(type)?.methods?.any {
            it.name == "<init>" && it.types == listOf("Landroid/content/SharedPreferences;", STRING)
        } == true
        val (holderGetter, accountGetter) = homeClass.methods
            .filter { it.types.isEmpty() && it.returnType.startsWith("L") }
            .mapNotNull { getter ->
                classDefByOrNull(getter.returnType)?.methods
                    ?.singleOrNull { it.types.isEmpty() && isAccount(it.returnType) }
                    ?.let { getter to it }
            }
            .singleOrNull() ?: throw PatchException("HomeFragment account getters not found")
        val accountClass = classDefByOrNull(accountGetter.returnType)!!

        // On Account (`com.github.account.b`), login (`e`) is the last String field written by `<init>`,
        // and display name (`d()`) is the 0-arg String method reading property index 0 (`r[0]`).
        val loginField = accountClass.methods.single { it.name == "<init>" }.instructions
            .filter { it.opcode == Opcode.IPUT_OBJECT && it.field?.type == STRING }
            .lastOrNull()?.field ?: throw PatchException("Account login field not found")
        val nameGetter = accountClass.methods.singleOrNull { m ->
            m.types.isEmpty() && m.returnType == STRING &&
                m.instructions.any { it.opcode == Opcode.AGET_OBJECT } &&
                m.instructions.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == 0 }
        } ?: throw PatchException("Account name getter not found")

        homeClass.staticFields.add(
            com.android.tools.smali.dexlib2.immutable.ImmutableField(
                HOME_FRAGMENT,
                "fakhLastHome",
                HOME_FRAGMENT,
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                null,
            ).toMutable(),
        )
        homeClass.methods.add(
            ImmutableMethod(
                HOME_FRAGMENT,
                "fakhCapture",
                listOf(ImmutableMethodParameter(HOME_FRAGMENT, null, null)),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(1),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        sput-object p0, $HOME_FRAGMENT->fakhLastHome:$HOME_FRAGMENT
                        return-void
                    """,
                )
            },
        )
        homeClass.methods.add(
            ImmutableMethod(
                HOME_FRAGMENT,
                "fakhHeaderText",
                listOf(ImmutableMethodParameter(STRING, null, null)),
                STRING,
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(5),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    """
                        sget-object v0, $HOME_FRAGMENT->fakhLastHome:$HOME_FRAGMENT
                        # Dropped once read, so the field does not keep a closed screen in memory.
                        const/4 v1, 0x0
                        sput-object v1, $HOME_FRAGMENT->fakhLastHome:$HOME_FRAGMENT
                        if-eqz v0, :fallback
                        invoke-virtual { v0 }, ${holderGetter.smali}
                        move-result-object v0
                        if-eqz v0, :fallback
                        invoke-virtual { v0 }, ${accountGetter.smali}
                        move-result-object v0
                        if-eqz v0, :fallback
                        iget-object v1, v0, ${loginField.smali}
                        invoke-virtual { v0 }, ${nameGetter.smali}
                        move-result-object v2
                        invoke-static { v1, v2, p0 }, $HOME_HEADER_TEXT_CLASS->headerText($STRING$STRING$STRING)$STRING
                        move-result-object v0
                        return-object v0
                        :fallback
                        return-object p0
                    """,
                )
            },
        )

        // Hook `onViewCreated(View, Bundle)` right after `C2(R.string.home_header_title)`.
        val onViewCreated = homeClass.methods.singleOrNull {
            it.types == listOf("Landroid/view/View;", "Landroid/os/Bundle;") && it.returnType == "V"
        } ?: throw PatchException("HomeFragment.onViewCreated not found")
        val body = onViewCreated.instructions
        val titleAt = body.indices.firstOrNull { i ->
            body[i].method?.let { it.types == listOf("I") && it.returnType == STRING } == true &&
                body.getOrNull(i + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
        } ?: throw PatchException("Home header title lookup not found")
        val titleReg = (body[titleAt + 1] as OneRegisterInstruction).registerA

        onViewCreated.addInstructions(
            titleAt + 2,
            """
                invoke-static/range { p0 .. p0 }, $HOME_FRAGMENT->fakhCapture($HOME_FRAGMENT)V
                invoke-static/range { v$titleReg .. v$titleReg }, $HOME_FRAGMENT->fakhHeaderText($STRING)$STRING
                move-result-object v$titleReg
            """,
        )
    }
}
