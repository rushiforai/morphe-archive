package anxyis.morphe.patches.pure.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import anxyis.morphe.patches.pure.shared.ALIGHT_5270
import anxyis.morphe.patches.pure.shared.forceResultConst
import anxyis.morphe.patches.pure.shared.requireMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Membership gate sweep (the long tail of the premium unlock).
 *
 * SHAPE (FACT, every row below): a boolean gate computes Set.contains()Z,
 * sk/P.b2()Z, or Boolean.valueOf()Z of one; Tanryu replaces the move-result
 * with const-1 (register-mirrored kind). We insert the const AFTER the
 * move-result: same register, same value, no instruction deleted.
 *
 * Targeting: exact method descriptor + OWNER-QUALIFIED anchor
 * (Set.contains / sk/P.b2 / Boolean.valueOf — NOT bare method names, which
 * collide with List.contains, CollectionsKt.contains, overloads like O.b2
 * and P$Nr.b2) + occurrence index among owner-qualified hits. Totals and
 * occurrences verified against the stock tree by tools/validate.py (L1).
 *
 * kind: "4" -> const/4, "16": const/16, "" -> const (mirrors Tanryu text).
 *
 * 61 rows (the remaining const-1 sites live in their own patches:
 * persist/Nr x5 boolean getters + CheckAttempts + 4 layers + 2 res in
 * DeviceCapsPatch; SceneExporterKt.isEncoderSupported,
 * VisualEffectParserKt.readEffect, EffectBrowserActivity.b2 is ALSO here
 * (row below) — encoder/parser owned by EncoderEffectSettingsGatesPatch;
 * account/Nr.kB + account/Jy6.Ud x2 in PremiumCorePatch).
 */
private data class Gate(
    val cls: String,
    val name: String,
    val params: List<String>,
    val ret: String,
    /**
     * Owner-qualified anchor fragment, matched as substring of the invoke
     * line: "Ljava/util/Set;->contains", "Lsk/P;->b2",
     * "Lsk/P;->b2".
     */
    val anchor: String,
    /** which occurrence of [anchor] in the method (0-based) */
    val occurrence: Int,
    /** expected total occurrences of [anchor] in the method (assert) */
    val total: Int,
    val kind: String,
)

private val GATES = listOf(
    // Cg/NpA.b2: 2 contains() patched (j + fP-invoke pair); method has 4 total.
    Gate("LCg/NpA;", "b2", listOf("I", "Ljava/lang/String;", "Ljava/io/File;", "Lcom/alightcreative/app/motion/scene/Scene;", "Landroid/content/Context;", "Lbi/DXi;", "Lsk/P;", "Z"), "LCg/Jy6;", "Ljava/util/Set;->contains", 2, 4, "4"),
    Gate("LCg/NpA;", "b2", listOf("I", "Ljava/lang/String;", "Ljava/io/File;", "Lcom/alightcreative/app/motion/scene/Scene;", "Landroid/content/Context;", "Lbi/DXi;", "Lsk/P;", "Z"), "LCg/Jy6;", "Ljava/util/Set;->contains", 3, 4, ""),
    // DZJ family: single contains() each (member-name gates).
    Gate("LDZj/gDB;", "Jz", listOf("Ljava/lang/String;"), "Z", "Ljava/util/Set;->contains", 0, 1, ""),
    Gate("LDZj/gDB;", "Zjm", listOf("Ljava/lang/String;"), "Z", "Ljava/util/Set;->contains", 0, 1, ""),
    Gate("LDZj/gDB;", "b2", listOf("Ljava/lang/String;", "Ljava/lang/String;"), "Z", "Ljava/util/Set;->contains", 0, 1, ""),
    Gate("LDZj/gDB;", "hQt", listOf("LNR/VJ;"), "Z", "Ljava/util/Set;->contains", 0, 1, ""),
    Gate("LDZj/gDB;", "kB", listOf("Ljava/lang/String;"), "Z", "Ljava/util/Set;->contains", 0, 1, ""),
    Gate("LDZj/gDB;", "m", listOf("Ljava/lang/String;"), "Z", "Ljava/util/Set;->contains", 0, 1, ""),
    // GtG timeline gates.
    Gate("LGtG/DH;", "z0V", listOf("Lcom/alightcreative/app/motion/scene/visualeffect/KeyableVisualEffectRef;", "LGtG/DH;", "LGtG/DH\$Nr;", "I"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("LGtG/DH;", "B", listOf("LGtG/DH\$Nr;", "I"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("LGtG/kgb;", "M", listOf("LGtG/kgb;", "Landroid/view/View;"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("LGtG/kgb;", "kB", emptyList(), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("LGtG/kgb;", "onViewCreated", listOf("Landroid/view/View;", "Landroid/os/Bundle;"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("LGtG/lq;", "b", listOf("Landroid/view/View;"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("LGtG/z;", "R", listOf("LGtG/z;", "LGtG/z\$VJ;", "Landroid/view/View;"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("LGtG/z;", "k", listOf("LGtG/z;", "Landroid/view/View;"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("LGtG/z;", "xJ", listOf("LGtG/z;", "LGtG/z\$Jy6;", "Landroid/view/View;"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("LGtG/z;", "zA", listOf("Landroid/app/Activity;"), "V", "Ljava/util/Set;->contains", 0, 3, "4"),
    Gate("LGtG/z;", "zA", listOf("Landroid/app/Activity;"), "V", "Ljava/util/Set;->contains", 1, 3, "4"),
    // N + OB + Ui gates (iapManager.b2 / benefit contains / valueOf).
    Gate("LN/gd;", "fP", listOf("Landroid/view/View;", "Lch/xoo;", "Lsk/P;", "Lkotlin/jvm/functions/Function0;"), "V", "Lsk/P;->b2", 0, 1, ""),
    Gate("LN/iE;", "Jz", listOf("Ljava/util/List;", "Lsk/P;"), "Ljava/util/List;", "Lsk/P;->b2", 0, 1, ""),
    Gate("LN/iE;", "b2", listOf("Lch/xoo;", "Lsk/P;"), "Z", "Lsk/P;->b2", 0, 1, ""),
    Gate("LOB/GT\$Nr;", "m", listOf("Lcom/alightcreative/app/motion/scene/visualeffect/VisualEffect;", "I"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("LOB/Hy\$Nr;", "m", listOf("I", "Lcom/alightcreative/app/motion/scene/visualeffect/VisualEffect;"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("LOB/SwP;", "onViewCreated", listOf("Landroid/view/View;", "Landroid/os/Bundle;"), "V", "Ljava/util/Set;->contains", 0, 2, "4"),
    Gate("LOB/SwP;", "onViewCreated", listOf("Landroid/view/View;", "Landroid/os/Bundle;"), "V", "Ljava/util/Set;->contains", 1, 2, "4"),
    Gate("LOB/v;", "L0", emptyList(), "V", "Lsk/P;->b2", 0, 1, ""),
    Gate("LOB/z3\$Nr;", "m", listOf("I", "Lcom/alightcreative/app/motion/scene/visualeffect/VisualEffect;"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("LUi/Jy6\$Jy6;", "kB", listOf("Lcom/alightcreative/app/motion/feed/FeedCard;"), "V", "Lsk/P;->b2", 0, 1, ""),
    Gate("LUi/Nr;", "U", listOf("LUi/Nr\$Nr;", "I"), "V", "Lsk/P;->b2", 0, 1, ""),
    Gate("La7q/el\$gDB\$Nr;", "Yd", listOf("LK/Ds0;", "Landroidx/activity/ComponentActivity;", "LjO/el;", "Ljava/lang/String;", "Ljava/lang/String;", "Lsk/P;", "Lcom/alightcreative/export/projectpackage/SharedProjectPackageInfo;", "Lcom/google/firebase/storage/NpA;", "Z", "LOW/K;", "Lkotlin/jvm/functions/Function2;", "Z"), "V", "Lsk/P;->b2", 0, 1, ""),
    Gate("La7q/el\$gDB\$Nr;", "invoke", listOf("Ljava/lang/Object;"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("La7q/el\$gDB;", "invokeSuspend", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;", "Lsk/P;->b2", 0, 1, ""),
    Gate("Lbi/SDH;", "tz", emptyList(), "V", "Ljava/util/ArrayList;->contains", 0, 1, "4"),
    // Activities.
    Gate("Lcom/alightcreative/app/motion/activities/AboutActivity;", "onCreate", listOf("Landroid/os/Bundle;"), "V", "Lsk/P;->b2", 0, 1, ""),
    Gate("Lcom/alightcreative/app/motion/activities/AgreeDeleteAccountActivity;", "Gi", listOf("Lcom/alightcreative/app/motion/activities/AgreeDeleteAccountActivity;"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("Lcom/alightcreative/app/motion/activities/EditActivity;", "UFF", listOf("Lcom/alightcreative/app/motion/activities/EditActivity;", "Landroid/view/View;"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("Lcom/alightcreative/app/motion/activities/EditActivity;", "evu", listOf("Lcom/alightcreative/app/motion/activities/EditActivity;", "Landroid/view/View;"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("Lcom/alightcreative/app/motion/activities/EditActivity;", "onCreate", listOf("Landroid/os/Bundle;"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("Lcom/alightcreative/app/motion/activities/RE\$Nr;", "kB", listOf("Lcom/alightcreative/app/motion/activities/jHB;"), "V", "Ljava/util/Set;->contains", 0, 2, "4"),
    Gate("Lcom/alightcreative/app/motion/activities/RE\$Nr;", "kB", listOf("Lcom/alightcreative/app/motion/activities/jHB;"), "V", "Ljava/util/Set;->contains", 1, 2, "4"),
    Gate("Lcom/alightcreative/app/motion/activities/effectbrowser/EffectBrowserActivity;", "b2", listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("Lcom/alightcreative/app/motion/activities/effectbrowser/Nr\$VJ\$Nr;", "kB", listOf("I", "Lkotlin/Pair;"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("Lcom/alightcreative/app/motion/activities/effectbrowser/Nr;", "gbt", emptyList(), "V", "Lsk/P;->b2", 0, 1, ""),
    Gate("Lcom/alightcreative/app/motion/activities/effectbrowser/Nr;", "onViewCreated", listOf("Landroid/view/View;", "Landroid/os/Bundle;"), "V", "Lsk/P;->b2", 0, 2, ""),
    Gate("Lcom/alightcreative/app/motion/activities/effectbrowser/Nr;", "onViewCreated", listOf("Landroid/view/View;", "Landroid/os/Bundle;"), "V", "Lsk/P;->b2", 1, 2, ""),
    Gate("Lcom/alightcreative/app/motion/activities/main/MainActivity;", "Pkl", emptyList(), "V", "Lsk/P;->b2", 0, 1, ""),
    Gate("Lcom/alightcreative/app/motion/activities/main/MainActivity;", "MJD", listOf("Lcom/alightcreative/app/motion/project/ProjectInfo\$Jy6;"), "V", "Lsk/P;->b2", 0, 1, ""),
    Gate("Lcom/alightcreative/app/motion/activities/main/maintabs/MainTabProjectListViewModel;", "SsM", listOf("Li1/a6;", "Lcom/alightcreative/account/CloudStorageStatus;"), "Li1/a6;", "Ljava/util/Set;->contains", 0, 1, "4"),
    // Backup / share / misc.
    Gate("Lcom/alightcreative/backup/CloudBackupViewModel;", "mvf", emptyList(), "Z", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("Lcom/alightcreative/backup/domain/usecases/internal/Nr;", "D", listOf("J", "Lkotlin/jvm/functions/Function1;", "Lkotlin/coroutines/Continuation;"), "Ljava/lang/Object;", "Lsk/P;->b2", 0, 1, ""),
    Gate("Lcom/alightcreative/backup/domain/usecases/internal/o1N;", "Ud", emptyList(), "J", "Ljava/util/Set;->contains", 0, 2, "4"),
    Gate("Lcom/alightcreative/backup/domain/usecases/internal/o1N;", "Ud", emptyList(), "J", "Ljava/util/Set;->contains", 1, 2, "4"),
    Gate("Li1/Fq;", "L0", listOf("LRUr/J;", "Landroid/content/Context;", "Ljava/lang/Throwable;"), "V", "Lsk/P;->b2", 0, 1, ""),
    Gate("Li1/Fq;", "M", listOf("Lkotlin/coroutines/Continuation;"), "Ljava/lang/Object;", "Lsk/P;->b2", 0, 2, ""),
    Gate("Li1/Fq;", "M", listOf("Lkotlin/coroutines/Continuation;"), "Ljava/lang/Object;", "Lsk/P;->b2", 1, 2, ""),
    Gate("LnxP/Nr;", "b2", listOf("Ljava/util/List;", "Lcom/alightcreative/app/motion/scene/SceneElement;", "Ljava/util/Set;", "Lcom/alightcreative/app/motion/scene/SceneHolder;", "Z"), "V", "Ljava/util/Set;->contains", 0, 1, "4"),
    Gate("LvNU/t6Q;", "hQt", listOf("Landroid/app/Activity;", "Ljava/lang/String;", "Ljava/util/List;", "LK/Ds0;", "Lsk/P;", "Ljava/util/List;", "Ljava/util/List;", "Lcom/alightcreative/app/motion/scene/SceneThumbnailMaker;", "Z", "Ljava/io/File;", "Lkotlin/jvm/functions/Function1;", "Lkotlin/jvm/functions/Function1;", "Lkotlin/jvm/functions/Function0;", "Lkotlin/coroutines/Continuation;"), "Ljava/lang/Object;", "Lsk/P;->b2", 0, 3, ""),
    Gate("LvNU/t6Q;", "hQt", listOf("Landroid/app/Activity;", "Ljava/lang/String;", "Ljava/util/List;", "LK/Ds0;", "Lsk/P;", "Ljava/util/List;", "Ljava/util/List;", "Lcom/alightcreative/app/motion/scene/SceneThumbnailMaker;", "Z", "Ljava/io/File;", "Lkotlin/jvm/functions/Function1;", "Lkotlin/jvm/functions/Function1;", "Lkotlin/jvm/functions/Function0;", "Lkotlin/coroutines/Continuation;"), "Ljava/lang/Object;", "Lsk/P;->b2", 1, 3, ""),
    Gate("LvNU/t6Q;", "hQt", listOf("Landroid/app/Activity;", "Ljava/lang/String;", "Ljava/util/List;", "LK/Ds0;", "Lsk/P;", "Ljava/util/List;", "Ljava/util/List;", "Lcom/alightcreative/app/motion/scene/SceneThumbnailMaker;", "Z", "Ljava/io/File;", "Lkotlin/jvm/functions/Function1;", "Lkotlin/jvm/functions/Function1;", "Lkotlin/jvm/functions/Function0;", "Lkotlin/coroutines/Continuation;"), "Ljava/lang/Object;", "Lsk/P;->b2", 2, 3, ""),
    Gate("Lvh/P;", "b2", listOf("Ljava/lang/String;"), "Z", "Ljava/util/Set;->contains", 0, 1, "4"),
)

@Suppress("unused")
val membershipGatesPatch = bytecodePatch(
    name = "Unlock all pro features",
    description = "Unlocks all remaining pro-gated features.",
) {
    compatibleWith(ALIGHT_5270)
    execute {
        // Group same-method sites and apply DESC occurrence order so earlier
        // inserts don't shift later anchor indices.
        var done = 0
        for ((key, group) in GATES.groupBy { Triple(it.cls, it.name, it.params to it.ret) }) {
            val (cls, name, sig) = key
            val (params, ret) = sig
            val m = requireMethod(cls, name, params, ret)
            val impl = m.implementation ?: throw PatchException("Pure: no impl $cls->$name")
            // Verify totals once per method (all rows in a group share total).
            val byAnchor = group.groupBy { it.anchor }
            val indexCache = mutableMapOf<String, List<Int>>()
            for ((anchor, rows) in byAnchor) {
                val hits = impl.instructions.mapIndexedNotNull { i, insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    if (ref != null && "${ref.definingClass}->${ref.name}" in anchor) i else null
                }
                indexCache[anchor] = hits
                if (rows[0].total >= 0 && hits.size != rows[0].total) {
                    throw PatchException("Pure: $cls->$name anchor $anchor x${hits.size}, expected ${rows[0].total}")
                }
            }
            for (g in group.sortedByDescending { it.occurrence }) {
                val hits = indexCache[g.anchor]!!
                if (g.occurrence >= hits.size) {
                    throw PatchException("Pure: $cls->${g.name} occurrence ${g.occurrence} missing (have ${hits.size})")
                }
                val kind = when (g.kind) {
                    "4" -> "const/4"
                    "16" -> "const/16"
                    else -> "const"
                }
                m.forceResultConst(hits[g.occurrence], kind, "0x1")
                done++
            }
        }
        if (done != GATES.size) throw PatchException("Pure: gates done=$done != ${GATES.size}")
    }
}
