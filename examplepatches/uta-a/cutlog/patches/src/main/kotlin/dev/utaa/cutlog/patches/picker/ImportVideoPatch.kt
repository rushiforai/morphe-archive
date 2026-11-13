package dev.utaa.cutlog.patches.picker

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.utaa.cutlog.patches.capture.HOST
import dev.utaa.cutlog.patches.capture.INTERCEPTOR
import dev.utaa.cutlog.patches.capture.IPUT_OPCODES
import dev.utaa.cutlog.patches.capture.MAIN_ACTIVITY
import dev.utaa.cutlog.patches.capture.REPLACEMENT
import dev.utaa.cutlog.patches.capture.RESULT_CONSTRUCTOR_PARAMETERS
import dev.utaa.cutlog.patches.capture.addMethod
import dev.utaa.cutlog.patches.capture.captureEditorPatch
import dev.utaa.cutlog.patches.capture.captureTargets
import dev.utaa.cutlog.patches.capture.fieldRef
import dev.utaa.cutlog.patches.capture.singleMatch
import dev.utaa.cutlog.patches.capture.staticMethod
import dev.utaa.cutlog.patches.capture.virtualMethod
import dev.utaa.cutlog.patches.shared.Constants

private const val CREATE_RESULT = "cutlogCreate"
private const val URI = "Landroid/net/Uri;"
private const val INTENT = "Landroid/content/Intent;"

/** CameraX の LENS_FACING_BACK。取り込んだ動画には撮影時のレンズが無いため背面として扱う。 */
private const val LENS_FACING_BACK = 1

/** 端末内の動画を選び、トリム・編集してから「今」のログとして投稿できるようにする（F4）。 */
@Suppress("unused")
val importVideoPatch = bytecodePatch(
    name = "ファイルから投稿",
    description = "撮影画面に「ファイルから」ボタンを追加し、端末内の動画を今のログとして投稿できるようにします。",
) {
    compatibleWith(Constants.SETLOG_COMPATIBILITY)
    dependsOn(captureEditorPatch)

    execute {
        val targets = captureTargets()
        val resultClass = targets.resultClass
        val resultType = resultClass.type
        val cameraClass = targets.deliverResult.classDef
        val cameraType = cameraClass.type

        // 撮影開始時に撮影時刻・UTC オフセット・国コードを CaptureContext にまとめるメソッド。
        val captureContext = singleMatch(
            "capture context builder",
            Fingerprint(
                returnType = "V",
                parameters = emptyList(),
                filters = listOf(
                    methodCall("Ljava/time/ZoneId;->systemDefault()Ljava/time/ZoneId;"),
                    methodCall("Ljava/time/Instant;->ofEpochMilli(J)Ljava/time/Instant;"),
                ),
                custom = { _, classDef -> classDef.type == cameraType },
            ),
        )
        val contextField = captureContext.method.implementation!!.instructions
            .filter { it.opcode == Opcode.IPUT_OBJECT }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .singleOrNull { it.definingClass == cameraType }
            ?: throw PatchException("Capture context field not found.")
        val contextType = contextField.type
        val contextClass = mutableClassDefBy(contextType)
        val contextConstructor = contextClass.methods.singleOrNull { it.name == "<init>" }
            ?: throw PatchException("Expected one CaptureContext constructor.")
        val contextFields = contextConstructor.implementation!!.instructions
            .filter { it.opcode in IPUT_OPCODES }
            .map { (it as ReferenceInstruction).reference as FieldReference }
        fun contextFieldOf(type: String) = contextFields.singleOrNull { it.type == type }
            ?: throw PatchException("CaptureContext field of $type not found: $contextFields")
        val timestamp = contextFieldOf("J")
        val utcOffset = contextFieldOf("I")
        val countryCode = contextFieldOf("Ljava/lang/String;")

        // static Result cutlogCreate(CaptureContext, Uri, CaptureReplacement)
        // v0〜v11 を range 呼び出しに使う。p0 は v12、p1 は v13、p2 は v14。
        resultClass.addMethod(
            staticMethod(
                resultType,
                CREATE_RESULT,
                listOf(contextType, URI, REPLACEMENT),
                resultType,
                registerCount = 15,
                smali = """
                    new-instance v0, $resultType
                    move-object v1, p1
                    const-string v2, "video/mp4"
                    iget-wide v3, p2, $REPLACEMENT->durationMs:J
                    iget v5, p2, $REPLACEMENT->width:I
                    iget v6, p2, $REPLACEMENT->height:I
                    const/4 v7, $LENS_FACING_BACK
                    iget-boolean v8, p2, $REPLACEMENT->hasAudio:Z
                    iget-wide v9, p0, ${fieldRef(contextType, timestamp)}
                    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
                    move-result-object v9
                    iget v10, p0, ${fieldRef(contextType, utcOffset)}
                    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                    move-result-object v10
                    iget-object v11, p0, ${fieldRef(contextType, countryCode)}
                    invoke-direct/range {v0 .. v11}, $resultType-><init>(${RESULT_CONSTRUCTOR_PARAMETERS.joinToString("")})V
                    return-object v0
                """,
            ),
        )

        // 取り込んだ動画を、撮影時と同じ CaptureContext を作ってから本体へ返す。
        cameraClass.addMethod(
            virtualMethod(
                cameraType,
                "cutlogDeliverImported",
                listOf(URI, REPLACEMENT),
                registerCount = 4,
                smali = """
                    invoke-virtual {p0}, $cameraType->${captureContext.name}()V
                    iget-object v0, p0, ${fieldRef(cameraType, contextField)}
                    invoke-static {v0, p1, p2}, $resultType->$CREATE_RESULT($contextType$URI$REPLACEMENT)$resultType
                    move-result-object v0
                    invoke-virtual {p0, v0}, $cameraType->${targets.deliverResult.name}($resultType)V
                    return-void
                """,
            ),
        )

        // 撮影画面の View ができたら「ファイルから」ボタンを足す。
        singleMatch(
            "camera view setup",
            Fingerprint(
                returnType = "V",
                parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
                filters = listOf(string("SetlogCameraFragment#setupUi")),
                custom = { _, classDef -> classDef.type == cameraType },
            ),
        ).method.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $INTERCEPTOR->onCameraViewCreated(${HOST}Landroid/view/View;)V",
        )

        // 動画選択の結果を受け取る。MainActivity は onActivityResult を持たないため override を足す。
        val mainActivity = mutableClassDefBy(MAIN_ACTIVITY)
        if (mainActivity.methods.any { it.name == "onActivityResult" }) {
            throw PatchException("MainActivity already overrides onActivityResult.")
        }
        mainActivity.addMethod(
            virtualMethod(
                MAIN_ACTIVITY,
                "onActivityResult",
                listOf("I", "I", INTENT),
                registerCount = 5,
                smali = """
                    invoke-static {p0, p1, p2, p3}, $INTERCEPTOR->onActivityResult(Landroid/app/Activity;II$INTENT)Z
                    move-result v0
                    if-nez v0, :cutlog_handled
                    invoke-super {p0, p1, p2, p3}, ${mainActivity.superclass}->onActivityResult(II$INTENT)V
                    :cutlog_handled
                    return-void
                """,
            ),
        )
    }
}
