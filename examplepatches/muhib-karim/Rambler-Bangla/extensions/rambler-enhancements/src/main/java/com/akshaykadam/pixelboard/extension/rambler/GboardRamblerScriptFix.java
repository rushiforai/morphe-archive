package com.akshaykadam.pixelboard.extension.rambler;

/* loaded from: /content/v295-classes.dex */
public final class GboardRamblerScriptFix {
    private static final java.lang.String ANUSVARA = "ং";
    private static final java.lang.String[][] CONSONANTS;
    static java.util.HashSet<java.lang.String> ENGLISH = null;
    private static final java.util.Map<java.lang.String, java.lang.String> EXCEPTIONS;
    private static final java.util.HashSet<java.lang.String> FORCE_BANGLA = new java.util.HashSet<>(java.util.Arrays.asList("aj", "na", "to", "re", "ta", "te", "ke", "je", "se", "bo", "lo", "ami", "ki", "rat", "bangladesh", "dhaka", "boi", "ek", "do", "de", "dei", "office"));
    private static final java.lang.String HASANTA = "্";
    private static final java.util.HashSet<java.lang.String> JHA_WORDS;
    private static final java.util.HashSet<java.lang.String> JOIN_PAIRS;
    static final java.util.HashSet<java.lang.String> KEEP_TOKENS;
    private static final java.lang.String O_KAR = "ো";
    private static final java.lang.String[][] PHRASE_JOINS;
    private static final java.lang.String TAG = "RamblerScriptFix";
    static final java.util.regex.Pattern URL_SPAN;
    private static final java.lang.String[][] VOWELS;
    private static java.util.ArrayList diagBuffer;
    private static java.text.SimpleDateFormat diagSdf;
    public static int jvmLayoutKind;
    private static volatile java.lang.String activeGboardLocale;
    private static volatile java.lang.String lastVoiceEngine;

    public static void setActiveGboardLocale(java.lang.String localeTag) {
        activeGboardLocale = (localeTag == null || localeTag.trim().isEmpty())
                ? null
                : localeTag.trim();
    }

    static void addDiag(java.lang.String str) {
        if (com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFixSettings.isDiagArmed()) {
            try {
                java.util.ArrayList arrayList = diagBuffer;
                if (arrayList == null) {
                    arrayList = new java.util.ArrayList();
                    diagBuffer = arrayList;
                }
                java.lang.StringBuilder sb = new java.lang.StringBuilder();
                java.text.SimpleDateFormat simpleDateFormat = diagSdf;
                if (simpleDateFormat == null) {
                    simpleDateFormat = new java.text.SimpleDateFormat("HH:mm:ss.SSS", java.util.Locale.US);
                    diagSdf = simpleDateFormat;
                }
                sb.append(simpleDateFormat.format(new java.util.Date()));
                sb.append(" ");
                sb.append(str);
                java.lang.String sb2 = sb.toString();
                if (arrayList.size() >= 400) {
                    arrayList.remove(0);
                }
                arrayList.add(sb2);
            } catch (java.lang.Throwable th) {
            }
        }
    }

    static void addDiag2(java.lang.String str, java.lang.String str2) {
        if (com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFixSettings.isDiagArmed()) {
            try {
                java.lang.StringBuilder sb = new java.lang.StringBuilder();
                sb.append(str);
                sb.append(":");
                if (str2 == null) {
                    str2 = "null";
                }
                sb.append(str2);
                addDiag(sb.toString());
            } catch (java.lang.Throwable th) {
            }
        }
    }

    private static void appendProbe(java.lang.StringBuilder sb, android.view.inputmethod.InputMethodSubtype inputMethodSubtype, java.lang.String str) {
        try {
            sb.append(" ");
            sb.append(str);
            sb.append("=");
            java.lang.String extraValueOf = inputMethodSubtype.getExtraValueOf(str);
            if (extraValueOf == null) {
                extraValueOf = "null";
            }
            sb.append(extraValueOf);
        } catch (java.lang.Throwable th) {
        }
    }

    private static void appendSubtype(java.lang.StringBuilder sb, android.view.inputmethod.InputMethodSubtype inputMethodSubtype, android.content.Context context) {
        if (inputMethodSubtype != null) {
            try {
                sb.append("  [locale=");
                java.lang.String locale = inputMethodSubtype.getLocale();
                if (locale == null) {
                    locale = "null";
                }
                sb.append(locale);
                sb.append(" extras=");
                java.lang.String extraValue = inputMethodSubtype.getExtraValue();
                if (extraValue == null) {
                    extraValue = "null";
                }
                sb.append(extraValue);
                sb.append(" hash=");
                sb.append(inputMethodSubtype.hashCode());
                sb.append(" mode=");
                java.lang.String mode = inputMethodSubtype.getMode();
                if (mode == null) {
                    mode = "null";
                }
                sb.append(mode);
                if (android.os.Build.VERSION.SDK_INT >= 34) {
                    sb.append(" tag=");
                    java.lang.String languageTag = inputMethodSubtype.getLanguageTag();
                    if (languageTag == null) {
                        languageTag = "null";
                    }
                    sb.append(languageTag);
                }
                sb.append(" name=");
                java.lang.CharSequence displayName = inputMethodSubtype.getDisplayName(context, context.getPackageName(), context.getApplicationInfo());
                if (displayName == null) {
                    displayName = "null";
                }
                sb.append(displayName);
                appendProbe(sb, inputMethodSubtype, "KeyboardLayoutSet");
                appendProbe(sb, inputMethodSubtype, "pk");
                appendProbe(sb, inputMethodSubtype, "pk_language_tag");
                appendProbe(sb, inputMethodSubtype, "languageTag");
                appendProbe(sb, inputMethodSubtype, "layout");
                sb.append("]\n");
            } catch (java.lang.Throwable th) {
            }
        }
    }

    static int classifyLayout3(java.lang.String str, java.lang.String str2, int i) {
        if ((str == null ? "" : str.toLowerCase(java.util.Locale.US)).startsWith("bn")) {
            return ((str2 == null ? "" : str2.toLowerCase(java.util.Locale.US)).startsWith("en") || i == -486158728) ? 2 : 1;
        }
        return 3;
    }

    static java.lang.String convertToken(java.lang.String str, java.lang.String str2) {
        return com.akshaykadam.pixelboard.extension.rambler.GboardRamblerLoanSpell.token(str, str2);
    }

    static java.lang.String convertTokenLoan(java.lang.String str, java.lang.String str2) {
        java.lang.String voice2 = com.akshaykadam.pixelboard.extension.rambler.GboardRamblerLoanSpell.voice2(str, str2);
        if (voice2 != null) {
            return voice2;
        }
        java.util.HashSet<java.lang.String> hashSet = ENGLISH;
        if (hashSet == null || !hashSet.contains(str2)) {
            return convertToken(str, str2);
        }
        java.lang.String replaceAll = str.toLowerCase().replaceAll("([bcdfgklmnprstz])\\1", "$1").replaceAll("t(?!h)", "T").replaceAll("d(?!h)", "D");
        return convertToken(replaceAll, replaceAll.toLowerCase());
    }

    private static void dumpDiagToDownloads(android.content.Context context) {
        java.io.OutputStream openOutputStream;
        java.util.List<android.view.inputmethod.InputMethodSubtype> enabledInputMethodSubtypeList;
        if (context != null) {
            try {
                if (android.os.Build.VERSION.SDK_INT >= 29) {
                    java.lang.StringBuilder sb = new java.lang.StringBuilder();
                    sb.append("Rambler Bangla diag ");
                    sb.append(new java.util.Date().toString());
                    sb.append("\npkg=");
                    sb.append(context.getPackageName());
                    sb.append(" sdk=");
                    sb.append(android.os.Build.VERSION.SDK_INT);
                    sb.append("\n");
                    android.view.inputmethod.InputMethodManager inputMethodManager = (android.view.inputmethod.InputMethodManager) context.getSystemService("input_method");
                    if (inputMethodManager != null) {
                        sb.append("current subtype:\n");
                        appendSubtype(sb, inputMethodManager.getCurrentInputMethodSubtype(), context);
                        sb.append("all enabled subtypes for this IME:\n");
                        java.lang.String packageName = context.getPackageName();
                        java.util.List<android.view.inputmethod.InputMethodInfo> inputMethodList = inputMethodManager.getInputMethodList();
                        if (inputMethodList != null) {
                            int size = inputMethodList.size();
                            int i = 0;
                            while (true) {
                                if (i >= size) {
                                    break;
                                }
                                android.view.inputmethod.InputMethodInfo inputMethodInfo = inputMethodList.get(i);
                                if (inputMethodInfo == null || !packageName.equals(inputMethodInfo.getPackageName())) {
                                    i++;
                                } else if (inputMethodInfo != null && (enabledInputMethodSubtypeList = inputMethodManager.getEnabledInputMethodSubtypeList(inputMethodInfo, true)) != null) {
                                    int size2 = enabledInputMethodSubtypeList.size();
                                    for (int i2 = 0; i2 < size2; i2++) {
                                        appendSubtype(sb, enabledInputMethodSubtypeList.get(i2), context);
                                    }
                                }
                            }
                        }
                    }
                    sb.append("--- ring buffer ---\n");
                    java.util.ArrayList arrayList = diagBuffer;
                    if (arrayList != null) {
                        int size3 = arrayList.size();
                        for (int i3 = 0; i3 < size3; i3++) {
                            sb.append((java.lang.String) arrayList.get(i3));
                            sb.append("\n");
                        }
                    }
                    java.lang.String str = "RamblerBangla-diag-" + new java.text.SimpleDateFormat("yyyyMMdd-HHmmss", java.util.Locale.US).format(new java.util.Date()) + ".txt";
                    android.content.ContentValues contentValues = new android.content.ContentValues();
                    contentValues.put("_display_name", str);
                    contentValues.put("mime_type", "text/plain");
                    contentValues.put("relative_path", "Download/");
                    android.content.ContentResolver contentResolver = context.getContentResolver();
                    android.net.Uri insert = contentResolver.insert(android.provider.MediaStore.Downloads.getContentUri("external_primary"), contentValues);
                    if (insert == null || (openOutputStream = contentResolver.openOutputStream(insert)) == null) {
                        return;
                    }
                    openOutputStream.write(sb.toString().getBytes("UTF-8"));
                    openOutputStream.close();
                    android.widget.Toast.makeText(context, "Rambler diag saved to Downloads", 0).show();
                }
            } catch (java.lang.Throwable th) {
            }
        }
    }

    private static void logSubtype3(java.lang.String str, java.lang.String str2, java.lang.String str3, int i, int i2) {
        if (com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFixSettings.isDiagArmed()) {
            try {
                java.lang.StringBuilder sb = new java.lang.StringBuilder("subtype locale=");
                if (str == null) {
                    str = "null";
                }
                sb.append(str);
                sb.append(" extras=");
                if (str2 == null) {
                    str2 = "null";
                }
                sb.append(str2);
                sb.append(" tag=");
                if (str3 == null) {
                    str3 = "null";
                }
                sb.append(str3);
                sb.append(" hash=");
                sb.append(i);
                sb.append(" -> k");
                sb.append(i2);
                addDiag(sb.toString());
            } catch (java.lang.Throwable th) {
            }
        }
    }

    public static void onDiagToggled(boolean z) {
        if (z) {
            java.util.ArrayList arrayList = diagBuffer;
            if (arrayList != null) {
                arrayList.clear();
                return;
            }
            return;
        }
        android.content.Context currentApplication = com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFixSettings.currentApplication();
        if (currentApplication != null) {
            dumpDiagToDownloads(currentApplication);
        }
    }

    public static java.lang.String processVoice(java.lang.String str) {
        com.akshaykadam.pixelboard.extension.rambler.GboardRamblerLoanSpell.enterVoice();
        try {
            return com.akshaykadam.pixelboard.extension.rambler.GboardRamblerLoanSpell.exitText(str, process(str, null, true));
        } finally {
            com.akshaykadam.pixelboard.extension.rambler.GboardRamblerLoanSpell.exitVoice();
        }
    }

    static {
        java.util.HashMap hashMap = new java.util.HashMap();
        EXCEPTIONS = hashMap;
        hashMap.put("bhalo", "ভালো");
        hashMap.put("bohalo", "ভালো");
        hashMap.put("bhasha", "ভাষা");
        hashMap.put("bhalobasha", "ভালোবাসা");
        hashMap.put("bhalobashi", "ভালোবাসি");
        hashMap.put("bojho", "বোঝো");
        hashMap.put("bhor", "ভোর");
        hashMap.put("shob", "সব");
        hashMap.put("shobai", "সবাই");
        hashMap.put("shomoy", "সময়");
        hashMap.put("shathe", "সাথে");
        hashMap.put("shomossa", "সমস্যা");
        hashMap.put("shomosya", "সমস্যা");
        hashMap.put("shotto", "সত্য");
        hashMap.put("sotti", "সত্যি");
        hashMap.put("boi", "বই");
        hashMap.put("koi", "কই");
        hashMap.put("brishti", "বৃষ্টি");
        hashMap.put("bristi", "বৃষ্টি");
        hashMap.put("sristi", "সৃষ্টি");
        hashMap.put("shesh", "শেষ");
        hashMap.put("shono", "শোনো");
        hashMap.put("shonen", "শোনেন");
        hashMap.put("ashi", "আসি");
        hashMap.put("ashe", "আসে");
        hashMap.put("ashbe", "আসবে");
        hashMap.put("asben", "আসবেন");
        hashMap.put("asho", "আসো");
        hashMap.put("aslo", "আসলো");
        hashMap.put("asole", "আসলে");
        hashMap.put("asol", "আসল");
        hashMap.put("ashun", "আসুন");
        hashMap.put("basha", "বাসা");
        hashMap.put("borsha", "বর্ষা");
        hashMap.put("tomake", "তোমাকে");
        hashMap.put("tomar", "তোমার");
        hashMap.put("tomay", "তোমায়");
        hashMap.put("tomader", "তোমাদের");
        hashMap.put("kono", "কোনো");
        hashMap.put("boro", "বড়ো");
        hashMap.put("chhoto", "ছোট");
        hashMap.put("choto", "ছোট");
        hashMap.put("koto", "কত");
        hashMap.put("joto", "যত");
        hashMap.put("toto", "তত");
        hashMap.put("oto", "অত");
        hashMap.put("shoto", "শত");
        hashMap.put("mota", "মত");
        hashMap.put("howa", "হওয়া");
        hashMap.put("kew", "কেউ");
        hashMap.put("keu", "কেউ");
        hashMap.put("kothao", "কোথাও");
        hashMap.put("kothay", "কোথায়");
        hashMap.put("jodi", "যদি");
        hashMap.put("shokal", "সকাল");
        hashMap.put("shokale", "সকালে");
        hashMap.put("jinish", "জিনিস");
        hashMap.put("ekta", "একটা");
        hashMap.put("ekti", "একটি");
        hashMap.put("ektu", "একটু");
        hashMap.put("korchi", "করছি");
        hashMap.put("korchhe", "করছে");
        hashMap.put("korchho", "করছ");
        hashMap.put("korchhish", "করছিস");
        hashMap.put("korchhilam", "করছিলাম");
        hashMap.put("roj", "রোজ");
        hashMap.put("aschi", "আসছি");
        hashMap.put("porche", "পড়ছে");
        hashMap.put("jabo", "যাব");
        hashMap.put("jawa", "যাওয়া");
        hashMap.put("jawar", "যাওয়ার");
        hashMap.put("jeno", "যেন");
        hashMap.put("jora", "জোড়়া");
        hashMap.put("jor", "জোর");
        hashMap.put("jore", "জোরে");
        hashMap.put("jog", "যোগ");
        hashMap.put("jogajog", "যোগাযোগ");
        hashMap.put("jonno", "জন্য");
        hashMap.put("jonne", "জন্য");
        hashMap.put("jothesto", "যথেষ্ট");
        hashMap.put("jagah", "জাগা");
        hashMap.put("jatiyo", "জাতীয়");
        hashMap.put("soja", "সোজা");
        hashMap.put("sojha", "সোজা");
        hashMap.put("khoj", "খোঁজ");
        hashMap.put("khoje", "খোঁজে");
        hashMap.put("khojar", "খোঁজার");
        hashMap.put("khojo", "খোঁজো");
        hashMap.put("khojen", "খোঁজেন");
        hashMap.put("roja", "রোজা");
        hashMap.put("rojar", "রোজার");
        hashMap.put("pathao", "পাঠাও");
        hashMap.put("patha", "পাঠা");
        hashMap.put("pathai", "পাঠাই");
        hashMap.put("pathay", "পাঠায়");
        hashMap.put("pathiye", "পাঠিয়ে");
        hashMap.put("pathan", "পাঠান");
        hashMap.put("pathano", "পাঠানো");
        hashMap.put("pathanor", "পাঠানোর");
        hashMap.put("pathabe", "পাঠাবে");
        hashMap.put("pathaben", "পাঠাবেন");
        hashMap.put("pathacchi", "পাঠাচ্ছি");
        hashMap.put("pathacchhe", "পাঠাচ্ছে");
        hashMap.put("pathachhi", "পাঠাচ্ছি");
        hashMap.put("pathalam", "পাঠালাম");
        hashMap.put("pathalo", "পাঠালো");
        hashMap.put("pathalen", "পাঠালেন");
        hashMap.put("pathale", "পাঠালে");
        hashMap.put("pathali", "পাঠালি");
        hashMap.put("pathiechi", "পাঠিয়েছি");
        hashMap.put("thik", "ঠিক");
        hashMap.put("thikana", "ঠিকানা");
        hashMap.put("thanda", "ঠান্ডা");
        hashMap.put("thikthak", "ঠিকঠাক");
        hashMap.put("kalke", "কালকে");
        hashMap.put("kintu", "কিন্তু");
        hashMap.put("monta", "মনটা");
        hashMap.put("taratari", "তাড়়াতাড়়ি");
        hashMap.put("dhonnobad", "ধন্যবাদ");
        hashMap.put("eita", "এটা");
        hashMap.put("eitar", "এটার");
        hashMap.put("oita", "ওটা");
        hashMap.put("seita", "সেটা");
        hashMap.put("tajmahal", "তাজমহল");
        hashMap.put("ashbo", "আসবো");
        hashMap.put("asbo", "আসবো");
        hashMap.put("asbe", "আসবে");
        hashMap.put("asben", "আসবেন");
        hashMap.put("aste", "আসতে");
        hashMap.put("asun", "আসুন");
        hashMap.put("asen", "আসেন");
        hashMap.put("asi", "আসি");
        hashMap.put("aso", "আসো");
        hashMap.put("aslam", "আসলাম");
        hashMap.put("ache", "আছে");
        hashMap.put("achhe", "আছে");
        hashMap.put("achi", "আছি");
        hashMap.put("chhele", "ছেলে");
        hashMap.put("chheler", "ছেলের");
        hashMap.put("chhara", "ছাড়়া");
        hashMap.put("chhilo", "ছিল");
        hashMap.put("chilo", "ছিল");
        hashMap.put("chilam", "ছিলাম");
        hashMap.put("chilen", "ছিলেন");
        hashMap.put("chile", "ছিলে");
        hashMap.put("diyeche", "দিয়েছে");
        hashMap.put("diyechi", "দিয়েছি");
        hashMap.put("nieche", "নিয়েছে");
        hashMap.put("niechi", "নিয়েছি");
        hashMap.put("giyeche", "গিয়েছে");
        hashMap.put("giyechi", "গিয়েছি");
        hashMap.put("hoyeche", "হয়েছে");
        hashMap.put("hoyechi", "হয়েছি");
        hashMap.put("lagche", "লাগছে");
        hashMap.put("lagchhe", "লাগছে");
        hashMap.put("lagchi", "লাগছি");
        hashMap.put("legeche", "লেগেছে");
        hashMap.put("legechi", "লেগেছি");
        hashMap.put("dhaka", "ঢাকা");
        hashMap.put("dhakar", "ঢাকার");
        hashMap.put("dhakay", "ঢাকায়");
        hashMap.put("office", "অফিস");
        hashMap.put("maja", "মজা");
        hashMap.put("majar", "মজার");
        hashMap.put("moja", "মজা");
        hashMap.put("mojar", "মজার");
        hashMap.put("bolchi", "বলছি");
        hashMap.put("bolche", "বলছে");
        hashMap.put("bolchhe", "বলছে");
        hashMap.put("sunchi", "শুনছি");
        hashMap.put("sunche", "শুনছে");
        hashMap.put("khachi", "খাছি");
        hashMap.put("khache", "খাছে");
        hashMap.put("pachi", "পাছি");
        hashMap.put("pache", "পাছে");
        hashMap.put("dekhchi", "দেখছি");
        hashMap.put("dekhche", "দেখছে");
        hashMap.put("hoche", "হচ্ছে");
        hashMap.put("hochhe", "হচ্ছে");
        hashMap.put("hochhi", "হচ্ছি");
        hashMap.put("uthchi", "উঠছি");
        hashMap.put("uthche", "উঠছে");
        hashMap.put("ghumachi", "ঘুমাছি");
        hashMap.put("ghumache", "ঘুমাছে");
        hashMap.put("keyboard", "কিবোর্ড");
        hashMap.put("now", "নাউ");
        hashMap.put("kisu", "কিছু");
        hashMap.put("okkhor", "অক্ষর");
        hashMap.put("asce", "আসছে");
        hashMap.put("asche", "আসছে");
        hashMap.put("purota", "পুরাটা");
        hashMap.put("purotai", "পুরাটাই");
        hashMap.put("jache", "যাচ্ছে");
        hashMap.put("jachhe", "যাচ্ছে");
        hashMap.put("supposed", "সুপসেড");
        hashMap.put("typing", "টাইপিং");
        JOIN_PAIRS = new java.util.HashSet<>(java.util.Arrays.asList("kk", "tt", "dd", "nn", "pp", "mm", "TT", "DD", "NN", "kr", "gr", "tr", "dr", "pr", "br", "sr", "Sr", "ky", "gy", "cy", "ty", "py", "by", "ny", "ly", "tn", "tv", "db", "nd", "ndh", "mp", "mb", "lp", "sk", "st", "sth", "sp", "sm", "sn", "ShT", "ShTh", "ShN", "pt", "ddh", "gdh", "Ngk", "Ngg", "NYc", "NYch", "NYjh", "NTh", "ND", "NDh", "rn", "rT", "rg"));
        JHA_WORDS = new java.util.HashSet<>(java.util.Arrays.asList("aj", "ajke", "ajker", "laj", "kaj", "kaje", "kajer", "kajta", "kajei", "kajgulo", "baje", "bajey", "bajano", "sahaj", "sahaje", "nijer", "nijei", "nije", "nij", "nijke", "nijeder", "nijera", "taja", "tajar", "sajano", "sajai", "sajiye", "sajan", "dujon", "dujone", "dujonke", "bijoy", "bijoyer", "gajor", "jamai", "jani", "jano", "jana", "jante", "jantam", "janen", "janbe", "janiye", "janiyechi", "janlam", "janlen", "janano", "janai", "januk", "janey", "jiniser", "jinishgulo", "jibon", "jibone", "jayga", "jaygay", "jol", "jole", "jal", "jala", "jobab", "jobabe", "jotil", "joruri", "jomi", "jomin", "jomir", "jama", "jamar", "janala", "janalay", "joy", "jago", "jaga", "jagte", "jagche", "jagiye", "jagchhe", "jaglam", "jorimana", "joriman"));
        KEEP_TOKENS = new java.util.HashSet<>(java.util.Arrays.asList("melbourne", "sydney", "australia", "london", "dubai", "singapore", "tokyo", "paris", "perth", "brisbane", "adelaide", "america", "canada", "victoria"));
        VOWELS = new java.lang.String[][]{new java.lang.String[]{"aa", "আ", "া"}, new java.lang.String[]{"a", "আ", "া"}, new java.lang.String[]{"ee", "ই", "ি"}, new java.lang.String[]{"ii", "ঈ", "ী"}, new java.lang.String[]{"I", "ঈ", "ী"}, new java.lang.String[]{"i", "ই", "ি"}, new java.lang.String[]{"uu", "ঊ", "ু"}, new java.lang.String[]{"oo", "উ", "ু"}, new java.lang.String[]{"U", "ঊ", "ূ"}, new java.lang.String[]{"u", "উ", "ু"}, new java.lang.String[]{"E", "এ", "ে"}, new java.lang.String[]{"e", "এ", "ে"}, new java.lang.String[]{"oi", "ঐ", "ৈ"}, new java.lang.String[]{"OI", "ঐ", "ৈ"}, new java.lang.String[]{"ou", "ঔ", "ৌ"}, new java.lang.String[]{"OU", "ঔ", "ৌ"}, new java.lang.String[]{"ow", "ঔ", "ৌ"}, new java.lang.String[]{"O", "ও", O_KAR}, new java.lang.String[]{"o", "অ", ""}};
        CONSONANTS = new java.lang.String[][]{new java.lang.String[]{"kSh", "ক্ষ"}, new java.lang.String[]{"chh", "ছ"}, new java.lang.String[]{"Ng", "ঙ"}, new java.lang.String[]{"kh", "খ"}, new java.lang.String[]{"k", "ক"}, new java.lang.String[]{"gh", "ঘ"}, new java.lang.String[]{"g", "গ"}, new java.lang.String[]{"sh", "শ"}, new java.lang.String[]{"ch", "চ"}, new java.lang.String[]{"jh", "ঝ"}, new java.lang.String[]{"j", "য"}, new java.lang.String[]{"NY", "ঞ"}, new java.lang.String[]{"Th", "ঠ"}, new java.lang.String[]{"T", "ট"}, new java.lang.String[]{"Dh", "ঢ"}, new java.lang.String[]{"D", "ড"}, new java.lang.String[]{"N", "ণ"}, new java.lang.String[]{"th", "থ"}, new java.lang.String[]{"t", "ত"}, new java.lang.String[]{"dh", "ধ"}, new java.lang.String[]{"d", "দ"}, new java.lang.String[]{"n", "ন"}, new java.lang.String[]{"ph", "ফ"}, new java.lang.String[]{"p", "প"}, new java.lang.String[]{"f", "ফ"}, new java.lang.String[]{"bh", "ভ"}, new java.lang.String[]{"b", "ব"}, new java.lang.String[]{"v", "ভ"}, new java.lang.String[]{"m", "ম"}, new java.lang.String[]{"z", "জ"}, new java.lang.String[]{"r", "র"}, new java.lang.String[]{"l", "ল"}, new java.lang.String[]{"Sh", "ষ"}, new java.lang.String[]{"S", "শ"}, new java.lang.String[]{"s", "স"}, new java.lang.String[]{"h", "হ"}, new java.lang.String[]{"Rh", "ঢ়"}, new java.lang.String[]{"R", "ড়"}, new java.lang.String[]{"Y", "য়"}, new java.lang.String[]{"y", "য়"}, new java.lang.String[]{"q", "ক"}, new java.lang.String[]{"w", "ও"}};
        URL_SPAN = java.util.regex.Pattern.compile("https?://\\S+|\\S+@\\S+\\.[A-Za-z]{2,}|(?:[A-Za-z0-9-]+\\.)+[A-Za-z]{2,}(?:[/?#]\\S*)?");
        jvmLayoutKind = 0;
        PHRASE_JOINS = new java.lang.String[][]{new java.lang.String[]{"kal ke", "kalke"}};
        lastVoiceEngine = null;
    }

    private GboardRamblerScriptFix() {
    }

    public static java.lang.String process(java.lang.String str) {
        return process(str, null);
    }

    public static java.lang.String process(java.lang.String str, java.util.Locale locale) {
        return process(str, locale, false);
    }

    private static java.lang.String process(java.lang.String str, java.util.Locale locale, boolean z) {
        java.lang.String processInternal = processInternal(str, locale, z);
        if (str != null && processInternal != null) {
            com.akshaykadam.pixelboard.extension.rambler.GboardRamblerDiag.bump(processInternal.equals(str) ? "diag_process_unchanged" : "diag_process_changed");
        }
        return processInternal;
    }

    private static java.lang.String processInternal(java.lang.String input, java.util.Locale locale, boolean isVoice) {
        if (input != null && "ramblerdiag".equals(input)) {
            if (GboardRamblerScriptFixSettings.isDiagArmed()) {
                dumpDiagToDownloads(GboardRamblerScriptFixSettings.currentApplication());
                GboardRamblerScriptFixSettings.setDiagArmed(false);
            } else {
                GboardRamblerScriptFixSettings.setDiagArmed(true);
                if (diagBuffer != null) {
                    diagBuffer.clear();
                }
                android.content.Context app = GboardRamblerScriptFixSettings.currentApplication();
                if (app != null) {
                    android.widget.Toast.makeText(app, "Rambler diag armed - reproduce now, then type ramblerdiag again", android.widget.Toast.LENGTH_LONG).show();
                }
            }
        }
        addDiag2(isVoice ? "voice-in" : "typing-in", input);
        if (input == null || input.isEmpty()) {
            return input;
        }
        java.lang.String text = input;
        try {
            int layout = currentLayout3();
            if (isVoice) {
                if (!GboardRamblerScriptFixSettings.isEnabled()) {
                    addDiag("gate:mod-disabled");
                    return input;
                }
                if (layout == 3) {
                    addDiag("gate:voice-k3");
                    return input;
                }
            } else if (!gateOpen(locale)) {
                addDiag("gate:closed-typing");
                return input;
            }
            if (containsBengali(input)) {
                addDiag("skip:has-bengali");
                return input;
            }
            if (ensureDictionary() == 0) {
                addDiag("skip:dict-fail");
                return input;
            }
            text = joinSplitPhrases(input);
            boolean banglaOnlyLayout = (layout == 1);
            boolean voiceMultilingual = isVoice && (layout == 2);
            if (voiceMultilingual) {
                return GboardRamblerSegmentLock.process(text);
            }

            int len = text.length();
            boolean[] protectedChar = new boolean[len];
            java.util.regex.Matcher urlMatcher = URL_SPAN.matcher(text);
            while (urlMatcher.find()) {
                for (int p = urlMatcher.start(); p < urlMatcher.end() && p < len; p++) {
                    protectedChar[p] = true;
                }
            }

            java.util.ArrayList<java.lang.String> tokens = new java.util.ArrayList<>();
            java.util.ArrayList<java.lang.String> mapped = new java.util.ArrayList<>();
            java.util.ArrayList<java.lang.Integer> kind = new java.util.ArrayList<>();
            int idx = 0;
            while (idx < len) {
                char ch = text.charAt(idx);
                if (isLatinLetter(ch)) {
                    int end = idx + 1;
                    while (end < len && isLatinLetter(text.charAt(end))) {
                        end++;
                    }
                    java.lang.String tok = text.substring(idx, end);
                    tokens.add(tok);
                    java.lang.String conv = null;
                    int k = 0;
                    if (protectedChar[idx]) {
                        k = 6;
                    } else if (tok.length() == 1) {
                        k = 4;
                    } else if (!hasInternalUpper(tok)) {
                        boolean apostropheBefore = idx > 0 && (text.charAt(idx - 1) == '\'' || text.charAt(idx - 1) == '\u2019');
                        boolean apostropheAfter = end < len && (text.charAt(end) == '\'' || text.charAt(end) == '\u2019');
                        if (!apostropheBefore && !apostropheAfter) {
                            java.lang.String lo = tok.toLowerCase(java.util.Locale.US);
                            if (banglaOnlyLayout && FORCE_BANGLA.contains(lo)) {
                                conv = convertToken(isVoice ? lo : tok, lo);
                                k = conv != null ? 1 : 0;
                            } else if (ENGLISH.contains(lo)) {
                                if (KEEP_TOKENS.contains(lo)) {
                                    k = FORCE_BANGLA.contains(lo) ? 3 : 2;
                                } else {
                                    k = 2;
                                }
                            } else if (KEEP_TOKENS.contains(lo)) {
                                k = FORCE_BANGLA.contains(lo) ? 3 : 2;
                            } else {
                                conv = convertToken(isVoice ? lo : tok, lo);
                                k = conv != null ? 1 : 0;
                            }
                        }
                    }
                    mapped.add(conv);
                    kind.add(k);
                    idx = end;
                } else {
                    tokens.add(java.lang.String.valueOf(ch));
                    mapped.add(null);
                    kind.add(protectedChar[idx] ? 6 : 0);
                    idx++;
                }
            }

            boolean shouldConvert = banglaOnlyLayout;
            if (!shouldConvert) {
                int bnCount = 0;
                int enCount = 0;
                int forceCount = 0;
                for (int i = 0; i < tokens.size(); i++) {
                    int k = kind.get(i);
                    if (k == 1) {
                        bnCount++;
                    } else if (k == 2) {
                        enCount++;
                    } else if (k == 3 && tokens.get(i).length() >= 3) {
                        forceCount++;
                    }
                }
                int bnTotal = bnCount + forceCount;
                shouldConvert = bnTotal >= 1 && bnTotal >= enCount;
            }
            if (!shouldConvert) {
                if (!text.equals(input)) {
                    GboardRamblerDiag.bump("diag_join_only");
                }
                addDiag("out-unchanged");
                return input;
            }

            java.lang.StringBuilder sb = new java.lang.StringBuilder(len + 16);
            int convertedCount = 0;
            for (int i = 0; i < tokens.size(); i++) {
                java.lang.String tok = tokens.get(i);
                int k = kind.get(i);
                if (k == 6 || (tok.length() <= 1 && !isLatinLetter(tok.charAt(0)))) {
                    sb.append(tok);
                    continue;
                }
                java.lang.String outTok;
                if (tok.length() == 1) {
                    java.lang.String lo = tok.toLowerCase(java.util.Locale.US);
                    if (lo.equals("a")) {
                        outTok = "\u0986";
                    } else if (lo.equals("e")) {
                        outTok = "\u098f";
                    } else if (lo.equals("i")) {
                        outTok = "\u0986\u0987";
                    } else if (lo.equals("o")) {
                        outTok = "\u0993";
                    } else {
                        outTok = convertTokenLoan(tok, lo);
                    }
                } else {
                    outTok = mapped.get(i);
                    if (outTok == null) {
                        outTok = convertTokenLoan(tok, tok.toLowerCase(java.util.Locale.US));
                    }
                }
                if (outTok == null) {
                    java.lang.String normDisp = tok.replace("c", "k").replace("C", "K").replace("x", "ks").replace("X", "Ks");
                    java.lang.String normLo = tok.toLowerCase(java.util.Locale.US).replace("c", "k").replace("x", "ks");
                    outTok = convertTokenLoan(normDisp, normLo);
                }
                if (outTok != null) {
                    sb.append(outTok);
                    convertedCount++;
                } else {
                    sb.append(tok);
                }
            }
            if (convertedCount == 0) {
                if (!text.equals(input)) {
                    GboardRamblerDiag.bump("diag_join_only");
                }
                addDiag("out-unchanged");
                return input;
            }
            java.lang.String result = sb.toString();
            logi("converted=" + convertedCount + " in=[" + abbrev(text) + "] out=[" + abbrev(result) + "]");
            addDiag2("out-converted", result);
            GboardRamblerScriptFixSettings.incrementConverted();
            return result;
        } catch (java.lang.Throwable th) {
            logw(th);
            return text;
        }
    }

    private static boolean gateOpen(java.util.Locale locale) {
        if (!com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFixSettings.isEnabled()) {
            return false;
        }
        if (locale != null) {
            java.lang.String language = locale.getLanguage();
            return language != null && language.toLowerCase(java.util.Locale.US).startsWith("bn");
        }
        return isMultilingualBnActive();
    }

    private static boolean isMultilingualBnActive() {
        android.view.inputmethod.InputMethodSubtype currentInputMethodSubtype;
        java.lang.String locale;
        try {
            android.content.Context currentApplication = com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFixSettings.currentApplication();
            if (currentApplication == null) {
                return true;
            }
            android.view.inputmethod.InputMethodManager inputMethodManager = (android.view.inputmethod.InputMethodManager) currentApplication.getSystemService("input_method");
            if (inputMethodManager != null && (currentInputMethodSubtype = inputMethodManager.getCurrentInputMethodSubtype()) != null && (locale = currentInputMethodSubtype.getLocale()) != null) {
                if (locale.toLowerCase(java.util.Locale.US).startsWith("bn")) {
                    return true;
                }
            }
            return false;
        } catch (java.lang.Throwable th) {
            return false;
        }
    }

    static int classifyLayout(java.lang.String str, java.lang.String str2) {
        if (str != null && str.toLowerCase(java.util.Locale.US).startsWith("bn")) {
            return (str2 == null || !str2.contains("TrySuppressingImeSwitcher")) ? 1 : 2;
        }
        return 2;
    }

    private static int currentLayout3() {
        android.view.inputmethod.InputMethodManager inputMethodManager;
        android.view.inputmethod.InputMethodSubtype currentInputMethodSubtype;
        int i = 2;
        try {
            int i2 = jvmLayoutKind;
            if (i2 != 0) {
                return i2;
            }
            java.lang.String gboardTag = activeGboardLocale;
            if (gboardTag != null && !gboardTag.isEmpty()) {
                java.lang.String lower = gboardTag.toLowerCase(java.util.Locale.US).replace('_', '-');
                if (lower.startsWith("bn")) {
                    if (lower.contains("-latn")) {
                        return 2;
                    }
                    return 1;
                }
                if (lower.startsWith("en")) {
                    return com.akshaykadam.pixelboard.extension.rambler.GboardRamblerLayoutPair.adjust(3, lower, lower);
                }
            }
            android.content.Context currentApplication = com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFixSettings.currentApplication();
            if (currentApplication == null || (inputMethodManager = (android.view.inputmethod.InputMethodManager) currentApplication.getSystemService("input_method")) == null || (currentInputMethodSubtype = inputMethodManager.getCurrentInputMethodSubtype()) == null) {
                return 2;
            }
            java.lang.String locale = currentInputMethodSubtype.getLocale();
            java.lang.String languageTag = currentInputMethodSubtype.getLanguageTag();
            int hashCode = currentInputMethodSubtype.hashCode();
            java.lang.String extraValue = currentInputMethodSubtype.getExtraValue();
            i = com.akshaykadam.pixelboard.extension.rambler.GboardRamblerLayoutPair.adjust(classifyLayout3(locale, languageTag, hashCode), locale, languageTag);
            logSubtype3(locale, extraValue, languageTag, hashCode, i);
            return i;
        } catch (java.lang.Throwable th) {
            return i;
        }
    }

    public static int voiceLockKind() {
        int currentLayout3 = currentLayout3();
        if (currentLayout3 == 1) {
            return 1;
        }
        return currentLayout3 == 3 ? 2 : 0;
    }

    public static java.util.List<java.lang.Object> lockVoiceCandidates(java.util.List<java.lang.Object> list, java.lang.Object obj) {
        java.lang.Object obj2;
        com.akshaykadam.pixelboard.extension.rambler.GboardRamblerLoanSpell.preload();
        int voiceLockKind = voiceLockKind();
        if (voiceLockKind == 0 || list == null || list.isEmpty()) {
            return list;
        }
        java.lang.String str = voiceLockKind == 1 ? "bn" : "en";
        java.util.Iterator<java.lang.Object> it = list.iterator();
        while (true) {
            if (!it.hasNext()) {
                obj2 = null;
                break;
            }
            java.lang.Object next = it.next();
            if (packTagStartsWith(next, str)) {
                obj2 = next;
                break;
            }
        }
        if (obj2 != null || obj == null || !packTagStartsWith(obj, str)) {
            obj = obj2;
        }
        if (obj == null) {
            return list;
        }
        java.util.ArrayList arrayList = new java.util.ArrayList(1);
        arrayList.add(obj);
        return arrayList;
    }

    private static boolean packTagStartsWith(java.lang.Object obj, java.lang.String str) {
        if (obj == null) {
            return false;
        }
        try {
            java.lang.Object obj2 = obj.getClass().getField("n").get(obj);
            if (obj2 instanceof java.lang.String) {
                if (((java.lang.String) obj2).toLowerCase(java.util.Locale.US).startsWith(str)) {
                    return true;
                }
            }
            return false;
        } catch (java.lang.Throwable th) {
            return false;
        }
    }

    public static java.lang.String voiceDiagString() {
        java.lang.String str;
        java.lang.String str2;
        int currentLayout3 = currentLayout3();
        if (currentLayout3 == 1) {
            str = "bn-only";
        } else {
            str = currentLayout3 == 2 ? "multilingual" : currentLayout3 == 3 ? "english" : "unknown";
        }
        int voiceLockKind = voiceLockKind();
        if (voiceLockKind == 1) {
            str2 = "bn";
        } else {
            str2 = voiceLockKind == 2 ? "en" : "none";
        }
        return "layout=" + str + ", lock=" + str2 + ", fallbackTag=" + voiceLanguageTagFallback();
    }

    public static java.lang.String voiceLanguageTagFallback() {
        android.view.inputmethod.InputMethodManager inputMethodManager;
        android.view.inputmethod.InputMethodSubtype currentInputMethodSubtype;
        java.lang.String locale;
        try {
            android.content.Context currentApplication = com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFixSettings.currentApplication();
            if (currentApplication != null && (inputMethodManager = (android.view.inputmethod.InputMethodManager) currentApplication.getSystemService("input_method")) != null && (currentInputMethodSubtype = inputMethodManager.getCurrentInputMethodSubtype()) != null && (locale = currentInputMethodSubtype.getLocale()) != null && !locale.isEmpty()) {
                return java.util.Locale.forLanguageTag(locale.replace('_', '-')).toLanguageTag();
            }
        } catch (java.lang.Throwable th) {
        }
        return java.util.Locale.getDefault().toLanguageTag();
    }

    public static java.lang.String subtypeDiagString() {
        try {
            android.content.Context currentApplication = com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFixSettings.currentApplication();
            if (currentApplication == null) {
                return "ctx=null (jvm)";
            }
            android.view.inputmethod.InputMethodManager inputMethodManager = (android.view.inputmethod.InputMethodManager) currentApplication.getSystemService("input_method");
            if (inputMethodManager == null) {
                return "imm=null";
            }
            android.view.inputmethod.InputMethodSubtype currentInputMethodSubtype = inputMethodManager.getCurrentInputMethodSubtype();
            return currentInputMethodSubtype == null ? "subtype=null" : "locale=" + currentInputMethodSubtype.getLocale() + " mode=" + currentInputMethodSubtype.getMode() + " extras=" + currentInputMethodSubtype.getExtraValue();
        } catch (java.lang.Throwable th) {
            return "error: " + th.getClass().getSimpleName();
        }
    }

    static boolean hasInternalUpper(java.lang.String str) {
        for (int i = 1; i < str.length(); i++) {
            if (str.charAt(i) >= 'A' && str.charAt(i) <= 'Z') {
                return true;
            }
        }
        return false;
    }

    static boolean isLatinLetter(char c) {
        if (c < 'a' || c > 'z') {
            return c >= 'A' && c <= 'Z';
        }
        return true;
    }

    private static boolean containsBengali(java.lang.String str) {
        for (int i = 0; i < str.length(); i++) {
            char charAt = str.charAt(i);
            if (charAt >= 2432 && charAt <= 2559) {
                return true;
            }
        }
        return false;
    }

    static void logi(java.lang.String str) {
        try {
            android.util.Log.i(TAG, str);
        } catch (java.lang.Throwable th) {
            java.lang.System.out.println("RamblerScriptFix: " + str);
        }
    }

    private static void logw(java.lang.Throwable th) {
        try {
            android.util.Log.w(TAG, "process failed, returning original", th);
        } catch (java.lang.Throwable th2) {
            th.printStackTrace();
        }
    }

    static java.lang.String abbrev(java.lang.String str) {
        return str.length() <= 120 ? str : java.lang.String.valueOf(str.substring(0, 120)) + "...";
    }

    private static java.lang.String joinSplitPhrases(java.lang.String str) {
        for (java.lang.String[] strArr : PHRASE_JOINS) {
            str = replaceWordIgnoreCase(str, strArr[0], strArr[1]);
        }
        return str;
    }

    private static java.lang.String replaceWordIgnoreCase(java.lang.String str, java.lang.String str2, java.lang.String str3) {
        boolean z;
        java.lang.String lowerCase = str.toLowerCase();
        int length = str2.length();
        java.lang.StringBuilder sb = null;
        int i = 0;
        int i2 = 0;
        while (true) {
            int indexOf = lowerCase.indexOf(str2, i);
            if (indexOf < 0) {
                break;
            }
            boolean z2 = true;
            if (indexOf != 0 && isLatinLetter(str.charAt(indexOf - 1))) {
                z = false;
            } else {
                z = true;
            }
            int i3 = indexOf + length;
            if (i3 < str.length() && isLatinLetter(str.charAt(i3))) {
                z2 = false;
            }
            if (z && z2) {
                if (sb == null) {
                    sb = new java.lang.StringBuilder(str.length());
                }
                sb.append((java.lang.CharSequence) str, i2, indexOf).append(str3);
                i = i3;
                i2 = i;
            } else {
                i = i3;
            }
        }
        if (sb == null) {
            return str;
        }
        sb.append(str.substring(i2));
        return sb.toString();
    }

    static int ensureDictionary() {
        com.akshaykadam.pixelboard.extension.rambler.GboardRamblerLoanSpell.preload();
        if (ENGLISH == null) {
            ENGLISH = new java.util.HashSet<>(java.util.Arrays.asList(com.akshaykadam.pixelboard.extension.rambler.GboardRamblerEnglishWords.join().split(" ")));
        }
        return ENGLISH.size();
    }

    static java.lang.String convertTokenOrig(java.lang.String str, java.lang.String str2) {
        java.lang.String str3 = EXCEPTIONS.get(str2);
        if (str3 == null) {
            if (JHA_WORDS.contains(str2)) {
                str = str.replace('j', 'z').replace('J', 'Z');
            }
            return transliterate(str);
        }
        return str3;
    }

    private static java.lang.String transliterate(java.lang.String str) {
        java.lang.StringBuilder sb = new java.lang.StringBuilder(str.length() * 3);
        int length = str.length();
        int i = 0;
        boolean z = false;
        java.lang.String str2 = null;
        while (i < length) {
            if (matchAt(str, i, "ng")) {
                i += 2;
                boolean z2 = i < length && startsVowel(str, i);
                if (z) {
                    sb.append(HASANTA);
                }
                if (z2) {
                    sb.append("নগ");
                    z = true;
                } else {
                    sb.append(ANUSVARA);
                    z = false;
                }
                str2 = null;
            } else if (matchAt(str, i, "ri") && (i == 0 || z)) {
                if (z) {
                    sb.append("ৃ");
                } else {
                    sb.append("ঋ");
                }
                i += 2;
                z = false;
                str2 = null;
            } else if (matchAt(str, i, "cchh")) {
                if (z) {
                    sb.append(HASANTA);
                }
                sb.append("চ্ছ");
                i += 4;
                z = true;
                str2 = "chh";
            } else if (matchAt(str, i, "cch")) {
                if (z) {
                    sb.append(HASANTA);
                }
                sb.append("চ্ছ");
                i += 3;
                z = true;
                str2 = "chh";
            } else {
                java.lang.String[] matchVowel = matchVowel(str, i);
                if (matchVowel != null) {
                    if (z) {
                        if (matchVowel[0].equals("o") && i + 1 == length) {
                            sb.append(O_KAR);
                        } else {
                            sb.append(matchVowel[2]);
                        }
                    } else if (matchVowel[0].equals("o") && i > 0) {
                        sb.append("ও");
                    } else {
                        sb.append(matchVowel[1]);
                    }
                    i += matchVowel[0].length();
                    z = false;
                    str2 = null;
                } else {
                    java.lang.String[] matchConsonant = matchConsonant(str, i);
                    if (matchConsonant == null) {
                        return null;
                    }
                    if (z && str2 != null) {
                        if (!str2.equals("c") || !matchConsonant[0].equals("ch")) {
                            if (JOIN_PAIRS.contains(java.lang.String.valueOf(str2) + matchConsonant[0])) {
                                sb.append(HASANTA);
                            }
                        } else {
                            sb.append("্ছ");
                            i += 2;
                            z = true;
                            str2 = "chh";
                        }
                    }
                    sb.append(matchConsonant[1]);
                    str2 = matchConsonant[0];
                    i += str2.length();
                    z = true;
                }
            }
        }
        return sb.toString();
    }

    private static boolean startsVowel(java.lang.String str, int i) {
        if (matchVowel(str, i) != null) {
            return true;
        }
        int i2 = i + 1;
        return i2 < str.length() && str.charAt(i) == 'r' && str.charAt(i2) == 'i';
    }

    private static boolean matchAt(java.lang.String str, int i, java.lang.String str2) {
        return str.regionMatches(false, i, str2, 0, str2.length());
    }

    private static java.lang.String[] matchVowel(java.lang.String str, int i) {
        char charAt;
        java.lang.String[] strArr = null;
        for (java.lang.String[] strArr2 : VOWELS) {
            if (matchAt(str, i, strArr2[0]) && (strArr == null || strArr2[0].length() > strArr[0].length())) {
                strArr = strArr2;
            }
        }
        if (strArr == null && i < str.length() && (charAt = str.charAt(i)) >= 'A' && charAt <= 'Z') {
            java.lang.String valueOf = java.lang.String.valueOf((char) (charAt + ' '));
            for (java.lang.String[] strArr3 : VOWELS) {
                if (strArr3[0].length() == 1 && strArr3[0].equals(valueOf)) {
                    return strArr3;
                }
            }
        }
        return strArr;
    }

    private static java.lang.String[] matchConsonant(java.lang.String str, int i) {
        char charAt;
        java.lang.String[] strArr = null;
        for (java.lang.String[] strArr2 : CONSONANTS) {
            if (matchAt(str, i, strArr2[0]) && (strArr == null || strArr2[0].length() > strArr[0].length())) {
                strArr = strArr2;
            }
        }
        if (strArr == null && i < str.length() && (charAt = str.charAt(i)) >= 'A' && charAt <= 'Z') {
            java.lang.String valueOf = java.lang.String.valueOf((char) (charAt + ' '));
            for (java.lang.String[] strArr3 : CONSONANTS) {
                if (strArr3[0].length() == 1 && strArr3[0].equals(valueOf)) {
                    return strArr3;
                }
            }
        }
        return strArr;
    }

    public static void recordEngine(java.lang.Object obj) {
        java.lang.String obj2;
        if (obj == null) {
            obj2 = "null";
        } else {
            try {
                obj2 = obj.toString();
            } catch (java.lang.Throwable th) {
                lastVoiceEngine = "error";
                return;
            }
        }
        lastVoiceEngine = obj2;
    }

    public static java.lang.String engineDiagString() {
        java.lang.String str = lastVoiceEngine;
        java.lang.StringBuilder sb = new java.lang.StringBuilder("engine=");
        if (str == null) {
            str = "none-yet";
        }
        return sb.append(str).toString();
    }
}
