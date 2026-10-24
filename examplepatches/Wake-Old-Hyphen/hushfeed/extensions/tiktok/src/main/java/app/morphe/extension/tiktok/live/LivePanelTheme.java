/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.live;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.tiktok.blockauthor.Reflect;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Pattern;

/** The theme LIVE panels inflate with while Dark LIVE panels is on in dark mode (#159). */
@SuppressWarnings("unused")
public final class LivePanelTheme {
    /** The base of every themed LIVE dialog (LiveDialogFragment and the rest). */
    static final String THEMED_DIALOG = "com.bytedance.android.live.design.resource.theme.LiveThemeAwareDialogFragment";
    /** The base of LIVE's sheet pages: the fan club sheets and most newer LIVE panels. */
    static final String SHEET = "com.bytedance.android.live.design.view.sheet.LiveSheetFragment";
    /** The base of every themed LIVE fragment: sheet pages, the room's own and the ranking's pages. */
    static final String THEMED_FRAGMENT = "com.bytedance.android.live.design.resource.theme.LiveThemeAwareFragment";
    /** The daily ranking, whose sheet backgrounds are fixed light drawables it sets itself. */
    static final String RANK_LIST = "com.bytedance.android.live.rank.impl.list.RankListDialog";
    /** The trending ranking's first-time guide over the daily ranking, drawn on a fixed light image. */
    static final String RANK_GUIDE = "com.bytedance.android.live.rank.impl.list.view.PopularityRankingEducationDialog";
    private static final Set<String> STOCK_PANELS = new HashSet<>(Arrays.asList(RANK_LIST, RANK_GUIDE));

    private static final int OTHER = 0;
    private static final int PANEL = 1;
    private static final int STOCK = 2;
    /** A themed LIVE fragment that isn't a panel, which its own inflater hook already sees. */
    private static final int THEMED = 3;
    /** How far up a page's parent fragments the walk looks for a stock panel. */
    private static final int MAX_PARENTS = 8;
    private static final Map<Class<?>, Integer> PANEL_TYPES = new ConcurrentHashMap<>();
    /** Set while a stock panel asks TikTok's own provider answer for its overlay. */
    private static final ThreadLocal<Boolean> STOCK_ANSWER = new ThreadLocal<>();
    /**
     * Set once a stock panel has inflated with the switch on. Until then no fragment can sit under
     * one, so the fragments the rest of the app inflates skip the walk up their parents.
     */
    static volatile boolean stockSeen;
    /** Each darkened room's theme as it was before TikTok's dark app theme went on. */
    private static final Map<Activity, Resources.Theme> LIGHT_ROOMS = Collections.synchronizedMap(new WeakHashMap<>());
    /** The profile card's label color when the server's is missing or unreadable: color/aj, #0F161823, on 47.4.3. */
    private static final int LABEL_DEFAULT = 0x0F161823;
    /**
     * The event box's fill on the dark card: white at 16%, about the card's own tiles there
     * (#47484E over its #262626, Login2, 2026-10-20).
     */
    private static final int EVENT_BOX = 0x29FFFFFF;
    /** How far into the event box the light text check looks. */
    private static final int MAX_BOX_DEPTH = 3;
    private static volatile boolean overlayFailureLogged;
    private static volatile boolean rowFailureLogged;
    private static volatile boolean viewContextFailureLogged;
    private static volatile boolean sparkFailureLogged;

    private LivePanelTheme() {
    }

    /**
     * Called with each layout inflater a themed LIVE dialog or LIVE fragment hands its views,
     * with the dialog or fragment. TikTok gives a LIVE panel its light colors by inflating it
     * through its light LIVE theme, applied over the room's own with force. The dark one it only
     * adds to the room's theme without force, so every color the room's light theme already set
     * wins and the panel stays white, which is what the S25 showed with only the provider
     * answering dark (#159). While Dark LIVE panels is on and the panel's context is in dark
     * mode, the panel's views inflate through its own theme overlay, which the provider hook
     * makes TikTok's dark LIVE theme, applied with force the way TikTok applies the light one. A
     * room's own fragments aren't panels and keep TikTok's inflater, and anything that fails
     * hands TikTok's back.
     * A stock panel, and any fragment under one, inflates through the overlay TikTok's own
     * provider answer gives the stock panel instead, its light LIVE theme in a room, applied with
     * force the way TikTok applies it in a dark app. Left with TikTok's inflater, the provider
     * hook's dark answer kept TikTok from adding any LIVE theme, so the room's dark app theme
     * turned the daily ranking's tab titles white on its fixed white sheet (Login2, 2026-10-18).
     */
    public static LayoutInflater darkLivePanel(Object panel, LayoutInflater inflater) {
        if (panel == null || inflater == null) {
            return inflater;
        }
        try {
            Context context = inflater.getContext();
            if (!LiveControls.darkLivePanels(context)) {
                return inflater;
            }
            Object stock = stockPanel(panel);
            if (stock != null) {
                stockSeen = true;
                return stockInflater(inflater, context, stockOverlay(stock, context));
            }
            if (!isPanel(panel.getClass())) {
                return inflater;
            }
            int overlay = themeOverlay(panel, context);
            if (overlay == 0) {
                return inflater;
            }
            return inflater.cloneInContext(new ContextThemeWrapper(context, overlay));
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not darken a LIVE panel", failure);
            return inflater;
        }
    }

    /**
     * Called with the layout inflater every fragment takes from its host, with the fragment. A
     * plain fragment takes the room activity's inflater even under a LIVE panel, so the daily
     * ranking's lists took the room's dark app theme and their rows read white on the ranking's
     * white sheet (Login2, 2026-10-19). While Dark LIVE panels is on in dark mode, a plain
     * fragment under a stock panel inflates through the overlay that panel gets. LIVE's themed
     * fragments and dialogs have their own hook, and every other fragment keeps TikTok's inflater.
     * Every fragment in the app comes through here, so nothing is looked up before a stock panel
     * has inflated.
     */
    public static LayoutInflater darkLivePage(Object fragment, LayoutInflater inflater) {
        try {
            if (!stockSeen || fragment == null || panelType(fragment.getClass()) != OTHER) {
                return inflater;
            }
            return darkLivePanel(fragment, inflater);
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not check a fragment for a LIVE panel", failure);
            return inflater;
        }
    }

    /**
     * Called by the LIVE room activity's setTheme right after its last room theme. The room
     * ignores the theme it's handed and builds its own out of light styles applied with force,
     * each sitting on TikTok's light app theme, so TikTok's generic sheets over a room (Share, a
     * business room's Contact sheet) open white in a dark app, and the panel overlay never
     * reaches them (#159). While Dark LIVE panels is on and TikTok itself is in dark mode,
     * TikTok's dark app theme goes on over them with force, as TikTok themes its other screens
     * in dark mode. The room's color scheme styles still apply after it.
     * Also called after the room's onConfigurationChanged: the room handles a dark mode flip
     * itself, and AppCompat re-applies the room's last light style with force after its setTheme,
     * so Share opened white in a room left open while the system theme flipped (S22, 2026-10-23).
     */
    public static void darkLiveRoom(Activity room) {
        darkLiveRoom(room, darkAppTheme());
    }

    static void darkLiveRoom(Activity room, int theme) {
        if (room == null) {
            return;
        }
        try {
            if (theme == 0 || !LiveControls.darkLivePanels(room)) {
                return;
            }
            // Only the first pass is light: a later setTheme puts the room's styles back over the
            // dark theme, so a second copy would keep whatever they leave alone dark.
            synchronized (LIGHT_ROOMS) {
                if (!LIGHT_ROOMS.containsKey(room)) {
                    Resources.Theme light = room.getResources().newTheme();
                    light.setTo(room.getTheme());
                    LIGHT_ROOMS.put(room, light);
                }
            }
            room.getTheme().applyStyle(theme, true);
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not darken a LIVE room", failure);
        }
    }

    /**
     * The style TikTok gives its screens in dark mode, 0 when unknown. The patch rewrites this to
     * return the style it read from TikTok's own dark mode code.
     */
    static int darkAppTheme() {
        return 0;
    }

    /**
     * Called by the LIVE profile card with the color it picked for a translated bio's "See
     * original" link and the bio's view. The card's theme already gives the dark theme's light
     * link color, but the link is drawn through a replacement span, which skips color spans and
     * paints with the view's own text color, the light theme's dark one, so the link read dark
     * on the dark card (#159). While Dark LIVE panels is on in dark mode, the view's text color
     * becomes the link color. The bio's own text keeps the color its span gives it.
     */
    public static void bioLinkColor(int color, Object bio) {
        try {
            if (bio instanceof TextView && LiveControls.darkLivePanels(((TextView) bio).getContext())) {
                ((TextView) bio).setTextColor(color);
            }
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not color a LIVE bio's link", failure);
        }
    }

    /**
     * Called by the LIVE profile card with its labels and the strip that draws them, before it
     * builds them: the shop rating and sold count chips among them. The server sends each label's
     * colors as they look on the light card, a faint see-through chip under dark text and a dark
     * icon, so on the dark card they read dark on dark (Login2, 2026-10-19). While Dark LIVE
     * panels is on in dark mode, each label drawn on a color gets that color as it shows over the
     * light card, so it stays the light chip its own text and icon were picked for. A label drawn
     * on an image keeps it. Only the card's own labels are touched, by TikTok's class name.
     */
    public static void cardLabels(Object labels, Object strip) {
        try {
            if (!(labels instanceof Iterable) || !(strip instanceof View)
                    || !LiveControls.darkLivePanels(((View) strip).getContext())) {
                return;
            }
            for (Object label : (Iterable<?>) labels) {
                if (label != null && "ProfileCardLabel".equals(label.getClass().getSimpleName())) {
                    lightLabel(label);
                }
            }
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not keep a LIVE profile card's labels readable", failure);
        }
    }

    /** Gives the label's background its color as it shows over the light card, a new one when it has none. */
    static void lightLabel(Object label) throws ReflectiveOperationException {
        if (label == null) {
            return;
        }
        // A static field would ignore the label, and a static final one refuses the write once
        // TikTok targets Android 17, so only the label's own fields are written.
        Field field = Reflect.field(label.getClass(), "background");
        if (field == null || Modifier.isStatic(field.getModifiers())) {
            return;
        }
        Object background = field.get(label);
        if (background == null) {
            Constructor<?> make = field.getType().getDeclaredConstructor();
            make.setAccessible(true);
            background = make.newInstance();
            field.set(label, background);
        }
        // TikTok draws backgroundDarkMode's image instead only in a right-to-left layout, which
        // this doesn't check: a label with no image of its own there keeps the color it gets here.
        if (Reflect.readField(background, "image") != null) {
            return;
        }
        Field color = Reflect.field(background.getClass(), "colorCode");
        if (color != null && !Modifier.isStatic(color.getModifiers())) {
            color.set(background, onLightCard((String) color.get(background)));
        }
    }

    /**
     * The label color as it shows over the light card's white, opaque, the way TikTok's color
     * parse reads it. Missing or unreadable, TikTok keeps its own default for the card's labels,
     * color/aj on 47.4.3, which has no night variant.
     */
    static String onLightCard(String code) {
        int color = LABEL_DEFAULT;
        if (code != null && !code.isEmpty()) {
            try {
                color = Color.parseColor(code);
            } catch (IllegalArgumentException unreadable) {
                color = LABEL_DEFAULT;
            }
        }
        int alpha = Color.alpha(color);
        int red = (Color.red(color) * alpha + 255 * (255 - alpha)) / 255;
        int green = (Color.green(color) * alpha + 255 * (255 - alpha)) / 255;
        int blue = (Color.blue(color) * alpha + 255 * (255 - alpha)) / 255;
        return String.format(Locale.ROOT, "#FF%02X%02X%02X", red, green, blue);
    }

    /**
     * Called by the LIVE profile card's upcoming event module with its box as it binds the host's
     * next event. The box is a fixed white rounded shape with no night variant, while its title,
     * time and chevron take their colors from the card's theme, so on the dark card the "LIVE
     * event" line read light on white (Login2, 2026-10-20). While Dark LIVE panels is on in dark
     * mode and the box's own text came out light, its shape gets a see-through light fill like the
     * card's own tiles, corners kept. A box whose text is still dark keeps its white. The group
     * chat row ("Chat di gruppo") calls it too, right after it puts the same kind of white shape
     * on itself.
     */
    public static void eventBox(Object box) {
        try {
            if (!(box instanceof ViewGroup) || !LiveControls.darkLivePanels(((View) box).getContext())) {
                return;
            }
            Drawable background = ((View) box).getBackground();
            if (background instanceof GradientDrawable && hasLightText((ViewGroup) box, 0)) {
                // The shape's state is shared with every other view drawn from it, so it's copied first.
                ((GradientDrawable) background.mutate()).setColor(EVENT_BOX);
            }
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not keep a LIVE profile card's event box readable", failure);
        }
    }

    /**
     * Called by the LIVE profile card's badge tiles (the level tile and the ones beside it) in
     * place of each setBackground TikTok gives a tile. The server draws a tile's art and text for
     * the white card and often see-through: the low levels' "Lv." tile is a pale lavender at
     * about a fifth of full strength with gray text at about a third, so on the dark card both
     * went dark gray and the text sank into the tile (Login2, 2026-10-20). While Dark LIVE panels
     * is on in dark mode, a white copy of the tile's own rounded shape goes under it, so the art
     * draws over white the way it does on the stock card. A solid tile looks the same either way.
     */
    public static void badgeTile(View tile, Drawable background) {
        Drawable shown = background;
        try {
            if (background instanceof GradientDrawable && LiveControls.darkLivePanels(tile.getContext())) {
                Drawable.ConstantState shape = background.getConstantState();
                if (shape != null) {
                    // A copy with its own state, so the tile's shape keeps its fill and border.
                    GradientDrawable base = (GradientDrawable) shape.newDrawable().mutate();
                    base.setColor(Color.WHITE);
                    base.setStroke(0, Color.TRANSPARENT);
                    LayerDrawable layers = new LayerDrawable(new Drawable[]{base, background});
                    // Both layers carry the shape's padding, which nesting would count twice.
                    layers.setPaddingMode(LayerDrawable.PADDING_MODE_STACK);
                    shown = layers;
                }
            }
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not lay a LIVE profile card badge over white", failure);
        }
        tile.setBackground(shown);
    }

    /** True when a text in the box, at most a few levels down, is drawn in a light color. */
    static boolean hasLightText(ViewGroup box, int depth) {
        for (int i = 0; i < box.getChildCount(); i++) {
            View child = box.getChildAt(i);
            if (child instanceof TextView && isLight(((TextView) child).getCurrentTextColor())) {
                return true;
            }
            if (child instanceof ViewGroup && depth < MAX_BOX_DEPTH && hasLightText((ViewGroup) child, depth + 1)) {
                return true;
            }
        }
        return false;
    }

    /** True for a color brighter than mid gray, by its perceived brightness. */
    static boolean isLight(int color) {
        return Color.red(color) * 299 + Color.green(color) * 587 + Color.blue(color) * 114 > 127_500;
    }

    /**
     * True for a themed LIVE dialog or a LIVE sheet page, by TikTok's own class names. A panel
     * that paints its own fixed light backgrounds isn't one, subclasses included, or the dark
     * overlay's light text lands on white: the daily ranking's title and its guide's text (#159).
     */
    static boolean isPanel(Class<?> type) {
        return panelType(type) == PANEL;
    }

    /**
     * The panel itself when it paints its own fixed light backgrounds, else the one it sits under
     * by its parent fragments, or null. The daily ranking's pages and lists are fragments of their
     * own, which take their inflater from the room, not from the ranking's. The walk stops at an
     * ordinary panel, so a dialog opened from the ranking's pages keeps its dark overlay.
     */
    static Object stockPanel(Object panel) {
        Object current = panel;
        for (int depth = 0; current != null && depth <= MAX_PARENTS; depth++) {
            int kind = panelType(current.getClass());
            if (kind == STOCK) {
                return current;
            }
            if (kind == PANEL) {
                return null;
            }
            current = Reflect.invoke(current, "getParentFragment");
        }
        return null;
    }

    private static int panelType(Class<?> type) {
        Integer known = PANEL_TYPES.get(type);
        if (known != null) {
            return known;
        }
        int kind = OTHER;
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            String name = current.getName();
            if (STOCK_PANELS.contains(name)) {
                kind = STOCK;
                break;
            }
            if (THEMED_DIALOG.equals(name) || SHEET.equals(name)) {
                kind = PANEL;
                break;
            }
            if (THEMED_FRAGMENT.equals(name)) {
                kind = THEMED;
                break;
            }
        }
        PANEL_TYPES.put(type, kind);
        return kind;
    }

    /**
     * The overlay TikTok's own provider answer gives a stock panel, asked with the panel's own
     * context the way TikTok asks it, while the provider hook stands down. It's 0 when TikTok's
     * answer is the hook's dark one too, so a ranking opened outside a room keeps TikTok's
     * inflater as before.
     */
    static int stockOverlay(Object stock, Context fallback) {
        Object own = Reflect.invoke(stock, "getContext");
        Context context = own instanceof Context ? (Context) own : fallback;
        int overlay;
        STOCK_ANSWER.set(Boolean.TRUE);
        try {
            overlay = themeOverlay(stock, context);
        } finally {
            STOCK_ANSWER.remove();
        }
        return overlay == themeOverlay(stock, context) ? 0 : overlay;
    }

    /**
     * A stock panel's inflater: its light overlay, applied with force over the room's theme as it
     * was before the room hook put TikTok's dark app theme on. Over the darkened room, whatever the
     * overlay leaves alone kept its dark value, so the daily ranking's gray league pill turned
     * white on white (Login2, 2026-10-19). A room the hook never darkened has no light theme
     * kept, and the overlay goes over its own.
     */
    private static LayoutInflater stockInflater(LayoutInflater inflater, Context context, int overlay) {
        Context themed = stockThemed(context, overlay);
        return themed == null ? inflater : inflater.cloneInContext(themed);
    }

    /** The context under a stock panel's light overlay, the one its inflater takes; null with no overlay. */
    private static Context stockThemed(Context context, int overlay) {
        if (overlay == 0) {
            return null;
        }
        Resources.Theme light = lightRoom(context);
        if (light == null) {
            return new StockContext(context, overlay);
        }
        Resources.Theme theme = context.getResources().newTheme();
        theme.setTo(light);
        theme.applyStyle(overlay, true);
        return new StockContext(context, theme);
    }

    /** The light context a stock panel's views inflate with, which the rows of its lists look for. */
    static final class StockContext extends ContextThemeWrapper {
        StockContext(Context base, int theme) {
            super(base, theme);
        }

        StockContext(Context base, Resources.Theme theme) {
            super(base, theme);
        }
    }

    /** True when the context is a stock panel's light one, or one a view wrapped around it. */
    static boolean isStockContext(Context context) {
        Context current = context;
        while (current instanceof ContextWrapper) {
            if (current instanceof StockContext) {
                return true;
            }
            Context base = ((ContextWrapper) current).getBaseContext();
            if (base == current) {
                return false;
            }
            current = base;
        }
        return false;
    }

    /**
     * Called by LIVE's list row binders before they make a row, with the list, the row's layout and
     * whether it goes straight into the list. The binders skip the inflater their list hands them
     * and inflate rows through LIVE's shared inflater, whose context is the app or the room, so over
     * the darkened room the daily ranking's trending rows took the room's dark app theme and their
     * names read white on the ranking's white sheet (Login2, 2026-10-19). While Dark LIVE panels is
     * on in dark mode, a row for a list a stock panel's light context inflated comes from that
     * context, and the binder makes its holder from it. Every other row gets null and TikTok's own,
     * one TikTok attaches as it inflates included.
     */
    public static View stockRow(ViewGroup list, int layout, Boolean attach) {
        try {
            if (!stockSeen || list == null || layout == 0 || Boolean.TRUE.equals(attach)) {
                return null;
            }
            Context context = list.getContext();
            if (!isStockContext(context) || !LiveControls.darkLivePanels(context)) {
                return null;
            }
            return LayoutInflater.from(context).inflate(layout, list, false);
        } catch (Throwable failure) {
            if (!rowFailureLogged) {
                rowFailureLogged = true;
                Logger.printException(() -> "Could not give a LIVE ranking's row its light theme", failure);
            }
            return null;
        }
    }

    /**
     * Called by the daily ranking's tab strip with its page and the page's getContext(), which it
     * reads the tabs' fallback colors through. That context is the room activity, and TikTok's LIVE
     * color lookup resolves against its theme, so over the darkened room the unpicked tab's gray
     * pill took the dark theme's white on the ranking's white sheet (Login2, 2026-10-19). While
     * Dark LIVE panels is on in dark mode, a page under a stock panel gets the context its own
     * views inflated with, the light one its inflater hook gave it, or one built the same way
     * before it has a view. Everything else gets its context back untouched, a ranking with no
     * light overlay to put back (outside a room, where TikTok's own answer is already dark)
     * included.
     */
    public static Context stockContext(Object page, Context context) {
        try {
            if (!stockSeen || page == null || context == null || !LiveControls.darkLivePanels(context)) {
                return context;
            }
            Object stock = stockPanel(page);
            if (stock == null) {
                return context;
            }
            int overlay = stockOverlay(stock, context);
            if (overlay == 0) {
                return context;
            }
            Object view = Reflect.invoke(page, "getView");
            if (view instanceof View) {
                return ((View) view).getContext();
            }
            Context themed = stockThemed(context, overlay);
            return themed == null ? context : themed;
        } catch (Throwable failure) {
            Logger.printException(() -> "Could not give a LIVE ranking's tabs their light theme", failure);
            return context;
        }
    }

    /**
     * Called by a ranking list's bottom row as it puts the info icon after a host's gap text, with
     * the row's text and the context the list handed it, which it loads and tints the icon through.
     * That context is the room activity, so over the darkened room the icon after the trending
     * tab's "99+" row took the dark theme's white on the ranking's white sheet (Login2, 2026-10-19).
     * While Dark LIVE panels is on in dark mode, a row a stock panel's light context inflated gets
     * that context. Every other row gets its context back untouched, and so does a row text that
     * isn't a View: the patch only proves it's what the row read the text from.
     */
    public static Context stockViewContext(Object text, Context context) {
        try {
            if (!stockSeen || !(text instanceof View) || context == null || !LiveControls.darkLivePanels(context)) {
                return context;
            }
            Context own = ((View) text).getContext();
            return isStockContext(own) ? own : context;
        } catch (Throwable failure) {
            if (!viewContextFailureLogged) {
                viewContextFailureLogged = true;
                Logger.printException(() -> "Could not give a LIVE ranking's info icon its light theme", failure);
            }
            return context;
        }
    }

    /**
     * Called first by Spark's light or dark decision for one page (SparkContext.LJIIZILJ on
     * 47.5.3) with the page's SparkContext and the context it was asked with; true answers light
     * before Spark decides. Spark's pages read dark over a room the room hook darkened, which
     * suits them, except a shop room's viewer ranking with its Top customers tab, whose native tab
     * titles kept their light colors on the dark sheet (S22, 2026-10-20). That page asks for the
     * buyers ranking in its schema (can_show_top_buyers_rank=1; the plain viewer ranking, same
     * Lynx bundle, sends 0, emulator 2026-10-23), and only it stays light, only over a darkened
     * room while Dark LIVE panels is on in dark mode.
     */
    public static boolean sparkKeepsStock(Object page, Context context) {
        try {
            if (page == null || !buyersRanking(page)) {
                return false;
            }
            Activity room = sparkRoom(context);
            return room != null && LiveControls.darkLivePanels(room);
        } catch (Throwable failure) {
            if (!sparkFailureLogged) {
                sparkFailureLogged = true;
                Logger.printException(() -> "Could not keep a LIVE room's Spark page stock", failure);
            }
            return false;
        }
    }

    private static final Pattern BUYERS_RANKING = Pattern.compile("[?&]can_show_top_buyers_rank=1(?:&|$)");

    /** Whether a Spark page's schema asks for the shop ranking's Top customers tab. */
    static boolean buyersRanking(Object page) {
        Object bundle = Reflect.readField(page, "schemaBundle");
        Object queries = Reflect.invoke(bundle, "getAllQueries");
        if (queries instanceof Map && ((Map<?, ?>) queries).containsKey("can_show_top_buyers_rank")) {
            return "1".equals(String.valueOf(((Map<?, ?>) queries).get("can_show_top_buyers_rank")));
        }
        for (Object url : new Object[] {Reflect.readField(page, "fullUrl"), Reflect.invoke(bundle, "getUrl")}) {
            if (url instanceof String && BUYERS_RANKING.matcher((String) url).find()) {
                return true;
            }
        }
        return false;
    }

    /**
     * The darkened room a Spark page opens over: the one under its context, or with no activity
     * under it (Spark asks with none for the theme name its Lynx page reads), a live one the
     * room hook darkened. Null otherwise, a room the hook never darkened included.
     */
    static Activity sparkRoom(Context context) {
        Activity room = roomOf(context);
        if (room != null) {
            return LIGHT_ROOMS.containsKey(room) ? room : null;
        }
        synchronized (LIGHT_ROOMS) {
            for (Activity kept : LIGHT_ROOMS.keySet()) {
                if (kept != null && !kept.isFinishing() && !kept.isDestroyed()) {
                    return kept;
                }
            }
        }
        return null;
    }

    /** The light theme kept for the room activity under the context, or null. */
    static Resources.Theme lightRoom(Context context) {
        Activity room = roomOf(context);
        return room == null ? null : LIGHT_ROOMS.get(room);
    }

    /** The activity under the context, or null. */
    static Activity roomOf(Context context) {
        Context current = context;
        while (current != null) {
            if (current instanceof Activity) {
                return (Activity) current;
            }
            if (!(current instanceof ContextWrapper)) {
                return null;
            }
            Context base = ((ContextWrapper) current).getBaseContext();
            if (base == current) {
                return null;
            }
            current = base;
        }
        return null;
    }

    /** True while a stock panel asks TikTok's own provider answer, which the hook then leaves alone. */
    static boolean askingStock() {
        return STOCK_ANSWER.get() != null;
    }

    /**
     * The panel's own LIVE theme overlay (getThemeOverlay), 0 when it has none. A panel that
     * names its own overlay gets that one again, so only the default one turns dark.
     */
    static int themeOverlay(Object panel, Context context) {
        try {
            Method method = panel.getClass().getMethod("getThemeOverlay", Context.class);
            Object overlay = method.invoke(panel, context);
            return overlay instanceof Integer ? (Integer) overlay : 0;
        } catch (ReflectiveOperationException | RuntimeException failure) {
            if (!overlayFailureLogged) {
                overlayFailureLogged = true;
                Logger.printException(() -> "A LIVE panel has no theme overlay to darken it with", failure);
            }
            return 0;
        }
    }
}
