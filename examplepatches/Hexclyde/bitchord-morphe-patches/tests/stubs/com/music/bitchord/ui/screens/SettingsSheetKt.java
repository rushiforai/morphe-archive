package com.music.bitchord.ui.screens;

import androidx.compose.runtime.ComposerImpl;
import androidx.compose.runtime.internal.ComposableLambdaImpl;
import androidx.compose.ui.graphics.painter.Painter;
import androidx.compose.ui.graphics.vector.ImageVector;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

import java.util.*;

public final class SettingsSheetKt {
    public static final List<String> rows = new ArrayList<>();
    public static Function0<?> click;
    public static ComposerImpl lastComposer;
    public static int dividers;
    public static String groupHeader;

    @SuppressWarnings("unchecked")
    public static void SettingsGroup(
            String header,
            String footer,
            float spacing,
            ComposableLambdaImpl content,
            ComposerImpl composer,
            int flags,
            int defaults) {
        groupHeader = header;
        ((Function2<ComposerImpl, Integer, Object>) content.block).invoke(composer, 0);
    }

    public static void RowDivider(int flags, ComposerImpl composer) {
        dividers++;
        lastComposer = composer;
    }

    public static void SettingsRow(
            ImageVector icon,
            String title,
            String subtitle,
            Function2<?, ?, ?> subtitleContent,
            String value,
            String badge,
            boolean enabled,
            Painter painter,
            Function0<?> onClick,
            Function2<?, ?, ?> trailing,
            ComposerImpl composer,
            int flags,
            int defaults) {
        if (!enabled || onClick == null || composer == null || defaults != 0)
            throw new AssertionError("Incorrect row arguments");
        rows.add(title);
        click = onClick;
        lastComposer = composer;
    }
}
