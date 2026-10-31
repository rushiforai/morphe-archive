package p9;

import com.android.launcher3.CellLayout;
import com.android.launcher3.folder.FolderPagedView;

/* loaded from: classes2.dex */
public final class b extends a {

    /* renamed from: u, reason: collision with root package name */
    public final int f82462u;

    /* renamed from: v, reason: collision with root package name */
    public final FolderPagedView f82463v;

    public b(CellLayout cellLayout) {
        super(cellLayout);
        FolderPagedView folderPagedView = (FolderPagedView) cellLayout.getParent();
        this.f82463v = folderPagedView;
        this.f82462u = folderPagedView.indexOfChild(cellLayout) * cellLayout.f20903g * cellLayout.f20904h;
    }

    @Override // p9.a
    public final String t(int i5) {
        return this.f82459r.getString(2132018077);
    }

    @Override // p9.a
    public final String v(int i5) {
        return this.f82459r.getString(2132018645, Integer.valueOf(i5 + this.f82462u + 1));
    }

    @Override // p9.a
    public final int w(int i5) {
        return Math.min(i5, (this.f82463v.f21137b0 - this.f82462u) - 1);
    }
}
