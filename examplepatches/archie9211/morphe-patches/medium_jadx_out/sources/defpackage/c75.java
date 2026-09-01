package defpackage;

import com.google.protobuf.e;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c75 implements zy7 {
    public static final c75 b = new c75(0);
    public final /* synthetic */ int a;

    public /* synthetic */ c75(int i) {
        this.a = i;
    }

    @Override // defpackage.zy7
    public final ssa a(Class cls) {
        switch (this.a) {
            case 0:
                if (!e.class.isAssignableFrom(cls)) {
                    ay0.e("Unsupported message type: ".concat(cls.getName()));
                    return null;
                }
                try {
                    return (ssa) e.getDefaultInstance(cls.asSubclass(e.class)).buildMessageInfo();
                } catch (Exception e) {
                    lg8.p("Unable to get message info for ".concat(cls.getName()), e);
                    return null;
                }
            default:
                throw new IllegalStateException("This should never be called.");
        }
    }

    @Override // defpackage.zy7
    public final boolean b(Class cls) {
        switch (this.a) {
            case 0:
                return e.class.isAssignableFrom(cls);
            default:
                return false;
        }
    }
}
