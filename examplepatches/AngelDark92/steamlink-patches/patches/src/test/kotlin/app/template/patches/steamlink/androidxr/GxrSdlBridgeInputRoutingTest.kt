package app.template.patches.steamlink.androidxr

import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFalse

class GxrSdlBridgeInputRoutingTest {
    private val bridge = requireNotNull(
        javaClass.getResource(
            "/steamlink/androidxr/smali/org/libsdl/app/GxrSdlBridge.smali",
        ),
    ).readText()

    @Test
    fun `5001712 wrappers suppress synthetic pad and retain mouse routing`() {
        val touchWrapper = method(
            "public static routeXrPointerAsMouse5001712(Landroid/view/MotionEvent;)V",
        )
        val genericWrapper = method(
            "public static routeXrPointerAsMouseGeneric5001712(Landroid/view/MotionEvent;)V",
        )
        val syntheticPad = method("public static sendGxrSyntheticPad(Z)Z")

        assertContains(touchWrapper, "->sGxrMouseOnly5001712:Z")
        assertContains(touchWrapper, "->routeXrPointerAsMouse(Landroid/view/MotionEvent;)V")
        assertContains(genericWrapper, "->sGxrMouseOnly5001712:Z")
        assertContains(genericWrapper, "->routeXrPointerAsMouseGeneric(Landroid/view/MotionEvent;)V")

        val legacyGuard = syntheticPad.substringBefore("\n    :gxr_modern_sdl_api")
        assertContains(legacyGuard, "->sGxrMouseOnly5001712:Z")
        assertContains(legacyGuard, "const/4 v0, 0x0")
        assertContains(legacyGuard, "return v0")
        assertFalse(bridge.contains("sendGxrSyntheticPad5001712"))
        assertFalse(bridge.contains("SDL 2.0.20 PAD_A"))
    }

    @Test
    fun `modern routes retain synthetic pad and mouse events`() {
        val touchRoute = method("public static routeXrPointerAsMouse(Landroid/view/MotionEvent;)V")
        val genericRoute = method(
            "public static routeXrPointerAsMouseGeneric(Landroid/view/MotionEvent;)V",
        )
        val syntheticPad = method("public static sendGxrSyntheticPad(Z)Z")

        assertContains(touchRoute, "->sendGxrSyntheticPad(Z)Z")
        assertContains(touchRoute, "->onNativeMouse(IIFFZ)V")
        assertContains(genericRoute, "->sendGxrSyntheticPad(Z)Z")
        assertContains(genericRoute, "->onNativeMouse(IIFFZ)V")
        assertContains(
            syntheticPad,
            "->nativeAddJoystick(ILjava/lang/String;Ljava/lang/String;IIIIIIZZZZ)V",
        )
        assertContains(syntheticPad, "->onNativePadDown(III)Z")
        assertContains(syntheticPad, "->onNativePadUp(III)Z")
    }

    @Test
    fun `only exact 2_0_20 5001712 dispatches through mouse-only wrappers`() {
        assertEquals(
            XrPointerRouteMethods(
                touch = "routeXrPointerAsMouse5001712",
                generic = "routeXrPointerAsMouseGeneric5001712",
            ),
            xrPointerRouteMethodsFor("2.0.20", "5001712"),
        )

        val retainedBuilds = listOf(
            "2.0.20" to "5001740",
            "2.0.22" to "5002172",
            "2.0.22" to "5002206",
            "2.0.22" to "5002244",
            "2.0.22" to "5002296",
            "2.0.22" to "5002313",
            "2.0.22" to "5002318",
            "2.0.22" to "5002322",
        )
        retainedBuilds.forEach { (versionName, versionCode) ->
            assertEquals(
                XrPointerRouteMethods(
                    touch = "routeXrPointerAsMouse",
                    generic = "routeXrPointerAsMouseGeneric",
                ),
                xrPointerRouteMethodsFor(versionName, versionCode),
                "$versionName/$versionCode",
            )
        }
    }

    private fun method(signature: String): String {
        val start = bridge.indexOf(".method $signature")
        require(start >= 0) { "Missing method: $signature" }
        val end = bridge.indexOf(".end method", start)
        require(end >= 0) { "Unterminated method: $signature" }
        return bridge.substring(start, end + ".end method".length)
    }
}
