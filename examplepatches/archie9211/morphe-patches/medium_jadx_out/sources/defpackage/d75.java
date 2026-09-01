package defpackage;

import androidx.datastore.preferences.protobuf.e;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d75 implements az7 {
    public static final d75 b = new d75(0);
    public final /* synthetic */ int a;

    public /* synthetic */ d75(int i) {
        this.a = i;
    }

    @Override // defpackage.az7
    public final tsa a(Class cls) {
        switch (this.a) {
            case 0:
                if (!e.class.isAssignableFrom(cls)) {
                    ay0.e("Unsupported message type: ".concat(cls.getName()));
                    return null;
                }
                try {
                    return (tsa) e.d(cls.asSubclass(e.class)).c(r75.BUILD_MESSAGE_INFO);
                } catch (Exception e) {
                    lg8.p("Unable to get message info for ".concat(cls.getName()), e);
                    return null;
                }
            default:
                throw new IllegalStateException("This should never be called.");
        }
    }

    @Override // defpackage.az7
    public final boolean b(Class cls) {
        switch (this.a) {
            case 0:
                return e.class.isAssignableFrom(cls);
            default:
                return false;
        }
    }
}
