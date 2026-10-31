package u20;

import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import com.teslacoilsw.launcher.theme.AbstractThumbnailPicker;
import mx.p1;

/* loaded from: classes4.dex */
public final class b extends x30.g {

    /* renamed from: g, reason: collision with root package name */
    public long f90459g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ AbstractThumbnailPicker f90460h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(AbstractThumbnailPicker abstractThumbnailPicker, x30.e eVar, ListAdapter listAdapter, x30.a aVar) {
        super(eVar, listAdapter, aVar);
        this.f90460h = abstractThumbnailPicker;
        this.f90459g = 0L;
    }

    @Override // x30.g, android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        View view2 = super.getView(i5, view, viewGroup);
        if (this.f90460h.f46293h) {
            view2.setTranslationY(r10.f46290e * 3);
            view2.setAlpha(0.0f);
            long jUptimeMillis = SystemClock.uptimeMillis();
            long j11 = this.f90459g;
            long jMax = j11 != 0 ? Math.max(0L, 60 - (jUptimeMillis - j11)) : 0L;
            this.f90459g = jUptimeMillis + jMax;
            view2.animate().translationY(0.0f).alpha(1.0f).setDuration(400L).setStartDelay(jMax).setInterpolator(zx.d.f98805a).setListener(p1.f77227d).withLayer();
        }
        return view2;
    }
}
