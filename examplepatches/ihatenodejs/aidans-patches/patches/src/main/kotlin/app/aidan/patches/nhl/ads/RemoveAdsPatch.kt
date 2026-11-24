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

        // 2. BaseAdView (ll1) loadAd neutralization
        disableRequiredVoidMethods("Lll1;", "b")

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
 * Removes promotional carousels by returning null from Lxrj.b / Lxrj.e when
 * the component title, id, or slug contains "promotion".
 */
private fun BytecodePatchContext.removePromotionsCarousel() {
    val mapperClass = mutableClassDefByOrNull("Lxrj;")
        ?: throw PatchException("Missing required class Lxrj; (Content component mapper)")

    // In static methods b(pl3, z) / e(pl3, z), p0 is the content component.
    // Format 22c iget-object requires registers v0..v15, so copy p0 to v2.
    val promoCheckSmali = """
        if-eqz p0, :cond_check_done
        move-object/from16 v2, p0
        iget-object v0, v2, Lpl3;->b:Lshb;
        if-eqz v0, :cond_check_id
        iget-object v0, v0, Lshb;->a:Ljava/lang/String;
        if-eqz v0, :cond_check_id
        sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
        invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
        move-result-object v0
        const-string v1, "promotion"
        invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
        move-result v0
        if-nez v0, :cond_return_null
        :cond_check_id
        iget-object v0, v2, Lpl3;->a:Ljava/lang/String;
        if-eqz v0, :cond_check_slug
        sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
        invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
        move-result-object v0
        const-string v1, "promotion"
        invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
        move-result v0
        if-nez v0, :cond_return_null
        :cond_check_slug
        iget-object v0, v2, Lpl3;->f:Ljava/lang/String;
        if-eqz v0, :cond_check_section
        sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
        invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
        move-result-object v0
        const-string v1, "promotion"
        invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
        move-result v0
        if-nez v0, :cond_return_null
        :cond_check_section
        iget-object v0, v2, Lpl3;->e:Ljava/lang/String;
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

    val bMethod = mapperClass.methods.singleOrNull { method ->
        method.name == "b" &&
            method.parameterTypes == listOf("Lpl3;", "Z") &&
            method.returnType == "Lkq4;"
    } ?: throw PatchException("Missing required method Lxrj.b(Lpl3;Z)Lkq4;")

    if (bMethod.implementation == null) {
        throw PatchException("Lxrj.b has no implementation")
    }
    bMethod.addInstructions(0, promoCheckSmali)

    val eMethod = mapperClass.methods.singleOrNull { method ->
        method.name == "e" &&
            method.parameterTypes == listOf("Lpl3;", "Z") &&
            method.returnType == "Lpq4;"
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
 * 1. Backstop ad renderer: Lbme.a (also collapses video playlist ads in Lh05/Lr6j)
 * 2. Medium rectangle / feed ads: Lh05.m
 * 3. Standings banner ads: Lr6j.c
 * 4. Play-by-play ads: Lm38.invoke and Lxwf.invoke
 * 5. Game summary ads: Ltsa.invoke
 * 6. Pregame & Boxscore ads: Lps8.invoke, Lbb8, and Laa8
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
 * Neutralizes Lbme.a to emit zero layout nodes while keeping Compose restart scopes balanced.
 */
private fun BytecodePatchContext.collapseCommonAdRenderer() {
    val rendererClass = mutableClassDefByOrNull("Lbme;")
        ?: throw PatchException("Missing required class Lbme; (Ad Renderer)")
    val aMethod = rendererClass.methods.singleOrNull { method ->
        method.name == "a" &&
            method.parameterTypes == listOf(
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "I",
                "Llg;",
                "Ljava/lang/String;",
                "Z",
                "Lbu3;",
                "I",
                "I"
            ) &&
            method.returnType == "V"
    } ?: throw PatchException("Missing required method Lbme.a")

    aMethod.addInstructions(0, "return-void")
}

/**
 * Neutralizes Lh05.m (300x250 medium rectangle & 320x50 banner) to emit zero nodes.
 */
private fun BytecodePatchContext.collapseMediumRectangleAdUnit() {
    val mediumRectangleClass = mutableClassDefByOrNull("Lh05;")
        ?: throw PatchException("Missing required class Lh05; (Medium Rectangle Ad Container)")
    val mMethod = mediumRectangleClass.methods.singleOrNull { method ->
        method.name == "m" &&
            method.parameterTypes == listOf("Lvg0;", "Lyqj;", "Lc2f;", "Lbu3;", "I") &&
            method.returnType == "V"
    } ?: throw PatchException("Missing required method Lh05.m")

    mMethod.addInstructions(0, "return-void")
}

/**
 * Neutralizes Lr6j.c (Standings inline banner ad unit) to emit zero nodes.
 */
private fun BytecodePatchContext.collapseStandingsBannerAdUnit() {
    val standingsClass = mutableClassDefByOrNull("Lr6j;")
        ?: throw PatchException("Missing required class Lr6j; (Standings Ad Container)")
    val cMethod = standingsClass.methods.singleOrNull { method ->
        method.name == "c" &&
            method.parameterTypes == listOf("Luwj;", "I", "Lbu3;", "I") &&
            method.returnType == "V"
    } ?: throw PatchException("Missing required method Lr6j.c")

    cMethod.addInstructions(0, "return-void")
}

/**
 * Collapses Play-by-Play ad items in Lm38 and prevents their insertion in Lxwf.
 */
private fun BytecodePatchContext.collapsePlayByPlayAds() {
    neutralizeCommonAdRendererCalls("Lm38;", "Play-by-play merged lambda")

    // Nullify the Lixf.b ad-item read so the branch in Lxwf skips list insertion.
    val xwfClass = mutableClassDefByOrNull("Lxwf;")
        ?: throw PatchException("Missing required class Lxwf; (Play-by-play list builder)")
    var nullified = false
    for (method in xwfClass.methods) {
        val implementation = method.implementation ?: continue
        val instructions = implementation.instructions.toList()
        for ((idx, inst) in instructions.withIndex()) {
            val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference
            if (inst.opcode == Opcode.IGET_OBJECT && ref?.definingClass == "Lixf;" && ref.name == "b") {
                val reg = (inst as OneRegisterInstruction).registerA
                method.replaceInstruction(idx, "const/4 v$reg, 0x0")
                nullified = true
            }
        }
    }
    if (!nullified) {
        throw PatchException("Could not find Lixf.b ad-item gate in Lxwf")
    }
}

/**
 * Collapses Game Summary ad items in Ltsa.
 */
private fun BytecodePatchContext.collapseSummaryAds() {
    neutralizeCommonAdRendererCalls("Ltsa;", "Game summary merged lambda")
}

/**
 * Collapses Pregame and Boxscore ad items in Lps8, and skips their list insertion in Lbb8 and Laa8.
 */
private fun BytecodePatchContext.collapsePregameAndBoxscoreAds() {
    neutralizeCommonAdRendererCalls("Lps8;", "Game feeds merged lambda")
    skipAdItemInsertion("Lbb8;", "Lv5g;", "Pregame")
    skipAdItemInsertion("Laa8;", "Lv32;", "Boxscore")
}

/**
 * Replaces every Lbme.a invocation in [classDescriptor] with nop.
 */
private fun BytecodePatchContext.neutralizeCommonAdRendererCalls(classDescriptor: String, label: String) {
    val klass = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Missing required class $classDescriptor ($label)")
    var patched = false
    for (method in klass.methods) {
        val implementation = method.implementation ?: continue
        val instructions = implementation.instructions.toList()
        for ((idx, inst) in instructions.withIndex()) {
            val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
            if ((inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE) &&
                ref?.definingClass == "Lbme;" &&
                ref.name == "a"
            ) {
                method.replaceInstruction(idx, "nop")
                patched = true
            }
        }
    }
    if (!patched) {
        throw PatchException("Missing required Lbme.a call in $classDescriptor ($label)")
    }
}

/**
 * Skips insertion of [itemDescriptor] ad items by neutralizing the next List.add after each construction.
 */
private fun BytecodePatchContext.skipAdItemInsertion(classDescriptor: String, itemDescriptor: String, label: String) {
    val klass = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Missing required class $classDescriptor ($label ad item inserter)")
    var patched = false
    for (method in klass.methods) {
        val implementation = method.implementation ?: continue
        val instructions = implementation.instructions.toList()
        for ((idx, inst) in instructions.withIndex()) {
            val typeRef = (inst as? ReferenceInstruction)?.reference as? TypeReference
            if (inst.opcode != Opcode.NEW_INSTANCE || typeRef?.type != itemDescriptor) continue
            for (j in idx + 1 until instructions.size) {
                val nextInst = instructions[j]
                val nextType = (nextInst as? ReferenceInstruction)?.reference as? TypeReference
                if (nextInst.opcode == Opcode.NEW_INSTANCE && nextType?.type == itemDescriptor) {
                    break
                }
                val ref = (nextInst as? ReferenceInstruction)?.reference as? MethodReference
                if (nextInst.opcode == Opcode.INVOKE_INTERFACE &&
                    ref?.definingClass == "Ljava/util/List;" &&
                    ref.name == "add"
                ) {
                    val resultConsumed = j + 1 < instructions.size && instructions[j + 1].opcode == Opcode.MOVE_RESULT
                    if (!resultConsumed) {
                        method.replaceInstruction(j, "nop")
                        patched = true
                    }
                    break
                }
            }
        }
    }
    if (!patched) {
        throw PatchException("Could not find List.add for $itemDescriptor in $classDescriptor ($label)")
    }
}
