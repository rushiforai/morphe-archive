package dev.utaa.linimal.extension.i18n;

import android.content.Context;
import android.content.res.Configuration;

import java.util.Locale;
import java.util.Map;

/**
 * Linimal が画面や通知に出す文言を、LINE の表示言語に合わせて返します。
 *
 * <p>文言はソースに日本語の原文で書き、表示の直前に {@link #t(String)} で訳を引きます。原文がそのまま
 * 翻訳表のキーです。日本語のときは原文を、繁体字中国語・タイ語・インドネシア語のときはその訳を、
 * それ以外の言語では英語を返します。訳がない文言は英語、英語もなければ原文に戻します。</p>
 *
 * <p>言語は LINE の Application の Resources の設定から決めます。アプリ別の言語設定も反映されます。
 * 初期化前は {@link Locale#getDefault()} を使います。</p>
 */
public final class LinimalText {
    private static volatile Context applicationContext;
    private static volatile Locale localeForTesting;

    private LinimalText() {
    }

    /** {@code LinimalBootstrap} から呼ばれます。 */
    public static void initialize(Context context) {
        if (context != null) {
            Context application = context.getApplicationContext();
            applicationContext = application != null ? application : context;
        }
    }

    /** 原文の訳を返します。null は null のままです。 */
    public static String t(String japanese) {
        if (japanese == null) {
            return null;
        }
        return translate(japanese, language());
    }

    /** 原文を訳したうえで {@link String#format} の書式として使います。 */
    public static String format(String japanese, Object... args) {
        return String.format(Locale.ROOT, t(japanese), args);
    }

    /** 読み上げ用に 2 つの文をつなぎます。日本語と中国語は句点、タイ語は空白、それ以外はピリオドで区切ります。 */
    public static String joinSentences(String first, String second) {
        switch (language()) {
            case JAPANESE:
            case TRADITIONAL_CHINESE:
                return first + '\u3002' + second;
            case THAI:
                return first + " " + second;
            default:
                return first + ". " + second;
        }
    }

    /** 表示に使う言語。日本語のときだけ原文を使います。 */
    public static Language language() {
        try {
            return Language.of(locale());
        } catch (Throwable ignored) {
            return Language.ENGLISH;
        }
    }

    static String translate(String japanese, Language language) {
        if (language == Language.JAPANESE) {
            return japanese;
        }
        String translated = LinimalTranslations.table(language).get(japanese);
        if (translated == null && language != Language.ENGLISH) {
            translated = LinimalTranslations.table(Language.ENGLISH).get(japanese);
        }
        return translated != null ? translated : japanese;
    }

    private static Locale locale() {
        Locale forced = localeForTesting;
        if (forced != null) {
            return forced;
        }
        Context context = applicationContext;
        if (context != null) {
            try {
                Configuration configuration = context.getResources().getConfiguration();
                if (!configuration.getLocales().isEmpty()) {
                    return configuration.getLocales().get(0);
                }
            } catch (Throwable ignored) {
                // 既定の locale に戻します。
            }
        }
        return Locale.getDefault();
    }

    /** test 用の境界。null で解除します。 */
    public static void setLocaleForTesting(Locale locale) {
        localeForTesting = locale;
    }

    /** Linimal が対応する表示言語。 */
    public enum Language {
        JAPANESE,
        ENGLISH,
        TRADITIONAL_CHINESE,
        THAI,
        INDONESIAN;

        /** 簡体字中国語など、表を持たない言語は英語にします。 */
        static Language of(Locale locale) {
            if (locale == null) {
                return ENGLISH;
            }
            String language = locale.getLanguage();
            switch (language) {
                case "ja":
                    return JAPANESE;
                case "th":
                    return THAI;
                case "in":
                case "id":
                    return INDONESIAN;
                case "zh":
                    return isTraditionalChinese(locale) ? TRADITIONAL_CHINESE : ENGLISH;
                default:
                    return ENGLISH;
            }
        }

        private static boolean isTraditionalChinese(Locale locale) {
            String script = locale.getScript();
            if ("Hant".equals(script)) {
                return true;
            }
            if ("Hans".equals(script)) {
                return false;
            }
            String country = locale.getCountry();
            return "TW".equals(country) || "HK".equals(country) || "MO".equals(country);
        }
    }

    /** 表の参照だけを test から使う境界です。 */
    static Map<String, String> tableForTesting(Language language) {
        return LinimalTranslations.table(language);
    }
}
