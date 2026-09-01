package defpackage;

import java.util.Calendar;
import java.util.GregorianCalendar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dm8 implements kud {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ dm8(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.kud
    public final jud a(ch5 ch5Var, kxd kxdVar) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                if (kxdVar.c() == Number.class) {
                    return (fm8) obj;
                }
                return null;
            case 1:
                if (kxdVar.c() == Object.class) {
                    return new um8(ch5Var, (umd) obj);
                }
                return null;
            default:
                Class clsC = kxdVar.c();
                if (clsC == Calendar.class || clsC == GregorianCalendar.class) {
                    return (n96) obj;
                }
                return null;
        }
    }

    public String toString() {
        switch (this.a) {
            case 2:
                return "Factory[type=" + Calendar.class.getName() + "+" + GregorianCalendar.class.getName() + ",adapter=" + ((n96) this.b) + "]";
            default:
                return super.toString();
        }
    }
}
