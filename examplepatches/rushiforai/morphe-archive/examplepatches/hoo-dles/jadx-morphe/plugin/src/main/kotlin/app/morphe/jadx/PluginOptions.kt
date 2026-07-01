package app.morphe.jadx

import jadx.api.plugins.options.impl.BasePluginOptionsBuilder

class PluginOptions : BasePluginOptionsBuilder() {
    var isAutocompleteEnabled: Boolean = false
        private set

    override fun registerOptions() {
        boolOption(Plugin.ID + ".autocomplete")
            .description("Enable autocomplete")
            .defaultValue(true)
            .setter { v: Boolean? -> this.isAutocompleteEnabled = v!! }
    }
}