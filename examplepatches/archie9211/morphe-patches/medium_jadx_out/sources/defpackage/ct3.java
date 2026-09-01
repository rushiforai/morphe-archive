package defpackage;

import android.net.Uri;
import gen.model.UploadInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ct3 extends p92 {
    public Uri b;
    public String c;
    public v09 d;
    public UploadInfo e;
    public /* synthetic */ Object f;
    public final /* synthetic */ ht3 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ct3(ht3 ht3Var, p92 p92Var) {
        super(p92Var);
        this.g = ht3Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        return this.g.j(null, null, this);
    }
}
