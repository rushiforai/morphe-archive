package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q9f {
    public final /* synthetic */ y9f a;
    public final /* synthetic */ String b;
    public final /* synthetic */ String c;
    public final /* synthetic */ String d;

    public q9f(y9f y9fVar, String str, String str2, String str3) {
        this.a = y9fVar;
        this.b = str;
        this.c = str2;
        this.d = str3;
    }

    public final String a() {
        String strSubstring;
        y9f y9fVar = this.a;
        if (y9fVar.j().c(Integer.MIN_VALUE)) {
            return this.b;
        }
        String str = y9fVar.a;
        int iIndexOf = str.indexOf(58);
        if (iIndexOf >= 0) {
            strSubstring = str.substring(0, iIndexOf);
            str.substring(iIndexOf + 1);
        } else {
            strSubstring = "";
        }
        return v9f.a.n(strSubstring);
    }
}
