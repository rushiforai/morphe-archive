package sd;

import android.util.SparseArray;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Can't remove SSA var: r1v0 sd.l0, still in use, count: 1, list:
  (r1v0 sd.l0) from 0x00e0: INVOKE (r0v15 android.util.SparseArray), (0 int), (r1v0 sd.l0) VIRTUAL call: android.util.SparseArray.put(int, java.lang.Object):void A[MD:(int, E):void (c)]
	at jadx.core.utils.InsnRemover.removeSsaVar(InsnRemover.java:162)
	at jadx.core.utils.InsnRemover.unbindResult(InsnRemover.java:127)
	at jadx.core.utils.InsnRemover.lambda$unbindInsns$1(InsnRemover.java:99)
	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
	at jadx.core.utils.InsnRemover.unbindInsns(InsnRemover.java:98)
	at jadx.core.utils.InsnRemover.removeAllAndUnbind(InsnRemover.java:252)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:180)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* loaded from: classes3.dex */
public final class l0 {
    /* JADX INFO: Fake field, exist only in values array */
    PROXY(0),
    /* JADX INFO: Fake field, exist only in values array */
    VPN(1),
    /* JADX INFO: Fake field, exist only in values array */
    MOBILE_MMS(2),
    /* JADX INFO: Fake field, exist only in values array */
    MOBILE_SUPL(3),
    /* JADX INFO: Fake field, exist only in values array */
    MOBILE_DUN(4),
    /* JADX INFO: Fake field, exist only in values array */
    MOBILE_HIPRI(5),
    /* JADX INFO: Fake field, exist only in values array */
    WIMAX(6),
    /* JADX INFO: Fake field, exist only in values array */
    BLUETOOTH(7),
    /* JADX INFO: Fake field, exist only in values array */
    DUMMY(8),
    /* JADX INFO: Fake field, exist only in values array */
    ETHERNET(9),
    /* JADX INFO: Fake field, exist only in values array */
    MOBILE_FOTA(10),
    /* JADX INFO: Fake field, exist only in values array */
    MOBILE_IMS(11),
    /* JADX INFO: Fake field, exist only in values array */
    MOBILE_CBS(12),
    /* JADX INFO: Fake field, exist only in values array */
    WIFI_P2P(13),
    /* JADX INFO: Fake field, exist only in values array */
    MOBILE_IA(14),
    /* JADX INFO: Fake field, exist only in values array */
    MOBILE_EMERGENCY(15),
    /* JADX INFO: Fake field, exist only in values array */
    PROXY(16),
    /* JADX INFO: Fake field, exist only in values array */
    VPN(17),
    NONE(-1);


    /* renamed from: c, reason: collision with root package name */
    public static final SparseArray f87176c;

    /* renamed from: a, reason: collision with root package name */
    public final int f87178a;

    static {
        l0 l0Var = NONE;
        SparseArray sparseArray = new SparseArray();
        f87176c = sparseArray;
        sparseArray.put(0, l0Var);
        sparseArray.put(1, l0Var);
        sparseArray.put(2, l0Var);
        sparseArray.put(3, l0Var);
        sparseArray.put(4, l0Var);
        sparseArray.put(5, l0Var);
        sparseArray.put(6, l0Var);
        sparseArray.put(7, l0Var);
        sparseArray.put(8, l0Var);
        sparseArray.put(9, l0Var);
        sparseArray.put(10, l0Var);
        sparseArray.put(11, l0Var);
        sparseArray.put(12, l0Var);
        sparseArray.put(13, l0Var);
        sparseArray.put(14, l0Var);
        sparseArray.put(15, l0Var);
        sparseArray.put(16, l0Var);
        sparseArray.put(17, l0Var);
        sparseArray.put(-1, l0Var);
    }

    public l0(int i5) {
        this.f87178a = i5;
    }

    public static l0 a(int i5) {
        return (l0) f87176c.get(i5);
    }

    public static l0 valueOf(String str) {
        return (l0) Enum.valueOf(l0.class, str);
    }

    public static l0[] values() {
        return (l0[]) f87177d.clone();
    }

    public final int b() {
        return this.f87178a;
    }
}
