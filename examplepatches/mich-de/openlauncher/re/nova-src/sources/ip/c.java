package ip;

import java.sql.Date;
import java.sql.Timestamp;

/* loaded from: classes4.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final boolean f67954a;

    /* renamed from: b, reason: collision with root package name */
    public static final b f67955b;

    /* renamed from: c, reason: collision with root package name */
    public static final b f67956c;

    /* renamed from: d, reason: collision with root package name */
    public static final fp.a f67957d;

    /* renamed from: e, reason: collision with root package name */
    public static final fp.a f67958e;

    /* renamed from: f, reason: collision with root package name */
    public static final fp.a f67959f;

    static {
        boolean z11;
        try {
            Class.forName("java.sql.Date");
            z11 = true;
        } catch (ClassNotFoundException unused) {
            z11 = false;
        }
        f67954a = z11;
        if (z11) {
            f67955b = new b(Date.class, 0);
            f67956c = new b(Timestamp.class, 1);
            f67957d = a.f67948c;
            f67958e = a.f67949d;
            f67959f = a.f67950e;
            return;
        }
        f67955b = null;
        f67956c = null;
        f67957d = null;
        f67958e = null;
        f67959f = null;
    }
}
