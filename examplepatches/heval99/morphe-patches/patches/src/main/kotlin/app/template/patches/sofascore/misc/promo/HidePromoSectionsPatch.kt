package app.template.patches.sofascore.misc.promo

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.sofascore.controls.SOFASCORE_CONTROLS
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.sofascoreControls
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Firebase Remote Config's ConfigGetParameterHandler (R8-renamed) compiles the boolean value
// patterns in its <clinit>; the TRUE pattern's source is a stable SDK string.
private const val REMOTE_CONFIG_TRUE_REGEX = "^(1|true|t|yes|y|on)$"

/**
 * One switch per Remote Config key that turns a promotional section on, with its row title. The
 * extension's SofascoreControls.promoSectionFeature maps the keys to these ids. All start off and
 * need a restart: most are read once when a screen or the app starts. What each key shows was
 * read from its call sites only, not seen on screen.
 */
internal val PROMO_SECTION_FEATURES: List<Pair<String, HevalFeature>> = listOf(
    Triple("should_show_world_cup", "world_cup", "World Cup section"),
    Triple("should_show_sofa_season_2025", "sofa_season", "Sofa Season recap"),
    Triple("show_referral", "referral", "referral promotion"),
    Triple("fantasy_is_available", "fantasy", "Fantasy section"),
    Triple("show_pick_dream_team_banner", "dream_team", "Dream Team banner"),
    Triple("nba_banner", "nba", "NBA banner"),
    Triple("promotion_sfl", "sfl", "SFL promotion"),
    Triple("promotion_utr", "utr", "UTR promotion"),
    Triple("promotion_sevilla_and_marseille", "sevilla_marseille", "Sevilla and Marseille promotion"),
    Triple("in_app_message", "in_app_messages", "in-app messages"),
).map { (key, id, title) ->
    key to HevalFeature(
        id = "sofascore.hide_promo_$id",
        name = "Hide ${title.replaceFirstChar(Char::uppercaseChar)}",
        description = "Hides the $title.",
        category = SofascoreControlsCategory.PROMO_SECTIONS,
        default = false,
        restartRequired = true,
    )
}

// Several Heval Controls features in one patch: each is registered only when the app reads its key.
@Suppress("unused")
val hidePromoSectionsPatch = bytecodePatch(
    name = "Hide promo sections",
    description = "Adds switches to hide promotional sections.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    dependsOn(sofascoreControls.patch)

    execute {
        // The value-pattern holder, by its <clinit>.
        val handlers = classDefByStrings(REMOTE_CONFIG_TRUE_REGEX).filter { classDef ->
            classDef.methods.any { method ->
                method.name == "<clinit>" && method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == REMOTE_CONFIG_TRUE_REGEX
                } == true
            }
        }
        val handler = handlers.singleOrNull()?.type
            ?: throw PatchException("Expected one Remote Config value handler, found ${handlers.map { it.type }}")

        // FirebaseRemoteConfig.getBoolean(String) (R8-renamed, the handler's getBoolean inlined):
        // the instance (String)Z that reads the handler's static Patterns. The other readers are a
        // getDouble (String)D and a no-arg Z.
        val getters = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            getters += classDef.methods.filter { method ->
                !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Z" &&
                    method.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
                    method.implementation?.instructions?.any {
                        it.opcode == Opcode.SGET_OBJECT &&
                            ((it as ReferenceInstruction).reference as FieldReference).let { field ->
                                field.definingClass == handler && field.type == "Ljava/util/regex/Pattern;"
                            }
                    } == true
            }.map { classDef.type to it.name }
        }
        val (owner, name) = getters.singleOrNull()
            ?: throw PatchException("Expected one Remote Config getBoolean, found $getters")
        val getBoolean = mutableClassDefBy(owner).methods.single {
            it.name == name && it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
        }

        // The extension's own key switch does not count.
        val present = PROMO_SECTION_FEATURES.filter { (key, _) ->
            classDefByStrings(key).any { !it.type.startsWith("Lapp/template/extension/") }
        }
        if (present.isEmpty()) throw PatchException("The app reads none of the promo section keys")

        // While a key's switch is on, getBoolean(key) answers false, as if the server had turned
        // the section off. Every other key, and every key while its switch is off, is stock.
        getBoolean.requireNoBranchTargetAt(0, "promo section gate")
        if (getBoolean.implementation!!.registerCount - 2 < 1) {
            throw PatchException("${getBoolean.definingClass}->${getBoolean.name} has no local register")
        }
        getBoolean.addInstructionsWithLabelsChecked(
            0,
            """
                invoke-static/range { p1 .. p1 }, $SOFASCORE_CONTROLS->hidePromoSection(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :heval_stock
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
            ExternalLabel("heval_stock", getBoolean.getInstruction(0)),
        )

        present.forEach { (_, feature) -> sofascoreControls.register(feature) }
    }
}
