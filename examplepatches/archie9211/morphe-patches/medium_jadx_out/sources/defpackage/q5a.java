package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum q5a implements o56 {
    CONCLUSION_CONDITION(0),
    RETURNS_CONDITION(1),
    HOLDSIN_CONDITION(2);

    public final int a;

    q5a(int i) {
        this.a = i;
    }

    public static q5a valueOf(int i) {
        if (i == 0) {
            return CONCLUSION_CONDITION;
        }
        if (i == 1) {
            return RETURNS_CONDITION;
        }
        if (i != 2) {
            return null;
        }
        return HOLDSIN_CONDITION;
    }

    @Override // defpackage.o56
    public final int getNumber() {
        return this.a;
    }
}
