package app.jofslash.patches.listonic.premium

import app.jofslash.patches.listonic.shared.Constants.COMPATIBILITY_LISTONIC
import app.jofslash.patches.listonic.shared.dropAddsOfConstant
import app.jofslash.patches.listonic.shared.dropNextAdd
import app.jofslash.patches.listonic.shared.hideComposable
import app.jofslash.patches.listonic.shared.methodWithStrings
import app.jofslash.patches.listonic.shared.methodsWithStrings
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.jofslash.patches.listonic.shared.requireLocalRegisters
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// The R8-renamed classes are found through text they keep. PremiumPromotionData (set id, category,
// texts, end time) is one sale campaign, such as "Black Friday sale! -50%".
internal object PromotionDataToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("PremiumPromotionData(setId="),
)

// The promotion repository: it tags the user as a "FlashSaleUser" for the sale prices.
internal object PromotionRepositoryFingerprint : Fingerprint(
    strings = listOf("FlashSaleUser"),
)

// Onboarding: goes to the screen of a step (Slides, NotificationSoftAsk, Paywall, Main, ...). The
// Paywall step opens the Premium offer with its introductory price.
internal object OnboardingStepFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    strings = listOf("IntroductoryPrice", "No onboarding step "),
)

// The top bar of the lists screen: its Premium badge ("Buy premium -50%").
internal object PremiumBadgeToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("PremiumBadge(state="),
)

// The cards on the profile screen (rate the app, Premium, rewards), as Compose's trace names it.
internal const val PROFILE_CAROUSEL = "com.l.shared.ui.user.profile.Carousel (ProfileScreenContent.kt:566)"

// The route name of the onboarding's Premium offer (with its introductory price).
private const val INTRODUCTORY_PRICE = "IntroductoryPrice"

// The profile's "Discover Premium benefits" section.
private const val PROFILE_PREMIUM_BENEFITS = "com.l.shared.ui.user.profile.PremiumBenefits (ProfileScreenContent.kt:803)"

// The settings screen's PREMIUM section (Remove ads, Explore Premium, Get perks for free).
private const val SETTINGS_PREMIUM_SECTION = "com.l.shared.ui.settings.settings.PremiumSection (SettingsScreen.kt:577)"

@Suppress("unused")
val hidePremiumOffersPatch = bytecodePatch(
    name = "Hide Premium offers",
    description = "Hides the Premium offers that show up by themselves: the sale campaigns (such as \"Black " +
            "Friday sale! -50%\") on the lists screen and the Premium offer that opens after the first start. " +
            "Premium itself, its features and the offers you open yourself stay.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_LISTONIC)

    execute {
        val promotionData = PromotionDataToStringFingerprint.method.definingClass
        val repository = PromotionRepositoryFingerprint.method.definingClass

        // The step that hands the current campaign to the screens (or null when there is none) is a
        // coroutine created with (campaign, repository, continuation). Start it with no campaign.
        val emitters = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.methods.any { method ->
                    method.name == "<init>" && method.parameterTypes.size == 3 &&
                            method.parameterTypes[0].toString() == promotionData &&
                            method.parameterTypes[1].toString() == repository
                }) emitters += classDef.type
        }
        if (emitters.size != 1) throw PatchException("Expected one promotion emitter, found ${emitters.size}")

        mutableClassDefBy(emitters.single()).methods.single { method ->
            method.name == "<init>" && method.parameterTypes.size == 3 &&
                    method.parameterTypes[0].toString() == promotionData
        }.addInstructions(0, "const/4 p1, 0x0")

        // goToStep(navigator, step): for the Paywall step, go on as for the Main step, which calls the
        // navigator's only no-argument void method (finish the onboarding).
        OnboardingStepFingerprint.method.apply {
            if (parameterTypes.size != 2) throw PatchException("Unexpected onboarding step method $definingClass->$name")
            val navigator = parameterTypes[0].toString()
            val finish = mutableClassDefBy(navigator).methods.singleOrNull {
                it.returnType == "V" && it.parameterTypes.isEmpty() && AccessFlags.ABSTRACT.isSet(it.accessFlags)
            } ?: throw PatchException("Expected one finish method in $navigator")
            requireLocalRegisters(2)
            addInstructions(
                0,
                """
                    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;
                    move-result-object v0
                    const-string v1, "Paywall"
                    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :step
                    invoke-interface {p0}, $navigator->${finish.name}()V
                    return-void
                    :step
                    nop
                """
            )

            // Elsewhere the onboarding opens the same offer on its own: from the slides when there is
            // no notification step, and once more after the first start, through a callback. Each
            // builds the route PremiumRoute("IntroductoryPrice") and hands it on right after. Finish
            // the onboarding instead of navigating, and drop the callback.
            var changed = 0
            methodsWithStrings(INTRODUCTORY_PRICE).forEach { method ->
                val instructions = method.implementation!!.instructions.toList()
                instructions.withIndex().filter { (_, insn) ->
                    (insn.opcode == Opcode.CONST_STRING || insn.opcode == Opcode.CONST_STRING_JUMBO) &&
                            ((insn as ReferenceInstruction).reference as StringReference).string == INTRODUCTORY_PRICE
                }.forEach { (stringIndex, _) ->
                    val init = (stringIndex + 1..minOf(stringIndex + 12, instructions.lastIndex)).firstOrNull {
                        instructions[it].isInvoke() && instructions[it].method().name == "<init>"
                    } ?: return@forEach // a comparison, not a route
                    val call = (init + 1 until instructions.size).first {
                        instructions[it].isInvoke() && instructions[it].method().name != "<init>"
                    }
                    val insn = instructions[call]
                    val target = insn.method()
                    when {
                        insn.opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) &&
                                target.parameterTypes.firstOrNull()?.toString() == navigator -> {
                            val register = when (insn) {
                                is Instruction35c -> insn.registerC
                                is Instruction3rc -> insn.startRegister
                                else -> throw PatchException("Unexpected navigation call in ${method.definingClass}")
                            }
                            method.replaceInstruction(
                                call,
                                "invoke-interface/range {v$register .. v$register}, $navigator->${finish.name}()V"
                            )
                            changed++
                        }
                        insn.opcode in setOf(Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE) -> {
                            method.replaceInstruction(call, "nop")
                            if (instructions.getOrNull(call + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT) {
                                method.replaceInstruction(call + 1, "nop")
                            }
                            changed++
                        }
                    }
                }
            }
            if (changed < 2) throw PatchException("Expected the onboarding's Premium offer in more places, found $changed")
        }
    }
}

private fun Instruction.isInvoke() = opcode.name.startsWith("invoke-")
private fun Instruction.method() = (this as ReferenceInstruction).reference as MethodReference

private fun BytecodePatchContext.hidePremiumBadge() {
    // The lists screen's top bar icons are built as [PremiumBadge(state), Rewards]: leave the badge out.
    val badge = PremiumBadgeToStringFingerprint.method.definingClass
    var dropped = 0
    val builders = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.methods.any { method ->
                method.implementation?.instructions?.any { insn ->
                    insn.opcode == Opcode.NEW_INSTANCE &&
                            ((insn as ReferenceInstruction).reference as TypeReference).type == badge
                } == true
            }) builders += classDef.type
    }
    builders.forEach { type ->
        mutableClassDefBy(type).methods.forEach { method ->
            val news = method.implementation?.instructions?.withIndex()?.filter { (_, insn) ->
                insn.opcode == Opcode.NEW_INSTANCE &&
                        ((insn as ReferenceInstruction).reference as TypeReference).type == badge
            }?.map { it.index } ?: return@forEach
            news.reversed().forEach { method.dropNextAdd(it); dropped++ }
        }
    }
    if (dropped == 0) throw PatchException("Couldn't find where the Premium badge is added")
}

@Suppress("unused")
val hidePremiumButtonsPatch = bytecodePatch(
    name = "Hide Premium buttons",
    description = "Hides the \"Buy premium\" button in the lists screen's top bar, the \"Remove ads, Upgrade " +
            "now!\" card and the \"Discover Premium benefits\" section on the profile screen, and the PREMIUM " +
            "section of the settings. A subscription is managed in Google Play.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_LISTONIC)

    execute {
        hidePremiumBadge()

        // Profile cards: Carousel(..., isPremium, ...) adds the Premium card when you have no Premium.
        methodWithStrings(PROFILE_CAROUSEL).dropAddsOfConstant("Premium")

        hideComposable(SETTINGS_PREMIUM_SECTION)
        hideComposable(PROFILE_PREMIUM_BENEFITS)
    }
}
