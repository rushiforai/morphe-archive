/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.mygate.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.string
import app.morphe.patches.mygate.shared.Constants.COMPATIBILITY_MYGATE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val removeAdsPatch = patch(
    name = "Remove ads",
    description = "Removes banner ads, sponsored cards, ad SDK loaders, and neutralizes the VIP crown icon.",
) {
    compatibleWith(COMPATIBILITY_MYGATE)

    execute {
        // ── 1. MygateAdLoader entry points — short-circuit every ad load call ─────────
        listOf(
            // loadAd() — pre-approval, allow-entries, activity-feed popup
            Fingerprint(
                definingClass = "Lcom/mygate/adsdk/MygateAdLoader;",
                name = "loadAd",
                returnType = "V",
                parameters = listOf(
                    "Landroid/widget/ImageView;",
                    "Lcom/mygate/adsdk/ScratchView;",
                    "Landroid/widget/TextView;",
                    "Landroid/widget/FrameLayout;",
                ),
            ),
            // loadGlobalMastheadAd() — visitor profile card masthead
            Fingerprint(
                definingClass = "Lcom/mygate/adsdk/MygateAdLoader;",
                name = "loadGlobalMastheadAd",
                returnType = "V",
                parameters = listOf("Landroid/widget/ImageView;"),
            ),
            // loadImageAd() — dashboard image/spotlight ad
            Fingerprint(
                definingClass = "Lcom/mygate/adsdk/MygateAdLoader;",
                name = "loadImageAd",
                returnType = "V",
                parameters = listOf("Landroid/widget/ImageView;", "I", "I"),
            ),
            // getMyGateAdData (4-param) — background ad fetch
            Fingerprint(
                definingClass = "Lcom/mygate/adsdk/MygateAdLoader;",
                name = "getMyGateAdData",
                returnType = "V",
                parameters = listOf(
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                    "Lcom/mygate/adsdk/utils/MygateAdDataListener;",
                    "Z",
                ),
            ),
            // getMyGateAdData (7-param) — extended background ad fetch
            Fingerprint(
                definingClass = "Lcom/mygate/adsdk/MygateAdLoader;",
                name = "getMyGateAdData",
                returnType = "V",
                parameters = listOf(
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                    "Lcom/mygate/adsdk/utils/MygateAdDataListener;",
                    "Z",
                    "Z",
                ),
            ),
            // getMyGateMultiAdData — multi-ad carousel
            Fingerprint(
                definingClass = "Lcom/mygate/adsdk/MygateAdLoader;",
                name = "getMyGateMultiAdData",
                returnType = "V",
                parameters = listOf(
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                    "Lcom/mygate/adsdk/utils/MygateAdDataListener;",
                    "Z",
                    "Z",
                ),
            ),
            // FloatingBannerAdHandler — floating bottom-sheet banner ads
            Fingerprint(
                definingClass = "Lcom/mygate/adsdk/ads/FloatingBannerAdHandler;",
                name = "loadAd",
                returnType = "V",
                parameters = listOf("Ljava/lang/String;", "Z"),
            ),
            Fingerprint(
                definingClass = "Lcom/mygate/adsdk/ads/FloatingBannerAdHandler;",
                name = "loadViews",
                returnType = "V",
                parameters = emptyList(),
            ),
            Fingerprint(
                definingClass = "Lcom/mygate/adsdk/ads/FloatingBannerAdHandler;",
                name = "showAd",
                returnType = "V",
                parameters = emptyList(),
            ),
            // NotificationEngine approval alert / creative request -> no-op
            Fingerprint(
                definingClass = "Lcom/mygate/user/modules/notifications/engine/NotificationEngine;",
                name = "c",
                returnType = "V",
                parameters = listOf(
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                ),
            ),
        ).forEach { it.method.addInstructions(0, "return-void") }

        // ── 2. Base ad URLs -> point to localhost sinkhole ───────────────────────────
        val sinkhole = "const-string v0, \"http://127.0.0.1:9/\"\nreturn-object v0"
        listOf("getBASE_URL", "getMETRIC_BASE_URL").forEach { name ->
            Fingerprint(
                definingClass = "Lcom/mygate/adsdk/MygateAdSdk;",
                name = name,
                returnType = "Ljava/lang/String;",
                parameters = emptyList(),
            ).method.addInstructions(0, sinkhole)
        }

        // ── 3. Disable ad SDK flags on Flat & UserInfo ────────────────────────────────
        val returnZero = "const-string v0, \"0\"\nreturn-object v0"
        listOf(
            "Lcom/mygate/user/modules/flats/entity/Flat;" to "getHomePageEnableAdSdk",
            "Lcom/mygate/user/modules/flats/entity/Flat;" to "getNotificationEnableAdSdk",
            "Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;" to "getHomePageEnableAdSdk",
            "Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;" to "getNotificationEnableAdSdk",
        ).forEach { (className, methodName) ->
            Fingerprint(
                definingClass = className,
                name = methodName,
                returnType = "Ljava/lang/String;",
                parameters = emptyList(),
            ).method.addInstructions(0, returnZero)
        }

        // ── 4. Clean up XML ad layouts & floating banner ad container ─────────────────
        resourceXml("res/layout/advertisement.xml").use { xml ->
            xml.elements().forEach { element ->
                val id = element.attribute("android:id")
                if (id == "@id/brand_details_layout" || id == "@id/second_submit" || id == "@id/disclaimer" || id == "@id/second_layout") {
                    element.setAttribute("android:visibility", "gone")
                    element.setAttribute("android:layout_width", "0.0dp")
                    element.setAttribute("android:layout_height", "0.0dp")
                }
            }
        }
        resourceXml("res/layout/item_activity_feed_ad_image.xml").use { xml ->
            xml.elements("LinearLayout").firstOrNull()?.let {
                it.setAttribute("android:visibility", "gone")
                it.setAttribute("android:layout_width", "0.0dp")
                it.setAttribute("android:layout_height", "0.0dp")
            }
        }
        resourceXml("res/layout/item_entry_update_ad.xml").use { xml ->
            xml.elements().firstOrNull()?.let {
                it.setAttribute("android:visibility", "gone")
                it.setAttribute("android:layout_width", "0.0dp")
                it.setAttribute("android:layout_height", "0.0dp")
            }
        }
        resourceXml("res/layout/home_activity.xml").use { xml ->
            xml.elements().forEach { element ->
                if (element.attribute("android:id") == "@id/floating_banner_ad_cl") {
                    element.setAttribute("android:visibility", "gone")
                    element.setAttribute("android:layout_width", "0.0dp")
                    element.setAttribute("android:layout_height", "0.0dp")
                }
            }
        }

        // ── 5. Neutralize VIP Crown & Promotional Plan Badges in XML ──────────────────
        resourceXml("res/layout/layout_plan_badge.xml").use { xml ->
            xml.root.let { root ->
                root.setAttribute("android:visibility", "gone")
                root.setAttribute("android:layout_width", "0.0dp")
                root.setAttribute("android:layout_height", "0.0dp")
            }
            xml.elements().forEach { element ->
                element.setAttribute("android:visibility", "gone")
                element.setAttribute("android:layout_width", "0.0dp")
                element.setAttribute("android:layout_height", "0.0dp")
            }
        }
        resourceXml("res/layout/view_flat_selection.xml").use { xml ->
            xml.elements().forEach { element ->
                if (element.attribute("android:id") == "@id/l_plan_badge") {
                    element.setAttribute("android:visibility", "gone")
                    element.setAttribute("android:layout_width", "0.0dp")
                    element.setAttribute("android:layout_height", "0.0dp")
                }
            }
        }
        resourceXml("res/layout/activity_settings.xml").use { xml ->
            xml.elements().forEach { element ->
                val id = element.attribute("android:id")
                if (id == "@id/l_plan_badge" || id == "@id/l_plan_badge_toolbar") {
                    element.setAttribute("android:visibility", "gone")
                    element.setAttribute("android:layout_width", "0.0dp")
                    element.setAttribute("android:layout_height", "0.0dp")
                }
            }
        }

        // ── 6. Flutter premium payload injection (UserProfileEngine.b) ────────────────
        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/userprofile/engine/UserProfileEngine;",
            name = "b",
            returnType = "V",
            parameters = listOf(
                "Lcom/mygate/user/modules/userprofile/engine/UserProfileEngine;",
                "Lorg/json/JSONObject;",
                "Z",
            ),
        ).method.addInstructions(
            0,
            """
                new-instance v0, Lorg/json/JSONObject;
                invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
                const-string v1, "status"
                const-string v2, "ACTIVE"
                invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                const-string v1, "code"
                const-string v2, "USER_PREMIUM_PLAN"
                invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                const-string v1, "name"
                const-string v2, "Premium"
                invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                const-string v1, "user_plan"
                invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                new-instance v0, Lorg/json/JSONObject;
                invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
                const-string v1, "status"
                const-string v2, "ACTIVE"
                invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                const-string v1, "code"
                const-string v2, "SOCIETY_PREMIUM_PLAN"
                invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                const-string v1, "name"
                const-string v2, "Premium"
                invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                const-string v1, "sort_index"
                const/4 v2, 0x3
                invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
                const-string v1, "society_highest_plan"
                invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
            """,
        )

        // ── 7. Flutter binary string sinkhole in libapp.so ────────────────────────────
        val replacements = listOf(
            // Endpoints & Image CDN Sinkholes
            "https://cmp.mygate.com/".toByteArray(Charsets.UTF_8) to "http://127.0.0.1:9099//".toByteArray(Charsets.UTF_8),
            "https://classifieds-be.mygate.com/".toByteArray(Charsets.UTF_8) to "http://127.0.0.1:9099/blocked-ads/".toByteArray(Charsets.UTF_8),
            "https://cmp.mint-01.mgmaglev.xyz/".toByteArray(Charsets.UTF_8) to "http://127.0.0.1:9099/blocked/xyz".toByteArray(Charsets.UTF_8),
            "https://trill.mygate.com/".toByteArray(Charsets.UTF_8) to "http://127.0.0.1:9099////".toByteArray(Charsets.UTF_8),
            "/digital/campaign/".toByteArray(Charsets.UTF_8) to "/blocked/campaign/".toByteArray(Charsets.UTF_8),
            "/metrics/capture/campaign".toByteArray(Charsets.UTF_8) to "/blocked/capture/campaign".toByteArray(Charsets.UTF_8),

            // Feed Notice & Marketing Platform Sinkhole
            "mobile/noticeListing".toByteArray(Charsets.UTF_8) to "mobile/blockedNotice".toByteArray(Charsets.UTF_8),

            // Spotlight Dynamic Widget Ads & Staging Metrics Sinkholes
            "/spotlight".toByteArray(Charsets.UTF_8) to "/blocklite".toByteArray(Charsets.UTF_8),
            "https://metrics.kappa.mgmaglev.xyz/".toByteArray(Charsets.UTF_8) to "http://127.0.0.1:9099/blocked/abcd/".toByteArray(Charsets.UTF_8),

            // Logical Plan & Tier Ad Banners
            "SOCIETY_FREE_PLAN".toByteArray(Charsets.UTF_8) to "SOCIETY_DISA_PLAN".toByteArray(Charsets.UTF_8),
            "shouldShowAdTierBanner".toByteArray(Charsets.UTF_8) to "shouldHideAdTierBanner".toByteArray(Charsets.UTF_8),
            "ad_tag_enabled".toByteArray(Charsets.UTF_8) to "ad_tag_disable".toByteArray(Charsets.UTF_8),

            // Feed Sponsored Notice Asset Neutralization
            "assets/images/svg/common/ic_notice_yellow.svg".toByteArray(Charsets.UTF_8) to "assets/images/svg/common/ic_notice_blockd.svg".toByteArray(Charsets.UTF_8),
        )

        listOf("lib/arm64-v8a/libapp.so", "lib/armeabi-v7a/libapp.so").forEach { entry ->
            try {
                val file = resourceFile(entry)
                if (file.exists()) {
                    val bytes = file.readBytes()
                    var modified = false
                    val newBytes = bytes.clone()

                    for ((target, replacement) in replacements) {
                        for (i in 0..(newBytes.size - target.size)) {
                            var match = true
                            for (j in target.indices) {
                                if (newBytes[i + j] != target[j]) {
                                    match = false
                                    break
                                }
                            }
                            if (match) {
                                for (j in replacement.indices) {
                                    newBytes[i + j] = replacement[j]
                                }
                                modified = true
                            }
                        }
                    }

                    if (modified) {
                        file.writeBytes(newBytes)
                    }
                }
            } catch (_: Exception) {
            }
        }

        // ── 8. Neutralize Flutter home header VIP crown icon asset ────────────────────
        try {
            val emptySvg = """<svg width="0" height="0" viewBox="0 0 0 0" fill="none" xmlns="http://www.w3.org/2000/svg"/>""".toByteArray(Charsets.UTF_8)
            val premiumUserSvg = resourceFile("assets/flutter_assets/assets/images/svg/common/ic_premium_user.svg")
            if (premiumUserSvg.exists()) {
                premiumUserSvg.writeBytes(emptySvg)
            }
        } catch (_: Exception) {
        }

        // ── 9. Neutralize Plan Badge binding (removes VIP crown & ad-supported badge) ───
        Fingerprint(
            definingClass = "Lcom/mygate/user/utilities/KotlinUtils\$Companion;",
            name = "M",
            returnType = "V",
            parameters = listOf(
                "Lcom/mygate/user/databinding/LayoutPlanBadgeBinding;",
                "Z",
            ),
        ).method.addInstructions(
            0,
            """
                if-eqz p0, :cond_badge_end
                iget-object v0, p0, Lcom/mygate/user/databinding/LayoutPlanBadgeBinding;->a:Landroidx/constraintlayout/widget/ConstraintLayout;
                if-eqz v0, :cond_badge_end
                invoke-static {v0}, Lcom/mygate/user/common/extensions/ViewExtensionsKt;->j(Landroid/view/View;)V
                :cond_badge_end
                return-void
            """,
        )

        // ── 10. KotlinUtils.showUpgradePremiumDialog() -> no-op ──────────────────────
        Fingerprint(
            definingClass = "Lcom/mygate/user/utilities/KotlinUtils\$Companion;",
            returnType = "V",
            filters = listOf(
                methodCall(name = "show", returnType = "V", parameters = emptyList()),
            ),
            custom = { method, _ -> method.parameters.size == 1 },
        ).method.addInstructions(0, "return-void")

        // ── 11. UpgradePlanFragment plan-status gate ──────────────────────────────────
        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/userprofile/ui/UpgradePlanFragment;",
            returnType = "V",
            filters = listOf(
                string("USER_PREMIUM_PLAN"),
                string("SOCIETY_PREMIUM_PLAN"),
            ),
        ).let { fingerprint ->
            val method = fingerprint.method
            fingerprint.instructionMatches.reversed().forEach { match ->
                val instructions = method.instructions
                var moveResultIndex = -1
                var moveResultRegister = -1
                for (i in match.index + 1 until instructions.size) {
                    val instruction = instructions[i]
                    if (instruction.opcode == Opcode.MOVE_RESULT) {
                        moveResultIndex = i
                        moveResultRegister = (instruction as OneRegisterInstruction).registerA
                        break
                    }
                }
                if (moveResultIndex >= 0) {
                    method.addInstructions(
                        moveResultIndex + 1,
                        "const/4 v$moveResultRegister, 0x1",
                    )
                }
            }
        }

        // ── 12. Core Gatekeeper KotlinUtils.isPremiumUser() -> true ───────────────────
        Fingerprint(
            definingClass = "Lcom/mygate/user/utilities/KotlinUtils\$Companion;",
            returnType = "Z",
            parameters = emptyList(),
            strings = listOf("USER_PREMIUM_PLAN", "SOCIETY_PREMIUM_PLAN"),
        ).method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        // ── 13. UserProfile plan resolvers ────────────────────────────────────────────
        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserProfile;",
            name = "getCombinedUserPlanStatus",
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
        ).method.addInstructions(0, "const-string v0, \"SOCIETY_PREMIUM_PLAN\"\nreturn-object v0")

        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserProfile;",
            name = "getAdTierLabel",
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
        ).method.addInstructions(0, "const-string v0, \"Premium\"\nreturn-object v0")

        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserProfile;",
            name = "getUserPlan",
            returnType = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
            parameters = emptyList(),
        ).method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserProfile;->userPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                if-nez v0, :cond_has_user_plan
                new-instance v0, Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                invoke-direct {v0}, Lcom/mygate/user/modules/flats/entity/SocietyPlan;-><init>()V
                iput-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserProfile;->userPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                :cond_has_user_plan
                return-object v0
            """,
        )

        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserProfile;",
            name = "getSocietyHighestPlan",
            returnType = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
            parameters = emptyList(),
        ).method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserProfile;->societyHighestPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                if-nez v0, :cond_has_soc_plan
                new-instance v0, Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                invoke-direct {v0}, Lcom/mygate/user/modules/flats/entity/SocietyPlan;-><init>()V
                iput-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserProfile;->societyHighestPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                :cond_has_soc_plan
                return-object v0
            """,
        )

        // ── 14. SocietyPlan getters ───────────────────────────────────────────────────
        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
            name = "getCode",
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
        ).method.addInstructions(0, "const-string v0, \"SOCIETY_PREMIUM_PLAN\"\nreturn-object v0")

        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
            name = "getName",
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
        ).method.addInstructions(0, "const-string v0, \"Premium Plan\"\nreturn-object v0")

        // ── 15. Flat.getProductPackage() & getSocietyPlan() ───────────────────────────
        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/flats/entity/Flat;",
            name = "getProductPackage",
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
        ).method.addInstructions(0, "const-string v0, \"PREMIUM\"\nreturn-object v0")

        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/flats/entity/Flat;",
            name = "getSocietyPlan",
            returnType = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
            parameters = emptyList(),
        ).method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/mygate/user/modules/flats/entity/Flat;->societyPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                if-nez v0, :cond_has_flat_soc_plan
                new-instance v0, Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                invoke-direct {v0}, Lcom/mygate/user/modules/flats/entity/SocietyPlan;-><init>()V
                iput-object v0, p0, Lcom/mygate/user/modules/flats/entity/Flat;->societyPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                :cond_has_flat_soc_plan
                return-object v0
            """,
        )

        // ── 16. UserInfoPojoTemp getters ──────────────────────────────────────────────
        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;",
            name = "getAdTierLabel",
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
        ).method.addInstructions(0, "const-string v0, \"Premium\"\nreturn-object v0")

        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;",
            name = "getProductPackage",
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
        ).method.addInstructions(0, "const-string v0, \"PREMIUM\"\nreturn-object v0")

        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;",
            name = "getSocietyPlan",
            returnType = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
            parameters = emptyList(),
        ).method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;->societyPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                if-nez v0, :cond_has_temp_soc_plan
                new-instance v0, Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                invoke-direct {v0}, Lcom/mygate/user/modules/flats/entity/SocietyPlan;-><init>()V
                iput-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;->societyPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                :cond_has_temp_soc_plan
                return-object v0
            """,
        )

        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;",
            name = "getUserPlan",
            returnType = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
            parameters = emptyList(),
        ).method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;->userPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                if-nez v0, :cond_has_temp_user_plan
                new-instance v0, Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                invoke-direct {v0}, Lcom/mygate/user/modules/flats/entity/SocietyPlan;-><init>()V
                iput-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;->userPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                :cond_has_temp_user_plan
                return-object v0
            """,
        )

        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;",
            name = "getSocietyHighestPlan",
            returnType = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
            parameters = emptyList(),
        ).method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;->societyHighestPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                if-nez v0, :cond_has_temp_high_plan
                new-instance v0, Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                invoke-direct {v0}, Lcom/mygate/user/modules/flats/entity/SocietyPlan;-><init>()V
                iput-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;->societyHighestPlan:Lcom/mygate/user/modules/flats/entity/SocietyPlan;
                :cond_has_temp_high_plan
                return-object v0
            """,
        )

        // ── 17. UserProfile.getPremiumFeatureList() — ensure non-null ─────────────────
        Fingerprint(
            definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserProfile;",
            name = "getPremiumFeatureList",
            returnType = "Lcom/mygate/user/modules/userprofile/entity/PremiumFeatureCategory;",
            parameters = emptyList(),
        ).method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserProfile;->premiumFeatureCategory:Lcom/mygate/user/modules/userprofile/entity/PremiumFeatureCategory;
                if-nez v0, :cond_0
                new-instance v0, Lcom/mygate/user/modules/userprofile/entity/PremiumFeatureCategory;
                invoke-direct {v0}, Lcom/mygate/user/modules/userprofile/entity/PremiumFeatureCategory;-><init>()V
                iput-object v0, p0, Lcom/mygate/user/modules/userprofile/entity/UserProfile;->premiumFeatureCategory:Lcom/mygate/user/modules/userprofile/entity/PremiumFeatureCategory;
                :cond_0
                return-object v0
            """,
        )

        // ── 18. PremiumFeatureCategory getters — force all limits to 1 ────────────────
        val returnOne = "const/4 v0, 0x1\ninvoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;\nmove-result-object v0\nreturn-object v0"
        listOf("getFreqDelivery", "getSurpriseDelivery", "getFreqCab", "getFreqVisitingHelp", "getFreqGuest").forEach { name ->
            Fingerprint(
                definingClass = "Lcom/mygate/user/modules/userprofile/entity/PremiumFeatureCategory;",
                name = name,
                returnType = "Ljava/lang/Integer;",
                parameters = emptyList(),
            ).method.addInstructions(0, returnOne)
        }
    }
}
