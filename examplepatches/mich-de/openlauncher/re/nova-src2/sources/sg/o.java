package sg;

import android.content.Intent;

/* loaded from: classes.dex */
public final class o extends p {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Intent f87453a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f87454b;

    public o(Intent intent, rg.h hVar) {
        this.f87453a = intent;
        this.f87454b = hVar;
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [java.lang.Object, rg.h] */
    @Override // sg.p
    public final void a() {
        Intent intent = this.f87453a;
        if (intent != null) {
            this.f87454b.startActivityForResult(intent, 2);
        }
    }
}
