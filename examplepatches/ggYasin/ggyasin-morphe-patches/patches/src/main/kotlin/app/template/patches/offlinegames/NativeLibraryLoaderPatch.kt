package app.template.patches.offlinegames

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.security.MessageDigest

private val nativeLibraryManifestPatch = rawResourcePatch {
    // Dependencies finalize after dependents: hash the libraries after ALL selected edits.
    finalize {
        val names = listOf("libmain.so", "libunity.so", "libil2cpp.so")
        val build = offlineGamesBuild()
        makeNativeLoaderStrict(this["lib/${build.abi}/libmain.so"], build.abi)
        val manifest = this["assets/patchlab/offlinegames-native.properties"]
        manifest.parentFile.mkdirs()
        manifest.writeText("format=1\nloader=strict-v2\nabi=${build.abi}\nversion=${build.version}\n" + names.joinToString("\n", postfix = "\n") { name ->
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
        val oldHelper = "Lapp/patchlab/extension/offlinegames/NativeLibraries;"
        val helper = "Lapp/patchlab/extension/offlinegames/strictv2/NativeLibraries;"
        val references = method.instructions.filterIsInstance<ReferenceInstruction>().map { it.reference }
        val alreadyPatched = references.any { it.toString().startsWith("$helper->directory(") }
        if (!alreadyPatched) {
            val originalResolver = method.instructions.count() == 4 && references.filterIsInstance<FieldReference>().any {
                it.definingClass == "Landroid/content/pm/ApplicationInfo;" && it.name == "nativeLibraryDir"
            }
            val oldResolver = method.instructions.count() == 3 && references.filterIsInstance<MethodReference>().any {
                it.definingClass == oldHelper && it.name == "directory"
            }
            check(originalResolver || oldResolver) { "Unexpected Unity native-library path resolver" }
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
        fun reference(index: Int) =
            (load.instructions.elementAt(index) as? ReferenceInstruction)?.reference as? MethodReference

        // Keep Unity's existing try/catch and initialization code. Redirect only
        // its two main-library calls so the old catch handler cannot fall back.
        for ((oldName, newName) in listOf("load" to "loadMain", "loadLibrary" to "rejectMainFallback")) {
            val index = load.instructions.indexOfFirst { instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                (ref?.definingClass == "Ljava/lang/System;" && ref.name == oldName) ||
                    (ref?.definingClass == oldHelper && ref.name == newName)
            }
            if (index >= 0) {
                val call = load.instructions.elementAt(index) as FiveRegisterInstruction
                load.replaceInstruction(index, "invoke-static {v${call.registerC}}, $helper->$newName(Ljava/lang/String;)V")
            } else {
                check(load.instructions.indices.any { reference(it)?.let { ref ->
                    ref.definingClass == helper && ref.name == newName
                } == true }) { "Missing Unity $oldName call" }
            }
        }
        // Repair outputs from 1.5.x/1.6.0: the old check displayed a toast but
        // allowed execution to continue even on a mismatch.
        load.instructions.indices.filter { reference(it)?.let { ref ->
            ref.definingClass in setOf(helper, oldHelper) && ref.name == "verifyLoaded"
        } == true }.reversed().forEach { load.removeInstructions(it, 1) }

        // Repair the short-lived dev.1/dev.2 gate too, which may reference a
        // previous helper that extension merging cannot safely update in place.
        load.instructions.indices.filter { reference(it)?.let { ref ->
            ref.definingClass == oldHelper && ref.name == "finishLoad"
        } == true }.forEach {
            load.replaceInstruction(it, "invoke-static {v2}, $helper->finishLoad(Z)Ljava/lang/String;")
        }

        if (load.instructions.indices.none { reference(it)?.let { ref ->
            ref.definingClass == helper && ref.name == "finishLoad"
        } == true }) {
            val call = load.instructions.indices.single { reference(it)?.let { ref ->
                ref.definingClass == "Lcom/unity3d/player/NativeLoader;" && ref.name == "load"
            } == true }
            val instructions = load.instructions.toList()
            check(instructions[call + 1].opcode == Opcode.MOVE_RESULT &&
                instructions[call + 2].opcode == Opcode.IF_EQZ &&
                load.implementation!!.registerCount == 3) { "Unexpected Unity native-load result path" }
            val resultRegister = (instructions[call + 1] as OneRegisterInstruction).registerA
            check(resultRegister == 2) { "Unexpected Unity native-load result register" }
            load.addInstructions(call + 2, """
                invoke-static {v2}, $helper->finishLoad(Z)Ljava/lang/String;
                move-result-object v1
                nop
                return-object v1
                nop
            """.trimIndent())
        }
        // Build the branch against the destination in THIS method. Parsed local
        // smali labels can retain offsets from the temporary assembly method.
        val finish = load.instructions.indices.single { reference(it)?.let { ref ->
            ref.definingClass == helper && ref.name == "finishLoad"
        } == true }
        check(load.instructions[finish + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
            load.instructions[finish + 3].opcode == Opcode.RETURN_OBJECT &&
            load.instructions[finish + 4].opcode == Opcode.NOP) { "Unexpected native verification gate" }
        load.replaceInstruction(finish + 2, BuilderInstruction21t(
            Opcode.IF_EQZ, 1, load.implementation!!.newLabelForIndex(finish + 4),
        ))
    }
}
