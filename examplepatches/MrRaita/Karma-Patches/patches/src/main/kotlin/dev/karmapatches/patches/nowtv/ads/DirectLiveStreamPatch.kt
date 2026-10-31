package dev.karmapatches.patches.nowtv.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.karmapatches.debugLogSmali
import dev.karmapatches.patches.nowtv.NOW_TV_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * DENEYSEL, varsayılan KAPALI.
 *
 * Canlı yayında reklamlar Erstream DAION ile yayına gömülü (SSAI). İstemci tarafında
 * ayıklanamaz. Uygulama kaynaklarında DAION'suz bir canlı yayın adresi de var
 * (nowtv-live.ercdn.net/nowtv/playlistm.m3u8). Bu yama DAION'u atlayıp bu adresi,
 * uygulamanın KENDİ token üreticisiyle imzalayarak oynatmaya çalışır.
 * Sunucu bu adresi kabul etmezse canlı yayın açılmaz; yamayı kapatıp geri dön.
 */
@Suppress("unused")
val directLiveStreamPatch = bytecodePatch(
    name = "Live stream without ad insertion (experimental)",
    description = "Bypasses DAION and plays the plain live URL. May not work if the server rejects it.",
    default = false,
) {
    compatibleWith(NOW_TV_COMPATIBILITY)

    execute {
        val method = liveInitPlayerFingerprint.method
        val instructions = method.implementation!!.instructions

        // İlk liveStreamTokenGenerator çağrısı: bu noktada v3=url, v4=süre(int), v5=gizli anahtar,
        // v0=ExoPlayer, p0=LiveStreamFragment (orijinal kodda doğrulandı).
        val index = instructions.indexOfFirst {
            it.opcode == Opcode.INVOKE_DIRECT &&
                ((it as ReferenceInstruction).reference as? MethodReference)?.name == "liveStreamTokenGenerator"
        }
        require(index >= 0) { "liveStreamTokenGenerator call not found" }

        // Enjekte kod v3/v4/v5 kayıtlarına güveniyor. Sürüm farkında düzen değiştiyse
        // çalışma anında VerifyError yerine yamalama sırasında net hatayla dur.
        val call = instructions.elementAt(index) as FiveRegisterInstruction
        require(call.registerCount == 4 && call.registerD == 3 && call.registerE == 4 && call.registerF == 5) {
            "Unexpected register layout around liveStreamTokenGenerator call; patch not safe for this app version"
        }

        method.addInstructions(
            index,
            """
                const-string v3, "https://nowtv-live.ercdn.net/nowtv/playlistm.m3u8"
                invoke-direct { p0, v3, v4, v5 }, Ltr/com/nowtv/android/fragments/LiveStreamFragment;->liveStreamTokenGenerator(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
                move-result-object v3
                new-instance v2, Lcom/google/android/exoplayer2/MediaItem${'$'}Builder;
                invoke-direct { v2 }, Lcom/google/android/exoplayer2/MediaItem${'$'}Builder;-><init>()V
                invoke-virtual { v2, v3 }, Lcom/google/android/exoplayer2/MediaItem${'$'}Builder;->setUri(Ljava/lang/String;)Lcom/google/android/exoplayer2/MediaItem${'$'}Builder;
                move-result-object v2
                invoke-virtual { v2 }, Lcom/google/android/exoplayer2/MediaItem${'$'}Builder;->build()Lcom/google/android/exoplayer2/MediaItem;
                move-result-object v2
                invoke-interface { v0, v2 }, Lcom/google/android/exoplayer2/ExoPlayer;->setMediaItem(Lcom/google/android/exoplayer2/MediaItem;)V
                invoke-interface { v0 }, Lcom/google/android/exoplayer2/ExoPlayer;->prepare()V
                const/4 v2, 0x1
                invoke-interface { v0, v2 }, Lcom/google/android/exoplayer2/ExoPlayer;->setPlayWhenReady(Z)V
                ${debugLogSmali("v6", "v7", "live stream played without ad insertion")}
                return-void
            """,
        )
    }
}
