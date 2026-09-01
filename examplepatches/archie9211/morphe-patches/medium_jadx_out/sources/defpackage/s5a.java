package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum s5a implements o56 {
    AT_MOST_ONCE(0),
    EXACTLY_ONCE(1),
    AT_LEAST_ONCE(2);

    public final int a;

    s5a(int i) {
        this.a = i;
    }

    public static s5a valueOf(int i) {
        if (i == 0) {
            return AT_MOST_ONCE;
        }
        if (i == 1) {
            return EXACTLY_ONCE;
        }
        if (i != 2) {
            return null;
        }
        return AT_LEAST_ONCE;
    }

    @Override // defpackage.o56
    public final int getNumber() {
        return this.a;
    }
}
