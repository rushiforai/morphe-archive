package q9;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.android.launcher3.allapps.WorkEduCard;

/* loaded from: classes.dex */
public final class z extends u {

    /* renamed from: a, reason: collision with root package name */
    public int f83901a;

    @Override // q9.u
    public final int a(int i5) {
        return 1;
    }

    @Override // q9.u
    public final boolean b(int i5) {
        return i5 == 2097152 || i5 == 1048576;
    }

    @Override // q9.u
    public final void c(l lVar, int i5) {
        View view = lVar.itemView;
        if (view instanceof WorkEduCard) {
            ((WorkEduCard) view).a(i5);
        }
    }

    @Override // q9.u
    public final l d(int i5, LayoutInflater layoutInflater, ViewGroup viewGroup) {
        return new l(layoutInflater.inflate(i5 == 2097152 ? 2131624477 : 2131624476, viewGroup, false));
    }
}
