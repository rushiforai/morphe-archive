package cp;

import b.u4;
import com.nimbusds.jose.shaded.gson.JsonParseException;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public abstract class x {

    /* renamed from: a, reason: collision with root package name */
    public static final t f47784a;

    /* renamed from: b, reason: collision with root package name */
    public static final u f47785b;

    /* renamed from: c, reason: collision with root package name */
    public static final v f47786c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ x[] f47787d;

    static {
        t tVar = new t();
        f47784a = tVar;
        u uVar = new u();
        f47785b = uVar;
        v vVar = new v();
        f47786c = vVar;
        f47787d = new x[]{tVar, uVar, vVar, new x() { // from class: cp.w
            @Override // cp.x
            public final Number a(kp.a aVar) {
                String strD0 = aVar.d0();
                try {
                    return ep.i.i(strD0);
                } catch (NumberFormatException e3) {
                    StringBuilder sbK = u4.k("Cannot parse ", strD0, "; at path ");
                    sbK.append(aVar.l(true));
                    throw new JsonParseException(sbK.toString(), e3);
                }
            }
        }};
    }

    public static x valueOf(String str) {
        return (x) Enum.valueOf(x.class, str);
    }

    public static x[] values() {
        return (x[]) f47787d.clone();
    }

    public abstract Number a(kp.a aVar);
}
