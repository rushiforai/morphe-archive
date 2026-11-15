/*
 * Copyright 2026 Entree3k
 * https://github.com/Entree3k/Morning-Entree-Patches
 *
 * Ported from the Projectivy Launcher 4.71 "Unlock Premium" patch in
 * Morning-Entree-Patches (GPLv3), re-resolved for 4.73.
 */

package dev.hyzor.patches.projectivy.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

private const val PT_APPLICATION = "Lcom/spocky/projengmenu/PTApplication;"

/**
 * `PTApplication.<init>()V` — the constructor that seeds the premium StateFlow.
 *
 * 4.73 creates two `MutableStateFlow`s in the constructor: a `Boolean` one for the licence
 * state and an `Int` one for something unrelated. The Boolean one is the only `Boolean.TRUE`
 * loaded in the whole class:
 *
 *   sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
 *   invoke-static {v0}, Los1;->a(Ljava/lang/Object;)Lze4;   // MutableStateFlow(TRUE)
 *   iput-object v0, p0, PTApplication;->x:Lze4;
 *   invoke-static {v0}, Lmv4;->c(Lze4;)Lyp3;               // asStateFlow()
 *   iput-object v0, p0, PTApplication;->y:Lyp3;
 *
 * `TRUE` is the "premium is locked" state (see [PremiumLockWriterFingerprint]), so the patch
 * swaps this one constant for `Boolean.FALSE`. The `sget-object` reference is the anchor: it
 * does not pin the obfuscated `x`/`y` field names or the `os1`/`mv4` helper classes.
 */
object PremiumSeedFingerprint : Fingerprint(
    definingClass = PT_APPLICATION,
    name = "<init>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        // sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "Ljava/lang/Boolean;",
            name = "TRUE",
        ),
    ),
)

/**
 * `PTApplication.d(Z)V` — the licence writer, the only code after the constructor that
 * updates the premium flow:
 *
 *   d(z) {
 *       x.value = z && (lastStart <= 0 || now - lastStart > 8 days)
 *   }
 *
 * It is called with `!purchased` from the Play Billing collector and with `true` from the
 * startup path, so on a re-signed build it would overwrite the patched seed with `true` as
 * soon as the (always failing) purchase check reports in. The patch replaces its body with
 * `return-void`, which leaves the seeded `false` in place.
 *
 * `d` has no stable name, so the match is structural: the `(Z)V` shape in `PTApplication`
 * plus the three accesses that make up the writer — the `cj3.l` "last start" preference, the
 * flow field, and the `h()` write on the flow. `x`/`l`/`h` are obfuscated and can move on a
 * later release, so re-resolve this fingerprint when bumping the target version.
 */
object PremiumLockWriterFingerprint : Fingerprint(
    definingClass = PT_APPLICATION,
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        // sget-object p1, Lcj3;->l:Lvh3;   the "general_last_start_date_nexp" preference
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "Lcj3;",
            name = "l",
        ),
        // iget-object p0, p0, LPTApplication;->x:Lze4;
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = PT_APPLICATION,
            name = "x",
        ),
        // invoke-virtual {p0, p1}, Lze4;->h(Ljava/lang/Object;)V
        methodCall(
            definingClass = "Lze4;",
            name = "h",
        ),
    ),
)
