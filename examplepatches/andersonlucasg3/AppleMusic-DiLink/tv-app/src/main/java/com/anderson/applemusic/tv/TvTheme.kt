package com.anderson.applemusic.tv

import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.tv.material3.LocalTextStyle
import androidx.tv.material3.MaterialTheme
import androidx.tv.material3.darkColorScheme

// Apple Music identity tokens: black canvas, dark surfaces, white/grey type and the
// single red accent. Kept here so the whole TV UI shares one palette.
internal val Background = Color(0xFF000000)
internal val Surface = Color(0xFF1C1C1E)
internal val SurfaceFocused = Color(0xFF2C2C2E)
internal val TextPrimary = Color(0xFFFFFFFF)
internal val TextSecondary = Color(0xFF8E8E93)
internal val Accent = Color(0xFFFA243C)
internal val SeekTrack = Color(0xFF3A3A3C)

internal val CardRadius = 14.dp
internal val OverlayRadius = 16.dp
internal val PagePadding = 32.dp
internal val SectionGap = 18.dp

/**
 * Inter (SIL OFL, see `res/raw/inter_license.txt`) instead of SF Pro, which cannot be
 * redistributed. Weights 400/500/600/700 are bundled as static TTFs.
 */
private val Inter = FontFamily(
    Font(R.font.inter_regular, FontWeight.Normal),
    Font(R.font.inter_medium, FontWeight.Medium),
    Font(R.font.inter_semibold, FontWeight.SemiBold),
    Font(R.font.inter_bold, FontWeight.Bold),
)

private val BaseTextStyle = TextStyle(fontFamily = Inter, color = TextPrimary)

@Composable
internal fun AppleMusicTvTheme(content: @Composable () -> Unit) {
    MaterialTheme(
        colorScheme = darkColorScheme(
            primary = Accent,
            onPrimary = TextPrimary,
            background = Background,
            onBackground = TextPrimary,
            surface = Surface,
            onSurface = TextPrimary,
            surfaceVariant = SurfaceFocused,
            onSurfaceVariant = TextSecondary,
        ),
    ) {
        // Every Text call inherits Inter; call sites keep passing their explicit size
        // and colour.
        CompositionLocalProvider(LocalTextStyle provides BaseTextStyle, content = content)
    }
}
