package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mob implements lpb, p3b {
    public kpb a;
    public qob b;
    public String c;
    public Object d;
    public Object[] e;
    public pob f;
    public final i5b g = new i5b(11, this);

    public mob(kpb kpbVar, qob qobVar, String str, Object obj, Object[] objArr) {
        this.a = kpbVar;
        this.b = qobVar;
        this.c = str;
        this.d = obj;
        this.e = objArr;
    }

    @Override // defpackage.lpb
    public final boolean a(Object obj) {
        qob qobVar = this.b;
        return qobVar == null || qobVar.a(obj);
    }

    @Override // defpackage.p3b
    public final void b() {
        pob pobVar = this.f;
        if (pobVar != null) {
            ((vwa) pobVar).F();
        }
    }

    @Override // defpackage.p3b
    public final void c() {
        pob pobVar = this.f;
        if (pobVar != null) {
            ((vwa) pobVar).F();
        }
    }

    @Override // defpackage.p3b
    public final void d() {
        e();
    }

    public final void e() {
        String strY;
        qob qobVar = this.b;
        if (this.f != null) {
            rd6.v("entry(", this.f, ") is not null");
            return;
        }
        if (qobVar != null) {
            i5b i5bVar = this.g;
            Object objInvoke = i5bVar.invoke();
            if (objInvoke == null || qobVar.a(objInvoke)) {
                this.f = qobVar.b(this.c, i5bVar);
                return;
            }
            if (objInvoke instanceof yic) {
                yic yicVar = (yic) objInvoke;
                if (yicVar.b() == y3b.h || yicVar.b() == xsa.h || yicVar.b() == uob.g) {
                    strY = "MutableState containing " + yicVar.getValue() + " cannot be saved using the current SaveableStateRegistry. The default implementation only supports types which can be stored inside the Bundle. Please consider implementing a custom Saver for this class and pass it as a stateSaver parameter to rememberSaveable().";
                } else {
                    strY = "If you use a custom SnapshotMutationPolicy for your MutableState you have to write a custom Saver";
                }
            } else {
                strY = hp7.y(objInvoke);
            }
            throw new IllegalArgumentException(strY);
        }
    }
}
