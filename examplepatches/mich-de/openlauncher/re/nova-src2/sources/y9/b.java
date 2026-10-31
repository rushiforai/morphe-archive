package y9;

import android.graphics.Rect;
import android.view.View;
import com.android.launcher3.folder.Folder;

/* loaded from: classes2.dex */
public final /* synthetic */ class b implements ya.w {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f96882a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Folder f96883b;

    public /* synthetic */ b(Folder folder, int i5) {
        this.f96882a = i5;
        this.f96883b = folder;
    }

    @Override // ya.w
    public final boolean k(View view, ga.e eVar) {
        int i5 = this.f96882a;
        Folder folder = this.f96883b;
        switch (i5) {
            case 0:
                Rect rect = Folder.f21093j0;
                if (eVar instanceof ga.c) {
                    ga.c cVar = (ga.c) eVar;
                    if (cVar.T0() == folder.f21115m.T0()) {
                        cVar.X0(false);
                    }
                }
                return false;
            default:
                return !folder.f21106g.add(view);
        }
    }
}
