package io.github.sabopura.morphe.patches.twitch.ui

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import java.lang.reflect.Proxy
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class NativeTheatreTest {
    private val decision = "Ltv/twitch/android/feature/discovery/feed/rn/theatre/RNTheatreRouteDecision;"

    private inline fun <reified T> fixture(vararg values: Pair<String, Any?>): T {
        val map = values.toMap()
        return Proxy.newProxyInstance(T::class.java.classLoader, arrayOf(T::class.java)) { _, method, _ ->
            check(map.containsKey(method.name)) { "Unexpected ${method.name}" }; map[method.name]
        } as T
    }

    private fun enum(vararg names: String, type: String = decision) = fixture<ClassDef>(
        "getFields" to names.map { fixture<Field>("getName" to it, "getType" to type) } +
            fixture<Field>("getName" to "\$VALUES", "getType" to "[$decision"))

    @Test fun findsTheRefusalBefore31_9() {
        assertEquals("RefuseUltralightOff", ultralightRefusal(enum("RefuseNotLiveChannel", "RefuseUltralightOff", "Route")))
    }

    @Test fun findsTheRenamedRefusalFrom31_9() {
        assertEquals("RefuseUltralightUnsupported",
            ultralightRefusal(enum("RefuseSkyline", "RefuseUltralightUnsupported", "Route")))
    }

    @Test fun failsWhenTheRefusalIsGoneOrAmbiguous() {
        assertThrows(PatchException::class.java) { ultralightRefusal(enum("RefuseSkyline", "Route")) }
        assertThrows(PatchException::class.java) {
            ultralightRefusal(enum("RefuseUltralightOff", "RefuseUltralightUnsupported", "Route"))
        }
        assertThrows(PatchException::class.java) { ultralightRefusal(enum("RefuseUltralightOff", type = "Lother;")) }
    }
}
