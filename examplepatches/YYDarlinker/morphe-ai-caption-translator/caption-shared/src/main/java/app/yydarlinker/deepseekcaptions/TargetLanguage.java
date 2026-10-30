package app.yydarlinker.deepseekcaptions;

import android.net.Uri;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/** Target language selected from YouTube's Auto-translate menu. */
final class TargetLanguage {
    static final TargetLanguage SIMPLIFIED_CHINESE = new TargetLanguage("zh-Hans", "简体中文");

    /** Chinese names shown to the model, by lower-case language code. */
    private static final Map<String, String> CHINESE_NAMES = new HashMap<>();

    static {
        for (String entry :
                new String[] {
                    "af=南非荷兰语",
                    "ar=阿拉伯语",
                    "bg=保加利亚语",
                    "bn=孟加拉语",
                    "ca=加泰罗尼亚语",
                    "cs=捷克语",
                    "da=丹麦语",
                    "de=德语",
                    "el=希腊语",
                    "en=英语",
                    "es=西班牙语",
                    "et=爱沙尼亚语",
                    "fa=波斯语",
                    "fi=芬兰语",
                    "fil=菲律宾语",
                    "fr=法语",
                    "he=希伯来语",
                    "hi=印地语",
                    "hr=克罗地亚语",
                    "hu=匈牙利语",
                    "id=印度尼西亚语",
                    "it=意大利语",
                    "ja=日语",
                    "ko=韩语",
                    "lt=立陶宛语",
                    "lv=拉脱维亚语",
                    "ms=马来语",
                    "nl=荷兰语",
                    "no=挪威语",
                    "pl=波兰语",
                    "pt=葡萄牙语",
                    "ro=罗马尼亚语",
                    "ru=俄语",
                    "sk=斯洛伐克语",
                    "sl=斯洛文尼亚语",
                    "sr=塞尔维亚语",
                    "sv=瑞典语",
                    "sw=斯瓦希里语",
                    "ta=泰米尔语",
                    "te=泰卢固语",
                    "th=泰语",
                    "tr=土耳其语",
                    "uk=乌克兰语",
                    "ur=乌尔都语",
                    "vi=越南语",
                    "zh=中文",
                    "zh-hans=简体中文",
                    "zh-cn=简体中文",
                    "zh-sg=简体中文",
                    "zh-hant=繁体中文",
                    "zh-tw=繁体中文",
                    "zh-hk=繁体中文"
                }) {
            int eq = entry.indexOf('=');
            CHINESE_NAMES.put(entry.substring(0, eq), entry.substring(eq + 1));
        }
    }

    final String code;
    final String displayName;

    private TargetLanguage(String code, String displayName) {
        this.code = code;
        this.displayName = displayName;
    }

    static TargetLanguage fromUrl(String url) {
        if (!CaptionUrls.isTimedText(url)) return null;
        String target = null;
        try {
            target = Uri.parse(url).getQueryParameter("tlang");
        } catch (Throwable ignored) {
            // A URL Uri cannot parse names no target.
        }
        if (target == null || target.trim().isEmpty()) return null;
        return fromCode(target);
    }

    static TargetLanguage fromCode(String rawCode) {
        String code = normalize(rawCode);
        // No target is not Simplified Chinese. Returning a target here silently turns every empty
        // or unknown code into zh-Hans on prewarm, handoff and diagnostic paths.
        if (code.isEmpty()) return null;
        String lower = code.toLowerCase(Locale.ROOT);
        String name = CHINESE_NAMES.get(lower);
        if (name == null) name = CHINESE_NAMES.get(primary(lower));
        if (name == null)
            name = Locale.forLanguageTag(code).getDisplayName(Locale.SIMPLIFIED_CHINESE).trim();
        return new TargetLanguage(code, name.isEmpty() ? code : name);
    }

    String promptLabel() {
        return displayName + "（语言代码 " + code + "）";
    }

    /** Adds or replaces only the Timed Text target-language query item. */
    static String withCode(String url, String rawCode) {
        if (url == null) return null;
        TargetLanguage requested = fromCode(rawCode);
        if (requested == null) return url;
        String code = requested.code;
        int fragmentIndex = url.indexOf('#');
        String fragment = fragmentIndex >= 0 ? url.substring(fragmentIndex) : "";
        String main = fragmentIndex >= 0 ? url.substring(0, fragmentIndex) : url;
        int queryIndex = main.indexOf('?');
        String prefix = queryIndex < 0 ? main + '?' : main.substring(0, queryIndex + 1);
        String rawQuery = queryIndex < 0 ? "" : main.substring(queryIndex + 1);

        String[] parts = rawQuery.split("&", -1);
        boolean changed = false;
        StringBuilder query = new StringBuilder();
        for (String part : parts) {
            if (part.isEmpty()) continue;
            if (query.length() > 0) query.append('&');
            int equals = part.indexOf('=');
            String rawKey = equals < 0 ? part : part.substring(0, equals);
            String decodedKey;
            try {
                decodedKey = Uri.decode(rawKey);
            } catch (Throwable ignored) {
                decodedKey = rawKey;
            }
            if ("tlang".equalsIgnoreCase(decodedKey)) {
                query.append(rawKey).append('=').append(Uri.encode(code));
                changed = true;
            } else {
                query.append(part);
            }
        }
        if (!changed) {
            if (query.length() > 0) query.append('&');
            query.append("tlang=").append(Uri.encode(code));
        }
        return prefix + query + fragment;
    }

    private static String normalize(String value) {
        if (value == null) return "";
        String trimmed = value.trim().replace('_', '-');
        if (trimmed.isEmpty()) return "";
        String lower = trimmed.toLowerCase(Locale.ROOT);
        if ("iw".equals(lower)) return "he";
        if ("in".equals(lower)) return "id";
        if ("ji".equals(lower)) return "yi";
        if (lower.equals("zh-hans") || lower.equals("zh-cn") || lower.equals("zh-sg"))
            return "zh-Hans";
        if (lower.equals("zh-hant") || lower.equals("zh-tw") || lower.equals("zh-hk"))
            return "zh-Hant";
        return trimmed;
    }

    private static String primary(String code) {
        int separator = code.indexOf('-');
        return separator < 0 ? code : code.substring(0, separator);
    }
}
