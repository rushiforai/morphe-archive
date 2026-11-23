package app.jofslash.extension.booking;

import android.net.Uri;
import android.util.Base64;

import java.io.ByteArrayOutputStream;

/**
 * Links to Google Hotels and the scripts that read its pages.
 *
 * <p>Google Hotels ignores checkin/checkout query parameters. The dates, the number of adults and
 * the currency go in the "ts" parameter, a base64 protobuf:
 * <pre>
 * 1: 1
 * 2: { 1: { 1: 3 } (once per adult), 2: 0 }
 * 3: { 2: { 2: { 1: {1: year, 2: month, 3: day}, 2: {same for check-out}, 3: nights } } }
 * 5: { 1: { 7: "EUR" }, 3: {} }
 * </pre>
 * Checked by opening the links on a phone: the page shows the dates, guests and currency.
 */
final class GoogleHotels {
    private GoogleHotels() {
    }

    /**
     * Google Hotels search for the hotel, on the stay's dates, in the given currency. With
     * hotelWord, " hotel" is added: Google reads some names plus a city as a place and finds no
     * hotels.
     */
    static String searchUrl(String hotelName, String city, Stay stay, String currency, boolean hotelWord) {
        Uri.Builder b = Uri.parse("https://www.google.com/travel/search").buildUpon()
                .appendQueryParameter("q", query(hotelName, city) + (hotelWord ? " hotel" : ""));
        if (stay != null) b.appendQueryParameter("ts", ts(stay, currency));
        // English page, so the scripts below can find "Official Site".
        b.appendQueryParameter("hl", "en");
        // No "gl": Google uses the user's own region, so prices and taxes are the local ones.
        return b.build().toString();
    }

    /**
     * The same hotel page as seen from the US region. Google shows its "DEAL, 19% less than
     * usual" judgment only to some regions, not to the EU; this page is read only for that
     * judgment, never for prices.
     */
    static String usRegionUrl(String pageUrl) {
        Uri u = Uri.parse(pageUrl);
        Uri.Builder b = u.buildUpon().clearQuery();
        for (String name : u.getQueryParameterNames()) {
            if (name.equals("gl")) continue;
            for (String value : u.getQueryParameters(name)) b.appendQueryParameter(name, value);
        }
        return b.appendQueryParameter("gl", "us").build().toString();
    }

    /**
     * Plain Google web search for the hotel. When Google Hotels' own search finds nothing for a
     * hotel (it sometimes answers "No results" for a hotel's exact name), the web results still
     * have the hotel's panel, with links to its Google Hotels page.
     */
    static String webSearchUrl(String hotelName, String city) {
        return Uri.parse("https://www.google.com/search").buildUpon()
                .appendQueryParameter("q", query(hotelName, city))
                .appendQueryParameter("hl", "en")
                .build().toString();
    }

    static boolean isWebSearchPage(String url) {
        return url != null && Uri.parse(url).getPath() != null && Uri.parse(url).getPath().equals("/search");
    }

    /** Finds the hotel panel's link to Google Hotels on a web search page. Returns the entity id or null. */
    static String entityFromWebSearchScript() {
        // The panel's links are often built by scripts, so look in the whole page source.
        return "(function(){var m=document.documentElement.innerHTML"
                + ".match(/\\/travel\\/hotels\\/(?:[^\\/\"'<>\\s]+\\/)?entity\\/([A-Za-z0-9_-]{8,})/);"
                + "return m?m[1]:null;})()";
    }

    /** The prices page of a Google Hotels entity, for the stay and currency. */
    static String entityPricesUrl(String entityId, Stay stay, String currency) {
        Uri.Builder b = Uri.parse("https://www.google.com/travel/hotels/entity/" + entityId + "/prices").buildUpon();
        if (stay != null) b.appendQueryParameter("ts", ts(stay, currency));
        return b.appendQueryParameter("hl", "en").build().toString();
    }

    /** Plain Google search for the hotel's own website. */
    static String websiteSearchUrl(String hotelName, String city) {
        return Uri.parse("https://www.google.com/search").buildUpon()
                .appendQueryParameter("q", query(hotelName, city) + Strings.WEBSITE_QUERY_SUFFIX)
                .build().toString();
    }

    /**
     * The hotel's name without what some listings add after it, such as
     * "4friends BnB Apartments Vienna, near Schönbrunn Palace, Stadthalle &amp; U3 Metro".
     * Google finds nothing for the long form.
     */
    static String shortName(String hotelName) {
        if (hotelName == null) return "";
        String name = hotelName.trim();
        for (String cut : new String[]{", ", " - ", " – ", " | ", " (", " near "}) {
            int at = name.indexOf(cut);
            if (at >= 3) name = name.substring(0, at).trim();
        }
        return name;
    }

    private static String query(String hotelName, String city) {
        String q = shortName(hotelName);
        if (city != null && !city.trim().isEmpty() && !q.toLowerCase().contains(city.trim().toLowerCase())) {
            q += " " + city.trim();
        }
        return q;
    }

    static String ts(Stay stay, String currency) {
        int[] in = Stay.parts(stay.checkIn);
        int[] out = Stay.parts(stay.checkOut);
        ByteArrayOutputStream adults = new ByteArrayOutputStream();
        for (int i = 0; i < Math.max(1, stay.adults); i++) msg(adults, 1, varintField(1, 3));
        varint(adults, 2 << 3);
        varint(adults, 0);

        ByteArrayOutputStream dates = new ByteArrayOutputStream();
        msg(dates, 1, date(in));
        msg(dates, 2, date(out));
        varint(dates, 3 << 3);
        varint(dates, stay.nights());

        ByteArrayOutputStream m = new ByteArrayOutputStream();
        varint(m, 1 << 3);
        varint(m, 1);
        msg(m, 2, adults.toByteArray());
        msg(m, 3, wrap(2, wrap(2, dates.toByteArray())));
        if (currency != null && currency.matches("[A-Z]{3}")) {
            ByteArrayOutputStream cur = new ByteArrayOutputStream();
            ByteArrayOutputStream code = new ByteArrayOutputStream();
            msg(code, 7, currency.getBytes());
            msg(cur, 1, code.toByteArray());
            msg(cur, 3, new byte[0]);
            msg(m, 5, cur.toByteArray());
        }
        return Base64.encodeToString(m.toByteArray(), Base64.URL_SAFE | Base64.NO_PADDING | Base64.NO_WRAP);
    }

    private static byte[] date(int[] ymd) {
        ByteArrayOutputStream o = new ByteArrayOutputStream();
        for (int i = 0; i < 3; i++) {
            varint(o, (i + 1) << 3);
            varint(o, ymd[i]);
        }
        return o.toByteArray();
    }

    private static byte[] varintField(int field, int value) {
        ByteArrayOutputStream o = new ByteArrayOutputStream();
        varint(o, field << 3);
        varint(o, value);
        return o.toByteArray();
    }

    private static byte[] wrap(int field, byte[] inner) {
        ByteArrayOutputStream o = new ByteArrayOutputStream();
        msg(o, field, inner);
        return o.toByteArray();
    }

    private static void msg(ByteArrayOutputStream o, int field, byte[] body) {
        varint(o, field << 3 | 2);
        varint(o, body.length);
        o.write(body, 0, body.length);
    }

    private static void varint(ByteArrayOutputStream o, int v) {
        while ((v & ~0x7F) != 0) {
            o.write((v & 0x7F) | 0x80);
            v >>>= 7;
        }
        o.write(v);
    }

    /** What the page is, as the scripts see it. */
    static boolean isEntityPage(String url) {
        return url != null && url.contains("/travel/hotels/entity/");
    }

    static boolean isPricesPage(String url) {
        return isEntityPage(url) && Uri.parse(url).getPath() != null && Uri.parse(url).getPath().endsWith("/prices");
    }

    static boolean isResultsPage(String url) {
        if (url == null || isEntityPage(url)) return false;
        String path = Uri.parse(url).getPath();
        return path != null && (path.startsWith("/travel/hotels") || path.startsWith("/travel/search"));
    }

    static boolean isBlockedPage(String url) {
        return url != null && (url.contains("consent.google.") || url.contains("/sorry/"));
    }

    /** The prices tab of an entity page. */
    static String pricesUrl(String entityUrl) {
        Uri u = Uri.parse(entityUrl);
        String path = u.getPath();
        if (path == null || path.endsWith("/prices")) return entityUrl;
        int at = path.indexOf("/entity/");
        int end = path.indexOf('/', at + "/entity/".length());
        String base = end < 0 ? path : path.substring(0, end);
        return u.buildUpon().path(base + "/prices").build().toString();
    }

    /**
     * Finds the result whose name matches the hotel best. Returns JSON:
     * {"url": "...", "name": "...", "score": 0.67} or {"url": null}.
     */
    static String findHotelScript(String hotelName, String city) {
        // Score: matching words / (words of the hotel's name + extra words in the result's name),
        // so "ibis Wien Messe" doesn't pick "ibis budget Wien Messe". The city and filler words
        // don't count as extra: Google says "Hotel Sacher Vienna" where Booking.com says
        // "Hotel Sacher Wien".
        return "(function(want,city){"
                + "function norm(s){return (s||'').toLowerCase().normalize('NFD').replace(/[\\u0300-\\u036f]/g,'')"
                + ".replace(/[^a-z0-9]+/g,' ').trim();}"
                + "function words(s){return norm(s).split(' ').filter(function(x){return x.length>1;});}"
                + "var w=words(want),skip=words(city+' hotel the by and of');"
                + "var best=null,score=0;"
                + "document.querySelectorAll('a[href*=\"/travel/hotels/entity/\"]').forEach(function(a){"
                + "var r=words((a.innerText||'').split('\\n')[0]);if(!r.length)return;var hit=0,extra=0;"
                + "w.forEach(function(x){if(r.indexOf(x)>=0)hit++;});"
                + "r.forEach(function(x){if(w.indexOf(x)<0&&skip.indexOf(x)<0)extra++;});"
                + "var s=w.length?hit/(w.length+extra):0;"
                + "if(s>score){score=s;best=a;}});"
                + "var none=!best&&/No results/.test(document.body?document.body.innerText:'');"
                + "return JSON.stringify({url:best&&score>=0.5?best.href:null,noResults:none,"
                + "name:best?(best.innerText||'').split('\\n')[0]:null,score:score});"
                + "})(" + jsString(shortName(hotelName)) + "," + jsString(city) + ")";
    }

    /**
     * Reads the offers on the prices tab. Each offer is a link to /travel/lodging/clk; inside it
     * the provider's name comes first, then the prices, each in its own element: the nightly price
     * a few times and the stay total, once for the normal rate and again for a member rate.
     * Returns JSON: {"offers": [{"provider", "official", "member", "prices": [..], "url"}]}.
     */
    static String readOffersScript() {
        return "(function(){"
                + "function num(s){s=s.replace(/[^\\d.,]/g,'');if(!s)return NaN;"
                + "var c=s.lastIndexOf(','),d=s.lastIndexOf('.'),sep=Math.max(c,d);"
                + "if(sep>=0&&s.length-sep-1!==3){return parseFloat(s.slice(0,sep).replace(/[.,]/g,'')+'.'+s.slice(sep+1));}"
                + "return parseFloat(s.replace(/[.,]/g,''));}"
                + "var priceRe=/^[^\\d]{0,4}\\s?\\d[\\d.,\\s\\u00a0\\u202f]*\\s?[^\\d\\s]{0,4}$/;"
                + "var seen={},offers=[];"
                + "document.querySelectorAll('a[href*=\"/travel/lodging/clk\"]').forEach(function(a){"
                + "var label=a.getAttribute('aria-label')||'';if(/view details/i.test(label))return;"
                + "var leaves=[];a.querySelectorAll('*').forEach(function(e){if(e.children.length===0){"
                + "var t=(e.textContent||'').trim();if(t)leaves.push(t);}});"
                + "if(!leaves.length)return;var provider=leaves[0];var prices=[];"
                + "leaves.forEach(function(t){if(/[^\\d\\s.,]/.test(t)&&priceRe.test(t)){var v=num(t);if(v>0)prices.push(v);}});"
                + "if(!prices.length||seen[provider])return;seen[provider]=1;"
                + "var text=a.textContent||'';"
                + "offers.push({provider:provider,official:/official site/i.test(text),"
                + "member:/member/i.test(text),prices:prices,url:a.href});});"
                + "var title=document.querySelector('h1');"
                + SIGNAL_JS
                + "return JSON.stringify({offers:offers,title:title?title.textContent.trim():null,signal:signal});"
                + "})()";
    }

    /**
     * Google's own judgment of the price against the hotel's usual prices, when the page shows
     * one. Google compares with the hotel's prices over about the past year and, only for some
     * hotels and regions, shows it at the top of the hotel's page: a "DEAL" or "GREAT DEAL" chip
     * with "54% less than usual", in the aria-label of the header button ("$114 for dates
     * Dec 10 – 12, GREAT DEAL 54% less than usual") and as text. Similar hotels further down
     * have their own chips, so only elements above the first offer that aren't links to another
     * hotel count. Sets `signal` to {deal: "GREAT DEAL" or null, text: "54% less than usual" or
     * "prices are currently high"}, or null when the page shows nothing.
     */
    private static final String SIGNAL_JS = ""
            + "var signal=null;"
            + "var first=document.querySelector('a[href*=\"/travel/lodging/clk\"]');"
            + "var own=function(e){if(!e||e.closest('a[href*=\"/entity/\"]'))return false;"
            + "return !first||!!(e.compareDocumentPosition(first)&Node.DOCUMENT_POSITION_FOLLOWING);};"
            + "var usual=/(\\d+\\s?%|[^\\d\\s]{0,4}\\s?\\d[\\d.,]*\\s?[^\\d\\s]{0,4})\\s+(less|more|lower|higher|cheaper) than usual/i;"
            + "var level=/prices? (are|is) (currently |usually |typically )?(unusually )?(low|typical|high)/i;"
            + "var dealRe=/GREAT DEAL|\\bDEAL\\b/i;"
            + "var found=null;"
            + "var labelled=document.querySelectorAll('[aria-label]');"
            + "for(var i=0;i<labelled.length&&!found;i++){var a=labelled[i].getAttribute('aria-label')||'';"
            + "if((usual.test(a)||level.test(a))&&own(labelled[i]))found=a;}"
            + "var deal=null;"
            + "var walker=document.createTreeWalker(document.body,NodeFilter.SHOW_TEXT);var n;"
            + "while((n=walker.nextNode())){var t=n.textContent.trim();if(!t||t.length>120)continue;"
            + "if(!own(n.parentElement))continue;"
            + "if(!found&&(usual.test(t)||level.test(t)))found=t;"
            + "if(!deal&&/^(GREAT )?DEAL$/i.test(t))deal=t;}"
            + "if(found){var d=found.match(dealRe);if(d)deal=d[0];}"
            + "if(found||deal){var rest=found?found.replace(/GREAT DEAL|\\bDEAL\\b/ig,' '):'';"
            + "var m=found?(rest.match(usual)||rest.match(level)):null;"
            + "signal={deal:deal,text:m?m[0]:null};}";

    /** Clicks "View more options" under the offers. Returns true when it found the button. */
    static String showMoreOffersScript() {
        return "(function(){var els=Array.from(document.querySelectorAll('[role=button],button,span'))"
                + ".filter(function(e){return /^View more options/.test((e.textContent||'').trim())&&e.children.length<4;});"
                + "if(!els.length)return false;els[els.length-1].click();return true;})()";
    }

    private static String jsString(String s) {
        if (s == null) return "''";
        StringBuilder b = new StringBuilder("'");
        for (char c : s.toCharArray()) {
            if (c == '\'' || c == '\\') b.append('\\').append(c);
            else if (c < 0x20 || c == 0x2028 || c == 0x2029) b.append(String.format("\\u%04x", (int) c));
            else b.append(c);
        }
        return b.append('\'').toString();
    }
}
