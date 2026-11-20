package app.template.patches.shared.hevalcontrols

/**
 * One feature shown on the Patch settings screen, registered by the patch that implements it.
 *
 * @param id Stable key, `^[a-z][a-z0-9_.]{0,63}$`, conventionally `<app>.<feature>` (for example
 *        `linkedin.hide_promoted`). It names the saved choice, so never rename a shipped id.
 * @param name Row title.
 * @param description Row summary: what changes when the feature is on.
 * @param category Section the row is listed under, in first-registration order.
 * @param default Whether the feature is on before the user chooses (and before the settings
 *        engine has started). Keep it equal to today's always-on behaviour for converted patches.
 * @param restartRequired The app reads the gate once per process (for example in
 *        `Application.onCreate`), so a change applies after a restart. The screen shows a badge
 *        and a "Restart now" bar.
 * @param buildTimeOnly Applied at patch time (manifest, resources, removed code). Listed
 *        read-only as "Applied at patch time"; it has no runtime gate.
 * @param dependencies Ids of features that must be on for this one to take effect. A dependency
 *        missing from the APK makes this feature "Unsupported" (stock) at runtime.
 * @param kind [HevalFeatureKind.SWITCH] (on/off) or [HevalFeatureKind.LIST] (pick items to hide);
 *        declare lists with [HevalListFeature].
 */
data class HevalFeature(
    val id: String,
    val name: String,
    val description: String,
    val category: String,
    val default: Boolean = true,
    val restartRequired: Boolean = false,
    val buildTimeOnly: Boolean = false,
    val dependencies: List<String> = emptyList(),
    val kind: HevalFeatureKind = HevalFeatureKind.SWITCH,
    /**
     * Key of the row's icon on the Patch settings screen (`ads`, `shield`, `eye_off`, `bell`, ...,
     * see `ui/Icons.java`). Empty uses the icon of the category. Purely visual.
     */
    val icon: String = "",
    /**
     * Title of a single-choice group (for example "Animation speed"). Switches of one category that
     * share a title are shown as one row with an option each plus "Normal" (all off); the switches,
     * their ids and their hooks stay unchanged. Empty is a plain switch.
     */
    val choice: String = "",
    /**
     * Part of the "Calm mode" preset (a one-tap row of the Profiles section that turns on spoiler
     * protection and hides betting and promotions). Only for runtime switches.
     */
    val calm: Boolean = false,
) {
    init {
        require(ID_REGEX.matches(id)) { "Invalid Patch settings feature id: $id" }
        require(name.isNotBlank()) { "Feature $id has no name" }
        require(category.isNotBlank()) { "Feature $id has no category" }
        if (kind == HevalFeatureKind.LIST) {
            // An empty list is stock, so a list cannot start "on" or be fixed at patch time.
            require(!default) { "List feature $id cannot be on by default (an empty list is the default)" }
            require(!buildTimeOnly) { "List feature $id cannot be build-time-only" }
        }
        dependencies.forEach { dependency ->
            require(ID_REGEX.matches(dependency)) { "Feature $id has an invalid dependency id: $dependency" }
            require(dependency != id) { "Feature $id depends on itself" }
        }
        require(dependencies.toSet().size == dependencies.size) { "Feature $id lists a dependency twice" }
        require(icon.isEmpty() || ICON_REGEX.matches(icon)) { "Feature $id has an invalid icon key: $icon" }
        if (calm) {
            require(kind == HevalFeatureKind.SWITCH) { "List feature $id cannot be part of Calm mode" }
            require(!buildTimeOnly) { "Build-time-only feature $id cannot be part of Calm mode" }
        }
        if (choice.isNotEmpty()) {
            require(kind == HevalFeatureKind.SWITCH) { "List feature $id cannot be a choice option" }
            require(!buildTimeOnly) { "Build-time-only feature $id cannot be a choice option" }
            require(choice.isNotBlank() && choice.length <= 40) { "Feature $id has an invalid choice title" }
        }
    }

    companion object {
        val ID_REGEX = Regex("^[a-z][a-z0-9_.]{0,63}$")
        val ICON_REGEX = Regex("^[a-z][a-z0-9_]{0,31}$")
    }
}

/** What a Patch settings row is: an on/off switch or a "pick items to hide" list. */
enum class HevalFeatureKind {
    /** On/off; hooks call `HevalSettings.isEnabled(id)`. */
    SWITCH,

    /**
     * A multi-select list of items to hide; app extensions call `HevalSettings.getHidden(id)` /
     * `isHidden(id, key)` and feed the picker with `registerOptions` / `reportOptionsSeen`. An empty
     * list (the default) is stock.
     */
    LIST,
}

/**
 * A "pick items to hide" list setting (for example hidden countries). Registered like any feature,
 * with [HevalControlsHost.featurePatch] or [HevalControlsHost.register]. The id names the user's
 * saved picks, so never rename a shipped id.
 *
 * @param restartRequired The app reads the list once per process, so a change applies after a
 *        restart.
 * @param dependencies Ids of switches that must be on for this list to take effect.
 */
@Suppress("FunctionName")
fun HevalListFeature(
    id: String,
    name: String,
    description: String,
    category: String,
    restartRequired: Boolean = false,
    dependencies: List<String> = emptyList(),
    icon: String = "",
) = HevalFeature(
    id = id,
    name = name,
    description = description,
    category = category,
    default = false,
    restartRequired = restartRequired,
    dependencies = dependencies,
    kind = HevalFeatureKind.LIST,
    icon = icon,
)

/**
 * Writes the registry string that the patch puts into `Registry.encoded()` in the extension.
 * The Java decoder is `RegistryCodec` in `extensions/hevalcontrols/core`; both sides are pinned by
 * `extensions/hevalcontrols/core/src/test/resources/registry-v1.txt`.
 *
 * Version 1: a header line `hevalcontrols-registry:1`, then one line per feature with eight
 * tab-separated fields: id, name, description, category, default, restartRequired,
 * buildTimeOnly (`0`/`1`) and comma-separated dependencies. Text fields escape `\`, tab, LF and
 * CR as `\\`, `\t`, `\n` and `\r`. Bump [VERSION] only for an incompatible change: the decoder
 * ignores extra trailing fields, so adding a field at the end keeps version 1 readable.
 *
 * An icon (2026-11-09) adds a tenth field, the icon key (the ninth is then empty for a switch).
 * Features without an icon encode exactly as before. A list feature ([HevalFeatureKind.LIST], 2026-11-03) adds a ninth field, `list`. Switches never
 * get one, so a registry without lists encodes exactly as before (pinned by `registry-v1.txt`);
 * `registry-v1-lists.txt` pins a registry with a list.
 */
object HevalRegistryCodec {
    const val HEADER_PREFIX = "hevalcontrols-registry:"
    const val VERSION = 1

    /** The ninth field of a list record. */
    const val KIND_LIST = "list"

    fun encode(features: List<HevalFeature>): String {
        val duplicates = features.groupBy { it.id }.filterValues { it.size > 1 }.keys
        require(duplicates.isEmpty()) { "Duplicate Patch settings feature ids: $duplicates" }

        return buildString {
            append(HEADER_PREFIX).append(VERSION).append('\n')
            features.forEach { feature ->
                listOf(
                    feature.id,
                    escape(feature.name),
                    escape(feature.description),
                    escape(feature.category),
                    flag(feature.default),
                    flag(feature.restartRequired),
                    flag(feature.buildTimeOnly),
                    feature.dependencies.joinToString(","),
                ).let { fields ->
                    val kind = if (feature.kind == HevalFeatureKind.LIST) KIND_LIST else ""
                    when {
                        // The calm flag is the twelfth field, the choice title the eleventh, the icon the
                        // tenth and the kind the ninth; each earlier field is written empty when a later
                        // one is present.
                        feature.calm -> fields + kind + escape(feature.icon) + escape(feature.choice) + "1"
                        feature.choice.isNotEmpty() -> fields + kind + escape(feature.icon) + escape(feature.choice)
                        feature.icon.isNotEmpty() -> fields + kind + escape(feature.icon)
                        kind.isNotEmpty() -> fields + kind
                        else -> fields
                    }
                }.joinTo(this, "\t")
                append('\n')
            }
        }
    }

    private fun flag(value: Boolean) = if (value) "1" else "0"

    private fun escape(text: String) = buildString(text.length) {
        text.forEach { char ->
            when (char) {
                '\\' -> append("\\\\")
                '\t' -> append("\\t")
                '\n' -> append("\\n")
                '\r' -> append("\\r")
                else -> append(char)
            }
        }
    }
}
