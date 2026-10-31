package com.google.android.material.datepicker;

import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.EditText;
import androidx.appcompat.widget.AppCompatTextView;
import androidx.preference.Preference;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.m1;
import com.google.android.material.button.MaterialButton;
import com.google.android.material.button.MaterialButtonToggleGroup;
import com.google.android.material.internal.CheckableImageButton;
import com.google.android.material.internal.NavigationMenuItemView;
import com.google.android.material.textfield.TextInputLayout;

/* loaded from: classes3.dex */
public final class l extends a5.b {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f34258d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f34259e;

    public /* synthetic */ l(Object obj, int i5) {
        this.f34258d = i5;
        this.f34259e = obj;
    }

    @Override // a5.b
    public void c(View view, AccessibilityEvent accessibilityEvent) {
        switch (this.f34258d) {
            case 5:
                super.c(view, accessibilityEvent);
                accessibilityEvent.setChecked(((CheckableImageButton) this.f34259e).f34314d);
                break;
            default:
                super.c(view, accessibilityEvent);
                break;
        }
    }

    @Override // a5.b
    public final void d(View view, b5.g gVar) {
        AppCompatTextView appCompatTextView;
        int i5;
        Preference preferenceB;
        int i11 = this.f34258d;
        View.AccessibilityDelegate accessibilityDelegate = this.f258a;
        Object obj = this.f34259e;
        switch (i11) {
            case 0:
                accessibilityDelegate.onInitializeAccessibilityNodeInfo(view, gVar.k0());
                MaterialCalendar materialCalendar = (MaterialCalendar) obj;
                gVar.f17551a.setHintText(materialCalendar.f34205l.getVisibility() == 0 ? materialCalendar.getString(2132018706) : materialCalendar.getString(2132018704));
                break;
            case 1:
                AccessibilityNodeInfo accessibilityNodeInfo = gVar.f17551a;
                accessibilityDelegate.onInitializeAccessibilityNodeInfo(view, gVar.k0());
                TextInputLayout textInputLayout = (TextInputLayout) obj;
                EditText editText = textInputLayout.f34369d;
                fk.p pVar = textInputLayout.f34381j;
                CharSequence contentDescription = null;
                CharSequence text = editText != null ? editText.getText() : null;
                CharSequence charSequence = textInputLayout.C ? textInputLayout.D : null;
                CharSequence charSequence2 = pVar.f55243q ? pVar.f55242p : null;
                CharSequence charSequence3 = textInputLayout.f34397s ? textInputLayout.f34395r : null;
                int i12 = textInputLayout.f34385l;
                if (textInputLayout.f34383k && textInputLayout.f34387m && (appCompatTextView = textInputLayout.o) != null) {
                    contentDescription = appCompatTextView.getContentDescription();
                }
                boolean zIsEmpty = TextUtils.isEmpty(text);
                boolean zIsEmpty2 = TextUtils.isEmpty(charSequence);
                boolean z11 = textInputLayout.f34400t0;
                boolean zIsEmpty3 = TextUtils.isEmpty(charSequence2);
                i = (zIsEmpty3 && TextUtils.isEmpty(contentDescription)) ? 0 : 1;
                String string = !zIsEmpty2 ? charSequence.toString() : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                fk.v vVar = textInputLayout.f34365b;
                View view2 = vVar.f55271b;
                if (view2.getVisibility() == 0) {
                    accessibilityNodeInfo.setLabelFor(view2);
                    gVar.f0(view2);
                } else {
                    gVar.f0(vVar.f55273d);
                }
                if (!zIsEmpty) {
                    gVar.c0(text);
                } else if (!TextUtils.isEmpty(string)) {
                    gVar.c0(string);
                    if (!z11 && charSequence3 != null) {
                        gVar.c0(string + ", " + ((Object) charSequence3));
                    }
                } else if (charSequence3 != null) {
                    gVar.c0(charSequence3);
                }
                if (!TextUtils.isEmpty(string)) {
                    accessibilityNodeInfo.setHintText(string);
                    accessibilityNodeInfo.setShowingHintText(zIsEmpty);
                }
                gVar.O((text == null || text.length() != i12) ? -1 : i12);
                if (i != 0) {
                    if (zIsEmpty3) {
                        charSequence2 = contentDescription;
                    }
                    gVar.H(charSequence2);
                }
                AppCompatTextView appCompatTextView2 = pVar.f55251y;
                if (appCompatTextView2 != null) {
                    accessibilityNodeInfo.setLabelFor(appCompatTextView2);
                }
                textInputLayout.f34367c.b().m(gVar);
                break;
            case 2:
                AccessibilityNodeInfo accessibilityNodeInfo2 = gVar.f17551a;
                accessibilityDelegate.onInitializeAccessibilityNodeInfo(view, gVar.k0());
                if (!((gj.d) obj).f57697j) {
                    accessibilityNodeInfo2.setDismissable(false);
                    break;
                } else {
                    gVar.a(1048576);
                    accessibilityNodeInfo2.setDismissable(true);
                    break;
                }
            case 3:
                accessibilityDelegate.onInitializeAccessibilityNodeInfo(view, gVar.k0());
                MaterialButtonToggleGroup materialButtonToggleGroup = (MaterialButtonToggleGroup) obj;
                int i13 = MaterialButtonToggleGroup.f34131k;
                if (view instanceof MaterialButton) {
                    int i14 = 0;
                    while (i < materialButtonToggleGroup.getChildCount()) {
                        if (materialButtonToggleGroup.getChildAt(i) == view) {
                            i5 = i14;
                        } else {
                            if ((materialButtonToggleGroup.getChildAt(i) instanceof MaterialButton) && materialButtonToggleGroup.c(i)) {
                                i14++;
                            }
                            i++;
                        }
                    }
                    i5 = -1;
                } else {
                    i5 = -1;
                }
                gVar.B(b5.f.k(false, ((MaterialButton) view).o, 0, 1, i5, 1));
                break;
            case 4:
                r6.f fVar = (r6.f) obj;
                fVar.f85537g.d(view, gVar);
                RecyclerView recyclerView = fVar.f85536f;
                int childAdapterPosition = recyclerView.getChildAdapterPosition(view);
                m1 adapter = recyclerView.getAdapter();
                if ((adapter instanceof r6.e) && (preferenceB = ((r6.e) adapter).b(childAdapterPosition)) != null) {
                    preferenceB.i(gVar);
                    break;
                }
                break;
            case 5:
                accessibilityDelegate.onInitializeAccessibilityNodeInfo(view, gVar.k0());
                CheckableImageButton checkableImageButton = (CheckableImageButton) obj;
                gVar.w(checkableImageButton.f34315e);
                gVar.x(checkableImageButton.f34314d);
                break;
            default:
                accessibilityDelegate.onInitializeAccessibilityNodeInfo(view, gVar.k0());
                gVar.w(((NavigationMenuItemView) obj).f34325w);
                break;
        }
    }

    @Override // a5.b
    public void e(View view, AccessibilityEvent accessibilityEvent) {
        switch (this.f34258d) {
            case 1:
                super.e(view, accessibilityEvent);
                ((TextInputLayout) this.f34259e).f34367c.b().n(accessibilityEvent);
                break;
            default:
                super.e(view, accessibilityEvent);
                break;
        }
    }

    @Override // a5.b
    public boolean g(View view, int i5, Bundle bundle) {
        switch (this.f34258d) {
            case 2:
                if (i5 == 1048576) {
                    gj.d dVar = (gj.d) this.f34259e;
                    if (dVar.f57697j) {
                        dVar.cancel();
                        return true;
                    }
                }
                return super.g(view, i5, bundle);
            case 3:
            default:
                return super.g(view, i5, bundle);
            case 4:
                return ((r6.f) this.f34259e).f85537g.g(view, i5, bundle);
        }
    }

    public l(TextInputLayout textInputLayout) {
        this.f34258d = 1;
        this.f34259e = textInputLayout;
    }
}
