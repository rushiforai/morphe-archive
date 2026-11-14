package app.fakh.extension.smartlife;

import android.content.Context;
import android.graphics.Color;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import app.fakh.extension.shared.GlassCapsule;

/**
 * Draws the cards on the Home tab of Smart Life and Tuya Smart as bevelled glass, clear over the page, with
 * the shared {@link GlassCapsule} rounded like the app's own card, and edges the weather card with it.
 */
public final class GlassCards {
    /** How opaque the card is; the page shows through the rest. */
    private static final float FILL_ALPHA = 0.7f;
    /** How many 1.5 dp rings the shadow under a card has. */
    private static final int SHADOW_RINGS = 3;
    /** How much closer to white than a dark page a glass surface is. */
    private static final float LIGHTER = 0.16f;

    private GlassCards() {
    }

    /**
     * Injected at the end of the constructor of a device card (SmallCard on Favorites, RoomDeviceSmallCard in a room),
     * after it set its own background.
     *
     * @param card the app's device card
     */
    public static void install(View card) {
        if (!Switches.liquidGlass(card.getContext())) return;
        card.setBackground(glass(card, FILL_ALPHA, SHADOW_RINGS));
        unclip(card);
    }

    /**
     * Injected where every other Home card is inflated ({@code BaseViewController.createAndAddChild}): energy, mini
     * program, AI and the rest. Their backgrounds come from many drawables and some are set again when the card is
     * bound, so the card's own background is replaced with glass before each frame it differs.
     *
     * @param root the card's inflated layout
     * @return {@code root}, as the method returns it
     */
    public static View card(View root) {
        if (!Switches.liquidGlass(root.getContext())) return root;
        GlassCapsule glass = glass(root, FILL_ALPHA, SHADOW_RINGS);
        unclip(root);
        root.getViewTreeObserver().addOnPreDrawListener(() -> {
            Drawable background = root.getBackground();
            if (background != null && background != glass && !(background instanceof GlassCapsule)) root.setBackground(glass);
            return true;
        });
        return root;
    }

    /**
     * Injected where the Device Management page inflates a card. The page's item view is a frame around the card, and
     * the card has the background, so the glass goes on the card.
     *
     * @param item the item view of the list
     */
    public static void managementCard(View item) {
        if (!Switches.liquidGlass(item.getContext())) return;
        item.getViewTreeObserver().addOnPreDrawListener(() -> {
            View card = item.getBackground() == null && item instanceof ViewGroup && ((ViewGroup) item).getChildCount() > 0
                    ? ((ViewGroup) item).getChildAt(0) : item;
            Drawable background = card.getBackground();
            if (background != null && !(background instanceof GlassCapsule)) {
                card.setBackground(glass(card, FILL_ALPHA, SHADOW_RINGS));
                ViewParent parent = card.getParent();
                for (int i = 0; i < 2 && parent instanceof ViewGroup; i++, parent = parent.getParent()) {
                    ((ViewGroup) parent).setClipChildren(false);
                }
            }
            return true;
        });
    }

    /**
     * Injected at the end of the weather card's {@code updateGradientBackground}, which colors the card for the
     * weather. The weather's gradient and animated picture stay; the glass edge is laid over them as the card's
     * foreground, with no fill, and no shadow since the card clips what is drawn past its bounds.
     *
     * @param card the weather card's CardView, or null when the method found none
     */
    public static void weather(View card) {
        if (card != null && Switches.liquidGlass(card.getContext()) && !(card.getForeground() instanceof GlassCapsule)) card.setForeground(glass(card, 0, 0));
    }

    /**
     * Lets the card's shadow reach into the padding around it, which its parent and the list would cut off, so the
     * card keeps its size.
     */
    private static void unclip(View card) {
        card.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View view) {
                ViewParent parent = view.getParent();
                // The card's frame and the list it sits in.
                for (int i = 0; i < 2 && parent instanceof ViewGroup; i++, parent = parent.getParent()) {
                    ((ViewGroup) parent).setClipChildren(false);
                }
            }

            @Override
            public void onViewDetachedFromWindow(View view) {
            }
        });
    }

    /**
     * A glass drawable that fills {@code view}, rounded like the app's cards.
     *
     * @param fillAlpha how opaque the fill is, 0 for none
     * @param shadow    how many rings the shadow under it has
     */
    private static GlassCapsule glass(View view, float fillAlpha, int shadow) {
        Context context = view.getContext();
        float density = context.getResources().getDisplayMetrics().density;
        // Translucent with no recorded backdrop: the page behind the card shows through the fill as it is.
        GlassCapsule glass = new GlassCapsule(tint(context), density,
                new GlassCapsule.Layout() {
                    @Override
                    public boolean capsule(RectF out) {
                        out.set(0, 0, view.getWidth(), view.getHeight());
                        return out.width() > 0 && out.height() > 0;
                    }

                    @Override
                    public boolean pill(RectF out) {
                        return false;
                    }
                }, fillAlpha);
        int corner = context.getResources().getIdentifier("thing_theme_dimen_c3_1", "dimen", context.getPackageName());
        glass.setCorner(corner == 0 ? 16 * density : context.getResources().getDimension(corner));
        glass.setShadowRings(shadow);
        glass.setBevel(true);
        return glass;
    }

    /**
     * The fill of a glass surface in these apps: the page color itself on a light page, so the card reads as clear
     * glass and only its light edge stands out, and a shade lighter than the page on a dark one.
     */
    static int tint(Context context) {
        int id = context.getResources().getIdentifier("thing_theme_color_b1", "color", context.getPackageName());
        int page = id == 0 ? Color.WHITE : context.getColor(id);
        if (Color.red(page) + Color.green(page) + Color.blue(page) > 3 * 128) return page;
        return Color.rgb(Math.round(Color.red(page) + (255 - Color.red(page)) * LIGHTER),
                Math.round(Color.green(page) + (255 - Color.green(page)) * LIGHTER),
                Math.round(Color.blue(page) + (255 - Color.blue(page)) * LIGHTER));
    }
}
