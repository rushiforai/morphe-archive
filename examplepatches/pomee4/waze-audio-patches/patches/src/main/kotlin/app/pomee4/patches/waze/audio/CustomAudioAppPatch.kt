package app.pomee4.patches.waze.audio

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.smali.ExternalLabel
import app.pomee4.patches.waze.shared.Constants.COMPATIBILITY_WAZE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

/**
 * Audio partner scope flag (`SdkConfiguration.FEATURE_AUDIO`).
 * No transportation data flags are set, so Waze never sends navigation data to the app
 * and does not show the partner data-sharing consent dialog.
 */
private const val SCOPE_AUDIO = 0x200000

/** Accent color Waze uses for the app in the audio player. Passing it also avoids a resource lookup. */
private const val THEME_COLOR = 0xFF1DB954.toInt()

private val PACKAGE_NAME_REGEX = Regex("^[a-zA-Z]\\w*(\\.[a-zA-Z]\\w*)+$")

internal val audioAppPackageOption = stringOption(
    key = "audioAppPackageName",
    default = "app.myspoti.stable",
    title = "Audio app package name",
    description = "Package name of the music app to add to the Waze audio player. " +
        "The app must have a MediaBrowserService, as used by Android Auto.",
    required = true,
) { it != null && it.matches(PACKAGE_NAME_REGEX) }

internal val audioAppNameOption = stringOption(
    key = "audioAppName",
    default = "myspoti",
    title = "Audio app name",
    description = "Name shown for the app in the Waze audio player.",
    required = true,
) { !it.isNullOrBlank() }

/**
 * Android 11+ package visibility: Waze must be allowed to see the app to find its MediaBrowserService.
 */
private val audioAppVisibilityPatch = resourcePatch {
    execute {
        val packageName = audioAppPackageOption.value!!

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val queries = document.getElementsByTagName("queries").item(0) as Element?
                ?: document.createElement("queries").also { manifest.appendChild(it) }

            queries.appendChild(
                document.createElement("package").apply {
                    setAttribute("android:name", packageName)
                }
            )
        }
    }
}

private fun MethodReference.toSmali() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

private fun String.packageOf() = substringBeforeLast('/')

@Suppress("unused")
val customAudioAppPatch = bytecodePatch(
    name = "Add custom audio app",
    description = "Adds a music app of your choice (default: myspoti) to the Waze audio player. " +
        "Waze controls it through its standard Android media service, without the app needing the Waze SDK.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    dependsOn(audioAppVisibilityPatch)

    audioAppPackageOption()
    audioAppNameOption()

    execute {
        val packageName = audioAppPackageOption.value!!
        val appName = audioAppNameOption.value!!

        // region Add the app to the audio partner list Waze downloads from its server.

        UpdateAppListFingerprint.let {
            val method = it.method
            val appConfigsField = it.instructionMatches[0].fieldReference
            val partnerConfigConstructor = it.instructionMatches[1].methodReference
            val monitorExitMatch = it.instructionMatches[3]
            val lockRegister = monitorExitMatch.getInstruction<OneRegisterInstruction>().registerA

            // A free map register plus 6 consecutive registers for the constructor call,
            // none of them the register holding the method's synchronization lock.
            val registerCount = method.implementation!!.registerCount
            val ctorStart = (0..registerCount - 6).firstOrNull { start ->
                lockRegister !in start until start + 6
            } ?: throw PatchException("No free registers in updateAppList")
            val mapRegister = (0 until registerCount).firstOrNull { register ->
                register != lockRegister && register !in ctorStart until ctorStart + 6
            } ?: throw PatchException("No free registers in updateAppList")

            val configType = partnerConfigConstructor.definingClass

            method.addInstructions(
                monitorExitMatch.index,
                """
                    sget-object v$mapRegister, ${appConfigsField.definingClass}->${appConfigsField.name}:${appConfigsField.type}
                    new-instance v$ctorStart, $configType
                    const-string v${ctorStart + 1}, "$packageName"
                    const-string v${ctorStart + 2}, "$appName"
                    const v${ctorStart + 3}, $SCOPE_AUDIO
                    const/4 v${ctorStart + 4}, 0x0
                    const/4 v${ctorStart + 5}, 0x0
                    invoke-direct/range { v$ctorStart .. v${ctorStart + 5} }, ${partnerConfigConstructor.toSmali()}
                    invoke-interface { v$mapRegister, v${ctorStart + 1}, v$ctorStart }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                """
            )
        }

        // endregion

        // region Treat the app as installed, even though it has no ACTION_INIT broadcast receiver.

        IsAudioPartnerInstalledFingerprint.method.apply {
            val registerCount = implementation!!.registerCount
            // Parameters: this, packageName.
            val thisRegister = registerCount - 2
            val packageNameRegister = registerCount - 1

            val freeRegister = if (thisRegister > 0) {
                0
            } else {
                // No local registers. The method overwrites 'this' with a constant first,
                // so 'this' can be used until then.
                val first = getInstruction(0)
                if (first.opcode !in listOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST) ||
                    (first as OneRegisterInstruction).registerA != thisRegister
                ) {
                    throw PatchException("Unexpected code in the installed check, no free register")
                }
                thisRegister
            }

            addInstructionsWithLabels(
                0,
                """
                    const-string v$freeRegister, "$packageName"
                    invoke-virtual { v$freeRegister, v$packageNameRegister }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v$freeRegister
                    if-eqz v$freeRegister, :original
                    return v$freeRegister
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // endregion

        // region On connect, register the app directly as if it had called back through the Waze SDK.

        val registerMethod = RegisterAudioPartnerFingerprint.originalMethod
        val sdkManagerClass = RegisterAudioPartnerFingerprint.originalClassDef
        val sdkManagerGetter = sdkManagerClass.methods.singleOrNull { method ->
            method.isStatic() && method.parameterTypes.isEmpty() && method.returnType == sdkManagerClass.type
        } ?: throw PatchException("Could not find the Waze SDK manager singleton getter")

        if (AccessFlags.PRIVATE.isSet(registerMethod.accessFlags) ||
            sdkManagerClass.type.packageOf() != ConnectAudioPartnerFingerprint.originalClassDef.type.packageOf()
        ) {
            throw PatchException("The Waze SDK register method is not accessible from the connect method")
        }

        ConnectAudioPartnerFingerprint.method.apply {
            val registerCount = implementation!!.registerCount
            // Parameters: this, packageName, token, onTimeout.
            val localCount = registerCount - 4
            if (localCount < 2) throw PatchException("Not enough registers in the connect method")

            // 6 consecutive registers: 2 last locals followed by the 4 parameter registers.
            // All of them are overwritten, which is fine because the injected code returns.
            val manager = localCount - 2
            val resources = localCount - 1
            val pkg = localCount
            val token = localCount + 1
            val options = localCount + 2
            val messenger = localCount + 3
            val packageNameParam = localCount + 1
            val tokenParam = localCount + 2

            addInstructionsWithLabels(
                0,
                """
                    const-string v$manager, "$packageName"
                    invoke-virtual { v$manager, v$packageNameParam }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v$manager
                    if-eqz v$manager, :original

                    move-object v$manager, v$packageNameParam
                    move-object v$resources, v$tokenParam
                    move-object v$pkg, v$manager
                    move-object v$token, v$resources

                    new-instance v$options, Landroid/os/Bundle;
                    invoke-direct { v$options }, Landroid/os/Bundle;-><init>()V
                    const-string v$messenger, "themeColor"
                    const v$manager, $THEME_COLOR
                    invoke-virtual { v$options, v$messenger, v$manager }, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V
                    const/4 v$messenger, 0x0

                    invoke-static { }, ${sdkManagerGetter.toSmali()}
                    move-result-object v$manager
                    invoke-static { }, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;
                    move-result-object v$resources

                    invoke-virtual/range { v$manager .. v$messenger }, ${registerMethod.toSmali()}
                    move-result v$manager
                    return v$manager
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // endregion
    }
}
