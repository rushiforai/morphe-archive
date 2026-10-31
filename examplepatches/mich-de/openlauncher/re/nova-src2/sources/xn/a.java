package xn;

import b.i8;
import java.util.Date;
import java.util.Iterator;
import org.json.JSONException;
import un.k;

/* loaded from: classes.dex */
public final class a implements d {

    /* renamed from: f, reason: collision with root package name */
    public static final a f96175f;

    /* renamed from: a, reason: collision with root package name */
    public i8 f96176a;

    /* renamed from: b, reason: collision with root package name */
    public Date f96177b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f96178c;

    /* renamed from: d, reason: collision with root package name */
    public e f96179d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f96180e;

    static {
        e eVar = new e();
        a aVar = new a();
        aVar.f96176a = new i8(3);
        aVar.f96179d = eVar;
        f96175f = aVar;
    }

    @Override // xn.d
    public final void a(boolean z11) throws JSONException {
        if (!this.f96180e && z11) {
            this.f96176a.getClass();
            Date date = new Date();
            Date date2 = this.f96177b;
            if (date2 == null || date.after(date2)) {
                this.f96177b = date;
                if (this.f96178c) {
                    Iterator it = c.c().a().iterator();
                    while (it.hasNext()) {
                        zn.a aVarF = ((k) it.next()).f();
                        Date date3 = this.f96177b;
                        aVarF.c(date3 != null ? (Date) date3.clone() : null);
                    }
                }
            }
        }
        this.f96180e = z11;
    }
}
