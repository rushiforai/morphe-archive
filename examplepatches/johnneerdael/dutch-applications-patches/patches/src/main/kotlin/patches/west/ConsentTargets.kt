package patches.west

import com.android.tools.smali.dexlib2.Opcode

// Consume the native automatic branches without touching the shared presenter:
// user-selected embeds and manual notification settings still use it normally.
internal val consentTargets = listOf(
    OwnedMethod("Lnl/stichtingrpo/news/home/HomeFragment;", "M()V", 0x11, 8, 48, listOf(
        OwnedEdit(36, listOf(Opcode.MOVE_RESULT), listOf(null), listOf("const/4 v1, 0x0")),
    )),
    OwnedMethod("Lf95;", "b(Ljava/lang/Object;)Ljava/lang/Object;", 0x11, 18, 247, listOf(
        OwnedEdit(102, listOf(Opcode.MOVE_RESULT), listOf(null), listOf("const/4 v6, 0x0")),
    )),
    OwnedMethod("Lva3;", "onClick(Landroid/view/View;)V", 0x11, 20, 391, listOf(
        // Continue through the existing no-prompt completion, including the
        // actual onboarding-ready callback when its final page is completed.
        OwnedEdit(211, listOf(Opcode.INVOKE_VIRTUAL), listOf("Ln90;->y(Lty2;)V"), listOf(
            "invoke-interface {v1}, Lty2;->c()Ljava/lang/Object;")),
        OwnedEdit(225, listOf(Opcode.INVOKE_VIRTUAL), listOf("Lnb1;->b(Lzv0;ZLty2;)V"), listOf(
            "invoke-interface {v3}, Lty2;->c()Ljava/lang/Object;")),
    )),
    OwnedMethod("Lei5;", "onPageScrolled(IFI)V", 0x11, 13, 128, listOf(
        OwnedEdit(105, listOf(Opcode.INVOKE_VIRTUAL), listOf("Ln90;->y(Lty2;)V"), listOf(
            "invoke-interface {p1}, Lty2;->c()Ljava/lang/Object;")),
    )),
    OwnedMethod("Lt57;", "c()Ljava/lang/Object;", 0x11, 6, 148, listOf(
        // Only the cookie-settings selector; other settings selectors stay native.
        OwnedEdit(63, listOf(Opcode.INVOKE_VIRTUAL), listOf("Lnb1;->b(Lzv0;ZLty2;)V"), listOf("return-object v2")),
    )),
    OwnedMethod("Lb67;", "onClick(Landroid/view/View;)V", 0x11, 5, 107, listOf(
        OwnedEdit(48, listOf(Opcode.INVOKE_VIRTUAL), listOf("Lnb1;->b(Lzv0;ZLty2;)V"), listOf("return-void")),
    )),
    OwnedMethod("Len;", "j(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", 0x11, 27, 593, listOf(
        // Exclude the complete privacy row and its following divider before
        // Compose remembers a click handler or enters the row's own groups.
        OwnedEdit(308, listOf(Opcode.CONST), listOf(null), listOf("nop"), target = 337, branch = 0),
    )),
    OwnedMethod("Lzi5;", "<init>(Lnl/stichtingrpo/news/onboarding/OnboardingActivity;ZZZ)V", 0x10001, 6, 23, listOf(
        // First launch and upgrade startup retain only available regions.
        // Leave language, notification and consent values unchanged.
        OwnedEdit(9, listOf(Opcode.INVOKE_VIRTUAL), listOf("Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z"), listOf("nop")),
        OwnedEdit(12, listOf(Opcode.INVOKE_VIRTUAL), listOf("Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z"), listOf("nop")),
        OwnedEdit(17, listOf(Opcode.INVOKE_VIRTUAL), listOf("Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z"), listOf("nop")),
        OwnedEdit(20, listOf(Opcode.INVOKE_VIRTUAL), listOf("Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z"), listOf("nop")),
    )),
    // The empty-region guard uses an external label to this original method's
    // continuation; it is installed by applyConsentHelpers after this preflight.
    OwnedMethod("Lnl/stichtingrpo/news/onboarding/OnboardingActivity;", "onCreate(Landroid/os/Bundle;)V", 0x11, 17, 311, emptyList()),
    OwnedMethod("Lnl/stichtingrpo/news/onboarding/OnboardingActivity;", "C()V", 0x11, 5, 58, listOf(
        // Save region choices for both fresh and upgrade completion before
        // entering the unchanged native preference/deep-link/home continuation.
        OwnedEdit(0, listOf(), listOf(), listOf(
            "invoke-virtual {p0}, Lnl/stichtingrpo/news/onboarding/OnboardingActivity;->D()Lxi5;",
            "move-result-object v0",
            "invoke-static {v0}, Lxi5;->morpheSaveRegions(Lxi5;)V",
        )),
    )),
    OwnedMethod("Lv70;", "N(Ljava/lang/String;Ljava/util/Map;)V", 0x11, 14, 497, listOf(
        // SDK/player initialization is complete. Reuse its existing l/return
        // path without scheduling CMP, modifying consent, or losing readiness.
        OwnedEdit(423, listOf(Opcode.IGET_OBJECT), listOf("Lv70;->x1:Lqt9;"), listOf("nop"), target = 421, branch = 0),
    )),
)
