import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.loadPatchesFromJar
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import kotlinx.coroutines.runBlocking
import java.io.File

/** Recreates the exact live wrapper construction that serialized-APK tests did not cover. */
fun main(args: Array<String>) = runBlocking {
    val (bundle, original, output) = args.map(::File)
    output.parentFile.mkdirs()
    val emoji = bytecodePatch(name = "A regression: live comment emoji wrapper") {
        execute {
            val fingerprint = Fingerprint(
                definingClass = "Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;",
                name = "w", returnType = "V",
                parameters = listOf("Lcom/rubenmayayo/reddit/models/reddit/SubmissionModel;", "Z", "Z", "Z", "Lhg2;"),
            )
            val target = fingerprint.method
            val owner = fingerprint.classDef
            owner.methods.add(ImmutableMethod(target.definingClass, "morpheOriginal_w_0", target.parameters,
                "V", AccessFlags.PRIVATE.value, null, null, target.implementation!!).toMutable())
            val wrapper = ImmutableMethod(target.definingClass, "w", target.parameters, "V", target.accessFlags,
                target.annotations, target.hiddenApiRestrictions, MutableMethodImplementation(9)).toMutable()
            // Like Patcheddit 2.1.0-dev.1 wrapHook: assemble the complete body with addInstructions.
            wrapper.addInstructions(0, """
                invoke-direct/range {p0 .. p5}, ${target.definingClass}->morpheOriginal_w_0(Lcom/rubenmayayo/reddit/models/reddit/SubmissionModel;ZZZLhg2;)V
                invoke-virtual {p1}, Lcom/rubenmayayo/reddit/models/reddit/ContributionModel;->getExtraEmoji()Ljava/lang/String;
                move-result-object v0
                invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
                move-result v1
                if-nez v1, :done
                iget-object v1, p0, ${target.definingClass}->infoTop:Lcom/rubenmayayo/reddit/ui/customviews/BabushkaText;
                if-eqz v1, :done
                iget-object v2, v1, Lcom/rubenmayayo/reddit/ui/customviews/BabushkaText;->C:Ljava/util/ArrayList;
                invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z
                move-result v2
                if-nez v2, :post_part
                iget-object v2, p0, ${target.definingClass}->Y:Lcom/rubenmayayo/reddit/ui/customviews/BabushkaText${'$'}a;
                invoke-virtual {v1, v2}, Lcom/rubenmayayo/reddit/ui/customviews/BabushkaText;->h(Lcom/rubenmayayo/reddit/ui/customviews/BabushkaText${'$'}a;)V
                :post_part
                new-instance v2, Lcom/rubenmayayo/reddit/ui/customviews/BabushkaText${'$'}a${'$'}a;
                invoke-direct {v2, v0}, Lcom/rubenmayayo/reddit/ui/customviews/BabushkaText${'$'}a${'$'}a;-><init>(Ljava/lang/String;)V
                new-instance v0, Lcom/rubenmayayo/reddit/ui/customviews/BabushkaText${'$'}a;
                invoke-direct {v0, v2}, Lcom/rubenmayayo/reddit/ui/customviews/BabushkaText${'$'}a;-><init>(Lcom/rubenmayayo/reddit/ui/customviews/BabushkaText${'$'}a${'$'}a;)V
                invoke-virtual {v1, v0}, Lcom/rubenmayayo/reddit/ui/customviews/BabushkaText;->h(Lcom/rubenmayayo/reddit/ui/customviews/BabushkaText${'$'}a;)V
                invoke-virtual {v1}, Lcom/rubenmayayo/reddit/ui/customviews/BabushkaText;->i()V
                const/4 v0, 0x0
                invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V
                :done
                return-void
            """.trimIndent())
            owner.methods.remove(target)
            owner.methods.add(wrapper)
            val model = mutableClassDefBy("Lcom/rubenmayayo/reddit/models/reddit/ContributionModel;")
            model.methods.add(ImmutableMethod(model.type, "getExtraEmoji", emptyList(), "Ljava/lang/String;",
                AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(2)).toMutable().apply {
                addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
            })
        }
    }
    val mode = BytecodeMode.valueOf(System.getProperty("regressionMode", "STRIP_FAST"))
    Patcher(PatcherConfig(original, output.parentFile.resolve("wrapper-${output.nameWithoutExtension}"),
        useBytecodeMode = mode, validate = true)).use { patcher ->
        patcher += loadPatchesFromJar(setOf(bundle)) + emoji
        patcher().collect { it.exception?.let { error -> throw error } }
        original.copyTo(output, overwrite = true)
        patcher.get().applyTo(output)
    }
    val dex = DexFileFactory.loadDexContainer(output, Opcodes.getDefault())
    val holder = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
        .single { it.type == "Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;" }
    val instructions = holder.methods.single { it.name == "w" }.implementation!!.instructions.toList()
    val addresses = mutableMapOf<Int, Int>()
    var pc = 0
    for ((index, instruction) in instructions.withIndex()) { addresses[pc] = index; pc += instruction.codeUnits }
    pc = 0
    var guards = 0
    for (instruction in instructions) {
        if (instruction is OffsetInstruction && (instruction.opcode == Opcode.IF_EQZ || instruction.opcode == Opcode.IF_NEZ)) {
            val target = addresses[pc + instruction.codeOffset]
            check(target != null) { "Branch at 0x${pc.toString(16)} targets the middle of an instruction" }
            check(instructions[target].opcode == (if (guards < 2) Opcode.RETURN_VOID else Opcode.NEW_INSTANCE)) { "Emoji guard does not target the actual return" }
            guards++
        }
        pc += instruction.codeUnits
    }
    check(guards == 3)
    println("LIVE WRAPPER PASS: post wrapper guards target valid return/part instructions ($mode)")
    println("APK: ${output.absolutePath}")
}
