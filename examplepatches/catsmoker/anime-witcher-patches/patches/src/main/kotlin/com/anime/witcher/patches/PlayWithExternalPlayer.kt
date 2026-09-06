package com.anime.witcher.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch

val playWithExternalPlayerPatch = bytecodePatch(
    name = "Play with external player",
    description = "Opens episodes in a system intent chooser so the user can pick their favorite video player (VLC, MX Player, etc.). Original APK: https://www.animewitcher.com/",
    default = true
) {
    compatibleWith(COMPATIBILITY_ANIME_WITCHER)

    execute {
        OpenStreamActivityFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
                move-result-object v0

                new-instance v1, Landroid/content/Intent;
                const-string v2, "android.intent.action.VIEW"
                invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

                const-string v2, "video/*"
                invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

                const/4 v2, 0x0
                const-string v3, "Open with"
                invoke-static {v1, v3}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;
                move-result-object v1

                invoke-virtual {p0, v1}, Lcom/anime/witcher/activites/ServersActivity;->startActivity(Landroid/content/Intent;)V

                return-void
            """
        )

        OnConfirmClickedFingerprint.method.let { method ->
            val implementation = method.implementation!!

            val awplayerIndex = implementation.instructions.indexOfFirst { instruction ->
                instruction.toString().contains("com.awystudio.awplayer")
            }

            if (awplayerIndex >= 0) {
                method.addInstructions(
                    awplayerIndex + 1,
                    """
                        const-string v1, "org.videolan.vlc"
                    """
                )
                method.removeInstruction(awplayerIndex)
            }
        }
    }
}
