package defpackage;

import com.medium.android.unsplash.data.UnsplashPhoto;
import gen.model.UploadInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dt3 extends p92 {
    public UnsplashPhoto b;
    public String c;
    public UploadInfo d;
    public /* synthetic */ Object e;
    public final /* synthetic */ ht3 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dt3(ht3 ht3Var, p92 p92Var) {
        super(p92Var);
        this.f = ht3Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.k(null, null, this);
    }
}
