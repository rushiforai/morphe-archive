package ln;

import java.sql.Date;
import java.sql.Timestamp;
import ln.a;
import ln.b;

/* loaded from: classes.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public static final boolean f75060a;

    /* renamed from: b, reason: collision with root package name */
    public static final e f75061b;

    /* renamed from: c, reason: collision with root package name */
    public static final e f75062c;

    /* renamed from: d, reason: collision with root package name */
    public static final a.C0357a f75063d;

    /* renamed from: e, reason: collision with root package name */
    public static final b.a f75064e;

    /* renamed from: f, reason: collision with root package name */
    public static final c f75065f;

    static {
        boolean z11;
        try {
            Class.forName("java.sql.Date");
            z11 = true;
        } catch (ClassNotFoundException unused) {
            z11 = false;
        }
        f75060a = z11;
        if (z11) {
            f75061b = new e(Date.class, 0);
            f75062c = new e(Timestamp.class, 1);
            f75063d = a.f75053b;
            f75064e = b.f75055b;
            f75065f = d.f75057b;
            return;
        }
        f75061b = null;
        f75062c = null;
        f75063d = null;
        f75064e = null;
        f75065f = null;
    }
}
