package app.aidan.patches.adobescan.auth

import app.aidan.patches.adobescan.shared.COMPATIBILITY_ADOBE_SCAN
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SPLASH_ACTIVITY = "Lcom/adobe/scan/android/SplashActivity;"
private const val SPLASH_ARGS_CLASS = "Lcom/adobe/scan/android/SplashActivity\$a;"
private const val FILE_BROWSER_ACTIVITY = "Lcom/adobe/scan/android/FileBrowserActivity;"
private const val SCAN_TOUR_VIEW_ACTIVITY = "Lcom/adobe/scan/android/ScanTourViewActivity;"
private const val SCAN_APPLICATION = "Lcom/adobe/scan/android/ScanApplication;"
private const val SCAN_APPLICATION_LOGIN_ACTION_TYPE =
    "Lcom/adobe/scan/android/ScanApplication\$LoginActionType;"
private const val SCAN_UTIL_L = "Lcom/adobe/scan/android/util/l;"
private const val CAPTURE_ACTIVITY = "Lcom/adobe/dcmscan/CaptureActivity;"
private const val EXTERNAL_UI = "Lqe/c1;"
private const val ADOBE_AUTH_SIGN_IN_ACTIVITY =
    "Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;"
private const val SV_SERVICE_IMS_LOGIN_ACTIVITY =
    "Lcom/adobe/libs/services/auth/SVServiceIMSLoginActivity;"
private const val SCAN_FILE_MANAGER = "Lcom/adobe/scan/android/file/v0;"
private const val SCAN_FILE_MANAGER_AUTH_LISTENER = "Lcom/adobe/scan/android/file/v0\$d;"
private const val SETTINGS_FRAGMENT = "Ljt/v2;"
private const val WELCOME_DIALOG = "Lzd/e5;"
private const val WELCOME_DIALOG_TYPE = "Lzd/f5;"
private const val SHARE_BOTTOM_SHEET = "Lqt/q2;"
private const val SCAN_UTIL_A = "Lcom/adobe/scan/android/util/a;"
private const val FILE_OPTIONS_MENU_HELPER = "Lqt/u;"
private const val FILE_LIST_TOOLS_HELPER = "Lut/q0;"
private const val FILE_LIST_TOOLS_ACTIONS = "Lut/r0;"
private const val FILE_LIST_TOOLS = "Lut/p0;"
private const val SCAN_FILE = "Lcom/adobe/scan/android/file/m0;"
private const val RES_WAITING_TO_UPLOAD = 0x7f142937
private const val RES_FILE_LIST_MOVE = 0x7f142396

@Suppress("unused")
val removeLoginPatch = bytecodePatch(
    name = "Remove Login",
    description = "Starts Adobe Scan in its existing account-free local workspace and removes account sign-in gates; Adobe cloud features are unavailable.",
    default = true
) {
    category("Security")
    compatibleWith(COMPATIBILITY_ADOBE_SCAN)
    val cleanUpAuthComponents = booleanOption(
        key = "cleanUpAuthComponents",
        default = true,
        title = "Clean Up Auth Components",
        description = "Removes the profile icon and sign-out option from the Settings menu."
    )
    val removeLinkSharing = booleanOption(
        key = "removeLinkSharing",
        default = true,
        title = "Remove Link Sharing",
        description = "Removes cloud link sharing options from the Share sheet, preserving local PDF sharing."
    )
    val removeEditText = booleanOption(
        key = "removeEditText",
        default = true,
        title = "Remove Edit Text",
        description = "Removes the non-functional Edit text option from file option menus and the preview screen."
    )
    val removeMove = booleanOption(
        key = "removeMove",
        default = true,
        title = "Remove Move",
        description = "Removes the non-functional Move file option from file option menus."
    )
    val removeSaveAsWord = booleanOption(
        key = "removeSaveAsWord",
        default = true,
        title = "Remove Save as Word Doc",
        description = "Removes the cloud-dependent Save as Word doc option from scan cards."
    )

    execute {
        patchSplashActivity()
        patchFileBrowserActivity()
        patchScanTourViewActivity()
        patchScanApplication()
        patchCaptureActivity()
        patchUtilL()
        patchAdobeAuthSignInActivity()
        patchSVServiceIMSLoginActivity()
        patchLoggedInWelcomeDialog()
        patchScanFileManager()
        suppressWaitingToUpload()
        if (cleanUpAuthComponents.value != false) {
            cleanUpAuthComponents()
        }
        if (removeLinkSharing.value != false) {
            removeLinkSharing()
        }
        if (removeEditText.value != false) {
            removeEditText()
        }
        if (removeMove.value != false) {
            removeMove()
        }
        if (removeSaveAsWord.value != false) {
            removeSaveAsWord()
        }
    }
}

/**
 * Patches SplashActivity.a0 cold-start navigation to construct the post-splash intent using
 * ScanApplication.f with LoginActionType.SKIP_LOGIN and transition directly to FileBrowserActivity.
 */
private fun BytecodePatchContext.patchSplashActivity() {
    val classDef = classDefByOrNull(SPLASH_ACTIVITY)
        ?: throw PatchException("Class $SPLASH_ACTIVITY not found")
    val mutableClass = mutableClassDefBy(classDef)
    val a0Method = mutableClass.methods.firstOrNull {
        it.name == "a0" && it.returnType == "V" && it.parameterTypes.size == 8 && it.implementation != null
    } ?: throw PatchException("Method a0 not found in $SPLASH_ACTIVITY")

    val implementation = a0Method.implementation
        ?: throw PatchException("Method a0 has no implementation in $SPLASH_ACTIVITY")

    val initIndex = implementation.instructions.indexOfFirst { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        (instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) &&
            ref?.definingClass == SPLASH_ARGS_CLASS && ref.name == "<init>"
    }
    if (initIndex < 0) {
        throw PatchException("SplashActivity.a constructor call not found in $SPLASH_ACTIVITY.a0")
    }

    a0Method.addInstructions(
        initIndex + 1,
        """
            move-object/from16 v5, p0
            sget-object v0, Lcom/adobe/scan/android/ScanApplication;->C:Lcom/adobe/scan/android/ScanApplication;
            const/4 v1, 0x0
            move-object v2, p1
            sget-object v3, Lcom/adobe/scan/android/ScanApplication${'$'}LoginActionType;->LOGIN:Lcom/adobe/scan/android/ScanApplication${'$'}LoginActionType;
            const/4 v4, 0x0
            invoke-virtual {v0, v1, v2, v3, v4}, Lcom/adobe/scan/android/ScanApplication;->f(ZLcom/adobe/scan/android/SplashActivity${'$'}a;Lcom/adobe/scan/android/ScanApplication${'$'}LoginActionType;Lcom/adobe/scan/android/ScanApplication${'$'}LandingScreen;)Landroid/content/Intent;
            move-result-object v0
            invoke-virtual {v5, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
            invoke-virtual {v5}, Landroid/app/Activity;->finish()V
            return-void
        """.trimIndent()
    )
}

/**
 * Patches FileBrowserActivity.onCreate: right after loading SKIP_LOGIN into v11, copies v5 into v11
 * so that `if-eq v5, v11` is always true (jumping over the unauthenticated exit branch to :goto_d)
 * while preserving v5 as LOGIN so downstream logic executes the full file browser initialization (u1).
 */
private fun BytecodePatchContext.patchFileBrowserActivity() {
    val classDef = classDefByOrNull(FILE_BROWSER_ACTIVITY)
        ?: throw PatchException("Class $FILE_BROWSER_ACTIVITY not found")
    val mutableClass = mutableClassDefBy(classDef)
    val onCreateMethod = mutableClass.methods.firstOrNull {
        it.name == "onCreate" && it.returnType == "V" && it.parameterTypes.size == 1 && it.implementation != null
    } ?: throw PatchException("Method onCreate not found in $FILE_BROWSER_ACTIVITY")

    val implementation = onCreateMethod.implementation
        ?: throw PatchException("Method onCreate has no implementation in $FILE_BROWSER_ACTIVITY")

    val skipLoginAnchorIndex = implementation.instructions.indexOfFirst { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.SGET_OBJECT &&
            ref?.definingClass == SCAN_APPLICATION_LOGIN_ACTION_TYPE &&
            ref.name == "SKIP_LOGIN"
    }
    if (skipLoginAnchorIndex < 0) {
        throw PatchException("SKIP_LOGIN check anchor not found in $FILE_BROWSER_ACTIVITY.onCreate")
    }

    onCreateMethod.addInstructions(
        skipLoginAnchorIndex + 1,
        """
            move-object v11, v5
        """.trimIndent()
    )
}

/**
 * Patches ScanTourViewActivity.onCreate to immediately redirect to FileBrowserActivity with
 * LoginActionType.SKIP_LOGIN and finish, preventing tour display if launched directly.
 */
private fun BytecodePatchContext.patchScanTourViewActivity() {
    val classDef = classDefByOrNull(SCAN_TOUR_VIEW_ACTIVITY)
        ?: throw PatchException("Class $SCAN_TOUR_VIEW_ACTIVITY not found")
    val mutableClass = mutableClassDefBy(classDef)
    val onCreateMethod = mutableClass.methods.firstOrNull {
        it.name == "onCreate" && it.returnType == "V" && it.parameterTypes.size == 1 && it.implementation != null
    } ?: throw PatchException("Method onCreate not found in $SCAN_TOUR_VIEW_ACTIVITY")

    onCreateMethod.addInstructions(
        0,
        """
            move-object/from16 v3, p0
            new-instance v0, Landroid/content/Intent;
            const-class v1, Lcom/adobe/scan/android/FileBrowserActivity;
            invoke-direct {v0, v3, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
            const/high16 v1, 0x10000000
            invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;
            sget-object v1, Lcom/adobe/scan/android/ScanApplication${'$'}LoginActionType;->LOGIN:Lcom/adobe/scan/android/ScanApplication${'$'}LoginActionType;
            const-string v2, "loginActionType"
            invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;
            invoke-virtual {v3, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
            invoke-virtual {v3}, Landroid/app/Activity;->finish()V
            return-void
        """.trimIndent()
    )
}

/**
 * Patches ScanApplication:
 * 1. Neutralizes ScanApplication.h to return immediately, preventing tour bounces.
 * 2. Clears ExternalUI (Lqe/c1;->a) in onCreate, neutralizing all in-scanner sign-in cards and banners.
 */
private fun BytecodePatchContext.patchScanApplication() {
    val classDef = classDefByOrNull(SCAN_APPLICATION)
        ?: throw PatchException("Class $SCAN_APPLICATION not found")
    val mutableClass = mutableClassDefBy(classDef)
    val hMethod = mutableClass.methods.firstOrNull {
        it.name == "h" && it.returnType == "V" && it.parameterTypes.size == 1 && it.implementation != null
    } ?: throw PatchException("Method h not found in $SCAN_APPLICATION")

    hMethod.addInstructions(0, "return-void")

    val onCreateMethod = mutableClass.methods.firstOrNull {
        it.name == "onCreate" && it.returnType == "V" && it.parameterTypes.isEmpty() && it.implementation != null
    } ?: throw PatchException("Method onCreate not found in $SCAN_APPLICATION")

    val c1AnchorIndex = onCreateMethod.implementation?.instructions?.indexOfFirst { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.SPUT_OBJECT &&
            ref?.definingClass == EXTERNAL_UI &&
            ref.name == "a"
    } ?: -1
    if (c1AnchorIndex < 0) {
        throw PatchException("Lqe/c1;->a anchor not found in $SCAN_APPLICATION.onCreate")
    }

    onCreateMethod.addInstructions(
        c1AnchorIndex + 1,
        """
            const/4 v0, 0x0
            sput-object v0, $EXTERNAL_UI->a:Lnt/a5;
        """.trimIndent()
    )
}

/**
 * Suppresses the "You're now signed in" cloud-storage notice shown when the local file browser
 * is opened. Other welcome dialog variants remain unchanged.
 */
private fun BytecodePatchContext.patchLoggedInWelcomeDialog() {
    val welcomeDialog = mutableClassDefByOrNull(WELCOME_DIALOG)
        ?: throw PatchException("Welcome dialog class $WELCOME_DIALOG not found")
    val renderMethod = welcomeDialog.methods.singleOrNull {
        it.name == "a" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(
                WELCOME_DIALOG_TYPE,
                "Z",
                "Ljava/util/List;",
                "Lzd/s4;",
                "Lg3/o;",
                "I",
                "I"
            ) &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("Welcome dialog renderer not found")

    renderMethod.addInstructions(
        0,
        """
            sget-object v0, $WELCOME_DIALOG_TYPE->LOGGED_IN_FILE_BROWSER:$WELCOME_DIALOG_TYPE
            move-object/from16 v1, p0
            if-ne v1, v0, :skip_logged_in_welcome_dialog
            return-void
            :skip_logged_in_welcome_dialog
        """.trimIndent()
    )
}

/**
 * Patches CaptureActivity.X2 to force the promptSignIn parameter (p2) to false,
 * ensuring the save workflow proceeds straight to local PDF creation without sign-in dialogs.
 */
private fun BytecodePatchContext.patchCaptureActivity() {
    val classDef = classDefByOrNull(CAPTURE_ACTIVITY)
        ?: throw PatchException("Class $CAPTURE_ACTIVITY not found")
    val mutableClass = mutableClassDefBy(classDef)
    val x2Method = mutableClass.methods.firstOrNull {
        it.name == "X2" && it.returnType == "V" && it.parameterTypes.size == 2 && it.implementation != null
    } ?: throw PatchException("Method X2 not found in $CAPTURE_ACTIVITY")

    x2Method.addInstructions(0, "const/16 p2, 0x0")
}

/**
 * Patches util.l.S0 to return immediately, neutralizing trial-limit or settings triggers
 * that attempt to launch ScanTourViewActivity.
 */
private fun BytecodePatchContext.patchUtilL() {
    val classDef = classDefByOrNull(SCAN_UTIL_L)
        ?: throw PatchException("Class $SCAN_UTIL_L not found")
    val mutableClass = mutableClassDefBy(classDef)
    val s0Method = mutableClass.methods.firstOrNull {
        it.name == "S0" && it.returnType == "V" && it.parameterTypes.size == 1 && it.implementation != null
    } ?: throw PatchException("Method S0 not found in $SCAN_UTIL_L")

    s0Method.addInstructions(0, "return-void")
}

/**
 * Patches AdobeAuthSignInActivity.onCreate to finish immediately, preventing web-based
 * Creative SDK sign-in flows from presenting.
 */
private fun BytecodePatchContext.patchAdobeAuthSignInActivity() {
    val classDef = classDefByOrNull(ADOBE_AUTH_SIGN_IN_ACTIVITY)
        ?: throw PatchException("Class $ADOBE_AUTH_SIGN_IN_ACTIVITY not found")
    val mutableClass = mutableClassDefBy(classDef)
    val onCreateMethod = mutableClass.methods.firstOrNull {
        it.name == "onCreate" && it.returnType == "V" && it.parameterTypes.size == 1 && it.implementation != null
    } ?: throw PatchException("Method onCreate not found in $ADOBE_AUTH_SIGN_IN_ACTIVITY")

    onCreateMethod.addInstructions(
        0,
        """
            invoke-virtual {p0}, Landroid/app/Activity;->finish()V
            return-void
        """.trimIndent()
    )
}

/**
 * Patches SVServiceIMSLoginActivity.onCreate to finish immediately, neutralizing
 * all IMS-derived social login activities (Google, Facebook, Apple, etc.).
 */
private fun BytecodePatchContext.patchSVServiceIMSLoginActivity() {
    val classDef = classDefByOrNull(SV_SERVICE_IMS_LOGIN_ACTIVITY)
        ?: throw PatchException("Class $SV_SERVICE_IMS_LOGIN_ACTIVITY not found")
    val mutableClass = mutableClassDefBy(classDef)
    val onCreateMethod = mutableClass.methods.firstOrNull {
        it.name == "onCreate" && it.returnType == "V" && it.parameterTypes.size == 1 && it.implementation != null
    } ?: throw PatchException("Method onCreate not found in $SV_SERVICE_IMS_LOGIN_ACTIVITY")

    onCreateMethod.addInstructions(
        0,
        """
            invoke-virtual {p0}, Landroid/app/Activity;->finish()V
            return-void
        """.trimIndent()
    )
}

/**
 * Neutralizes ScanFileManager.o and ScanFileManager${'$'}d.a (the logout callback)
 * to prevent wiping local scans when the app detects an unauthenticated account state.
 */
private fun BytecodePatchContext.patchScanFileManager() {
    val managerClassDef = classDefByOrNull(SCAN_FILE_MANAGER)
        ?: throw PatchException("Class $SCAN_FILE_MANAGER not found")
    val managerMutableClass = mutableClassDefBy(managerClassDef)
    val oMethod = managerMutableClass.methods.firstOrNull {
        it.name == "o" && it.returnType == "V" && it.parameterTypes.isEmpty() && it.implementation != null
    } ?: throw PatchException("Method o not found in $SCAN_FILE_MANAGER")

    oMethod.addInstructions(0, "return-void")

    val listenerClassDef = classDefByOrNull(SCAN_FILE_MANAGER_AUTH_LISTENER)
        ?: throw PatchException("Class $SCAN_FILE_MANAGER_AUTH_LISTENER not found")
    val listenerMutableClass = mutableClassDefBy(listenerClassDef)
    val aMethod = listenerMutableClass.methods.firstOrNull {
        it.name == "a" && it.returnType == "V" && it.parameterTypes.isEmpty() && it.implementation != null
    } ?: throw PatchException("Method a not found in $SCAN_FILE_MANAGER_AUTH_LISTENER")

    aMethod.addInstructions(0, "return-void")
}

/**
 * Removes the profile avatar icon, sign-out option, and sign-in option from the Settings menu
 * by setting their visibility to false in SettingsFragment.E after preferences are loaded.
 */
private fun BytecodePatchContext.cleanUpAuthComponents() {
    val settingsFragment = mutableClassDefByOrNull(SETTINGS_FRAGMENT)
        ?: throw PatchException("SettingsFragment not found")
    val preferenceLoader = settingsFragment.methods.singleOrNull {
        it.name == "E" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("SettingsFragment preference loader not found")
    val instructions = preferenceLoader.implementation?.instructions
        ?: throw PatchException("SettingsFragment preference loader has no implementation")
    val loadIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            reference?.definingClass == "Landroidx/preference/b;" &&
            reference.name == "F" &&
            reference.parameterTypes.map(CharSequence::toString) == listOf("I", "Ljava/lang/String;") &&
            reference.returnType == "V"
    }
    if (loadIndex < 0) {
        throw PatchException("SettingsFragment XML loader invocation not found")
    }

    preferenceLoader.addInstructions(
        loadIndex + 1,
        """
        const v0, 0x7f141f77
        invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;
        move-result-object v0
        invoke-virtual {p0, v0}, Landroidx/preference/b;->o(Ljava/lang/String;)Landroidx/preference/Preference;
        const/4 v1, 0x0
        invoke-virtual {v0, v1}, Landroidx/preference/Preference;->C(Z)V
        const v0, 0x7f141f75
        invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;
        move-result-object v0
        invoke-virtual {p0, v0}, Landroidx/preference/b;->o(Ljava/lang/String;)Landroidx/preference/Preference;
        move-result-object v0
        invoke-virtual {v0, v1}, Landroidx/preference/Preference;->C(Z)V
        const v0, 0x7f141f74
        invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;
        move-result-object v0
        invoke-virtual {p0, v0}, Landroidx/preference/b;->o(Ljava/lang/String;)Landroidx/preference/Preference;
        move-result-object v0
        invoke-virtual {v0, v1}, Landroidx/preference/Preference;->C(Z)V
        """.trimIndent()
    )
}

/**
 * Removes cloud link sharing options from the Share bottom sheet, leaving only local PDF sharing.
 */
private fun BytecodePatchContext.removeLinkSharing() {
    val shareSheetClass = mutableClassDefByOrNull(SHARE_BOTTOM_SHEET)
        ?: throw PatchException("Share bottom sheet class $SHARE_BOTTOM_SHEET not found")

    // Neutralize q2.h(d3, q1, composer, i) by returning early
    val hMethod = shareSheetClass.methods.firstOrNull {
        it.name == "h" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lqt/d3;", "Lqt/q1;", "Lg3/o;", "I") &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("Share link composable method h not found in $SHARE_BOTTOM_SHEET")
    hMethod.addInstructions(0, "return-void")

    // In q2.e, replace calls to h (link sharing) and d (divider) with nop
    val eMethod = shareSheetClass.methods.firstOrNull {
        it.name == "e" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lqt/d3;", "Lqt/q1;", "Lg3/o;", "I") &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("Share bottom sheet composable method e not found in $SHARE_BOTTOM_SHEET")

    val eInstructions = eMethod.implementation?.instructions
        ?: throw PatchException("Method e has no implementation in $SHARE_BOTTOM_SHEET")

    val hCallIndex = eInstructions.indexOfFirst { inst ->
        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
        inst.opcode == Opcode.INVOKE_STATIC &&
            ref?.definingClass == SHARE_BOTTOM_SHEET &&
            ref.name == "h"
    }
    if (hCallIndex >= 0) {
        eMethod.replaceInstruction(hCallIndex, "nop")
    }

    val dCallIndex = eInstructions.indexOfFirst { inst ->
        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
        inst.opcode == Opcode.INVOKE_STATIC &&
            ref?.definingClass == SHARE_BOTTOM_SHEET &&
            ref.name == "d"
    }
    if (dCallIndex >= 0) {
        eMethod.replaceInstruction(dCallIndex, "nop")
    }
}

/**
 * Removes non-functional Edit text from File Options bottom sheets, Preview bottom toolbar,
 * and Recent scan cards by disabling the global edit text availability predicate.
 */
private fun BytecodePatchContext.removeEditText() {
    val utilAClass = mutableClassDefByOrNull(SCAN_UTIL_A)
        ?: throw PatchException("Util class $SCAN_UTIL_A not found")
    val jMethod = utilAClass.methods.singleOrNull {
        it.name == "j" &&
            it.parameterTypes.isEmpty() &&
            it.returnType == "Z" &&
            it.implementation != null
    } ?: throw PatchException("Util method j not found in $SCAN_UTIL_A")

    jMethod.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
}

/**
 * Removes the Move file option from File Options bottom sheets across all surfaces.
 */
private fun BytecodePatchContext.removeMove() {
    val fileOptionsClass = mutableClassDefByOrNull(FILE_OPTIONS_MENU_HELPER)
        ?: throw PatchException("FileOptionsMenuBottomSheet class $FILE_OPTIONS_MENU_HELPER not found")
    val optionsMethod = fileOptionsClass.methods.singleOrNull {
        it.name == "a" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lqt/a;", "Lfu/b;", "Ljava/util/List;") &&
            it.returnType == "Lm90/b;" &&
            it.implementation != null
    } ?: throw PatchException("FileOptionsMenuBottomSheet options method not found")

    val instructions = optionsMethod.implementation?.instructions
        ?: throw PatchException("FileOptionsMenuBottomSheet options method has no implementation")

    val moveIndices = instructions.mapIndexedNotNull { idx, inst ->
        if (inst is NarrowLiteralInstruction && inst.narrowLiteral == RES_FILE_LIST_MOVE) idx else null
    }
    if (moveIndices.isEmpty()) {
        throw PatchException("Could not find Move resource id in FileOptionsMenuBottomSheet")
    }

    moveIndices.forEach { moveIdx ->
        val addIndex = (moveIdx + 1..minOf(instructions.size - 1, moveIdx + 10)).firstOrNull { idx ->
            val ref = (instructions[idx] as? ReferenceInstruction)?.reference as? MethodReference
            instructions[idx].opcode == Opcode.INVOKE_VIRTUAL &&
                ref?.definingClass == "Lm90/b;" &&
                ref.name == "add"
        } ?: throw PatchException("Could not find Lm90/b;->add for Move")
        optionsMethod.replaceInstruction(addIndex, "nop")
    }
}

/**
 * Removes cloud-dependent Save as Word doc from Recent scan cards.
 */
private fun BytecodePatchContext.removeSaveAsWord() {
    val q0Class = mutableClassDefByOrNull(FILE_LIST_TOOLS_HELPER)
        ?: throw PatchException("FileListToolsHelper class $FILE_LIST_TOOLS_HELPER not found")
    val bMethod = q0Class.methods.singleOrNull {
        it.name == "b" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lcom/adobe/scan/android/file/m0;") &&
            it.returnType == "Z" &&
            it.implementation != null
    } ?: throw PatchException("FileListToolsHelper method b not found in $FILE_LIST_TOOLS_HELPER")

    bMethod.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

    val toolsClass = mutableClassDefByOrNull(FILE_LIST_TOOLS_ACTIONS)
        ?: throw PatchException("FileListTools actions class $FILE_LIST_TOOLS_ACTIONS not found")
    val initMethod = toolsClass.methods.firstOrNull {
        it.name == "<init>" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lod/ll;", "Lod/ll;") &&
            it.implementation != null
    } ?: throw PatchException("FileListTools actions constructor not found")

    val initInstructions = initMethod.implementation?.instructions
        ?: throw PatchException("FileListTools actions constructor has no implementation")

    val wordSgetIndexInInit = initInstructions.indexOfFirst { inst ->
        val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference
        inst.opcode == Opcode.SGET_OBJECT &&
            ref?.definingClass == FILE_LIST_TOOLS &&
            ref.name == "r"
    }
    if (wordSgetIndexInInit >= 0) {
        val filledArrayIdxInInit = (wordSgetIndexInInit + 1..minOf(initInstructions.size - 1, wordSgetIndexInInit + 5)).firstOrNull {
            initInstructions[it].opcode == Opcode.FILLED_NEW_ARRAY
        }
        if (filledArrayIdxInInit != null) {
            val filledInst = initInstructions[filledArrayIdxInInit] as? FiveRegisterInstruction
            if (filledInst != null) {
                initMethod.replaceInstruction(
                    filledArrayIdxInInit,
                    "filled-new-array {v${filledInst.registerC}, v${filledInst.registerE}}, [Lod/ll;"
                )
            }
        }
    }
}


/**
 * Suppresses the "Waiting to upload..." status indicator on Home and Files screens
 * by preventing ScanFile.b from returning R.string.waiting_to_upload.
 */
private fun BytecodePatchContext.suppressWaitingToUpload() {
    val scanFileClass = mutableClassDefByOrNull(SCAN_FILE)
        ?: throw PatchException("ScanFile class $SCAN_FILE not found")
    val bMethod = scanFileClass.methods.singleOrNull {
        it.name == "b" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
            it.returnType == "I" &&
            it.implementation != null
    } ?: throw PatchException("ScanFile.b(Z)I method not found")

    val instructions = bMethod.implementation?.instructions
        ?: throw PatchException("ScanFile.b has no implementation")

    val waitingUploadIndex = instructions.indexOfFirst {
        it is NarrowLiteralInstruction && it.narrowLiteral == RES_WAITING_TO_UPLOAD
    }
    if (waitingUploadIndex < 0) {
        throw PatchException("Could not find waiting_to_upload literal in ScanFile.b")
    }

    val narrowInst = instructions[waitingUploadIndex] as OneRegisterInstruction
    bMethod.replaceInstruction(waitingUploadIndex, "const/4 v${narrowInst.registerA}, 0x0")
}
