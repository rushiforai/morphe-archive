package app.template.patches.bleacherreport.betting

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.bleacherreport.shared.fieldRef
import app.template.patches.bleacherreport.shared.insns
import app.template.patches.bleacherreport.shared.isStatic
import app.template.patches.bleacherreport.shared.returnNull
import app.template.patches.bleacherreport.shared.single
import app.template.patches.bleacherreport.shared.smali
import app.template.patches.bleacherreport.shared.stringRef
import app.template.patches.shared.Constants.COMPATIBILITY_BLEACHER_REPORT
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

@Suppress("unused")
val hideBettingContentPatch = bytecodePatch(
    name = "Hide betting content",
    description = "Hides odds and betting content.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_BLEACHER_REPORT)

    execute {
        // 1. Game page: the Stats item mapper (11.14.0.35: the GamecastItemMapperImpl.kt instance
        // method; 11.12.0.33: a static one in ChannelItemsMapper.kt) answers null for the betting stats types, as it already does for
        // types without data; its caller passes the null on and the item is left out.
        val stats = single(StatsItemToStringFingerprint, "ChannelItemType.Stats toString").classDef
        val typeField = stats.fields.singleOrNull { !AccessFlags.STATIC.isSet(it.accessFlags) }
            ?: throw PatchException("Hide betting content: ${stats.type} does not hold a single StatsItemType")
        val statsItemType = classDefByOrNull(typeField.type)
        val typeNames = statsItemType?.methods?.filter { it.name == "<clinit>" }?.flatMap { it.insns() }
            ?.mapNotNull { it.stringRef() }?.toSet().orEmpty()
        if (statsItemType?.superclass != "Ljava/lang/Enum;" || !typeNames.containsAll(BETTING_STATS_ITEMS)) {
            throw PatchException(
                "Hide betting content: ${typeField.type} is not the StatsItemType enum, or lost " +
                    BETTING_STATS_ITEMS.filterNot { it in typeNames },
            )
        }
        val mapper = single(
            Fingerprint(
                // 11.12.0.33: static ChannelItemsMapper.kt a(Stats, model); 11.14.0.35: instance
                // GamecastItemMapperImpl.kt a(model, Stats). Either way: the only two-parameter
                // method taking the Stats item with an object result, in one of those two classes.
                custom = { method, classDef ->
                    classDef.sourceFile?.let { it == "GamecastItemMapperImpl.kt" || it == "ChannelItemsMapper.kt" } == true &&
                        method.implementation != null && method.returnType.startsWith("L") &&
                        method.parameterTypes.size == 2 && method.parameterTypes.any { it.toString() == stats.type }
                },
            ),
            "Stats item mapper",
        ).method
        val statsParam = mapper.parameterTypes.indexOfFirst { it.toString() == stats.type }
        val locals = mapper.implementation!!.registerCount - mapper.parameterTypes.size - (if (mapper.isStatic()) 0 else 1)
        if (locals < 2) throw PatchException("Hide betting content: the Stats item mapper has fewer than 2 locals")
        // The Stats parameter register (11.14.0.35: .registers 21, p2 = v20) is above v15, so it
        // is copied to v0 before the 4-bit iget-object. v0 and v1 are written by the stock code
        // before it reads them.
        val statsRegister = locals + (if (mapper.isStatic()) 0 else 1) + statsParam
        val field = "${stats.type}->${typeField.name}:${typeField.type}"
        val checks = BETTING_STATS_ITEMS.joinToString("\n") { name ->
            """
                const-string v1, "$name"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-nez v1, :hide_betting
            """
        }
        mapper.addInstructionsWithLabelsChecked(
            0,
            """
                if-eqz v$statsRegister, :stock
                move-object/from16 v0, v$statsRegister
                iget-object v0, v0, $field
                if-eqz v0, :stock
                invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;
                move-result-object v0
                $checks
                goto :stock
                :hide_betting
                const/4 v0, 0x0
                return-object v0
            """,
            ExternalLabel("stock", mapper.getInstruction(0)),
        )

        // 2. Feeds: the odds module and trending bets module mappers answer null. Their only
        // caller (the content module mapper) already returns null for unsupported modules, and
        // every list caller drops null; the standalone module screens show their error state.
        single(OddsModuleMapperFingerprint, "OddsStateMapper odds module mapper").method.returnNull()
        single(TrendingBetsModuleMapperFingerprint, "TrendingBetsStateMapper module mapper").method.returnNull()

        // 3. Scores screen: the model stores no betting link and no betting disclaimer. Both are
        // nullable (hashCode and the channel mapper null-check them). The fields are the ones
        // toString prints after their labels.
        val scores = single(ScoresToStringFingerprint, "Scores toString")
        val toString = scores.method.insns()
        val bettingFields = listOf(", bettingLink=", ", bettingDisclaimer=").map { label ->
            val at = toString.indexOfFirst { it.stringRef() == label }
            toString.drop(at + 1).firstOrNull {
                it.opcode == Opcode.IGET_OBJECT && it.fieldRef()?.definingClass == scores.classDef.type
            }?.fieldRef() ?: throw PatchException("Hide betting content: Scores toString reads no field after \"$label\"")
        }
        val constructors = scores.classDef.methods.filter { it.name == "<init>" && it.implementation != null }
        for (betting in bettingFields) {
            var stores = 0
            for (constructor in constructors) {
                val indices = constructor.insns().withIndex().filter { (_, insn) ->
                    insn.opcode == Opcode.IPUT_OBJECT && insn.fieldRef()?.smali() == betting.smali()
                }
                for ((index, insn) in indices.sortedByDescending { it.index }) {
                    if (constructor.implementation!!.instructions[index].location.labels.isNotEmpty()) {
                        throw PatchException("Hide betting content: the Scores ${betting.name} store is a branch target")
                    }
                    val register = (insn as TwoRegisterInstruction).registerA
                    constructor.addInstructionsChecked(
                        index,
                        if (register < 16) "const/4 v$register, 0x0" else "const/16 v$register, 0x0",
                    )
                    stores++
                }
            }
            if (stores == 0) throw PatchException("Hide betting content: no Scores constructor stores ${betting.name}")
        }
    }
}
