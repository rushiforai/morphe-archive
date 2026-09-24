package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.net.Uri;

import java.util.ArrayList;
import java.util.List;

/**
 * Compatibility utilities for caption-source identity and URL handling.
 *
 * <p>The former Java semantic sentence planner was deliberately removed from the runtime path.
 * {@link #loadSource(Context, String)} now returns the untouched YouTube cue timeline through
 * {@link RawCaptionSource}.</p>
 */
final class CaptionEngine {
    private CaptionEngine() {}

    static Source loadSource(Context context, String translatedUrl) throws Exception {
        RawCaptionSource.Source raw = RawCaptionSource.load(context, translatedUrl);
        return new Source(raw.body, raw.contentType, raw.sourceUrl, raw.document);
    }

    static String requestKey(Context context, String translatedUrl) {
        try {
            DeepSeekConfig.Snapshot config = DeepSeekConfig.load(context);
            TargetLanguage target = TargetLanguage.fromUrl(translatedUrl);
            String configuration = config.baseUrl + '\n' + config.fingerprint() + '\n' +
                    Integer.toHexString(config.apiKey.hashCode()) + '\n' +
                    (target == null ? "" : target.code);
            return SourceCaptionCache.key(sourceCaptionUrl(translatedUrl)) + '|' +
                    Integer.toHexString(configuration.hashCode());
        } catch (Throwable ignored) {
            return translatedUrl == null ? "" : translatedUrl;
        }
    }

    static String sourceCaptionUrl(String translatedUrl) {
        if (translatedUrl == null) return null;
        int fragmentIndex = translatedUrl.indexOf('#');
        String fragment = fragmentIndex >= 0 ? translatedUrl.substring(fragmentIndex) : "";
        String withoutFragment = fragmentIndex >= 0
                ? translatedUrl.substring(0, fragmentIndex)
                : translatedUrl;

        int queryStart = withoutFragment.indexOf('?');
        if (queryStart < 0 || queryStart == withoutFragment.length() - 1) {
            return withoutFragment + fragment;
        }

        String prefix = withoutFragment.substring(0, queryStart);
        String rawQuery = withoutFragment.substring(queryStart + 1);
        String[] parts = rawQuery.split("&", -1);
        List<String> kept = new ArrayList<>(parts.length);
        for (String part : parts) {
            if (part.isEmpty()) continue;
            int equals = part.indexOf('=');
            String rawKey = equals < 0 ? part : part.substring(0, equals);
            String decodedKey;
            try {
                decodedKey = Uri.decode(rawKey);
            } catch (Throwable ignored) {
                decodedKey = rawKey;
            }
            if ("tlang".equalsIgnoreCase(decodedKey)) continue;
            kept.add(part);
        }
        return prefix + (kept.isEmpty() ? "" : "?" + String.join("&", kept)) + fragment;
    }

    static final class Source {
        final byte[] body;
        final String contentType;
        final String sourceUrl;
        final CaptionDocument.Parsed document;

        Source(byte[] body, String contentType, String sourceUrl, CaptionDocument.Parsed document) {
            this.body = body;
            this.contentType = contentType;
            this.sourceUrl = sourceUrl;
            this.document = document;
        }
    }
}
