package app.morphe.extension.syncforreddit.translate;

import com.laurencedawson.reddit_sync.ui.fragment_dialogs.bottom.material_dialogs.base.AbstractSelectionDialogBottomSheet;

import java.lang.reflect.Field;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;

/**
 * An entry in a comment's own menu for translating the conversation under it.
 *
 * <p>Sync offers a comment and a whole thread and nothing between. A reply worth reading is
 * usually worth reading with the replies to it, and translating the whole of a long thread to
 * get at one exchange is a great deal of work for the little that was wanted.
 *
 * <p>Any comment in a conversation offers it, and what is translated is that comment and
 * everything under it.
 *
 * @noinspection unused
 */
public final class CommentMenu {
    private static final String TRANSLATE_THREAD = "Translate thread";
    private static final String UNTRANSLATE_THREAD = "Untranslate thread";

    /** What Sync's own translating entry is drawn with. */
    private static final String THE_PICTURE = "outline_translate_24";

    private CommentMenu() {}

    /** Called where a comment's menu has finished putting its own entries together. */
    public static void addTranslateThread(Object sheet) {
        try {
            if (!(sheet instanceof AbstractSelectionDialogBottomSheet)
                    || !TranslationSettings.enabled(Utils.getContext())) {
                return;
            }

            xa.d comment = commentOn(sheet);
            if (comment == null || !Markdown.worthTranslating(comment.o())) {
                return;
            }

            // What the comment itself stands as says which way round this will go. Reading the
            // whole conversation to find out would mean asking the store as the menu opens.
            String says = Originals.isTranslated(comment)
                    ? UNTRANSLATE_THREAD : TRANSLATE_THREAD;

            ((AbstractSelectionDialogBottomSheet) sheet).t4(
                    new AbstractSelectionDialogBottomSheet.h(
                            ResourceUtils.getIdentifier(ResourceType.DRAWABLE, THE_PICTURE),
                            says));
        } catch (Throwable ex) {
            // A menu without the entry beats a menu that will not open.
            Logger.printInfo(() -> "Could not offer to translate a thread: " + ex);
        }
    }

    /**
     * Called where a comment's menu is told which of its entries was tapped.
     *
     * @return Whether it was ours, and the app should do nothing more with it.
     */
    public static boolean tapped(Object sheet, Object entry) {
        try {
            if (!(entry instanceof AbstractSelectionDialogBottomSheet.h)) {
                return false;
            }
            String says = ((AbstractSelectionDialogBottomSheet.h) entry).b();
            if (!TRANSLATE_THREAD.equals(says) && !UNTRANSLATE_THREAD.equals(says)) {
                return false;
            }

            xa.d comment = commentOn(sheet);
            if (comment == null) {
                return false;
            }

            WithoutTheSheet.forThisAndUnder(comment, thePostOf(comment));
            ((AbstractSelectionDialogBottomSheet) sheet).x3();
            return true;
        } catch (Throwable ex) {
            Logger.printInfo(() -> "Could not translate the thread: " + ex);
            return false;
        }
    }

    /** @return The comment the menu is about, of which the sheet holds exactly one. */
    private static xa.d commentOn(Object sheet) throws Exception {
        for (Field each : sheet.getClass().getDeclaredFields()) {
            if (xa.d.class.isAssignableFrom(each.getType())) {
                each.setAccessible(true);
                return (xa.d) each.get(sheet);
            }
        }
        return null;
    }

    /**
     * @return The post the comment belongs to, which is how its thread is asked for. A comment
     *         names it with the kind in front of it, and the store is asked without.
     */
    private static String thePostOf(xa.d comment) {
        String post = comment.j0();
        if (post == null) {
            return null;
        }
        int names = post.indexOf('_');
        return names < 0 ? post : post.substring(names + 1);
    }
}
