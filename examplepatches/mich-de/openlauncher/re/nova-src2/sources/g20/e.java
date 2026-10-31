package g20;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import java.util.List;
import kotlin.NotImplementedError;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e implements s80.a, s80.d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f56934a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f56935b;

    public /* synthetic */ e(Object obj, int i5) {
        this.f56934a = i5;
        this.f56935b = obj;
    }

    @Override // s80.c
    public final s80.e a() {
        switch (this.f56934a) {
        }
        return s80.e.f86765a;
    }

    @Override // s80.a
    public final Intent b(Activity activity) {
        switch (this.f56934a) {
            case 0:
                throw new NotImplementedError("An operation is not implemented: Not yet implemented");
            default:
                throw new IllegalStateException();
        }
    }

    @Override // s80.a
    public final String c(Context context) {
        switch (this.f56934a) {
            case 0:
                throw new NotImplementedError("An operation is not implemented: Not yet implemented");
            default:
                return "Maps";
        }
    }

    @Override // s80.c
    public final String d() {
        switch (this.f56934a) {
            case 0:
                return (String) this.f56935b;
            default:
                return "com.google.android.apps.maps";
        }
    }

    @Override // s80.d
    public final Object e(ContinuationImpl continuationImpl) {
        switch (this.f56934a) {
            case 0:
                return EmptyList.f71733a;
            default:
                return (List) this.f56935b;
        }
    }

    @Override // s80.a
    public final Object f(int i5, Intent intent, Continuation continuation) {
        switch (this.f56934a) {
            case 0:
                throw new NotImplementedError("An operation is not implemented: Not yet implemented");
            default:
                throw new IllegalStateException();
        }
    }
}
