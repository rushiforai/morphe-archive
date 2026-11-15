package app.morphe.extension.syncforreddit.ui.cards;

import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;

import java.lang.reflect.Field;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;

/**
 * Putting a link post's picture above its title where the card is too narrow to hold both side
 * by side.
 *
 * <p>A link post's card is a {@code RelativeLayout} holding two things: the title and whatever
 * goes under it, laid out {@code toLeftOf} the picture, and an 80dp square picture against the
 * right edge. At one column that reads well. At two the card is about half the screen, the
 * picture and its margins take a hundred density pixels of it, and what is left for the words is
 * narrow enough that a title comes out a word or two per line — the long thin column the reader
 * sees. Three columns is worse again.
 *
 * <p>So where the feed is drawn in more than one column the two are stacked instead, which is
 * what an image post's card already does: the picture goes across the top of the card and the
 * words have the whole width underneath. Nothing is moved to a different parent to do it — the
 * picture stays a child of the same {@code RelativeLayout} and keeps its
 * {@code RelativeLayout.LayoutParams}, because Sync's own {@code CardLinkHolder} casts to that
 * type every time it dresses the row and would throw the moment it found anything else.
 *
 * <p>Two things beyond the rules have to be said as well. The picture is asked of Glide at the
 * 80dp it used to be drawn at, held in two fields on the view, so stretching the view without
 * raising those gives a crisp square blown up into a blurry banner; they are raised to the width
 * the picture is really being drawn at. And the height is settled from the width as the card is
 * laid out rather than written down here, so it is a banner at whatever width the column
 * actually turns out to be, on a phone, on a tablet, and after a fold.
 *
 * @noinspection unused
 */
public final class NarrowLinkCards {
    private NarrowLinkCards() {}

    /** The picture in a link post's card. */
    private static final String THUMBNAIL = "thumbnail";

    /**
     * How wide the banner is against its height. Sixteen to nine is what a picture on the web is
     * most often shaped like, and it is what Sync's own image cards come closest to.
     */
    private static final float WIDTH_OVER_HEIGHT = 16f / 9f;

    /**
     * Never taller than this much of the card's width, so that a very narrow column does not
     * produce a card that is almost all picture.
     */
    private static final float TALLEST = 0.75f;

    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /**
     * Called as a link post's card is built, once per holder rather than once per post, so the
     * rules are written while nothing is bound and every post that lands in this holder is drawn
     * the new way.
     *
     * @param root     The inflated card.
     * @param viewMode Sync's own number for the way the feed is drawn, which is what decides the
     *                 column count along with the orientation.
     */
    public static void over(View root, int viewMode) {
        try {
            if (!isPatchIncluded() || root == null) {
                return;
            }

            int columns = columns(viewMode);
            if (columns <= 1) {
                // One column has the room for the picture to sit beside the words, which is
                // what Sync meant and what reads best.
                return;
            }

            View thumbnail = root.findViewById(
                    ResourceUtils.getIdentifier(ResourceType.ID, THUMBNAIL));
            if (thumbnail == null) {
                Logger.printInfo(() -> "cards: no picture in a link card to stack");
                return;
            }

            ViewGroup parent = (ViewGroup) thumbnail.getParent();
            View words = beside(parent, thumbnail);
            if (words == null) {
                Logger.printInfo(() -> "cards: nothing beside the picture to put under it");
                return;
            }

            stack(thumbnail, words);
            askForItBigger(thumbnail);
            keepItABanner(thumbnail);

            Logger.printDebug(() -> "cards: stacked a link card's picture over its title at "
                    + columns + " columns");
        } catch (Throwable ex) {
            // A card that is laid out the old way is worth having; a feed that will not draw is
            // not. Nothing here is load bearing.
            Logger.printInfo(() -> "cards: could not stack a link card: " + ex);
        }
    }

    /** @return How many columns the feed is drawn in, or 1 where Sync will not say. */
    private static int columns(int viewMode) {
        try {
            return com.laurencedawson.reddit_sync.singleton.c.c(viewMode);
        } catch (Throwable ex) {
            Logger.printInfo(() -> "cards: could not ask how many columns: " + ex);
            return 1;
        }
    }

    /** @return The only other child of the picture's parent, which holds the words. */
    private static View beside(ViewGroup parent, View thumbnail) {
        View found = null;
        for (int i = 0; i < parent.getChildCount(); i++) {
            View child = parent.getChildAt(i);
            if (child == thumbnail) {
                continue;
            }
            if (found != null) {
                // More than one thing beside it means the card is not shaped the way this was
                // written for, and guessing which one holds the words would be a guess.
                return null;
            }
            found = child;
        }
        return found;
    }

    /**
     * Writes the rules that put the picture across the top with the words underneath, in place of
     * the picture against the right edge with the words to the left of it.
     */
    private static void stack(View thumbnail, View words) {
        RelativeLayout.LayoutParams picture =
                (RelativeLayout.LayoutParams) thumbnail.getLayoutParams();
        picture.width = ViewGroup.LayoutParams.MATCH_PARENT;
        picture.removeRule(RelativeLayout.ALIGN_PARENT_RIGHT);
        picture.removeRule(RelativeLayout.ALIGN_PARENT_END);
        picture.addRule(RelativeLayout.ALIGN_PARENT_TOP);
        thumbnail.setLayoutParams(picture);

        if (thumbnail instanceof ImageView) {
            // Full width and cropped to the middle, which is how an image card draws its own
            // preview. Sync sets this itself when it has a picture to show and leaves it alone
            // when it falls back to an icon, so it is only a default here.
            ((ImageView) thumbnail).setScaleType(ImageView.ScaleType.CENTER_CROP);
        }

        RelativeLayout.LayoutParams under =
                (RelativeLayout.LayoutParams) words.getLayoutParams();
        under.removeRule(RelativeLayout.LEFT_OF);
        under.removeRule(RelativeLayout.START_OF);
        under.addRule(RelativeLayout.BELOW, thumbnail.getId());
        words.setLayoutParams(under);
    }

    /**
     * Raises the size the picture is asked of Glide at.
     *
     * <p>{@code PostThumbnailView} keeps the width and height it wants decoded in two fields of
     * its own, both set to 80dp in its constructor, and hands them to the loader every time a
     * post is bound. Stretching the view without touching them asks for the same small square
     * and scales it up, which is visibly soft across a card. They are the only two {@code int}
     * fields the class has, which is how they are found: the names are the minifier's and the
     * access is package private, so neither the name nor a direct read would survive.
     *
     * <p>Both are set to the same number, so it does not matter which is which. It is the widest
     * a column can be rather than the width this card happens to have, since the card has not
     * been measured yet and asking for a little too much costs memory while asking for too
     * little cannot be undone once the picture is in the cache.
     */
    private static void askForItBigger(View thumbnail) {
        try {
            int wanted = thumbnail.getResources().getDisplayMetrics().widthPixels;
            if (wanted <= 0) {
                return;
            }

            int raised = 0;
            for (Field field : thumbnail.getClass().getDeclaredFields()) {
                if (field.getType() != int.class) {
                    continue;
                }
                field.setAccessible(true);
                if (field.getInt(thumbnail) < wanted) {
                    field.setInt(thumbnail, wanted);
                }
                raised++;
            }

            if (raised != 2) {
                final int found = raised;
                Logger.printInfo(() -> "cards: expected two sizes on the picture, found "
                        + found);
            }
        } catch (Throwable ex) {
            Logger.printInfo(() -> "cards: could not raise the size asked for: " + ex);
        }
    }

    /**
     * Keeps the picture's height in step with the width the column turns out to have.
     *
     * <p>Written as a listener rather than a number because the width is not known while the card
     * is being built, and because it changes under the card afterwards: a rotation, a fold, and a
     * change to the column setting all re-lay the same recycled holder out at a different width.
     */
    private static void keepItABanner(View thumbnail) {
        thumbnail.addOnLayoutChangeListener((view, left, top, right, bottom,
                                             oldLeft, oldTop, oldRight, oldBottom) -> {
            try {
                int width = right - left;
                if (width <= 0) {
                    return;
                }

                int wanted = Math.min(
                        Math.round(width / WIDTH_OVER_HEIGHT),
                        Math.round(width * TALLEST));

                ViewGroup.LayoutParams params = view.getLayoutParams();
                if (params == null || params.height == wanted) {
                    // Leaving it alone is what stops this asking for a layout that would call
                    // it straight back again.
                    return;
                }
                params.height = wanted;
                view.setLayoutParams(params);
            } catch (Throwable ex) {
                Logger.printInfo(() -> "cards: could not settle the picture's height: " + ex);
            }
        });
    }
}
