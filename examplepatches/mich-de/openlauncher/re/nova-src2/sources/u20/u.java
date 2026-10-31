package u20;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.view.View;
import android.view.ViewGroup;
import com.teslacoilsw.launcher.theme.AbstractThumbnailPicker;
import com.teslacoilsw.launcher.theme.ThemeListFragment;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u extends com.teslacoilsw.launcher.theme.c {

    /* renamed from: f, reason: collision with root package name */
    public final ViewGroup f90515f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ com.teslacoilsw.launcher.theme.d f90516g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(com.teslacoilsw.launcher.theme.d dVar, View view) {
        super(dVar, view);
        this.f90516g = dVar;
        View viewFindViewById = view.findViewById(2131428209);
        Intrinsics.e(viewFindViewById, "null cannot be cast to non-null type android.view.ViewGroup");
        ViewGroup viewGroup = (ViewGroup) viewFindViewById;
        this.f90515f = viewGroup;
        int childCount = viewGroup.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = this.f90515f.getChildAt(i5);
            ViewGroup.LayoutParams layoutParams = childAt.getLayoutParams();
            int i11 = this.f90516g.f46353c;
            layoutParams.width = i11;
            layoutParams.height = i11;
            childAt.setOnClickListener(this);
        }
        View viewFindViewById2 = view.findViewById(2131428412);
        viewFindViewById2.setClickable(false);
        viewFindViewById2.setOnClickListener(null);
        view.setClickable(false);
        view.setFocusable(false);
        view.setOnClickListener(null);
        view.setOnLongClickListener(null);
    }

    @Override // com.teslacoilsw.launcher.theme.c, android.view.View.OnClickListener
    public final void onClick(View view) {
        ThemeListFragment themeListFragment = this.f90516g.f46355e;
        Activity activity = themeListFragment.getActivity();
        Intent intent = new Intent();
        int iIndexOfChild = this.f90515f.indexOfChild(view);
        Object tag = view.getTag();
        Intrinsics.e(tag, "null cannot be cast to non-null type kotlin.Pair<android.net.Uri?, android.graphics.Bitmap>");
        Pair pair = (Pair) tag;
        if (themeListFragment.f46331d == v20.e.f92028d && iIndexOfChild == 0) {
            intent.putExtra("useDefaultIcon", true);
        } else {
            Object obj = pair.f71683a;
            if (obj != null) {
                intent.setData((Uri) obj);
            } else {
                intent.setData(AbstractThumbnailPicker.j(activity, (Bitmap) pair.f71684b));
            }
        }
        activity.setResult(-1, intent);
        activity.finish();
    }
}
