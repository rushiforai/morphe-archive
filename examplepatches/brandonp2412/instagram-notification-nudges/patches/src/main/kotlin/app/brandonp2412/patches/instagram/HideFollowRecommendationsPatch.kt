package app.brandonp2412.patches.instagram

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val extension = "Lcom/feurstagram/extension/"
private val config = Fingerprint(
    definingClass = "${extension}Config;", name = "isSuggestedBlocked",
    returnType = "Z", parameters = emptyList(), strings = listOf("block_suggested")
)
private val block = Fingerprint(
    definingClass = "${extension}Block;", name = "<clinit>", returnType = "V",
    strings = listOf("/discover/ayml/", "/discover/chaining/", "suggested_users", "suggested_top_accounts")
)
private val requests = Fingerprint(
    definingClass = "Lcom/instagram/newsfeed/followrequests/data/FollowRequestsGraphQLDataSource;",
    name = "BKY", returnType = "Ljava/lang/Object;", parameters = listOf("LX/0Yza;", "Z", "Z"),
    strings = listOf("exclude_suggested_users", "include_recent_auto_rf_followers")
)
private val carousel = Fingerprint(
    definingClass = "LX/0H2H;", name = "A01", returnType = "V", isStatic = true,
    strings = listOf("see_all_in_header"),
    parameters = listOf("Landroid/content/Context;", "Landroid/os/Parcelable;",
        "Landroidx/fragment/app/FragmentActivity;", "LX/0M0b;", "LX/02rz;",
        "Lcom/instagram/common/session/UserSession;", "LX/0H2W;", "LX/0G9u;",
        "LX/0bA7;", "LX/0O5i;", "LX/0alv;", "LX/0CW4;", "LX/0SiZ;", "LX/030q;",
        "Ljava/lang/Integer;", "Ljava/lang/String;", "Z", "Z")
)

private val paths = listOf(
    "/discover/ayml/", "/discover/sectioned_ayml/", "/discover/chaining/",
    "/discover/recommended_accounts_for_category/", "/discover/suggested_businesses/",
    "/discover/recs_from_friends_suggestions/", "/discover/recs_from_friends_user_info/",
    "/discover/fetch_suggestion_details/", "/discover/account_discovery/",
    "/discover/reshare_suggestions/", "/fbsearch/accounts_recs/",
    "/friendships/feed_favorites_suggestions/", "/friendships/share_to_friends_story_suggested_users/",
    "/direct_v2/search_friending_suggestions/", "/business/discovery/suggest_business/"
)
private val units = listOf("clips_netego", "stories_netego", "bloks_netego", "in_feed_survey",
    "suggested_users", "suggested_top_accounts", "suggested_igd_channels")

@Suppress("unused")
val hideFollowRecommendationsPatch = patch(
    name = "Hide follow recommendations",
    description = "Hide suggested accounts to follow without hiding normal posts or sharing. Requires FeurStagram 456.0.0.53.78.",
    default = false
) {
    compatibleWith(Compatibility(name = "Instagram (FeurStagram)", packageName = "com.instagram.android",
        apkFileType = ApkFileType.APK, targets = listOf(AppTarget(version = "456.0.0.53.78"))))
    execute {
        // Resolve and check all four hooks before modifying any of them.
        val configMethod = config.method
        val blockImpl = requireNotNull(block.method.implementation)
        val requestImpl = requireNotNull(requests.method.implementation)
        val carouselMethod = carousel.method
        val instructions = blockImpl.instructions.toList()
        fun arrayIndex(field: String, start: Int, values: List<String>): Int {
            val fieldIndex = instructions.indices.single { i ->
                val ref = (instructions[i] as? ReferenceInstruction)?.reference as? FieldReference
                instructions[i].opcode == Opcode.SPUT_OBJECT && ref?.definingClass == "${extension}Block;" && ref.name == field
            }
            val index = fieldIndex - 2
            val insn = instructions[index]
            require(insn.opcode == Opcode.FILLED_NEW_ARRAY_RANGE && insn is RegisterRangeInstruction &&
                insn.startRegister == start && insn.registerCount == values.size &&
                instructions[index + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
            for ((offset, value) in values.withIndex()) {
                val last = instructions.subList(0, index).lastOrNull { ins ->
                    (ins.opcode == Opcode.CONST_STRING || ins.opcode == Opcode.CONST_STRING_JUMBO) &&
                    (ins as OneRegisterInstruction).registerA == start + offset
                } as? ReferenceInstruction
                require((last?.reference as? StringReference)?.string == value) { "Account filter register changed: $value" }
            }
            return index
        }
        val pathsIndex = arrayIndex("SUGGESTED", 0, paths)
        val unitsIndex = arrayIndex("SUGGESTED_FEED_UNITS", 1, units)
        val req = requestImpl.instructions.toList()
        val key = req.indices.single { ((req[it] as? ReferenceInstruction)?.reference as? StringReference)?.string == "exclude_suggested_users" }
        require(req[key + 1].opcode == Opcode.MOVE_FROM16 && (req[key + 1] as OneRegisterInstruction).registerA == 3 &&
            req[key + 2].opcode == Opcode.INVOKE_STATIC)
        val row = requireNotNull(carouselMethod.implementation).instructions.toList()
        val ret = row.indices.single { row[it].opcode == Opcode.RETURN_VOID }
        require(row.any { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let { f ->
            f.definingClass == "LX/0O5i;" && f.name == "A09" &&
                f.type == "Lcom/instagram/ui/widget/nestablescrollingview/NestableHorizontalRecyclerPager;"
        } == true })
        require(carouselMethod.implementation!!.registerCount == 33)
        // Keep only account discovery paths, not sharing/favorites/search recipients.
        val pathType = (instructions[pathsIndex] as ReferenceInstruction).reference
        val unitType = (instructions[unitsIndex] as ReferenceInstruction).reference
        blockImpl.replaceInstruction(pathsIndex, BuilderInstruction3rc(Opcode.FILLED_NEW_ARRAY_RANGE, 0, 9, pathType))
        blockImpl.replaceInstruction(unitsIndex, BuilderInstruction35c(Opcode.FILLED_NEW_ARRAY, 2, 5, 6, 0, 0, 0, unitType))
        configMethod.returnEarly(true)
        requestImpl.replaceInstruction(key + 1, BuilderInstruction11n(Opcode.CONST_4, 3, 1))
        // Preserve normal binder work; collapse the dedicated recommendation row afterward.
        carouselMethod.addInstructions(ret, """
            move-object/from16 v0, p9
            iget-object v0, v0, LX/06Nf;->A0I:Landroid/view/View;
            const/16 v1, 0x8
            invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
        """)
    }
}
