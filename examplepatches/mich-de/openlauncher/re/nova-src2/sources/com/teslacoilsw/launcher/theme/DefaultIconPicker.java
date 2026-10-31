package com.teslacoilsw.launcher.theme;

import android.app.Activity;
import android.content.Intent;
import android.content.Loader;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import b.c0;
import dy.g;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import u20.i;
import u20.j;
import u20.k;
import u20.l;
import u20.p;
import u20.q;

/* loaded from: classes4.dex */
public class DefaultIconPicker extends ThemeImagePicker {
    @Override // com.teslacoilsw.launcher.theme.ThemeImagePicker, com.teslacoilsw.launcher.theme.AbstractThumbnailPicker
    public final Bitmap g(dy.d dVar, u20.e eVar, AtomicBoolean atomicBoolean) throws PackageManager.NameNotFoundException {
        Activity activity;
        if (!(eVar instanceof k)) {
            return super.g(dVar, eVar, atomicBoolean);
        }
        BitmapFactory.Options options = new BitmapFactory.Options();
        k kVar = (k) eVar;
        try {
            int iO = x7.f.O(this.n * 0.3f);
            if (!atomicBoolean.get() && (activity = getActivity()) != null) {
                Resources resourcesForApplication = activity.getPackageManager().getResourcesForApplication(kVar.f90482a);
                if (atomicBoolean.get()) {
                    return null;
                }
                return g.b(resourcesForApplication, kVar.f90483b, this.n, iO, iO, options, true);
            }
            return null;
        } catch (PackageManager.NameNotFoundException | Resources.NotFoundException unused) {
            return null;
        }
    }

    @Override // com.teslacoilsw.launcher.theme.ThemeImagePicker, com.teslacoilsw.launcher.theme.AbstractThumbnailPicker, android.app.LoaderManager.LoaderCallbacks
    /* renamed from: h */
    public final void onLoadFinished(Loader loader, List list) {
        if (list != null && this.f46317p == v20.e.f92028d) {
            getLoaderManager().initLoader(100, null, new i(this, list));
        }
        super.onLoadFinished(loader, list);
    }

    @Override // com.teslacoilsw.launcher.theme.ThemeImagePicker, android.app.LoaderManager.LoaderCallbacks
    public final Loader onCreateLoader(int i5, Bundle bundle) {
        if (i5 == -1) {
            return new l(getActivity(), this.o, this.f46317p, this.f46323v, 0, 0, null);
        }
        if (i5 == 100) {
            return new j(getActivity());
        }
        throw new RuntimeException(c0.h(i5, "Invalid loader id "));
    }

    @Override // com.teslacoilsw.launcher.theme.ThemeImagePicker, com.teslacoilsw.launcher.theme.AbstractThumbnailPicker, android.widget.AdapterView.OnItemClickListener
    public final void onItemClick(AdapterView adapterView, View view, int i5, long j11) throws PackageManager.NameNotFoundException {
        u20.e item = this.f46287b.getItem(i5);
        if (item instanceof q) {
            super.onItemClick(adapterView, view, i5, j11);
            return;
        }
        if (item instanceof p) {
            Activity activity = getActivity();
            Intent intent = new Intent();
            intent.putExtra("icon", ((p) item).f90497a);
            activity.setResult(-1, intent);
            activity.finish();
            return;
        }
        k kVar = (k) item;
        try {
            ((PickerActivity) getActivity()).Z(kVar.f90483b, getActivity().getPackageManager().getResourcesForApplication(kVar.f90482a), "app_icon");
        } catch (PackageManager.NameNotFoundException e3) {
            e3.printStackTrace();
        }
    }
}
