package p6;

import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class s0 extends w0 {

    /* renamed from: m, reason: collision with root package name */
    public final Class f82251m;

    public s0(Class cls) {
        super(cls, 0);
        if (cls.isEnum()) {
            this.f82251m = cls;
            return;
        }
        throw new IllegalArgumentException((cls + " is not an Enum type.").toString());
    }

    @Override // p6.w0, p6.x0
    public final String b() {
        return this.f82251m.getName();
    }

    @Override // p6.w0
    /* renamed from: g, reason: merged with bridge method [inline-methods] */
    public final Enum d(String str) {
        Object obj;
        Class cls = this.f82251m;
        Object[] enumConstants = cls.getEnumConstants();
        Intrinsics.f(enumConstants, "type.enumConstants");
        int length = enumConstants.length;
        int i5 = 0;
        while (true) {
            if (i5 >= length) {
                obj = null;
                break;
            }
            obj = enumConstants[i5];
            if (r70.j.B0(((Enum) obj).name(), str, true)) {
                break;
            }
            i5++;
        }
        Enum r42 = (Enum) obj;
        if (r42 != null) {
            return r42;
        }
        StringBuilder sbK = u4.k("Enum value ", str, " not found for type ");
        sbK.append(cls.getName());
        sbK.append('.');
        throw new IllegalArgumentException(sbK.toString());
    }
}
