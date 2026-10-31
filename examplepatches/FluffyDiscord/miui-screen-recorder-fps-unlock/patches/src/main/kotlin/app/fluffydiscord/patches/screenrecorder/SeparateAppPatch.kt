package app.fluffydiscord.patches.screenrecorder

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val AUTHORITY_SUFFIX = ".hfr"
private const val ORIGINAL_PROVIDER_AUTHORITY = "screenrecorder"
private const val PATCHED_PROVIDER_AUTHORITY = ORIGINAL_PROVIDER_AUTHORITY + AUTHORITY_SUFFIX
private const val PATCHED_APP_LABEL = "Screen Recorder (high fps)"
private const val PHONE_STATE_PERMISSION = "android.permission.READ_PHONE_STATE"
private const val NOTIFICATIONS_PERMISSION = "android.permission.POST_NOTIFICATIONS"
private const val CAPTURE_REQUEST_CODE = 0x64
private const val OVERLAY_SETTINGS_REQUEST_CODE = 0x69
private const val REQUEST_OVERLAY_METHOD_NAME = "patchedRequestOverlayPermission"
private const val REQUEST_CAPTURE_METHOD_NAME = "patchedRequestCaptureConsent"
private const val ON_CREATE_PARAMETER_REGISTERS = 2
private const val CAPTURE_CONSENT_FIELD_NAME = "patchedCaptureConsent"
private const val INTENT_TYPE = "Landroid/content/Intent;"

private val separateAppManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            manifest.setAttribute("package", PATCHED_PACKAGE_NAME)
            manifest.removeAttribute("android:sharedUserId")
            manifest.removeAttribute("android:sharedUserMaxSdkVersion")

            renameProviderAuthorities(document)
            addPhoneStatePermission(document)
            setApplicationLabel(document)
        }
    }
}

private fun renameProviderAuthorities(document: Document) {
    val providers = document.getElementsByTagName("provider")
    for (providerIndex in 0 until providers.length) {
        val provider = providers.item(providerIndex) as Element
        val authorities = provider.getAttribute("android:authorities").split(';')
        val renamedAuthorities = authorities.map(::renameAuthority)
        provider.setAttribute("android:authorities", renamedAuthorities.joinToString(";"))
    }
}

private fun renameAuthority(authority: String): String {
    val isPackageScoped = authority.startsWith("$ORIGINAL_PACKAGE_NAME.")
    if (isPackageScoped) {
        return authority.replaceFirst(ORIGINAL_PACKAGE_NAME, PATCHED_PACKAGE_NAME)
    }

    return authority + AUTHORITY_SUFFIX
}

private fun addPhoneStatePermission(document: Document) {
    val permission = document.createElement("uses-permission")
    permission.setAttribute("android:name", PHONE_STATE_PERMISSION)

    val application = document.getElementsByTagName("application").item(0)
    document.documentElement.insertBefore(permission, application)
}

private fun setApplicationLabel(document: Document) {
    val application = document.getElementsByTagName("application").item(0) as Element
    application.setAttribute("android:label", PATCHED_APP_LABEL)
}

internal val separateAppPatch = bytecodePatch {
    dependsOn(separateAppManifestPatch)

    execute {
        replacePackageNameStrings()
        val consentField = addCaptureConsentField()
        useStandardCaptureConsent(consentField)
        storeCaptureConsent(consentField)
        openCaptureConsentFromTile()
        addCaptureConsentSteps()
        askForPermissionsBeforeCapture()
        continueAfterPermissions()
        continueAfterOverlaySettings()
    }
}

context(patchContext: BytecodePatchContext)
private fun replacePackageNameStrings() {
    val replacements = mapOf(
        ORIGINAL_PACKAGE_NAME to PATCHED_PACKAGE_NAME,
        "content://$ORIGINAL_PROVIDER_AUTHORITY" to "content://$PATCHED_PROVIDER_AUTHORITY",
        ORIGINAL_PROVIDER_AUTHORITY to PATCHED_PROVIDER_AUTHORITY,
    )

    replacements.forEach { (originalString, patchedString) ->
        string(originalString).matchAllMethodIndicesForEach { index ->
            val register = getInstruction<OneRegisterInstruction>(index).registerA
            replaceInstruction(index, "const-string v$register, \"$patchedString\"")
        }
    }
}

context(patchContext: BytecodePatchContext)
private fun addCaptureConsentField(): String {
    val holderClass = PrivilegedProjectionFingerprint.classDef
    val field = ImmutableField(
        holderClass.type,
        CAPTURE_CONSENT_FIELD_NAME,
        INTENT_TYPE,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null,
        null,
        null,
    ).toMutable()
    holderClass.staticFields.add(field)

    return "${holderClass.type}->$CAPTURE_CONSENT_FIELD_NAME:$INTENT_TYPE"
}

context(patchContext: BytecodePatchContext)
private fun useStandardCaptureConsent(consentField: String) {
    val permissionActivity = StartPermissionActivityFingerprint.originalMethod
    val startPermissionActivity =
        "${permissionActivity.definingClass}->${permissionActivity.name}(Landroid/content/Context;IZ)V"

    PrivilegedProjectionFingerprint.method.addInstructionsWithLabels(
        0,
        """
            sget-object v0, $consentField
            if-nez v0, :has_consent
            const/16 v0, $CAPTURE_REQUEST_CODE
            const/4 v1, 0x1
            invoke-static {p0, v0, v1}, $startPermissionActivity
            new-instance v0, Ljava/lang/IllegalStateException;
            const-string v1, "Screen capture consent requested"
            invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
            throw v0
            :has_consent
            const/4 v1, 0x0
            sput-object v1, $consentField
            return-object v0
        """,
    )
}

context(patchContext: BytecodePatchContext)
private fun storeCaptureConsent(consentField: String) {
    CaptureConsentResultFingerprint.let { fingerprint ->
        val getProjection = fingerprint.instructionMatches[0]
        val projectionResult = fingerprint.instructionMatches[1]
        val setProjection = fingerprint.instructionMatches[2]

        val consentRegister = getProjection.getInstruction<FiveRegisterInstruction>().registerE
        val projectionRegister = projectionResult.getInstruction<OneRegisterInstruction>().registerA

        fingerprint.method.apply {
            removeInstruction(setProjection.index)
            replaceInstruction(projectionResult.index, "move-object v$projectionRegister, v$consentRegister")
            replaceInstruction(getProjection.index, "sput-object v$consentRegister, $consentField")
        }
    }
}

context(patchContext: BytecodePatchContext)
private fun openCaptureConsentFromTile() {
    val permissionActivityClass = StartPermissionActivityFingerprint.originalMethod.definingClass
    val immutableUpdateCurrentFlags = 0x0c000000

    TileClickFingerprint.method.addInstructions(
        0,
        """
            new-instance v0, Landroid/content/Intent;
            const-class v1, $permissionActivityClass
            invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
            const-string v1, "key_permission"
            const/16 v2, $CAPTURE_REQUEST_CODE
            invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;
            const-string v1, "key_need_start_service"
            const/4 v2, 0x1
            invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
            const/4 v1, 0x0
            const v2, $immutableUpdateCurrentFlags
            invoke-static {p0, v1, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;
            move-result-object v0
            invoke-virtual {p0, v0}, Landroid/service/quicksettings/TileService;->startActivityAndCollapse(Landroid/app/PendingIntent;)V
            return-void
        """,
    )
}

context(patchContext: BytecodePatchContext)
private fun addCaptureConsentSteps() {
    val permissionActivity = StartPermissionActivityFingerprint.classDef

    permissionActivity.addVoidMethod(
        REQUEST_CAPTURE_METHOD_NAME,
        listOf(),
        3,
        """
            const-string v0, "media_projection"
            invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Landroid/media/projection/MediaProjectionManager;
            invoke-virtual {v0}, Landroid/media/projection/MediaProjectionManager;->createScreenCaptureIntent()Landroid/content/Intent;
            move-result-object v0
            const/16 v1, $CAPTURE_REQUEST_CODE
            invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
            return-void
        """,
    )

    permissionActivity.addVoidMethod(
        REQUEST_OVERLAY_METHOD_NAME,
        listOf(),
        4,
        """
            invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z
            move-result v0
            if-nez v0, :can_draw_overlays
            const-string v0, "package:"
            invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
            move-result-object v1
            invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v0
            invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
            move-result-object v0
            new-instance v1, Landroid/content/Intent;
            const-string v2, "android.settings.action.MANAGE_OVERLAY_PERMISSION"
            invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V
            const/16 v0, $OVERLAY_SETTINGS_REQUEST_CODE
            invoke-virtual {p0, v1, v0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
            return-void
            :can_draw_overlays
            invoke-virtual {p0}, ${permissionActivity.type}->$REQUEST_CAPTURE_METHOD_NAME()V
            return-void
        """,
    )
}

context(patchContext: BytecodePatchContext)
private fun askForPermissionsBeforeCapture() {
    CaptureConsentRequestFingerprint.let { fingerprint ->
        val originalRegisterCount = fingerprint.method.implementation!!.registerCount
        val thisRegister = originalRegisterCount - ON_CREATE_PARAMETER_REGISTERS
        val arrayRegister = originalRegisterCount
        val (method, addedInstructions) = fingerprint.method.addFreeRegisters(1)
        val insertIndex = fingerprint.instructionMatches[0].index + addedInstructions

        val registers = method.getFreeRegisterProvider(insertIndex, 2, arrayRegister)
        val permissionRegister = registers.getFreeRegister4Bit()
        val numberRegister = registers.getFreeRegister4Bit()

        method.addInstructions(
            insertIndex,
            """
                const/4 v$numberRegister, 0x2
                new-array v$arrayRegister, v$numberRegister, [Ljava/lang/String;
                const-string v$permissionRegister, "$PHONE_STATE_PERMISSION"
                const/4 v$numberRegister, 0x0
                aput-object v$permissionRegister, v$arrayRegister, v$numberRegister
                const-string v$permissionRegister, "$NOTIFICATIONS_PERMISSION"
                const/4 v$numberRegister, 0x1
                aput-object v$permissionRegister, v$arrayRegister, v$numberRegister
                const/16 v$numberRegister, $CAPTURE_REQUEST_CODE
                invoke-virtual {v$thisRegister, v$arrayRegister, v$numberRegister}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V
                return-void
            """,
        )
    }
}

context(patchContext: BytecodePatchContext)
private fun continueAfterPermissions() {
    val insertIndex = PermissionResultFingerprint.instructionMatches[0].index + 1
    PermissionResultFingerprint.method.callOnRequestCode(insertIndex, CAPTURE_REQUEST_CODE, REQUEST_OVERLAY_METHOD_NAME)
}

context(patchContext: BytecodePatchContext)
private fun continueAfterOverlaySettings() {
    CaptureConsentResultFingerprint.method.callOnRequestCode(0, OVERLAY_SETTINGS_REQUEST_CODE, REQUEST_CAPTURE_METHOD_NAME)
}

private fun MutableMethod.callOnRequestCode(index: Int, requestCode: Int, methodName: String) {
    val requestCodeRegister = getFreeRegisterProvider(index, 1).getFreeRegister4Bit()

    addInstructionsWithLabels(
        index,
        """
            const/16 v$requestCodeRegister, $requestCode
            if-ne p1, v$requestCodeRegister, :other_request
            invoke-virtual {p0}, $definingClass->$methodName()V
            return-void
            :other_request
            nop
        """,
    )
}
