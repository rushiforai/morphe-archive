package app.template.patches.steamlink.androidxr

import java.security.MessageDigest
import kotlin.test.Test
import kotlin.test.assertEquals

class GxrFacebridgeResourceTest {
    @Test
    fun `bundled bridge is the verified direct Galaxy XR tongue transport build`() {
        val bridge = checkNotNull(
            javaClass.getResourceAsStream("/steamlink/androidxr/libgxr_face_bridge.so"),
        ) { "Missing bundled GXR face bridge" }.use { it.readBytes() }

        val sha256 = MessageDigest.getInstance("SHA-256")
            .digest(bridge)
            .joinToString("") { "%02x".format(it) }

        // gxr-face-bridge bce6c5ba89ac4fd892fd42dc30df2c1f23a246d4:
        // Android face weights 0..67 are copied directly into FB2 transport slots.
        assertEquals(
            "128124e4ed189d233a5969901c3cf97260bd420d6a038b084fccf2794919f38c",
            sha256,
        )
    }
}
