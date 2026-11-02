// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.tables;

import static android.view.accessibility.AccessibilityNodeProvider.HOST_VIEW_ID;

import android.graphics.Rect;
import android.os.Bundle;
import android.text.Spanned;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Shows the tables of a TextView to accessibility. A table is drawn on one character of the text,
 * so screen readers and UI tests would see that character and nothing of its cells or its button:
 * each cell and the expand or fit button are virtual views of the TextView, with their text and
 * where they show, and the button and the cells with a link can be clicked.
 */
final class TableAccessibility extends View.AccessibilityDelegate {
    /** Virtual view ids per table: its cells and its button. */
    private static final int PARTS = 100_000;

    private static final int TAG_KEY = 0x7E7AB1E6;

    private final TextView view;
    private final AccessibilityNodeProvider provider = new AccessibilityNodeProvider() {
        @Override
        public AccessibilityNodeInfo createAccessibilityNodeInfo(int virtualViewId) {
            return virtualViewId == HOST_VIEW_ID ? host() : part(virtualViewId);
        }

        @Override
        public boolean performAction(int virtualViewId, int action, Bundle arguments) {
            if (virtualViewId == HOST_VIEW_ID) return view.performAccessibilityAction(action, arguments);
            if (action != AccessibilityNodeInfo.ACTION_CLICK) return false;
            Found found = find(virtualViewId);
            if (found == null) return false;
            if (found.part.isButton) {
                found.span.toggle();
                TableSpan.relayout(view);
            } else if (found.part.link != null) {
                found.part.link.onClick(view);
            } else {
                return false;
            }
            view.sendAccessibilityEvent(AccessibilityEvent.TYPE_VIEW_CLICKED);
            return true;
        }
    };

    private TableAccessibility(TextView view) {
        this.view = view;
    }

    /** Shows the tables of the view to accessibility, once per view. */
    static void install(TextView view) {
        if (view.getTag(TAG_KEY) != null) return;
        view.setTag(TAG_KEY, Boolean.TRUE);
        view.setAccessibilityDelegate(new TableAccessibility(view));
    }

    @Override
    public AccessibilityNodeProvider getAccessibilityNodeProvider(View host) {
        return provider;
    }

    /** The TextView itself, as it describes itself, with the tables' parts as its children. */
    private AccessibilityNodeInfo host() {
        AccessibilityNodeInfo info = AccessibilityNodeInfo.obtain(view);
        view.onInitializeAccessibilityNodeInfo(info);
        List<TableSpan> tables = tables();
        for (int table = 0; table < tables.size(); table++) {
            List<TablePart> parts = tables.get(table).parts();
            for (int index = 0; index < parts.size(); index++) {
                if (!parts.get(index).bounds.isEmpty()) info.addChild(view, table * PARTS + index);
            }
        }
        return info;
    }

    private AccessibilityNodeInfo part(int virtualViewId) {
        Found found = find(virtualViewId);
        if (found == null) return null;
        int[] origin = origin(found.span);
        if (origin == null) return null;
        TablePart part = found.part;
        String packageName = view.getContext().getPackageName();
        AccessibilityNodeInfo info = AccessibilityNodeInfo.obtain(view, virtualViewId);
        info.setParent(view);
        info.setPackageName(packageName);
        info.setClassName(part.isButton ? "android.widget.Button" : "android.widget.TextView");
        // Named as the patches name the views they make, so UI tests find them.
        info.setViewIdResourceName(packageName + ":id/baconreader_patches_table_" + (part.isButton ? "button" : "cell"));
        info.setText(part.text);
        info.setEnabled(true);
        Rect bounds = new Rect();
        part.bounds.roundOut(bounds);
        bounds.offset(origin[0], origin[1]);
        Rect shown = new Rect();
        boolean visible = view.getGlobalVisibleRect(shown) && bounds.intersect(shown);
        info.setBoundsInScreen(visible ? bounds : new Rect());
        info.setVisibleToUser(visible);
        if (part.isButton || part.link != null) {
            info.setClickable(true);
            info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK);
        }
        return info;
    }

    /** The table's top left on the screen, or null when its line isn't laid out. */
    private int[] origin(TableSpan span) {
        android.text.Layout layout = view.getLayout();
        CharSequence text = view.getText();
        if (layout == null || !(text instanceof Spanned)) return null;
        int start = ((Spanned) text).getSpanStart(span);
        if (start < 0) return null;
        int line = layout.getLineForOffset(start);
        int[] location = new int[2];
        view.getLocationOnScreen(location);
        location[0] += (int) (layout.getPrimaryHorizontal(start) + view.getTotalPaddingLeft() - view.getScrollX());
        location[1] += layout.getLineBaseline(line) + view.getTotalPaddingTop() - view.getScrollY() - span.height();
        return location;
    }

    private List<TableSpan> tables() {
        CharSequence text = view.getText();
        if (!(text instanceof Spanned)) return new ArrayList<>();
        final Spanned spanned = (Spanned) text;
        List<TableSpan> spans = new ArrayList<>(Arrays.asList(spanned.getSpans(0, spanned.length(), TableSpan.class)));
        Collections.sort(spans, new Comparator<TableSpan>() {
            @Override
            public int compare(TableSpan a, TableSpan b) {
                return Integer.compare(spanned.getSpanStart(a), spanned.getSpanStart(b));
            }
        });
        return spans;
    }

    private Found find(int virtualViewId) {
        List<TableSpan> tables = tables();
        int table = virtualViewId / PARTS;
        if (virtualViewId < 0 || table >= tables.size()) return null;
        TableSpan span = tables.get(table);
        List<TablePart> parts = span.parts();
        int index = virtualViewId % PARTS;
        if (index >= parts.size()) return null;
        return new Found(span, parts.get(index));
    }

    private static final class Found {
        final TableSpan span;
        final TablePart part;

        Found(TableSpan span, TablePart part) {
            this.span = span;
            this.part = part;
        }
    }
}
