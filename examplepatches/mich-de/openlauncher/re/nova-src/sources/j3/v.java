package j3;

import i2.v0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class v extends Lambda implements Function2 {

    /* renamed from: k, reason: collision with root package name */
    public static final v f68848k;

    /* renamed from: l, reason: collision with root package name */
    public static final v f68849l;

    /* renamed from: m, reason: collision with root package name */
    public static final v f68850m;
    public static final v n;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f68851j;

    static {
        int i5 = 2;
        f68848k = new v(i5, 0);
        f68849l = new v(i5, 1);
        f68850m = new v(i5, 2);
        n = new v(i5, 3);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v(int i5, int i11) {
        super(i5);
        this.f68851j = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f68851j) {
            case 0:
                return (v0) obj;
            case 1:
                return (String) obj;
            case 2:
                Boolean bool = (Boolean) obj;
                ((Boolean) obj2).booleanValue();
                return bool;
            default:
                q qVar = (q) obj2;
                Object objValueOf = Float.valueOf(0.0f);
                k kVar = ((q) obj).f68823d;
                a0 a0Var = w.f68868s;
                Object objD = kVar.f68812a.d(a0Var);
                if (objD == null) {
                    objD = objValueOf;
                }
                float fFloatValue = ((Number) objD).floatValue();
                Object objD2 = qVar.f68823d.f68812a.d(a0Var);
                if (objD2 != null) {
                    objValueOf = objD2;
                }
                return Integer.valueOf(Float.compare(fFloatValue, ((Number) objValueOf).floatValue()));
        }
    }
}
