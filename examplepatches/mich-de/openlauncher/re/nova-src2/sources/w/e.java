package w;

import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.customtabs.ICustomTabsCallback;
import mk.w;

/* loaded from: classes2.dex */
public final class e extends ICustomTabsCallback.Stub {

    /* renamed from: a, reason: collision with root package name */
    public final Handler f93396a = new Handler(Looper.getMainLooper());

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b f93397b;

    public e(b bVar) {
        this.f93397b = bVar;
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void extraCallback(String str, Bundle bundle) {
        if (this.f93397b == null) {
            return;
        }
        this.f93396a.post(new d(this, str, bundle, 0));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final Bundle extraCallbackWithResult(String str, Bundle bundle) {
        b bVar = this.f93397b;
        if (bVar == null) {
            return null;
        }
        bVar.extraCallbackWithResult(str);
        return null;
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onActivityLayout(int i5, int i11, int i12, int i13, int i14, Bundle bundle) {
        if (this.f93397b == null) {
            return;
        }
        this.f93396a.post(new c(this, i5, i11, i12, i13, i14, bundle));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onActivityResized(int i5, int i11, Bundle bundle) {
        if (this.f93397b == null) {
            return;
        }
        this.f93396a.post(new w(this, i5, i11, bundle));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onMessageChannelReady(Bundle bundle) {
        if (this.f93397b == null) {
            return;
        }
        this.f93396a.post(new c(1, bundle, this));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onMinimized(Bundle bundle) {
        if (this.f93397b == null) {
            return;
        }
        this.f93396a.post(new c(4, bundle, this));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onNavigationEvent(int i5, Bundle bundle) {
        if (this.f93397b == null) {
            return;
        }
        this.f93396a.post(new com.google.android.material.datepicker.g(i5, bundle, this));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onPostMessage(String str, Bundle bundle) {
        if (this.f93397b == null) {
            return;
        }
        this.f93396a.post(new d(this, str, bundle, 1));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onRelationshipValidationResult(int i5, Uri uri, boolean z11, Bundle bundle) {
        if (this.f93397b == null) {
            return;
        }
        this.f93396a.post(new w(this, i5, uri, z11, bundle));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onUnminimized(Bundle bundle) {
        if (this.f93397b == null) {
            return;
        }
        this.f93396a.post(new c(0, bundle, this));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onWarmupCompleted(Bundle bundle) {
        if (this.f93397b == null) {
            return;
        }
        this.f93396a.post(new c(2, bundle, this));
    }
}
