package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.RemoteException;
import android.support.customtabs.ICustomTabsCallback;

/* renamed from: com.facebook.ads.redexgen.X.In, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class BinderC0989In extends ICustomTabsCallback.Stub {
    public Handler A00 = new Handler(Looper.getMainLooper());
    public final /* synthetic */ IX A01;
    public final /* synthetic */ AbstractC0990Io A02;

    public BinderC0989In(AbstractC0990Io abstractC0990Io, IX ix2) {
        this.A02 = abstractC0990Io;
        this.A01 = ix2;
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void extraCallback(String str, Bundle bundle) throws RemoteException {
        if (this.A01 == null) {
            return;
        }
        this.A00.post(new RunnableC0981If(this, str, bundle));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final Bundle extraCallbackWithResult(String str, Bundle bundle) throws RemoteException {
        if (this.A01 == null) {
            return null;
        }
        return this.A01.A00(str, bundle);
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onActivityLayout(int i5, int i11, int i12, int i13, int i14, Bundle bundle) throws RemoteException {
        if (this.A01 == null) {
            return;
        }
        this.A00.post(new RunnableC0987Il(this, i5, i11, i12, i13, i14, bundle));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onActivityResized(int i5, int i11, Bundle bundle) throws RemoteException {
        if (this.A01 == null) {
            return;
        }
        this.A00.post(new RunnableC0985Ij(this, i5, i11, bundle));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onMessageChannelReady(Bundle bundle) throws RemoteException {
        if (this.A01 == null) {
            return;
        }
        this.A00.post(new RunnableC0982Ig(this, bundle));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onMinimized(Bundle bundle) throws RemoteException {
        if (this.A01 == null) {
            return;
        }
        this.A00.post(new RunnableC0988Im(this, bundle));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onNavigationEvent(int i5, Bundle bundle) {
        if (this.A01 == null) {
            return;
        }
        this.A00.post(new RunnableC0980Ie(this, i5, bundle));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onPostMessage(String str, Bundle bundle) throws RemoteException {
        if (this.A01 == null) {
            return;
        }
        this.A00.post(new RunnableC0983Ih(this, str, bundle));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onRelationshipValidationResult(int i5, Uri uri, boolean z11, Bundle bundle) throws RemoteException {
        if (this.A01 == null) {
            return;
        }
        this.A00.post(new RunnableC0984Ii(this, i5, uri, z11, bundle));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onUnminimized(Bundle bundle) throws RemoteException {
        if (this.A01 == null) {
            return;
        }
        this.A00.post(new RunnableC0979Id(this, bundle));
    }

    @Override // android.support.customtabs.ICustomTabsCallback
    public final void onWarmupCompleted(Bundle bundle) throws RemoteException {
        if (this.A01 == null) {
            return;
        }
        this.A00.post(new RunnableC0986Ik(this, bundle));
    }
}
