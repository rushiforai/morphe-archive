package y9;

import android.util.ArrayMap;
import android.view.View;
import com.android.launcher3.CellLayout;
import com.android.launcher3.folder.FolderPagedView;

/* loaded from: classes2.dex */
public final class s implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f96952a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f96953b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f96954c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ FolderPagedView f96955d;

    public s(FolderPagedView folderPagedView, View view, float f11, int i5) {
        this.f96955d = folderPagedView;
        this.f96952a = view;
        this.f96953b = f11;
        this.f96954c = i5;
    }

    @Override // java.lang.Runnable
    public final void run() {
        FolderPagedView folderPagedView = this.f96955d;
        ArrayMap arrayMap = folderPagedView.V;
        View view = this.f96952a;
        arrayMap.remove(view);
        view.setTranslationX(this.f96953b);
        ((CellLayout) view.getParent().getParent()).removeView(view);
        folderPagedView.t0(view, (ga.j) view.getTag(), this.f96954c);
    }
}
