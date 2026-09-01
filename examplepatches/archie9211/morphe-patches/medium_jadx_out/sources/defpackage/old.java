package defpackage;

import java.lang.reflect.Member;
import java.lang.reflect.Type;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class old implements v41 {
    public static final old a = new old();

    @Override // defpackage.v41
    public final List a() {
        return ey3.a;
    }

    @Override // defpackage.v41
    public final Member b() {
        return null;
    }

    @Override // defpackage.v41
    public final boolean c() {
        return false;
    }

    @Override // defpackage.v41
    public final Object call(Object[] objArr) {
        objArr.getClass();
        throw new UnsupportedOperationException("call/callBy are not supported for this declaration.");
    }

    @Override // defpackage.v41
    public final Type getReturnType() {
        Class cls = Void.TYPE;
        cls.getClass();
        return cls;
    }
}
