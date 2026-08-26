package app.mctoolbox.patches.installlocation

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mctoolbox.patches.shared.Constants.COMPATIBILITY_MCTOOLBOX

/**
 * Bypass Google Play Install Check — kurulum kaynagi kontrolunu gecersiz kil.
 *
 * MinecraftActivity.onCreate'un en basina test="0" pref'i DOGRUDAN yazilir;
 * installer adi ne olursa olsun (null/packageinstaller/baska market) uygulama
 * MCPE'nin Google Play'den kurulmus gibi davranir.
 *
 * Register guvenligi: onCreate .locals 14; metodun ilk talimatinda v11/v12/v13
 * canli deger tasimaz.
 */
@Suppress("unused")
val mctoolboxPlaySpoofPatch = bytecodePatch(
    name = "Bypass Google Play Install Check",
    description = "Minecraft'in nereden yuklendigi kontrol edilmez: her zaman Google Play'den kurulmus gibi islem gorur.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MCTOOLBOX)

    execute {
        val entryIdx = McPackageLookupFingerprint.instructionMatches[0].index
        McPackageLookupFingerprint.method.addInstructions(entryIdx, """
            invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
            move-result-object v11
            invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
            move-result-object v11
            const-string v12, "test"
            const-string v13, "0"
            invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences${'$'}Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
            move-result-object v11
            invoke-interface {v11}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
        """.trimIndent())
    }
}
