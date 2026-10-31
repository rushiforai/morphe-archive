package androidx.appcompat.view.menu;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.TextView;
import androidx.recyclerview.widget.u1;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import l.a;
import q.k;
import q.m;
import q.x;
import x7.u;

/* loaded from: classes2.dex */
public class ListMenuItemView extends LinearLayout implements x, AbsListView.SelectionBoundsAdjuster {

    /* renamed from: a, reason: collision with root package name */
    public m f13676a;

    /* renamed from: b, reason: collision with root package name */
    public ImageView f13677b;

    /* renamed from: c, reason: collision with root package name */
    public RadioButton f13678c;

    /* renamed from: d, reason: collision with root package name */
    public TextView f13679d;

    /* renamed from: e, reason: collision with root package name */
    public CheckBox f13680e;

    /* renamed from: f, reason: collision with root package name */
    public TextView f13681f;

    /* renamed from: g, reason: collision with root package name */
    public ImageView f13682g;

    /* renamed from: h, reason: collision with root package name */
    public ImageView f13683h;

    /* renamed from: i, reason: collision with root package name */
    public LinearLayout f13684i;

    /* renamed from: j, reason: collision with root package name */
    public final Drawable f13685j;

    /* renamed from: k, reason: collision with root package name */
    public final int f13686k;

    /* renamed from: l, reason: collision with root package name */
    public final Context f13687l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f13688m;
    public final Drawable n;
    public final boolean o;

    /* renamed from: p, reason: collision with root package name */
    public LayoutInflater f13689p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f13690q;

    public ListMenuItemView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        u uVarR = u.r(getContext(), attributeSet, a.f72903r, 2130969541);
        this.f13685j = uVarR.l(5);
        TypedArray typedArray = (TypedArray) uVarR.f95209b;
        this.f13686k = typedArray.getResourceId(1, -1);
        this.f13688m = typedArray.getBoolean(7, false);
        this.f13687l = context;
        this.n = uVarR.l(8);
        TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(null, new int[]{16843049}, 2130969131, 0);
        this.o = typedArrayObtainStyledAttributes.hasValue(0);
        uVarR.s();
        typedArrayObtainStyledAttributes.recycle();
    }

    @Override // android.widget.AbsListView.SelectionBoundsAdjuster
    public final void adjustListItemSelectionBounds(Rect rect) {
        ImageView imageView = this.f13683h;
        if (imageView == null || imageView.getVisibility() != 0) {
            return;
        }
        LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) this.f13683h.getLayoutParams();
        rect.top = this.f13683h.getHeight() + layoutParams.topMargin + layoutParams.bottomMargin + rect.top;
    }

    @Override // q.x
    public final m c() {
        return this.f13676a;
    }

    /* JADX WARN: Removed duplicated region for block: B:65:0x00f1  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0110  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0115  */
    @Override // q.x
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void d(m mVar) {
        CompoundButton compoundButton;
        View view;
        boolean z11;
        int i5;
        ImageView imageView;
        String string;
        boolean z12;
        this.f13676a = mVar;
        boolean zIsVisible = mVar.isVisible();
        k kVar = mVar.n;
        setVisibility(zIsVisible ? 0 : 8);
        CharSequence charSequence = mVar.f83261e;
        if (charSequence != null) {
            this.f13679d.setText(charSequence);
            if (this.f13679d.getVisibility() != 0) {
                this.f13679d.setVisibility(0);
            }
        } else if (this.f13679d.getVisibility() != 8) {
            this.f13679d.setVisibility(8);
        }
        boolean zIsCheckable = mVar.isCheckable();
        if (zIsCheckable || this.f13678c != null || this.f13680e != null) {
            if ((this.f13676a.f83278x & 4) != 0) {
                if (this.f13678c == null) {
                    if (this.f13689p == null) {
                        this.f13689p = LayoutInflater.from(getContext());
                    }
                    RadioButton radioButton = (RadioButton) this.f13689p.inflate(2131623953, (ViewGroup) this, false);
                    this.f13678c = radioButton;
                    LinearLayout linearLayout = this.f13684i;
                    if (linearLayout != null) {
                        linearLayout.addView(radioButton, -1);
                    } else {
                        addView(radioButton, -1);
                    }
                }
                compoundButton = this.f13678c;
                view = this.f13680e;
            } else {
                if (this.f13680e == null) {
                    if (this.f13689p == null) {
                        this.f13689p = LayoutInflater.from(getContext());
                    }
                    CheckBox checkBox = (CheckBox) this.f13689p.inflate(2131623950, (ViewGroup) this, false);
                    this.f13680e = checkBox;
                    LinearLayout linearLayout2 = this.f13684i;
                    if (linearLayout2 != null) {
                        linearLayout2.addView(checkBox, -1);
                    } else {
                        addView(checkBox, -1);
                    }
                }
                compoundButton = this.f13680e;
                view = this.f13678c;
            }
            if (zIsCheckable) {
                compoundButton.setChecked(this.f13676a.isChecked());
                if (compoundButton.getVisibility() != 0) {
                    compoundButton.setVisibility(0);
                }
                if (view != null && view.getVisibility() != 8) {
                    view.setVisibility(8);
                }
            } else {
                CheckBox checkBox2 = this.f13680e;
                if (checkBox2 != null) {
                    checkBox2.setVisibility(8);
                }
                RadioButton radioButton2 = this.f13678c;
                if (radioButton2 != null) {
                    radioButton2.setVisibility(8);
                }
            }
        }
        if (kVar.o()) {
            if ((kVar.n() ? mVar.f83266j : mVar.f83264h) != 0) {
                z11 = true;
            }
        } else {
            z11 = false;
        }
        kVar.n();
        if (z11) {
            m mVar2 = this.f13676a;
            k kVar2 = mVar2.n;
            if (kVar2.o()) {
                if ((kVar2.n() ? mVar2.f83266j : mVar2.f83264h) != 0) {
                    z12 = true;
                }
                if (!z12) {
                }
            } else {
                z12 = false;
                i5 = !z12 ? 0 : 8;
            }
        }
        if (i5 == 0) {
            TextView textView = this.f13681f;
            m mVar3 = this.f13676a;
            k kVar3 = mVar3.n;
            Context context = kVar3.f83232a;
            char c11 = kVar3.n() ? mVar3.f83266j : mVar3.f83264h;
            if (c11 == 0) {
                string = b.f42142b;
            } else {
                Resources resources = context.getResources();
                StringBuilder sb2 = new StringBuilder();
                if (ViewConfiguration.get(context).hasPermanentMenuKey()) {
                    sb2.append(resources.getString(2132017179));
                }
                int i11 = kVar3.n() ? mVar3.f83267k : mVar3.f83265i;
                m.a(i11, SQLiteDatabase.OPEN_FULLMUTEX, resources.getString(2132017175), sb2);
                m.a(i11, u1.FLAG_APPEARED_IN_PRE_LAYOUT, resources.getString(2132017171), sb2);
                m.a(i11, 2, resources.getString(2132017170), sb2);
                m.a(i11, 1, resources.getString(2132017176), sb2);
                m.a(i11, 4, resources.getString(2132017178), sb2);
                m.a(i11, 8, resources.getString(2132017174), sb2);
                if (c11 == '\b') {
                    sb2.append(resources.getString(2132017172));
                } else if (c11 == '\n') {
                    sb2.append(resources.getString(2132017173));
                } else if (c11 != ' ') {
                    sb2.append(c11);
                } else {
                    sb2.append(resources.getString(2132017177));
                }
                string = sb2.toString();
            }
            textView.setText(string);
        }
        if (this.f13681f.getVisibility() != i5) {
            this.f13681f.setVisibility(i5);
        }
        Drawable icon = mVar.getIcon();
        k kVar4 = this.f13676a.n;
        boolean z13 = this.f13690q;
        if ((z13 || this.f13688m) && ((imageView = this.f13677b) != null || icon != null || this.f13688m)) {
            if (imageView == null) {
                if (this.f13689p == null) {
                    this.f13689p = LayoutInflater.from(getContext());
                }
                ImageView imageView2 = (ImageView) this.f13689p.inflate(2131623951, (ViewGroup) this, false);
                this.f13677b = imageView2;
                LinearLayout linearLayout3 = this.f13684i;
                if (linearLayout3 != null) {
                    linearLayout3.addView(imageView2, 0);
                } else {
                    addView(imageView2, 0);
                }
            }
            if (icon != null || this.f13688m) {
                ImageView imageView3 = this.f13677b;
                if (!z13) {
                    icon = null;
                }
                imageView3.setImageDrawable(icon);
                if (this.f13677b.getVisibility() != 0) {
                    this.f13677b.setVisibility(0);
                }
            } else {
                this.f13677b.setVisibility(8);
            }
        }
        setEnabled(mVar.isEnabled());
        boolean zHasSubMenu = mVar.hasSubMenu();
        ImageView imageView4 = this.f13682g;
        if (imageView4 != null) {
            imageView4.setVisibility(zHasSubMenu ? 0 : 8);
        }
        setContentDescription(mVar.f83271q);
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        setBackground(this.f13685j);
        TextView textView = (TextView) findViewById(2131429031);
        this.f13679d = textView;
        int i5 = this.f13686k;
        if (i5 != -1) {
            textView.setTextAppearance(this.f13687l, i5);
        }
        this.f13681f = (TextView) findViewById(2131428850);
        ImageView imageView = (ImageView) findViewById(2131428934);
        this.f13682g = imageView;
        if (imageView != null) {
            imageView.setImageDrawable(this.n);
        }
        this.f13683h = (ImageView) findViewById(2131428126);
        this.f13684i = (LinearLayout) findViewById(2131427749);
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        if (this.f13677b != null && this.f13688m) {
            ViewGroup.LayoutParams layoutParams = getLayoutParams();
            LinearLayout.LayoutParams layoutParams2 = (LinearLayout.LayoutParams) this.f13677b.getLayoutParams();
            int i12 = layoutParams.height;
            if (i12 > 0 && layoutParams2.width <= 0) {
                layoutParams2.width = i12;
            }
        }
        super.onMeasure(i5, i11);
    }
}
