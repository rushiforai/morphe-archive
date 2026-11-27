// Written by Jimaku's extension/scripts/export-android-sources.ts. Change the extension, not this file.
package app.jimaku.extension.shared;

import java.util.HashMap;
import java.util.Map;

/**
 * What Settings shows on the video while nothing else is on screen, from the extension's
 * {@code lib/preview-lines.ts}: YouTube's own sample caption, as its player says it in each language.
 */
public final class Samples {
    private static final Map<String, String> SAMPLES = new HashMap<>();

    static {
        SAMPLES.put("af", "Onderskrifte lyk so");
        SAMPLES.put("ar", "\u062a\u0638\u0647\u0631 \u0627\u0644\u062a\u0631\u062c\u0645\u0629 \u0628\u0627\u0644\u0634\u0643\u0644 \u0627\u0644\u062a\u0627\u0644\u064a");
        SAMPLES.put("as", "\u0995\u09c7\u09aa\u09b6\u09cd\u09ac\u09a8\u09ac\u09cb\u09f0 \u09a6\u09c7\u0996\u09bf\u09ac\u09b2\u09c8 \u098f\u09a8\u09c7 \u09b2\u09be\u0997\u09c7");
        SAMPLES.put("az", "Subtitrl\u0259r bu c\u00fcr g\u00f6r\u00fcn\u00fcr:");
        SAMPLES.put("bg", "\u041d\u0430\u0434\u043f\u0438\u0441\u0438\u0442\u0435 \u0438\u0437\u0433\u043b\u0435\u0436\u0434\u0430\u0442 \u0442\u0430\u043a\u0430");
        SAMPLES.put("bn", "\u09aa\u09b0\u09bf\u099a\u09df\u09b2\u09bf\u09aa\u09bf\u0997\u09c1\u09b2\u09bf \u098f\u09ae\u09a8 \u09a6\u09c7\u0996\u09be\u09df");
        SAMPLES.put("bs", "Opisi izgledaju ovako");
        SAMPLES.put("ca", "Els subt\u00edtols es veuran aix\u00ed");
        SAMPLES.put("cs", "Nadpisy vypadaj\u00ed takto");
        SAMPLES.put("da", "Underteksterne ser s\u00e5dan ud");
        SAMPLES.put("de", "So werden die Untertitel mit der aktuellen Konfiguration aussehen.");
        SAMPLES.put("el", "\u039f\u03b9 \u03c5\u03c0\u03cc\u03c4\u03b9\u03c4\u03bb\u03bf\u03b9 \u03b8\u03b1 \u03b5\u03bc\u03c6\u03b1\u03bd\u03af\u03b6\u03bf\u03bd\u03c4\u03b1\u03b9 \u03cc\u03c0\u03c9\u03c2 \u03b5\u03b4\u03ce");
        SAMPLES.put("en", "Captions look like this");
        SAMPLES.put("es", "Los subt\u00edtulos tendr\u00e1n este aspecto");
        SAMPLES.put("et", "Subtiitrid n\u00e4evad v\u00e4lja sellised");
        SAMPLES.put("fa", "\u0632\u06cc\u0631\u0646\u0648\u06cc\u0633\u200c\u0647\u0627 \u0628\u0647 \u0627\u06cc\u0646 \u0634\u06a9\u0644 \u0647\u0633\u062a\u0646\u062f");
        SAMPLES.put("fi", "Tekstitykset n\u00e4ytt\u00e4v\u00e4t t\u00e4lt\u00e4");
        SAMPLES.put("fil", "Ganito ang hitsura ng mga caption");
        SAMPLES.put("fr", "Aper\u00e7u des sous-titres");
        SAMPLES.put("gl", "Os subt\u00edtulos te\u00f1en este aspecto");
        SAMPLES.put("gu", "\u0a95\u0ac5\u0aaa\u0acd\u0ab6\u0aa8\u0acd\u0ab8 \u0a86\u0aa8\u0abe \u0a9c\u0ac7\u0ab5\u0abe \u0aa6\u0ac7\u0a96\u0abe\u0aaf \u0a9b\u0ac7");
        SAMPLES.put("he", "\u05db\u05ea\u05d5\u05d1\u05d9\u05d5\u05ea \u05e0\u05e8\u05d0\u05d5\u05ea \u05db\u05da");
        SAMPLES.put("hi", "\u0905\u0928\u0941\u0936\u0940\u0930\u094d\u0937\u0928 \u0907\u0938 \u0924\u0930\u0939 \u0926\u093f\u0916\u0947\u0902\u0917\u0947");
        SAMPLES.put("hu", "A feliratok \u00edgy n\u00e9znek ki");
        SAMPLES.put("hy", "\u056c\u0578\u0582\u057d\u0561\u0563\u0580\u0565\u0580\u0576 \u0578\u0582\u0576\u0565\u0576 \u0570\u0565\u057f\u0587\u0575\u0561\u056c \u057f\u0565\u057d\u0584\u0568");
        SAMPLES.put("id", "Subtitel akan terlihat seperti ini");
        SAMPLES.put("is", "Skj\u00e1textar l\u00edta svona \u00fat");
        SAMPLES.put("it", "I sottotitoli hanno questo aspetto");
        SAMPLES.put("ja", "\u5b57\u5e55\u306f\u6b21\u306e\u3088\u3046\u306b\u306a\u308a\u307e\u3059");
        SAMPLES.put("kk", "\u0416\u0430\u0437\u0443\u043b\u0430\u0440 \u043e\u0441\u044b\u0493\u0430\u043d \u04b1\u049b\u0441\u0430\u0441");
        SAMPLES.put("kn", "\u0cb6\u0cc0\u0cb0\u0ccd\u0cb7\u0cbf\u0c95\u0cc6\u0caf\u0cc1 \u0c88 \u0cb0\u0cc0\u0ca4\u0cbf\u0caf\u0cbe\u0c97\u0cbf \u0c95\u0cbe\u0ca3\u0cbf\u0cb8\u0cc1\u0ca4\u0ccd\u0ca4\u0ca6\u0cc6");
        SAMPLES.put("ko", "\uc790\ub9c9\uc740 \uc774\ub807\uac8c \ud45c\uc2dc\ub429\ub2c8\ub2e4.");
        SAMPLES.put("lt", "Subtitrai atrodo taip");
        SAMPLES.put("lv", "Paraksti izskat\u0101s \u0161\u0101di");
        SAMPLES.put("mk", "\u0422\u0435\u043a\u0441\u0442\u0443\u0430\u043b\u043d\u0438\u0442\u0435 \u043e\u0431\u0458\u0430\u0441\u043d\u0443\u0432\u0430\u045a\u0430 \u0438\u0437\u0433\u043b\u0435\u0434\u0430\u0430\u0442 \u0432\u0430\u043a\u0430");
        SAMPLES.put("ml", "\u0d09\u0d2a\u0d36\u0d40\u0d7c\u0d37\u0d15\u0d19\u0d4d\u0d19\u0d7e \u0d07\u0d24\u0d41\u0d2a\u0d4b\u0d32\u0d46 \u0d15\u0d3e\u0d23\u0d2a\u0d4d\u0d2a\u0d46\u0d1f\u0d41\u0d28\u0d4d\u0d28\u0d41");
        SAMPLES.put("mr", "\u092e\u0925\u0933\u0947 \u092f\u093e\u0938\u093e\u0930\u0916\u0947 \u0926\u093f\u0938\u0924 \u0906\u0939\u0947\u0924");
        SAMPLES.put("ms", "Kapsyen kelihatan seperti ini");
        SAMPLES.put("nb", "Tekstingen ser slik ut");
        SAMPLES.put("ne", "\u0915\u094d\u092f\u093e\u092a\u094d\u0936\u0928 \u092f\u0938\u094d\u0924\u094b \u0926\u0947\u0916\u093f\u0928\u094d\u091b");
        SAMPLES.put("nl", "Ondertiteling wordt als volgt weergegeven");
        SAMPLES.put("or", "\u0b15\u0b4d\u0b5f\u0b3e\u0b2a\u0b4d\u0b38\u0b28\u0b4d\u200c \u0b0f\u0b39\u0b3f\u0b2a\u0b30\u0b3f \u0b26\u0b47\u0b16\u0b3e\u0b2f\u0b3f\u0b2c");
        SAMPLES.put("pa", "\u0a38\u0a41\u0a30\u0a16\u0a40 \u0a07\u0a38 \u0a35\u0a30\u0a17\u0a40 \u0a26\u0a3f\u0a16\u0a26\u0a40 \u0a39\u0a48");
        SAMPLES.put("pl", "Napisy b\u0119d\u0105 wygl\u0105da\u0142y tak");
        SAMPLES.put("pt", "As legendas ficam assim");
        SAMPLES.put("ro", "Subtitr\u0103rile arat\u0103 astfel");
        SAMPLES.put("ru", "\u0421\u0443\u0431\u0442\u0438\u0442\u0440\u044b \u0431\u0443\u0434\u0443\u0442 \u0432\u044b\u0433\u043b\u044f\u0434\u0435\u0442\u044c \u0442\u0430\u043a");
        SAMPLES.put("sk", "Titulky vyzeraj\u00fa takto");
        SAMPLES.put("sl", "Podnapisi so videti tako");
        SAMPLES.put("sv", "Textningen ser ut s\u00e5 h\u00e4r");
        SAMPLES.put("sw", "Manukuu huonekana hivi");
        SAMPLES.put("ta", "\u0ba4\u0bb2\u0bc8\u0baa\u0bcd\u0baa\u0bc1\u0b95\u0bb3\u0bcd \u0b87\u0baa\u0bcd\u0baa\u0b9f\u0bbf \u0b87\u0bb0\u0bc1\u0b95\u0bcd\u0b95\u0bc1\u0bae\u0bcd");
        SAMPLES.put("te", "\u0c15\u0c4d\u0c2f\u0c3e\u0c2a\u0c4d\u0c37\u0c28\u0c4d\u200c\u0c32\u0c41 \u0c07\u0c32\u0c3e \u0c15\u0c28\u0c3f\u0c2a\u0c3f\u0c38\u0c4d\u0c24\u0c3e\u0c2f\u0c3f");
        SAMPLES.put("th", "\u0e04\u0e33\u0e1a\u0e23\u0e23\u0e22\u0e32\u0e22\u0e41\u0e17\u0e19\u0e40\u0e2a\u0e35\u0e22\u0e07\u0e08\u0e30\u0e21\u0e35\u0e25\u0e31\u0e01\u0e29\u0e13\u0e30\u0e14\u0e31\u0e07\u0e19\u0e35\u0e49");
        SAMPLES.put("tr", "Altyaz\u0131lar \u015fu \u015fekilde g\u00f6r\u00fcn\u00fcr");
        SAMPLES.put("uk", "\u0421\u0443\u0431\u0442\u0438\u0442\u0440\u0438 \u0432\u0438\u0433\u043b\u044f\u0434\u0430\u044e\u0442\u044c \u0442\u0430\u043a");
        SAMPLES.put("ur", "\u06a9\u06cc\u067e\u0634\u0646\u0632 \u0627\u06cc\u0633\u06cc \u0646\u0638\u0631 \u0622\u062a\u06cc \u06c1\u06cc\u06ba");
        SAMPLES.put("vi", "Ph\u1ee5 \u0111\u1ec1 tr\u00f4ng nh\u01b0 th\u1ebf n\u00e0y");
        SAMPLES.put("yue", "\u5b57\u5e55\u6703\u50cf\u9019\u6a23");
        SAMPLES.put("zh-Hans", "\u5b57\u5e55\u6837\u5f0f\u9884\u89c8");
        SAMPLES.put("zh-Hant", "\u5b57\u5e55\u5916\u89c0\u7bc4\u4f8b");
    }

    private Samples() {
    }

    /** The sample caption in {@code lang}, or in English for a code it doesn't know. */
    public static String line(String lang) {
        String line = SAMPLES.get(lang);
        return line != null ? line : SAMPLES.get("en");
    }
}
