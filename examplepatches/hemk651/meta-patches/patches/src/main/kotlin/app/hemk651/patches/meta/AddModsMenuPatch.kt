/*
 * Meta Patches — Add Mods menu.
 *
 * Ported from InstaFL patcher-core "Add Initialize Instafel",
 * "Change Home Long Click" and "Add App Trigger"
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut),
 * rebranded and reworked for the Morphe patcher.
 *
 * InstaFL copies its embedded UI classes into the app and wires them up with
 * separate smali patches. The Morphe port ships the same UI as a merged
 * extension (`extensions/extension.mpe`) and does the wiring at patch time:
 *
 *   - the Application.onCreate of the app shell initializes the extension,
 *   - the home long press listener is replaced so a long press on the feed
 *     opens the Mods quick menu sheet,
 *   - the quick menu "Developer options" entry is filled with the app's own
 *     FragmentNavigator code, recovered from UserDetailFragment,
 *   - the manifest receives the menu activities,
 *   - the "Applied package patches" screen is filled with the patch list.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.patches.meta

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.p0Register
import app.hemk651.patches.shared.MetaCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

private const val EXTENSION_PREFIX = "Lapp/hemk651/meta/extension/"
private const val MODS_INIT_CLASS = "Lapp/hemk651/meta/extension/ModsInit;"
private const val MODS_DEV_HOLDER_CLASS = "Lapp/hemk651/meta/extension/ModsDevHolder;"
private const val MODS_HOME_SHEET_CLASS = "Lapp/hemk651/meta/extension/ModsHomeSheet;"
private const val MODS_HOME_SHEET_HANDLER_CLASS = "Lapp/hemk651/meta/extension/ModsHomeSheetHandler;"
private const val IG_MAIN_ACTIVITY_TYPE = "Lcom/instagram/mainactivity/InstagramMainActivity;"
private const val USER_SESSION_TYPE = "Lcom/instagram/common/session/UserSession;"
private const val QUICK_EXPERIMENT_FRAGMENT_TYPE =
    "Lcom/instagram/debug/quickexperiment/QuickExperimentCategoriesFragment;"
private const val FRAGMENT_ACTIVITY_TYPE = "Landroidx/fragment/app/FragmentActivity;"

/**
 * The theme every menu activity declares.
 *
 * Without it the activities inherit the app's `<application>` theme, which
 * for Instagram is the splash theme chain (`Theme.Instagram.Splash`). Its
 * textAppearance attributes are left unresolved, so the first `TextView` the
 * menu builds throws
 * `UnsupportedOperationException: Failed to resolve attribute at index 7`
 * and the menu crashes at start (reported on device, v1.1.0-dev.9). The
 * framework `Theme.Material.NoActionBar` is self-contained, always resolves
 * and fits the programmatic UI, which paints all of its own colors.
 */
private const val MODS_ACTIVITY_THEME = "@android:style/Theme.Material.NoActionBar"

/**
 * The menu activities that have to be declared in the app manifest.
 */
private val MODS_ACTIVITIES = listOf(
    "app.hemk651.meta.extension.activity.ModsMenuActivity",
    "app.hemk651.meta.extension.activity.ModsAboutActivity",
    "app.hemk651.meta.extension.activity.ModsPatchesInfoActivity",
    "app.hemk651.meta.extension.activity.ModsBuildInfoActivity",
    "app.hemk651.meta.extension.activity.ModsMiscActivity",
    "app.hemk651.meta.extension.activity.ModsLanguageActivity",
    "app.hemk651.meta.extension.activity.ModsImportBackupActivity",
    "app.hemk651.meta.extension.activity.ModsCrashReportsActivity",
    "app.hemk651.meta.extension.activity.ModsCrashViewerActivity"
)

/**
 * The static patch list shown in the menu's "Applied package patches" screen.
 *
 * Like InstaFL, the bundle declares this list itself; the patcher does not
 * expose the applied patch set to a patch.
 */
private val APPLIED_PATCHES = listOf(
    "Remove ads" to "Removes ads in Instagram by stopping the ad pod flow.",
    "Remove snooze warning" to "Removes the \"build expired\" snooze warning dialog that alpha builds show.",
    "Unlock developer options" to "Unlocks the employee options (developer options) menu.",
    "AMOLED theme" to "Forces Instagram dark theme surfaces to pure black (AMOLED).",
    "Change channel name" to "Replaces the release channel name (NONE, ALPHA, BETA, PROD) shown in the developer options UI.",
    "Add Mods menu" to "Adds the Mods menu (home long press) with the ported InstaFL tools."
)

/**
 * Renders a [MethodReference] as a smali reference, e.g.
 * `LX/01Jn;->A0I(Landroidx/fragment/app/Fragment;)V`.
 */
private fun MethodReference.smaliText(): String =
    "$definingClass->${name}(${parameterTypes.joinToString("")})$returnType"

/**
 * The smali text of a string literal with smali escaping applied.
 */
private fun String.smaliLiteral(): String =
    "\"" + replace("\\", "\\\\").replace("\"", "\\\"") + "\""

/**
 * Escapes a string for embedding in the JSON array of applied patches.
 *
 * The descriptions contain literal quotes (e.g. the "build expired" snooze
 * warning), which without escaping break the JSON the menu parses at
 * runtime — every `JSONArray` read then throws and the "Applied package
 * patches" screen shows "Failed to read the applied patches." instead of
 * the patch list (reported on device, v1.1.0-dev.11).
 */
private fun jsonEscape(value: String): String =
    value.replace("\\", "\\\\")
        .replace("\"", "\\\"")
        .replace("\n", "\\n")
        .replace("\r", "\\r")
        .replace("\t", "\\t")

/**
 * Whether the method already references an extension class.
 */
private fun isExtensionReferenced(method: com.android.tools.smali.dexlib2.iface.Method): Boolean =
    method.instructions.any { instruction ->
        when (val reference = (instruction as? ReferenceInstruction)?.reference) {
            is MethodReference -> reference.definingClass.startsWith(EXTENSION_PREFIX)
            is StringReference -> reference.string.contains(EXTENSION_PREFIX)
            else -> false
        }
    }

@Suppress("unused")
val addModsMenuPatch = patch(
    name = "Add Mods menu",
    description = "Adds the Mods menu (fork of the InstaFL menu): long press the home feed to open the quick menu, incl. developer options.",
    default = false
) {
    compatibleWith(MetaCompatibilities.INSTAGRAM)

    extendWith("extensions/extension.mpe")

    execute {
        // ---------------------------------------------------------------
        // Manifest: add the menu activities with a self-contained theme.
        // Existing declarations (a previously patched APK) get the theme
        // updated in place.
        // ---------------------------------------------------------------
        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.elements("application").firstOrNull()
                ?: throw PatchException("Could not find the <application> element in the manifest")

            for (activity in MODS_ACTIVITIES) {
                val declared = application.children("activity")
                    .firstOrNull { it.attribute("android:name") == activity }
                if (declared == null) {
                    application.appendChild("activity") {
                        setAttribute("android:name", activity)
                        setAttribute("android:exported", "false")
                        setAttribute("android:theme", MODS_ACTIVITY_THEME)
                    }
                } else {
                    declared.setAttribute("android:exported", "false")
                    declared.setAttribute("android:theme", MODS_ACTIVITY_THEME)
                }
            }
        }

        // ---------------------------------------------------------------
        // Init: inject the extension initialization right after the
        // Application.onCreate super call of the app shell.
        //
        // InstaFL additionally builds its crash handler inline in smali; the
        // Morphe port installs the crash handler inside `ModsInit.init`, so a
        // single static call using the super call's own register is enough.
        // ---------------------------------------------------------------
        InstagramAppShellOnCreateFingerprint.matchOrNull()?.let { appShellMatch ->
            val method = appShellMatch.method
            // Guard on the ModsInit.init call itself: "Unlock developer
            // options" injects its own MCOverrides call at the same super
            // call site, so a generic "extension referenced" check would
            // skip this injection and leave ModsInit without a context —
            // menu items that need it (e.g. "Open Meta menu") would
            // silently do nothing.
            val alreadyInjected = method.instructions.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                reference is MethodReference && reference.definingClass == MODS_INIT_CLASS
            }
            if (!alreadyInjected) {
                val superCallIndex = appShellMatch.instructionMatches.first().index
                val superCall = method.getInstruction<Instruction>(superCallIndex)
                val contextRegister = when (superCall) {
                    // `invoke-super {v0}` uses the 35c format with the
                    // registers in fixed slots; range invokes use 3rc.
                    is FiveRegisterInstruction -> superCall.registerC
                    is RegisterRangeInstruction -> superCall.startRegister
                    else -> throw PatchException(
                        "Unexpected invoke format of Application.onCreate: ${superCall.opcode}"
                    )
                }

                val invocation = if (contextRegister < 16) {
                    "invoke-static {v$contextRegister}, $MODS_INIT_CLASS->init(Landroid/content/Context;)V"
                } else {
                    "invoke-static/range {v$contextRegister}, $MODS_INIT_CLASS->init(Landroid/content/Context;)V"
                }
                method.addInstruction(superCallIndex + 1, invocation)
            }
        } ?: throw PatchException("InstagramAppShell.onCreate did not match")

        // ---------------------------------------------------------------
        // Home long press: replace the listener body.
        //
        // The original body performs MobileConfig driven feed interactions;
        // InstaFL swaps it for a handler that stores the activity / session
        // and opens the quick menu sheet. The synthetic field names of the
        // class are recovered at patch time, since they are obfuscated and
        // differ between builds.
        // ---------------------------------------------------------------
        val longClickMatch = HomeLongClickFingerprint.matchOrNull()
        if (longClickMatch == null) {
            // The string anchor is gone only if the listener was already
            // replaced; look the class up without the anchor to tell apart
            // "already patched" from "not found".
            val listenerClass = classDefByOrNull { classDef ->
                classDef.interfaces.contains("Landroid/view/View${'$'}OnLongClickListener;") &&
                        classDef.fields.any { it.type == IG_MAIN_ACTIVITY_TYPE } &&
                        classDef.fields.any { it.type == USER_SESSION_TYPE }
            }
            val listenerMethod = listenerClass?.methods?.firstOrNull { it.name == "onLongClick" }
            if (listenerClass == null || listenerMethod == null ||
                !isExtensionReferenced(listenerMethod)
            ) {
                throw PatchException("Home long click listener did not match")
            }
        } else {
            val classDef = longClickMatch.classDef
            val activityField = classDef.fields.first { it.type == IG_MAIN_ACTIVITY_TYPE }.name
            val sessionField = classDef.fields.first { it.type == USER_SESSION_TYPE }.name
            val classType = classDef.type

            val method = longClickMatch.method
            // Like InstaFL's "Change Home Long Click" (`.registers 6`), the
            // replacement body always uses the locals v0-v2 plus the
            // parameters p0/p1. The original body is removed wholesale, so
            // when the original method declared fewer registers, the method
            // is grown to six registers instead of letting the hardcoded
            // locals clobber the parameters (verification failure → crash).
            val registerCount = method.implementation?.registerCount
                ?: throw PatchException("Home long click method has no implementation")
            val (targetMethod, addedInstructions) = if (registerCount < 6) {
                method.addFreeRegisters(6 - registerCount)
            } else {
                method to 0
            }
            // The invoke of the replacement handler is a 35c instruction, so
            // p1 has to stay within the 4-bit register range.
            val p1Reg = targetMethod.implementation!!.registerCount - 1
            if (p1Reg > 15) {
                throw PatchException(
                    "Home long click parameters exceed the 4-bit invoke limit: p1=v$p1Reg"
                )
            }
            targetMethod.removeInstructions(
                addedInstructions,
                targetMethod.instructions.count() - addedInstructions
            )
            targetMethod.addInstructions(
                addedInstructions,
                """
                iget-object v0, p0, $classType->$activityField:$IG_MAIN_ACTIVITY_TYPE
                iget-object v1, p0, $classType->$sessionField:$USER_SESSION_TYPE
                invoke-static {v0, v1}, $MODS_DEV_HOLDER_CLASS->set(Landroid/app/Activity;Ljava/lang/Object;)V
                new-instance v2, $MODS_HOME_SHEET_HANDLER_CLASS
                invoke-direct {v2, v0}, $MODS_HOME_SHEET_HANDLER_CLASS-><init>(Landroid/content/Context;)V
                invoke-interface {v2, p1}, Landroid/view/View${'$'}OnLongClickListener;->onLongClick(Landroid/view/View;)Z
                move-result v0
                return v0
                """.trimIndent()
            )
        }

        // ---------------------------------------------------------------
        // Developer options: fill the quick menu's `openDeveloperOptions`
        // with the app's own fragment navigation code.
        //
        // The navigation internals are recovered the same way InstaFL
        // recovers them: from the UserDetailFragment call site that
        // navigates to a bare `Landroidx/fragment/app/Fragment;`:
        //   - the method call defines the navigator class and its add method,
        //   - the next call on the navigator is its transition method,
        //   - the constructor signature is taken from the `invoke-direct`
        //     that builds the navigator (or from the navigator class itself
        //     as a fallback).
        // ---------------------------------------------------------------
        val navigatorMatch = UserDetailNavigatorFingerprint.matchOrNull()
            ?: throw PatchException("UserDetailFragment navigator call did not match")

        val navigatorCall = navigatorMatch.instructionMatches.first()
        val addMethodReference = navigatorCall.methodReference
        val navigatorType = addMethodReference.definingClass

        val containerInstructions = navigatorMatch.method.instructions.toList()
        val addCallIndex = navigatorCall.index

        // The transition method is the next call on the navigator after the
        // add call.
        val transitionReference = containerInstructions
            .drop(addCallIndex + 1)
            .firstNotNullOfOrNull { instruction ->
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                    ?.takeIf { it.definingClass == navigatorType && it.name != "<init>" }
            }
            ?: throw PatchException("Navigator transition method not found")

        // The constructor signature is taken from the nearest `invoke-direct`
        // that builds the navigator before the add call.
        val constructorParameterTypes =
            containerInstructions.take(addCallIndex).lastOrNull { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference != null &&
                        reference.definingClass == navigatorType &&
                        reference.name == "<init>"
            }
                ?.let { (it as ReferenceInstruction).reference as MethodReference }
                ?.parameterTypes
                ?: classDefByOrNull(navigatorType)?.methods
                    ?.firstOrNull { method ->
                        method.name == "<init>" &&
                                method.parameterTypes.size == 2 &&
                                method.parameterTypes[0] == FRAGMENT_ACTIVITY_TYPE
                    }
                    ?.parameterTypes
                ?: throw PatchException("Navigator constructor not found")

        if (constructorParameterTypes.size != 2 ||
            constructorParameterTypes[0] != FRAGMENT_ACTIVITY_TYPE
        ) {
            throw PatchException(
                "Unsupported navigator constructor: ${constructorParameterTypes.joinToString("")}"
            )
        }
        val sessionType = constructorParameterTypes[1]

        val sheetMatch = ModsHomeSheetOpenDeveloperOptionsFingerprint.matchOrNull()
            ?: throw PatchException("openDeveloperOptions placeholder did not match")

        // Like InstaFL's "Update openDeveloperOptions" (`.registers 7`), the
        // replacement body always uses the locals v0-v3 and dismisses the
        // sheet through p0. The placeholder is an instance method with only
        // p0, so it is grown to seven registers when it was compiled with
        // fewer; the previous version called dismissSheetDialog on the
        // hardcoded v0 — an uninitialized register — which failed ART
        // verification, broke the class load of ModsHomeSheet and crashed
        // the app on a home long press.
        val placeholder = sheetMatch.method
        val placeholderRegisterCount = placeholder.implementation?.registerCount
            ?: throw PatchException("openDeveloperOptions has no implementation")
        val (method, addedInstructions) = if (placeholderRegisterCount < 7) {
            placeholder.addFreeRegisters(7 - placeholderRegisterCount)
        } else {
            placeholder to 0
        }
        // The invokes of the body are 35c instructions, so p0 has to stay
        // within the 4-bit register range.
        val p0Reg = method.implementation!!.registerCount - 1
        if (p0Reg > 15) {
            throw PatchException(
                "openDeveloperOptions p0 exceeds the 4-bit invoke limit: p0=v$p0Reg"
            )
        }
        method.removeInstructions(
            addedInstructions,
            method.instructions.count() - addedInstructions
        )
        method.addInstructions(
            addedInstructions,
            """
            invoke-static {}, $MODS_DEV_HOLDER_CLASS->getActivity()Landroid/app/Activity;
            move-result-object v0
            invoke-static {}, $MODS_DEV_HOLDER_CLASS->getSession()Ljava/lang/Object;
            move-result-object v1
            check-cast v0, $FRAGMENT_ACTIVITY_TYPE
            check-cast v1, $sessionType
            new-instance v2, $QUICK_EXPERIMENT_FRAGMENT_TYPE
            invoke-direct {v2}, $QUICK_EXPERIMENT_FRAGMENT_TYPE-><init>()V
            new-instance v3, $navigatorType
            invoke-direct {v3, v0, v1}, ${navigatorType}-><init>(${constructorParameterTypes.joinToString("")})V
            invoke-virtual {v3, v2}, ${addMethodReference.smaliText()}
            invoke-virtual {v3}, ${transitionReference.smaliText()}
            invoke-virtual {p0}, $MODS_HOME_SHEET_CLASS->dismissSheetDialog()V
            return-void
            """.trimIndent()
        )

        // ---------------------------------------------------------------
        // Applied patches: fill the static patch list of the "Applied
        // package patches" screen by replacing the placeholder value of
        // `appliedPatchesJson`.
        //
        // d8 encodes a constant initializer in the dex `static_values` of the
        // field (the `<clinit>` stays empty), so the field's initial value is
        // replaced when present; otherwise the `const-string` that feeds the
        // `sput-object` of `<clinit>` is replaced.
        // ---------------------------------------------------------------
        val infoMatch = ModsPatchesInfoClassFingerprint.matchOrNull()
            ?: throw PatchException("ModsPatchesInfoActivity did not match")

        val infoClass = infoMatch.classDef
        val jsonField = infoClass.fields.firstOrNull { it.name == "appliedPatchesJson" }
            ?: throw PatchException("appliedPatchesJson field not found")

        val patchesJson = "[" + APPLIED_PATCHES.joinToString(",") { (name, description) ->
            """{"name":"${jsonEscape(name)}","description":"${jsonEscape(description)}"}"""
        } + "]"

        when (val initialValue = jsonField.initialValue) {
            is MutableStringEncodedValue -> initialValue.setValue(patchesJson)
            is StringEncodedValue -> jsonField.setInitialValue(
                MutableStringEncodedValue(initialValue).apply { setValue(patchesJson) }
            )
            else -> replaceClinitPlaceholder(infoClass, patchesJson)
        }
    }
}

/**
 * Replaces the `const-string` placeholder that feeds the `sput-object` of
 * `appliedPatchesJson` in `<clinit>`, for dex files where the static value is
 * not encoded in the field's initial value.
 */
private fun replaceClinitPlaceholder(
    infoClass: app.morphe.patcher.util.proxy.mutableTypes.MutableClass,
    patchesJson: String
) {
    val clinitMethod = infoClass.methods.firstOrNull { it.name == "<clinit>" }
        ?: throw PatchException("appliedPatchesJson placeholder not found")

    val infoClassType = "Lapp/hemk651/meta/extension/activity/ModsPatchesInfoActivity;"
    val sputIndex = clinitMethod.instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.SPUT_OBJECT && run {
            val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            reference?.definingClass == infoClassType &&
                    reference.name == "appliedPatchesJson" &&
                    reference.type == "Ljava/lang/String;"
        }
    }
    if (sputIndex < 1) {
        throw PatchException("appliedPatchesJson placeholder not found")
    }

    val constInstruction = clinitMethod.getInstruction<OneRegisterInstruction>(sputIndex - 1)
    if (constInstruction.opcode != Opcode.CONST_STRING &&
        constInstruction.opcode != Opcode.CONST_STRING_JUMBO
    ) {
        throw PatchException("appliedPatchesJson placeholder not found")
    }

    clinitMethod.replaceInstruction(
        sputIndex - 1,
        "const-string v${constInstruction.registerA}, ${patchesJson.smaliLiteral()}"
    )
}
