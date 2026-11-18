package io.github.sabopura.morphe.patches.twitch.player

import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import java.lang.reflect.Proxy
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class VodCommentsProviderTest {
    private inline fun <reified T> fixture(vararg values: Pair<String, Any?>): T {
        val map = values.toMap()
        return Proxy.newProxyInstance(T::class.java.classLoader, arrayOf(T::class.java)) { _, method, _ ->
            check(map.containsKey(method.name)) { "Unexpected ${method.name}" }; map[method.name]
        } as T
    }

    private val code = fixture<MethodImplementation>()
    private fun method(name: String, returns: String, vararg params: String, abstract: Boolean = false) = fixture<Method>(
        "getName" to name, "getReturnType" to returns, "getParameterTypes" to params.toList(),
        "getImplementation" to if (abstract) null else code)
    private fun type(vararg methods: Method) = fixture<ClassDef>("getMethods" to methods.toList())

    private val vod = "Ltv/twitch/android/models/videos/VodModel;"
    private val channel = "Ltv/twitch/android/models/channel/ChannelModel;"
    private fun fetch(name: String = "m", abstract: Boolean = false) =
        method(name, "Lio/reactivex/i;", "I", "Ljava/lang/String;", abstract = abstract)
    private fun setup(name: String = "n", abstract: Boolean = false) = method(name, "V", vod, channel, abstract = abstract)

    @Test fun findsTheProviderWhateverItsMethodsAreCalled() {
        assertTrue(isVodCommentsProvider(type(method("<init>", "V"), fetch("m"), setup("n"))))  // 31.9.0
        assertTrue(isVodCommentsProvider(type(method("<init>", "V"), fetch("r"), setup("s"))))  // 32.0.0
    }

    @Test fun ignoresTheLambdaThatNowHoldsTheParserName() {
        // 32.0.0: the "parseChommentResponse" reference lives in a merged lambda class.
        assertFalse(isVodCommentsProvider(type(method("<init>", "V"),
            method("invoke", "Ljava/lang/Object;", "Ljava/lang/Object;"))))
    }

    @Test fun needsBothEntryPointsWithCode() {
        assertFalse(isVodCommentsProvider(type(fetch())))
        assertFalse(isVodCommentsProvider(type(setup())))
        assertFalse(isVodCommentsProvider(type(fetch(abstract = true), setup(abstract = true))))
        assertFalse(isVodCommentsProvider(type(method("m", "Ljava/lang/Object;", "I", "Ljava/lang/String;"), setup())))
        assertFalse(isVodCommentsProvider(type(fetch(), method("n", "V", channel, vod))))
    }

    @Test fun rejectsAmbiguousProviders() {
        assertFalse(isVodCommentsProvider(type(fetch("a"), fetch("b"), setup())))
        assertFalse(isVodCommentsProvider(type(fetch(), setup("a"), setup("b"))))
    }
}
