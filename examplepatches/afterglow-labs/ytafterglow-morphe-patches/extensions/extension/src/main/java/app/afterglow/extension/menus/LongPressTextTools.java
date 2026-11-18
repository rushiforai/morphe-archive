/* Copyright 2026 Morphe. Adapted for YTAfterglow from Copy text, commit
 * 44031c561ea048c8f196877f30a49c13bfd6afb6, pull request 3592.
 * https://github.com/MorpheApp/morphe-patches
 * See NOTICE for GPLv3 Section 7 terms. Not an official Morphe file.
 * Changes: title/description only, Afterglow live owner/settings gates, typed native
 * bridges, per-gesture text snapshots, recycled-view checks and listener ownership.
 * Portions provided "AS IS" by the Morphe software project, without express or implied
 * warranties, including merchantability and fitness for a particular purpose.
 */
package app.afterglow.extension.menus;

import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.i18n.L10n;
import app.afterglow.extension.litho.LithoContext;
import app.afterglow.extension.settings.LiteMode;

/** Temporary Morphe text interaction for copyVideoInfo, until the iOS header sheet is ported. */
public final class LongPressTextTools {
    private static final LongPressTextPolicy TEXTS = new LongPressTextPolicy();
    private LongPressTextTools() {}

    private static boolean enabled() {
        return InstalledTweaks.has("long-press-tools") && LiteMode.effectiveBool("copyVideoInfo");
    }

    /** Observe native text, including cached text. The original CharSequence is never modified. */
    public static void onText(LithoContext context, CharSequence text) {
        if (!InstalledTweaks.has("long-press-tools") || context == null || text == null) return;
        try {
            // Observe while OFF too, so an already mounted view works immediately after enabling.
            TEXTS.observe(context.afterglow_getIdentifier(), context.afterglow_getPathBuilder(), text);
        } catch (Throwable error) { Afterglow.error("LongPressTextTools.onText", error); }
    }

    /** Called before the native ComponentHost dispatch. Native dispatch always runs unchanged. */
    public static void touch(View host, MotionEvent event) {
        if (event == null || event.getActionMasked() != MotionEvent.ACTION_DOWN
                || !(host instanceof LongPressTextHost)) return;
        try {
            clearOwnListener(host);
            if (!enabled()) return;
            LongPressTextPolicy.Match match = TEXTS.match(((LongPressTextHost) host).afterglow_textItems());
            if (match == null) return;
            View target = clickableHost(host);
            if (target == null && match.selectable) target = host;
            if (target == null) return;
            clearOwnListener(target);
            // Litho retains its cached listener while disabling longClickable,
            // and may re-enable that listener without calling its setter again.
            if (((LongPressTextHost) target).afterglow_longPressListener() != null
                    || target.isLongClickable()) return;
            target.setOnLongClickListener(new TextPress(host, match));
        } catch (Throwable error) { Afterglow.error("LongPressTextTools.touch", error); }
    }

    private static void clearOwnListener(View view) {
        if (view instanceof LongPressTextHost
                && ((LongPressTextHost) view).afterglow_longPressListener() instanceof TextPress) {
            view.setOnLongClickListener(null);
            view.setLongClickable(false);
        }
    }

    private static View clickableHost(View view) {
        while (view instanceof LongPressTextHost) {
            if (view.isClickable()) return view;
            ViewParent parent = view.getParent();
            if (!(parent instanceof View)) return null;
            view = (View) parent;
        }
        return null;
    }

    private static final class TextPress implements View.OnLongClickListener {
        final WeakReference<View> source;
        final LongPressTextPolicy.Match captured;
        TextPress(View source, LongPressTextPolicy.Match captured) {
            this.source = new WeakReference<>(source);
            this.captured = captured;
        }
        @Override public boolean onLongClick(View view) {
            try {
                View host = source.get();
                if (!enabled() || host == null || !host.isAttachedToWindow() || !host.isShown()
                        || !view.isAttachedToWindow()) return false;
                LongPressTextPolicy.Match current = TEXTS.match(((LongPressTextHost) host).afterglow_textItems());
                if (current == null || current.selectable != captured.selectable
                        || !current.text.equals(captured.text)) return false;
                if (captured.selectable) showText(view.getContext(), captured.text);
                else copy(view.getContext(), captured.text);
                return true;
            } catch (Throwable error) {
                Afterglow.error("LongPressTextTools.longPress", error);
                return false;
            }
        }
    }

    private static void showText(Context context, String text) {
        AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle(L10n.get("CopyDescription", "Copy description"))
                .setMessage(text)
                .setPositiveButton(L10n.get("Copy", "Copy"), (ignored, which) -> {
                    if (!enabled()) return;
                    try { copy(context, text); }
                    catch (Throwable error) { Afterglow.error("LongPressTextTools.copy", error); }
                })
                .setNegativeButton(L10n.get("Cancel", "Cancel"), null).create();
        dialog.setOnShowListener(ignored -> {
            TextView message = dialog.findViewById(android.R.id.message);
            if (message != null) message.setTextIsSelectable(true);
        });
        dialog.show();
    }

    private static void copy(Context context, String text) {
        ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard == null) throw new IllegalStateException("Clipboard service unavailable");
        clipboard.setPrimaryClip(ClipData.newPlainText("", text));
        Toast.makeText(context, L10n.get("Copied", "Copied to clipboard"), Toast.LENGTH_SHORT).show();
    }
}
