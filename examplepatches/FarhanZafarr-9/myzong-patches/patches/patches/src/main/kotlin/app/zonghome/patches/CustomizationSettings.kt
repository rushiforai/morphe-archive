package app.zonghome.patches

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.PatchBuilder
import app.morphe.patcher.patch.booleanOption

/** Options belong to visible groups; their internal dependency patches read them at execution. */
internal object CustomizationSettings {
    private data class Binding(val option: Option<Boolean>, val inverted: Boolean)
    private val bindings = mutableMapOf<String, Binding>()

    fun register(hook: String, option: Option<Boolean>, inverted: Boolean) {
        check(bindings.put(hook, Binding(option, inverted)) == null) { "Duplicate setting: $hook" }
    }

    fun enabled(hook: String): Boolean {
        val binding = checkNotNull(bindings[hook]) { "Setting not registered: $hook" }
        val selected = binding.option.value == true
        return if (binding.inverted) !selected else selected
    }
}

internal fun PatchBuilder<*>.setting(
    hook: String, title: String, default: Boolean, inverted: Boolean = false,
    description: String? = null
) {
    val option = booleanOption(key = hook, title = SettingDescriptions.titles[hook] ?: title, default = default,
        description = SettingDescriptions.descriptions.getValue(hook), required = true)
    CustomizationSettings.register(hook, option, inverted)
}
