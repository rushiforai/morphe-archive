/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.comment;

import android.content.Context;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.functions.Function0;
import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.L10n;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/** An explicit action in the selected comment's native menu. */
public final class CommentCopy {
    private CommentCopy() {}

    interface NativeRows {
        String text(Object comment);
        Object row(Object callback);
        Object callback(Object row);
    }

    private static final NativeRows NATIVE = new NativeRows() {
        public String text(Object comment) { return CommentMenuNative.originalText(comment); }
        public Object row(Object callback) { return CommentMenuNative.newRow(callback); }
        public Object callback(Object row) { return CommentMenuNative.callback(row); }
    };

    public static List<?> rows(List<?> rows, Object comment, Context context) {
        return rows(rows, comment, context, NATIVE);
    }

    static List<?> rows(List<?> rows, Object comment, Context context, NativeRows nativeRows) {
        try {
            HookStatus.invoked(FamilyNames.COMMENT_COPY);
            if (rows == null || context == null || comment == null || !enabled()) return rows;
            String text = nativeRows.text(comment);
            int owned = 0;
            CopyAction existing = null;
            for (Object row : rows) {
                Object callback = nativeRows.callback(row);
                if (callback instanceof CopyAction) {
                    owned++;
                    existing = (CopyAction) callback;
                }
            }
            if (text == null || text.isEmpty()) {
                if (owned == 0) return rows;
                List<Object> cleaned = new ArrayList<>(rows.size() - owned);
                for (Object row : rows) {
                    if (!(nativeRows.callback(row) instanceof CopyAction)) cleaned.add(row);
                }
                return cleaned;
            }
            if (owned == 1 && text.equals(existing.text)) return rows;
            Object copy = nativeRows.row(new CopyAction(text, context));
            if (copy == null) return rows;
            List<Object> augmented = new ArrayList<>(rows.size() + 1);
            for (Object row : rows) {
                if (!(nativeRows.callback(row) instanceof CopyAction)) augmented.add(row);
            }
            augmented.add(copy);
            return augmented;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.COMMENT_COPY, "comment menu", failure);
            return rows;
        }
    }

    private static boolean enabled() {
        return Utils.settingsReady() && Settings.COPY_COMMENTS.get();
    }

    /** Holds only the original text and the short-lived menu's context. */
    public static final class CopyAction implements Function0<Object> {
        final String text;
        final Context context;

        CopyAction(String text, Context context) {
            this.text = text;
            this.context = context;
        }

        /** Instagram ignores this result, then dismisses its menu using the stock callback. */
        @Override public Object invoke() {
            try {
                if (!enabled()) return null;
                Utils.setClipboard(context, L10n.t(context, "Copy comment"), text);
                Utils.showToastShort(L10n.t(context, "Comment copied"));
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.COMMENT_COPY, "copy comment", failure);
                try {
                    Utils.showToastShort(L10n.t(context, "Couldn't copy comment"));
                } catch (Throwable feedbackFailure) {
                    HookStatus.threw(FamilyNames.COMMENT_COPY, "copy feedback", feedbackFailure);
                }
            }
            return null;
        }
    }
}
