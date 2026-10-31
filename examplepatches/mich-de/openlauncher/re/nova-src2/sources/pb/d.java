package pb;

import android.view.SurfaceHolder;
import android.view.View;
import android.view.ViewGroup;
import com.bytedance.sdk.openadsdk.core.syc.zb.lud;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class d extends c implements SurfaceHolder.Callback, f {

    /* renamed from: c, reason: collision with root package name */
    public static final ArrayList f82492c = new ArrayList();

    /* renamed from: a, reason: collision with root package name */
    public WeakReference f82493a;

    /* renamed from: b, reason: collision with root package name */
    public b f82494b;

    @Override // pb.f
    public final void a(lud ludVar) {
        this.f82493a = new WeakReference(ludVar);
        SurfaceHolder holder = getHolder();
        holder.setFormat(-3);
        Iterator it = f82492c.iterator();
        while (it.hasNext()) {
            b bVar = (b) it.next();
            if (bVar != null && ((SurfaceHolder.Callback) bVar.f82491a.get()) == null) {
                holder.removeCallback(bVar);
                it.remove();
            }
        }
        holder.addCallback(this.f82494b);
    }

    @Override // pb.f
    public final View c() {
        return this;
    }

    @Override // android.view.SurfaceView, android.view.View
    public final void onWindowVisibilityChanged(int i5) {
        super.onWindowVisibilityChanged(i5);
    }

    @Override // android.view.SurfaceHolder.Callback
    public final void surfaceChanged(SurfaceHolder surfaceHolder, int i5, int i11, int i12) {
        WeakReference weakReference = this.f82493a;
        if (weakReference == null || weakReference.get() == null) {
            return;
        }
        ((e) this.f82493a.get()).ycx(surfaceHolder, i5, i11, i12);
    }

    @Override // android.view.SurfaceHolder.Callback
    public final void surfaceCreated(SurfaceHolder surfaceHolder) {
        WeakReference weakReference = this.f82493a;
        if (weakReference == null || weakReference.get() == null) {
            return;
        }
        ((e) this.f82493a.get()).ycx(surfaceHolder);
    }

    @Override // android.view.SurfaceHolder.Callback
    public final void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        WeakReference weakReference = this.f82493a;
        if (weakReference == null || weakReference.get() == null) {
            return;
        }
        ((e) this.f82493a.get()).zb(surfaceHolder);
    }

    @Override // pb.f
    public final void ycx(int i5, int i11) {
        ViewGroup.LayoutParams layoutParams = getLayoutParams();
        layoutParams.height = i11;
        layoutParams.width = i5;
        setLayoutParams(layoutParams);
    }
}
