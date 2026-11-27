package app.jimaku.patches

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class HostCheckTest {
    /** Every required method, as Morphe Patches declares it. */
    private fun complete(): Map<String, MutableList<HostMethod>> = REQUIRED_HOST_METHODS.mapValues { (_, signatures) ->
        signatures.map { method(it) }.toMutableList()
    }

    private fun method(signature: String, isPublicStatic: Boolean = true): HostMethod {
        val name = signature.substringBefore('(')
        val parameters = Regex("""\[*(?:L[^;]+;|[ZBCSIJFD])""").findAll(signature.substringAfter('(').substringBefore(')'))
            .map { it.value }.toList()
        return HostMethod(name, parameters, signature.substringAfter(')'), isPublicStatic)
    }

    private fun check(classes: Map<String, List<HostMethod>>) = missingHostMethods(REQUIRED_HOST_METHODS) { classes[it] }

    @Test
    fun passesWhenEveryMethodIsThere() {
        val classes = complete()
        classes.getValue("Lapp/morphe/extension/youtube/addon/AddOnApi;").add(method("addLegacyPlayerControlsListener(Ljava/util/function/Consumer;)V"))
        assertEquals(emptyList<String>(), check(classes))
    }

    @Test
    fun namesAMissingMethod() {
        val classes = complete()
        classes.getValue("Lapp/morphe/extension/youtube/patches/VideoInformation;").removeAll { it.name == "getVideoTime" }
        assertEquals(listOf("app.morphe.extension.youtube.patches.VideoInformation.getVideoTime()J"), check(classes))
    }

    @Test
    fun namesAMethodWhoseSignatureChanged() {
        val classes = complete()
        val api = classes.getValue("Lapp/morphe/extension/youtube/addon/AddOnApi;")
        api.removeAll { it.name == "addVideoTimeListener" }
        api.add(method("addVideoTimeListener(Ljava/util/function/Consumer;)V"))
        assertEquals(listOf("app.morphe.extension.youtube.addon.AddOnApi.addVideoTimeListener(Ljava/util/function/LongConsumer;)V"), check(classes))
    }

    @Test
    fun namesAMethodThatIsNoLongerPublicStatic() {
        val classes = complete()
        val type = classes.getValue("Lapp/morphe/extension/youtube/shared/PlayerType;")
        type.replaceAll { method(it.signature, isPublicStatic = false) }
        assertEquals(listOf("app.morphe.extension.youtube.shared.PlayerType.getCurrent()Lapp/morphe/extension/youtube/shared/PlayerType;"), check(classes))
    }

    @Test
    fun namesAMissingClass() {
        val classes = complete() - "Lapp/morphe/extension/youtube/shared/PlayerControlsVisibility;"
        assertEquals(listOf("app.morphe.extension.youtube.shared.PlayerControlsVisibility"), check(classes))
    }

    @Test
    fun theMessageSaysToApplyMorphesPatches() {
        val message = hostIncompatibleMessage(listOf("app.morphe.extension.youtube.addon.AddOnManager"))
        assertTrue(message, message.contains("Morphe's YouTube patches"))
        assertTrue(message, message.endsWith("app.morphe.extension.youtube.addon.AddOnManager"))
    }
}
