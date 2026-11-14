package app.morphe.extension.chmate

import kotlin.math.roundToInt
import android.text.InputType
import android.view.View
import android.view.ViewGroup
import android.widget.*
import androidx.compose.foundation.background
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.foundation.clickable
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.selection.toggleable
import androidx.compose.foundation.selection.selectable
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.KeyboardArrowRight
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.draw.rotate
import androidx.core.graphics.drawable.toBitmap

/** Adapts the existing preference bindings to Compose controls, without mounting legacy Views.
 * Original listeners remain the single writer, preserving validation and restart behavior. */
internal data class BoundSetting(
    val control: View,
    val label: String,
    val available: () -> Boolean = { true },
    val enabled: Boolean = control.isEnabled && available(),
    val checked: Boolean? = (control as? CompoundButton)?.isChecked,
    val progress: Int? = (control as? SeekBar)?.progress,
    val description: String = "",
    val previewColor: Int? = control.getTag(PosterHighlight.COLOR_PREVIEW_TAG) as? Int,
    val children: List<BoundSetting>? = null,
    val searchTrail: String = "",
) {
    // Native Views are not Compose state. Include their current values in row equality so
    // Compose cannot skip a row whose saved value or dependent enabled state has changed.
    fun refreshed(): BoundSetting = BoundSetting(control, label, available = available, description = description,
        children = children?.map { it.refreshed() }, searchTrail = searchTrail)
    val keywords: String get() = label + " " + description + " " + searchTrail + " " +
        (control.getTag(SettingsSection.KEYWORDS_TAG) as? String).orEmpty() + " " + when (control) {
        is EditText -> control.hint?.toString().orEmpty() // Never index entered text or credentials.
        is TextView -> control.text.toString()
        else -> ""
    }
}

/** Paragraphs belong below the field, never inside its floating label. */
internal fun labeledSetting(control: View, text: String): BoundSetting {
    val detailed = text.contains('\n') || text.length > 100
    return BoundSetting(control, if (detailed) text.lineSequence().first().take(80) else text,
        description = if (detailed) text else "")
}

internal fun prepareSettingsBindings(root: ViewGroup) {
    for (index in 0 until root.childCount) {
        val view = root.getChildAt(index)
        if (view is LiveSettings.Choice) {
            // Deliver the initial selection normally sent by an attached Spinner.
            // LiveSettings suppresses saves for unchanged selections.
            view.onItemSelectedListener?.onItemSelected(view, null, view.selectedItemPosition, view.selectedItemId)
        } else if (view is ViewGroup) prepareSettingsBindings(view)
    }
}

internal fun settingsRows(root: ViewGroup): List<BoundSetting> = settingsRows(root, false)

internal fun settingsRows(root: ViewGroup, includeHidden: Boolean): List<BoundSetting> {
    val result = mutableListOf<BoundSetting>()
    fun collect(parent: ViewGroup, available: () -> Boolean = { true }, trail: String = "") {
        var index = 0
        while (index < parent.childCount) {
            val view = parent.getChildAt(index++)
            if (!includeHidden && view.visibility != View.VISIBLE) continue
            if (!includeHidden && view.getTag(SettingsSection.CATALOG_ONLY_TAG) == true) continue
            if (view is SettingsSection) {
                result.add(sectionSetting(view, includeHidden).inheriting(available, trail))
                continue
            }
            val next = parent.getChildAt(index)
            if (view is TextView && view !is Button && view !is EditText &&
                !view.hasOnClickListeners() && (next is EditText || next is Spinner || next is SeekBar)) {
                index++
                if (includeHidden || next.visibility == View.VISIBLE) {
                    val text = view.text.toString()
                    // Floating labels cannot display paragraphs, route syntax or examples.
                    // Keep the complete help text in the row, separate from its short label.
                    val row = if (next is SeekBar) BoundSetting(next, next.contentDescription?.toString().orEmpty())
                        else labeledSetting(next, text)
                    result.add(row.copy(available = available, enabled = row.enabled && available(), searchTrail = trail))
                }
            } else if (view is ViewGroup && view !is Spinner) collect(view, available, trail)
            else if (view is TextView || view is Spinner || view is ImageView || view is SeekBar) {
                val label = if (view is EditText) view.hint?.toString().orEmpty()
                    else if (view is TextView) view.text.toString() else view.contentDescription?.toString().orEmpty()
                result.add(BoundSetting(view, label, available = available, searchTrail = trail))
            }
        }
    }
    collect(root)
    val grouped = mutableListOf<BoundSetting>()
    for (row in result) {
        val help = row.control is TextView && row.control !is Button && row.control !is EditText &&
            !row.control.hasOnClickListeners() && !row.control.isLongClickable && row.previewColor == null && row.control.text !is android.text.Spanned
        if (help && grouped.isNotEmpty() && grouped.last().children == null) {
            val previous = grouped.removeAt(grouped.lastIndex)
            grouped.add(previous.copy(description = listOf(previous.description, row.label).filter { it.isNotBlank() }.joinToString("\n\n")))
        } else grouped.add(row)
    }
    return grouped
}

private fun BoundSetting.inheriting(parent: () -> Boolean, trail: String): BoundSetting {
    val own = available
    val combined = { parent() && own() }
    return copy(available = combined, enabled = control.isEnabled && combined(),
        children = children?.map { it.inheriting(parent, trail) }, searchTrail = trail + " " + searchTrail)
}

internal fun sectionSetting(section: SettingsSection, includeHidden: Boolean = false): BoundSetting =
    BoundSetting(section, section.title, description = section.summary,
        children = settingsRows(section, includeHidden).map { it.inheriting({ section.available.asBoolean }, section.title) })

/** Search and setting links see children even when their presentation is collapsed. */
internal fun flattenedSettingsRows(root: ViewGroup, includeHidden: Boolean = false): List<BoundSetting> {
    fun flatten(rows: List<BoundSetting>): List<BoundSetting> = rows.flatMap { row ->
        row.children?.let { flatten(it) } ?: listOf(row)
    }
    return flatten(settingsRows(root, includeHidden))
}

@OptIn(androidx.compose.foundation.ExperimentalFoundationApi::class)
@Composable
internal fun BoundSettingRow(item: BoundSetting, changed: () -> Unit) {
    val view = item.control
    when (view) {
        is SettingsSection -> {
            var expanded by remember(view) { mutableStateOf(!view.collapsed) }
            Column(Modifier.fillMaxWidth()) {
                ListItem(headlineContent = { Text(item.label, style = MaterialTheme.typography.titleMedium,
                    color = HaiagaruUi.settingsCategoryColor) },
                    supportingContent = { if (item.description.isNotBlank()) Text(item.description) },
                    trailingContent = { Icon(Icons.AutoMirrored.Filled.KeyboardArrowRight, null,
                        Modifier.rotate(if (expanded) 90f else 0f)) },
                    colors = ListItemDefaults.colors(containerColor = Color.Transparent),
                    modifier = Modifier.fillMaxWidth().clickable { expanded = !expanded })
                if (expanded) {
                    if (!view.available.asBoolean && view.unavailableMessage.isNotBlank()) Text(view.unavailableMessage,
                        Modifier.padding(12.dp), style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant)
                    Column(Modifier.padding(start = 12.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
                        item.children.orEmpty().forEachIndexed { index, child ->
                            if (index > 0) HorizontalDivider(Modifier.padding(horizontal = 12.dp),
                                color = MaterialTheme.colorScheme.outlineVariant)
                            BoundSettingRow(child.refreshed(), changed)
                        }
                    }
                }
            }
        }
        is android.widget.RadioButton -> {
            Row(Modifier.fillMaxWidth().heightIn(min = 56.dp).selectable(selected = item.checked == true, enabled = item.enabled, role = Role.RadioButton) {
                view.performClick()
                changed()
            }.padding(12.dp), verticalAlignment = Alignment.CenterVertically) {
                RadioButton(selected = item.checked == true, onClick = null, enabled = item.enabled)
                Text(item.label, Modifier.weight(1f).padding(start = 12.dp), style = MaterialTheme.typography.bodyLarge)
            }
        }
        is CompoundButton -> {
            Row(Modifier.fillMaxWidth().heightIn(min = 56.dp)
                .toggleable(item.checked == true, enabled = item.enabled, role = Role.Switch) {
                    if (view.isChecked != it) view.performClick()
                    changed()
                }.padding(horizontal = 12.dp, vertical = 12.dp),
                verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(16.dp)) {
                Text(item.label, Modifier.weight(1f), style = MaterialTheme.typography.bodyLarge,
                    color = if (item.enabled) MaterialTheme.colorScheme.onSurface else MaterialTheme.colorScheme.onSurfaceVariant)
                Switch(checked = item.checked == true, onCheckedChange = null, enabled = item.enabled)
            }
        }
        is SeekBar -> BoundSeekBar(view, item.label, changed)
        is EditText -> BoundTextField(view, item.label, enabled = item.enabled, changed = changed)
        is ImageView -> view.drawable?.let { drawable ->
            val bitmap = remember(drawable) { drawable.toBitmap(width = 96, height = 96).asImageBitmap() }
            Image(bitmap, view.contentDescription?.toString(), modifier = Modifier.size(56.dp).padding(8.dp)
                .combinedClickable(enabled = view.isEnabled && (view.hasOnClickListeners() || view.isLongClickable),
                    onClick = { view.performClick(); changed() }, onLongClick = { view.performLongClick(); changed() }),
                colorFilter = if (view.tag == false) androidx.compose.ui.graphics.ColorFilter.tint(MaterialTheme.colorScheme.onSurface) else null)
        }
        is Spinner -> {
            var choosing by remember(view) { mutableStateOf(false) }
            ListItem(headlineContent = { Text(item.label) },
                supportingContent = { Text(view.selectedItem?.toString().orEmpty()) },
                trailingContent = { Icon(Icons.AutoMirrored.Filled.KeyboardArrowRight, null) },
                colors = ListItemDefaults.colors(containerColor = Color.Transparent),
                modifier = Modifier.clickable(enabled = item.enabled) { choosing = true })
            if (choosing) AlertDialog(onDismissRequest = { choosing = false },
                title = { Text(item.label) }, text = {
                    androidx.compose.foundation.lazy.LazyColumn {
                        items(view.count) { index ->
                            Row(Modifier.fillMaxWidth().heightIn(min = 48.dp).selectable(selected = view.selectedItemPosition == index, role = Role.RadioButton) {
                                view.setSelection(index)
                                // Offscreen Spinners have no layout pass to deliver selection callbacks.
                                view.onItemSelectedListener?.onItemSelected(view, null, index, view.getItemIdAtPosition(index))
                                choosing = false; changed()
                            }.padding(vertical = 12.dp), verticalAlignment = Alignment.CenterVertically) {
                                RadioButton(selected = view.selectedItemPosition == index, onClick = null)
                                Text(view.getItemAtPosition(index).toString(), Modifier.weight(1f).padding(start = 12.dp))
                            }
                        }
                    }
                }, confirmButton = { TextButton(onClick = { choosing = false }) { Text("閉じる") } })
        }
        is Button -> ListItem(headlineContent = { Text(item.label) },
            trailingContent = { Icon(Icons.AutoMirrored.Filled.KeyboardArrowRight, null) },
            colors = ListItemDefaults.colors(containerColor = Color.Transparent),
            modifier = Modifier.fillMaxWidth().combinedClickable(enabled = item.enabled,
                onClick = { view.performClick(); changed() }, onLongClick = { view.performLongClick(); changed() }))
        is TextView -> {
            if (item.previewColor != null) Text(view.text.toString(),
                style = MaterialTheme.typography.bodyMedium, fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.onSurface,
                modifier = Modifier.fillMaxWidth().background(Color(item.previewColor), MaterialTheme.shapes.small).padding(12.dp))
            else if (view.hasOnClickListeners() || view.isLongClickable) Text(view.text.toString(),
                style = MaterialTheme.typography.labelLarge,
                modifier = Modifier.fillMaxWidth().heightIn(min = 48.dp)
                    .combinedClickable(enabled = view.isEnabled, onClick = { view.performClick(); changed() },
                        onLongClick = { view.performLongClick(); changed() }).padding(12.dp))
            else if (view.text.isNotBlank()) androidx.compose.foundation.text.selection.SelectionContainer {
                val content = androidx.compose.ui.text.buildAnnotatedString {
                    append(view.text.toString())
                    val spanned = view.text as? android.text.Spanned
                    spanned?.getSpans(0, spanned.length, android.text.style.URLSpan::class.java)?.forEach { link ->
                        addLink(androidx.compose.ui.text.LinkAnnotation.Url(link.url), spanned.getSpanStart(link), spanned.getSpanEnd(link))
                    }
                }
                Text(content, style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant, modifier = Modifier.padding(12.dp))
            }
        }
    }
    if (item.description.isNotBlank() && view !is SettingsSection) {
        HorizontalDivider(Modifier.padding(horizontal = 16.dp), color = MaterialTheme.colorScheme.outlineVariant)
        androidx.compose.foundation.text.selection.SelectionContainer {
            Text(item.description, style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                modifier = Modifier.fillMaxWidth().padding(horizontal = 16.dp, vertical = 12.dp))
        }
    }
}

@Composable
internal fun BoundTextField(view: EditText, title: String, enabled: Boolean = view.isEnabled, changed: () -> Unit = {}) {
    // TextFieldValue preserves cursor/selection/composition while the native binding validates text.
    var value by remember(view) { mutableStateOf(androidx.compose.ui.text.input.TextFieldValue(view.text.toString())) }
    val native = view.text.toString()
    if (value.text != native) value = androidx.compose.ui.text.input.TextFieldValue(native)
    val numeric = view.inputType and InputType.TYPE_MASK_CLASS == InputType.TYPE_CLASS_NUMBER
    val decimal = numeric && view.inputType and InputType.TYPE_NUMBER_FLAG_DECIMAL != 0
    val secret = view.inputType and InputType.TYPE_MASK_VARIATION == InputType.TYPE_TEXT_VARIATION_PASSWORD
    val archiveLayout = LocalArchiveControlLayout.current
    if (archiveLayout < 100) {
        androidx.compose.foundation.text.BasicTextField(value = value, onValueChange = {
            value = it
            if (it.text != view.text.toString()) view.setText(it.text)
            changed()
        }, enabled = enabled, singleLine = view.maxLines == 1,
            textStyle = MaterialTheme.typography.bodyLarge.copy(color = MaterialTheme.colorScheme.onSurface),
            keyboardOptions = KeyboardOptions(keyboardType = when {
                decimal -> KeyboardType.Decimal
                numeric -> KeyboardType.Number
                else -> KeyboardType.Text
            }), visualTransformation = if (secret) PasswordVisualTransformation() else VisualTransformation.None,
            modifier = Modifier.fillMaxWidth().padding(vertical = 2.dp),
            decorationBox = { input ->
                Surface(shape = MaterialTheme.shapes.small,
                    border = androidx.compose.foundation.BorderStroke(1.dp,
                        if (view.error != null) MaterialTheme.colorScheme.error else MaterialTheme.colorScheme.outline),
                    color = MaterialTheme.colorScheme.surfaceContainerLow) {
                    Column(Modifier.fillMaxWidth().heightIn(min = (48f + (archiveLayout - 50) * .16f).dp)
                        .padding(horizontal = 12.dp, vertical = (4f + (archiveLayout - 50) * .16f).dp),
                        verticalArrangement = Arrangement.Center) {
                        Text(title.ifBlank { "入力" }, style = MaterialTheme.typography.labelSmall, maxLines = 1,
                            overflow = androidx.compose.ui.text.style.TextOverflow.Ellipsis,
                            color = MaterialTheme.colorScheme.onSurfaceVariant)
                        input()
                    }
                }
            })
        view.error?.let { Text(it.toString(), color = MaterialTheme.colorScheme.error, style = MaterialTheme.typography.bodySmall) }
        return
    }
    OutlinedTextField(value = value, onValueChange = {
        value = it
        if (it.text != view.text.toString()) view.setText(it.text)
        changed()
    }, label = { Text(title.ifBlank { "入力" }, maxLines = 1,
        overflow = androidx.compose.ui.text.style.TextOverflow.Ellipsis) },
        modifier = Modifier.fillMaxWidth().padding(horizontal = 8.dp, vertical = 4.dp),
        enabled = enabled, singleLine = view.maxLines == 1,
        minLines = if (view.maxLines == 1) 1 else view.minLines.coerceIn(1, 12),
        keyboardOptions = KeyboardOptions(keyboardType = when {
            decimal -> KeyboardType.Decimal
            numeric -> KeyboardType.Number
            else -> KeyboardType.Text
        }),
        visualTransformation = if (secret) PasswordVisualTransformation() else VisualTransformation.None,
        isError = view.error != null,
        supportingText = if (view.error != null) ({ Text(view.error.toString()) }) else null,
        shape = androidx.compose.foundation.shape.RoundedCornerShape(16.dp))
}


@Composable
internal fun BoundSeekBar(view: SeekBar, label: String, changed: () -> Unit) {
    var progress by remember(view) { mutableIntStateOf(view.progress) }
    Column(Modifier.fillMaxWidth().padding(horizontal = 12.dp, vertical = 8.dp)) {
        Text(label, style = MaterialTheme.typography.bodyLarge)
        if (view is LiveSettings.Range) Text(view.valueText(), style = MaterialTheme.typography.bodyMedium)
        Slider(value = progress.toFloat().coerceIn(0f, view.max.coerceAtLeast(1).toFloat()),
            onValueChange = { value ->
                if (view is LiveSettings.Range) view.userProgress(value.roundToInt())
                else view.progress = value.roundToInt()
                progress = view.progress
                changed()
            },
            onValueChangeFinished = {
                if (view is LiveSettings.Range) view.finishUserChange()
                changed()
            },
            steps = (view.max - 1).coerceAtLeast(0),
            valueRange = 0f..view.max.coerceAtLeast(1).toFloat(),
            enabled = view.isEnabled)
    }
}
