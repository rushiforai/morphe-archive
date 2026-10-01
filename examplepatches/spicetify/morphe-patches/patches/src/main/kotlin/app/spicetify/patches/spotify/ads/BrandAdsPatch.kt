package app.spicetify.patches.spotify.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.spicetify.patches.spotify.settings.NativeSettingsAbi
import app.spicetify.patches.spotify.settings.enableSetting
import app.spicetify.patches.spotify.settings.settingsPatch
import app.spicetify.patches.spotify.spotifyCompatibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.util.Properties

private data class AdsHook(val owner: String, val methodName: String, val getter: String, val helper: String)

@Suppress("unused")
val brandAdsPatch = bytecodePatch(
    name = "Hide Home and Browse ads",
    description = "Hides image and video brand-ad sections on Home and Browse. " +
        "Does not suppress audio ads, player ads, or upgrade prompts. Experimental.",
    default = false,
) {
    compatibleWith(spotifyCompatibility)
    dependsOn(settingsPatch)

    execute {
        val snapshot = Properties().apply {
            NativeSettingsAbi::class.java.getResourceAsStream("/ads/9.1.80.2221.properties")!!.use(::load)
        }
        for (type in snapshot.stringPropertyNames()) {
            val definition = classDefByOrNull(type)
                ?: throw PatchException("Spotify advertising ABI changed: missing $type")
            if (NativeSettingsAbi.digest(definition) != snapshot.getProperty(type)) {
                throw PatchException("Spotify advertising ABI changed: $type. Use the verified Spotify 9.1.80.2221 APK.")
            }
        }

        for ((owner, methodName, getter, helper) in listOf(
            AdsHook(owner = "Lp/jb20;", methodName = "invoke",
                getter = "Lcom/spotify/casita/v1/resolved/HomeStructure;->p()Lp/ih40;", helper = "home"),
            AdsHook(owner = "Lp/vot;", methodName = "g",
                getter = "Lcom/spotify/casita/v1/resolved/HomeStructure;->p()Lp/ih40;", helper = "home"),
            AdsHook(owner = "Lp/x7v0;", methodName = "a",
                getter = "Lcom/spotify/browsita/v1/resolved/BrowseStructure;->o()Lp/ih40;", helper = "browse"),
        )) {
            val method = mutableClassDefBy(owner).methods.single { it.name == methodName }
            val instructions = method.implementation!!.instructions.toList()
            val matches = instructions.indices.filter {
                (instructions[it] as? ReferenceInstruction)?.reference.toString() == getter
            }
            if (matches.size != 1 || instructions.getOrNull(matches.single() + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("Expected one advertising section list in $owner->$methodName.")
            }
            val result = matches.single() + 1
            val register = (instructions[result] as OneRegisterInstruction).registerA
            // These consumers use Iterable.iterator, so a filtered copy does not mutate protobuf storage.
            method.addInstructions(result + 1, """
                invoke-static/range {v$register .. v$register}, Lapp/spicetify/extension/spotify/ads/BrandAds;->$helper(Ljava/util/List;)Ljava/util/List;
                move-result-object v$register
            """.trimIndent())
        }
        enableSetting("hideBrandAds")
    }
}
