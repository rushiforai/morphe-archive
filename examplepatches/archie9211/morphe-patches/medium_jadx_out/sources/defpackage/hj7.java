package defpackage;

import java.util.Iterator;
import java.util.regex.Matcher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hj7 extends t0 {
    public final /* synthetic */ int a;
    public final Object b;

    public /* synthetic */ hj7(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.t0, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        switch (this.a) {
            case 0:
                if (obj == null ? true : obj instanceof cj7) {
                    return super.contains((cj7) obj);
                }
                return false;
            default:
                return ((k89) this.b).containsValue(obj);
        }
    }

    public cj7 d(int i) {
        Matcher matcher = ((ij7) this.b).a;
        n46 n46VarW = iq7.W(matcher.start(i), matcher.end(i));
        if (n46VarW.a < 0) {
            return null;
        }
        String strGroup = matcher.group(i);
        strGroup.getClass();
        return new cj7(strGroup, n46VarW);
    }

    @Override // defpackage.t0
    public final int getSize() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((ij7) obj).a.groupCount() + 1;
            default:
                return ((k89) obj).b;
        }
    }

    @Override // defpackage.t0, java.util.Collection, java.util.List
    public boolean isEmpty() {
        switch (this.a) {
            case 0:
                return false;
            default:
                return super.isEmpty();
        }
    }

    @Override // java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        switch (this.a) {
            case 0:
                return new rrd(new srd(new j80(1, d46.J(this)), new ff4(26, this)));
            default:
                zsd zsdVar = ((k89) this.b).a;
                atd[] atdVarArr = new atd[8];
                for (int i = 0; i < 8; i++) {
                    atdVarArr[i] = new btd(2);
                }
                return new s89(zsdVar, atdVarArr);
        }
    }
}
