package app.morphe.extension.syncforreddit.translate;

import android.view.View;

import com.laurencedawson.reddit_sync.ui.views.core.MaterialRow;

import java.lang.reflect.Field;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * What the entry in a menu says, which depends on what it would do.
 *
 * <p>Translating something already translated puts back what was written, so the entry that
 * does it should not still offer to translate. Sync renames an entry itself where the same is
 * true of saving — "Save" becomes "Unsave" — through the same method used here.
 *
 * @noinspection unused
 */
public final class Labels {
    private static final String TRANSLATE_A_COMMENT = "Translate comment";
    private static final String UNTRANSLATE_A_COMMENT = "Untranslate comment";
    private static final String TRANSLATE_TEXT = "Translate text";
    private static final String UNTRANSLATE_TEXT = "Untranslate text";

    /**
     * What marks a button as standing translated: a blue as bright against the rest as the
     * amber Sync gives a saved comment. Only a button is marked this way — a row in a menu says
     * what it will do and nothing more, which is what Sync's own Save row does.
     */
    static final int WHILE_TRANSLATED = 0xFF4FB0F5;

    /** What the row is called on the sheet, which Sync keeps its own name for. */
    private static final String THE_ROW = "mTranslate";


    private Labels() {}


    /**
     * @return Whether there is anything about this post worth translating: a title always,
     *         and a body where there is one. Nothing is offered while the setting is off.
     */
    private static boolean worthOffering(xa.d content) {
        try {
            if (!TranslationSettings.enabled(Utils.getContext())) {
                return false;
            }
            return Markdown.worthTranslating(content.b1())
                    || Markdown.worthTranslating(content.P0());
        } catch (Exception ex) {
            return false;
        }
    }

    /** @return What the entry in a comment's menu should say. */
    public static String forComment(xa.d content) {
        return Originals.isTranslated(content) ? UNTRANSLATE_A_COMMENT : TRANSLATE_A_COMMENT;
    }

    /**
     * Makes the entry in a post's menu ready: whether it is there at all, and what it says.
     *
     * <p>Sync shows it only for a post with a body, opened from the comments screen. A post
     * with nothing but a title is a post someone may want translated too, and a menu opened
     * over a feed is the same menu. So the entry is shown for anything with words in it,
     * wherever the menu was opened.
     *
     * <p>Only the sheet is handed over: every register around the entry is holding something,
     * one of them an argument the method was called with. Both the row and the post are read
     * off the sheet instead — the row by the name Sync gives it, which survived, and the post
     * by its type, which is the only one of its kind on the sheet.
     */
    public static void readyTheRow(Object sheet) {
        try {
            if (sheet == null) {
                return;
            }

            MaterialRow row = null;
            xa.d content = null;

            for (Field each : sheet.getClass().getDeclaredFields()) {
                if (row == null && THE_ROW.equals(each.getName())
                        && MaterialRow.class.isAssignableFrom(each.getType())) {
                    each.setAccessible(true);
                    row = (MaterialRow) each.get(sheet);
                } else if (content == null && xa.d.class.isAssignableFrom(each.getType())) {
                    each.setAccessible(true);
                    content = (xa.d) each.get(sheet);
                }
            }

            if (row == null || content == null) {
                return;
            }

            boolean translated = Originals.isTranslated(content);
            if (translated || worthOffering(content)) {
                row.setVisibility(View.VISIBLE);
            }
            // Only the wording changes, as Sync's own Save row changes to Unsave.
            row.k(translated ? UNTRANSLATE_TEXT : TRANSLATE_TEXT);
        } catch (Throwable ex) {
            // A menu that opens saying the wrong thing beats one that does not open.
            Logger.printInfo(() -> "Could not name the translate row: " + ex);
        }
    }
}
