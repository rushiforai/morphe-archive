package defpackage;

import com.medium.android.following.FollowingTab;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0001\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lty4;", "Lque;", "gq2", "following_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ty4 extends que {
    public final String b;
    public final vob c;
    public final ax2 d;
    public final SourceParameter e;
    public boolean f;
    public final wua g;

    public ty4(String str, String str2, FollowingTab followingTab, vob vobVar, ax2 ax2Var) {
        str.getClass();
        str2.getClass();
        followingTab.getClass();
        vobVar.getClass();
        this.b = str2;
        this.c = vobVar;
        this.d = ax2Var;
        this.e = new SourceParameter("user_following_page", null, null, null, null, null, null, null, null, null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4098, 8191, null);
        this.g = vobVar.c("selected_tab", followingTab);
    }
}
