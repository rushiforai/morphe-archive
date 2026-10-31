package f30;

import java.lang.reflect.Field;
import java.util.Locale;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final String f54293a;

    /* renamed from: b, reason: collision with root package name */
    public final int f54294b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f54295c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f54296d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f54297e;

    /* renamed from: f, reason: collision with root package name */
    public final String f54298f;

    public c(String str, int i5, boolean z11, boolean z12, boolean z13, String str2, Field field) throws SecurityException {
        this.f54293a = str.toLowerCase(Locale.ENGLISH);
        this.f54294b = i5;
        this.f54295c = z11;
        this.f54296d = z12;
        this.f54297e = z13;
        this.f54298f = str2;
        field.setAccessible(true);
    }
}
