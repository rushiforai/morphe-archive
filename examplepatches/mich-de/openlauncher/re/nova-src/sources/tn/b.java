package tn;

import b.c0;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final Pattern f89542a = Pattern.compile("<(head)( [^>]*)?>", 2);

    /* renamed from: b, reason: collision with root package name */
    public static final Pattern f89543b = Pattern.compile("<(head)( [^>]*)?/>", 2);

    /* renamed from: c, reason: collision with root package name */
    public static final Pattern f89544c = Pattern.compile("<(body)( [^>]*?)?>", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final Pattern f89545d = Pattern.compile("<(body)( [^>]*?)?/>", 2);

    /* renamed from: e, reason: collision with root package name */
    public static final Pattern f89546e = Pattern.compile("<(html)( [^>]*?)?>", 2);

    /* renamed from: f, reason: collision with root package name */
    public static final Pattern f89547f = Pattern.compile("<(html)( [^>]*?)?/>", 2);

    /* renamed from: g, reason: collision with root package name */
    public static final Pattern f89548g = Pattern.compile("<!DOCTYPE [^>]*>", 2);

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0025, code lost:
    
        r1 = r2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean a(String str, StringBuilder sb2, Pattern pattern, String str2, int[][] iArr) {
        int i5;
        Matcher matcher = pattern.matcher(str);
        int i11 = 0;
        while (matcher.find(i11)) {
            int iStart = matcher.start();
            int iEnd = matcher.end();
            if (iArr != null) {
                for (int[] iArr2 : iArr) {
                    i5 = (iStart < iArr2[0] || iStart > iArr2[1]) ? i5 + 1 : 0;
                }
            }
            sb2.append(str.substring(0, matcher.end()));
            sb2.append(str2);
            sb2.append(str.substring(matcher.end()));
            return true;
        }
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0025, code lost:
    
        r1 = r2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean b(String str, StringBuilder sb2, Pattern pattern, String str2, int[][] iArr) {
        int i5;
        Matcher matcher = pattern.matcher(str);
        int i11 = 0;
        while (matcher.find(i11)) {
            int iStart = matcher.start();
            int iEnd = matcher.end();
            if (iArr != null) {
                for (int[] iArr2 : iArr) {
                    i5 = (iStart < iArr2[0] || iStart > iArr2[1]) ? i5 + 1 : 0;
                }
            }
            sb2.append(str.substring(0, matcher.end() - 2));
            c0.C(sb2, ">", str2, "</");
            sb2.append(matcher.group(1));
            sb2.append(">");
            sb2.append(str.substring(matcher.end()));
            return true;
        }
        return false;
    }
}
