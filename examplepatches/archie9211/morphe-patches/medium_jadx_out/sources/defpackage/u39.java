package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class u39 extends to7 {
    public final /* synthetic */ int e;
    public final String f;
    public final boolean g;

    public u39(int i, String str, boolean z) {
        this.e = i;
        switch (i) {
            case 1:
                Objects.requireNonNull(str, "name == null");
                this.f = str;
                this.g = z;
                break;
            case 2:
                Objects.requireNonNull(str, "name == null");
                this.f = str;
                this.g = z;
                break;
            default:
                Objects.requireNonNull(str, "name == null");
                this.f = str;
                this.g = z;
                break;
        }
    }

    @Override // defpackage.to7
    public final void h(ubb ubbVar, Object obj) {
        String string;
        String string2;
        String string3;
        int i = this.e;
        boolean z = this.g;
        String str = this.f;
        switch (i) {
            case 0:
                if (obj != null && (string = obj.toString()) != null) {
                    ubbVar.a(str, string, z);
                }
                break;
            case 1:
                if (obj != null && (string2 = obj.toString()) != null) {
                    ubbVar.b(str, string2, z);
                }
                break;
            default:
                if (obj != null && (string3 = obj.toString()) != null) {
                    ubbVar.d(str, string3, z);
                }
                break;
        }
    }
}
