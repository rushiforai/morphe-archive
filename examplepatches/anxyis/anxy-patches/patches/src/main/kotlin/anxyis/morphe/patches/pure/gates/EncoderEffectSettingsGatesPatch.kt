package anxyis.morphe.patches.pure.gates

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import anxyis.morphe.patches.pure.shared.ALIGHT_5270
import anxyis.morphe.patches.pure.shared.clearBody
import anxyis.morphe.patches.pure.shared.ensureRegisters
import anxyis.morphe.patches.pure.shared.forceResultConst
import anxyis.morphe.patches.pure.shared.matchSingle
import anxyis.morphe.patches.pure.shared.requireMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Encoder / effect / settings gates.
 *
 * 1. SceneExporterKt.isEncoderSupported(VideoEncoding,II)Z -> prepend
 *    `const/4 v0,0x1; return v0`. Whole-body prepend (Tanryu inserts the
 *    same two lines at index 0): every encode path sees support.
 *
 * 2. VisualEffectParserKt.readEffect: force the `sk/P.b2()Z` move-result
 *    (v5) to `const v5,0x1` — premium flag of every parsed effect becomes
 *    true; stock pipeline renders it. (The second readEffect hunk is a
 *    lone `nop` insertion before :sswitch_data_0 — an apktool reassembly
 *    artifact with zero runtime effect; deliberately NOT replicated.)
 *
 * 3. EffectBrowserActivity.b2(String,String,String)V: force the
 *    `Zjm()Set -> contains(T)` move-result (v1) to const/4 1 — the browser
 *    treats every effect as member-unlocked. (Covered by the membership
 *    sweep's Gate row too; this patch re-asserts it — double coverage is
 *    intentional: the sweep owns it, this documents the gate. Only ONE of
 *    the two may run... see note.)
 *
 * NOTE on (3): both MembershipGatesPatch and this patch force the same
 * move-result. Running both would insert two consts (harmless: second
 * overwrites first with the same value) but the sweep already asserts
 * occurrence counts, so a double-insert is still safe. To keep the run
 * deterministic, the sweep OWNS EffectBrowserActivity.b2 and this patch
 * SKIPS it (asserts the sweep ran by checking... nothing — Morphe applies
 * selected patches in order; both default=true so both run; the second
 * insert lands after the first and writes the same 0x1. No conflict).
 *
 * 4. AlightSettingsEntity.<init>: 4 field stores forced to Boolean.TRUE
 *    (xmlImportEnabled, creatorProgramEnabled, creatorRankingEnabled,
 *    cloudBackupEnabled). Stock pattern per field:
 *      move-object/from16 v1, pN
 *      iput-object v1, v0, ...->FIELD:Boolean;
 *    Tanryu inserts before iput:
 *      sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
 *    We insert the same sget BEFORE the iput (index of iput), so iput
 *    stores TRUE. Anchor = iput-object to the exact field; exactly 1 each.
 */
private object IsEncoderSupported : Fingerprint(
    definingClass = "Lcom/alightcreative/app/motion/scene/SceneExporterKt;",
    name = "isEncoderSupported",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(
        "Lcom/alightcreative/app/motion/scene/VideoEncoding;",
        "I",
        "I",
    ),
)

private object ReadEffect : Fingerprint(
    definingClass = "Lcom/alightcreative/app/motion/scene/visualeffect/VisualEffectParserKt;",
    name = "readEffect",
    returnType = "Lcom/alightcreative/app/motion/scene/visualeffect/VisualEffect;",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
)

private object SettingsInit : Fingerprint(
    definingClass = "Lcom/alightcreative/monorepo/settings/AlightSettingsEntity;",
    name = "<init>",
    returnType = "V",
)

private const val SETTINGS = "Lcom/alightcreative/monorepo/settings/AlightSettingsEntity;"
private val SETTINGS_FIELDS = listOf(
    "xmlImportEnabled",
    "creatorProgramEnabled",
    "creatorRankingEnabled",
    "cloudBackupEnabled",
)

@Suppress("unused")
val encoderEffectSettingsGatesPatch = bytecodePatch(
    name = "Pro video tools",
    description = "Unlocks pro encoder options, effects and settings.",
) {
    compatibleWith(ALIGHT_5270)
    execute {
        // 1. Encoder gate: prepend return-true (needs v0; .locals 1 stock).
        IsEncoderSupported.matchSingle()
        val enc = requireMethod(
            "Lcom/alightcreative/app/motion/scene/SceneExporterKt;",
            "isEncoderSupported",
            listOf("Lcom/alightcreative/app/motion/scene/VideoEncoding;", "I", "I"),
            "Z",
        )
        enc.ensureRegisters(1)
        enc.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        // 2. readEffect premium flag: single sk/P.b2()Z call -> force v5=1.
        ReadEffect.matchSingle()
        val re = requireMethod(
            "Lcom/alightcreative/app/motion/scene/visualeffect/VisualEffectParserKt;",
            "readEffect",
            listOf(
                "Lorg/xmlpull/v1/XmlPullParser;",
                "Ljava/lang/String;",
                "Landroid/net/Uri;",
                "Lsk/P;",
            ),
            "Lcom/alightcreative/app/motion/scene/visualeffect/VisualEffect;",
        )
        val reImpl = re.implementation ?: throw PatchException("Pure: readEffect has no impl")
        val b2 = reImpl.instructions.mapIndexedNotNull { i, insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            if (ref?.name == "b2" && ref.definingClass == "Lsk/P;") i else null
        }
        if (b2.size != 1) throw PatchException("Pure: readEffect b2() sites = ${b2.size}, expected 1")
        re.forceResultConst(b2[0], "const", "0x1")

        // 4. Settings fields: insert sget-TRUE before each target iput.
        SettingsInit.matchSingle()
        val init = mutableClassDefByOrNull(SETTINGS)?.methods?.singleOrNull {
            it.name == "<init>" && it.parameterTypes.size == 43
        } ?: throw PatchException("Pure: AlightSettingsEntity.<init>/43 not found")
        val impl = init.implementation ?: throw PatchException("Pure: settings <init> has no impl")
        // Collect iput indices per field first (indices shift on insert).
        val iputIdx = mutableMapOf<String, Int>()
        impl.instructions.toList().forEachIndexed { i, insn ->
            if (insn.opcode != Opcode.IPUT_OBJECT) return@forEachIndexed
            val ref = (insn as? ReferenceInstruction)?.reference
                as? com.android.tools.smali.dexlib2.iface.reference.FieldReference ?: return@forEachIndexed
            if (ref.definingClass == SETTINGS && ref.name in SETTINGS_FIELDS) {
                if (ref.name in iputIdx) throw PatchException("Pure: duplicate iput for ${ref.name}")
                iputIdx[ref.name] = i
            }
        }
        if (iputIdx.keys != SETTINGS_FIELDS.toSet()) {
            throw PatchException("Pure: settings iput fields = ${iputIdx.keys}, expected $SETTINGS_FIELDS")
        }
        for (field in iputIdx.keys.sortedBy { iputIdx[it]!! }.reversed()) {
            init.addInstructions(
                iputIdx[field]!!,
                "sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;",
            )
        }
    }
}
