package app.ahmedyarub.patches.x.hide

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.featureFlagsPatch
import app.ahmedyarub.patches.x.shared.forceFeatureFlag
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.all.misc.resources.ResourceType
import app.morphe.patches.all.misc.resources.getResourceId
import app.morphe.patches.all.misc.resources.resourceMappingPatch
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/** Returns null from a method, reusing its first parameter register, which is not read again. */
private const val RETURN_NULL = """
    const/16 p0, 0x0
    return-object p0
"""

// region Hide promote button

@Suppress("unused")
val hidePromoteButtonPatch = bytecodePatch(
    name = "Hide promote button",
    description = "Hides the Boost button on your posts and the Boost item in their menu.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(featureFlagsPatch)

    // Both the button and the menu item are gated on this one switch.
    execute { forceFeatureFlag("x_lite_quick_promote_enabled", false) }
}

// endregion

// region Remove premium upsell

/** Upsell switches in the manifest that turn something off rather than hide an upsell. */
private val NOT_UPSELLS = setOf(
    "subscriptions_upsells_home_nav_premium_tier_check_enabled",
    "subscriptions_upsells_home_nav_follow_button_enabled",
    "subscriptions_upsells_quick_display_settings",
)

private var upsellSwitches: List<String> = emptyList()

/** The boolean upsell switches, from the defaults the app ships with. */
private val upsellSwitchesPatch = resourcePatch {
    execute {
        val manifest = get("res/raw/feature_switch_manifest").readText()
        upsellSwitches = Regex("\"(subscriptions_upsells_[a-z0-9_]+)\"\\s*:\\s*\\{\\s*\"value\"\\s*:\\s*(true|false)")
            .findAll(manifest)
            .map { it.groupValues[1] }
            .filter { it !in NOT_UPSELLS }
            .toList()
        if (upsellSwitches.isEmpty()) throw PatchException("The feature switch manifest has no upsell switches")
    }
}

/** Builds the Upgrade pill at the top of the home timeline, or nothing. */
private object HomeUpgradePillFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
    strings = listOf("subscriptions_upsells_premium_home_nav_offer_enabled"),
)

private object DrawerFeaturesToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("DrawerFeatures(cardDiscountPercent="),
)

@Suppress("unused")
val removePremiumUpsellPatch = bytecodePatch(
    name = "Remove premium upsell",
    description = "Removes Premium upsells: the Upgrade button on the home timeline, the Premium side bar row, " +
        "and the Get verified cards and prompts.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(featureFlagsPatch, upsellSwitchesPatch)

    execute {
        upsellSwitches.forEach { forceFeatureFlag(it, false) }
        forceFeatureFlag("dm_show_mr_premium_upsell", false)

        // The home timeline shows no pill when this returns null.
        HomeUpgradePillFingerprint.method.addInstructions(0, RETURN_NULL)

        // The side bar's Premium row is drawn for every premium state but Hidden. Every
        // DrawerFeatures is made by one constructor, which is handed the state third.
        val drawerFeatures = DrawerFeaturesToStringFingerprint.classDef
        val constructor = mutableClassDefBy(drawerFeatures).methods.single { method ->
            method.name == "<init>" && method.parameterTypes.size > 3 && method.parameterTypes[0] == "Ljava/lang/Integer;"
        }
        val premiumState = constructor.parameterTypes[2].toString()
        val hidden = classDefBy { classDef ->
            premiumState in classDef.interfaces &&
                classDef.methods.any { method ->
                    method.name == "toString" && method.implementation?.instructions?.any {
                        it.getReference<StringReference>()?.string == "Hidden"
                    } == true
                }
        }
        val hiddenInstance = hidden.fields.single { AccessFlags.STATIC.isSet(it.accessFlags) && it.type == hidden.type }

        constructor.addInstructions(0, "sget-object p3, ${hidden.type}->${hiddenInstance.name}:${hidden.type}")
    }
}

// endregion

// region Hide Banner

/** The alert model; GraphQL fragments of the same name exist outside com.x.models. */
private object ShowAlertToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("TimelineShowAlert("),
    custom = { _, classDef -> classDef.type.startsWith("Lcom/x/models/") },
)

@Suppress("unused")
val hideBannerPatch = bytecodePatch(
    name = "Hide Banner",
    description = "Hides the \"See new posts\" pill at the top of the timeline.",
) {
    compatibleWith(COMPATIBILITY_X)

    execute {
        val alert = ShowAlertToStringFingerprint.classDef.type

        // The pill composable takes the alert and whether it is visible, and shows it with an
        // animated visibility following that.
        fun isPill(method: com.android.tools.smali.dexlib2.iface.Method) =
            AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                method.parameterTypes.take(2).map { it.toString() } == listOf(alert, "Z")

        mutableClassDefBy(classDefBy { classDef -> classDef.methods.any(::isPill) })
            .methods.single(::isPill)
            .addInstructions(0, "const/16 p1, 0x0")
    }
}

// endregion

// region Hide Community Notes

private object CommunityNoteToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("CommunityNote(title="),
)

@Suppress("unused")
val hideCommunityNotesPatch = bytecodePatch(
    name = "Hide Community Notes",
    description = "Hides Community Notes under posts.",
) {
    compatibleWith(COMPATIBILITY_X)

    execute {
        val note = CommunityNoteToStringFingerprint.classDef.type

        // Posts and reposts each hand out their note through one getter; with none, no note is drawn.
        listOf("CanonicalPost(id=", "RePostedPost(canonicalPost=").forEach { prefix ->
            val post = classDefBy { classDef ->
                classDef.methods.any { method ->
                    method.name == "toString" && method.implementation?.instructions?.any {
                        it.getReference<StringReference>()?.string?.startsWith(prefix) == true
                    } == true
                }
            }

            mutableClassDefBy(post).methods.single { method ->
                method.parameterTypes.isEmpty() && method.returnType == note &&
                    !AccessFlags.STATIC.isSet(method.accessFlags)
            }.addInstructions(0, RETURN_NULL)
        }
    }
}

// endregion

// region Hide FAB

@Suppress("unused")
val hideFabPatch = bytecodePatch(
    name = "Hide FAB",
    description = "Hides the floating Post button.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(resourceMappingPatch)

    execute {
        val label = getResourceId(ResourceType.STRING, "tweet_fab_item")

        // Every method that draws a button with the "Post" label, with the button composable it
        // calls. The label is used in more than one place.
        val drawers = mutableListOf<Pair<String, MethodReference>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val labelIndex = instructions.indexOfFirst { (it as? NarrowLiteralInstruction)?.wideLiteral == label }
                if (labelIndex < 0) return@forEach

                instructions.drop(labelIndex).firstNotNullOfOrNull { instruction ->
                    instruction.getReference<MethodReference>()?.takeIf { reference ->
                        (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE) &&
                            reference.parameterTypes.map { it.toString() }.containsAll(
                                listOf("Ljava/lang/String;", "Lkotlin/jvm/functions/Function0;"),
                            )
                    }
                }?.let { drawers += classDef.type to it }
            }
        }

        // The shared FAB composable: in the button's class, it builds the lambda drawing the
        // button and shows it animated. Returning before its group starts draws nothing.
        fun isFab(method: com.android.tools.smali.dexlib2.iface.Method, lambda: String) =
            AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                method.parameterTypes.map { it.toString() } == listOf(
                    "Landroidx/compose/ui/Modifier;", "Lkotlin/jvm/functions/Function0;",
                    "Landroidx/compose/runtime/Composer;", "I", "I",
                ) &&
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == lambda
                } == true

        val (lambda, button) = drawers.singleOrNull { (lambda, button) ->
            classDefBy(button.definingClass).methods.any { isFab(it, lambda) }
        } ?: throw PatchException("Found no floating Post button among ${drawers.size} Post buttons")

        mutableClassDefBy(button.definingClass).methods.single { isFab(it, lambda) }
            .addInstructions(0, "return-void")
    }
}

// endregion

// region Hide badges from navigation bar icons

private object TabDataToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("TabData(badgeCount="),
)

@Suppress("unused")
val hideNavigationBarBadgesPatch = bytecodePatch(
    name = "Hide badges from navigation bar icons",
    description = "Hides the unread counts and dots on the bottom navigation bar.",
) {
    compatibleWith(COMPATIBILITY_X)

    execute {
        // A tab's badge is its count and unread flag, given to its only constructor.
        mutableClassDefBy(TabDataToStringFingerprint.classDef).methods.single { method ->
            method.name == "<init>" && method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "I", "Z")
        }.addInstructions(
            0,
            """
            const/16 p2, 0x0
            const/16 p3, 0x0
            """,
        )
    }
}

// endregion
