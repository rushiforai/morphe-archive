package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public enum xvf {
    RESPONSE_CODE_UNSPECIFIED(-999),
    SERVICE_TIMEOUT(-3),
    FEATURE_NOT_SUPPORTED(-2),
    SERVICE_DISCONNECTED(-1),
    OK(0),
    USER_CANCELED(1),
    SERVICE_UNAVAILABLE(2),
    BILLING_UNAVAILABLE(3),
    ITEM_UNAVAILABLE(4),
    DEVELOPER_ERROR(5),
    zzk(6),
    ITEM_ALREADY_OWNED(7),
    ITEM_NOT_OWNED(8),
    EXPIRED_OFFER_TOKEN(11),
    NETWORK_ERROR(12);

    public static final yyf b;
    public final int a;

    xvf(int i) {
        this.a = i;
    }

    static {
        char c2 = 0;
        xp xpVar = new xp(c2, 14);
        xpVar.c = new Object[8];
        xpVar.b = 0;
        xvf[] xvfVarArrValues = values();
        int length = xvfVarArrValues.length;
        for (int i = c2; i < length; i++) {
            xvf xvfVar = xvfVarArrValues[i];
            Integer numValueOf = Integer.valueOf(xvfVar.a);
            int i2 = xpVar.b + 1;
            Object[] objArrCopyOf = (Object[]) xpVar.c;
            int length2 = objArrCopyOf.length;
            int i3 = i2 + i2;
            if (i3 > length2) {
                objArrCopyOf = Arrays.copyOf(objArrCopyOf, tr7.B(length2, i3));
                xpVar.c = objArrCopyOf;
            }
            int i4 = xpVar.b;
            int i5 = i4 + i4;
            objArrCopyOf[i5] = numValueOf;
            objArrCopyOf[i5 + 1] = xvfVar;
            xpVar.b = i4 + 1;
        }
        xxf xxfVar = (xxf) xpVar.d;
        if (xxfVar != null) {
            throw xxfVar.a();
        }
        yyf yyfVarA = yyf.a(xpVar.b, (Object[]) xpVar.c, xpVar);
        xxf xxfVar2 = (xxf) xpVar.d;
        if (xxfVar2 != null) {
            throw xxfVar2.a();
        }
        b = yyfVarA;
    }
}
