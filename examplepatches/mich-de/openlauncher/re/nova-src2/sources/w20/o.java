package w20;

import kotlin.text.Regex;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import tx.g4;

/* loaded from: classes.dex */
public abstract class o {

    /* renamed from: a, reason: collision with root package name */
    public static final Regex f93705a = new Regex("[^ ()\\-.,'\"@?=\\\\/]");

    /* renamed from: b, reason: collision with root package name */
    public static final Regex f93706b = new Regex("((?i:http|https|rtsp|ftp)://)(?:(?:[a-zA-Z0-9\\$\\-\\_\\.\\+\\!\\*\\'\\(\\)\\,\\;\\?\\&\\=]|(?:\\%[a-fA-F0-9]{2})){1,64}(?:\\:(?:[a-zA-Z0-9\\$\\-\\_\\.\\+\\!\\*\\'\\(\\)\\,\\;\\?\\&\\=]|(?:\\%[a-fA-F0-9]{2})){1,25})?\\@)?([a-zA-Z0-9[ -\ud7ff豈-﷏ﷰ-\uffef𐀀-\u1fffd𠀀-\u2fffd𰀀-\u3fffd\u40000-\u4fffd\u50000-\u5fffd\u60000-\u6fffd\u70000-\u7fffd\u80000-\u8fffd\u90000-\u9fffd\ua0000-\uafffd\ub0000-\ubfffd\uc0000-\ucfffd\ud0000-\udfffd\ue1000-\uefffd&&[^ [\u2000-\u200a]\u2028\u2029 \u3000]]](?:[a-zA-Z0-9[ -\ud7ff豈-﷏ﷰ-\uffef𐀀-\u1fffd𠀀-\u2fffd𰀀-\u3fffd\u40000-\u4fffd\u50000-\u5fffd\u60000-\u6fffd\u70000-\u7fffd\u80000-\u8fffd\u90000-\u9fffd\ua0000-\uafffd\ub0000-\ubfffd\uc0000-\ucfffd\ud0000-\udfffd\ue1000-\uefffd&&[^ [\u2000-\u200a]\u2028\u2029 \u3000]]_\\-.])*(?:\\:\\d{1,5})?(?:[/\\?](?:(?:[a-zA-Z0-9[ -\ud7ff豈-﷏ﷰ-\uffef𐀀-\u1fffd𠀀-\u2fffd𰀀-\u3fffd\u40000-\u4fffd\u50000-\u5fffd\u60000-\u6fffd\u70000-\u7fffd\u80000-\u8fffd\u90000-\u9fffd\ua0000-\uafffd\ub0000-\ubfffd\uc0000-\ucfffd\ud0000-\udfffd\ue1000-\uefffd&&[^ [\u2000-\u200a]\u2028\u2029 \u3000]];/\\?:@&=#~\\-\\.\\+!\\*'\\(\\),_\\$])|(?:%[a-fA-F0-9]{2}))*)?)");

    /* renamed from: c, reason: collision with root package name */
    public static final Regex f93707c = new Regex("([a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,64})\\@([a-zA-Z0-9][a-zA-Z0-9\\-\\.]{1,255})");

    /* renamed from: d, reason: collision with root package name */
    public static final Regex f93708d = new Regex("\\b((25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[0-9]))\\b");

    /* renamed from: e, reason: collision with root package name */
    public static final Regex f93709e = new Regex("\\b((?:tel|sip|sms|smsto|mailto|nfc|shortcut_id)[:=])([^\\s;]+)");

    /* renamed from: f, reason: collision with root package name */
    public static final Regex f93710f = new Regex("\\bcontent://(\\S*?)((?:/\\S*)?/[^.\\s]*)(\\.[^\\s/]+)?");

    /* renamed from: g, reason: collision with root package name */
    public static final Regex f93711g = new Regex("/(storage|sdcard)((?:/[^\\s/]+)+)(/[^\\s/.]*)(\\.[^\\s/]+)?\\b");

    /* renamed from: h, reason: collision with root package name */
    public static final Regex f93712h = new Regex("\\bComponentInfo\\{(.*?)\\}");

    /* renamed from: i, reason: collision with root package name */
    public static final Regex f93713i = new Regex("\\b(\\d+\\.\\d{6},-?\\d+\\.\\d{6})\\b");

    /* renamed from: j, reason: collision with root package name */
    public static final Regex f93714j = new Regex("([tT]oken\":)\"(.*?)\"");

    public static final String a(CharSequence charSequence) {
        return f93714j.g(f93713i.g(f93712h.g(f93711g.g(f93710f.g(f93709e.g(f93706b.g(f93708d.g(f93707c.g(charSequence, new g4(12)), new g4(13)), new g4(14)), new g4(15)), new g4(16)), new g4(17)), new g4(18)), new g4(19)), new g4(20));
    }

    public static final String b(CharSequence charSequence) {
        if (charSequence == null) {
            return AbstractJsonLexerKt.NULL;
        }
        if (charSequence.length() == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        char cD1 = r70.l.D1(charSequence);
        boolean zIsLetterOrDigit = Character.isLetterOrDigit(cD1);
        Regex regex = f93705a;
        if (!zIsLetterOrDigit) {
            return regex.h("_", charSequence);
        }
        return cD1 + regex.h("_", charSequence.subSequence(1, charSequence.length()).toString());
    }
}
