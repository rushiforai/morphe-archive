package io.github.sabopura.morphe.patches.twitch.ads

import com.android.tools.smali.dexlib2.iface.Method
import java.lang.reflect.Proxy
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class AdCueRouteTest {
    private fun method(name: String, returns: String, vararg params: String): Method {
        val map = mapOf("getName" to name, "getReturnType" to returns, "getParameterTypes" to params.toList())
        return Proxy.newProxyInstance(Method::class.java.classLoader, arrayOf(Method::class.java)) { _, m, _ ->
            check(map.containsKey(m.name)) { "Unexpected ${m.name}" }; map[m.name]
        } as Method
    }

    @Test fun acceptsTheRouteBeforeAndAfter32() {
        assertTrue(isAdCueRoute(method("route", "V", "Ljava/lang/String;")))
        assertTrue(isAdCueRoute(method("route", "V", "Ljava/lang/String;", "Z")))
    }

    @Test fun rejectsOtherShapes() {
        assertFalse(isAdCueRoute(method("reset", "V")))
        assertFalse(isAdCueRoute(method("route", "V")))
        assertFalse(isAdCueRoute(method("route", "Z", "Ljava/lang/String;")))
        assertFalse(isAdCueRoute(method("route", "V", "Ljava/lang/Object;")))
        assertFalse(isAdCueRoute(method("route", "V", "Ljava/lang/String;", "I")))
        assertFalse(isAdCueRoute(method("route", "V", "Z", "Ljava/lang/String;")))
        assertFalse(isAdCueRoute(method("warnMalformedAdCueOnce", "V", "Ljava/lang/String;")))
    }
}
