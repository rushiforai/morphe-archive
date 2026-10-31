package u20;

import android.app.LoaderManager;
import android.content.Loader;
import android.os.Bundle;
import com.teslacoilsw.launcher.theme.DefaultIconPicker;
import h6.c1;
import java.util.List;

/* loaded from: classes4.dex */
public final class i implements LoaderManager.LoaderCallbacks {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ List f90480a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ DefaultIconPicker f90481b;

    public i(DefaultIconPicker defaultIconPicker, List list) {
        this.f90481b = defaultIconPicker;
        this.f90480a = list;
    }

    @Override // android.app.LoaderManager.LoaderCallbacks
    public final Loader onCreateLoader(int i5, Bundle bundle) {
        return new j(this.f90481b.getActivity());
    }

    @Override // android.app.LoaderManager.LoaderCallbacks
    public final void onLoadFinished(Loader loader, Object obj) {
        List list = (List) obj;
        DefaultIconPicker defaultIconPicker = this.f90481b;
        defaultIconPicker.f46293h = false;
        List list2 = this.f90480a;
        r rVar = (r) list2;
        ((c) c1.l(rVar.f90502a, 1)).f90462b = false;
        if (list != null) {
            rVar.addAll(list);
        }
        super/*com.teslacoilsw.launcher.theme.ThemeImagePicker*/.onLoadFinished(loader, list2);
    }

    @Override // android.app.LoaderManager.LoaderCallbacks
    public final void onLoaderReset(Loader loader) {
    }
}
