package app.ytvr.patches

/**
 * The stored value a patch option's `values` map means by the string a host hands the patch.
 *
 * Since Morphe patcher 2.x, `values` maps a **display name to the stored value**: both hosts
 * render the map's keys in the picker and save its values when one is picked (Manager 2.2.0's
 * `DropdownOptionField`, Desktop's `PatchOptionEditor`). This bundle's options were declared in
 * the 1.x orientation, `{stored value: display name}`, so a host that rendered such a picker
 * *stored the display name* -- issue #45, where Manager 2.2.0 saved
 * 'Show on the seekbar only (never skips)' into `sponsorCategory` and the patch refused it.
 *
 * This accepts either: a display name resolves through the map, and anything that already is a
 * stored value passes through. Null for a string that is neither, so the caller can reject it
 * with its own message.
 */
internal fun <V> storedChoice(choices: Map<String, V>, raw: String): V? {
    // A display name resolves through the map; anything that already is a stored value passes.
    return choices[raw] ?: choices.values.firstOrNull { it == raw }
}
