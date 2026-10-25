package app.template.patches.wemuslim.layout

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_WEMUSLIM
import app.template.patches.wemuslim.misc.encryption.bypassNativeEncryptionPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val INFO_STREAM_UNIT = "Lcom/fyxtech/muslim/protobuf/InfoStreamProto\$InfoStreamUnit;"
private const val VIP_CARD_VIEW = "Lcom/fyxtech/muslim/about/module/main/VipCardView;"

// The two membership upsells outside ad slots. The "Join Membership to remove ads" placeholders,
// the "remove ads" chips and the ignore-ad dialog live inside the ad views (libads layouts), so
// Disable ads already keeps them from being inflated. Member badges next to user names
// (imgPremium, image_vip) are identity marks, not upsells, and are kept. The points store's
// member-price rows and the subscription page itself are left alone.
@Suppress("unused")
val hidePremiumBannersPatch = bytecodePatch(
    name = "Hide premium banners",
    description = "Hides the membership banners.",
) {
    compatibleWith(COMPATIBILITY_WEMUSLIM)

    dependsOn(bypassNativeEncryptionPatch)

    execute {
        // 1. Home feed: the server sends the membership offer card ("Join Membership", "Enjoy an
        // ad-free experience", discount price and countdown; MembershipGuideSubViewHolder) as an
        // InfoStreamUnit with its membership_info field set. The stream builder checks the
        // protobuf accessor in a chain of has* branches and drops a unit that matches none, so
        // answering false removes the card without a gap. Nothing else reads the accessor.
        val streamUnit = mutableClassDefByOrNull(INFO_STREAM_UNIT)
            ?: throw PatchException("Hide premium banners: $INFO_STREAM_UNIT not found")
        streamUnit.methods.singleOrNull {
            it.name == "hasMembershipInfo" && it.returnType == "Z" &&
                it.parameterTypes.isEmpty() && it.implementation != null
        }?.returnEarly(false)
            ?: throw PatchException("Hide premium banners: no $INFO_STREAM_UNIT->hasMembershipInfo()Z")

        // 2. Me screen: the membership card (VipCardView, a custom FrameLayout the layout names,
        // so R8 keeps it) is GONE from construction on, and any later setVisibility the screen
        // makes is turned into GONE. The rest of the header and the menu below are untouched.
        val vipCard = mutableClassDefByOrNull(VIP_CARD_VIEW)
            ?: throw PatchException("Hide premium banners: $VIP_CARD_VIEW not found")
        val superclass = vipCard.superclass ?: throw PatchException("Hide premium banners: VipCardView has no superclass")

        val existing = vipCard.methods.firstOrNull {
            it.name == "setVisibility" && it.parameterTypes.map(CharSequence::toString) == listOf("I") &&
                it.implementation != null
        }
        if (existing != null) {
            existing.addInstructions(0, "const/16 p1, 0x8")
        } else {
            vipCard.methods.add(
                ImmutableMethod(
                    VIP_CARD_VIEW,
                    "setVisibility",
                    listOf(ImmutableMethodParameter("I", null, null)),
                    "V",
                    AccessFlags.PUBLIC.value,
                    null,
                    null,
                    MutableMethodImplementation(2),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            const/16 p1, 0x8
                            invoke-super {p0, p1}, $superclass->setVisibility(I)V
                            return-void
                        """.trimIndent(),
                    )
                },
            )
        }

        // Every constructor ends by hiding the card. p1 (the Context) is no longer read at a
        // return-void, so it carries the GONE value.
        val constructors = vipCard.methods.filter {
            it.name == "<init>" && it.implementation != null &&
                it.parameterTypes.firstOrNull()?.toString() == "Landroid/content/Context;"
        }
        if (constructors.isEmpty()) throw PatchException("Hide premium banners: VipCardView has no (Context, ...) constructor")
        for (constructor in constructors) {
            // p0 sits below the parameter registers (J/D take two); the Context is p0 + 1.
            val parameterRegisters = constructor.parameterTypes.sumOf { if (it.toString() in setOf("J", "D")) 2 else 1 }
            val contextRegister = constructor.implementation!!.registerCount - parameterRegisters
            if (contextRegister > 15) {
                throw PatchException("Hide premium banners: ${constructor.name} Context register v$contextRegister is out of invoke range")
            }
            val returns = constructor.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
            if (returns.isEmpty()) throw PatchException("Hide premium banners: VipCardView constructor has no return-void")
            // Descending, so an insert never shifts an index still to be visited.
            for (index in returns.reversed()) {
                constructor.addInstructions(
                    index,
                    """
                        const/16 p1, 0x8
                        invoke-virtual {p0, p1}, $VIP_CARD_VIEW->setVisibility(I)V
                    """.trimIndent(),
                )
            }
        }
    }
}
