package ud;

import android.content.Context;
import com.google.android.datatransport.cct.CctBackendFactory;
import java.util.HashMap;
import x7.l;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final l f90799a;

    /* renamed from: b, reason: collision with root package name */
    public final i50.c f90800b;

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f90801c;

    public e(Context context, i50.c cVar) {
        l lVar = new l();
        lVar.f95146b = null;
        lVar.f95145a = context;
        this.f90801c = new HashMap();
        this.f90799a = lVar;
        this.f90800b = cVar;
    }

    public final synchronized f a(String str) {
        if (this.f90801c.containsKey(str)) {
            return (f) this.f90801c.get(str);
        }
        CctBackendFactory cctBackendFactoryG = this.f90799a.g(str);
        if (cctBackendFactoryG == null) {
            return null;
        }
        i50.c cVar = this.f90800b;
        f fVarCreate = cctBackendFactoryG.create(new c((Context) cVar.f61379b, (de.a) cVar.f61380c, (de.a) cVar.f61381d, str));
        this.f90801c.put(str, fVarCreate);
        return fVarCreate;
    }
}
