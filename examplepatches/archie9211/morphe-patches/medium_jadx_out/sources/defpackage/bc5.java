package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bc5 extends o95 {
    public final String d;

    public bc5(String str) {
        super(vv2.e0(str), vv2.e0(str), true, ny3.a, 2000);
        this.d = str;
        if (str.length() > 0) {
            return;
        }
        ay0.e("serverClientId should not be empty");
        throw null;
    }
}
