package app.xiondigital.tandemstudy.ui

import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color

private val Dark = darkColorScheme(
    primary = Color(0xFF2CC0D8),
    onPrimary = Color(0xFF04161A),
    secondary = Color(0xFF79A8FF),
    background = Color(0xFF050607),
    onBackground = Color(0xFFECEDEF),
    surface = Color(0xFF101318),
    onSurface = Color(0xFFECEDEF),
    surfaceVariant = Color(0xFF1A1F26),
    onSurfaceVariant = Color(0xFF8B9099),
)

@Composable
fun StudyTheme(content: @Composable () -> Unit) {
    MaterialTheme(colorScheme = Dark, content = content)
}
