package semicoloncolonel.mobilestream.extension.shared.misc;

import android.graphics.Color;
import android.graphics.Typeface;
import android.text.BidiFormatter;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import android.text.style.StyleSpan;

import java.util.Locale;

/** The message on the screen that covers an ad break. */
public final class AdBreakText {
    private static final String TIME = "{time}";

    // Headline, body with no time known, body with the time left at {time}.
    private static final String[] ENGLISH = {
            "We'll be right back!",
            "The ads are muted and out of sight. Perfect time for a snack run.",
            "The ads are muted and out of sight. Snack run? You have {time}.",
    };
    private static final String[] SPANISH = {
            "¡Ya volvemos!",
            "Los anuncios están silenciados y fuera de vista. Buen momento para ir por algo de picar.",
            "Los anuncios están silenciados y fuera de vista. ¿Vas por algo de picar? Tienes {time}.",
    };
    private static final String[] CHINESE_SIMPLIFIED = {
            "马上回来！",
            "广告已静音并隐藏。正好去拿点零食。",
            "广告已静音并隐藏。去拿点零食？还有 {time}。",
    };
    private static final String[] CHINESE_TRADITIONAL = {
            "馬上回來！",
            "廣告已靜音並隱藏。正好去拿點零食。",
            "廣告已靜音並隱藏。去拿點零食？還有 {time}。",
    };
    private static final String[] FRENCH = {
            "On revient tout de suite !",
            "Les publicités sont coupées et masquées. C'est le moment d'aller chercher un en-cas.",
            "Les publicités sont coupées et masquées. Un petit en-cas ? Il vous reste {time}.",
    };
    private static final String[] ARABIC = {
            "سنعود بعد قليل!",
            "الإعلانات مكتومة ومخفية. وقت مناسب لإحضار وجبة خفيفة.",
            "الإعلانات مكتومة ومخفية. هل تحضر وجبة خفيفة؟ لديك {time}.",
    };
    private static final String[] GERMAN = {
            "Wir sind gleich zurück!",
            "Die Werbung ist stummgeschaltet und ausgeblendet. Zeit für einen kleinen Snack.",
            "Die Werbung ist stummgeschaltet und ausgeblendet. Snackpause? Du hast {time}.",
    };
    private static final String[] ITALIAN = {
            "Torniamo subito!",
            "Le pubblicità sono silenziate e nascoste. Il momento giusto per uno spuntino.",
            "Le pubblicità sono silenziate e nascoste. Uno spuntino? Hai {time}.",
    };
    private static final String[] GREEK = {
            "Επιστρέφουμε αμέσως!",
            "Οι διαφημίσεις είναι σε σίγαση και κρυμμένες. Ώρα για ένα σνακ.",
            "Οι διαφημίσεις είναι σε σίγαση και κρυμμένες. Πας για σνακ; Έχεις {time}.",
    };
    private static final String[] PORTUGUESE = {
            "Já voltamos!",
            "Os anúncios estão sem som e fora de vista. Hora perfeita para um lanchinho.",
            "Os anúncios estão sem som e fora de vista. Um lanchinho? Você tem {time}.",
    };
    private static final String[] RUSSIAN = {
            "Скоро вернёмся!",
            "Реклама без звука и скрыта. Самое время перекусить.",
            "Реклама без звука и скрыта. Перекусим? Осталось {time}.",
    };
    private static final String[] TAGALOG = {
            "Babalik kami agad!",
            "Naka-mute at nakatago ang mga ad. Magandang oras para kumuha ng meryenda.",
            "Naka-mute at nakatago ang mga ad. Meryenda muna? May {time} ka pa.",
    };
    private static final String[] VIETNAMESE = {
            "Chúng tôi sẽ quay lại ngay!",
            "Quảng cáo đã được tắt tiếng và ẩn đi. Đúng lúc để đi lấy chút đồ ăn vặt.",
            "Quảng cáo đã được tắt tiếng và ẩn đi. Đi lấy đồ ăn vặt nhé? Bạn còn {time}.",
    };
    private static final String[] KOREAN = {
            "곧 돌아올게요!",
            "광고는 음소거되고 가려졌어요. 간식 챙기기 딱 좋은 시간이에요.",
            "광고는 음소거되고 가려졌어요. 간식 챙기러 갈까요? {time} 남았어요.",
    };

    private AdBreakText() {
    }

    /** Replaced by the Translate ad break screen patch to return true. */
    private static boolean translate() {
        return false;
    }

    /** With no time left known. */
    public static CharSequence untimed() {
        String[] text = strings();
        return styled(text[0], text[1]);
    }

    /** With the seconds left in the break. */
    public static CharSequence timed(long seconds) {
        String[] text = strings();
        String time = String.format(Locale.US, "%d:%02d", seconds / 60, seconds % 60);
        // Wrapped so the digits keep their order inside right-to-left text.
        return styled(text[0], text[2].replace(TIME, BidiFormatter.getInstance().unicodeWrap(time)));
    }

    private static String[] strings() {
        if (!translate()) return ENGLISH;
        Locale locale = Locale.getDefault();
        switch (locale.getLanguage()) {
            case "es": return SPANISH;
            case "zh": return isTraditional(locale) ? CHINESE_TRADITIONAL : CHINESE_SIMPLIFIED;
            case "fr": return FRENCH;
            case "ar": return ARABIC;
            case "de": return GERMAN;
            case "it": return ITALIAN;
            case "el": return GREEK;
            case "pt": return PORTUGUESE;
            case "ru": return RUSSIAN;
            case "fil":
            case "tl": return TAGALOG;
            case "vi": return VIETNAMESE;
            case "ko": return KOREAN;
            default: return ENGLISH;
        }
    }

    private static boolean isTraditional(Locale locale) {
        String script = locale.getScript();
        if (!script.isEmpty()) return script.equals("Hant");
        String country = locale.getCountry();
        return country.equals("TW") || country.equals("HK") || country.equals("MO");
    }

    private static CharSequence styled(String headline, String body) {
        SpannableString text = new SpannableString(headline + "\n\n" + body);
        int end = headline.length();
        text.setSpan(new StyleSpan(Typeface.BOLD), 0, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.setSpan(new RelativeSizeSpan(1.5f), 0, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.setSpan(new ForegroundColorSpan(Color.WHITE), 0, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return text;
    }
}
