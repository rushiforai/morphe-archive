package a40;

import java.util.List;
import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ a f186a = new a();

    /* renamed from: b, reason: collision with root package name */
    public static final List f187b = ul.b.Q("ar", "ar-dz", "ar-bh", "ar-eg", "ar-iq", "ar-jo", "ar-kw", "ar-lb", "ar-ly", "ar-ma", "ar-om", "ar-qa", "ar-sa", "ar-sd", "ar-sy", "ar-tn", "ar-ae", "ar-ye", "az", "bn", "bn-bd", "bn-in", "bs", "bs-ba", "bg", "bg-bg", "ca", "ca-es", "zh", "zh-hk", "zh-mo", "zh-cn", "zh-sg", "zh-tw", "hr", "hr-hr", "cs", "cs-cz", "da", "da-dk", "nl", "nl-aw", "nl-be", "nl-cw", "nl-nl", "nl-sx", "en", "en-as", "en-au", "en-bb", "en-be", "en-bz", "en-bm", "en-bw", "en-cm", "en-ca", "en-gh", "en-gu", "en-gy", "en-hk", "en-in", "en-ie", "en-jm", "en-ke", "en-mw", "en-my", "en-mt", "en-mh", "en-mu", "en-na", "en-nz", "en-ng", "en-mp", "en-pk", "en-ph", "en-rw", "en-sg", "en-za", "en-tz", "en-th", "en-tt", "en-um", "en-vi", "en-ug", "en-gb", "en-us", "en-zm", "en-zw", "et", "et-ee", "fa", "fa-af", "fa-ir", "fil", "fil-ph", "fi", "fi-fi", "fr", "fr-dz", "fr-be", "fr-bj", "fr-bf", "fr-bi", "fr-cm", "fr-ca", "fr-cf", "fr-td", "fr-km", "fr-cg", "fr-cd", "fr-ci", "fr-dj", "fr-gq", "fr-fr", "fr-gf", "fr-ga", "fr-gp", "fr-gn", "fr-lu", "fr-mg", "fr-ml", "fr-mq", "fr-mu", "fr-yt", "fr-mc", "fr-ma", "fr-ne", "fr-re", "fr-rw", "fr-bl", "fr-mf", "fr-sn", "fr-sc", "fr-ch", "fr-tg", "fr-tn", "de", "de-at", "de-be", "de-de", "de-li", "de-lu", "de-ch", "el", "el-cy", "el-gr", "gu", "he", "he-il", "hi", "hi-in", "hu", "hu-hu", "is", "is-is", "id", "id-id", "it", "it-it", "it-ch", "ja", "ja-jp", "kn", "kk", "kk-kz", "ko", "ko-kr", "lv", "lv-lv", "lt", "lt-lt", "mk", "mk-mk", "ms", "ms-bn", "ms-my", "mr", "sr-me", "nb", "pl", "pl-pl", "pt", "pt-ao", "pt-br", "pt-cv", "pt-gw", "pt-mz", "pt-pt", "pt-st", "pa", "pa-in", "ro", "ro-md", "ro-ro", "ru", "ru-md", "ru-ru", "ru-ua", "sr", "sr-me", "sr-rs", "sk", "sk-sk", "sl", "sl-sl", "es", "es-ar", "es-bo", "es-cl", "es-co", "es-cr", "es-do", "es-ec", "es-sv", "es-gq", "es-gt", "es-hn", "es-419", "es-mx", "es-ni", "es-pa", "es-py", "es-pe", "es-pr", "es-es", "es-us", "es-uy", "es-ve", "sw", "sw-cd", "sw-ke", "sw-tz", "sw-ug", "sv", "sv-fi", "sv-se", "tl", "ta", "ta-in", "ta-lk", "te", "te-in", "th", "th-th", "tr", "tr-tr", "uk", "uk-ua", "ur", "ur-bd", "ur-in", "ur-np", "ur-pk", "uz", "vi", "vi-vn");

    public static String a(Locale locale) {
        String lowerCase = locale.toLanguageTag().toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        List list = f187b;
        if (list.contains(lowerCase)) {
            return lowerCase;
        }
        String language = locale.getLanguage();
        int iHashCode = language.hashCode();
        if (iHashCode != 3365) {
            if (iHashCode != 3374) {
                if (iHashCode == 3391 && language.equals("ji")) {
                    language = "yi";
                }
            } else if (language.equals("iw")) {
                language = "he";
            }
        } else if (language.equals("in")) {
            language = "id";
        }
        return list.contains(language) ? language : "en-us";
    }
}
