package com.google.android.gms.common.api.internal;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import c00.d;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;
import rg.h;
import rg.n;

/* loaded from: classes3.dex */
public final class zza extends Fragment implements h {

    /* renamed from: b, reason: collision with root package name */
    public static final WeakHashMap f31825b = new WeakHashMap();

    /* renamed from: a, reason: collision with root package name */
    public final d f31826a = new d(11);

    @Override // rg.h
    public final n a() {
        return (n) n.class.cast(((Map) this.f31826a.f19045c).get("ConnectionlessLifecycleHelper"));
    }

    @Override // rg.h
    public final void c(n nVar) {
        this.f31826a.z(nVar);
    }

    @Override // android.app.Fragment
    public final void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        super.dump(str, fileDescriptor, printWriter, strArr);
        Iterator it = ((Map) this.f31826a.f19045c).values().iterator();
        while (it.hasNext()) {
            ((n) it.next()).getClass();
        }
    }

    @Override // rg.h
    public final Activity f() {
        return getActivity();
    }

    @Override // android.app.Fragment
    public final void onActivityResult(int i5, int i11, Intent intent) {
        super.onActivityResult(i5, i11, intent);
        this.f31826a.B(i5, i11, intent);
    }

    @Override // android.app.Fragment
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.f31826a.A(bundle);
    }

    @Override // android.app.Fragment
    public final void onDestroy() {
        super.onDestroy();
        d dVar = this.f31826a;
        dVar.f19044b = 5;
        Iterator it = ((Map) dVar.f19045c).values().iterator();
        while (it.hasNext()) {
            ((n) it.next()).getClass();
        }
    }

    @Override // android.app.Fragment
    public final void onResume() {
        super.onResume();
        d dVar = this.f31826a;
        dVar.f19044b = 3;
        Iterator it = ((Map) dVar.f19045c).values().iterator();
        while (it.hasNext()) {
            ((n) it.next()).f();
        }
    }

    @Override // android.app.Fragment
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        this.f31826a.C(bundle);
    }

    @Override // android.app.Fragment
    public final void onStart() {
        super.onStart();
        d dVar = this.f31826a;
        dVar.f19044b = 2;
        for (n nVar : ((Map) dVar.f19045c).values()) {
            nVar.f85896b = true;
            nVar.f();
        }
    }

    @Override // android.app.Fragment
    public final void onStop() {
        super.onStop();
        d dVar = this.f31826a;
        dVar.f19044b = 4;
        Iterator it = ((Map) dVar.f19045c).values().iterator();
        while (it.hasNext()) {
            ((n) it.next()).c();
        }
    }
}
