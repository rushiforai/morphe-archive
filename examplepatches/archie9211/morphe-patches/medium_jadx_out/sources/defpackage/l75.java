package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class l75 extends s75 {
    public final zf4 a;

    public l75(k75 k75Var) {
        k75Var.b.f();
        k75Var.c = false;
        this.a = k75Var.b;
    }

    public final boolean g() {
        ngc ngcVar = this.a.a;
        int i = 0;
        while (true) {
            if (i >= ngcVar.b.size()) {
                Iterator it2 = ngcVar.c().iterator();
                while (it2.hasNext()) {
                    if (!zf4.e((Map.Entry) it2.next())) {
                    }
                }
                return true;
            }
            if (!zf4.e((Map.Entry) ngcVar.b.get(i))) {
                break;
            }
            i++;
        }
        return false;
    }

    public final int h() {
        ngc ngcVar = this.a.a;
        int iD = 0;
        for (int i = 0; i < ngcVar.b.size(); i++) {
            Map.Entry entry = (Map.Entry) ngcVar.b.get(i);
            iD += zf4.d((m75) entry.getKey(), entry.getValue());
        }
        for (Map.Entry entry2 : ngcVar.c()) {
            iD += zf4.d((m75) entry2.getKey(), entry2.getValue());
        }
        return iD;
    }

    public final Object i(o75 o75Var) {
        m(o75Var);
        m75 m75Var = o75Var.d;
        Object obj = this.a.a.get(m75Var);
        if (obj == null) {
            return o75Var.b;
        }
        if (!m75Var.c) {
            return o75Var.a(obj);
        }
        if (m75Var.b.getJavaType() != n6f.ENUM) {
            return obj;
        }
        ArrayList arrayList = new ArrayList();
        Iterator it2 = ((List) obj).iterator();
        while (it2.hasNext()) {
            arrayList.add(o75Var.a(it2.next()));
        }
        return arrayList;
    }

    public final boolean j(o75 o75Var) {
        m(o75Var);
        m75 m75Var = o75Var.d;
        zf4 zf4Var = this.a;
        zf4Var.getClass();
        if (!m75Var.c) {
            return zf4Var.a.get(m75Var) != null;
        }
        ay0.e("hasField() can only be called on non-repeated fields.");
        return false;
    }

    public final void k() {
        this.a.f();
    }

    /* JADX WARN: Removed duplicated region for block: B:4:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean l(defpackage.tp1 r9, defpackage.h30 r10, defpackage.q74 r11, int r12) throws kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException {
        /*
            Method dump skipped, instruction units count: 274
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.l75.l(tp1, h30, q74, int):boolean");
    }

    public final void m(o75 o75Var) {
        if (o75Var.a == getDefaultInstanceForType()) {
            return;
        }
        ay0.e("This extension is for a different message type.  Please make sure that you are not suppressing any generics type warnings.");
    }

    public l75() {
        this.a = new zf4();
    }
}
