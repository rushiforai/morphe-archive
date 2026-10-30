import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.text.Spanned;
import android.text.style.StyleSpan;
import android.util.DisplayMetrics;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Version-pinned integration test for Chat keywords, Chat appearance and Emote and badge info: Twitch 31.8.0's
 * real chat line builder and chat image box (with the emitted hooks) and live message models, run on ART with a
 * fake settings store and a fake signed-in account. Each setting is checked on and off; off must give Twitch's own
 * line. The short class and field names below are Twitch 31.8.0's R8 output; the chat image box comes from the
 * APK's locators (the first argument).
 */
public final class ChatStyleArtProbe {
    private static final Map<String, Object> settings = new HashMap<>();
    private static final String KEYWORDS = "io.github.jordanwoodson.extension.shared.twitch.TwitchChatKeywords";
    private static final String STYLE = "io.github.jordanwoodson.extension.shared.twitch.TwitchChatStyle";
    private static Object unsafe;
    private static Context context;

    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    private static void install() throws Exception {
        SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
            SharedPreferences.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
            (proxy, method, values) -> {
                Object value = settings.getOrDefault((String) values[0], values[1]);
                if (method.getName().equals("getBoolean") || method.getName().equals("getString")) return value;
                throw new UnsupportedOperationException(method.getName());
            });
        Resources system = Resources.getSystem();
        Resources resources = new Resources(system.getAssets(), new DisplayMetrics(), new Configuration());
        context = new ContextWrapper(null) {
            @Override public Context getApplicationContext() { return this; }
            @Override public SharedPreferences getSharedPreferences(String name, int mode) { return preferences; }
            @Override public Resources getResources() { return resources; }
        };
        for (String type : new String[]{"io.github.jordanwoodson.extension.shared.settings.Settings",
                "io.github.jordanwoodson.extension.shared.twitch.TwitchContext"}) {
            Field field = Class.forName(type).getDeclaredField(type.endsWith("Settings") ? "context" : "application");
            field.setAccessible(true);
            field.set(null, context);
        }
        Field theUnsafe = Class.forName("sun.misc.Unsafe").getDeclaredField("theUnsafe");
        theUnsafe.setAccessible(true);
        unsafe = theUnsafe.get(null);
    }

    private static Object allocate(String type) throws Exception {
        return unsafe.getClass().getMethod("allocateInstance", Class.class).invoke(unsafe, Class.forName(type));
    }

    private static Object field(Object target, String name) throws Exception {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(target);
    }

    private static Object staticField(String type, String name) throws Exception {
        Field field = Class.forName(type).getDeclaredField(name);
        field.setAccessible(true);
        return field.get(null);
    }

    /** A config (click configuration) for channel chat or a whisper thread. */
    private static Object config(String source) throws Exception {
        return Class.forName("nb6").getConstructors()[0].newInstance(true, Class.forName("tz90").getField(source).get(null), null);
    }

    private static Object sender(String login) throws Exception {
        Class<?> tuid = Class.forName("tv.twitch.android.models.Tuid");
        return Class.forName("ob6").getConstructor(tuid, String.class, String.class)
            .newInstance(null, login, Character.toUpperCase(login.charAt(0)) + login.substring(1));
    }

    private static List<Object> tokens(String text) throws Exception {
        return Collections.singletonList(Class.forName("ywp").getConstructor(String.class).newInstance(text));
    }

    /** Twitch's line builder (va6.b) for one message; returns its span group (wa6). */
    private static Object line(String login, String text, String id, boolean action, String source) throws Exception {
        Method build = null;
        for (Method method : Class.forName("va6").getDeclaredMethods()) {
            if (method.getName().equals("b") && method.getParameterTypes().length == 21) build = method;
        }
        check(build != null, "No line builder");
        Object style = staticField(action ? "d340" : "e340", "f");
        // Overlay mode (second to last): no reply header or readable-colour lookups.
        Object builder = allocate("va6");
        Field colors = builder.getClass().getDeclaredField("e");
        colors.setAccessible(true);
        Object readable = allocate("rap");
        Field contrast = readable.getClass().getDeclaredField("a");
        contrast.setAccessible(true);
        contrast.set(readable, allocate("xnw"));
        colors.set(builder, readable);
        // A near-white sender colour: readable on the overlay's black, so no colour is computed.
        return build.invoke(null, builder, context, Collections.emptyList(), sender(login), 0xFFFEFEFE, tokens(text),
            false, false, action, id, null, style, false, config(source), null, null, null, null, null, true, 0);
    }

    private static Spanned joined(Object spans) throws Exception {
        return (Spanned) spans.getClass().getMethod("a").invoke(spans);
    }

    private static int verdict(Object spans) throws Exception {
        Method verdict = Class.forName(KEYWORDS).getDeclaredMethod("verdict", CharSequence.class);
        verdict.setAccessible(true);
        return (int) verdict.invoke(null, joined(spans));
    }

    private static boolean italic(Object spans) throws Exception {
        Spanned message = (Spanned) field(spans, "e");
        for (StyleSpan span : message.getSpans(0, message.length(), StyleSpan.class)) {
            if (span.getStyle() == Typeface.ITALIC) return true;
        }
        return false;
    }

    private static void reset() {
        settings.clear();
        settings.put("name", "lurker");
        settings.put("DisplayName", "Lurker");
    }

    private static void keywords() throws Exception {
        reset();
        check(verdict(line("viewer", "hello there", "k1", false, "Chat")) == 0, "Defaults must leave a plain line alone");
        check(verdict(line("viewer", "hi @Lurker how are you", "k2", false, "Chat")) == 1, "A mention must be highlighted");
        check(verdict(line("viewer", "lurker2 is someone else", "k3", false, "Chat")) == 0, "Only whole words mention");
        check(verdict(line("lurker", "hi @lurker", "k4", false, "Chat")) == 0, "Your own messages aren't mentions");
        settings.put("chat_highlight_mentions", false);
        check(verdict(line("viewer", "hi @Lurker", "k5", false, "Chat")) == 0, "Mentions off");
        settings.put("chat_highlight_words", "kekw, good game");
        check(verdict(line("viewer", "that was a GOOD game KEKW", "k6", false, "Chat")) == 1, "Highlight words, any case");
        check(verdict(line("viewer", "kekwait", "k7", false, "Chat")) == 0, "Highlight words are whole words");
        settings.put("chat_blocked_words", "spam");
        check(verdict(line("viewer", "buy SPAM now KEKW", "k8", true, "Chat")) == 2, "Blocked word must hide, over a highlight");
        settings.put("chat_blocked_users", "@Viewer, other");
        check(verdict(line("viewer", "hello there", "k9", false, "Other")) == 2, "Blocked user must hide (VOD replay too)");
        check(verdict(line("viewer", "hello there", "k10", false, "Whisper")) == 0, "Whispers stay unchanged");
        settings.put("chat_keywords", false);
        check(verdict(line("viewer", "buy spam now", "k11", false, "Chat")) == 0, "Off must leave every line alone");

        Method live = Class.forName(KEYWORDS).getMethod("onLiveMessage", String.class, Object.class, List.class);
        settings.put("chat_keywords", true);
        check((boolean) live.invoke(null, "l1", sender("viewer"), tokens("hello")), "Blocked user must be dropped live");
        check((boolean) live.invoke(null, "l2", sender("someone"), tokens("so much spam")), "Blocked word must be dropped live");
        check(!(boolean) live.invoke(null, "l3", sender("someone"), tokens("hello")), "Others must reach the chat list");
        settings.put("chat_keywords", false);
        check(!(boolean) live.invoke(null, "l4", sender("viewer"), tokens("spam")), "Off must drop nothing");
    }

    private static void appearance() throws Exception {
        reset();
        settings.put("chat_keywords", false);
        check(italic(line("viewer", "waves", "m1", true, "Chat")), "Twitch's /me is italic");
        settings.put("chat_me_style", "1");
        Object plain = line("viewer", "waves", "m2", true, "Chat");
        check(!italic(plain) && joined(plain).toString().contains("Viewer waves"), "Plain /me: upright, still 'name text'");
        check(!italic(line("viewer", "hello", "m3", false, "Chat")), "Normal messages stay upright");
        settings.put("chat_appearance", false);
        check(italic(line("viewer", "waves", "m4", true, "Chat")), "Off must keep Twitch's /me");

        Method arrived = Class.forName(STYLE).getMethod("onMessage", String.class, Object.class, List.class);
        Object odd = staticField(STYLE, "ODD_ROW");
        reset();
        settings.put("chat_blocked_words", "spam");
        settings.put("chat_alternate_rows", true);
        String[] ids = {"r1", "r2", "r3", "r4"};
        for (String id : ids) {
            arrived.invoke(null, id, sender("viewer"), tokens("hi"));
            // A message Chat keywords hides takes no place.
            arrived.invoke(null, id + "-blocked", sender("viewer"), tokens("spam"));
        }
        // Built in another order (as rows are bound), each line keeps the parity of its arrival.
        boolean[] marked = new boolean[ids.length];
        for (int i : new int[]{3, 1, 0, 2}) marked[i] = joined(line("viewer", "hi", ids[i], false, "Chat")).getSpanStart(odd) >= 0;
        check(marked[0] != marked[1] && marked[1] != marked[2] && marked[2] != marked[3], "Rows must alternate by arrival");
        // VOD chat replay lines have no ID and are built once each, in order.
        boolean[] replay = new boolean[4];
        for (int i = 0; i < replay.length; i++) {
            replay[i] = joined(line("viewer", "hi", null, false, "Other")).getSpanStart(odd) >= 0;
            check(joined(line("viewer", "spam", null, false, "Other")).getSpanStart(odd) < 0, "Hidden replay rows take no place");
        }
        check(replay[0] != replay[1] && replay[1] != replay[2] && replay[2] != replay[3], "Replay rows must alternate");
        check(joined(line("viewer", "hi", null, false, "Whisper")).getSpanStart(odd) < 0, "Lines without an ID elsewhere stay unmarked");
        settings.put("chat_alternate_rows", false);
        check(joined(line("viewer", "hi", "r2", false, "Chat")).getSpanStart(odd) < 0
            && joined(line("viewer", "hi", "r1", false, "Chat")).getSpanStart(odd) < 0, "Off must mark no row");

        Method guide = Class.forName(STYLE).getMethod("landscapeChatGuide", android.view.View.class, float.class);
        reset();
        check((float) guide.invoke(null, null, 0.7f) == 0.7f, "Default landscape width is Twitch's");
        settings.put("chat_landscape_width", "40");
        check(Math.abs((float) guide.invoke(null, null, 0.7f) - 0.6f) < 1e-6, "40% chat column starts at 60%");
        settings.put("chat_appearance", false);
        check((float) guide.invoke(null, null, 0.8f) == 0.8f, "Off keeps Twitch's width");
    }

    // ---------------------------------------------------------------------------------------------
    // Chat appearance sizes and Emote and badge info. These look Twitch's classes up in the APK's locators.

    private static final String INFO = "io.github.jordanwoodson.extension.shared.twitch.TwitchChatInfo";

    /** Twitch's chat image box (the size in pixels of an image span's box) and its placeholder drawable. */
    private static Method box() throws Exception {
        String type = ProbeLocators.type("twitch.match.chat_image_box", "hlj");
        String name = ProbeLocators.method("twitch.match.chat_image_box", "g");
        for (Method method : Class.forName(type).getDeclaredMethods()) {
            if (method.getName().equals(name) && method.getReturnType() == int.class && method.getParameterTypes().length == 2) {
                method.setAccessible(true);
                return method;
            }
        }
        throw new AssertionError("No chat image box " + type + "." + name);
    }

    /** A real chat image placeholder for {@code url} of size class {@code kind} (Emote, Badge, Gif, ...). */
    @SuppressWarnings({"unchecked", "rawtypes"})
    private static android.graphics.drawable.Drawable placeholder(String url, String kind) throws Exception {
        Class<?> type = box().getParameterTypes()[1];
        Class kinds = null;
        for (Field field : type.getDeclaredFields()) if (field.getType().isEnum()) kinds = field.getType();
        check(kinds != null, "The chat image placeholder has no size class");
        java.lang.reflect.Constructor<?> make = type.getDeclaredConstructor(String.class, kinds, boolean.class);
        make.setAccessible(true);
        return (android.graphics.drawable.Drawable) make.newInstance(url, Enum.valueOf(kinds, kind), false);
    }

    private static int boxSize(String kind) throws Exception {
        return (int) box().invoke(null, context, placeholder("https://example.invalid/" + kind, kind));
    }

    private static void sizes() throws Exception {
        reset();
        int emote = boxSize("Emote"), badge = boxSize("Badge"), gif = boxSize("Gif"), giant = boxSize("GigantifiedEmote");
        check(emote > 0 && badge > 0 && gif > 0, "Twitch sizes its chat images");
        settings.put("chat_emote_size", "200");
        settings.put("chat_badge_size", "50");
        check(boxSize("Emote") == emote * 2 && boxSize("GigantifiedEmote") == giant * 2, "Emotes at 200%");
        check(boxSize("Badge") == Math.round(badge * 0.5f), "Badges at 50%");
        check(boxSize("Gif") == gif, "Other chat images keep Twitch's size");
        settings.put("chat_appearance", false);
        check(boxSize("Emote") == emote && boxSize("Badge") == badge, "Off keeps Twitch's sizes");

        // Larger emotes ask Twitch's emote URL builder for its larger image.
        Method scale = Class.forName(STYLE).getMethod("emoteScale", Float.class);
        reset();
        check(scale.invoke(null, 2f).equals(2f) && scale.invoke(null, (Object) null) == null, "Default keeps the scale");
        settings.put("chat_emote_size", "150");
        check(scale.invoke(null, 2f).equals(3f) && scale.invoke(null, 3f).equals(3f), "150% asks for Twitch's 3x");
        settings.put("chat_emote_size", "75");
        check(scale.invoke(null, 2f).equals(2f), "Smaller emotes keep the scale");

        // Text size, minimum height and spacing on real views, as the row binders leave them.
        android.content.Context views = viewContext();
        android.widget.LinearLayout row = new android.widget.LinearLayout(views);
        android.widget.TextView text = new android.widget.TextView(views);
        row.addView(text, new android.widget.LinearLayout.LayoutParams(-1, -2));
        android.widget.LinearLayout.LayoutParams params = (android.widget.LinearLayout.LayoutParams) text.getLayoutParams();
        params.topMargin = 8;
        text.setLayoutParams(params);
        text.setPadding(0, 8, 0, 8);
        text.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, 40);
        text.setMinHeight(60);
        Method bind = Class.forName(STYLE).getMethod("bindRow", android.view.View.class, android.widget.TextView.class);
        reset();
        settings.put("chat_text_size", "90");
        settings.put("chat_message_spacing", "50");
        for (int bound = 0; bound < 2; bound++) {
            // Twitch sets a live row's padding on every bind; a replay row keeps what it was given.
            row.setPadding(0, 6, 0, 6);
            bind.invoke(null, row, text);
            check(row.getPaddingTop() == 3 && row.getPaddingBottom() == 3, "Row padding at 50%, bind " + bound);
            check(text.getPaddingTop() == 4 && ((android.widget.LinearLayout.LayoutParams) text.getLayoutParams()).topMargin == 4,
                "Text padding and margin at 50% once, bind " + bound);
            check(text.getTextSize() == 36f && text.getMinHeight() == 54, "Text and minimum height at 90% once, bind " + bound);
        }
        settings.put("chat_appearance", false);
        row.setPadding(0, 6, 0, 6);
        bind.invoke(null, row, text);
        check(row.getPaddingTop() == 6 && text.getPaddingTop() == 8 && text.getTextSize() == 40f && text.getMinHeight() == 60
            && ((android.widget.LinearLayout.LayoutParams) text.getLayoutParams()).topMargin == 8, "Off gives Twitch's own back");
    }

    private static Object infoSpan(Spanned spanned, int at) throws Exception {
        Class<?> type = Class.forName(INFO + "$InfoSpan");
        Object[] spans = spanned.getSpans(at, at + 1, type);
        return spans.length == 0 ? null : spans[0];
    }

    private static Spanned image(String text, String url, String kind, boolean clickable) throws Exception {
        android.text.SpannableString spanned = new android.text.SpannableString(text);
        spanned.setSpan(new android.text.style.ImageSpan(placeholder(url, kind)), 0, text.length(), 17);
        if (clickable) spanned.setSpan(new android.text.style.ClickableSpan() {
            @Override public void onClick(android.view.View view) { }
        }, 0, text.length(), 33);
        return spanned;
    }

    private static Spanned message(Spanned text) throws Exception {
        return (Spanned) Class.forName(INFO).getMethod("message", CharSequence.class).invoke(null, text);
    }

    private static void info() throws Exception {
        reset();
        String twitch = "https://static-cdn.jtvnw.net/emoticons/v2/425618/default/dark/2.0";
        String seventv = "https://cdn.7tv.app/emote/01FGH8NE3800064MEQW00DNBNG/2x.gif";
        check(infoSpan(message(image("LUL", twitch, "Emote", false)), 0) == null, "Off adds no tap");
        settings.put("chat_emote_info", true);
        check(infoSpan(message(image("LUL", twitch, "Emote", false)), 0) != null, "A Twitch emote without a tap gets one");
        check(infoSpan(message(image("reckH", seventv, "Emote", false)), 0) != null, "A 7TV emote gets one");
        check(infoSpan(message(image("Cheer100", "https://d3aqoihi2n8ty8.cloudfront.net/x.gif", "Emote", false)), 0) == null,
            "Cheermotes keep Twitch's handling");
        // Signed in ("name" in Twitch's user preferences), Twitch's emote card span stays the only tap.
        check(infoSpan(message(image("LUL", twitch, "Emote", true)), 0) == null, "Signed in, Twitch's emote card stays");
        settings.remove("name");
        Spanned signedOut = message(image("LUL", twitch, "Emote", true));
        Object[] taps = signedOut.getSpans(0, 1, android.text.style.ClickableSpan.class);
        check(taps.length == 2 && taps[0] == infoSpan(signedOut, 0), "Signed out, Lurk's tap goes first");
        check(infoSpan(message(image("Gif", "https://media.giphy.com/x.gif", "Gif", true)), 0) == null, "GIFs keep their tap");

        // Badges through the real line builder: Twitch's (name, URL) view models become badge spans.
        reset();
        settings.put("chat_emote_info", true);
        String url = "https://static-cdn.jtvnw.net/badges/v1/5d9f2208-5dd8-11e7-8513-2ff4adfae661/2";
        Object model = Class.forName("nsp").getConstructor(String.class, String.class).newInstance("subscriber", url);
        Spanned badges = (Spanned) field(lineWithBadges(Collections.singletonList(model)), "b");
        Object badge = infoSpan(badges, 0);
        check(badge != null, "A badge gets a tap");
        settings.put("chat_emote_info", false);
        check(infoSpan((Spanned) field(lineWithBadges(Collections.singletonList(model)), "b"), 0) == null, "Off: no badge tap");

        // Twitch's badge registry reports set and version; the sheet names the badge from them.
        settings.put("chat_emote_info", true);
        Object key = Class.forName("bh2").getConstructor(String.class, String.class).newInstance("subscriber", "12");
        Class.forName(INFO).getMethod("twitchChannelBadge", String.class, Object.class).invoke(null, url, key);
        Method describe = Class.forName(INFO).getDeclaredMethod("describe", boolean.class, String.class, String.class);
        describe.setAccessible(true);
        Object described = describe.invoke(null, true, "subscriber", url);
        check("1-Year Subscriber".equals(field(described, "name")) && "Twitch channel badge".equals(field(described, "kind")),
            "Twitch badge named by set and version: " + field(described, "name") + ", " + field(described, "kind"));
        described = describe.invoke(null, false, "reckH", seventv);
        check("reckH".equals(field(described, "name")) && String.valueOf(field(described, "kind")).startsWith("7TV"),
            "7TV emote described: " + field(described, "kind"));
        Method title = Class.forName(INFO).getDeclaredMethod("badgeTitle", String.class, String.class);
        title.setAccessible(true);
        String[][] titles = {{"subscriber", "0", "Subscriber"}, {"subscriber", "3006", "Tier 3 6-Month Subscriber"},
            {"subscriber", "2024", "Tier 2 2-Year Subscriber"}, {"bits", "1000", "cheer 1000"},
            {"sub-gifter", "50", "50 Gift Subs"}, {"premium", "1", "Prime Gaming"}, {"twitch-recap-2025", "1", "Twitch Recap 2025"}};
        for (String[] row : titles) {
            check(row[2].equals(title.invoke(null, row[0], row[1])), "Badge title of " + row[0] + "/" + row[1]);
        }

        // The sheet loads a larger copy of the image from the same host.
        Method larger = Class.forName(INFO).getDeclaredMethod("larger", String.class);
        larger.setAccessible(true);
        String[][] urls = {
            {twitch, "https://static-cdn.jtvnw.net/emoticons/v2/425618/default/dark/3.0"},
            {seventv, "https://cdn.7tv.app/emote/01FGH8NE3800064MEQW00DNBNG/4x.gif"},
            {"https://cdn.7tv.app/emote/abc/2x_static.png", "https://cdn.7tv.app/emote/abc/4x_static.png"},
            {"https://cdn.betterttv.net/emote/abc/2x.png", "https://cdn.betterttv.net/emote/abc/3x.png"},
            {"https://cdn.frankerfacez.com/emote/123/2", "https://cdn.frankerfacez.com/emote/123/4"},
            {"https://cdn.frankerfacez.com/emote/123/animated/2.gif", "https://cdn.frankerfacez.com/emote/123/animated/4.gif"},
            {url, url.substring(0, url.length() - 1) + "3"},
            {"data:image/png;base64,AA==", "data:image/png;base64,AA=="},
            {"https://fourtf.com/chatterino/badges/topd3x.png", "https://fourtf.com/chatterino/badges/topd3x.png"}};
        for (String[] row : urls) check(row[1].equals(larger.invoke(null, row[0])), "Larger copy of " + row[0]);
    }

    /** The real line builder with these badge view models, as in ChatStyleArtProbe#line. */
    private static Object lineWithBadges(List<Object> badges) throws Exception {
        Method build = null;
        for (Method method : Class.forName("va6").getDeclaredMethods()) {
            if (method.getName().equals("b") && method.getParameterTypes().length == 21) build = method;
        }
        Object builder = allocate("va6");
        Field colors = builder.getClass().getDeclaredField("e");
        colors.setAccessible(true);
        Object readable = allocate("rap");
        Field contrast = readable.getClass().getDeclaredField("a");
        contrast.setAccessible(true);
        contrast.set(readable, allocate("xnw"));
        colors.set(builder, readable);
        return build.invoke(null, builder, context, badges, sender("viewer"), 0xFFFEFEFE, tokens("hi"),
            false, false, false, "b1", null, staticField("e340", "f"), false, config("Chat"), null, null, null, null, null, true, 0);
    }

    private static android.content.Context viewContext() throws Exception {
        if (android.os.Looper.getMainLooper() == null) android.os.Looper.prepareMainLooper();
        // app_process has no preloaded fonts: give TextView a system font map, as UiBoundaryProbe does.
        android.graphics.fonts.Font font = new android.graphics.fonts.Font.Builder(
            new java.io.File("/system/fonts/Roboto-Regular.ttf")).build();
        Method makeFace = Typeface.class.getDeclaredMethod("createFromFamilies", String.class,
            android.graphics.fonts.FontFamily[].class);
        makeFace.setAccessible(true);
        Typeface face = (Typeface) makeFace.invoke(null, "sans-serif",
            new android.graphics.fonts.FontFamily[]{new android.graphics.fonts.FontFamily.Builder(font).build()});
        Method fonts = Typeface.class.getDeclaredMethod("setSystemFontMap", Map.class);
        fonts.setAccessible(true);
        fonts.invoke(null, Map.of("sans-serif", face, "serif", face, "monospace", face));
        Object thread = Class.forName("android.app.ActivityThread").getMethod("systemMain").invoke(null);
        return (android.content.Context) thread.getClass().getMethod("getSystemContext").invoke(thread);
    }

    private interface Section {
        void run() throws Exception;
    }

    private static int failures;

    private static void section(String name, Section section) {
        try {
            section.run();
            System.out.println("ok   " + name);
        } catch (Throwable failure) {
            Throwable cause = failure instanceof InvocationTargetException ? failure.getCause() : failure;
            System.out.println("FAIL " + name + ": " + cause);
            failures++;
        }
        System.out.flush();
    }

    public static void main(String[] args) throws Exception {
        if (args.length > 0) ProbeLocators.load(args[0]);
        install();
        section("chat keywords: mentions, highlight and blocked words, blocked users, live drops", ChatStyleArtProbe::keywords);
        section("chat appearance: /me style, alternating rows, landscape width", ChatStyleArtProbe::appearance);
        section("chat appearance: emote and badge size, emote image scale, text size and spacing on views", ChatStyleArtProbe::sizes);
        section("emote and badge info: tap spans, Twitch's emote card signed in, badge names", ChatStyleArtProbe::info);
        if (failures > 0) {
            System.out.println("FAILED: " + failures + " section(s)");
            System.exit(1);
        }
        System.out.println("PASS: real Twitch chat line builder with each setting on and off");
    }
}
