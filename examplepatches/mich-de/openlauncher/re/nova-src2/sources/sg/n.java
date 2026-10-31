package sg;

import android.content.Intent;
import com.google.android.gms.common.api.GoogleApiActivity;

/* loaded from: classes3.dex */
public final class n extends p {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Intent f87451a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ GoogleApiActivity f87452b;

    public n(Intent intent, GoogleApiActivity googleApiActivity) {
        this.f87451a = intent;
        this.f87452b = googleApiActivity;
    }

    @Override // sg.p
    public final void a() {
        Intent intent = this.f87451a;
        if (intent != null) {
            this.f87452b.startActivityForResult(intent, 2);
        }
    }
}
