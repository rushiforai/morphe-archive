package app.extremecardriving.patches.currency

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

// Mantık: Her Unity oyununda UnityPlayerActivity.onCreate vardır.
// Extreme için spesifik ExtremeActivity hedeflenir, ama filter'lar universal pattern gösterir.
// Sonraki oyunlarda sadece definingClass değiştir: örn. com.unity3d.player.UnityPlayerActivity
// veya oyunun MainActivity'si. Filters içinde ANRWatchdog gibi oyun-spesifik çağrılar
// fingerprint'i güçlendirir - yeni oyunda o oyunun unique methodCall'larını ekle.
object OnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/aim/ExtremeActivity;",
    name = "onCreate",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PROTECTED),
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(definingClass = "Lcom/aim/ExtremeActivity;", name = "getApplication"),
        methodCall(definingClass = "Lcom/aim/ANRWatchdog;", name = "<init>"),
        methodCall(
            definingClass = "Lcom/unity3d/player/UnityPlayerActivity;",
            name = "onCreate"
        )
    )
)
