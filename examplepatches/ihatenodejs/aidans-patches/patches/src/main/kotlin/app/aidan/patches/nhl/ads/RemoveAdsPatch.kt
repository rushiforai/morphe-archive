package app.aidan.patches.nhl.ads

import app.aidan.patches.nhl.shared.COMPATIBILITY_NHL
import app.aidan.patches.shared.disableRequiredVoidMethods
import app.aidan.patches.shared.returnRequiredBoolean
import app.aidan.patches.shared.returnRequiredNullObject
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove Ads",
    description = "Removes Google Ad Manager banner and native advertisements, disables Blaze story/moment sponsored placements, blocks Google Interactive Media Ads (IMA) video ad requests, and neutralizes Brightcove IMA mid-roll and pre-roll ad playback.",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_NHL)

    val removePromotionsCarousel = booleanOption(
        key = "removePromotionsCarousel",
        title = "Remove Promotions Carousel",
        description = "Removes the promotions carousel from the Home screen.",
        default = true
    )

    execute {
        // 0. Promotions Carousel Neutralization
        if (removePromotionsCarousel.value == true) {
            removePromotionsCarousel()
        }

        // 1. Google Mobile Ads (GMS) SDK initialization & ContentProvider
        disableRequiredVoidMethods("Lcom/google/android/gms/ads/MobileAds;", "a")
        disableRequiredVoidMethods("Lcom/google/android/gms/ads/MobileAdsInitProvider;", "attachInfo")

        // 2. BaseAdView (kh1) loadAd neutralization
        disableRequiredVoidMethods("Lkh1;", "b")

        // 3. Blaze GAM Banner & Native Ad Handlers
        disableRequiredVoidMethods(
            "Lcom/blaze/gam/BlazeGAM;",
            "enableBannerAds",
            "enableCustomNativeAds",
            "initializeMobileAdsSdk",
            "setBlazeAdBannerHandler"
        )
        patchBlazeBannerCreation()
        returnRequiredNullObject("Lcom/blaze/gam/custom_native/DefaultBlazeGoogleCustomNativeAdsHandler;", "provideAd")
        disableRequiredVoidMethods("Lcom/blaze/gam/custom_native/DefaultBlazeGoogleCustomNativeAdsHandler;", "onAdEvent")
        disableRequiredVoidMethods("Lcom/blaze/gam/custom_native/BlazeCustomNativeAdsManager;", "requestAd")

        // 4. Blaze IMA Video Ads
        disableRequiredVoidMethods("Lcom/blaze/ima/BlazeIMA;", "enableAds")

        // 5. Brightcove Google IMA Video Ad Component & Event Listeners
        disableRequiredVoidMethods(
            "Lcom/brightcove/ima/GoogleIMAComponent;",
            "internalInitializeAdsRequests",
            "reloadAdsRequest",
            "initializeAdsRequests"
        )
        disableRequiredVoidMethods("Lcom/brightcove/ima/GoogleIMAComponent\$OnPlayListener;", "processEvent")
        disableRequiredVoidMethods("Lcom/brightcove/ima/GoogleIMAComponent\$OnCuePointListener;", "processEvent")
        returnRequiredBoolean("Lcom/brightcove/ima/BaseIMAComponent;", "shouldSkipAdBreak", true)
        returnRequiredBoolean("Lcom/brightcove/ima/BaseIMAComponent;", "isPlayingAd", false)

        // 6. Native Compose Ad Presentation & Container Collapse
        collapseNativeAdContainers()
    }
}

/**
 * Removes promotional carousels by returning null from Lawi.b / Lawi.e when
 * the component title, id, or slug contains "promotion".
 */
private fun BytecodePatchContext.removePromotionsCarousel() {
    val awiClass = mutableClassDefByOrNull("Lawi;")
        ?: throw PatchException("Missing required class Lawi; (Content component mapper)")

    val bMethod = awiClass.methods.singleOrNull { method ->
        method.name == "b" &&
            method.parameterTypes == listOf("Ldf3;", "Z") &&
            method.returnType == "Lpj4;"
    } ?: throw PatchException("Missing required method Lawi.b(Ldf3;Z)Lpj4;")

    if (bMethod.implementation == null) {
        throw PatchException("Lawi.b has no implementation")
    }

    // In static method b(df3, z), registers: p0 = v19, p1 = v20.
    // Format 22c iget-object requires registers v0..v15, so copy p0 to v2.
    val promoCheckSmali = """
        if-eqz p0, :cond_check_done
        move-object/from16 v2, p0
        iget-object v0, v2, Ldf3;->b:Lfva;
        if-eqz v0, :cond_check_id
        iget-object v0, v0, Lfva;->a:Ljava/lang/String;
        if-eqz v0, :cond_check_id
        sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
        invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
        move-result-object v0
        const-string v1, "promotion"
        invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
        move-result v0
        if-nez v0, :cond_return_null
        :cond_check_id
        iget-object v0, v2, Ldf3;->a:Ljava/lang/String;
        if-eqz v0, :cond_check_slug
        sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
        invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
        move-result-object v0
        const-string v1, "promotion"
        invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
        move-result v0
        if-nez v0, :cond_return_null
        :cond_check_slug
        iget-object v0, v2, Ldf3;->f:Ljava/lang/String;
        if-eqz v0, :cond_check_section
        sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
        invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
        move-result-object v0
        const-string v1, "promotion"
        invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
        move-result v0
        if-nez v0, :cond_return_null
        :cond_check_section
        iget-object v0, v2, Ldf3;->e:Ljava/lang/String;
        if-eqz v0, :cond_check_done
        sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
        invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
        move-result-object v0
        const-string v1, "promotion"
        invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
        move-result v0
        if-nez v0, :cond_return_null
        goto :cond_check_done
        :cond_return_null
        const/4 v0, 0x0
        return-object v0
        :cond_check_done
    """.trimIndent()

    bMethod.addInstructions(0, promoCheckSmali)

    val eMethod = awiClass.methods.singleOrNull { method ->
        method.name == "e" &&
            method.parameterTypes == listOf("Ldf3;", "Z") &&
            method.returnType == "Ltj4;"
    }
    if (eMethod?.implementation != null) {
        eMethod.addInstructions(0, promoCheckSmali)
    }
}

/**
 * Replaces Blaze GAM banner view creation with an empty hidden View.
 */
private fun BytecodePatchContext.patchBlazeBannerCreation() {
    val handlerClass = mutableClassDefByOrNull("Lcom/blaze/gam/banner/DefaultBlazeGAMBannerAdsHandler;")
        ?: throw PatchException("Missing required class Lcom/blaze/gam/banner/DefaultBlazeGAMBannerAdsHandler;")
    var patched = false
    for (method in handlerClass.methods) {
        if (method.name == "createAndLoadAdBannerView" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                new-instance v0, Landroid/view/View;
                invoke-direct {v0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V
                const/16 v1, 0x8
                invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                return-object v0
                """.trimIndent()
            )
            patched = true
        }
    }
    if (!patched) {
        throw PatchException("Missing required method Lcom/blaze/gam/banner/DefaultBlazeGAMBannerAdsHandler;->createAndLoadAdBannerView")
    }
}

/**
 * Collapses native Jetpack Compose ad presentation across all verified surfaces:
 * 1. Backstop ad renderer: Lnu3.a (also collapses video playlist ads in Lcdr.h)
 * 2. Medium rectangle / feed ads: Lxy.p
 * 3. Standings banner ads: Lwai.c
 * 4. Play-by-play ads: Lg68.invoke and Lo5f.invoke
 * 5. Game summary ads: Lq9a.a
 * 6. Pregame & Boxscore ads: Lse8.invoke, Lqn7.invoke, and Liz1.invoke
 */
private fun BytecodePatchContext.collapseNativeAdContainers() {
    collapseCommonAdRenderer()
    collapseMediumRectangleAdUnit()
    collapseStandingsBannerAdUnit()
    collapsePlayByPlayAds()
    collapseSummaryAds()
    collapsePregameAndBoxscoreAds()
}

/**
 * Neutralizes Lnu3.a to emit zero layout nodes while keeping Compose restart scopes balanced.
 */
private fun BytecodePatchContext.collapseCommonAdRenderer() {
    val nu3Class = mutableClassDefByOrNull("Lnu3;")
        ?: throw PatchException("Missing required class Lnu3; (Ad Renderer)")
    val aMethod = nu3Class.methods.singleOrNull { method ->
        method.name == "a" &&
            method.parameterTypes == listOf(
                "Ljava/lang/String;",
                "Lqtb;",
                "Ljava/lang/String;",
                "I",
                "Lwg;",
                "Ljava/lang/String;",
                "Z",
                "Lftd;",
                "Lpn3;",
                "I",
                "I"
            ) &&
            method.returnType == "V"
    } ?: throw PatchException("Missing required method Lnu3.a")

    aMethod.addInstructions(0, "return-void")
}

/**
 * Neutralizes Lxy.p (300x250 medium rectangle & 320x50 banner) to emit zero nodes.
 */
private fun BytecodePatchContext.collapseMediumRectangleAdUnit() {
    val xyClass = mutableClassDefByOrNull("Lxy;")
        ?: throw PatchException("Missing required class Lxy; (Medium Rectangle Ad Container)")
    val pMethod = xyClass.methods.singleOrNull { method ->
        method.name == "p" &&
            method.parameterTypes == listOf("Lff0;", "Lbvi;", "Lgce;", "Lpn3;", "I") &&
            method.returnType == "V"
    } ?: throw PatchException("Missing required method Lxy.p")

    pMethod.addInstructions(0, "return-void")
}

/**
 * Neutralizes Lwai.c (Standings inline banner ad unit) to emit zero nodes.
 */
private fun BytecodePatchContext.collapseStandingsBannerAdUnit() {
    val waiClass = mutableClassDefByOrNull("Lwai;")
        ?: throw PatchException("Missing required class Lwai; (Standings Ad Container)")
    val cMethod = waiClass.methods.singleOrNull { method ->
        method.name == "c" &&
            method.parameterTypes == listOf("Ln0j;", "I", "Lpn3;", "I") &&
            method.returnType == "V"
    } ?: throw PatchException("Missing required method Lwai.c")

    cMethod.addInstructions(0, "return-void")
}

/**
 * Collapses Play-by-Play ad items in Lg68 (merged lambda) and prevents their insertion in Lo5f.
 */
private fun BytecodePatchContext.collapsePlayByPlayAds() {
    // 1. In Lg68.invoke: stub cases 13 (r5f banner ad) and 15 (hj medium rectangle ad)
    val g68Class = mutableClassDefByOrNull("Lg68;")
        ?: throw PatchException("Missing required class Lg68; (Play-by-play merged lambda)")
    val invokeMethod = g68Class.methods.singleOrNull { method ->
        method.name == "invoke" &&
            method.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;") &&
            method.returnType == "Ljava/lang/Object;"
    } ?: throw PatchException("Missing required method Lg68.invoke")

    val g68Instructions = invokeMethod.implementation?.instructions?.toList()
        ?: throw PatchException("Lg68.invoke has no implementation")

    // Neutralize Lnu3.a calls in Lg68 (play-by-play ad cases)
    for ((idx, inst) in g68Instructions.withIndex()) {
        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
        if ((inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE) &&
            ref?.definingClass == "Lnu3;" &&
            ref.name == "a"
        ) {
            invokeMethod.replaceInstruction(idx, "nop")
        }
    }
    // 2. In Lo5f.invoke: skip adding ad items to LazyListScope
    val o5fClass = mutableClassDefByOrNull("Lo5f;")
    if (o5fClass != null) {
        for (method in o5fClass.methods) {
            if (method.name == "invoke" && method.implementation != null) {
                val o5fInsts = method.implementation!!.instructions.toList()
                // Nullify La6f;->b:Lhj; read so if-eqz branches past the ad item
                for ((idx, inst) in o5fInsts.withIndex()) {
                    val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference
                    if (inst.opcode == Opcode.IGET_OBJECT && ref?.definingClass == "La6f;" && ref.name == "b") {
                        val reg = (inst as OneRegisterInstruction).registerA
                        method.replaceInstruction(idx, "const/4 v$reg, 0x0")
                    }
                }
                // Neutralize kba.c for Lg68(13) banner ad item
                val g68NewIndex = o5fInsts.indexOfFirst { inst ->
                    val ref = (inst as? ReferenceInstruction)?.reference as? TypeReference
                    inst.opcode == Opcode.NEW_INSTANCE && ref?.type == "Lg68;"
                }
                if (g68NewIndex != -1) {
                    val kbaCallIndex = o5fInsts.subList(g68NewIndex, o5fInsts.size).indexOfFirst { inst ->
                        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
                        inst.opcode == Opcode.INVOKE_STATIC && ref?.definingClass == "Lkba;" && ref.name == "c"
                    }
                    if (kbaCallIndex != -1) {
                        method.replaceInstruction(g68NewIndex + kbaCallIndex, "nop")
                    }
                }
            }
        }
    }
}

/**
 * Collapses Game Summary ad items in Lq9a.
 */
private fun BytecodePatchContext.collapseSummaryAds() {
    val q9aClass = mutableClassDefByOrNull("Lq9a;")
        ?: throw PatchException("Missing required class Lq9a; (Game summary merged lambda)")
    val aMethod = q9aClass.methods.singleOrNull { method ->
        method.name == "a" &&
            method.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;") &&
            method.returnType == "Ljava/lang/Object;"
    } ?: throw PatchException("Missing required method Lq9a.a")

    val instructions = aMethod.implementation?.instructions?.toList()
        ?: throw PatchException("Lq9a.a has no implementation")

    val xriIndex = instructions.indexOfFirst { inst ->
        val ref = (inst as? ReferenceInstruction)?.reference as? TypeReference
        inst.opcode == Opcode.INSTANCE_OF && ref?.type == "Lxri;"
    }
    if (xriIndex == -1) {
        throw PatchException("Could not find instance-of Lxri anchor in Lq9a.a")
    }

    // Neutralize Lnu3.a invocation inside the Lxri branch
    val nu3Index = instructions.subList(xriIndex, instructions.size).indexOfFirst { inst ->
        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
        (inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE) &&
            ref?.definingClass == "Lnu3;" &&
            ref.name == "a"
    }
    if (nu3Index != -1) {
        aMethod.replaceInstruction(xriIndex + nu3Index, "nop")
    }
}

/**
 * Collapses Pregame and Boxscore ad items in Lse8, and skips their list insertion in Lqn7 and Liz1.
 */
private fun BytecodePatchContext.collapsePregameAndBoxscoreAds() {
    // 1. In Lse8.invoke: stub cases for Llef; (pregame) and Luy1; (boxscore)
    val se8Class = mutableClassDefByOrNull("Lse8;")
        ?: throw PatchException("Missing required class Lse8; (Game feeds merged lambda)")
    val invokeMethod = se8Class.methods.singleOrNull { method ->
        method.name == "invoke" &&
            method.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;") &&
            method.returnType == "Ljava/lang/Object;"
    } ?: throw PatchException("Missing required method Lse8.invoke")

    val se8Instructions = invokeMethod.implementation?.instructions?.toList()
        ?: throw PatchException("Lse8.invoke has no implementation")

    // Neutralize Lnu3.a calls in Lse8 (pregame and boxscore ad cases)
    for ((idx, inst) in se8Instructions.withIndex()) {
        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
        if ((inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE) &&
            ref?.definingClass == "Lnu3;" &&
            ref.name == "a"
        ) {
            invokeMethod.replaceInstruction(idx, "nop")
        }
    }
    // 2. In Lqn7.invoke: skip adding Llef; ad item to Pregame list by neutralizing kba.c
    val qn7Class = mutableClassDefByOrNull("Lqn7;")
    if (qn7Class != null) {
        for (method in qn7Class.methods) {
            if (method.name == "invoke" && method.implementation != null) {
                val qn7Insts = method.implementation!!.instructions.toList()
                val lefIndex = qn7Insts.indexOfFirst { inst ->
                    val ref = (inst as? ReferenceInstruction)?.reference as? TypeReference
                    inst.opcode == Opcode.INSTANCE_OF && ref?.type == "Llef;"
                }
                if (lefIndex != -1) {
                    val kbaCallIndex = qn7Insts.subList(lefIndex, qn7Insts.size).indexOfFirst { inst ->
                        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
                        (inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE) &&
                            ref?.definingClass == "Lkba;" &&
                            ref.name == "c"
                    }
                    if (kbaCallIndex != -1) {
                        method.replaceInstruction(lefIndex + kbaCallIndex, "nop")
                    }
                }
            }
        }
    }

    // 3. In Liz1.invoke: skip adding Luy1; ad item to Boxscore list by neutralizing kba.c
    val iz1Class = mutableClassDefByOrNull("Liz1;")
    if (iz1Class != null) {
        for (method in iz1Class.methods) {
            if (method.name == "invoke" && method.implementation != null) {
                val iz1Insts = method.implementation!!.instructions.toList()
                val uy1Index = iz1Insts.indexOfFirst { inst ->
                    val ref = (inst as? ReferenceInstruction)?.reference as? TypeReference
                    inst.opcode == Opcode.INSTANCE_OF && ref?.type == "Luy1;"
                }
                if (uy1Index != -1) {
                    val kbaCallIndex = iz1Insts.subList(uy1Index, iz1Insts.size).indexOfFirst { inst ->
                        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
                        (inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE) &&
                            ref?.definingClass == "Lkba;" &&
                            ref.name == "c"
                    }
                    if (kbaCallIndex != -1) {
                        method.replaceInstruction(uy1Index + kbaCallIndex, "nop")
                    }
                }
            }
        }
    }
}
