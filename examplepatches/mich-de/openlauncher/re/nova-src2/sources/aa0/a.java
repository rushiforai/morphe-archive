package aa0;

import b.hb;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes5.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final Pattern f666a = Pattern.compile("[\\\\&]");

    /* renamed from: b, reason: collision with root package name */
    public static final Pattern f667b = Pattern.compile("\\\\[!\"#$%&'()*+,./:;<=>?@\\[\\\\\\]^_`{|}~-]|&(?:#x[a-f0-9]{1,6}|#[0-9]{1,7}|[a-z][a-z0-9]{1,31});", 2);

    /* renamed from: c, reason: collision with root package name */
    public static final Pattern f668c;

    /* renamed from: d, reason: collision with root package name */
    public static final hb f669d;

    static {
        Pattern.compile("(%[a-fA-F0-9]{0,2}|[^:/?#@!$&'()*+,;=a-zA-Z0-9\\-._~])");
        f668c = Pattern.compile("[ \t\r\n]+");
        f669d = new hb(1);
    }

    public static String a(String str) {
        if (!f666a.matcher(str).find()) {
            return str;
        }
        Matcher matcher = f667b.matcher(str);
        if (!matcher.find()) {
            return str;
        }
        StringBuilder sb2 = new StringBuilder(str.length() + 16);
        int iEnd = 0;
        do {
            sb2.append((CharSequence) str, iEnd, matcher.start());
            String strGroup = matcher.group();
            f669d.getClass();
            if (strGroup.charAt(0) == '\\') {
                sb2.append((CharSequence) strGroup, 1, strGroup.length());
            } else {
                sb2.append(b.a(strGroup));
            }
            iEnd = matcher.end();
        } while (matcher.find());
        if (iEnd != str.length()) {
            sb2.append((CharSequence) str, iEnd, str.length());
        }
        return sb2.toString();
    }
}
