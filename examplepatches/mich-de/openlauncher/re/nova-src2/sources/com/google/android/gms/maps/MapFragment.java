package com.google.android.gms.maps;

import ah.c;
import ah.f;
import ah.i;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.os.StrictMode;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import vh.e;

@TargetApi(11)
/* loaded from: classes3.dex */
public class MapFragment extends Fragment {

    /* renamed from: a, reason: collision with root package name */
    public final e f33734a = new e(this);

    @Override // android.app.Fragment
    public final void onActivityCreated(Bundle bundle) {
        ClassLoader classLoader = MapFragment.class.getClassLoader();
        if (bundle != null && classLoader != null) {
            bundle.setClassLoader(classLoader);
        }
        super.onActivityCreated(bundle);
    }

    @Override // android.app.Fragment
    public final void onAttach(Activity activity) {
        super.onAttach(activity);
        e eVar = this.f33734a;
        eVar.f92776g = activity;
        eVar.n();
    }

    @Override // android.app.Fragment
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        e eVar = this.f33734a;
        eVar.getClass();
        eVar.m(bundle, new f(eVar, bundle));
    }

    @Override // android.app.Fragment
    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        FrameLayout frameLayoutG = this.f33734a.g(layoutInflater, viewGroup, bundle);
        frameLayoutG.setClickable(true);
        return frameLayoutG;
    }

    @Override // android.app.Fragment
    public final void onDestroy() {
        e eVar = this.f33734a;
        c cVar = (c) eVar.f12803a;
        if (cVar != null) {
            cVar.onDestroy();
        } else {
            eVar.l(1);
        }
        super.onDestroy();
    }

    @Override // android.app.Fragment
    public final void onDestroyView() {
        e eVar = this.f33734a;
        c cVar = (c) eVar.f12803a;
        if (cVar != null) {
            cVar.a();
        } else {
            eVar.l(2);
        }
        super.onDestroyView();
    }

    @Override // android.app.Fragment
    public final void onInflate(Activity activity, AttributeSet attributeSet, Bundle bundle) {
        e eVar = this.f33734a;
        StrictMode.ThreadPolicy threadPolicy = StrictMode.getThreadPolicy();
        StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder(threadPolicy).permitAll().build());
        try {
            super.onInflate(activity, attributeSet, bundle);
            eVar.f92776g = activity;
            eVar.n();
            GoogleMapOptions googleMapOptionsB = GoogleMapOptions.b(activity, attributeSet);
            Bundle bundle2 = new Bundle();
            bundle2.putParcelable("MapOptions", googleMapOptionsB);
            eVar.m(bundle, new ah.e(eVar, activity, bundle2, bundle));
        } finally {
            StrictMode.setThreadPolicy(threadPolicy);
        }
    }

    @Override // android.app.Fragment, android.content.ComponentCallbacks
    public final void onLowMemory() {
        c cVar = (c) this.f33734a.f12803a;
        if (cVar != null) {
            cVar.onLowMemory();
        }
        super.onLowMemory();
    }

    @Override // android.app.Fragment
    public final void onPause() {
        e eVar = this.f33734a;
        c cVar = (c) eVar.f12803a;
        if (cVar != null) {
            cVar.onPause();
        } else {
            eVar.l(5);
        }
        super.onPause();
    }

    @Override // android.app.Fragment
    public final void onResume() {
        super.onResume();
        e eVar = this.f33734a;
        eVar.getClass();
        eVar.m(null, new i(eVar, 1));
    }

    @Override // android.app.Fragment
    public final void onSaveInstanceState(Bundle bundle) {
        ClassLoader classLoader = MapFragment.class.getClassLoader();
        if (bundle != null && classLoader != null) {
            bundle.setClassLoader(classLoader);
        }
        super.onSaveInstanceState(bundle);
        this.f33734a.h(bundle);
    }

    @Override // android.app.Fragment
    public final void onStart() {
        super.onStart();
        e eVar = this.f33734a;
        eVar.getClass();
        eVar.m(null, new i(eVar, 0));
    }

    @Override // android.app.Fragment
    public final void onStop() {
        e eVar = this.f33734a;
        c cVar = (c) eVar.f12803a;
        if (cVar != null) {
            cVar.onStop();
        } else {
            eVar.l(4);
        }
        super.onStop();
    }
}
