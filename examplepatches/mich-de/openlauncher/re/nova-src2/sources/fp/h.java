package fp;

import cp.a0;
import cp.x;
import cp.z;
import java.util.Calendar;
import java.util.GregorianCalendar;

/* loaded from: classes4.dex */
public final class h implements a0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55506a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f55507b;

    public /* synthetic */ h(Object obj, int i5) {
        this.f55506a = i5;
        this.f55507b = obj;
    }

    @Override // cp.a0
    public final z a(cp.m mVar, jp.a aVar) {
        switch (this.f55506a) {
            case 0:
                if (aVar.f69629a == Number.class) {
                    return (i) this.f55507b;
                }
                return null;
            case 1:
                if (aVar.f69629a == Object.class) {
                    return new j(mVar, (x) this.f55507b);
                }
                return null;
            default:
                Class cls = aVar.f69629a;
                if (cls == Calendar.class || cls == GregorianCalendar.class) {
                    return (g) this.f55507b;
                }
                return null;
        }
    }

    public String toString() {
        switch (this.f55506a) {
            case 2:
                return "Factory[type=" + Calendar.class.getName() + "+" + GregorianCalendar.class.getName() + ",adapter=" + ((g) this.f55507b) + "]";
            default:
                return super.toString();
        }
    }
}
