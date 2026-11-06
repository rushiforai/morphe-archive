package semicoloncolonel.mobilestream.extension.shared.misc;

import android.net.Uri;
import android.util.Log;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Recognizes prediction-market content (Kalshi, Polymarket, PredictIt) and
 * removes it from the lists an app builds its screens from.
 */
@SuppressWarnings("unused")
public final class PredictionMarkets {
    private static final String TAG = "MSP-MARKETS";
    private static final String[] HOSTS = {"kalshi.com", "polymarket.com", "predictit.org"};

    private PredictionMarkets() {
    }

    /** True when the URL's host is a prediction market or one of its subdomains. */
    public static boolean isPredictionMarketUrl(String url) {
        if (url == null) return false;
        try {
            String host = Uri.parse(url).getHost();
            if (host == null) return false;
            host = host.toLowerCase();
            for (String market : HOSTS) {
                if (host.equals(market) || host.endsWith("." + market)) return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    /**
     * Fox News: removes article and live-blog items whose embed (a web view or
     * iframe component) loads a prediction market. Each item's model exposes
     * the embed through getAttributes().getUrl(). Other items pass through.
     */
    public static List<?> filterFoxItems(List<?> items) {
        if (items == null || items.isEmpty()) return items;
        try {
            List<Object> out = null;
            for (int i = 0; i < items.size(); i++) {
                Object item = items.get(i);
                if (isPredictionMarketUrl(embedUrl(item))) {
                    if (out == null) out = new ArrayList<>(items.subList(0, i));
                    Log.i(TAG, "removed a prediction-market embed");
                } else if (out != null) {
                    out.add(item);
                }
            }
            return out == null ? items : out;
        } catch (Throwable t) {
            Log.e(TAG, "filter failure", t);
            return items;
        }
    }

    private static String embedUrl(Object item) {
        try {
            Object value = call(item, "getValue");
            Object attributes = call(value, "getAttributes");
            Object url = call(attributes, "getUrl");
            return url instanceof String ? (String) url : null;
        } catch (Throwable t) {
            return null;
        }
    }

    private static Object call(Object target, String name) throws Exception {
        if (target == null) return null;
        Method method = target.getClass().getMethod(name);
        return method.invoke(target);
    }
}
