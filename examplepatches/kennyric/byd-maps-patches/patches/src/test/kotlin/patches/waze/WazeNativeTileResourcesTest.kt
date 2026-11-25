package patches.waze

import java.nio.file.Files
import org.junit.Assert.*
import org.junit.Test

class WazeNativeTileResourcesTest {
    @Test fun armV7MonolithicKeepsItsOnlyNativeAbi() {
        val root = Files.createTempDirectory("waze-armv7").toFile()
        try {
            val engine = root.resolve("lib/armeabi-v7a/libwaze.so")
            engine.parentFile.mkdirs(); engine.writeBytes(byteArrayOf(1,2,3))
            bindWazeNativeAssets(root) { it.toByteArray() }
            assertArrayEquals(byteArrayOf(1,2,3), engine.readBytes())
            assertFalse(root.resolve("lib/arm64-v8a").exists())
            assertTrue(root.resolve("assets/waze-native/arm64-v8a/libwaze_tile_cameras.so").isFile)
        } finally { root.deleteRecursively() }
    }

    @Test fun splitBaseDoesNotAcquireAnAbiAndRejectsConflictingAssets() {
        val root = Files.createTempDirectory("waze-split-base").toFile()
        try {
            bindWazeNativeAssets(root) { it.toByteArray() }
            assertFalse(root.resolve("lib").exists())
            assertTrue(root.resolve("assets/licenses/waze-native-shadowhook.txt").isFile)
            assertThrows(IllegalStateException::class.java) { bindWazeNativeAssets(root) { byteArrayOf(42) } }
        } finally { root.deleteRecursively() }
    }

    @Test fun unknownArm64EngineDoesNotReceiveObserver() {
        val root = Files.createTempDirectory("waze-unknown-arm64").toFile()
        try {
            val engine = root.resolve("lib/arm64-v8a/libwaze.so")
            engine.parentFile.mkdirs(); engine.writeBytes(byteArrayOf(1,2,3))
            bindWazeNativeAssets(root) { error("Unsupported engine must not request observer bytes") }
            assertFalse(root.resolve("assets").exists())
        } finally { root.deleteRecursively() }
    }
}
