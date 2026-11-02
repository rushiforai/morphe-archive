// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.tables;

import android.graphics.RectF;
import android.text.style.ClickableSpan;

/**
 * A cell of a table, or its expand or fit button, as accessibility shows it: its text, its
 * bounds relative to the table's top left (a cell's text's; empty when out of sight) and the
 * link a tap on it opens, if any.
 */
final class TablePart {
    final CharSequence text;
    final RectF bounds;
    final ClickableSpan link;
    final boolean isButton;

    TablePart(CharSequence text, RectF bounds, ClickableSpan link, boolean isButton) {
        this.text = text;
        this.bounds = bounds;
        this.link = link;
        this.isButton = isButton;
    }
}
