package of;

import android.graphics.Color;

/* loaded from: classes3.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final String f80366a;

    /* renamed from: b, reason: collision with root package name */
    public final int f80367b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f80368c;

    /* renamed from: d, reason: collision with root package name */
    public final Integer f80369d;

    /* renamed from: e, reason: collision with root package name */
    public final float f80370e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f80371f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f80372g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f80373h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f80374i;

    /* renamed from: j, reason: collision with root package name */
    public final int f80375j;

    public e(String str, int i5, Integer num, Integer num2, float f11, boolean z11, boolean z12, boolean z13, boolean z14, int i11) {
        this.f80366a = str;
        this.f80367b = i5;
        this.f80368c = num;
        this.f80369d = num2;
        this.f80370e = f11;
        this.f80371f = z11;
        this.f80372g = z12;
        this.f80373h = z13;
        this.f80374i = z14;
        this.f80375j = i11;
    }

    public static int a(String str) throws NumberFormatException {
        boolean z11;
        try {
            int i5 = Integer.parseInt(str.trim());
            switch (i5) {
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                    z11 = true;
                    break;
                default:
                    z11 = false;
                    break;
            }
            if (z11) {
                return i5;
            }
        } catch (NumberFormatException unused) {
        }
        qm.e.f("Ignoring unknown alignment: ", str, "SsaStyle");
        return -1;
    }

    public static boolean b(String str) throws NumberFormatException {
        try {
            int i5 = Integer.parseInt(str);
            return i5 == 1 || i5 == -1;
        } catch (NumberFormatException e3) {
            wf.a.E("SsaStyle", "Failed to parse boolean value: '" + str + "'", e3);
            return false;
        }
    }

    public static Integer c(String str) {
        try {
            long j11 = str.startsWith("&H") ? Long.parseLong(str.substring(2), 16) : Long.parseLong(str);
            wf.a.e(j11 <= 4294967295L);
            return Integer.valueOf(Color.argb(ul.b.s(((j11 >> 24) & 255) ^ 255), ul.b.s(j11 & 255), ul.b.s((j11 >> 8) & 255), ul.b.s((j11 >> 16) & 255)));
        } catch (IllegalArgumentException e3) {
            wf.a.E("SsaStyle", "Failed to parse color expression: '" + str + "'", e3);
            return null;
        }
    }
}
