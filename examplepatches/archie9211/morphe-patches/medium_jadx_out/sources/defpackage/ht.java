package defpackage;

import android.net.http.UploadDataSink;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ht extends aq7 {
    public final UploadDataSink d;

    public ht(UploadDataSink uploadDataSink) {
        this.d = uploadDataSink;
    }

    @Override // defpackage.aq7
    public final void v() {
        this.d.onReadSucceeded(false);
    }

    @Override // defpackage.aq7
    public final void w() {
        this.d.onRewindSucceeded();
    }
}
