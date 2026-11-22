package dev.rikunode.hatenabookmark

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * Verified target: Hatena Bookmark 5.80 / versionCode 58000.
 *
 * TopFragment.showAnnouncement(Announcement): void
 *
 * Expected original DEX layout:
 * - registerCount = 7
 * - codeUnits = 64
 * - first instruction calls Announcement.getId(): String
 *
 * Suppress only announcements whose text contains
 * "ブクマ数ランキング". Preserve all other announcements.
 */
private object WeeklyRankingAnnouncementFingerprint : Fingerprint(
    definingClass = "Lcom/hatena/android/bookmark/presentation/fragment/entrylist/TopFragment;",
    name = "showAnnouncement",
    parameters = listOf(
        "Lcom/hatena/client/model/Announcement;",
    ),
    returnType = "V",
)

@Suppress("unused")
val hideWeeklyRankingPatch = bytecodePatch(
    name = "Hide weekly bookmark ranking announcement",
    description = "Hide only weekly bookmark ranking announcements while preserving other announcements.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Hatena Bookmark",
            packageName = "com.hatena.android.bookmark",
            apkFileType = ApkFileType.APK,
            appIconColor = 0x2A9BD6,
            targets = listOf(
                AppTarget(version = "5.80", versionCode = 58000),
            ),
        )
    )

    val hideWeeklyRanking by booleanOption(
        key = "hideWeeklyRanking",
        default = true,
        title = "Hide weekly bookmark ranking",
        description = "Hide weekly bookmark ranking announcements.",
    )

    execute {
        // Disabled: leave the original method completely untouched.
        if (hideWeeklyRanking == false) return@execute

        val method = WeeklyRankingAnnouncementFingerprint.method
        val impl = requireNotNull(method.implementation) {
            "Hatena 5.80 showAnnouncement has no bytecode"
        }
        val instructions = impl.instructions

        require(impl.registerCount == 7) {
            "Unexpected register layout in Hatena 5.80 showAnnouncement"
        }
        require(instructions.sumOf { it.codeUnits } == 64) {
            "Unexpected Hatena 5.80 showAnnouncement code size"
        }

        val first = instructions.firstOrNull()
        require(
            first?.opcode == Opcode.INVOKE_VIRTUAL &&
                (first as? ReferenceInstruction)?.reference?.toString() ==
                    "Lcom/hatena/client/model/Announcement;->getId()Ljava/lang/String;"
        ) {
            "Unexpected first instruction in Hatena 5.80 showAnnouncement"
        }

        // p0 = TopFragment (this)
        // p1 = Announcement
        // v0, v1 = scratch registers, safe at method entry.
        //
        // Only suppress announcements containing the exact ranking phrase.
        // Null text and all other announcements follow the original code.
        method.addInstructionsWithLabels(
            0,
            """
                invoke-virtual { p1 }, Lcom/hatena/client/model/Announcement;->getText()Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :normal_announcement
                const-string v1, "ブクマ数ランキング"
                invoke-virtual { v0, v1 }, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :normal_announcement
                return-void
                :normal_announcement
                nop
            """.trimIndent(),
        )
    }
}
