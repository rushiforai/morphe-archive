/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import androidx.annotation.Nullable;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * The language the outside translate writes in (#35). Telegram's translate-to list only offers
 * its own server's languages, so this picks from every code Google's web translate takes, which
 * an AI service reads as well. Empty, the default, keeps Telegram's language and then the phone's.
 */
public final class TranslateTarget {
    /** Telegram's language, as before there was a choice. */
    public static final String TELEGRAM = "";

    /**
     * Google's codes with the English name Google gives each, in its own order: the target list
     * translate.googleapis.com/translate_a/l?client=gtx answered on 2026-10-26, Hebrew and Javanese
     * still as iw and jw. The English name names a language the phone has no name for, and searches find it.
     */
    private static final String TABLE = "ab:Abkhaz|ace:Acehnese|ach:Acholi|aa:Afar|af:Afrikaans|sq:Albanian|alz:Alur|am:Amharic|ar:Arabic"
            + "|hy:Armenian|as:Assamese|av:Avar|awa:Awadhi|ay:Aymara|az:Azerbaijani|ban:Balinese|bal:Baluchi"
            + "|bm:Bambara|bci:Baoulé|ba:Bashkir|eu:Basque|btx:Batak Karo|bts:Batak Simalungun|bbc:Batak Toba"
            + "|be:Belarusian|bem:Bemba|bn:Bengali|bew:Betawi|bho:Bhojpuri|bik:Bikol|bs:Bosnian|br:Breton"
            + "|bg:Bulgarian|bua:Buryat|yue:Cantonese|ca:Catalan|ceb:Cebuano|ch:Chamorro|ce:Chechen|ny:Chichewa"
            + "|zh-CN:Chinese (Simplified)|zh-TW:Chinese (Traditional)|chk:Chuukese|cv:Chuvash|co:Corsican"
            + "|crh:Crimean Tatar (Cyrillic)|crh-Latn:Crimean Tatar (Latin)|hr:Croatian|cs:Czech|da:Danish"
            + "|fa-AF:Dari|dv:Dhivehi|din:Dinka|doi:Dogri|dov:Dombe|nl:Dutch|dyu:Dyula|dz:Dzongkha|en:English"
            + "|eo:Esperanto|et:Estonian|ee:Ewe|fo:Faroese|fj:Fijian|tl:Filipino|fi:Finnish|fon:Fon|fr:French"
            + "|fr-CA:French (Canada)|fy:Frisian|fur:Friulian|ff:Fulani|gaa:Ga|gl:Galician|ka:Georgian"
            + "|de:German|el:Greek|gn:Guarani|gu:Gujarati|ht:Haitian Creole|cnh:Hakha Chin|ha:Hausa"
            + "|haw:Hawaiian|iw:Hebrew|hil:Hiligaynon|hi:Hindi|hmn:Hmong|hu:Hungarian|hrx:Hunsrik|iba:Iban"
            + "|is:Icelandic|ig:Igbo|ilo:Ilocano|id:Indonesian|iu-Latn:Inuktut (Latin)|iu:Inuktut (Syllabics)"
            + "|ga:Irish|it:Italian|jam:Jamaican Patois|ja:Japanese|jw:Javanese|kac:Jingpo|kl:Kalaallisut"
            + "|kn:Kannada|kr:Kanuri|pam:Kapampangan|kk:Kazakh|kha:Khasi|km:Khmer|cgg:Kiga|kg:Kikongo"
            + "|rw:Kinyarwanda|ktu:Kituba|trp:Kokborok|kv:Komi|gom:Konkani|ko:Korean|kri:Krio"
            + "|ku:Kurdish (Kurmanji)|ckb:Kurdish (Sorani)|ky:Kyrgyz|lo:Lao|ltg:Latgalian|la:Latin|lv:Latvian"
            + "|lij:Ligurian|li:Limburgish|ln:Lingala|lt:Lithuanian|lmo:Lombard|lg:Luganda|luo:Luo"
            + "|lb:Luxembourgish|mk:Macedonian|mad:Madurese|mai:Maithili|mak:Makassar|mg:Malagasy|ms:Malay"
            + "|ms-Arab:Malay (Jawi)|ml:Malayalam|mt:Maltese|mam:Mam|gv:Manx|mi:Maori|mr:Marathi|mh:Marshallese"
            + "|mwr:Marwadi|mfe:Mauritian Creole|chm:Meadow Mari|mni-Mtei:Meiteilon (Manipuri)|min:Minang"
            + "|lus:Mizo|mn:Mongolian|my:Myanmar (Burmese)|nhe:Nahuatl (Eastern Huasteca)|ndc-ZW:Ndau"
            + "|nr:Ndebele (South)|new:Nepalbhasa (Newari)|ne:Nepali|bm-Nkoo:NKo|no:Norwegian|nus:Nuer"
            + "|oc:Occitan|or:Odia (Oriya)|om:Oromo|os:Ossetian|pag:Pangasinan|pap:Papiamento|ps:Pashto"
            + "|fa:Persian|pl:Polish|pt:Portuguese (Brazil)|pt-PT:Portuguese (Portugal)|pa:Punjabi (Gurmukhi)"
            + "|pa-Arab:Punjabi (Shahmukhi)|qu:Quechua|kek:Qʼeqchiʼ|rom:Romani|ro:Romanian|rn:Rundi|ru:Russian"
            + "|se:Sami (North)|sm:Samoan|sg:Sango|sa:Sanskrit|sat-Latn:Santali (Latin)|sat:Santali (Ol Chiki)"
            + "|gd:Scots Gaelic|nso:Sepedi|sr:Serbian|st:Sesotho|crs:Seychellois Creole|shn:Shan|sn:Shona"
            + "|scn:Sicilian|szl:Silesian|sd:Sindhi|si:Sinhala|sk:Slovak|sl:Slovenian|so:Somali|es:Spanish"
            + "|su:Sundanese|sus:Susu|sw:Swahili|ss:Swati|sv:Swedish|ty:Tahitian|tg:Tajik|ber-Latn:Tamazight"
            + "|ber:Tamazight (Tifinagh)|ta:Tamil|tt:Tatar|te:Telugu|tet:Tetum|th:Thai|bo:Tibetan|ti:Tigrinya"
            + "|tiv:Tiv|tpi:Tok Pisin|to:Tongan|lua:Tshiluba|ts:Tsonga|tn:Tswana|tcy:Tulu|tum:Tumbuka"
            + "|tr:Turkish|tk:Turkmen|tyv:Tuvan|ak:Twi|udm:Udmurt|uk:Ukrainian|ur:Urdu|ug:Uyghur|uz:Uzbek"
            + "|ve:Venda|vec:Venetian|vi:Vietnamese|war:Waray|cy:Welsh|wo:Wolof|xh:Xhosa|sah:Yakut|yi:Yiddish"
            + "|yo:Yoruba|yua:Yucatec Maya|zap:Zapotec|zu:Zulu";

    /** Every code, in the order the list shows them, each with its English name. */
    public static final Map<String, String> LANGUAGES;

    static {
        Map<String, String> languages = new LinkedHashMap<>();
        for (String entry : TABLE.split("\\|")) {
            int colon = entry.indexOf(':');
            languages.put(entry.substring(0, colon), entry.substring(colon + 1));
        }
        LANGUAGES = Collections.unmodifiableMap(languages);
    }

    private TranslateTarget() {}

    /** Whether a value is Telegram's language or one of the codes. Anything else isn't a choice. */
    public static boolean allowed(@Nullable String value) {
        return value != null && (value.isEmpty() || LANGUAGES.containsKey(value));
    }

    /** The picked code, or null to follow Telegram's language: nothing picked, paused, early or unreadable. */
    @Nullable
    static String chosen() {
        if (!Utils.settingsReady()) return null;
        String saved = Settings.TRANSLATE_TARGET.get();
        return saved != null && LANGUAGES.containsKey(saved) ? saved : null;
    }

    /** Google's English name for a code, or null for one it doesn't take. */
    @Nullable
    public static String englishName(String code) {
        return LANGUAGES.get(code);
    }

    /**
     * Google's name for a code the phone knows under another language name (Akan for Twi, Nyanja
     * for Chichewa, Tagalog for Filipino), or null where the two agree.
     */
    @Nullable
    public static String googleNameIfOther(String code) {
        if (!code.equals("ak") && !code.equals("ny") && !code.equals("tl")) return null;
        String google = englishName(code);
        return google == null || google.equalsIgnoreCase(nameIn(code, Locale.ENGLISH)) ? null : google;
    }

    /** What the language calls itself, like Deutsch or Español, or its English name where the phone has none. */
    public static String nativeName(String code) {
        String own = nameIn(code, locale(code));
        return own != null ? own : String.valueOf(englishName(code));
    }

    /** The language's name in [in], or null where the phone has no name for it. */
    @Nullable
    public static String nameIn(String code, Locale in) {
        Locale locale = locale(code);
        String language = locale.getDisplayLanguage(in);
        if (language.isEmpty() || language.equalsIgnoreCase(locale.getLanguage())) return null;
        // A code with a script or a region is one of two choices for its language (the two
        // Chineses, Punjabi in Arabic script, Canadian French), so its name says which.
        String name = code.indexOf('-') < 0 ? language : locale.getDisplayName(in);
        if (name.equalsIgnoreCase(code)) return null;
        int first = name.offsetByCodePoints(0, 1);
        return name.substring(0, first).toUpperCase(in) + name.substring(first);
    }

    private static Locale locale(String code) {
        if (code.equals("zh-CN")) return Locale.forLanguageTag("zh-Hans");
        if (code.equals("zh-TW")) return Locale.forLanguageTag("zh-Hant");
        // Google keeps Hebrew's and Javanese's old codes, which the phone may not name.
        if (code.equals("iw")) return Locale.forLanguageTag("he");
        if (code.equals("jw")) return Locale.forLanguageTag("jv");
        return Locale.forLanguageTag(code);
    }
}
