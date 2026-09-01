package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hlb {
    public final /* synthetic */ int a;
    public final String b;
    public final boolean c;

    public hlb(boolean z, String str) {
        this.a = 0;
        this.c = z;
        this.b = str;
    }

    public String toString() {
        switch (this.a) {
            case 1:
                String str = this.c ? "Applink" : "Unclassified";
                String str2 = this.b;
                if (str2 == null) {
                    return str;
                }
                return str + '(' + str2 + ')';
            default:
                return super.toString();
        }
    }

    public /* synthetic */ hlb(int i, String str, boolean z) {
        this.a = i;
        this.b = str;
        this.c = z;
    }
}
