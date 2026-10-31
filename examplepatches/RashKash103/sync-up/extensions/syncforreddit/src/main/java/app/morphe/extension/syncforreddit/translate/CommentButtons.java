package app.morphe.extension.syncforreddit.translate;

import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;

import androidx.fragment.app.FragmentManager;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * A button for translating in the row that appears under a comment when it is tapped.
 *
 * <p>Sync has no such button. Its own translating is offered from the menu at the top of a
 * thread and from a comment's own menu, and the row under a comment is a fixed set laid out in
 * the layout for it. So one is made and put at the end of that row as each comment is bound,
 * which asks nothing of the layout and leaves the row exactly as it was where translation is
 * turned off.
 *
 * @noinspection unused
 */
public final class CommentButtons {
    /** What Sync calls the row, which it kept the name of. */
    private static final String THE_ROW = "mCommentActions";

    /** How ours is told from the app's own, which are held in fields rather than looked up. */
    private static final String OURS = "sync-up-translate";

    private CommentButtons() {}

    /**
     * Called as a comment is bound to the row that draws it.
     *
     * @param holder  What draws the comment, which holds the row of buttons.
     * @param comment What is being drawn.
     */
    public static void onBind(Object holder, xa.d comment) {
        try {
            ViewGroup row = rowOf(holder);
            if (row == null || comment == null) {
                return;
            }

            TranslateButton ours = alreadyThere(row);
            if (!worthOffering(comment)) {
                if (ours != null) {
                    ours.setVisibility(View.GONE);
                }
                return;
            }

            if (ours == null) {
                ours = added(row);
                if (ours == null) {
                    return;
                }
            }

            boolean translated = Originals.isTranslated(comment);
            ours.setVisibility(View.VISIBLE);
            drawnLike(ours, row, translated);
            ours.setContentDescription(translated
                    ? "Undo the translation" : "Translate this comment");

            // A row is drawn again for another comment, so what it does is set every time.
            xa.d about = comment;
            Object drawnBy = holder;
            ours.setOnClickListener(tapped ->
                    WithoutTheSheet.forThis(about, whatOpensASheet(drawnBy)));
        } catch (Throwable ex) {
            // A comment that draws without the button beats one that does not draw.
            Logger.printInfo(() -> "Could not put a translate button under a comment: " + ex);
        }
    }

    /**
     * Gives the button the look of the ones beside it.
     *
     * <p>Each of those is told in the layout which colour to take and whether to show a ripple,
     * and a button made here is told neither: it is built with nothing to read those from, so it
     * falls back to the quieter colour and comes out grey beside the rest. Rather than guess at
     * what the layout says, the look is taken from a button that has it — which also means it
     * follows the theme wherever the others do, since this is done every time a comment is
     * drawn.
     */
    private static void drawnLike(TranslateButton ours, ViewGroup row, boolean translated) {
        try {
            View beside = neighbour(row, ours);
            if (!(beside instanceof ImageView)) {
                return;
            }

            // Standing translated is marked the way a saved comment is: the button keeps its
            // shape and takes a colour of its own.
            ours.setColorFilter(translated
                    ? new PorterDuffColorFilter(Labels.WHILE_TRANSLATED, PorterDuff.Mode.SRC_IN)
                    : ((ImageView) beside).getColorFilter());

            Drawable background = beside.getBackground();
            if (background != null && background.getConstantState() != null) {
                // A drawable holds the state of the view it is drawn for, so it is copied
                // rather than shared: pressing one button must not light up another.
                ours.setBackground(background.getConstantState().newDrawable().mutate());
            }
            ours.setPadding(beside.getPaddingLeft(), beside.getPaddingTop(),
                    beside.getPaddingRight(), beside.getPaddingBottom());
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not draw the translate button like the rest: " + ex);
        }
    }

    /**
     * @return A button beside ours to take the look from. The last of the row is the one that
     *         opens the rest of the menu, which is drawn plainly and is always there; the ones
     *         that vote are coloured by whether they have been used.
     */
    private static View neighbour(ViewGroup row, TranslateButton ours) {
        for (int at = row.getChildCount() - 1; at >= 0; at--) {
            View each = row.getChildAt(at);
            if (each != ours) {
                return each;
            }
        }
        return null;
    }

    /**
     * @return What a sheet can be opened with, which is wanted only where the language of a
     *         comment cannot be told and one has to be asked for. What draws a comment knows;
     *         it keeps the answer to itself, so it is asked rather than told.
     */
    private static Object whatOpensASheet(Object holder) {
        try {
            for (Class<?> each = holder.getClass(); each != null; each = each.getSuperclass()) {
                for (Method maybe : each.getDeclaredMethods()) {
                    if (maybe.getParameterTypes().length == 0
                            && FragmentManager.class.isAssignableFrom(maybe.getReturnType())) {
                        maybe.setAccessible(true);
                        return maybe.invoke(holder);
                    }
                }
            }
        } catch (Throwable ex) {
            Logger.printInfo(() -> "Could not find what opens a sheet: " + ex);
        }
        return null;
    }

    /** @return Whether there is anything about this comment worth offering to translate. */
    private static boolean worthOffering(xa.d comment) {
        try {
            return TranslationSettings.enabled(Utils.getContext())
                    && Markdown.worthTranslating(comment.o());
        } catch (Exception ex) {
            return false;
        }
    }

    /** @return The row of buttons, read off what draws the comment by the name Sync gives it. */
    private static ViewGroup rowOf(Object holder) throws Exception {
        if (holder == null) {
            return null;
        }
        for (Field each : holder.getClass().getDeclaredFields()) {
            if (THE_ROW.equals(each.getName()) && ViewGroup.class.isAssignableFrom(each.getType())) {
                each.setAccessible(true);
                return (ViewGroup) each.get(holder);
            }
        }
        return null;
    }

    /** @return Where in the row ours goes, which is in front of the last button there. */
    private static int nextToLast(ViewGroup row) {
        return Math.max(0, row.getChildCount() - 1);
    }

    /** @return Ours, where this row has already been given one. */
    private static TranslateButton alreadyThere(ViewGroup row) {
        View found = row.findViewWithTag(OURS);
        return found instanceof TranslateButton ? (TranslateButton) found : null;
    }

    /**
     * @return A button added to the row, next to last: the one that opens the rest of the menu
     *         stays where it is, at the end.
     *
     * <p>Every one of them is as wide as the whole row and carries a weight of one, which is how
     * a row of buttons is made to share the width evenly. The weight is the part that does that:
     * a button as wide as the row without one takes the whole of it and leaves the others
     * nothing, so it has to be carried across rather than the width alone.
     */
    private static TranslateButton added(ViewGroup row) {
        if (row.getChildCount() == 0) {
            return null;
        }

        TranslateButton ours = new TranslateButton(row.getContext());
        ours.setTag(OURS);

        ViewGroup.LayoutParams like = row.getChildAt(row.getChildCount() - 1).getLayoutParams();
        if (like instanceof LinearLayout.LayoutParams) {
            LinearLayout.LayoutParams beside = (LinearLayout.LayoutParams) like;
            LinearLayout.LayoutParams mine =
                    new LinearLayout.LayoutParams(beside.width, beside.height, beside.weight);
            mine.setMargins(beside.leftMargin, beside.topMargin, beside.rightMargin,
                    beside.bottomMargin);
            mine.gravity = beside.gravity;
            row.addView(ours, nextToLast(row), mine);
        } else if (like != null) {
            row.addView(ours, nextToLast(row), new ViewGroup.LayoutParams(like));
        } else {
            row.addView(ours, nextToLast(row));
        }
        return ours;
    }
}
