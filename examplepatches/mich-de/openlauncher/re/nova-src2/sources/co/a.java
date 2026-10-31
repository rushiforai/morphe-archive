package co;

import android.os.AsyncTask;
import mg.l;

/* loaded from: classes3.dex */
public abstract class a extends AsyncTask {

    /* renamed from: a, reason: collision with root package name */
    public l f20146a;

    /* renamed from: b, reason: collision with root package name */
    public final io.sentry.internal.debugmeta.c f20147b;

    public a(io.sentry.internal.debugmeta.c cVar) {
        this.f20147b = cVar;
    }

    @Override // android.os.AsyncTask
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public void onPostExecute(String str) {
        l lVar = this.f20146a;
        if (lVar != null) {
            lVar.f76311d = null;
            lVar.d();
        }
    }
}
