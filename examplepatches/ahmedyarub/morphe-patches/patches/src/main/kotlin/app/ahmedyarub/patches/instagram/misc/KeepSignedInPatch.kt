package app.ahmedyarub.patches.instagram.misc

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.ahmedyarub.patches.shared.allFilesAccessPatch
import app.crimera.utils.changeString
import app.morphe.library.instagram.patches.instagramExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val TOKEN_BACKUP_CLASS = "Lapp/ahmedyarub/extension/instagram/TokenBackup;"

private object AppShellOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/app/InstagramAppShell;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/**
 * Opens a preferences store by name, wrapping it in the transformer the store was written with
 * (the authorization headers' one encrypts with a key the Android keystore holds).
 */
private object PreferencesStoreFingerprint : Fingerprint(
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "J", "Z"),
    strings = listOf("transformer_type"),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

private object EditorMethodFingerprint : Fingerprint(
    definingClass = TOKEN_BACKUP_CLASS,
    name = "editorMethod",
)

private object PutStringMethodFingerprint : Fingerprint(
    definingClass = TOKEN_BACKUP_CLASS,
    name = "putStringMethod",
)

@Suppress("unused")
val keepSignedInPatch = bytecodePatch(
    name = "Keep signed in across reinstalls",
    description = "Backs up the signed-in session to Download/morphe-tokens and restores it the first " +
        "time a reinstalled app starts. Needs \"All files access\" for the app, which a reinstall resets.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)
    dependsOn(instagramExtensionPatch, allFilesAccessPatch)

    execute {
        PreferencesStoreFingerprint.method.apply {
            // The store's editor, and the editor's putString, for writing headers back.
            val store = classDefBy(returnType)
            val editor = store.methods.firstNotNullOfOrNull { method ->
                if (method.parameterTypes.isNotEmpty()) return@firstNotNullOfOrNull null
                classDefByOrNull(method.returnType)?.takeIf { type ->
                    type.methods.any { it.name == "commit" && it.returnType == "Z" && it.parameterTypes.isEmpty() }
                }?.let { method to it }
            } ?: throw PatchException("The preferences store has no editor")
            val putString = editor.second.methods.single { method ->
                method.returnType == "V" &&
                    method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;")
            }
            EditorMethodFingerprint.changeString("editorMethod", editor.first.name)
            PutStringMethodFingerprint.changeString("putStringMethod", putString.name)

            instructions.withIndex()
                .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .sortedDescending()
                .forEach { index ->
                    val register = (instructions[index] as OneRegisterInstruction).registerA
                    addInstruction(index, "invoke-static/range { v$register .. v$register }, $TOKEN_BACKUP_CLASS->onStoreOpened(Ljava/lang/Object;)V")
                }
            addInstruction(0, "invoke-static/range { p1 .. p1 }, $TOKEN_BACKUP_CLASS->onStoreOpening(Ljava/lang/String;)V")
        }

        // First thing, before the app loads the signed-in session.
        AppShellOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $TOKEN_BACKUP_CLASS->onAppCreate(Landroid/content/Context;)V",
        )
    }
}
