package com.akshaykadam.pixelboard.extension.rambler;

/* loaded from: /content/v295-classes.dex */
public final class GboardRamblerSegmentLock {
    private static final int K_BANGLA = 1;
    private static final int K_DEMOTED = 9;
    private static final int K_ENGLISH = 2;
    private static final int K_FUNC = 3;
    private static final int K_KEEP = 8;
    private static final int K_NEUTRAL = 7;
    private static final int K_PUNCT = 5;
    private static final int K_SINGLE = 4;
    private static final int K_URL = 6;
    private static final int K_VERBATIM = 0;
    static final int PIN_AUTO = 0;
    static final int PIN_BN = 1;
    static final int PIN_EN = 2;
    private static final long PIN_TTL_MS = 120000;
    private static java.util.HashMap<java.lang.String, java.util.ArrayList<java.lang.String>> sEdIndex;
    private static final java.util.regex.Pattern HANDLE_SPAN = java.util.regex.Pattern.compile("(?<![A-Za-z0-9_.])@[A-Za-z0-9_]+");
    private static final java.util.regex.Pattern TIME_SUFFIX = java.util.regex.Pattern.compile("(?i)(?<=\\d)(?::\\d{2})?\\s*[ap]m\\b");
    private static int sPin = 0;
    private static long sPinAt = 0;
    private static final java.util.HashSet<java.lang.String> GARBLE_ALLOWLIST = new java.util.HashSet<>(java.util.Arrays.asList("hwen", "ting", "autputted", "drambler", "swoitcher", "anglisa"));
    private static final java.util.HashSet<java.lang.String> PROTECT_BN = new java.util.HashSet<>(java.util.Arrays.asList("abong", "albot", "ananda", "anmone", "aslen", "asman", "asmani", "astam", "avast", "bazar", "bhabchilam", "bhabte", "bhalo", "bhang", "bhenge", "bikel", "birat", "bolbo", "bolchi", "bolle", "bolte", "botol", "bujhlam", "bujho", "bujhtese", "cakri", "caple", "caplo", "capte", "capti", "chabi", "chaibo", "chailam", "chaile", "chand", "chara", "chilo", "chole", "choto", "cinte", "colbe", "colbi", "colbo", "colle", "collen", "colli", "collo", "cupse", "daray", "dekhbo", "dekhi", "dekho", "dorkar", "dupur", "fellen", "fitna", "fusle", "gamla", "giyechilam", "gobre", "gotokal", "hamla", "haque", "hoilo", "hoise", "hoitase", "jabod", "jachchi", "jachhe", "jante", "kajer", "kalrate", "kamra", "kamrate", "khabar", "khabo", "kharap", "khushi", "kichu", "kinte", "kinten", "konta", "korba", "korbo", "korchi", "lagbe", "lagche", "likhte", "mamla", "mamlay", "mante", "manto", "markin", "naxal", "nicchi", "pagla", "palta", "palte", "palti", "parba", "parbo", "porbo", "pubali", "rohman", "ronger", "sakkale", "samla", "samna", "samne", "sanjana", "shunbo", "sokal", "somak", "sonar", "sondha", "suman", "tahole", "taratari", "thakbe", "thakbo", "thaki", "thame", "thamo", "tinta", "toiri", "tomar", "tomrato", "tumpa", "utser"));
    private static final java.lang.String[] MARKERS = {"but", "and", "so", "because", "though", "however"};
    private static final java.util.HashSet<java.lang.String> BANGLA_FUNC = new java.util.HashSet<>(java.util.Arrays.asList("ami", "ta", "ki", "er", "to", "na", "se", "je"));
    private static final java.util.HashSet<java.lang.String> BANGLA_FRAME = new java.util.HashSet<>(java.util.Arrays.asList("ami", "ta", "ki", "na", "se", "je"));

    public static synchronized void setPin(int i) {
        synchronized (com.akshaykadam.pixelboard.extension.rambler.GboardRamblerSegmentLock.class) {
            if (i != 1 && i != 2) {
                i = 0;
            }
            sPin = i;
            sPinAt = i == 0 ? 0L : java.lang.System.currentTimeMillis();
        }
    }

    public static synchronized void resetPin() {
        synchronized (com.akshaykadam.pixelboard.extension.rambler.GboardRamblerSegmentLock.class) {
            sPin = 0;
            sPinAt = 0L;
        }
    }

    private static int lane() {
        int i;
        long j;
        synchronized (com.akshaykadam.pixelboard.extension.rambler.GboardRamblerSegmentLock.class) {
            i = sPin;
            j = sPinAt;
        }
        if (i == 0) {
            return 0;
        }
        if (j != 0 && java.lang.System.currentTimeMillis() - j <= PIN_TTL_MS) {
            return i;
        }
        resetPin();
        return 0;
    }

    private static boolean isAsciiAlpha(java.lang.String str) {
        for (int i = 0; i < str.length(); i++) {
            char charAt = str.charAt(i);
            if (charAt < 'a' || charAt > 'z') {
                return false;
            }
        }
        return true;
    }

    private static synchronized java.util.HashMap<java.lang.String, java.util.ArrayList<java.lang.String>> edIndex() {
        java.util.HashMap<java.lang.String, java.util.ArrayList<java.lang.String>> hashMap;
        synchronized (com.akshaykadam.pixelboard.extension.rambler.GboardRamblerSegmentLock.class) {
            if (sEdIndex == null) {
                java.util.HashMap<java.lang.String, java.util.ArrayList<java.lang.String>> hashMap2 = new java.util.HashMap<>(1024);
                java.util.Iterator<java.lang.String> it = com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFix.ENGLISH.iterator();
                while (it.hasNext()) {
                    java.lang.String next = it.next();
                    if (next != null && next.length() >= 4 && next.length() <= 12 && isAsciiAlpha(next)) {
                        java.lang.String str = next.charAt(0) + ":" + next.length();
                        java.util.ArrayList<java.lang.String> arrayList = hashMap2.get(str);
                        if (arrayList == null) {
                            arrayList = new java.util.ArrayList<>(16);
                            hashMap2.put(str, arrayList);
                        }
                        arrayList.add(next);
                    }
                }
                sEdIndex = hashMap2;
            }
            hashMap = sEdIndex;
        }
        return hashMap;
    }

    private static boolean editDist1(java.lang.String str, java.lang.String str2) {
        int length = str.length();
        int length2 = str2.length();
        if (length == length2) {
            int i = 0;
            for (int i2 = 0; i2 < length; i2++) {
                if (str.charAt(i2) != str2.charAt(i2) && (i = i + 1) > 1) {
                    return false;
                }
            }
            return i == 1;
        }
        if (length - length2 != 1 && length2 - length != 1) {
            return false;
        }
        java.lang.String str3 = length < length2 ? str : str2;
        if (length < length2) {
            str = str2;
        }
        int i3 = 0;
        int i4 = 0;
        boolean z = false;
        while (i3 < str3.length() && i4 < str.length()) {
            if (str3.charAt(i3) == str.charAt(i4)) {
                i3++;
                i4++;
            } else {
                if (z) {
                    return false;
                }
                i4++;
                z = true;
            }
        }
        return true;
    }

    private static boolean nearEnglishED1(java.lang.String str) {
        if (str.length() >= K_PUNCT && str.length() <= 13 && isAsciiAlpha(str)) {
            java.util.HashMap<java.lang.String, java.util.ArrayList<java.lang.String>> edIndex = edIndex();
            char charAt = str.charAt(0);
            char charAt2 = str.charAt(str.length() - 1);
            for (int length = str.length() - 1; length <= str.length() + 1; length++) {
                java.util.ArrayList<java.lang.String> arrayList = edIndex.get(charAt + ":" + length);
                if (arrayList != null) {
                    java.util.Iterator<java.lang.String> it = arrayList.iterator();
                    while (it.hasNext()) {
                        java.lang.String next = it.next();
                        if (next.charAt(next.length() - 1) == charAt2 && editDist1(str, next)) {
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    private GboardRamblerSegmentLock() {
    }

    private static boolean isMarker(java.lang.String str) {
        for (java.lang.String str2 : MARKERS) {
            if (str2.equals(str)) {
                return true;
            }
        }
        return false;
    }

    private static java.lang.String convertLoan(java.lang.String str, java.lang.String str2) {
        java.lang.String convertTokenLoan = com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFix.convertTokenLoan(str2, str2);
        if (convertTokenLoan == null) {
            java.lang.String replace = str2.replace("c", "k");
            convertTokenLoan = com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFix.convertTokenLoan(replace, replace);
        }
        if (convertTokenLoan != null) {
            return convertTokenLoan;
        }
        java.lang.String replace2 = str2.replace("c", "k").replace("x", "ks");
        return com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFix.convertTokenLoan(replace2, replace2);
    }

    private static java.lang.String singleVowel(java.lang.String str) {
        if (str.equals("a")) {
            return "আ";
        }
        if (str.equals("e")) {
            return "এ";
        }
        if (str.equals("i")) {
            return "আই";
        }
        if (str.equals("o")) {
            return "ও";
        }
        return null;
    }

    private static boolean englishByInflection(String word) {
        if (word == null || word.length() < 5) {
            return false;
        }
        String[][] suffixes = {
                {"ing", "e"}, {"ing", ""}, {"ed", "e"}, {"ed", ""},
                {"es", ""}, {"s", ""}, {"ly", ""}, {"er", ""}, {"est", ""}
        };
        for (String[] pair : suffixes) {
            String suf = pair[0];
            if (word.endsWith(suf) && word.length() - suf.length() >= 3) {
                String stem = word.substring(0, word.length() - suf.length()) + pair[1];
                if (GboardRamblerScriptFix.ENGLISH.contains(stem)) {
                    return true;
                }
            }
        }
        String[] doubleSuf = {"ing", "ed"};
        for (String suf : doubleSuf) {
            if (word.endsWith(suf) && word.length() - suf.length() >= 4) {
                String stem = word.substring(0, word.length() - suf.length());
                int len = stem.length();
                char last = stem.charAt(len - 1);
                if (last == stem.charAt(len - 2) && "bcdfgklmnprstz".indexOf(last) >= 0) {
                    if (GboardRamblerScriptFix.ENGLISH.contains(stem.substring(0, len - 1))) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public static String process(String text) {
        if (text == null || text.isEmpty()) {
            return text;
        }
        if (GboardRamblerScriptFix.ensureDictionary() == 0) {
            GboardRamblerScriptFix.addDiag("skip:dict-fail");
            return text;
        }
        int lane = lane();
        if (lane == PIN_EN) {
            GboardRamblerDiag.bump("v29-lane-en");
            return text;
        }
        boolean bnPin = (lane == PIN_BN);
        if (bnPin) {
            GboardRamblerDiag.bump("v29-lane-bn");
        } else {
            String sent = GboardRamblerSentenceLang.process(text);
            if (sent != null) {
                return sent;
            }
        }

        // BN pin (or SentenceLang fallback): preserve URLs, @handles, times, #hashtags; convert Latin words to Bangla.
        int n = text.length();
        boolean[] prot = new boolean[n];
        markSpan(prot, GboardRamblerScriptFix.URL_SPAN.matcher(text), n);
        markSpan(prot, HANDLE_SPAN.matcher(text), n);
        markSpan(prot, TIME_SUFFIX.matcher(text), n);
        markSpan(prot, GboardRamblerSentenceLang.HASHTAG.matcher(text), n);

        StringBuilder out = new StringBuilder(n + 16);
        int i = 0;
        int converted = 0;
        while (i < n) {
            char c = text.charAt(i);
            if (GboardRamblerScriptFix.isLatinLetter(c)) {
                int j = i + 1;
                while (j < n && GboardRamblerScriptFix.isLatinLetter(text.charAt(j))) {
                    j++;
                }
                while (j + 1 < n
                        && (text.charAt(j) == '\'' || text.charAt(j) == '\u2019')
                        && GboardRamblerScriptFix.isLatinLetter(text.charAt(j + 1))) {
                    j++;
                    while (j < n && GboardRamblerScriptFix.isLatinLetter(text.charAt(j))) {
                        j++;
                    }
                }
                String tok = text.substring(i, j);
                if (prot[i]) {
                    out.append(tok);
                } else {
                    String lo = tok.toLowerCase(java.util.Locale.US);
                    String mapped = null;
                    if (tok.length() == 1) {
                        mapped = singleVowel(lo);
                    } else {
                        mapped = GboardRamblerTier1.get(lo);
                        if (mapped != null) {
                            GboardRamblerDiag.bump("v29-t1");
                        } else {
                            mapped = convertLoan(tok, lo);
                        }
                    }
                    if (mapped != null) {
                        out.append(mapped);
                        converted++;
                    } else {
                        out.append(tok);
                    }
                }
                i = j;
            } else {
                out.append(c);
                i++;
            }
        }
        if (converted > 0) {
            GboardRamblerScriptFixSettings.incrementConverted();
        }
        return out.toString();
    }

    private static void markSpan(boolean[] prot, java.util.regex.Matcher m, int n) {
        while (m.find()) {
            for (int k = m.start(); k < m.end() && k < n; k++) {
                prot[k] = true;
            }
        }
    }
}
