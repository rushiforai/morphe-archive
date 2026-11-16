package app.morphe.extension.chmate

import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Search
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.SolidColor
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp

@OptIn(ExperimentalMaterial3Api::class)
@Composable
internal fun SettingsSearchField(value: String, onValueChange: (String) -> Unit, placeholder: String) {
    val interaction = remember { MutableInteractionSource() }
    BasicTextField(value, onValueChange, singleLine = true, interactionSource = interaction,
        textStyle = MaterialTheme.typography.bodyLarge.copy(color = MaterialTheme.colorScheme.onSurface),
        cursorBrush = SolidColor(MaterialTheme.colorScheme.primary),
        modifier = Modifier.fillMaxWidth().heightIn(min = 40.dp), decorationBox = { inner ->
            OutlinedTextFieldDefaults.DecorationBox(value, inner, enabled = true, singleLine = true,
                visualTransformation = VisualTransformation.None, interactionSource = interaction,
                placeholder = { Text(placeholder, style = MaterialTheme.typography.bodyLarge) },
                leadingIcon = { Icon(Icons.Filled.Search, null, Modifier.size(18.dp)) },
                contentPadding = PaddingValues(horizontal = 12.dp, vertical = 8.dp),
                container = { OutlinedTextFieldDefaults.Container(true, false, interaction,
                    shape = RoundedCornerShape(24.dp)) })
        })
}
