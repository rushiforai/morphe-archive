package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val SOUNDS = "Lapp/template/extension/extension/CustomSounds;"
private const val DATA_SOURCE = "Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V"

private val soundProviderPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0)
            val provider = document.createElement("provider")
            provider.setAttribute("android:name", "app.template.extension.extension.SoundProvider")
            provider.setAttribute("android:authorities",
                document.documentElement.getAttribute("package") + ".nezumi.sounds")
            provider.setAttribute("android:exported", "false")
            provider.setAttribute("android:grantUriPermissions", "true")
            application.appendChild(provider)
        }
    }
}

private object NotificationChannelBuilderFingerprint : Fingerprint(
    returnType = "Landroid/app/Notification\$Builder;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    filters = listOf(methodCall(definingClass = "Landroid/app/Notification\$Builder;", name = "<init>")),
)

private object IncomingRingtoneFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(definingClass = "Landroid/net/Uri;", name = "parse"),
        methodCall(definingClass = "Landroid/media/MediaPlayer;", name = "setDataSource"),
        methodCall(definingClass = "Landroid/media/MediaPlayer;", name = "setLooping"),
        methodCall(definingClass = "Landroid/media/MediaPlayer;", name = "prepareAsync"),
        string("startRingTone "),
        string("Ringer"),
    ),
)

private object OneShotNotificationFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("OneShotSoundFirer"),
        methodCall(definingClass = "Landroid/media/RingtoneManager;", name = "getDefaultUri"),
        methodCall(definingClass = "Landroid/media/MediaPlayer;", name = "setDataSource"),
        methodCall(definingClass = "Landroid/media/MediaPlayer;", name = "start"),
    ),
)

@Suppress("unused")
val customSoundsPatch = bytecodePatch(
    name = "Custom sounds",
    description = "Choose custom notification and incoming-call sounds in Nezumi's Settings.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.10.02")),
    ))
    dependsOn(nativeSignaturePatch, soundProviderPatch)
    extendWith("extensions/extension.mpe")

    execute {
        check(IncomingRingtoneFingerprint.matchAll(1..1).size == 1)
        val method = IncomingRingtoneFingerprint.method
        val instructions = method.implementation!!.instructions.toList()
        val index = instructions.indices.single {
            instructions[it].opcode == Opcode.INVOKE_VIRTUAL &&
                (instructions[it] as? ReferenceInstruction)?.reference?.toString() == DATA_SOURCE
        }
        val call = instructions[index] as FiveRegisterInstruction
        check(call.registerCount == 3)
        method.replaceInstruction(index,
            "invoke-static {v${call.registerC}, v${call.registerD}, v${call.registerE}}, " +
                "$SOUNDS->setRingtoneDataSource(Landroid/media/MediaPlayer;Landroid/content/Context;Landroid/net/Uri;)V")

        check(OneShotNotificationFingerprint.matchAll(1..1).size == 1)
        val oneShot = OneShotNotificationFingerprint.method
        val oneShotInstructions = oneShot.implementation!!.instructions.toList()
        val oneShotIndex = oneShotInstructions.indices.single {
            oneShotInstructions[it].opcode == Opcode.INVOKE_VIRTUAL &&
                (oneShotInstructions[it] as? ReferenceInstruction)?.reference?.toString() == DATA_SOURCE
        }
        val oneShotCall = oneShotInstructions[oneShotIndex] as FiveRegisterInstruction
        check(oneShotCall.registerCount == 3)
        oneShot.replaceInstruction(oneShotIndex,
            "invoke-static {v${oneShotCall.registerC}, v${oneShotCall.registerD}, v${oneShotCall.registerE}}, " +
                "$SOUNDS->setNotificationDataSource(Landroid/media/MediaPlayer;Landroid/content/Context;Landroid/net/Uri;)V")

        check(NotificationChannelBuilderFingerprint.matchAll(1..1).size == 1)
        val builder = NotificationChannelBuilderFingerprint.method
        check(builder.implementation!!.registerCount == 3)
        builder.replaceInstruction(0,
            "invoke-static {p0, p1}, $SOUNDS->notificationBuilder(Landroid/content/Context;Ljava/lang/String;)Landroid/app/Notification\$Builder;")
        builder.replaceInstruction(1, "move-result-object v0")
        attachNezumiSettings("attachCustomSounds")
    }
}