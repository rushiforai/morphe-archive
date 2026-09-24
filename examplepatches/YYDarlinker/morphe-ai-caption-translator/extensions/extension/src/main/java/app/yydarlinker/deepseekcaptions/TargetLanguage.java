package app.yydarlinker.deepseekcaptions;

import android.net.Uri;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/** Target language selected from YouTube's Auto-translate menu. */
final class TargetLanguage {
    static final TargetLanguage SIMPLIFIED_CHINESE =
            new TargetLanguage("zh-Hans", "简体中文");

    private static final Map<String, String> CHINESE_NAMES = new HashMap<>();

    static {
        CHINESE_NAMES.put("af", "南非荷兰语");
        CHINESE_NAMES.put("ar", "阿拉伯语");
        CHINESE_NAMES.put("bg", "保加利亚语");
        CHINESE_NAMES.put("bn", "孟加拉语");
        CHINESE_NAMES.put("ca", "加泰罗尼亚语");
        CHINESE_NAMES.put("cs", "捷克语");
        CHINESE_NAMES.put("da", "丹麦语");
        CHINESE_NAMES.put("de", "德语");
        CHINESE_NAMES.put("el", "希腊语");
        CHINESE_NAMES.put("en", "英语");
        CHINESE_NAMES.put("es", "西班牙语");
        CHINESE_NAMES.put("et", "爱沙尼亚语");
        CHINESE_NAMES.put("fa", "波斯语");
        CHINESE_NAMES.put("fi", "芬兰语");
        CHINESE_NAMES.put("fil", "菲律宾语");
        CHINESE_NAMES.put("fr", "法语");
        CHINESE_NAMES.put("he", "希伯来语");
        CHINESE_NAMES.put("hi", "印地语");
        CHINESE_NAMES.put("hr", "克罗地亚语");
        CHINESE_NAMES.put("hu", "匈牙利语");
        CHINESE_NAMES.put("id", "印度尼西亚语");
        CHINESE_NAMES.put("it", "意大利语");
        CHINESE_NAMES.put("ja", "日语");
        CHINESE_NAMES.put("ko", "韩语");
        CHINESE_NAMES.put("lt", "立陶宛语");
        CHINESE_NAMES.put("lv", "拉脱维亚语");
        CHINESE_NAMES.put("ms", "马来语");
        CHINESE_NAMES.put("nl", "荷兰语");
        CHINESE_NAMES.put("no", "挪威语");
        CHINESE_NAMES.put("pl", "波兰语");
        CHINESE_NAMES.put("pt", "葡萄牙语");
        CHINESE_NAMES.put("ro", "罗马尼亚语");
        CHINESE_NAMES.put("ru", "俄语");
        CHINESE_NAMES.put("sk", "斯洛伐克语");
        CHINESE_NAMES.put("sl", "斯洛文尼亚语");
        CHINESE_NAMES.put("sr", "塞尔维亚语");
        CHINESE_NAMES.put("sv", "瑞典语");
        CHINESE_NAMES.put("sw", "斯瓦希里语");
        CHINESE_NAMES.put("ta", "泰米尔语");
        CHINESE_NAMES.put("te", "泰卢固语");
        CHINESE_NAMES.put("th", "泰语");
        CHINESE_NAMES.put("tr", "土耳其语");
        CHINESE_NAMES.put("uk", "乌克兰语");
        CHINESE_NAMES.put("ur", "乌尔都语");
        CHINESE_NAMES.put("vi", "越南语");
        CHINESE_NAMES.put("zh", "中文");
        CHINESE_NAMES.put("zh-hans", "简体中文");
        CHINESE_NAMES.put("zh-cn", "简体中文");
        CHINESE_NAMES.put("zh-sg", "简体中文");
        CHINESE_NAMES.put("zh-hant", "繁体中文");
        CHINESE_NAMES.put("zh-tw", "繁体中文");
        CHINESE_NAMES.put("zh-hk", "繁体中文");
    }

    final String code;
    final String displayName;

    private TargetLanguage(String code, String displayName) {
        this.code = code;
        this.displayName = displayName;
    }

    static TargetLanguage fromUrl(String url) {
        if (!DeepSeekCaptionHook.isYouTubeTimedTextUrl(url)) return null;
        String target = null;
        try {
            target = Uri.parse(url).getQueryParameter("tlang");
        } catch (Throwable ignored) {
        }
        if (target == null || target.trim().isEmpty()) return null;
        return fromCode(target);
    }

    static TargetLanguage fromCode(String rawCode) {
        String code = normalize(rawCode);
        if (code.isEmpty()) return SIMPLIFIED_CHINESE;
        String lower = code.toLowerCase(Locale.ROOT);
        String name = CHINESE_NAMES.get(lower);
        if (name == null) name = CHINESE_NAMES.get(primary(lower));
        if (name == null || name.trim().isEmpty()) {
            try {
                Locale locale = Locale.forLanguageTag(toModernTag(code));
                name = locale.getDisplayName(Locale.SIMPLIFIED_CHINESE);
            } catch (Throwable ignored) {
                name = "";
            }
        }
        if (name == null || name.trim().isEmpty()) name = code;
        return new TargetLanguage(code, name.trim());
    }

    String promptLabel() {
        return displayName + "（语言代码 " + code + "）";
    }

    /** Adds or replaces only the Timed Text target-language query item. */
    static String withCode(String url, String rawCode) {
        if (url == null) return null;
        String code = fromCode(rawCode).code;
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
        if ("zh-hans".equals(lower) || "zh-cn".equals(lower) || "zh-sg".equals(lower)) {
            return "zh-Hans";
        }
        if ("zh-hant".equals(lower) || "zh-tw".equals(lower) || "zh-hk".equals(lower)) {
            return "zh-Hant";
        }
        return trimmed;
    }

    private static String primary(String code) {
        int separator = code.indexOf('-');
        return separator < 0 ? code : code.substring(0, separator);
    }

    private static String toModernTag(String code) {
        if ("iw".equalsIgnoreCase(code)) return "he";
        if ("in".equalsIgnoreCase(code)) return "id";
        if ("ji".equalsIgnoreCase(code)) return "yi";
        return code;
    }
}
