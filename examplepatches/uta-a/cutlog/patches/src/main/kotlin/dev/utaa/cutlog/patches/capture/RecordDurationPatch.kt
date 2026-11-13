package dev.utaa.cutlog.patches.capture

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.utaa.cutlog.patches.shared.Constants

private const val RECORD_DURATION = "Ldev/utaa/cutlog/extension/record/RecordDuration;"
private const val POST_DELAYED = "Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z"

/** 公式の録画設定（recordDurationMs）と、停止要求から強制停止までの予備のタイマー。 */
private const val OFFICIAL_RECORD_MS = 2000L

private val cameraConfigToStringFingerprint = Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("CollectionCameraConfig(recordDurationMs="),
)

private val WIDE_CONSTS = setOf(Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_32, Opcode.CONST_WIDE, Opcode.CONST_WIDE_HIGH16)

/** 撮影画面に長さのボタンを足し、選んだ長さで録画させる。 */
@Suppress("unused")
val recordDurationPatch = bytecodePatch(
    name = "撮影秒数の選択",
    description = "撮影画面に撮影する長さ（2〜15 秒）を選ぶボタンを追加します。",
) {
    compatibleWith(Constants.SETLOG_COMPATIBILITY)
    dependsOn(captureEditorPatch)

    execute {
        // 1. 録画設定の長さ（CollectionCameraConfig の最初の long field）を読む箇所すべてで、選んだ長さに置き換える。
        val configClass = cameraConfigToStringFingerprint.match().classDef
        val durationField = configClass.fields.firstOrNull { it.type == "J" }
            ?: throw PatchException("recordDurationMs field not found.")
        var reads = 0
        val readers = mutableListOf<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            for (method in classDef.methods) {
                val instructions = method.implementation?.instructions ?: continue
                if (classDef.type != configClass.type && instructions.any { it.readsField(durationField) }) {
                    readers += classDef to method
                }
            }
        }
        for ((classDef, method) in readers) {
            val mutable = mutableClassDefBy(classDef).methods.first { it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType }
            val indices = mutable.implementation!!.instructions.withIndex()
                .filter { (_, insn) -> insn.readsField(durationField) }
                .map { it.index }
            // 後ろから差し込み、前の位置がずれないようにする。
            for (index in indices.reversed()) {
                val register = (mutable.implementation!!.instructions[index] as TwoRegisterInstruction).registerA
                mutable.addInstructions(
                    index + 1,
                    """
                        invoke-static/range {v$register .. v${register + 1}}, $RECORD_DURATION->recordDurationMs(J)J
                        move-result-wide v$register
                    """.trimIndent(),
                )
                reads++
            }
        }
        // 撮影時の録画開始・メタデータ取得・進捗表示の 3 か所で読む。
        if (reads < 3) throw PatchException("Expected at least 3 reads of recordDurationMs, found $reads.")

        // 2. 停止要求から強制停止までの予備タイマー（2000ms）を、選んだ長さより後に延ばす。
        //    CameraX と Camera2 の 2 つのバックエンドが、録画開始メソッド b(File, Z, ?, J, ?)V を持つ。
        val backends = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            val isBackend = classDef.methods.any { method ->
                method.implementation != null && method.returnType == "V" &&
                    method.parameterTypes.map { it.toString() }.let { p ->
                        p.size == 5 && p[0] == "Ljava/io/File;" && p[1] == "Z" && p[3] == "J"
                    }
            }
            if (isBackend) backends += classDef
        }
        if (backends.size != 2) throw PatchException("Expected 2 camera backends, found ${backends.size}.")
        var fallbacks = 0
        for (backend in backends) {
            val mutableClass = mutableClassDefBy(backend)
            // 録画開始を extension に知らせる（録画中は cutlog のボタンを使えなくするため）。
            val start = mutableClass.methods.single { method ->
                method.implementation != null && method.returnType == "V" &&
                    method.parameterTypes.map { it.toString() }.let { p ->
                        p.size == 5 && p[0] == "Ljava/io/File;" && p[1] == "Z" && p[3] == "J"
                    }
            }
            start.addInstructions(0, "invoke-static {}, $RECORD_DURATION->onRecordingStarted()V")
            for (method in mutableClass.methods) {
                val instructions = method.implementation?.instructions?.toList() ?: continue
                val targets = instructions.withIndex().filter { (i, insn) ->
                    insn.isWideConst(OFFICIAL_RECORD_MS) &&
                        instructions.drop(i + 1).take(3).any { it.callsMethod(POST_DELAYED) }
                }.map { it.index }
                for (index in targets.reversed()) {
                    val register = (instructions[index] as OneRegisterInstruction).registerA
                    method.addInstructions(
                        index + 1,
                        """
                            invoke-static/range {v$register .. v${register + 1}}, $RECORD_DURATION->stopFallbackDelayMs(J)J
                            move-result-wide v$register
                        """.trimIndent(),
                    )
                    fallbacks++
                }
            }
        }
        if (fallbacks != 2) throw PatchException("Expected 2 stop fallback timers, found $fallbacks.")

        // 3. 撮影画面の View ができたら、長さのボタンを足す。
        singleMatch(
            "camera view setup",
            Fingerprint(
                returnType = "V",
                parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
                filters = listOf(string("SetlogCameraFragment#setupUi")),
            ),
        ).method.addInstructions(
            0,
            "invoke-static/range {p1 .. p1}, $RECORD_DURATION->onCameraViewCreated(Landroid/view/View;)V",
        )
    }
}

private fun Instruction.readsField(field: com.android.tools.smali.dexlib2.iface.Field): Boolean {
    if (opcode != Opcode.IGET_WIDE) return false
    val ref = (this as ReferenceInstruction).reference as FieldReference
    return ref.definingClass == field.definingClass && ref.name == field.name && ref.type == field.type
}

private fun Instruction.isWideConst(value: Long): Boolean = when {
    opcode !in WIDE_CONSTS -> false
    this is WideLiteralInstruction -> wideLiteral == value
    this is NarrowLiteralInstruction -> narrowLiteral.toLong() == value
    else -> false
}

private fun Instruction.callsMethod(signature: String): Boolean {
    if (this !is ReferenceInstruction) return false
    val ref = reference as? MethodReference ?: return false
    return "${ref.definingClass}->${ref.name}(${ref.parameterTypes.joinToString("")})${ref.returnType}" == signature
}
