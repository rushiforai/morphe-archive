package m3;

/* loaded from: classes.dex */
public abstract class v {

    /* renamed from: a, reason: collision with root package name */
    public static final long f75982a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f75983b = 0;

    static {
        y3.q[] qVarArr = y3.p.f96616b;
        f75982a = y3.p.f96617c;
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00a2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final u a(u uVar, int i5, int i11, long j11, x3.q qVar, x xVar, x3.i iVar, int i12, int i13, x3.s sVar) {
        long j12;
        x xVar2;
        int i14 = i5;
        int i15 = i11;
        long j13 = j11;
        x3.q qVar2 = qVar;
        x xVar3 = xVar;
        x3.i iVar2 = iVar;
        int i16 = i12;
        int i17 = i13;
        x3.s sVar2 = sVar;
        if (i14 != Integer.MIN_VALUE) {
            j12 = 0;
            if (i14 == uVar.f75973a) {
            }
            y3.q[] qVarArr = y3.p.f96616b;
            if ((j13 & 1095216660480L) == j12) {
                j13 = uVar.f75975c;
            }
            if (qVar2 == null) {
                qVar2 = uVar.f75976d;
            }
            if (i14 == Integer.MIN_VALUE) {
                i14 = uVar.f75973a;
            }
            if (i15 == Integer.MIN_VALUE) {
                i15 = uVar.f75974b;
            }
            xVar2 = uVar.f75977e;
            if (xVar2 != null && xVar3 == null) {
                xVar3 = xVar2;
            }
            if (iVar2 == null) {
                iVar2 = uVar.f75978f;
            }
            if (i16 == 0) {
                i16 = uVar.f75979g;
            }
            if (i17 == Integer.MIN_VALUE) {
                i17 = uVar.f75980h;
            }
            if (sVar2 == null) {
                sVar2 = uVar.f75981i;
            }
            return new u(i14, i15, j13, qVar2, xVar3, iVar2, i16, i17, sVar2);
        }
        j12 = 0;
        y3.q[] qVarArr2 = y3.p.f96616b;
        if (((j13 & 1095216660480L) == j12 || y3.p.a(j13, uVar.f75975c)) && ((qVar2 == null || qVar2.equals(uVar.f75976d)) && ((i15 == Integer.MIN_VALUE || i15 == uVar.f75974b) && ((xVar3 == null || xVar3.equals(uVar.f75977e)) && ((iVar2 == null || iVar2.equals(uVar.f75978f)) && ((i16 == 0 || i16 == uVar.f75979g) && ((i17 == Integer.MIN_VALUE || i17 == uVar.f75980h) && (sVar2 == null || sVar2.equals(uVar.f75981i))))))))) {
            return uVar;
        }
        y3.q[] qVarArr3 = y3.p.f96616b;
        if ((j13 & 1095216660480L) == j12) {
        }
        if (qVar2 == null) {
        }
        if (i14 == Integer.MIN_VALUE) {
        }
        if (i15 == Integer.MIN_VALUE) {
        }
        xVar2 = uVar.f75977e;
        if (xVar2 != null) {
            xVar3 = xVar2;
        }
        if (iVar2 == null) {
        }
        if (i16 == 0) {
        }
        if (i17 == Integer.MIN_VALUE) {
        }
        if (sVar2 == null) {
        }
        return new u(i14, i15, j13, qVar2, xVar3, iVar2, i16, i17, sVar2);
    }
}
