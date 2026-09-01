package defpackage;

import com.medium.android.graphql.type.UserDismissableFlags;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Loge;", "Lque;", "mge", "qo2", "profile_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class oge extends que {
    public final String b;
    public final String c;
    public final gge d;
    public final og3 e;
    public final ax2 f;
    public final yx2 g;
    public boolean h;
    public final String i;
    public final SourceParameter j;
    public final wua k;

    /* JADX WARN: Multi-variable type inference failed */
    public oge(String str, String str2, gge ggeVar, og3 og3Var, hha hhaVar, ax2 ax2Var, yx2 yx2Var, kb2 kb2Var) {
        str.getClass();
        this.b = str;
        this.c = str2;
        this.d = ggeVar;
        this.e = og3Var;
        this.f = ax2Var;
        this.g = yx2Var;
        this.i = "user_books";
        this.j = new SourceParameter("user_books", str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4, 8191, null);
        int i = 12;
        int i2 = 1;
        this.k = bo.e0(w2g.r(new ro4(new sp4(new u50(i, new gbd(ggeVar, str, 0 == true ? 1 : 0, 14)), hhaVar.k(UserDismissableFlags.VERIFIED_BOOK_AUTHORS_CTA), new rl2(this, 0 == true ? 1 : 0, i), 0), new lfe(3, i2, 0 == true ? 1 : 0), i2), kb2Var), f76.F(this), l7c.b, kge.a);
    }
}
