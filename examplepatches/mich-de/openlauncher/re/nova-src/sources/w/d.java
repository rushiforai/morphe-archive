package w;

import android.os.Bundle;

/* loaded from: classes2.dex */
public final class d implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f93393a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f93394b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e f93395c;

    public /* synthetic */ d(e eVar, String str, Bundle bundle, int i5) {
        this.f93393a = i5;
        this.f93395c = eVar;
        this.f93394b = str;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f93393a) {
            case 0:
                this.f93395c.f93397b.extraCallback(this.f93394b);
                break;
            default:
                this.f93395c.f93397b.onPostMessage(this.f93394b);
                break;
        }
    }
}
