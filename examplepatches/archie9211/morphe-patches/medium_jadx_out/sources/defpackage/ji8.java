package defpackage;

import kotlinx.serialization.SerializationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ji8 implements pj6 {
    public static final ji8 a = new ji8();
    public static final ii8 b = ii8.a;

    @Override // defpackage.pj6
    public final xzb a() {
        return b;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        ((Void) obj).getClass();
        throw new SerializationException("'kotlin.Nothing' cannot be serialized");
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        throw new SerializationException("'kotlin.Nothing' does not have instances");
    }
}
