package b00;

import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;
import java.util.Collection;
import kotlin.Unit;

/* loaded from: classes.dex */
public final class d extends ContentObserver {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16316a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ v70.a0 f16317b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(v70.a0 a0Var, Handler handler, int i5) {
        super(handler);
        this.f16316a = i5;
        this.f16317b = a0Var;
    }

    @Override // android.database.ContentObserver
    public void onChange(boolean z11, Collection collection, int i5) {
        switch (this.f16316a) {
            case 0:
                ((v70.w) ((v70.x) this.f16317b)).j(Unit.f71706a);
                break;
            default:
                super.onChange(z11, (Collection<Uri>) collection, i5);
                break;
        }
    }

    @Override // android.database.ContentObserver
    public void onChange(boolean z11, Uri uri) {
        switch (this.f16316a) {
            case 1:
                ((v70.i) this.f16317b).j(Unit.f71706a);
                break;
            default:
                super.onChange(z11, uri);
                break;
        }
    }
}
