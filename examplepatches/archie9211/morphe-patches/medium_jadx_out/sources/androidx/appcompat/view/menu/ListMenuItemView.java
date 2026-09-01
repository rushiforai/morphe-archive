package androidx.appcompat.view.menu;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.TextView;
import com.medium.reader.R;
import defpackage.esa;
import defpackage.lx7;
import defpackage.ny7;
import defpackage.sx7;
import defpackage.vwa;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ListMenuItemView extends LinearLayout implements ny7, AbsListView.SelectionBoundsAdjuster {
    public sx7 a;
    public ImageView b;
    public RadioButton c;
    public TextView d;
    public CheckBox e;
    public TextView f;
    public ImageView g;
    public ImageView h;
    public LinearLayout i;
    public final Drawable j;
    public final int k;
    public final Context l;
    public boolean m;
    public final Drawable n;
    public final boolean o;
    public LayoutInflater p;
    public boolean q;

    public ListMenuItemView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        vwa vwaVarX = vwa.x(getContext(), attributeSet, esa.r, R.attr.listMenuViewStyle);
        this.j = vwaVarX.q(5);
        TypedArray typedArray = (TypedArray) vwaVarX.c;
        this.k = typedArray.getResourceId(1, -1);
        this.m = typedArray.getBoolean(7, false);
        this.l = context;
        this.n = vwaVarX.q(8);
        TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(null, new int[]{android.R.attr.divider}, R.attr.dropDownListViewStyle, 0);
        this.o = typedArrayObtainStyledAttributes.hasValue(0);
        vwaVarX.C();
        typedArrayObtainStyledAttributes.recycle();
    }

    private LayoutInflater getInflater() {
        LayoutInflater layoutInflater = this.p;
        if (layoutInflater != null) {
            return layoutInflater;
        }
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(getContext());
        this.p = layoutInflaterFrom;
        return layoutInflaterFrom;
    }

    private void setSubMenuArrowVisible(boolean z) {
        ImageView imageView = this.g;
        if (imageView != null) {
            imageView.setVisibility(z ? 0 : 8);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0035  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0053  */
    @Override // defpackage.ny7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a(defpackage.sx7 r11) {
        /*
            Method dump skipped, instruction units count: 310
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.appcompat.view.menu.ListMenuItemView.a(sx7):void");
    }

    @Override // android.widget.AbsListView.SelectionBoundsAdjuster
    public final void adjustListItemSelectionBounds(Rect rect) {
        ImageView imageView = this.h;
        if (imageView == null || imageView.getVisibility() != 0) {
            return;
        }
        LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) this.h.getLayoutParams();
        rect.top = this.h.getHeight() + layoutParams.topMargin + layoutParams.bottomMargin + rect.top;
    }

    @Override // defpackage.ny7
    public sx7 getItemData() {
        return this.a;
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        setBackground(this.j);
        TextView textView = (TextView) findViewById(R.id.title);
        this.d = textView;
        int i = this.k;
        if (i != -1) {
            textView.setTextAppearance(this.l, i);
        }
        this.f = (TextView) findViewById(R.id.shortcut);
        ImageView imageView = (ImageView) findViewById(R.id.submenuarrow);
        this.g = imageView;
        if (imageView != null) {
            imageView.setImageDrawable(this.n);
        }
        this.h = (ImageView) findViewById(R.id.group_divider);
        this.i = (LinearLayout) findViewById(R.id.content);
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onMeasure(int i, int i2) {
        if (this.b != null && this.m) {
            ViewGroup.LayoutParams layoutParams = getLayoutParams();
            LinearLayout.LayoutParams layoutParams2 = (LinearLayout.LayoutParams) this.b.getLayoutParams();
            int i3 = layoutParams.height;
            if (i3 > 0 && layoutParams2.width <= 0) {
                layoutParams2.width = i3;
            }
        }
        super.onMeasure(i, i2);
    }

    public void setCheckable(boolean z) {
        CompoundButton compoundButton;
        CompoundButton compoundButton2;
        CompoundButton compoundButton3;
        if (!z && this.c == null && this.e == null) {
            return;
        }
        if ((this.a.x & 4) != 0) {
            if (this.c == null) {
                RadioButton radioButton = (RadioButton) getInflater().inflate(R.layout.abc_list_menu_item_radio, (ViewGroup) this, false);
                this.c = radioButton;
                LinearLayout linearLayout = this.i;
                if (linearLayout != null) {
                    linearLayout.addView(radioButton, -1);
                } else {
                    addView(radioButton, -1);
                }
            }
            compoundButton = this.c;
            compoundButton2 = this.e;
            compoundButton3 = compoundButton2;
        } else {
            if (this.e == null) {
                CheckBox checkBox = (CheckBox) getInflater().inflate(R.layout.abc_list_menu_item_checkbox, (ViewGroup) this, false);
                this.e = checkBox;
                LinearLayout linearLayout2 = this.i;
                if (linearLayout2 != null) {
                    linearLayout2.addView(checkBox, -1);
                } else {
                    addView(checkBox, -1);
                }
            }
            compoundButton = this.e;
            compoundButton2 = this.c;
            compoundButton3 = compoundButton;
        }
        if (!z) {
            if (compoundButton3 != null) {
                compoundButton3.setVisibility(8);
            }
            RadioButton radioButton2 = this.c;
            if (radioButton2 != null) {
                radioButton2.setVisibility(8);
                return;
            }
            return;
        }
        compoundButton.setChecked(this.a.isChecked());
        if (compoundButton.getVisibility() != 0) {
            compoundButton.setVisibility(0);
        }
        if (compoundButton2 == null || compoundButton2.getVisibility() == 8) {
            return;
        }
        compoundButton2.setVisibility(8);
    }

    public void setChecked(boolean z) {
        CompoundButton compoundButton;
        if ((this.a.x & 4) != 0) {
            if (this.c == null) {
                RadioButton radioButton = (RadioButton) getInflater().inflate(R.layout.abc_list_menu_item_radio, (ViewGroup) this, false);
                this.c = radioButton;
                LinearLayout linearLayout = this.i;
                if (linearLayout != null) {
                    linearLayout.addView(radioButton, -1);
                } else {
                    addView(radioButton, -1);
                }
            }
            compoundButton = this.c;
        } else {
            if (this.e == null) {
                CheckBox checkBox = (CheckBox) getInflater().inflate(R.layout.abc_list_menu_item_checkbox, (ViewGroup) this, false);
                this.e = checkBox;
                LinearLayout linearLayout2 = this.i;
                if (linearLayout2 != null) {
                    linearLayout2.addView(checkBox, -1);
                } else {
                    addView(checkBox, -1);
                }
            }
            compoundButton = this.e;
        }
        compoundButton.setChecked(z);
    }

    public void setForceShowIcon(boolean z) {
        this.q = z;
        this.m = z;
    }

    public void setGroupDividerEnabled(boolean z) {
        ImageView imageView = this.h;
        if (imageView != null) {
            imageView.setVisibility((this.o || !z) ? 8 : 0);
        }
    }

    public void setIcon(Drawable drawable) {
        lx7 lx7Var = this.a.n;
        boolean z = this.q;
        if (z || this.m) {
            ImageView imageView = this.b;
            if (imageView == null && drawable == null && !this.m) {
                return;
            }
            if (imageView == null) {
                ImageView imageView2 = (ImageView) getInflater().inflate(R.layout.abc_list_menu_item_icon, (ViewGroup) this, false);
                this.b = imageView2;
                LinearLayout linearLayout = this.i;
                if (linearLayout != null) {
                    linearLayout.addView(imageView2, 0);
                } else {
                    addView(imageView2, 0);
                }
            }
            if (drawable == null && !this.m) {
                this.b.setVisibility(8);
                return;
            }
            ImageView imageView3 = this.b;
            if (!z) {
                drawable = null;
            }
            imageView3.setImageDrawable(drawable);
            if (this.b.getVisibility() != 0) {
                this.b.setVisibility(0);
            }
        }
    }

    public void setTitle(CharSequence charSequence) {
        TextView textView = this.d;
        if (charSequence == null) {
            if (textView.getVisibility() != 8) {
                this.d.setVisibility(8);
            }
        } else {
            textView.setText(charSequence);
            if (this.d.getVisibility() != 0) {
                this.d.setVisibility(0);
            }
        }
    }
}
