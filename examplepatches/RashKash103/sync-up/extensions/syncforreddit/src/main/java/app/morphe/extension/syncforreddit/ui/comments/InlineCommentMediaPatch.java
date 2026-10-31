package app.morphe.extension.syncforreddit.ui.comments;

import java.util.Locale;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.syncforreddit.settings.SyncUpSettings;

/**
 * Whether a link in a comment is drawn as the picture it points at, rather than as a chip naming
 * where it goes.
 *
 * <p>Sync already draws some of them inline, but only where the address ends in one of five
 * extensions or belongs to one of a handful of named services. Anything else — a Reddit gallery
 * link, an Imgur page, a RedGifs or Giphy link, an address that names no extension at all —
 * falls through to the chip, which is what makes the behaviour look arbitrary from a thread
 * where one comment draws and the next does not.
 *
 * <p>This widens that test to everything Sync can actually draw, on a setting of its own.
 *
 * @noinspection unused
 */
public final class InlineCommentMediaPatch {
    private static final String INLINE_EVERYTHING = "sync_up_inline_comment_media";

    /** Hosts that serve a picture or a video whatever the address on them looks like. */
    private static final String[] MEDIA_HOSTS = {
            "i.redd.it", "preview.redd.it", "v.redd.it", "i.imgur.com", "imgur.com",
            "redgifs.com", "gfycat.com", "giphy.com", "tenor.com", "media.giphy.com",
            "i.redditmedia.com", "redditmedia.com", "imgflip.com", "i.imgflip.com",
            "streamable.com", "media.tumblr.com", "youtube.com", "youtu.be",
    };

    /** What an address ends with when it is media, whatever host it is on. */
    private static final String[] MEDIA_ENDINGS = {
            ".jpg", ".jpeg", ".png", ".gif", ".gifv", ".webp", ".bmp", ".apng",
            ".mp4", ".webm", ".mov", ".m4v",
    };

    private static boolean said;

    /** How the size of a drawn picture is decided. */
    private static final String MEDIA_SIZE = "sync_up_inline_media_size";

    /** How wide one may get when its size is its own. */
    private static final String MAX_WIDTH = "sync_up_inline_media_max_width";

    /** How wide one is drawn when every picture is drawn the same width. */
    private static final String FIXED_WIDTH = "sync_up_inline_media_width";

    /** How tall one is drawn when every picture is drawn the same height, in dp. */
    private static final String FIXED_HEIGHT = "sync_up_inline_media_height";

    /** Drawn at the size the picture itself is, up to {@link #MAX_WIDTH}. */
    private static final int ITS_OWN_SIZE = 0;

    /** Every picture the same width, as a share of the room its comment has. */
    private static final int SAME_WIDTH = 1;

    /** Every picture the same height, whatever shape it is. */
    private static final int SAME_HEIGHT = 2;

    /** What Sync rounds the corners of a picture by, which is what it uses everywhere else. */
    private static final int ROUNDED_BY_DP = 8;

    private InlineCommentMediaPatch() {}



    /** Set while a picture has just been put in, so the address is not written out after it. */
    private static final ThreadLocal<Boolean> justDrew = new ThreadLocal<>();

    /**
     * Draws the picture where the link stood, rather than letting Sync make a card of it.
     *
     * <p>Sync has two ways of putting a picture into text. Its giphy handling puts the picture
     * in by itself. Everything else goes into a list of cards, and a card is drawn as a small
     * picture with the address beside it — which is the rectangle, and is not what was asked
     * for. This puts it in the first way.
     *
     * @param card What Sync was about to do, which is make a card of it.
     * @param into The text being built.
     * @param link The address of the picture.
     * @return Whether Sync should still make its card.
     */
    /** What text stands for a picture that is drawn rather than named. */
    private static final String THE_PICTURE_ITSELF = "\uFFFC";

    /**
     * @return The text to write where the link stood.
     *
     * <p>Sync is about to add the link to the cards it draws under the text — a small picture
     * with the address beside it. Where the picture itself was asked for, no card is added and
     * the text written is the one character a picture stands in, which the spans below fill.
     *
     * <p>Adding the card as well is what drew each picture twice.
     */
    /** What an address ends with when it is a video rather than a picture. */
    private static final String[] VIDEO_ENDINGS = { ".mp4", ".webm", ".mov", ".m4v" };

    /** The spans drawn from a video's still, which are marked as playable. */
    private static final java.util.Set<nb.c> playable =
            java.util.Collections.newSetFromMap(
                    new java.util.WeakHashMap<nb.c, Boolean>());

    /** @return Whether this address is a video, which is drawn as its opening frame. */
    private static boolean isVideo(String link) {
        String plain = link.toLowerCase(Locale.ROOT);
        int asked = plain.indexOf('?');
        if (asked > 0) {
            plain = plain.substring(0, asked);
        }
        for (String ending : VIDEO_ENDINGS) {
            if (plain.endsWith(ending)) {
                return true;
            }
        }
        return plain.contains("v.redd.it/");
    }

    /**
     * Called where the span has drawn what it holds, so a video says that it is one.
     *
     * <p>What is drawn is the frame the video starts on, which on its own is a picture like any
     * other and gives no sign that tapping it would play anything. A play mark is drawn over
     * it, the same one anything else showing a video draws.
     */
    public static void overlay(android.graphics.Canvas canvas, nb.c span) {
        if (canvas == null || span == null || !playable.contains(span)) {
            return;
        }
        try {
            Integer gap = gaps.get(span);
            int under = gap == null ? 0 : gap;
            int wide = span.e();
            int tall = heightOf(span) - under;
            if (wide <= 0 || tall <= 0) {
                return;
            }
            float middleX = wide / 2f;
            float middleY = tall / 2f;
            float radius = Math.max(1f, Math.min(wide, tall) * 0.14f);

            android.graphics.Paint paint = new android.graphics.Paint(
                    android.graphics.Paint.ANTI_ALIAS_FLAG);
            paint.setColor(android.graphics.Color.argb(140, 0, 0, 0));
            canvas.drawCircle(middleX, middleY, radius, paint);

            paint.setColor(android.graphics.Color.WHITE);
            android.graphics.Path play = new android.graphics.Path();
            float reach = radius * 0.52f;
            play.moveTo(middleX - reach * 0.62f, middleY - reach);
            play.lineTo(middleX - reach * 0.62f, middleY + reach);
            play.lineTo(middleX + reach * 0.9f, middleY);
            play.close();
            canvas.drawPath(play, paint);
        } catch (Throwable ex) {
            Logger.printInfo(() -> "inline comments: could not mark a video: " + ex);
        }
    }

    /** How much room is left under a drawn picture, so text after it is not against it. */
    private static final int GAP_UNDER_DP = 8;

    /**
     * The gap left under each picture we drew.
     *
     * <p>The span stretches whatever it is given to the size it was made with, so the gap
     * cannot simply be added to that size or the picture would be stretched into it. The span
     * is made taller and the picture bounded inside it instead, which leaves the difference
     * empty. Held weakly and only for the spans this bundle made: Sync draws a marker beside a
     * translated line with the same kind of span, and a gap under that would push the line it
     * sits in apart.
     */
    private static final java.util.Map<nb.c, Integer> gaps =
            java.util.Collections.synchronizedMap(new java.util.WeakHashMap<nb.c, Integer>());

    /** @return A span that draws this picture with room left under it. */
    private static nb.c pictureOf(String link, int wide, int tall) {
        int gap = Math.max(0, (int) (GAP_UNDER_DP * density()));
        nb.c span = new nb.c(link, wide, tall + gap);
        if (gap > 0) {
            gaps.put(span, gap);
        }
        return span;
    }

    /**
     * Called where the span sets out where to draw the picture, in place of doing it itself.
     *
     * @param drawable What is being drawn.
     * @param wide     How wide the span is.
     * @param tall     How tall the span is, which includes any gap left under the picture.
     * @param span     The span, which says how much of that height is the gap.
     */
    public static void bound(android.graphics.drawable.Drawable drawable, int wide, int tall,
                             nb.c span) {
        if (drawable == null) {
            return;
        }
        Integer said = gaps.get(span);
        int under = said == null ? 0 : said;
        drawable.setBounds(0, 0, wide, Math.max(1, tall - under));
    }

    /**
     * @return Whether the picture can actually be drawn where the address stands.
     *
     * <p>Asked before the card is given up for it. Wanting to draw one is not the same as being
     * able to: a video is media by its address and there is no picture in it to decode, and a
     * picture whose size is not known yet cannot be put in proportion. Where the answer is no,
     * Sync's own card is left exactly as it was — which is the difference between a comment
     * whose media is a card and a comment whose media has vanished.
     */
    private static boolean canDraw(String link) {
        String drawn = drawnFrom(link);
        if (drawn == null) {
            return false;
        }
        int[] shape = shapeOf(drawn);
        return shape != null && sizeFor(shape, lastWidth) != null;
    }

    /**
     * @return The address the picture is actually fetched from, which for a video is the still
     *         taken of its opening frame, or null where there is not one yet.
     */
    private static String drawnFrom(String link) {
        return isVideo(link) ? VideoPosters.stillFor(link) : link;
    }

    public static String cardOrPicture(nc.b cards, nc.b.a card, String link) {
        if (!wanted(link) || !canDraw(link)) {
            return cards.c(card);
        }
        justDrew.set(Boolean.TRUE);
        Logger.printDebug(() -> "inline comments: no card for " + link
                + "; the picture stands where the address did");
        // Nothing at all: the picture has already been drawn over the address itself, and a
        // card would be the same picture again, small, underneath it.
        return "";
    }

    /**
     * @return What to draw that text with: the picture by itself, which is what Sync's own
     *         giphy handling draws one with, rather than the card's label.
     */
    /**
     * How big each picture is, once it has been asked.
     *
     * <p>The span that draws a picture is told a width and a height when it is made and never
     * changes them, so a guess at the shape is a picture drawn wrong for as long as it is on
     * screen. Sync draws one inline only where the address itself carries both numbers and
     * falls back to a card otherwise, which is why a card is what most of them were.
     */
    private static final java.util.Map<String, int[]> shapes =
            java.util.Collections.synchronizedMap(new java.util.HashMap<String, int[]>());

    /** Pictures already being measured, so a list redrawing does not ask again. */
    private static final java.util.Set<String> measuring =
            java.util.Collections.synchronizedSet(new java.util.HashSet<String>());

    private static final java.util.concurrent.ExecutorService MEASURING =
            java.util.concurrent.Executors.newFixedThreadPool(6);

    /** The pictures being asked about, so the comments can wait for the answers. */
    private static final java.util.Map<String, java.util.concurrent.Future<?>> pending =
            new java.util.concurrent.ConcurrentHashMap<>();

    /**
     * Writes down how big a picture is, as Reddit itself said when it sent the comments.
     *
     * <p>This is where the sizes are meant to come from: Reddit sends them beside the text, so
     * they are known before anything is drawn, and the picture goes in the right shape the first
     * time. Sync draws one inline on exactly the same grounds.
     */
    public static void remember(String link, int wide, int tall) {
        if (link == null || link.isEmpty() || wide <= 0 || tall <= 0) {
            return;
        }
        String plain = link.replace("&amp;", "&");
        if (shapes.put(plain, new int[]{ wide, tall }) == null) {
            Logger.printDebug(() -> "inline comments: Reddit says " + plain
                    + " is " + wide + "x" + tall);
        }
        // Kept under both spellings: Reddit writes its addresses with the ampersands escaped
        // and asks for them unescaped.
        shapes.put(link, new int[]{ wide, tall });
    }

    /**
     * Starts measuring a picture Reddit said nothing about, as its comments arrive.
     *
     * <p>Reddit gives sizes for what it hosts itself and nothing for a giphy picture, so that
     * one has to be asked. Asked now rather than when it is drawn, since the comments arrive
     * well before any of them are on screen.
     */
    public static void measureSoon(String link) {
        if (link == null || link.isEmpty() || shapes.containsKey(link)) {
            return;
        }
        measure(link);
    }

    /**
     * @return The picture's size, or null where it is not known yet. Asking is done off to one
     *         side; until there is an answer the picture is left as Sync drew it, a card being
     *         better than a picture of the wrong shape.
     */
    private static int[] shapeOf(String link) {
        int[] known = shapes.get(link);
        if (known != null) {
            return known;
        }
        // What the address says, where it says anything. Sync reads these too.
        try {
            android.net.Uri asked = android.net.Uri.parse(link);
            String wide = asked.getQueryParameter("width");
            String tall = asked.getQueryParameter("height");
            if (wide != null && tall != null) {
                int[] shape = { Integer.parseInt(wide), Integer.parseInt(tall) };
                shapes.put(link, shape);
                return shape;
            }
        } catch (Exception ignored) {
            // Measured below instead.
        }
        measure(link);
        return null;
    }

    /** Reads the size out of the picture's own header, without decoding the picture. */
    private static void measure(String link) {
        if (!measuring.add(link)) {
            return;
        }
        pending.put(link, MEASURING.submit(() -> {
            java.net.HttpURLConnection asking = null;
            try {
                asking = (java.net.HttpURLConnection) new java.net.URL(link).openConnection();
                asking.setConnectTimeout(8000);
                asking.setReadTimeout(10000);
                asking.setInstanceFollowRedirects(true);
                android.graphics.BitmapFactory.Options only =
                        new android.graphics.BitmapFactory.Options();
                only.inJustDecodeBounds = true;
                try (java.io.InputStream reading = asking.getInputStream()) {
                    android.graphics.BitmapFactory.decodeStream(reading, null, only);
                }
                if (only.outWidth > 0 && only.outHeight > 0) {
                    shapes.put(link, new int[]{ only.outWidth, only.outHeight });
                    Logger.printDebug(() -> "inline comments: " + link + " is "
                            + only.outWidth + "x" + only.outHeight);
                } else {
                    Logger.printInfo(() -> "inline comments: could not measure " + link);
                }
            } catch (Throwable ex) {
                Logger.printInfo(() -> "inline comments: could not measure " + link + ": " + ex);
            } finally {
                if (asking != null) {
                    asking.disconnect();
                }
                measuring.remove(link);
                pending.remove(link);
            }
        }));
    }

    /**
     * Waits for the pictures that had to be measured, so the comments they are in are drawn
     * knowing how big they are.
     *
     * <p>Called where the comments arrive, off the screen's thread and before Sync has seen
     * them. Reddit sends its own sizes, so this is only ever the few it says nothing about;
     * waiting there costs the reply the time of one small request and saves every picture in
     * it standing as a card until it has been asked about. Bounded, since a picture drawn late
     * is better than comments that do not arrive.
     *
     * @param millis How long to wait altogether.
     */
    public static void awaitMeasures(long millis) {
        long until = android.os.SystemClock.uptimeMillis() + millis;
        for (String link : new java.util.ArrayList<>(pending.keySet())) {
            java.util.concurrent.Future<?> asking = pending.get(link);
            if (asking == null) {
                continue;
            }
            long left = until - android.os.SystemClock.uptimeMillis();
            if (left <= 0) {
                Logger.printDebug(() -> "inline comments: still measuring " + link
                        + " when the comments were wanted");
                break;
            }
            try {
                asking.get(left, java.util.concurrent.TimeUnit.MILLISECONDS);
            } catch (Exception ignored) {
                // Drawn as a card this once, and in shape the next time it is on screen.
            }
            pending.remove(link);
        }
    }

    /**
     * Remembers how wide the comment about to be drawn may be.
     *
     * <p>Sync works this out for every comment, taking the indent and the margins off the width
     * of the screen, and it is right: a reply gets less room than what it replies to. It is only
     * handed to the parse, though, and Reddit's own giphy pictures are drawn by a path that is
     * told the address and nothing else. That path was left guessing — the width of the last
     * comment that happened to hold a link, or nine tenths of the screen — so a giphy in a reply
     * was built wider than the room it had and cut off on the right.
     *
     * <p>Called where the width is settled, which is once per comment and before any of it is
     * parsed, so what it records is this comment's own.
     *
     * @param where What Sync is about to draw the text with.
     */
    public static void howWide(nc.a where) {
        if (!isPatchIncluded() || !inlineEverything() || where == null) {
            return;
        }
        try {
            final int room = where.e;
            if (room <= 0) {
                return;
            }
            lastWidth = room;
        } catch (Throwable ex) {
            Logger.printInfo(() -> "inline comments: could not tell how wide the text is: " + ex);
        }
    }



    /**
     * How big to draw a picture, given the shape it is and the room its comment has.
     *
     * <p>Drawn at its own size by default: a picture of few pixels blown up to the width of a
     * comment is a blurry picture, and on a large screen an unwelcome one. What it may grow to,
     * and whether every picture is drawn the same instead, is settled in the settings.
     *
     * @param shape What the picture is, in its own pixels.
     * @param room  How wide the comment it sits in may be drawn.
     * @return The width and height to draw at, or null where there is nothing to draw in.
     */
    private static int[] sizeFor(int[] shape, int room) {
        if (shape == null || shape.length < 2 || shape[0] <= 0 || shape[1] <= 0 || room <= 0) {
            return null;
        }
        int wide;
        switch (SyncUpSettings.number(MEDIA_SIZE, ITS_OWN_SIZE)) {
            case SAME_HEIGHT:
                int tall = (int) (SyncUpSettings.number(FIXED_HEIGHT, 200) * density());
                wide = (int) ((long) tall * shape[0] / shape[1]);
                break;
            case SAME_WIDTH:
                wide = (int) ((long) room * share(FIXED_WIDTH) / 100);
                break;
            default:
                // Its own size, which is the number of pixels it actually has, up to what it is
                // allowed to grow to. Nothing is ever blown up past the pixels it came with.
                wide = Math.min(shape[0], (int) ((long) room * share(MAX_WIDTH) / 100));
                break;
        }
        // Never wider than the comment: what does not fit is cut off by the text it sits in.
        wide = Math.min(wide, room);
        if (wide <= 0) {
            return null;
        }
        int high = (int) ((long) wide * shape[1] / shape[0]);
        return high <= 0 ? null : new int[]{ wide, high };
    }

    /** @return A share out of a hundred, kept inside it. */
    private static int share(String key) {
        int said = SyncUpSettings.number(key, 100);
        return said < 1 || said > 100 ? 100 : said;
    }

    private static float density() {
        try {
            return app.morphe.extension.shared.Utils.getContext()
                    .getResources().getDisplayMetrics().density;
        } catch (Throwable ex) {
            return 1f;
        }
    }

    /**
     * Settles how Glide is to decode a picture that will be drawn in a comment.
     *
     * <p>The span draws whatever it is given stretched to the size it was made with, and Sync
     * asked for the picture to be decoded into a square of that span's width and rounded by 8dp.
     * The rounding is in the pixels of the decoded picture, so wherever the two sizes differed
     * the corners were drawn at some other radius than 8dp — a giphy fetched two hundred pixels
     * tall and drawn four times that came out with corners four times too round, and pixelated
     * with them.
     *
     * <p>Asked for at the size it will be drawn, and scaled to exactly that before it is
     * rounded, which is what Sync already does everywhere else it draws a picture.
     *
     * @param request What Glide has been told so far.
     * @param span    The span the picture is being decoded for.
     * @return What to go on building the request with.
     */
    public static t3.a shapeFor(t3.a request, nb.c span) {
        if (!isPatchIncluded() || request == null || span == null) {
            return request == null ? null : request.n0(new k3.a0(rounding()));
        }
        try {
            int wide = span.e();
            int high = heightOf(span);
            if (wide > 0 && high > 0) {
                request = request.Y(wide, high);
            }
            // Scaled to the size it is drawn at, then rounded, so the corners are the radius
            // asked for rather than that radius times however far the picture was stretched.
            return request.n0(new k3.i(), new k3.a0(rounding()));
        } catch (Throwable ex) {
            Logger.printInfo(() -> "inline comments: could not settle how to decode: " + ex);
            return request.n0(new k3.a0(rounding()));
        }
    }

    private static int rounding() {
        return Math.max(1, (int) (ROUNDED_BY_DP * density()));
    }

    /**
     * @return How tall the span draws, which it keeps to itself. Read rather than asked for,
     *         since the app offers the width and not the height.
     */
    private static int heightOf(nb.c span) {
        try {
            java.lang.reflect.Field tall = nb.c.class.getDeclaredField("t");
            tall.setAccessible(true);
            return tall.getInt(span);
        } catch (Throwable ex) {
            Logger.printDebug(() -> "inline comments: the span will not say how tall it is: " + ex);
            return 0;
        }
    }

    public static Object[] spansFor(Object[] spans, String link, nc.a where) {
        if (!wanted(link)) {
            return spans;
        }
        try {
            int width = where == null ? 0 : where.e;
            if (width > 0) {
                // Remembered for Reddit's own giphy pictures, which are drawn by a path that is
                // told the address and nothing else.
                lastWidth = width;
            }
            if (width <= 0) {
                Logger.printInfo(() -> "inline comments: no width to draw " + link + " at");
                return spans;
            }
            String drawn = drawnFrom(link);
            if (drawn == null) {
                Logger.printDebug(() -> "inline comments: no still of " + link + " yet, "
                        + "leaving it as Sync drew it");
                return spans;
            }
            int[] shape = shapeOf(drawn);
            if (shape == null) {
                // A picture of the wrong shape is worse than the card Sync would have drawn.
                Logger.printDebug(() -> "inline comments: the shape of " + link
                        + " is not known yet, leaving it as Sync drew it");
                return spans;
            }
            int[] size = sizeFor(shape, width);
            if (size == null) {
                Logger.printDebug(() -> "inline comments: nothing to draw " + link + " in");
                return spans;
            }
            final int drawWide = size[0];
            final int drawTall = size[1];
            Logger.printDebug(() -> "inline comments: drawing " + link + " "
                    + drawWide + "x" + drawTall + " of " + shape[0] + "x" + shape[1]
                    + " in " + width);
            // The span that draws the picture and nothing else, at the shape it actually is.
            // Its sibling draws a card: a small picture with the address beside it.
            // Drawn from the still where it is a video; the link itself is what a tap opens,
            // which is the player.
            nb.c picture = pictureOf(drawn, drawWide, drawTall);
            if (isVideo(link)) {
                playable.add(picture);
            }
            return new Object[]{ picture, new mb.d(link) };
        } catch (Throwable ex) {
            Logger.printInfo(() -> "inline comments: could not draw " + link + ": " + ex);
            return spans;
        }
    }

    private static boolean wanted(String link) {
        return isPatchIncluded() && link != null && !link.isEmpty()
                && inlineEverything() && isMedia(link);
    }

    /**
     * @param expanded Whether Sync writes the address out after a link.
     * @param handled  Whether the link was already drawn as something.
     * @return Whether to write the address out.
     */
    public static boolean stillShowTheLink(boolean expanded, boolean handled) {
        if (Boolean.TRUE.equals(justDrew.get())) {
            justDrew.remove();
            Logger.printDebug(() -> "inline comments: leaving the address off what was drawn");
            return false;
        }
        return expanded;
    }

    /** How wide the text was last drawn, for a path that is not told. */
    private static volatile int lastWidth;

    /**
     * The giphy picture being drawn.
     *
     * <p>Kept here rather than read again further down: Sync builds the address into a register
     * and then uses that same register for the character a picture stands in, so by the time
     * the spans are written the address is no longer there to read.
     */
    private static volatile String giphyLink;

    /** Called where Sync draws one of Reddit's own giphy pictures, which it has its own path for. */
    public static void giphy(String link) {
        giphyLink = link;
        Logger.printDebug(() -> "inline comments: a giphy picture, drawn from " + link);
    }

    /**
     * @return What to draw Reddit's own giphy pictures with.
     *
     * <p>They have a path of their own, which draws a card: a small picture with the address
     * beside it. Where the picture itself was asked for, it is drawn as the picture, at the
     * width the text was last drawn at — that path is told the address and nothing else.
     */
    public static Object[] giphySpans(Object[] spans) {
        String link = giphyLink;
        if (!isPatchIncluded() || !inlineEverything() || link == null || link.isEmpty()) {
            return spans;
        }
        int width = lastWidth;
        if (width <= 0) {
            try {
                width = (int) (app.morphe.extension.shared.Utils.getContext().getResources()
                        .getDisplayMetrics().widthPixels * 0.9f);
            } catch (Throwable ex) {
                Logger.printInfo(() -> "inline comments: no width for a giphy picture: " + ex);
                return spans;
            }
        }
        final int drawAt = width;
        try {
            int[] shape = shapeOf(link);
            if (shape == null) {
                Logger.printDebug(() -> "inline comments: the shape of " + link
                        + " is not known yet, leaving it as Sync drew it");
                return spans;
            }
            int[] size = sizeFor(shape, drawAt);
            if (size == null) {
                Logger.printDebug(() -> "inline comments: nothing to draw " + link + " in");
                return spans;
            }
            final int wide = size[0];
            final int tall = size[1];
            Logger.printDebug(() -> "inline comments: drawing the giphy picture " + link
                    + " " + wide + "x" + tall + " of " + shape[0] + "x" + shape[1]);
            return new Object[]{ pictureOf(link, wide, tall), new mb.d(link) };
        } catch (Throwable ex) {
            Logger.printInfo(() -> "inline comments: could not draw " + link + ": " + ex);
            return spans;
        }
    }

    /**
     * Sync asks something about where the link is before it asks anything about the link. What
     * that is, is not named in the app; it is answered here so that a capture says whether it
     * is what stops a picture being drawn where it sits.
     *
     * @param sync What Sync decided about where this link is.
     */
    public static boolean here(boolean sync) {
        return sync || inlineEverything();
    }

    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /** Whether the setting is on, so Sync's own gate can be opened alongside it. */
    public static boolean inlineEverything() {
        if (!isPatchIncluded()) {
            return false;
        }
        boolean on = SyncUpSettings.flag(INLINE_EVERYTHING, false);
        if (!said) {
            said = true;
            SyncUpSettings.report("inline comments", INLINE_EVERYTHING);
            Logger.printDebug(() -> "inline comments: widening is " + (on ? "on" : "off"));
        }
        return on;
    }

    /**
     * Sync will not draw anything inline unless its own inline-previews setting is on, and that
     * setting is about its own narrow list. Opening the gate here lets the widened test below be
     * the one that decides.
     *
     * @param sync What Sync's own setting says.
     */
    public static boolean orInlineEverything(boolean sync) {
        return sync || inlineEverything();
    }

    /**
     * Whether this link is one to draw where it sits rather than to show a preview of the page
     * it is on.
     *
     * <p>Sync decides whether to preview a page before it decides anything about drawing a
     * picture, and a link it has already made a preview of is marked as dealt with and never
     * looked at again. A gif was therefore always a preview of the page it is on, whatever the
     * rest of this answered.
     */
    public static boolean claimsAsMedia(String link) {
        if (!isPatchIncluded() || link == null || link.isEmpty() || !inlineEverything()) {
            return false;
        }
        boolean media = isMedia(link) && canDraw(link);
        if (media) {
            Logger.printDebug(() -> "inline comments: claiming " + link
                    + " rather than letting it become a preview");
        }
        return media;
    }

    /**
     * @param sync     What Sync decided on its own.
     * @param link     The address in the comment.
     * @return Whether to draw the link as the media it points at.
     */
    public static boolean shouldInline(boolean sync, String link) {
        if (sync) {
            Logger.printDebug(() -> "inline comments: Sync already draws " + link);
            return true;
        }
        if (!inlineEverything()) {
            Logger.printDebug(() -> "inline comments: leaving " + link + " as a chip");
            return false;
        }
        if (link == null || link.isEmpty()) {
            return false;
        }

        boolean media = isMedia(link);
        Logger.printDebug(() -> "inline comments: " + link + " -> "
                + (media ? "drawing it inline" : "not media, left as a chip"));
        return media;
    }

    /** @return Whether the address points at something that can be drawn. */
    private static boolean isMedia(String link) {
        String lower = link.toLowerCase(Locale.ROOT);

        // Anything after the address itself is no help in telling what it points at.
        int query = lower.indexOf('?');
        String path = query < 0 ? lower : lower.substring(0, query);
        for (String ending : MEDIA_ENDINGS) {
            if (path.endsWith(ending)) {
                return true;
            }
        }

        for (String host : MEDIA_HOSTS) {
            // Matched against the whole address rather than a parsed host, since what arrives
            // here is sometimes written without a scheme.
            if (lower.contains("//" + host + "/") || lower.contains("." + host + "/")
                    || lower.contains("//" + host) && lower.endsWith(host)) {
                return true;
            }
        }
        return false;
    }
}
