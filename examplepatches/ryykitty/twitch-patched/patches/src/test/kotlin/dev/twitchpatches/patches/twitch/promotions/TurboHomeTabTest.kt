package dev.twitchpatches.patches.twitch.promotions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertTrue
import org.junit.Test

class TurboHomeTabTest {
    private fun producer(condition: String = "if-eqz p1, :absent", overwrite: String = "") =
        ImmutableMethod("Lsynthetic/Pages;", "pages", listOf(ImmutableMethodParameter("Z", null, null)),
            "Ljava/util/List;", AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(4)).toMutable().apply {
            addInstructionsWithLabels(0, """
                sget-object v0, Ltv/twitch/android/models/feed/DiscoveryFeedPage${'$'}FollowingPage;->INSTANCE:Ltv/twitch/android/models/feed/DiscoveryFeedPage${'$'}FollowingPage;
                $overwrite
                $condition
                sget-object v1, Ltv/twitch/android/models/feed/DiscoveryFeedPage${'$'}TurboPage;->INSTANCE:Ltv/twitch/android/models/feed/DiscoveryFeedPage${'$'}TurboPage;
                invoke-static {v1}, Lsynthetic/Lists;->singleton(Ljava/lang/Object;)Ljava/util/List;
                move-result-object v1
                goto :join
                :absent
                sget-object v1, Lsynthetic/Empty;->INSTANCE:Lsynthetic/Empty;
                :join
                invoke-static {v0, v1}, Lsynthetic/Lists;->join(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
                move-result-object v0
                return-object v0
            """)
        }

    @Test fun resolvesTheParameterGateWithoutFixedOffsets() { assertTrue(validateTurboTabProducer(producer()) > 0) }

    @Test(expected = PatchException::class) fun reversedConditionCannotHideTheWrongTabs() {
        validateTurboTabProducer(producer("if-nez p1, :absent"))
    }

    @Test(expected = PatchException::class) fun rewrittenParameterCannotBeTreatedAsAnInputGate() {
        validateTurboTabProducer(producer(overwrite = "const/4 p1, 0"))
    }
}
