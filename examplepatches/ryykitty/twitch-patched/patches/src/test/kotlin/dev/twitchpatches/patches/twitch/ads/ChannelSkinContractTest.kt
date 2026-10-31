package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Test

class ChannelSkinContractTest {
    private fun method(owner: String, name: String, parameters: List<String>, returns: String, body: String) =
        ImmutableMethod(owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns,
            AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(parameters.size + 3)).toMutable().apply {
            addInstructionsWithLabels(0, body)
        }

    private fun type(name: String, parent: String = "Ljava/lang/Object;", methods: List<Method> = emptyList(),
        fields: List<ImmutableField> = emptyList()) =
        ImmutableClassDef(name, AccessFlags.PUBLIC.value, parent, null, null, null, fields, methods)

    private fun model(name: String, text: String, parent: String = "Ljava/lang/Object;") =
        type(name, parent, listOf(method(name, "toString", emptyList(), "Ljava/lang/String;", """
            const-string v0, "$text"
            return-object v0
        """)))

    private fun fixture(container: String = "Landroid/view/ViewGroup;", internalHide: Boolean = false) = listOf(
        model("LSkin;", "ChannelSkin(campaignID="),
        model("LContext;", "ChannelSkinRenderContext(hasTurbo="),
        model("LShowing;", "Showing(avatarURL=", "LState;"),
        type("LHidden;", "LState;", fields = listOf(ImmutableField("LHidden;", "INSTANCE", "LHidden;",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, null))),
        type("LBanner;", "Ltv/twitch/android/core/mvp/viewdelegate/BaseViewDelegate;", listOf(
            method("LBanner;", "render", listOf("LSkin;", "LContext;", "LAction;", "LAction;", "LAction;"), "V", """
                check-cast v0, Landroid/widget/FrameLayout;
                invoke-virtual {v0, v1}, $container->addView(Landroid/view/View;)V
                ${if (internalHide) "invoke-virtual {p0}, LBanner;->hide()V" else ""}
                return-void
            """),
            method("LBanner;", "hide", emptyList(), "V", """
                invoke-virtual {v0, v1}, $container->removeView(Landroid/view/View;)V
                return-void
            """)
        )),
        type("LHeader;", methods = listOf(method("LHeader;", "render", listOf("LMetadata;",
            "Ltv/twitch/android/models/channel/ChannelModel;", "LStories;", "LState;"), "V", """
                invoke-virtual {v0, v1, v2}, Ltv/twitch/android/feature/channelskins/ChannelSkinsCreatorBrandView;->bind(Ljava/lang/String;Ljava/lang/String;)V
                return-void
            """)))
    )

    @Test fun resolvesInheritedViewGroupMethodsOnFrameLayoutReceiver() {
        val contract = channelSkinContract(fixture())
        assertEquals("LBanner;", contract.banner.definingClass)
        assertEquals("hide", contract.hide.name)
        assertEquals("LHeader;", contract.header.definingClass)
        assertEquals("LHidden;", contract.hidden.type)
    }

    @Test(expected = PatchException::class) fun rejectsAnUnrelatedContainerWithMatchingMethodNames() {
        channelSkinContract(fixture(container = "LUnrelated;"))
    }

    @Test(expected = IllegalArgumentException::class) fun rendererCannotClearItsSavedStateThroughRemoval() {
        channelSkinContract(fixture(internalHide = true))
    }
}
