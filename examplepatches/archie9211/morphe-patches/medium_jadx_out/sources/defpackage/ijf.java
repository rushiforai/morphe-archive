package defpackage;

import android.content.Intent;
import com.google.android.gms.common.api.GoogleApiActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ijf extends pjf {
    public final /* synthetic */ Intent a;
    public final /* synthetic */ GoogleApiActivity b;

    public ijf(Intent intent, GoogleApiActivity googleApiActivity) {
        this.a = intent;
        this.b = googleApiActivity;
    }

    @Override // defpackage.pjf
    public final void a() {
        Intent intent = this.a;
        if (intent != null) {
            this.b.startActivityForResult(intent, 2);
        }
    }
}
