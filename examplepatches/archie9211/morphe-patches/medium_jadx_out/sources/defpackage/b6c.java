package defpackage;

import android.app.PendingIntent;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import com.medium.android.core.share.PostShareData;
import com.medium.android.postpage.share.SharePostDialogFragment;
import com.medium.android.postpage.share.a;
import com.medium.android.postpage.sharepostfriendlink.SharePostFriendLinkDialogFragment;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b6c implements w5c {
    public final /* synthetic */ a a;
    public final /* synthetic */ String b;
    public final /* synthetic */ String c;
    public final /* synthetic */ j6c d;

    public b6c(a aVar, String str, String str2, j6c j6cVar) {
        this.a = aVar;
        this.b = str;
        this.c = str2;
        this.d = j6cVar;
    }

    @Override // defpackage.w5c
    public final void a() {
        SharePostDialogFragment sharePostDialogFragment = this.a.a;
        if (qo7.z(k40.X(sharePostDialogFragment), R.id.sharePostBottomSheetDialogFragment)) {
            return;
        }
        sharePostDialogFragment.Q().getOnBackPressedDispatcher().d();
    }

    @Override // defpackage.w5c
    public final void c() throws PendingIntent.CanceledException {
        SharePostDialogFragment sharePostDialogFragment = this.a.a;
        if (sharePostDialogFragment.H0 == null) {
            g76.g0("router");
            throw null;
        }
        Context contextS = sharePostDialogFragment.S();
        PostShareData postShareData = sharePostDialogFragment.f0().getPostShareData();
        String referrerSource = sharePostDialogFragment.f0().getReferrerSource();
        String source = sharePostDialogFragment.f0().getSource();
        String location = sharePostDialogFragment.f0().getLocation();
        postShareData.getClass();
        referrerSource.getClass();
        source.getClass();
        location.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new SharePostFriendLinkDialogFragment.BundleInfo(postShareData, referrerSource, source, location));
        m4.w(contextS, R.id.sharePostFriendLinkDialogFragment, bundle, null, 12);
    }

    @Override // defpackage.w5c
    public final void d() {
        j6c j6cVar = this.d;
        j6cVar.g.f(j6cVar.b.getPostId(), j6cVar.c, j6cVar.d, j6cVar.e);
        SharePostDialogFragment sharePostDialogFragment = this.a.a;
        j7c.b(sharePostDialogFragment.S(), sharePostDialogFragment.f0().getPostShareData());
    }

    @Override // defpackage.w5c
    public final void g() {
        String str = this.b;
        str.getClass();
        SharePostDialogFragment sharePostDialogFragment = this.a.a;
        ClipboardManager clipboardManager = (ClipboardManager) sharePostDialogFragment.S().getSystemService(ClipboardManager.class);
        if (clipboardManager == null) {
            View viewT = sharePostDialogFragment.T();
            int[] iArr = ahc.C;
            ahc.h(viewT, viewT.getResources().getText(R.string.common_copy_to_clipboard_failure), 0).j();
        } else {
            clipboardManager.setPrimaryClip(ClipData.newPlainText(str, this.c));
            j6c j6cVar = this.d;
            j6cVar.g.d(j6cVar.b.getPostId(), j6cVar.c, j6cVar.d, j6cVar.e);
            if (Build.VERSION.SDK_INT < 33) {
                vx0.c0(f76.F(j6cVar), null, null, new i6c(j6cVar, null, 0), 3);
            }
        }
    }

    @Override // defpackage.w5c
    public final void b() {
    }

    @Override // defpackage.w5c
    public final void f() {
    }

    @Override // defpackage.w5c
    public final void e(String str) {
    }
}
