package io.sentry.android.core.internal.util;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import io.sentry.d0;
import java.util.concurrent.Executors;
import jx.v;
import sp.c0;
import v70.w;
import v70.x;

/* loaded from: classes4.dex */
public final class a extends ConnectivityManager.NetworkCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f66940a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f66941b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f66942c;

    public /* synthetic */ a(int i5, Object obj, Object obj2) {
        this.f66940a = i5;
        this.f66941b = obj;
        this.f66942c = obj2;
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public void onAvailable(Network network) {
        int i5 = this.f66940a;
        Object obj = this.f66942c;
        Object obj2 = this.f66941b;
        switch (i5) {
            case 0:
                ((b) obj).a();
                ((d0) obj2).a();
                break;
            case 1:
            default:
                super.onAvailable(network);
                break;
            case 2:
                ConnectivityManager.NetworkCallback networkCallback = c0.f87571a;
                sp.i iVar = (sp.i) obj;
                ConnectivityManager connectivityManagerA = c0.a((Context) obj2);
                if (connectivityManagerA == null ? false : c0.b(connectivityManagerA)) {
                    Executors.newSingleThreadExecutor().execute(new sp.h(iVar, 1));
                    break;
                }
                break;
        }
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public void onCapabilitiesChanged(Network network, NetworkCapabilities networkCapabilities) {
        switch (this.f66940a) {
            case 1:
                WifiInfo connectionInfo = ((WifiManager) ((v) this.f66941b).f70429a.getApplicationContext().getSystemService(WifiManager.class)).getConnectionInfo();
                ((w) ((x) this.f66942c)).j(connectionInfo != null ? new jx.w(r70.k.c1(connectionInfo.getSSID())) : new jx.x());
                break;
            default:
                super.onCapabilitiesChanged(network, networkCapabilities);
                break;
        }
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public void onLosing(Network network, int i5) {
        switch (this.f66940a) {
            case 0:
                d0 d0Var = (d0) this.f66941b;
                ((b) this.f66942c).a();
                d0Var.a();
                break;
            default:
                super.onLosing(network, i5);
                break;
        }
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public void onLost(Network network) {
        switch (this.f66940a) {
            case 0:
                d0 d0Var = (d0) this.f66941b;
                ((b) this.f66942c).a();
                d0Var.a();
                break;
            case 1:
                ((w) ((x) this.f66942c)).j(new jx.x());
                break;
            default:
                super.onLost(network);
                break;
        }
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public void onUnavailable() {
        switch (this.f66940a) {
            case 0:
                d0 d0Var = (d0) this.f66941b;
                ((b) this.f66942c).a();
                d0Var.a();
                break;
            default:
                super.onUnavailable();
                break;
        }
    }

    public a(b bVar, d0 d0Var) {
        this.f66940a = 0;
        this.f66942c = bVar;
        this.f66941b = d0Var;
    }
}
