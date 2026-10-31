package w;

import android.os.Bundle;

/* loaded from: classes2.dex */
public final class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f93391a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f93392b;

    public /* synthetic */ c(int i5, Bundle bundle, e eVar) {
        this.f93391a = i5;
        this.f93392b = eVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f93391a) {
            case 0:
                this.f93392b.f93397b.getClass();
                break;
            case 1:
                this.f93392b.f93397b.onMessageChannelReady();
                break;
            case 2:
                this.f93392b.f93397b.getClass();
                break;
            case 3:
                this.f93392b.f93397b.getClass();
                break;
            default:
                this.f93392b.f93397b.getClass();
                break;
        }
    }

    public c(e eVar, int i5, int i11, int i12, int i13, int i14, Bundle bundle) {
        this.f93391a = 3;
        this.f93392b = eVar;
    }
}
