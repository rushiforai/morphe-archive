package dev.jason.gboardpatches.patches.gboard.features.chinesevoice

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import dev.jason.gboardpatches.patches.gboard.shared.addHelperMethodIfMissing
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow

private const val NEW_S3_PROVIDER_CLASS = "Ljaa;"

internal val gboardChineseOnlineVoiceBytecodePatch = bytecodePatch(
    description = "讓中文語音請求強制走 NEW_S3 recognizer provider gate。"
) {
    execute {
        addZhRequestHelper()
        addForceResultHelper()
        injectNewS3ProviderForce()
    }
}

context(context: BytecodePatchContext)
private fun addZhRequestHelper() = with(context) {
    addHelperMethodIfMissing(
        classType = NEW_S3_PROVIDER_CLASS,
        name = "jasondevShouldForceZhRequest",
        parameterTypes = listOf("Lizg;"),
        returnType = "Z",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 3,
        body = SHOULD_FORCE_ZH_REQUEST_BODY
    )
}

context(context: BytecodePatchContext)
private fun addForceResultHelper() = with(context) {
    addHelperMethodIfMissing(
        classType = NEW_S3_PROVIDER_CLASS,
        name = "jasondevForceZhProviderResult",
        parameterTypes = listOf("Z", "Lizg;"),
        returnType = "Z",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        registerCount = 3,
        body = FORCE_ZH_PROVIDER_RESULT_BODY
    )
}

context(context: BytecodePatchContext)
private fun injectNewS3ProviderForce() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = NEW_S3_PROVIDER_CLASS,
        name = "b",
        returnType = "Z",
        parameterTypes = listOf("Landroid/content/Context;", "Lizg;")
    )

    mutableMethod.addInstructions(0, FORCE_NEW_S3_PROVIDER_DELEGATE)
}

private val FORCE_NEW_S3_PROVIDER_DELEGATE = """
    invoke-static {}, Lqux;->a()Z

    move-result p0

    invoke-static {p0, p2}, Ljaa;->jasondevForceZhProviderResult(ZLizg;)Z

    move-result p0

    return p0
""".trimIndent()

private val SHOULD_FORCE_ZH_REQUEST_BODY = """
    if-eqz p0, :cond_false

    iget-object p0, p0, Lizg;->a:Lpua;

    if-eqz p0, :cond_false

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x5f

    const/16 v1, 0x2d

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "zh"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_true

    const-string v0, "cmn"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_false

    :cond_true
    const/4 p0, 0x1

    return p0

    :cond_false
    const/4 p0, 0x0

    return p0
""".trimIndent()

private val FORCE_ZH_PROVIDER_RESULT_BODY = """
    if-nez p0, :cond_true

    invoke-static {p1}, Ljaa;->jasondevShouldForceZhRequest(Lizg;)Z

    move-result p1

    if-eqz p1, :cond_false

    :cond_true
    const/4 p0, 0x1

    return p0

    :cond_false
    const/4 p0, 0x0

    return p0
""".trimIndent()
