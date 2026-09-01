package defpackage;

import javax.net.ssl.SSLPeerUnverifiedException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class z23 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m45 b;

    public /* synthetic */ z23(j57 j57Var, m45 m45Var, b55 b55Var) {
        this.a = 5;
        this.b = m45Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        float f;
        int i = this.a;
        c1e c1eVar = c1e.a;
        m45 m45Var = this.b;
        switch (i) {
            case 0:
                break;
            case 1:
                break;
            case 2:
                break;
            case 3:
                try {
                } catch (SSLPeerUnverifiedException unused) {
                    return ey3.a;
                }
                break;
            case 4:
                m45Var.invoke();
                break;
            case 5:
                m45Var.invoke();
                break;
            case 6:
                m45Var.invoke();
                break;
            case 7:
                m45Var.invoke();
                break;
            case 8:
                m45Var.invoke();
                break;
            case 9:
                m45Var.invoke();
                break;
            case 10:
                m45Var.invoke();
                break;
            case 11:
                float fFloatValue = ((Number) m45Var.invoke()).floatValue();
                f = fFloatValue >= 0.0f ? fFloatValue : 0.0f;
                break;
            case 12:
                float fFloatValue2 = ((Number) m45Var.invoke()).floatValue();
                f = fFloatValue2 >= 0.0f ? fFloatValue2 : 0.0f;
                break;
            case 13:
                m45Var.invoke();
                break;
            case 14:
                m45Var.invoke();
                break;
            case 15:
                m45Var.invoke();
                break;
            default:
                m45Var.invoke();
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ z23(int i, m45 m45Var) {
        this.a = i;
        this.b = m45Var;
    }
}
