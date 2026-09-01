package defpackage;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.fragment.app.FragmentContainerView;
import androidx.fragment.app.strictmode.FragmentTagUsageViolation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r15 implements LayoutInflater.Factory2 {
    public final f25 a;

    public r15(f25 f25Var) {
        this.a = f25Var;
    }

    @Override // android.view.LayoutInflater.Factory2
    public final View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        boolean zIsAssignableFrom;
        s25 s25VarF;
        boolean zEquals = FragmentContainerView.class.getName().equals(str);
        f25 f25Var = this.a;
        if (zEquals) {
            return new FragmentContainerView(context, attributeSet, f25Var);
        }
        if ("fragment".equals(str)) {
            String attributeValue = attributeSet.getAttributeValue(null, "class");
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, asa.a);
            if (attributeValue == null) {
                attributeValue = typedArrayObtainStyledAttributes.getString(0);
            }
            int resourceId = typedArrayObtainStyledAttributes.getResourceId(1, -1);
            String string = typedArrayObtainStyledAttributes.getString(2);
            typedArrayObtainStyledAttributes.recycle();
            if (attributeValue != null) {
                try {
                    zIsAssignableFrom = j15.class.isAssignableFrom(w15.b(attributeValue, context.getClassLoader()));
                } catch (ClassNotFoundException unused) {
                    zIsAssignableFrom = false;
                }
                if (zIsAssignableFrom) {
                    int id = view != null ? view.getId() : 0;
                    if (id == -1 && resourceId == -1 && string == null) {
                        throw new IllegalArgumentException(attributeSet.getPositionDescription() + ": Must specify unique android:id, android:tag, or have a parent with an id for " + attributeValue);
                    }
                    j15 j15VarC = resourceId != -1 ? f25Var.C(resourceId) : null;
                    if (j15VarC == null && string != null) {
                        j15VarC = f25Var.D(string);
                    }
                    if (j15VarC == null && id != -1) {
                        j15VarC = f25Var.C(id);
                    }
                    if (j15VarC == null) {
                        w15 w15VarF = f25Var.F();
                        context.getClassLoader();
                        j15VarC = w15VarF.a(attributeValue);
                        j15VarC.n = true;
                        j15VarC.w = resourceId != 0 ? resourceId : id;
                        j15VarC.x = id;
                        j15VarC.y = string;
                        j15VarC.o = true;
                        j15VarC.s = f25Var;
                        l15 l15Var = f25Var.v;
                        j15VarC.t = l15Var;
                        j15VarC.G(l15Var.w, attributeSet, j15VarC.b);
                        s25VarF = f25Var.a(j15VarC);
                        if (f25.I(2)) {
                            Log.v("FragmentManager", "Fragment " + j15VarC + " has been inflated via the <fragment> tag: id=0x" + Integer.toHexString(resourceId));
                        }
                    } else {
                        if (j15VarC.o) {
                            throw new IllegalArgumentException(attributeSet.getPositionDescription() + ": Duplicate id 0x" + Integer.toHexString(resourceId) + ", tag " + string + ", or parent id 0x" + Integer.toHexString(id) + " with another fragment for " + attributeValue);
                        }
                        j15VarC.o = true;
                        j15VarC.s = f25Var;
                        l15 l15Var2 = f25Var.v;
                        j15VarC.t = l15Var2;
                        j15VarC.G(l15Var2.w, attributeSet, j15VarC.b);
                        s25VarF = f25Var.f(j15VarC);
                        if (f25.I(2)) {
                            Log.v("FragmentManager", "Retained Fragment " + j15VarC + " has been re-attached via the <fragment> tag: id=0x" + Integer.toHexString(resourceId));
                        }
                    }
                    ViewGroup viewGroup = (ViewGroup) view;
                    t25 t25Var = u25.a;
                    u25.b(new FragmentTagUsageViolation(j15VarC, "Attempting to use <fragment> tag to add fragment " + j15VarC + " to container " + viewGroup));
                    u25.a(j15VarC).getClass();
                    j15VarC.F = viewGroup;
                    s25VarF.k();
                    s25VarF.j();
                    View view2 = j15VarC.G;
                    if (view2 == null) {
                        ygf.f(ev6.x("Fragment ", attributeValue, " did not create a view."));
                        return null;
                    }
                    if (resourceId != 0) {
                        view2.setId(resourceId);
                    }
                    if (j15VarC.G.getTag() == null) {
                        j15VarC.G.setTag(string);
                    }
                    j15VarC.G.addOnAttachStateChangeListener(new q15(this, s25VarF));
                    return j15VarC.G;
                }
            }
        }
        return null;
    }

    @Override // android.view.LayoutInflater.Factory
    public final View onCreateView(String str, Context context, AttributeSet attributeSet) {
        return onCreateView(null, str, context, attributeSet);
    }
}
