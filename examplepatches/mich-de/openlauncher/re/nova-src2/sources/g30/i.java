package g30;

import android.app.WallpaperColors;
import android.app.WallpaperManager;
import java.util.Iterator;
import ya.l0;

/* loaded from: classes.dex */
public final /* synthetic */ class i implements WallpaperManager.OnColorsChangedListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f57040a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f57041b;

    public /* synthetic */ i(Object obj, int i5) {
        this.f57040a = i5;
        this.f57041b = obj;
    }

    @Override // android.app.WallpaperManager.OnColorsChangedListener
    public final void onColorsChanged(WallpaperColors wallpaperColors, int i5) {
        switch (this.f57040a) {
            case 0:
                j jVar = (j) this.f57041b;
                c cVarG = jVar.g(wallpaperColors);
                Iterator it = jVar.f57044e.iterator();
                while (it.hasNext()) {
                    ((d) it.next()).a(cVarG, i5);
                }
                break;
            default:
                o9.l lVar = (o9.l) this.f57041b;
                if (lVar.F != l0.c(lVar)) {
                    lVar.recreate();
                    break;
                }
                break;
        }
    }
}
