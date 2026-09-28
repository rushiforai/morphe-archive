package app.template.patches.offlinegames

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.security.MessageDigest

private val nativeLibraryManifestPatch = rawResourcePatch {
    // Dependencies finalize after dependents: hash the libraries after ALL selected edits.
    finalize {
        val names = listOf("libmain.so", "libunity.so", "libil2cpp.so")
        val build = offlineGamesBuild()
        val manifest = this["assets/patchlab/offlinegames-native.properties"]
        manifest.parentFile.mkdirs()
        manifest.writeText("format=1\nabi=${build.abi}\nversion=${build.version}\n" + names.joinToString("\n", postfix = "\n") { name ->
            val library = this["lib/${build.abi}/$name"]
            check(library.isFile) { "Missing ${build.abi} Unity library: $name" }
            val digest = MessageDigest.getInstance("SHA-256")
            library.inputStream().use { input ->
                val buffer = ByteArray(64 * 1024)
                while (true) {
                    val count = input.read(buffer)
                    if (count < 0) break
                    digest.update(buffer, 0, count)
                }
            }
            "$name=" + digest.digest().joinToString("") { "%02x".format(it.toInt() and 0xff) }
        })
    }
}

/** One shared dependency installs the loader exactly once, regardless of patch selection order. */
internal val offlineGamesNativeLoaderPatch = bytecodePatch {
    dependsOn(nativeLibraryManifestPatch)
    extendWith("extensions/offlinegames.mpe")

    execute {
        val method = mutableClassDefBy("Lcom/unity3d/player/UnityPlayer;").methods.single {
            it.name == "getUnityNativeLibraryPath" &&
                it.parameterTypes == listOf("Landroid/content/Context;") &&
                it.returnType == "Ljava/lang/String;"
        }
        val helper = "Lapp/patchlab/extension/offlinegames/NativeLibraries;"
        val references = method.instructions.filterIsInstance<ReferenceInstruction>().map { it.reference }
        val alreadyPatched = references.any { it.toString().startsWith("$helper->directory(") }
        if (!alreadyPatched) {
            check(method.instructions.count() == 4 && references.filterIsInstance<FieldReference>().any {
                it.definingClass == "Landroid/content/pm/ApplicationInfo;" && it.name == "nativeLibraryDir"
            }) { "Unexpected Unity native-library path resolver; expected a supported Offline Games build" }
            method.removeInstructions(0, method.instructions.count())
            method.addInstructions(
                0,
                """
                    invoke-static {p0}, $helper->directory(Landroid/content/Context;)Ljava/lang/String;
                    move-result-object p0
                    return-object p0
                """.trimIndent(),
            )
        }

        val load = mutableClassDefBy("Lcom/unity3d/player/UnityPlayer;").methods.single {
            it.name == "loadNative" && it.parameterTypes == listOf("Ljava/lang/String;") &&
                it.returnType == "Ljava/lang/String;"
        }
        val instructions = load.instructions.toList()
        fun calledMethod(index: Int) =
            (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        if (instructions.indices.none { calledMethod(it)?.let { ref ->
                ref.definingClass == helper && ref.name == "verifyLoaded"
            } == true }) {
            val call = instructions.indices.single { calledMethod(it)?.let { ref ->
                ref.definingClass == "Lcom/unity3d/player/NativeLoader;" && ref.name == "load"
            } == true }
            check(instructions[call + 1].opcode == Opcode.MOVE_RESULT &&
                instructions[call + 2].opcode == Opcode.IF_EQZ &&
                instructions[call + 3].opcode == Opcode.INVOKE_STATIC &&
                calledMethod(call + 3)?.returnType == "V") {
                "Unexpected Unity load success path"
            }
            load.addInstructions(call + 3, "invoke-static {}, $helper->verifyLoaded()V")
        }
    }
}
