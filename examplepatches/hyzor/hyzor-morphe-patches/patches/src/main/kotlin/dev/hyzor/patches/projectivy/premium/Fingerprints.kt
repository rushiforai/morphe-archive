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
import app.morphe.patcher.literal
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
 * (The helper/field types above are from the APKMirror build; the GitHub build renames them.
 * Neither is pinned by the match.)
 *
 * `TRUE` is the "premium is locked" state (see [PremiumLockWriterFingerprint]), so the patch
 * swaps this one constant for `Boolean.FALSE`. The `sget-object` reference is the anchor: it
 * does not pin the obfuscated `x`/`y` field names or the helper classes, so it matches both
 * the APKMirror APKM and the GitHub APK.
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
 * `d` has no stable name, and the two 4.73 builds do not share R8 names: the APKMirror APKM
 * reads `Lcj3;->l` and writes through `Lze4;->h`, the GitHub APK reads `Lmj3;->l` and writes
 * through `Llf4;->h`. Anchoring on either mapping would tie the patch to one build, so the
 * match uses only what both share:
 *
 *   invoke-static {}, Ljava/lang/System;->currentTimeMillis:()J
 *   ...
 *   const-wide/32 v0, #0x2932e000        // 691,200,000 ms, the eight-day window
 *   ...
 *   iget-object v4, v4, LPTApplication;->x:...   // the premium flow field
 *
 * The field name `x` is stable across both builds even though its type is re-obfuscated, and
 * the `(Z)V` shape plus these three anchors is unique in `PTApplication` in both. If a future
 * release changes the eight-day constant, re-resolve this fingerprint.
 */
object PremiumLockWriterFingerprint : Fingerprint(
    definingClass = PT_APPLICATION,
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        // invoke-static {}, Ljava/lang/System;->currentTimeMillis:()J
        methodCall(
            definingClass = "Ljava/lang/System;",
            name = "currentTimeMillis",
            returnType = "J",
        ),
        // const-wide/32 v0, #0x2932e000   691,200,000 ms = the eight-day re-check window
        literal(0x2932E000),
        // iget-object v4, v4, LPTApplication;->x:...   the premium flow field
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = PT_APPLICATION,
            name = "x",
        ),
    ),
)
