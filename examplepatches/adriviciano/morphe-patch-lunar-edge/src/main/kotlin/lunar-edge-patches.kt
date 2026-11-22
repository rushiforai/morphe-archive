package local.lunaredge.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ROOT = "Lcom/lunaredge/browser/"
private const val PLAYER = "Lchuangyuan/ycj/videolibrary/video/ExoUserPlayer;"
private const val VIDEO_VIEW = "Lchuangyuan/ycj/videolibrary/widget/VideoPlayerView;"
private const val AD_INFO = "${ROOT}netbean/JYChildCaptureTask;"
private val playbackParameters = listOf(
    "Z", "Z", "Landroid/app/Activity;", VIDEO_VIEW, "I", "I",
    "Landroid/view/View;", "Landroid/os/Handler;", PLAYER
)

private data class NativeEngineTarget(
    val sha256: String,
    val offset: Int,
    val expected: ByteArray,
    val replacement: ByteArray
)

private val nativeEngineTargets = mapOf(
    "lib/arm64-v8a/libpp_hls.so" to NativeEngineTarget(
        "4f46f78b983e4ec57a1ec1777060cd56116b3cfbd3cfa75dddbabbecf6b8f8f6",
        0x15fcc8,
        byteArrayOf(0x40, 0x07, 0x00, 0x35),
        byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte())
    ),
    "lib/armeabi-v7a/libpp_hls.so" to NativeEngineTarget(
        "06e9366490502764c3b7d97da74b2720195d139b27c04d86b7e7971f7b87c30c",
        0xd82e4,
        byteArrayOf(0x4f, 0xd1.toByte()),
        byteArrayOf(0x00, 0xbf.toByte())
    )
)

@Suppress("unused")
val fixLocalVideoEngine = patch(
    name = "Fix local video engine",
    description = "Permite arrancar el motor local de vídeo después de firmar la APK con Morphe. Corrige el falso error de red o servidor en Lunar Edge 4.0.2 (ARM64/ARMv7).",
    default = true
) {
    compatibleWith(Compatibility(packageName = "com.lunaredge.browser", name = "Lunar Edge", targets = listOf(AppTarget("4.0.2", 40002))))
    execute {
        val libraries = listApkEntries("lib/").filter { it.endsWith("/libpp_hls.so") }
        check(libraries.isNotEmpty()) { "No se encuentra el motor local: selecciona el APK/XAPK original completo." }
        // Validamos cada biblioteca completa antes de realizar cualquier cambio.
        val edits = libraries.map { path ->
            val target = nativeEngineTargets[path] ?: error("Arquitectura del motor no admitida: $path")
            val file = resourceFile(path)
            val bytes = file.readBytes()
            fun hashOf(value: ByteArray) = java.security.MessageDigest.getInstance("SHA-256")
                .digest(value).joinToString("") { "%02x".format(it) }
            // También aceptamos exactamente la biblioteca que ya corregimos, sin alterar otra variante.
            if (bytes.copyOfRange(target.offset, target.offset + target.replacement.size).contentEquals(target.replacement)) {
                val original = bytes.copyOf()
                target.expected.copyInto(original, target.offset)
                check(hashOf(original) == target.sha256) { "Biblioteca incompatible: $path. Usa el APK/XAPK original." }
                return@map file to bytes
            }
            check(hashOf(bytes) == target.sha256) { "Biblioteca incompatible: $path. Usa el APK/XAPK original." }
            check(bytes.copyOfRange(target.offset, target.offset + target.expected.size).contentEquals(target.expected)) {
                "La comprobación local ha cambiado: $path"
            }
            target.replacement.copyInto(bytes, target.offset)
            file to bytes
        }
        // Solo se omite el rechazo de la firma nueva en sim_check_sig; las peticiones remotas no cambian.
        edits.forEach { (file, bytes) -> file.writeBytes(bytes) }
    }
}

private fun requireMethod(
    owner: String,
    name: String,
    parameters: List<String>,
    expectedCall: String
): MutableMethod {
    val method = mutableClassDefBy(owner).methods.singleOrNull {
        it.name == name && it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == parameters
    } ?: error("No se encuentra la firma esperada: $owner->$name. Solo se admite Lunar Edge 4.0.2.")

    // Verificamos el cuerpo original para rechazar variantes incompatibles.
    check(method.implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference != null && "${reference.definingClass}->${reference.name}" == expectedCall
    } == true) { "El flujo de $owner->$name ha cambiado; no se aplicará el parche." }
    return method
}

@Suppress("unused")
val removePlayerVideoAds = patch(
    name = "Remove player video ads",
    description = "Omite los anuncios de vídeo del reproductor y continúa por su ruta local de reproducción. Compatible con Lunar Edge 4.0.2.",
    default = true
) {
    compatibleWith(Compatibility(packageName = "com.lunaredge.browser", name = "Lunar Edge", targets = listOf(AppTarget("4.0.2", 40002))))
    execute {
        val mainPlayer = "${ROOT}ui/JYAlternativeZero;"
        val localPlayer = "${ROOT}ui/JYNameTask;"
        val startPlayback = requireMethod(mainPlayer, "loadAdPlay", playbackParameters, "$mainPlayer->v2")
        val resumePlayback = requireMethod(mainPlayer, "raiseLoop", listOf("Z") + playbackParameters, "$PLAYER->M")
        val localPlayback = requireMethod(localPlayer, "matchFocusObject", playbackParameters, "$PLAYER->h0")

        // Conservamos las mismas rutas que usa la aplicación cuando no hay anuncios.
        startPlayback.addInstructions(0, "invoke-virtual/range {p0 .. p0}, $mainPlayer->v2()V\nreturn-void")
        resumePlayback.addInstructions(0, "invoke-virtual/range {p10 .. p10}, $PLAYER->M()V\nreturn-void")
        localPlayback.addInstructions(0, "invoke-virtual/range {p9 .. p9}, $PLAYER->h0()V\nreturn-void")
    }
}

@Suppress("unused")
val removePlayerDisplayAds = patch(
    name = "Remove player display ads",
    description = "Evita cargar los intersticiales y anuncios nativos superpuestos del reproductor de Lunar Edge 4.0.2.",
    default = true
) {
    compatibleWith(Compatibility(packageName = "com.lunaredge.browser", name = "Lunar Edge", targets = listOf(AppTarget("4.0.2", 40002))))
    execute {
        val mainPlayer = "${ROOT}ui/JYAlternativeZero;"
        val interstitial = requireMethod(
            "${ROOT}util/JYTailSession;", "c", listOf(AD_INFO, "I"),
            "Lcom/wangxiong/sdk/view/InterstitialAdLoader;->loadAd"
        )
        val nativeBanner = requireMethod(
            mainPlayer, "disableMirror", listOf(AD_INFO),
            "${ROOT}util/JybPreviousSpace;->b"
        )
        val nativeOverlay = requireMethod(
            mainPlayer, "s2", listOf(AD_INFO, "I", "I", "I"),
            "Lcom/wangxiong/sdk/view/CustomNativeLoader;-><init>"
        )
        // No se publican eventos de anuncio mostrado: el reproductor sigue en su estado normal.
        listOf(interstitial, nativeBanner, nativeOverlay).forEach {
            it.addInstructions(0, "return-void")
        }
    }
}
