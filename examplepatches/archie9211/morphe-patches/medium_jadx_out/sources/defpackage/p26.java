package defpackage;

import android.content.ClipDescription;
import android.net.Uri;
import android.view.inputmethod.InputContentInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p26 implements q26 {
    public final InputContentInfo a;

    public p26(Uri uri, ClipDescription clipDescription, Uri uri2) {
        this.a = new InputContentInfo(uri, clipDescription, uri2);
    }

    @Override // defpackage.q26
    public final Uri b() {
        return this.a.getContentUri();
    }

    @Override // defpackage.q26
    public final void c() {
        this.a.requestPermission();
    }

    @Override // defpackage.q26
    public final Uri g() {
        return this.a.getLinkUri();
    }

    @Override // defpackage.q26
    public final ClipDescription getDescription() {
        return this.a.getDescription();
    }

    @Override // defpackage.q26
    public final Object k() {
        return this.a;
    }

    public p26(Object obj) {
        this.a = (InputContentInfo) obj;
    }
}
