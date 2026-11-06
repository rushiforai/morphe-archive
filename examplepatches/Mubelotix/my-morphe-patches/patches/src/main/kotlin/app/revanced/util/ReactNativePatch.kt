package app.revanced.util.reactnative

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import com.android.tools.smali.dexlib2.Opcode
import java.io.File

private object ReactNativeResources

fun reactNativePatch(jsFile: String, contentProvider: (() -> String)? = null): Patch<*> {
    return bytecodePatch(
        name = "React Native Injection",
        description = "Injects a JavaScript bundle into React Native applications.",
        default = false,
    ) {
        dependsOn(rawResourcePatch {
            execute {
                val fileName = File(jsFile).name
                val file = this.get("assets/$fileName", true)
                file.parentFile?.mkdirs()
                val content = contentProvider?.invoke()
                if (content != null) {
                    file.writeText(content)
                } else {
                    val resource = ReactNativeResources::class.java.classLoader.getResourceAsStream(jsFile)
                        ?: throw java.io.FileNotFoundException("Resource '$jsFile' not found in classpath")
                    file.writeBytes(resource.readBytes())
                }
            }
        })

        execute {
            val fileName = File(jsFile).name

            val catalystInstanceImpl = classDefByOrNull("Lcom/facebook/react/bridge/CatalystInstanceImpl;") ?: return@execute
            val mutableClass = mutableClassDefBy(catalystInstanceImpl)
            val mutableMethod = mutableClass.methods.find { it.name == "runJSBundle" } ?: return@execute

            val loadScriptSmali = """
                invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
                move-result-object v0
                invoke-virtual {v0}, Landroid/app/Application;->getAssets()Landroid/content/res/AssetManager;
                move-result-object v0
                const-string v1, "Mubelotix"
                const-string v2, "Mubelotix: About to load React Native patch: $fileName"
                invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
                const-string v1, "assets://$fileName"
                const/4 v2, 0x0
                invoke-direct {p0, v0, v1, v2}, Lcom/facebook/react/bridge/CatalystInstanceImpl;->jniLoadScriptFromAssets(Landroid/content/res/AssetManager;Ljava/lang/String;Z)V
                const-string v0, "Mubelotix"
                const-string v1, "Mubelotix: React Native patch applied successfully"
                invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
            """

            val implementation = mutableMethod.implementation ?: return@execute
            val returnInstructionIndex = implementation.instructions.indexOfFirst { it.opcode == Opcode.RETURN_VOID }
            if (returnInstructionIndex != -1) {
                mutableMethod.addInstructions(returnInstructionIndex, loadScriptSmali)
            }
        }
    }
}
