package patches.waze

import app.morphe.patcher.patch.resourcePatch
import java.io.File
import java.security.MessageDigest

/** Bind assets without adding an ABI to a monolithic or split-base APK. */
internal fun bindWazeNativeAssets(root: File, resource: (String) -> ByteArray) {
    val engine = root.resolve("lib/arm64-v8a/libwaze.so")
    if (engine.isFile) {
        val digest = MessageDigest.getInstance("SHA-256").digest(engine.readBytes())
            .joinToString("") { "%02x".format(it.toInt() and 255) }
        if (digest != "72a28430c1fe2f0b5939141bd92c3b7000af8e64fb366f96bf4a47cd6d478e1e") return
    }
    // A true split base has no engine. Its actual installed ARM64 split is checked at runtime.
    val assets = root.resolve("assets/waze-native/arm64-v8a")
    val names = listOf("libshadowhook.so", "libshadowhook_nothing.so", "libwaze_tile_cameras.so")
    val resources = names.associateWith { resource("/waze/native/arm64-v8a/$it") }
    for ((name, bytes) in resources) {
        val target = assets.resolve(name)
        check(!target.exists() || target.readBytes().contentEquals(bytes)) { "Conflicting native Waze observer asset: $name" }
    }
    val license = resource("/waze/native-shadowhook-license.txt")
    check(assets.isDirectory || assets.mkdirs()) { "Native Waze observer assets unavailable" }
    for ((name, bytes) in resources) assets.resolve(name).writeBytes(bytes)
    val notice = root.resolve("assets/licenses/waze-native-shadowhook.txt")
    notice.parentFile.mkdirs()
    notice.writeBytes(license)
}

internal val wazeNativeTileResources = resourcePatch {
    execute {
        bindWazeNativeAssets(get(".")) { path ->
            checkNotNull(object {}.javaClass.getResourceAsStream(path)) { "Missing native Waze observer resource: $path" }
                .use { it.readBytes() }
        }
    }
}
