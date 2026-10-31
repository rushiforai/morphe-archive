package x4;

import android.content.Context;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.Callable;

/* loaded from: classes2.dex */
public final class d implements Callable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f95072a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f95073b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Context f95074c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f95075d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f95076e;

    public /* synthetic */ d(String str, Context context, Object obj, int i5, int i11) {
        this.f95072a = i11;
        this.f95073b = str;
        this.f95074c = context;
        this.f95076e = obj;
        this.f95075d = i5;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        switch (this.f95072a) {
            case 0:
                Object[] objArr = {(c) this.f95076e};
                ArrayList arrayList = new ArrayList(1);
                Object obj = objArr[0];
                Objects.requireNonNull(obj);
                arrayList.add(obj);
                return g.b(this.f95073b, this.f95074c, Collections.unmodifiableList(arrayList), this.f95075d);
            default:
                try {
                    return g.b(this.f95073b, this.f95074c, (List) this.f95076e, this.f95075d);
                } catch (Throwable unused) {
                    return new f(-3);
                }
        }
    }
}
