package io.github.xxlc.patches.grok

import app.morphe.patcher.patch.PatchBuilder
import app.morphe.patcher.patch.booleanOption

// Selecting patch applies it; option allows disabling while keeping selection in Manager.
// Extension does not persist settings at runtime.
internal fun PatchBuilder<*>.enabledOption(default: Boolean = true) = booleanOption(
    key = "enabled",
    default = default,
    title = "Enable patch",
    description = "Applied by default when the patch is selected; turn off to skip its changes while keeping it selected.",
    required = true,
)
