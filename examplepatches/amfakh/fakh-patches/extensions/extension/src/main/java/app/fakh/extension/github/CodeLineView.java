/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.UnderlineSpan;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.TextView;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.fakh.extension.shared.Features;

/**
 * A line of a file or a diff in which addresses and references such as {@code owner/repo#123} are underlined and open
 * when tapped. The patch puts it in the app's line layout in place of the plain text view. Taps elsewhere on the line,
 * and holding it, still reach the row.
 */
@SuppressWarnings("unused")
public final class CodeLineView extends TextView {
    // An address or a reference. The app puts a zero width space before each highlighted word, which can fall inside an
    // address. Spaces are no-break ones, or dots after a word joiner with the Show whitespace patch, and end it.
    private static final Pattern LINK = Pattern.compile("https?://[^\\s\\u00A0\\u00B7\\u00BB\\u2060\"'<>`\\\\]+"
            + "|(?<![\\w./-])(?<![\\w./-]\\u200B)[A-Za-z0-9][\\w-]*+/[\\w.-]+#\\d+\\b");
    private static final String TAG = "FakhCodeLinks";

    private Link pressed;
    private final Runnable hold = () -> {
        pressed = null;
        if (getParent() instanceof View) ((View) getParent()).performLongClick();
    };

    /** Called by the layout inflater. */
    public CodeLineView(Context context, AttributeSet attributes) {
        super(context, attributes);
    }

    @Override
    public void setText(CharSequence text, BufferType type) {
        super.setText(linked(text), type);
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            pressed = at(event);
            if (pressed != null) {
                postDelayed(hold, ViewConfiguration.getLongPressTimeout());
                return true;
            }
        } else if (pressed != null) {
            if (action == MotionEvent.ACTION_UP) {
                removeCallbacks(hold);
                if (pressed == at(event)) open(pressed.address);
                pressed = null;
            } else if (action == MotionEvent.ACTION_CANCEL) {
                removeCallbacks(hold);
                pressed = null;
            }
            return true;
        }
        return super.onTouchEvent(event);
    }

    /** The text with its links marked, or the text itself when it has none or the switch is off. */
    private static CharSequence linked(CharSequence text) {
        if (text == null || !Features.on("fakh_linkify_code")) return text;
        Matcher found = LINK.matcher(text);
        SpannableString linked = null;
        while (found.find()) {
            String link = found.group().replace("​", "").replaceAll("[.,;:!?)\\]}]+$", "");
            int end = found.end();
            while (end > found.start() && ".,;:!?)]}​".indexOf(text.charAt(end - 1)) >= 0) end--;
            int hash = link.indexOf('#');
            String address = link.startsWith("http") ? link
                    : "https://github.com/" + link.substring(0, hash) + "/issues/" + link.substring(hash + 1);
            if (linked == null) linked = new SpannableString(text);
            linked.setSpan(new Link(address), found.start(), end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        return linked == null ? text : linked;
    }

    /** The link under a touch, or null. */
    private Link at(MotionEvent event) {
        if (!(getText() instanceof Spanned) || getLayout() == null) return null;
        int y = (int) event.getY() - getTotalPaddingTop() + getScrollY();
        float x = event.getX() - getTotalPaddingLeft() + getScrollX();
        int line = getLayout().getLineForVertical(y);
        if (x < getLayout().getLineLeft(line) || x > getLayout().getLineRight(line)) return null;
        int offset = getLayout().getOffsetForHorizontal(line, x);
        Link[] links = ((Spanned) getText()).getSpans(offset, offset, Link.class);
        return links.length > 0 ? links[0] : null;
    }

    /** Opens an address, GitHub's own in this app. */
    private void open(String address) {
        Uri uri = Uri.parse(address);
        Intent intent = new Intent(Intent.ACTION_VIEW, uri);
        Activity activity = MaterialYou.activity(getContext());
        if (activity == null) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            if ("github.com".equals(uri.getHost())) {
                try {
                    getContext().startActivity(new Intent(intent).setPackage(getContext().getPackageName()));
                    return;
                } catch (ActivityNotFoundException notInApp) {
                    Log.i(TAG, "The app does not open " + uri.getPath());
                }
            }
            getContext().startActivity(intent);
        } catch (ActivityNotFoundException error) {
            Log.w(TAG, "Link", error);
        }
    }

    /** One link of a line, drawn underlined in the code's own color. */
    private static final class Link extends UnderlineSpan {
        final String address;

        Link(String address) {
            this.address = address;
        }
    }
}
