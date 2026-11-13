/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.misc.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinedrama.misc.extension.sharedExtensionPatch
import app.morphe.patches.pinedrama.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.pinedrama.misc.settings.configurableBytecodePatch as bytecodePatch
import app.morphe.patches.pinedrama.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstruction
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH_NAME = "Open on Home"
private const val EXTENSION = "Lapp/morphe/extension/pinedrama/navigation/OpenOnHome;"

/** The landing tab enum's constants, by the names its class init gives them. */
internal val LANDING_TABS = listOf("DRAMA_TAB", "FYP_TAB", "DISCOVER_TAB")

/**
 * The check beside PineDrama's landing tab readers: whether this install came from a build before
 * the landing rules, kept under "is_default_landing_old_user". A new install answers no, and then
 * spends its first two days on Discover. X/04zn.LIZJ on 47.7.3, static with no parameters.
 */
internal object LandingTabOldUserFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("is_default_landing_old_user"),
)

/** PineDrama's landing tab enum: an enum whose class init names Drama, For You and Discover. */
internal fun ClassDef.isLandingTabEnum(): Boolean =
    superclass == "Ljava/lang/Enum;" &&
        methods.firstOrNull { it.name == "<clinit>" }?.implementation?.instructions
            ?.mapNotNull { it.getReference<StringReference>()?.string }
            ?.containsAll(LANDING_TABS) == true

/**
 * The override reader, X/04zn.LIZ on 47.7.3: static, no parameters, returns [tabType], and reads
 * its class's override field of that type before asking [isLandingTabDefault]. PineDrama only ever
 * sets the override to Drama, once the new user flow is done.
 */
internal fun Method.isLandingTabReader(tabType: String): Boolean =
    isStaticTabGetter(tabType) && firstFieldRead()?.type == tabType

/**
 * The default landing tab, X/04zn.LIZIZ on 47.7.3: the same shape, but it reads its class's lazy
 * holder first and answers the holder's value. Every Discover answer comes from here, and most of a
 * start's rules ask it straight, the Discover rule and the top tab reorder among them.
 */
internal fun Method.isLandingTabDefault(tabType: String): Boolean =
    isStaticTabGetter(tabType) && firstFieldRead()?.let { it.definingClass == definingClass && it.type != tabType } == true

private fun Method.isStaticTabGetter(tabType: String) =
    accessFlags and AccessFlags.STATIC.value != 0 && parameterTypes.isEmpty() && returnType == tabType

private fun Method.firstFieldRead(): FieldReference? =
    implementation?.instructions?.firstOrNull()?.takeIf { it.opcode == Opcode.SGET_OBJECT }?.getReference<FieldReference>()

/** The object types this class's static methods with no parameters return, the landing tab among them. */
internal fun ClassDef.staticReturnTypes(): Set<String> =
    methods.filter { it.accessFlags and AccessFlags.STATIC.value != 0 && it.parameterTypes.isEmpty() }
        .map { it.returnType }.filter { it.startsWith("L") }.toSet()

@Suppress("unused")
val openOnHomePatch = bytecodePatch(
    name = "Open on Home",
    description = "Starts PineDrama on Home every time. PineDrama sometimes starts on Discover " +
        "instead, like in the first days after an install. Starts on. Turn it off in HushPine " +
        "settings > App.",
    default = true,
) {
    category("Settings")
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.pineDrama())

    execute {
        val readerClass = LandingTabOldUserFingerprint.classDef
        val tabType = readerClass.staticReturnTypes()
            .singleOrNull { type -> classDefByOrNull(type)?.isLandingTabEnum() == true }
            ?: throw PatchException("$PATCH_NAME: ${readerClass.type} hands back no single landing tab enum")
        val reader = readerClass.methods.singleOrNull { it.isLandingTabDefault(tabType) }
            ?: throw PatchException("$PATCH_NAME: ${readerClass.type} has no single default $tabType")
        val mutableReader = mutableClassDefBy(readerClass).methods.first {
            it.name == reader.name && it.returnType == tabType && it.parameterTypes.isEmpty()
        }

        val returns = mutableReader.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }
            .map { it.index to (it.value as OneRegisterInstruction).registerA }
        if (returns.isEmpty()) throw PatchException("$PATCH_NAME: ${readerClass.type}->${reader.name} has no return")
        returns.asReversed().forEach { (index, register) ->
            if (register > 15) throw PatchException("$PATCH_NAME: the default returns from v$register")
            mutableReader.addInstructionsAtControlFlowLabel(
                index,
                """
                    invoke-static { v$register }, $EXTENSION->landingTab(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$register
                    check-cast v$register, $tabType
                """,
            )
        }

        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/pinedrama/settings/SettingsStatus;->enableOpenOnHome()V",
        )
    }
}
