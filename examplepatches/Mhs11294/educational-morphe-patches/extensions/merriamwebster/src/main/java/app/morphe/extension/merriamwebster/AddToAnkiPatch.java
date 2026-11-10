package app.morphe.extension.merriamwebster;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

@SuppressWarnings("unused")
public final class AddToAnkiPatch {
    private static final String ANKI_URL = "x-mw://anki/";
    private static final String ANKI_PACKAGE = "com.ichi2.anki";

    // Each entry header has its own favorite/share bar; the Anki button goes in front of share.
    private static final String SHARE_LINK = "<a class='share' href='x-mw://share'>";

    // White circle-outline icon to match the white headword on the teal entry header.
    private static final String ICON = "data:image/svg+xml;base64,"
            + "PHN2ZyB4bWxucz0naHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmcnIHZpZXdCb3g9JzAgMCAzMiAzMicgZmlsbD0nbm9uZScgc3Ryb2tlPScjZmZmZmZmJyBzdHJva2Utd2lkdGg9JzEuNCcgc3Ryb2tlLWxpbmVjYXA9J3JvdW5kJz48Y2lyY2xlIGN4PScxNicgY3k9JzE2JyByPScxNScvPjxyZWN0IHg9JzkuNScgeT0nMTAnIHdpZHRoPScxMycgaGVpZ2h0PScxMicgcng9JzEuNScvPjxwYXRoIGQ9J00xNiAxM3Y2TTEzIDE2aDYnLz48L3N2Zz4K";

    // Returns {"w": headword, "p": [{"fl": "noun", "d": ["def", ...]}, ...]} for the entry holding button n.
    private static final String EXTRACT_JS = "(function(n){"
            + "var a=document.querySelectorAll('a.anki')[n];if(!a)return null;"
            + "var e=a.closest('.entry')||document.body;"
            + "function t(x){return x?x.textContent.replace(/\\u200b/g,'').replace(/\\s+/g,' ').trim():'';}"
            + "var ps=e.querySelectorAll('.pos');if(!ps.length)ps=[e];var out=[];"
            + "for(var i=0;i<ps.length;i++){var p=ps[i];"
            + "var d=[].map.call(p.querySelectorAll('.sdef li'),t).filter(Boolean);"
            + "if(!d.length)d=[].map.call(p.querySelectorAll('.dt'),function(x){return t(x).replace(/^:\\s*/,'');}).filter(Boolean);"
            + "if(d.length)out.push({fl:t(p.querySelector('.fl')),d:d});}"
            + "return {w:t(e.querySelector('.hw strong')),p:out};"
            + "})(%s)";

    /** Called on the definition HTML just before it is loaded into the WebView. */
    public static String addButtons(String html) {
        if (html == null) return null;
        StringBuilder out = new StringBuilder(html.length() + 1024);
        int from = 0, n = 0, i;
        while ((i = html.indexOf(SHARE_LINK, from)) >= 0) {
            out.append(html, from, i)
                    .append("<a class='anki' href='").append(ANKI_URL).append(n++)
                    .append("' aria-label='Add to Anki' role='button' style=\"background:url(")
                    .append(ICON).append(") center/cover no-repeat;text-decoration:none\">&#160;</a>");
            from = i + SHARE_LINK.length();
            out.append(SHARE_LINK);
        }
        return out.append(html, from, html.length()).toString();
    }

    /**
     * Called first in both WebViewClient.shouldOverrideUrlLoading overloads.
     * @param request A WebResourceRequest or a String url.
     * @return true if the url was ours and has been handled.
     */
    public static boolean onUrl(WebView view, Object request) {
        String url = String.valueOf(request instanceof WebResourceRequest
                ? ((WebResourceRequest) request).getUrl() : request);
        if (!url.startsWith(ANKI_URL)) return false;

        String index = url.substring(ANKI_URL.length());
        if (index.matches("\\d{1,4}")) {
            view.evaluateJavascript(String.format(EXTRACT_JS, index),
                    json -> sendToAnki(view.getContext(), json));
        }
        return true;
    }

    private static void sendToAnki(Context context, String json) {
        String word, back;
        try {
            JSONObject entry = new JSONObject(json);
            word = entry.getString("w");
            back = formatBack(entry.getJSONArray("p"));
        } catch (Exception e) { // "null" or unexpected page layout
            Toast.makeText(context, "Couldn't read this definition", Toast.LENGTH_SHORT).show();
            return;
        }

        Intent intent = new Intent(Intent.ACTION_SEND)
                .setPackage(ANKI_PACKAGE)
                .setType("text/plain")
                .putExtra(Intent.EXTRA_SUBJECT, word) // AnkiDroid: front field
                .putExtra(Intent.EXTRA_TEXT, back);   // AnkiDroid: back field
        if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            context.startActivity(intent);
        } catch (ActivityNotFoundException e) {
            Toast.makeText(context, "AnkiDroid is not installed", Toast.LENGTH_SHORT).show();
        }
    }

    /** "noun\n1. first\n2. second\n\nadjective\n1. ..." (AnkiDroid turns newlines into line breaks). */
    static String formatBack(JSONArray parts) throws Exception {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < parts.length(); i++) {
            JSONObject part = parts.getJSONObject(i);
            JSONArray defs = part.getJSONArray("d");
            if (sb.length() > 0) sb.append("\n\n");
            String fl = part.optString("fl");
            if (!fl.isEmpty()) sb.append(fl).append('\n');
            for (int j = 0; j < defs.length(); j++) {
                if (j > 0) sb.append('\n');
                if (defs.length() > 1) sb.append(j + 1).append(". ");
                sb.append(defs.getString(j));
            }
        }
        return sb.toString();
    }
}
