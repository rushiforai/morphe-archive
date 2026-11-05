package app.originisland.patches.music.jovi

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.originisland.patches.music.musiccard.originIslandMusicCardPatch
import app.originisland.patches.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val LIBRARY_BROWSER_CLASS = "Lapp/originisland/extension/LibraryBrowser;"
private const val MEDIA_SESSION_CLASS = "Landroid/media/session/MediaSession;"

private const val QQ_MUSIC_API_SERVICE = "app.originisland.extension.QQMusicApiService"

/**
 * The action Jovi binds the interface of QQ Music for other apps with.
 */
private const val QQ_MUSIC_API_ACTION = "com.tencent.qqmusic.third.api.QQMusicApiService"

private val joviVoiceRequestsResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0)
            application.appendChild(
                document.createElement("service").apply {
                    setAttribute("android:name", QQ_MUSIC_API_SERVICE)
                    setAttribute("android:exported", "true")
                    appendChild(
                        document.createElement("intent-filter").apply {
                            appendChild(
                                document.createElement("action").apply {
                                    setAttribute("android:name", QQ_MUSIC_API_ACTION)
                                }
                            )
                        }
                    )
                }
            )
        }
    }
}

@Suppress("unused")
val joviVoiceRequestsPatch = bytecodePatch(
    name = "Jovi voice requests",
    description = "Lets the Jovi voice assistant play songs asked for by voice. Only works in a second copy " +
            "of YouTube Music installed next to it under the package of QQ Music with the Clone app patch.",
    default = false
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    dependsOn(joviVoiceRequestsResourcePatch, originIslandMusicCardPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // The app only plays from a search for clients it knows, which it tells from the package of
        // the controller of each command to its session. Its session wrapper asks for that package
        // with a hidden method. The extension sends the songs asked for as Android Auto.
        var callingPackageType: String? = null
        classDefForEach { classDef ->
            if (callingPackageType != null || classDef.type.startsWith("Lapp/originisland/")) return@classDefForEach
            if (classDef.methods.any { method ->
                    method.returnType == "Ljava/lang/String;" && method.parameterTypes.isEmpty() &&
                            method.implementation?.instructions?.any {
                                it.opcode == Opcode.CONST_STRING &&
                                        ((it as ReferenceInstruction).reference as StringReference).string ==
                                        "Cannot execute MediaSession.getCallingPackage()"
                            } == true
                }) callingPackageType = classDef.type
        }
        val callingPackageClass = mutableClassDefBy(
            callingPackageType ?: throw PatchException("Could not find how the app asks for the calling package")
        )
        callingPackageClass.methods.single { method ->
            method.returnType == "Ljava/lang/String;" && method.parameterTypes.isEmpty() &&
                    method.implementation?.instructions?.any {
                        it.opcode == Opcode.CONST_STRING &&
                                ((it as ReferenceInstruction).reference as StringReference).string == "getCallingPackage"
                    } == true
        }.apply {
            val sessionField = implementation!!.instructions.first {
                it.opcode == Opcode.IGET_OBJECT &&
                        ((it as ReferenceInstruction).reference as FieldReference).type == MEDIA_SESSION_CLASS
            }.let { (it as ReferenceInstruction).reference as FieldReference }
            addInstructionsWithLabels(
                0,
                """
                    iget-object v0, p0, ${sessionField.definingClass}->${sessionField.name}:$MEDIA_SESSION_CLASS
                    invoke-static { v0 }, $LIBRARY_BROWSER_CLASS->getCallingPackage($MEDIA_SESSION_CLASS)Ljava/lang/String;
                    move-result-object v0
                    if-eqz v0, :platform
                    return-object v0
                    :platform
                    nop
                """
            )
        }
    }
}
