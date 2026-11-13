package dev.utaa.cutlog.patches.capture

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.utaa.cutlog.patches.shared.Constants

internal const val HOOK_PACKAGE = "Ldev/utaa/cutlog/extension/hook"
internal const val INTERCEPTOR = "$HOOK_PACKAGE/CaptureInterceptor;"
internal const val HOST = "$HOOK_PACKAGE/CaptureHost;"
internal const val REPLACEMENT = "$HOOK_PACKAGE/CaptureReplacement;"
private const val WITH_REPLACEMENT = "cutlogWithReplacement"
internal const val MAIN_ACTIVITY = "Lcom/newchat/setlog/MainActivity;"

/** CollectionCameraResult のコンストラクタ引数。難読化されない JDK / Android の型だけで照合する。 */
internal val RESULT_CONSTRUCTOR_PARAMETERS = listOf(
    "Landroid/net/Uri;",
    "Ljava/lang/String;",
    "J",
    "I",
    "I",
    "I",
    "Z",
    "Ljava/lang/Long;",
    "Ljava/lang/Integer;",
    "Ljava/lang/String;",
)

internal val IPUT_OPCODES = setOf(
    Opcode.IPUT,
    Opcode.IPUT_WIDE,
    Opcode.IPUT_OBJECT,
    Opcode.IPUT_BOOLEAN,
)

/** media3-effect 1.11.1 の res/raw。付け替えた media3 が R.raw 経由で読む。 */
private val MEDIA3_SHADERS = listOf(
    "fragment_shader_alpha_scale_es2",
    "fragment_shader_copy_es2",
    "fragment_shader_hdr_to_ultra_hdr_es3",
    "fragment_shader_hsl_es2",
    "fragment_shader_lut_es2",
    "fragment_shader_oetf_es3",
    "fragment_shader_separable_convolution_es2",
    "fragment_shader_transformation_es2",
    "fragment_shader_transformation_external_yuv_es3",
    "fragment_shader_transformation_hdr_internal_es3",
    "fragment_shader_transformation_sdr_external_es2",
    "fragment_shader_transformation_sdr_internal_es2",
    "fragment_shader_transformation_sdr_oetf_es2",
    "fragment_shader_transformation_ultra_hdr_es3",
    "insert_overlay_fragment_shader_methods",
    "insert_ultra_hdr",
    "vertex_shader_thumbnail_strip_es2",
    "vertex_shader_transformation_es2",
    "vertex_shader_transformation_es3",
)

internal val captureResultToStringFingerprint = Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("CollectionCameraResult(uri="),
)

private val mainActivityResumeFingerprint = Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)

/** extension が持ち込めない media3 のシェーダーを res/raw に追加する。 */
private val media3ShaderResourcePatch = resourcePatch {
    execute {
        for (name in MEDIA3_SHADERS) {
            val source = "/cutlog/media3-shaders/$name.glsl"
            val bytes = object {}.javaClass.getResourceAsStream(source)?.use { it.readBytes() }
                ?: throw PatchException("Missing bundled shader: $source")
            val target = get("res/raw/cutlog_media3_$name.glsl")
            if (target.exists()) throw PatchException("Shader resource already exists: ${target.name}")
            target.parentFile.mkdirs()
            target.writeBytes(bytes)
        }
    }
}

/** 編集画面の文字に使う同梱フォント（Google Fonts の OFL 書体）。 */
private val EDITOR_FONTS = listOf("rounded", "heavy", "hand", "dot")

/** 同梱フォントとライセンス文を res/raw に追加する。extension が実行時に ID を引いて読む。 */
private val editorFontResourcePatch = resourcePatch {
    execute {
        val files = EDITOR_FONTS.map { "$it.ttf" to "cutlog_font_$it.ttf" } + ("LICENSE.txt" to "cutlog_fonts_license.txt")
        for ((name, resource) in files) {
            val source = "/cutlog/fonts/$name"
            val bytes = object {}.javaClass.getResourceAsStream(source)?.use { it.readBytes() }
                ?: throw PatchException("Missing bundled font: $source")
            val target = get("res/raw/$resource")
            if (target.exists()) throw PatchException("Font resource already exists: ${target.name}")
            target.parentFile.mkdirs()
            target.writeBytes(bytes)
        }
    }
}

/** 同梱したライブラリとフォントのライセンス表示を res/raw に追加する（APK にも表示義務のある文を残す）。 */
private val thirdPartyNoticesResourcePatch = resourcePatch {
    execute {
        val source = "/cutlog/THIRD_PARTY_NOTICES.txt"
        val bytes = object {}.javaClass.getResourceAsStream(source)?.use { it.readBytes() }
            ?: throw PatchException("Missing bundled notices: $source")
        val target = get("res/raw/cutlog_third_party_notices.txt")
        if (target.exists()) throw PatchException("Notice resource already exists: ${target.name}")
        target.parentFile.mkdirs()
        target.writeBytes(bytes)
    }
}

/** 撮影直後に編集画面を挟み、編集後の動画を本体の投稿フローへ返す。 */
@Suppress("unused")
val captureEditorPatch = bytecodePatch(
    name = "投稿前編集",
    description = "撮影直後に編集画面を表示し、フィルターやテキストを焼き込んでから投稿できるようにします。撮影画面に cutlog の設定ボタンを追加します。",
) {
    compatibleWith(Constants.SETLOG_COMPATIBILITY)
    dependsOn(media3ShaderResourcePatch, editorFontResourcePatch, thirdPartyNoticesResourcePatch)
    extendWith("extensions/cutlog.mpe")

    execute {
        val targets = captureTargets()
        val resultClass = targets.resultClass
        val resultType = resultClass.type
        resultClass.addMethod(withReplacementMethod(resultClass))
        val deliverResult = targets.deliverResult

        val cancel = singleMatch(
            "capture cancel",
            Fingerprint(
                accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
                returnType = "V",
                parameters = emptyList(),
                strings = listOf("cancelled", "requestKey"),
                custom = { method, classDef -> classDef.type == deliverResult.definingClass && method.name != deliverResult.name },
            ),
        )
        val cameraClass = deliverResult.classDef
        val cameraType = cameraClass.type
        val uriField = resultFields(resultClass)[0]

        // 録画画面に CaptureHost を実装させ、extension から結果の受け渡しとキャンセルを呼べるようにする。
        cameraClass.interfaces.add(HOST)
        cameraClass.addMethod(
            virtualMethod(
                cameraType,
                "cutlogDeliver",
                listOf("Ljava/lang/Object;", REPLACEMENT),
                registerCount = 3,
                smali = """
                    check-cast p1, $resultType
                    invoke-static {p1, p2}, $resultType->$WITH_REPLACEMENT($resultType$REPLACEMENT)$resultType
                    move-result-object p1
                    invoke-virtual {p0, p1}, $cameraType->${deliverResult.method.name}($resultType)V
                    return-void
                """,
            ),
        )
        cameraClass.addMethod(
            virtualMethod(
                cameraType,
                "cutlogCancel",
                emptyList(),
                registerCount = 1,
                smali = """
                    invoke-virtual {p0}, $cameraType->${cancel.method.name}()V
                    return-void
                """,
            ),
        )

        // 録画結果を返す処理の先頭で extension に渡す。預かった場合はここで止め、後で cutlogDeliver から呼び直させる。
        // 本体は同じ結果を二度返さないよう boolean field で弾くため、その判定を先に済ませてから渡す。
        val method = deliverResult.method
        val implementation = method.implementation!!
        if (implementation.registerCount - 2 < 1) throw PatchException("No free register in capture result delivery.")
        val instructions = implementation.instructions.toList()
        val guardRead = instructions.firstOrNull { it.opcode == Opcode.IGET_BOOLEAN }
            ?: throw PatchException("Capture result guard read not found.")
        val guardField = (guardRead as ReferenceInstruction).reference as FieldReference
        val guardWrites = instructions.filter {
            it.opcode == Opcode.IPUT_BOOLEAN && (it as ReferenceInstruction).reference == guardField
        }
        if (guardField.definingClass != cameraType || guardWrites.size != 1) {
            throw PatchException("Unexpected capture result guard: $guardField")
        }
        method.addInstructionsWithLabels(
            0,
            """
                iget-boolean v0, p0, ${fieldRef(cameraType, guardField)}
                if-nez v0, :cutlog_continue
                iget-object v0, p1, ${fieldRef(resultType, uriField)}
                invoke-static {p0, p1, v0}, $INTERCEPTOR->onCaptured(${HOST}Ljava/lang/Object;Landroid/net/Uri;)Z
                move-result v0
                if-eqz v0, :cutlog_continue
                return-void
                :cutlog_continue
                nop
            """,
        )

        // 編集画面を重ねる Activity を extension に渡す。
        mainActivityResumeFingerprint.match().method.addInstructions(
            0,
            "invoke-static/range {p0 .. p0}, $INTERCEPTOR->onActivityResumed(Landroid/app/Activity;)V",
        )

        // 撮影画面の View ができたら、cutlog の設定を開く歯車ボタンを足す（F6）。
        cameraViewSetup(cameraType).method.addInstructions(
            0,
            "invoke-static/range {p1 .. p1}, $INTERCEPTOR->onCameraSetup(Landroid/view/View;)V",
        )
    }
}

/** 録画結果のクラスと、それを本体へ返す録画画面のメソッド。 */
internal class CaptureTargets(val resultClass: MutableClass, val deliverResult: SingleMatch)

internal fun app.morphe.patcher.patch.BytecodePatchContext.captureTargets(): CaptureTargets {
    val resultClass = captureResultToStringFingerprint.match().classDef
    val deliverResult = singleMatch(
        "capture result delivery",
        Fingerprint(
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = "V",
            parameters = listOf(resultClass.type),
            strings = listOf("cancelled", "result", "requestKey"),
        ),
    )
    return CaptureTargets(resultClass, deliverResult)
}

/** 撮影画面の onViewCreated から呼ばれる UI の組み立て（`SetlogCameraFragment#setupUi`）。 */
internal fun app.morphe.patcher.patch.BytecodePatchContext.cameraViewSetup(cameraType: String): SingleMatch = singleMatch(
    "camera view setup",
    Fingerprint(
        returnType = "V",
        parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
        filters = listOf(app.morphe.patcher.string("SetlogCameraFragment#setupUi")),
        custom = { _, classDef -> classDef.type == cameraType },
    ),
)

internal class SingleMatch(val method: MutableMethod, val classDef: MutableClass, val definingClass: String, val name: String)

internal fun app.morphe.patcher.patch.BytecodePatchContext.singleMatch(label: String, fingerprint: Fingerprint): SingleMatch {
    val matches = fingerprint.matchAllOrNull().orEmpty()
    if (matches.size != 1) throw PatchException("Expected one $label, found ${matches.size}.")
    val match = matches.single()
    return SingleMatch(match.method, match.classDef, match.method.definingClass, match.method.name)
}

/** コンストラクタは引数順に代入するので、代入順がそのまま引数と field の対応になる。 */
internal fun resultFields(resultClass: MutableClass): List<FieldReference> {
    val constructor = resultClass.methods.singleOrNull { it.name == "<init>" }
        ?: throw PatchException("Expected one CollectionCameraResult constructor.")
    if (constructor.parameterTypes.map { it.toString() } != RESULT_CONSTRUCTOR_PARAMETERS) {
        throw PatchException("Unexpected CollectionCameraResult constructor: ${constructor.parameterTypes}")
    }
    val fields = constructor.implementation!!.instructions
        .filter { it.opcode in IPUT_OPCODES }
        .map { (it as ReferenceInstruction).reference as FieldReference }
    if (fields.map { it.type } != RESULT_CONSTRUCTOR_PARAMETERS) {
        throw PatchException("Unexpected CollectionCameraResult fields: $fields")
    }
    return fields
}

internal fun fieldRef(owner: String, field: FieldReference) = "$owner->${field.name}:${field.type}"

/**
 * `static Result cutlogWithReplacement(Result, CaptureReplacement)`。
 * replacement が null なら元の結果を、そうでなければ長さ・解像度・音声有無だけを差し替えた結果を返す。
 */
private fun withReplacementMethod(resultClass: MutableClass): MutableMethod {
    val resultType = resultClass.type
    val fields = resultFields(resultClass)
    val (uri, mimeType) = fields
    val lensFacing = fields[5]
    val timestamp = fields[7]
    val utcOffset = fields[8]
    val countryCode = fields[9]
    // v0〜v11 を range 呼び出しに使う。p0 は v12、p1 は v13。
    return staticMethod(
        resultType,
        WITH_REPLACEMENT,
        listOf(resultType, REPLACEMENT),
        resultType,
        registerCount = 14,
        smali = """
            if-nez p1, :replaced
            return-object p0
            :replaced
            iget-object v1, p0, ${fieldRef(resultType, uri)}
            iget-object v2, p0, ${fieldRef(resultType, mimeType)}
            iget-wide v3, p1, $REPLACEMENT->durationMs:J
            iget v5, p1, $REPLACEMENT->width:I
            iget v6, p1, $REPLACEMENT->height:I
            iget v7, p0, ${fieldRef(resultType, lensFacing)}
            iget-boolean v8, p1, $REPLACEMENT->hasAudio:Z
            iget-object v9, p0, ${fieldRef(resultType, timestamp)}
            iget-object v10, p0, ${fieldRef(resultType, utcOffset)}
            iget-object v11, p0, ${fieldRef(resultType, countryCode)}
            new-instance v0, $resultType
            invoke-direct/range {v0 .. v11}, $resultType-><init>(${RESULT_CONSTRUCTOR_PARAMETERS.joinToString("")})V
            return-object v0
        """,
    )
}

internal fun staticMethod(
    owner: String,
    name: String,
    parameters: List<String>,
    returnType: String,
    registerCount: Int,
    smali: String,
) = newMethod(owner, name, parameters, returnType, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, registerCount, smali)

internal fun virtualMethod(owner: String, name: String, parameters: List<String>, registerCount: Int, smali: String) =
    newMethod(owner, name, parameters, "V", AccessFlags.PUBLIC.value, registerCount, smali)

internal fun newMethod(
    owner: String,
    name: String,
    parameters: List<String>,
    returnType: String,
    accessFlags: Int,
    registerCount: Int,
    smali: String,
): MutableMethod {
    val method = MutableMethod(
        ImmutableMethod(
            owner,
            name,
            parameters.map { ImmutableMethodParameter(it, null, null) },
            returnType,
            accessFlags,
            null,
            null,
            MutableMethodImplementation(registerCount),
        ),
    )
    method.addInstructionsWithLabels(0, smali.trimIndent())
    return method
}

/** DEX writer は `directMethods` / `virtualMethods` を読むため、`methods` と両方へ登録する。 */
internal fun MutableClass.addMethod(method: MutableMethod) {
    methods.add(method)
    if (AccessFlags.STATIC.isSet(method.accessFlags)) directMethods.add(method) else virtualMethods.add(method)
}
