package app.jofslash.extension.booking;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.graphics.Bitmap;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.CookieManager;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Locale;

/**
 * The "Official site" tab: Google Hotels for this hotel and stay in a WebView, with what the page
 * lists from the hotel's own website read out and put next to the Booking.com price.
 *
 * <p>Google is loaded only when the user opens the tab. If Google opens its results list, the
 * hotel that matches best is opened once. Reading the page only looks at what is already loaded;
 * when it can't find the prices the page stays visible so the user can read them.
 */
final class OfficialSiteTab {
    /** How often and how long to look for the offers while the page draws them. */
    private static final int READ_DELAY_MS = 800;
    private static final int READ_TRIES = 20;
    /** Reads in a row with the same number of offers before the list counts as complete. */
    private static final int STABLE_READS = 3;

    private final Activity activity;
    private final Panel panel;
    private final Panel.Colors colors;
    private final HotelInfo hotel;
    private final Stay stay;
    private final Handler main = new Handler(Looper.getMainLooper());

    private LinearLayout root;
    private LinearLayout summary;
    private TextView status;
    private WebView web;
    private boolean started;
    private boolean openedHotel;
    private boolean expanded;
    private boolean retriedWithHotelWord;
    private boolean triedWebSearch;
    /** The hotel's name on Google, shown so the user can tell it found the right one. */
    private String googleName;
    /** Google's judgment of the price against the hotel's usual prices, when the page shows one. */
    private String googleSignal;
    /** The hotel's prices page as loaded, in the user's own region. */
    private String pricesPageUrl;
    /** The optional "deal rating (US data)" read: its link, result line and hidden page. */
    private TextView usLink;
    private TextView usResult;
    private WebView usWeb;
    private int readGeneration;
    /** The page generation a read is already running for, so a page that reports "finished" twice is read once. */
    private int readingGeneration = -1;

    OfficialSiteTab(Activity activity, Panel panel, Panel.Colors colors, HotelInfo hotel, Stay stay) {
        this.activity = activity;
        this.panel = panel;
        this.colors = colors;
        this.hotel = hotel;
        this.stay = stay;
    }

    View view() {
        if (root != null) return root;
        root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);

        LinearLayout top = new LinearLayout(activity);
        top.setOrientation(LinearLayout.VERTICAL);
        top.setPadding(panel.dp(16), panel.dp(12), panel.dp(16), panel.dp(4));
        status = panel.text(Strings.OFFICIAL_LOADING, 14, colors.secondaryText, false);
        top.addView(status);
        summary = new LinearLayout(activity);
        summary.setOrientation(LinearLayout.VERTICAL);
        top.addView(summary);
        usResult = panel.text("", 14, colors.text, true);
        usResult.setVisibility(View.GONE);
        usResult.setPadding(0, panel.dp(10), 0, 0);
        top.addView(usResult);
        usLink = panel.link(Strings.US_RATING, v -> readUsRating());
        usLink.setVisibility(View.GONE);
        top.addView(usLink);
        top.addView(panel.link(Strings.FIND_WEBSITE,
                v -> panel.openInBrowser(GoogleHotels.websiteSearchUrl(hotel.name, hotel.city))));
        root.addView(top);
        root.addView(panel.divider());
        return root;
    }

    @SuppressLint("SetJavaScriptEnabled")
    void start() {
        if (started) return;
        started = true;
        try {
            web = new WebView(activity);
        } catch (Throwable t) {
            // No WebView on this phone: leave the link to the hotel's website.
            Log.w(HotelInfo.TAG, "No WebView", t);
            status.setText(Strings.OFFICIAL_NOT_FOUND);
            return;
        }
        WebSettings s = web.getSettings();
        s.setJavaScriptEnabled(true);
        s.setDomStorageEnabled(true);
        CookieManager.getInstance().setAcceptCookie(true);
        web.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                String url = request.getUrl().toString();
                String host = request.getUrl().getHost();
                // Google pages stay inside; links out (an offer, a hotel's site) open the browser.
                if (host != null && (host.equals("www.google.com") || host.startsWith("consent.google."))
                        && !url.contains("/lodging/clk") && !url.contains("/aclk")) {
                    return false;
                }
                panel.openInBrowser(url);
                return true;
            }

            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) {
                readGeneration++;
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                onPage(url);
            }
        });
        root.addView(web, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        String url = GoogleHotels.searchUrl(hotel.name, hotel.city, stay, hotel.currency, false);
        Log.i(HotelInfo.TAG, "Opening " + url);
        web.loadUrl(url);
    }

    void destroy() {
        main.removeCallbacksAndMessages(null);
        destroyUsWeb();
        if (web != null) {
            web.stopLoading();
            web.destroy();
            web = null;
        }
    }

    private void onPage(String url) {
        if (web == null) return;
        if (GoogleHotels.isBlockedPage(url)) {
            status.setText(url.contains("consent.") ? Strings.OFFICIAL_CONSENT : Strings.OFFICIAL_BLOCKED);
            return;
        }
        if (GoogleHotels.isPricesPage(url)) {
            pricesPageUrl = url;
            if (readingGeneration != readGeneration) {
                readingGeneration = readGeneration;
                status.setText(Strings.OFFICIAL_LOADING);
                readOffers(readGeneration, 0);
            }
        } else if (GoogleHotels.isEntityPage(url)) {
            if (!openedHotel) {
                openedHotel = true;
                web.loadUrl(GoogleHotels.pricesUrl(url));
            }
        } else if (GoogleHotels.isResultsPage(url)) {
            findHotel(readGeneration, 0);
        } else if (GoogleHotels.isWebSearchPage(url) && triedWebSearch && !openedHotel) {
            findInWebSearch(readGeneration, 0);
        }
    }

    /** Last try: Google Hotels found nothing, so look for the hotel with a plain web search. */
    private void webSearchFallback() {
        if (web == null || triedWebSearch) {
            status.setText(Strings.OFFICIAL_NOT_FOUND);
            return;
        }
        Log.i(HotelInfo.TAG, "No match on Google Hotels, trying a web search");
        triedWebSearch = true;
        web.loadUrl(GoogleHotels.webSearchUrl(hotel.name, hotel.city));
    }

    private void findInWebSearch(final int generation, final int attempt) {
        if (web == null || openedHotel || generation != readGeneration) return;
        web.evaluateJavascript(GoogleHotels.entityFromWebSearchScript(), value -> {
            String id = value == null || "null".equals(value) ? null : value.replace("\"", "");
            if (id != null && !id.isEmpty() && web != null && !openedHotel) {
                Log.i(HotelInfo.TAG, "Google Hotels page from the web search: " + id);
                openedHotel = true;
                web.loadUrl(GoogleHotels.entityPricesUrl(id, stay, hotel.currency));
            } else if (attempt + 1 < 6) {
                main.postDelayed(() -> findInWebSearch(generation, attempt + 1), READ_DELAY_MS);
            } else {
                status.setText(Strings.OFFICIAL_NOT_FOUND);
            }
        });
    }

    /** On the results list: open the hotel that matches by name, once. */
    private void findHotel(final int generation, final int attempt) {
        if (web == null || openedHotel || generation != readGeneration) return;
        web.evaluateJavascript(GoogleHotels.findHotelScript(hotel.name, hotel.city), value -> {
            JSONObject json = parse(value);
            String url = json == null ? null : json.optString("url", null);
            boolean noResults = json != null && json.optBoolean("noResults");
            boolean onlyOthers = json != null && json.optDouble("score", 0) > 0 && attempt >= 4
                    && (url == null || "null".equals(url));
            if ((noResults || onlyOthers) && !retriedWithHotelWord && web != null) {
                // "Mandarin Oriental Vienna" finds nothing, "Mandarin Oriental Vienna hotel" does.
                // "ibis Wien City Vienna" shows only other ibis hotels.
                Log.i(HotelInfo.TAG, "No match on Google, searching again with \"hotel\"");
                retriedWithHotelWord = true;
                web.loadUrl(GoogleHotels.searchUrl(hotel.name, hotel.city, stay, hotel.currency, true));
            } else if (url != null && !"null".equals(url) && web != null && !openedHotel) {
                Log.i(HotelInfo.TAG, "Google result " + json.optString("name") + " score " + json.optDouble("score"));
                openedHotel = true;
                web.loadUrl(GoogleHotels.pricesUrl(url));
            } else if (!noResults && !onlyOthers && attempt + 1 < READ_TRIES) {
                main.postDelayed(() -> findHotel(generation, attempt + 1), READ_DELAY_MS);
            } else {
                webSearchFallback();
            }
        });
    }

    private void readOffers(final int generation, final int attempt) {
        readOffers(generation, attempt, -1, 0);
    }

    /**
     * Google draws the offers bit by bit. Reads them until the hotel's own offer is there, or the
     * number of offers stops growing; then, once, opens "View more options" and reads again.
     */
    private void readOffers(final int generation, final int attempt, final int lastCount, final int stable) {
        if (web == null || generation != readGeneration) return;
        web.evaluateJavascript(GoogleHotels.readOffersScript(), value -> {
            JSONObject json = parse(value);
            final JSONArray offers = json == null ? null : json.optJSONArray("offers");
            if (json != null && !json.isNull("title")) googleName = json.optString("title");
            if (json != null) googleSignal = signalText(json.optJSONObject("signal"));
            int count = offers == null ? 0 : offers.length();
            boolean hasOfficial = false;
            for (int i = 0; i < count; i++) {
                if (offers.optJSONObject(i).optBoolean("official")) hasOfficial = true;
            }
            int nowStable = count > 0 && count == lastCount ? stable + 1 : 0;
            if (!hasOfficial && nowStable < STABLE_READS && attempt + 1 < READ_TRIES) {
                main.postDelayed(() -> readOffers(generation, attempt + 1, count, nowStable), READ_DELAY_MS);
                return;
            }
            if (!hasOfficial && !expanded && web != null) {
                // Google shows about ten offers and hides the rest behind "View more options".
                expanded = true;
                web.evaluateJavascript(GoogleHotels.showMoreOffersScript(), clicked -> {
                    Log.i(HotelInfo.TAG, "More offers button: " + clicked + ", offers so far " + count);
                    if ("true".equals(clicked)) {
                        main.postDelayed(() -> readOffers(generation, Math.max(0, READ_TRIES - 6), count, 0), READ_DELAY_MS);
                    } else {
                        show(offers);
                    }
                });
                return;
            }
            Log.i(HotelInfo.TAG, "Google offers (" + count + "): " + (offers == null ? "none" : offers.toString()));
            show(offers);
        });
    }

    /**
     * Reads Google's deal rating for this hotel as the US region sees it, once per tap. It loads
     * the same prices page with gl=us in a hidden WebView, takes only the rating from it and
     * throws the page away: the prices shown stay the local ones.
     */
    @SuppressLint("SetJavaScriptEnabled")
    private void readUsRating() {
        if (pricesPageUrl == null || usWeb != null) return;
        usLink.setEnabled(false);
        usLink.setText(Strings.US_RATING_LOADING);
        try {
            usWeb = new WebView(activity);
        } catch (Throwable t) {
            usDone(null);
            return;
        }
        usWeb.getSettings().setJavaScriptEnabled(true);
        usWeb.getSettings().setDomStorageEnabled(true);
        final boolean[] reading = {false};
        usWeb.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                return !"www.google.com".equals(request.getUrl().getHost());
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                if (reading[0] || !GoogleHotels.isPricesPage(url)) {
                    if (GoogleHotels.isBlockedPage(url)) usDone(null);
                    return;
                }
                reading[0] = true;
                readUsSignal(0);
            }
        });
        // It has to be in the window to run its scripts, but nobody needs to see it.
        root.addView(usWeb, new LinearLayout.LayoutParams(1, 1));
        usWeb.setVisibility(View.INVISIBLE);
        String url = GoogleHotels.usRegionUrl(pricesPageUrl);
        Log.i(HotelInfo.TAG, "Reading the US deal rating from " + url);
        usWeb.loadUrl(url);
        // Give up after a while rather than wait forever.
        main.postDelayed(() -> {
            if (usWeb != null) usDone(null);
        }, 25_000);
    }

    private void readUsSignal(final int attempt) {
        if (usWeb == null) return;
        usWeb.evaluateJavascript(GoogleHotels.readOffersScript(), value -> {
            JSONObject json = parse(value);
            String signal = json == null ? null : signalText(json.optJSONObject("signal"));
            int offers = json == null || json.optJSONArray("offers") == null ? 0 : json.optJSONArray("offers").length();
            // The rating sits at the top of the page; once the offers below it are drawn, it's
            // there or it isn't.
            if (signal == null && (offers == 0 || attempt < 3) && attempt + 1 < READ_TRIES) {
                main.postDelayed(() -> readUsSignal(attempt + 1), READ_DELAY_MS);
                return;
            }
            usDone(signal != null ? signal : Strings.US_RATING_NONE);
        });
    }

    private void usDone(String result) {
        destroyUsWeb();
        Log.i(HotelInfo.TAG, "US deal rating: " + result);
        usResult.setText(String.format(Strings.GOOGLE_SIGNAL_US, result != null ? result : Strings.US_RATING_FAILED));
        usResult.setVisibility(View.VISIBLE);
        usLink.setText(Strings.US_RATING);
        usLink.setEnabled(true);
    }

    private void destroyUsWeb() {
        if (usWeb == null) return;
        WebView w = usWeb;
        usWeb = null;
        w.stopLoading();
        root.removeView(w);
        w.destroy();
    }

    /**
     * "great deal, 54% less than usual", "prices are currently high", or just "deal". Null when
     * Google shows nothing: the line is left out rather than guessed.
     */
    private static String signalText(JSONObject signal) {
        if (signal == null) return null;
        String deal = signal.isNull("deal") ? null : signal.optString("deal").trim();
        String text = signal.isNull("text") ? null : signal.optString("text").trim().replaceAll("\\s+", " ");
        String dealWord = deal == null || deal.isEmpty() ? null
                : deal.toUpperCase(Locale.ROOT).startsWith("GREAT") ? Strings.GOOGLE_GREAT_DEAL : Strings.GOOGLE_DEAL;
        if (text != null && !text.isEmpty()) {
            text = Character.toLowerCase(text.charAt(0)) + text.substring(1);
            return dealWord == null ? text : dealWord + ", " + text;
        }
        return dealWord;
    }

    private static JSONObject parse(String value) {
        try {
            // evaluateJavascript returns the JSON string as a JSON string literal.
            Object inner = new org.json.JSONTokener(value).nextValue();
            return inner instanceof String ? new JSONObject((String) inner) : null;
        } catch (Exception e) {
            return null;
        }
    }

    /** One offer read from the page. */
    private static final class Offer {
        String provider;
        String url;
        boolean official;
        double nightly = Double.NaN;
        double total = Double.NaN;
        double memberTotal = Double.NaN;
    }

    /**
     * The page lists each price a few times: per night, and the total for the stay. The total is
     * the number that is the nightly price times the nights.
     */
    private Offer offer(JSONObject o) {
        Offer offer = new Offer();
        offer.provider = o.optString("provider");
        offer.url = o.optString("url");
        offer.official = o.optBoolean("official");
        JSONArray p = o.optJSONArray("prices");
        if (p == null) return offer;
        int nights = stay == null ? 1 : stay.nights();
        double[][] pairs = new double[2][];
        int found = 0;
        if (nights == 1) {
            // Nightly price and total are the same number: take the distinct ones in order.
            for (int i = 0; i < p.length() && found < 2; i++) {
                double v = p.optDouble(i);
                if (found == 0 || Math.abs(pairs[found - 1][0] - v) > 0.5) pairs[found++] = new double[]{v, v};
            }
        }
        int i = 0;
        while (nights > 1 && i < p.length() && found < 2) {
            double nightly = p.optDouble(i);
            int match = -1;
            for (int j = i + 1; j < p.length(); j++) {
                double total = p.optDouble(j);
                if (Math.abs(total - nightly * nights) <= Math.max(2, nightly * nights * 0.02)) {
                    match = j;
                    break;
                }
            }
            if (match < 0) {
                i++;
                continue;
            }
            pairs[found++] = new double[]{nightly, p.optDouble(match)};
            i = match + 1;
        }
        if (found == 0 && p.length() > 0) {
            // Couldn't tell which is which: take the first as the nightly price.
            offer.nightly = p.optDouble(0);
            offer.total = offer.nightly * nights;
            return offer;
        }
        if (found > 0) {
            offer.nightly = pairs[0][0];
            offer.total = pairs[0][1];
        }
        if (found > 1 && o.optBoolean("member") && pairs[1][1] < offer.total) offer.memberTotal = pairs[1][1];
        return offer;
    }

    private void show(JSONArray offers) {
        summary.removeAllViews();
        // The optional US rating, only once the local page is read and showed no rating itself.
        usLink.setVisibility(pricesPageUrl != null && googleSignal == null ? View.VISIBLE : View.GONE);
        if (googleSignal != null) {
            Log.i(HotelInfo.TAG, "Google signal: " + googleSignal);
            summary.addView(panel.spaced(panel.text(String.format(Strings.GOOGLE_SIGNAL, googleSignal), 15,
                    colors.text, true), 0));
        }
        if (googleName != null && !googleName.isEmpty()) {
            summary.addView(panel.spaced(panel.text(String.format(Strings.GOOGLE_LISTING, googleName), 13,
                    colors.secondaryText, false), 0));
        }
        Offer official = null, booking = null, cheapest = null;
        if (offers != null) {
            for (int i = 0; i < offers.length(); i++) {
                Offer o = offer(offers.optJSONObject(i));
                if (Double.isNaN(o.total)) continue;
                if (o.official && official == null) official = o;
                if (o.provider.toLowerCase(Locale.ROOT).startsWith("booking.com") && booking == null) booking = o;
                if (cheapest == null || o.total < cheapest.total) cheapest = o;
            }
        }
        String cur = hotel.currency;
        int nights = stay == null ? 1 : stay.nights();
        if (official == null) {
            status.setText(offers == null || offers.length() == 0 ? Strings.OFFICIAL_NOT_FOUND : Strings.OFFICIAL_NO_OFFER);
            if (cheapest != null) {
                summary.addView(panel.spaced(panel.text(String.format(Strings.CHEAPEST_ON_GOOGLE,
                        Panel.money(cheapest.total, cur), cheapest.provider), 14, colors.text, false), 6));
            }
            return;
        }
        status.setVisibility(View.GONE);

        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        card.addView(priceRow(Strings.OFFICIAL_SITE, official.total, nights, cur, true));
        if (!Double.isNaN(official.memberTotal)) {
            card.addView(panel.text(String.format(Strings.OFFICIAL_MEMBER, Panel.money(official.memberTotal, cur)),
                    13, colors.secondaryText, false));
        }
        if (hotel.hasPrice()) {
            card.addView(panel.spaced(priceRow(Strings.BOOKING_HERE, hotel.price, nights, cur, false), 10));
            double diff = hotel.price - official.total;
            int pct = (int) Math.round(Math.abs(diff) / Math.max(hotel.price, official.total) * 100);
            String line;
            int color;
            if (Math.abs(diff) < 1) {
                line = Strings.SAME_PRICE;
                color = colors.text;
            } else if (diff > 0) {
                line = String.format(Locale.getDefault(), Strings.OFFICIAL_CHEAPER, Panel.money(diff, cur), pct);
                color = colors.good;
            } else {
                line = String.format(Locale.getDefault(), Strings.BOOKING_CHEAPER, Panel.money(-diff, cur), pct);
                color = colors.bad;
            }
            card.addView(panel.spaced(panel.text(line, 15, color, true), 10));
        }
        if (booking != null) {
            card.addView(panel.spaced(panel.text(Strings.BOOKING_ON_GOOGLE + ": " + Panel.money(booking.total, cur),
                    13, colors.secondaryText, false), 6));
        }
        if (stay != null && stay.rooms > 1) {
            card.addView(panel.text(Strings.ONE_ROOM_NOTE, 13, colors.secondaryText, false));
        }
        summary.addView(panel.spaced(panel.card(card), 6));
        final String offerUrl = official.url;
        summary.addView(panel.spaced(panel.button(Strings.BOOK_OFFICIAL, v -> panel.openInBrowser(offerUrl)), 10));
    }

    private View priceRow(String label, double total, int nights, String cur, boolean bold) {
        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.addView(panel.text(label, 13, colors.secondaryText, false));
        box.addView(panel.text(String.format(Strings.TOTAL_PER_NIGHT, Panel.money(total, cur),
                Panel.money(total / nights, cur)), bold ? 18 : 16, colors.text, true));
        return box;
    }
}
