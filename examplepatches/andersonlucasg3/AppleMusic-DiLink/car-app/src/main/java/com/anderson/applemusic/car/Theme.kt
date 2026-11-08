package com.anderson.applemusic.car

import androidx.compose.material3.LocalTextStyle
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

// Apple Music identity tokens shared by the whole touch UI: near-black canvas, dark
// surfaces, white/grey type and a single red accent.
internal val Background = Color(0xFF0A0A0B)
internal val PlayerColor = Color(0xFF000000)
internal val CardColor = Color(0xFF1C1C1E)
internal val CardColorPressed = Color(0xFF2C2C2E)
internal val TrackColor = Color(0xFF3A3A3C)
internal val TextPrimary = Color(0xFFFFFFFF)
internal val TextSecondary = Color(0xFF8E8E93)
internal val Accent = Color(0xFFFA243C)

internal val CardRadius = 16.dp
internal val ControlRadius = 14.dp
internal val PagePadding = 24.dp
internal val SectionGap = 28.dp

// Type scale shared with :tv-app (values in sp, so the head unit at 240 dpi draws the
// same optical sizes): display 32–36 (full player title), section 24–28 (shelf titles),
// card 15–16 (cover/list titles) and caption 12–13 (subtitles, timestamps, counts).
// Weights are limited to Inter 400 / 600 / 700.

/**
 * Inter (SIL OFL, see `res/raw/inter_license.txt`): 400/500/600/700 are bundled as
 * static TTFs. Android falls back to the platform font (FontFamily.Default) for any
 * glyph Inter does not cover.
 */
private val Inter = FontFamily(
    Font(R.font.inter_regular, FontWeight.Normal),
    Font(R.font.inter_medium, FontWeight.Medium),
    Font(R.font.inter_semibold, FontWeight.SemiBold),
    Font(R.font.inter_bold, FontWeight.Bold),
)

private val BaseTextStyle = TextStyle(fontFamily = Inter, color = TextPrimary)

@Composable
internal fun AppleMusicCarTheme(content: @Composable () -> Unit) {
    MaterialTheme(
        colorScheme = darkColorScheme(
            primary = Accent,
            onPrimary = TextPrimary,
            background = Background,
            onBackground = TextPrimary,
            surface = CardColor,
            onSurface = TextPrimary,
            surfaceVariant = CardColorPressed,
            onSurfaceVariant = TextSecondary,
        ),
    ) {
        // Every Text call inherits Inter; call sites still pass their explicit size and
        // colour.
        CompositionLocalProvider(LocalTextStyle provides BaseTextStyle, content = content)
    }
}
