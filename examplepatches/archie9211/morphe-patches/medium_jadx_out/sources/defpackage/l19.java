package defpackage;

import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.proto.model.SectionModel;
import com.medium.reader.R;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l19 {
    public final EditPostBodyView a;
    public final x45 b;

    public l19(EditPostBodyView editPostBodyView, x45 x45Var) {
        this.a = editPostBodyView;
        this.b = x45Var;
    }

    public final void a(int i, SectionModel sectionModel) {
        sectionModel.getClass();
        EditPostBodyView editPostBodyView = this.a;
        if (editPostBodyView.getChildCount() == 0 && i == 0) {
            return;
        }
        fy3 fy3Var = fy3.a;
        if (i == 0) {
            wld.a.e(null, "Cannot add divider at index 0", new Object[0]);
            hy2 hy2Var = g01.y;
            if (hy2Var != null) {
                hy2Var.a("Cannot add divider at index 0", null, fy3Var);
                return;
            }
            return;
        }
        int i2 = sectionModel.start_index;
        if (i2 == 0) {
            wld.a.e(null, "Cannot add divider at start_index 0", new Object[0]);
            hy2 hy2Var2 = g01.y;
            if (hy2Var2 != null) {
                hy2Var2.a("Cannot add divider at start_index 0", null, fy3Var);
                return;
            }
            return;
        }
        j19 j19VarB = b(i2);
        if (j19VarB == null) {
            String strW = b09.w(sectionModel.start_index, "Cannot add divider, no paragraph at index ");
            wld.a.e(null, strW, new Object[0]);
            hy2 hy2Var3 = g01.y;
            if (hy2Var3 != null) {
                hy2Var3.a(strW, null, fy3Var);
                return;
            }
            return;
        }
        int iIndexOfChild = editPostBodyView.indexOfChild(j19VarB.a());
        Integer numValueOf = Integer.valueOf(iIndexOfChild);
        if (iIndexOfChild < 0) {
            numValueOf = null;
        }
        if (numValueOf == null) {
            wld.a.e(null, "Cannot add divider, view not found in container", new Object[0]);
            hy2 hy2Var4 = g01.y;
            if (hy2Var4 != null) {
                hy2Var4.a("Cannot add divider, view not found in container", null, fy3Var);
                return;
            }
            return;
        }
        View childAt = editPostBodyView.getChildAt(numValueOf.intValue() - 1);
        childAt.getClass();
        if (g76.L(childAt.getTag(), "divider")) {
            String strW2 = b09.w(i, "Cannot add adjacent dividers at ");
            wld.a.e(null, strW2, new Object[0]);
            hy2 hy2Var5 = g01.y;
            if (hy2Var5 != null) {
                hy2Var5.a(strW2, null, fy3Var);
                return;
            }
            return;
        }
        final View viewInflate = LayoutInflater.from(editPostBodyView.getContext()).inflate(R.layout.common_edit_post_section_separator, (ViewGroup) editPostBodyView, false);
        final View viewFindViewById = viewInflate.findViewById(R.id.close);
        final Drawable drawableE = guc.E(editPostBodyView.getContext(), R.drawable.edit_post_section_separator_background_focused);
        viewInflate.setTag("divider");
        viewInflate.setClickable(true);
        viewInflate.setFocusable(true);
        viewInflate.setFocusableInTouchMode(true);
        viewInflate.setDuplicateParentStateEnabled(true);
        viewInflate.setOnFocusChangeListener(new View.OnFocusChangeListener() { // from class: k19
            @Override // android.view.View.OnFocusChangeListener
            public final void onFocusChange(View view, boolean z) {
                viewInflate.setBackground(z ? drawableE : null);
                View view2 = viewFindViewById;
                view2.getClass();
                view2.setVisibility(!z ? 4 : 0);
            }
        });
        viewFindViewById.setOnClickListener(new f19(this, 1, sectionModel));
        editPostBodyView.addView(viewInflate, numValueOf.intValue());
    }

    public final j19 b(int i) {
        List listD = d();
        try {
            return (j19) listD.get(i);
        } catch (IndexOutOfBoundsException e) {
            wld.a.e(e, ev6.v("getGrafAt ", i, listD.size(), " is out of bound in grafViews "), new Object[0]);
            return null;
        }
    }

    public final int c() {
        return d().size();
    }

    public final List d() {
        return szb.O0(new zh4(new j80(6, this.a), true, h06.C));
    }

    public final void e(int i) {
        fy3 fy3Var = fy3.a;
        if (i == 0) {
            wld.a.e(null, "Cannot remove section at index 0", new Object[0]);
            hy2 hy2Var = g01.y;
            if (hy2Var != null) {
                hy2Var.a("Cannot remove section at index 0", null, fy3Var);
                return;
            }
            return;
        }
        EditPostBodyView editPostBodyView = this.a;
        List listO0 = szb.O0(new zh4(new j80(6, editPostBodyView), true, new g98(1, this, l19.class, "isDividerChild", "isDividerChild(Landroid/view/View;)Z", 0, 10)));
        if (listO0.isEmpty()) {
            wld.a.e(null, "No dividers found", new Object[0]);
            hy2 hy2Var2 = g01.y;
            if (hy2Var2 != null) {
                hy2Var2.a("No dividers found", null, fy3Var);
                return;
            }
            return;
        }
        int i2 = i - 1;
        View view = (View) bu1.A0(i2, listO0);
        if (view != null) {
            editPostBodyView.removeView(view);
            return;
        }
        String strW = b09.w(i2, "No divider found at index ");
        wld.a.e(null, strW, new Object[0]);
        hy2 hy2Var3 = g01.y;
        if (hy2Var3 != null) {
            hy2Var3.a(strW, null, fy3Var);
        }
    }
}
