package duskdream

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private const val PACKAGE_INFO = "Landroid/content/pm/PackageInfo;"
private const val SIGNATURES = "[Landroid/content/pm/Signature;"

/** The dome's shader uses a float suffix that strict GLSL ES 1.00 compilers reject, so it isn't drawn. */
private val youTubeVrShaderPatch = resourcePatch {
    execute {
        val shader = get("assets/shaders/geodome.fplshader")
        val text = String(shader.readBytes(), Charsets.ISO_8859_1)
        if ("= 0.25f;" !in text) throw PatchException("geodome shader not as expected. Unsupported app version?")
        // Same length: the shader is stored in a flatbuffer.
        shader.writeBytes(text.replace("= 0.25f;", "= 0.25 ;").toByteArray(Charsets.ISO_8859_1))
    }
}

@Suppress("unused")
val youTubeVrPatch = bytecodePatch(
    name = "DuskDream (YouTube VR)",
    description = "Runs YouTube VR edge to edge with its background, signed in through MicroG RE."
) {
    compatibleWith(YOUTUBE_VR)
    dependsOn(
        youTubeVrShaderPatch,
        microGManifestPatch("com.google.android.apps.youtube.vr", "0cf9830f4b0d65703d4160d4e90e708ee8262a2e")
    )
    extendWith(EXTENSION)

    execute {
        // This older client library has no marked check, its availability method is patched below.
        useMicroG(markedCheck = false)
        method("Lerj;", "a", listOf("Landroid/content/Context;", "I")).returnConstant(false)
        method("Lerk;", "a", listOf(PACKAGE_INFO, "Z")).returnConstant(true)
        method("Lukw;", "a", listOf(PACKAGE_INFO, SIGNATURES)).returnConstant(true)
        method("Lukn;", "a", listOf(PACKAGE_INFO, SIGNATURES)).returnConstant(true)
        // Daydream.Lifecycle covers the camera cutout.
        hookApplication("Lcbf;")
        // Reports the VR session, which is what lets the O menu open over the app.
        val counts = redirectCalls(FEATURE_REDIRECTS)
        println("DuskDream: YouTube VR call sites $counts")
        // YouTube refuses the VR client's video links now: see PlayerClient.java in the extension.
        method("Lity;", "a", listOf("Laxx;")).addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, ${EXT}PlayerClient;->onResponse(Ljava/lang/Object;Ljava/lang/Object;)V"
        )
    }
}
