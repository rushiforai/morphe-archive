package ok;

import com.google.android.play.core.integrity.StandardIntegrityException;
import com.google.android.play.integrity.internal.af;
import tk.t;

/* loaded from: classes3.dex */
public abstract class g extends t {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h f80473b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(h hVar, fi.j jVar) {
        super(jVar);
        this.f80473b = hVar;
    }

    @Override // tk.t
    public final void a(Exception exc) {
        if (!(exc instanceof af)) {
            super.a(exc);
        } else if (h.d(this.f80473b)) {
            super.a(new StandardIntegrityException(exc, -2));
        } else {
            super.a(new StandardIntegrityException(exc, -9));
        }
    }
}
