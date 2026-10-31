package u20;

import java.util.List;

/* loaded from: classes4.dex */
public final class l extends s {
    @Override // u20.s, android.content.AsyncTaskLoader
    /* renamed from: a */
    public final List loadInBackground() {
        if (this.f90509f != v20.e.f92028d) {
            return super.loadInBackground();
        }
        r rVar = (r) super.loadInBackground();
        rVar.d(this.f90470a.getResources().getString(2132019487)).f90462b = true;
        return rVar;
    }
}
