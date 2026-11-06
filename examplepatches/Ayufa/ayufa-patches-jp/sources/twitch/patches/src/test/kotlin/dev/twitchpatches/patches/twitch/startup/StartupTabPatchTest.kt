package dev.twitchpatches.patches.twitch.startup

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Test

class StartupTabPatchTest {
    private fun provider(body: String, access: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value) =
        ImmutableMethod("Lsynthetic/Provider;", "b", emptyList<ImmutableMethodParameter>(),
            "Ltv/twitch/android/models/feed/DiscoveryFeedPage;", access, null, null,
            MutableMethodImplementation(8)).toMutable().apply {
            addInstructionsWithLabels(0, body)
        }

    private fun providerBody(configLine: String = "const-string v0, \"default_home_page\"") = """
        $configLine
        const/4 v1, 0x0
        if-eqz v1, :following
        new-instance v2, Ltv/twitch/android/models/feed/DiscoveryFeedPage${'$'}FeedLocationPage;
        sget-object v3, Ltv/twitch/android/models/feed/FeedLocation${'$'}Live;->INSTANCE:Ltv/twitch/android/models/feed/FeedLocation${'$'}Live;
        invoke-direct {v2, v3}, Ltv/twitch/android/models/feed/DiscoveryFeedPage${'$'}FeedLocationPage;-><init>(Ltv/twitch/android/models/feed/FeedLocation;)V
        return-object v2
        :following
        if-eqz v1, :clips
        sget-object v2, Ltv/twitch/android/models/feed/DiscoveryFeedPage${'$'}FollowingPage;->INSTANCE:Ltv/twitch/android/models/feed/DiscoveryFeedPage${'$'}FollowingPage;
        return-object v2
        :clips
        new-instance v2, Ltv/twitch/android/models/feed/DiscoveryFeedPage${'$'}FeedLocationPage;
        sget-object v3, Ltv/twitch/android/models/feed/FeedLocation${'$'}Clips;->INSTANCE:Ltv/twitch/android/models/feed/FeedLocation${'$'}Clips;
        invoke-direct {v2, v3}, Ltv/twitch/android/models/feed/DiscoveryFeedPage${'$'}FeedLocationPage;-><init>(Ltv/twitch/android/models/feed/FeedLocation;)V
        return-object v2
    """

    @Test fun findsEveryPageReturn() {
        val returns = defaultHomePageReturns(provider(providerBody()))
        assertEquals(listOf(6 to 2, 10 to 2, 15 to 2), returns)
    }

    @Test(expected = PatchException::class) fun rejectsAProviderWithoutTheConfigKey() {
        defaultHomePageReturns(provider(providerBody("const-string v0, \"other_key\"")))
    }

    @Test(expected = PatchException::class) fun rejectsAStaticProvider() {
        defaultHomePageReturns(provider(providerBody(),
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value))
    }

    @Test(expected = PatchException::class) fun rejectsAMethodWithoutPageReturns() {
        defaultHomePageReturns(provider("""
            const-string v0, "default_home_page"
            const/4 v1, 0x0
            return-object v1
        """))
    }
}
