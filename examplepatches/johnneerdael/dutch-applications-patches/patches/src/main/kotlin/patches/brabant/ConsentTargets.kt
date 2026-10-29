package patches.brabant

import com.android.tools.smali.dexlib2.Opcode

// Original APK headers and exact source anchors; remaining bodies stay native.
internal val consentTargets = listOf(
    OwnedMethod("Luj5;", "onCreate(Landroid/os/Bundle;)V", 0x1, 20, 302, listOf(
        // Keep startup and actual OS permission state; do not schedule the prompt.
        OwnedEdit(264, listOf(Opcode.IF_LT), listOf(null), listOf("nop"), target = 273, branch = 0),
    )),
    OwnedMethod("La76;", "onClick(Landroid/view/View;)V", 0x11, 14, 197, listOf(
        // Cookie selector8 only. Retain the original invoke behind the return so
        // its move-result remains well formed; manual notification selector7 stays native.
        OwnedEdit(56, listOf(Opcode.INVOKE_VIRTUAL), listOf("Lnl/omroepbrabant/android/presentation/ui/xml/more/view/MoreFragment;->j()Lm76;"), listOf(
            "return-void", "invoke-virtual {p0}, Lnl/omroepbrabant/android/presentation/ui/xml/more/view/MoreFragment;->j()Lm76;")),
    )),
    OwnedMethod("Lut;", "u(Ld66;Lfq1;Lyn3;Lgq3;I)V", 0x19, 15, 129, listOf(
        // Before Compose groups, flow collection, effects or the shared Dialog.
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lrq7;", "H(Lkl1;Lte2;Lhp1;)Ljava/lang/Object;", 0x1, 8, 69, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;", "return-object v0")),
    )),
    OwnedMethod("Lwqa;", "p(Landroid/content/Context;Ljava/lang/String;Ljava/util/LinkedHashMap;)Lyh0;", 0x9, 10, 342, listOf(
        OwnedEdit(289, listOf(Opcode.IGET_OBJECT), listOf("Lyh0;->h1:Lcom/google/android/gms/internal/consent_sdk/zzl;"), listOf("nop"), target = 338, branch = 0),
    )),
)
