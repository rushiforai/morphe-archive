package u20;

import android.content.AsyncTaskLoader;
import android.content.Context;
import android.content.pm.PackageManager;
import java.util.List;

/* loaded from: classes4.dex */
public abstract class f extends AsyncTaskLoader {

    /* renamed from: a, reason: collision with root package name */
    public final Context f90470a;

    /* renamed from: b, reason: collision with root package name */
    public final PackageManager f90471b;

    /* renamed from: c, reason: collision with root package name */
    public List f90472c;

    public f(Context context) {
        super(context);
        this.f90472c = null;
        this.f90470a = context.getApplicationContext();
        this.f90471b = context.getApplicationContext().getPackageManager();
    }

    @Override // android.content.Loader
    public final void deliverResult(Object obj) {
        List list = (List) obj;
        isReset();
        this.f90472c = list;
        if (isStarted()) {
            super.deliverResult(list);
        }
    }

    @Override // android.content.AsyncTaskLoader
    public final void onCanceled(Object obj) {
        super.onCanceled((List) obj);
    }

    @Override // android.content.Loader
    public final void onReset() {
        super.onReset();
        cancelLoad();
        if (this.f90472c != null) {
            this.f90472c = null;
        }
    }

    @Override // android.content.Loader
    public final void onStartLoading() {
        List list = this.f90472c;
        if (list == null) {
            forceLoad();
            return;
        }
        isReset();
        this.f90472c = list;
        if (isStarted()) {
            super.deliverResult(list);
        }
    }

    @Override // android.content.Loader
    public final void onStopLoading() {
        cancelLoad();
    }
}
