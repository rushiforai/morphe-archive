package app.danielthemaniel.patches.campfire.extension;

import android.util.Log;
import android.webkit.WebResourceResponse;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Skips Campfire's "you're leaving Campfire" confirmation for external links.
 *
 * Links rendered with externalLinkShowsConfirmation call the link-confirm provider's
 *   this.onClickUrl = e => { let t = m(e); this.setState({url: t, isConfirmOpenLinkOpen: !0}) }
 * whose dialog's CONTINUE button is a plain <a href={url} target="_blank" rel="noopener noreferrer">.
 * The rewrite makes onClickUrl click such a link right away (still inside the user's tap), so
 * the URL takes exactly the path CONTINUE would have. Rewritten at serve time, so OTA web
 * bundles are covered too.
 */
@SuppressWarnings("unused")
public final class ExternalLinks {
    private static final String TAG = "CampfireExternalLinks";

    private ExternalLinks() {}

    private static final String MARKER = "isConfirmOpenLinkOpen";

    /** this.onClickUrl=e=>{let t=m(e);this.setState({url:t,isConfirmOpenLinkOpen:!0})} */
    private static final Pattern ON_CLICK_URL = Pattern.compile(
        "(this\\.onClickUrl=([\\w$]+)=>\\{let ([\\w$]+)=[\\w$]+\\(\\2\\);)"
            + "this\\.setState\\(\\{url:\\3,isConfirmOpenLinkOpen:!0\\}\\)\\}");

    public static String rewriteJs(String js) {
        if (js.indexOf(MARKER) == -1 || js.contains("morphe-skip-link-confirm")) return js;
        Matcher m = ON_CLICK_URL.matcher(js);
        StringBuffer sb = new StringBuffer(js.length() + 512);
        int n = 0;
        while (m.find()) {
            String url = m.group(3);
            String open = "try{var a=document.createElement(\"a\");a.href=" + url
                + ";a.target=\"_blank\";a.rel=\"noopener noreferrer\";a.dataset.morphe=\"morphe-skip-link-confirm\";"
                + "document.body.appendChild(a);a.click();a.remove()}"
                + "catch(err){this.setState({url:" + url + ",isConfirmOpenLinkOpen:!0})}}";
            m.appendReplacement(sb, Matcher.quoteReplacement(m.group(1) + open));
            n++;
        }
        m.appendTail(sb);
        if (n == 0) Log.w(TAG, "Link confirmation found but not in the expected shape");
        return n == 0 ? js : sb.toString();
    }

    /** Called on every return of WebViewLocalServer.handleLocalRequest(). Never throws. */
    public static WebResourceResponse filterResponse(WebResourceResponse response) {
        if (response == null) return null;
        String mime = response.getMimeType();
        if (mime == null || !mime.contains("javascript")) return response;

        byte[] original = null;
        try {
            InputStream in = response.getData();
            if (in == null) return response;
            original = readAll(in);
            String js = new String(original, StandardCharsets.UTF_8);
            String patched = rewriteJs(js);
            response.setData(new ByteArrayInputStream(
                patched == js ? original : patched.getBytes(StandardCharsets.UTF_8)));
        } catch (Throwable t) {
            Log.e(TAG, "Failed to patch link confirmation", t);
            if (original != null) response.setData(new ByteArrayInputStream(original));
        }
        return response;
    }

    private static byte[] readAll(InputStream in) throws java.io.IOException {
        try (InputStream input = in) {
            ByteArrayOutputStream out = new ByteArrayOutputStream(256 * 1024);
            byte[] buffer = new byte[32 * 1024];
            int n;
            while ((n = input.read(buffer)) != -1) out.write(buffer, 0, n);
            return out.toByteArray();
        }
    }
}
