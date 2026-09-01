package defpackage;

import com.medium.proto.event.DigestHistoryPickerOpened;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lwc3;", "Lque;", "mp2", "uc3", "digest_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class wc3 extends que {
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final s95 f;
    public final dd3 g;
    public final qy2 h;
    public final wua i;

    public wc3(String str, String str2, String str3, String str4, s95 s95Var, dd3 dd3Var, qy2 qy2Var, kb2 kb2Var) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        str4.getClass();
        dd3Var.getClass();
        this.b = str;
        this.c = str2;
        this.d = str3;
        this.e = str4;
        this.f = s95Var;
        this.g = dd3Var;
        this.h = qy2Var;
        rqd.a(qy2Var.a, new DigestHistoryPickerOpened(null, null, 3, null), str2, str3, false, null, str4, 24);
        this.i = bo.e0(w2g.r(new pc1(new u50(12, new ku2(this, null, 7)), 4, this), kb2Var), f76.F(this), new ync(5000L, Long.MAX_VALUE), tc3.a);
    }
}
