package androidx.appcompat.view.menu;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import androidx.appcompat.widget.AppCompatTextView;
import l.a;
import q.b;
import q.m;
import q.x;
import r.f;
import r.j;
import r.m2;

/* loaded from: classes2.dex */
public class ActionMenuItemView extends AppCompatTextView implements x, View.OnClickListener, j {

    /* renamed from: a, reason: collision with root package name */
    public m f13664a;

    /* renamed from: b, reason: collision with root package name */
    public CharSequence f13665b;

    /* renamed from: c, reason: collision with root package name */
    public Drawable f13666c;

    /* renamed from: d, reason: collision with root package name */
    public q.j f13667d;

    /* renamed from: e, reason: collision with root package name */
    public b f13668e;

    /* renamed from: f, reason: collision with root package name */
    public f f13669f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f13670g;

    /* renamed from: h, reason: collision with root package name */
    public final int f13671h;

    /* renamed from: i, reason: collision with root package name */
    public int f13672i;

    /* renamed from: j, reason: collision with root package name */
    public final int f13673j;

    public ActionMenuItemView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        Resources resources = context.getResources();
        this.f13670g = f();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, a.f72890c, 0, 0);
        this.f13671h = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, 0);
        typedArrayObtainStyledAttributes.recycle();
        this.f13673j = (int) ((resources.getDisplayMetrics().density * 32.0f) + 0.5f);
        setOnClickListener(this);
        this.f13672i = -1;
        setSaveEnabled(false);
    }

    @Override // r.j
    public final boolean a() {
        return !TextUtils.isEmpty(getText());
    }

    @Override // r.j
    public final boolean b() {
        return !TextUtils.isEmpty(getText()) && this.f13664a.getIcon() == null;
    }

    @Override // q.x
    public final m c() {
        return this.f13664a;
    }

    @Override // q.x
    public final void d(m mVar) {
        this.f13664a = mVar;
        Drawable icon = mVar.getIcon();
        this.f13666c = icon;
        if (icon != null) {
            int intrinsicWidth = icon.getIntrinsicWidth();
            int intrinsicHeight = icon.getIntrinsicHeight();
            int i5 = this.f13673j;
            if (intrinsicWidth > i5) {
                intrinsicHeight = (int) (intrinsicHeight * (i5 / intrinsicWidth));
                intrinsicWidth = i5;
            }
            if (intrinsicHeight > i5) {
                intrinsicWidth = (int) (intrinsicWidth * (i5 / intrinsicHeight));
            } else {
                i5 = intrinsicHeight;
            }
            icon.setBounds(0, 0, intrinsicWidth, i5);
        }
        setCompoundDrawables(icon, null, null, null);
        g();
        this.f13665b = mVar.getTitleCondensed();
        g();
        setId(mVar.f83257a);
        setVisibility(mVar.isVisible() ? 0 : 8);
        setEnabled(mVar.isEnabled());
        if (mVar.hasSubMenu() && this.f13668e == null) {
            this.f13668e = new b(this);
        }
    }

    public final boolean f() {
        Configuration configuration = getContext().getResources().getConfiguration();
        int i5 = configuration.screenWidthDp;
        int i11 = configuration.screenHeightDp;
        if (i5 < 480) {
            return (i5 >= 640 && i11 >= 480) || configuration.orientation == 2;
        }
        return true;
    }

    public final void g() {
        boolean z11 = true;
        boolean z12 = !TextUtils.isEmpty(this.f13665b);
        if (this.f13666c != null && ((this.f13664a.f83279y & 4) != 4 || !this.f13670g)) {
            z11 = false;
        }
        boolean z13 = z12 & z11;
        setText(z13 ? this.f13665b : null);
        CharSequence charSequence = this.f13664a.f83271q;
        if (TextUtils.isEmpty(charSequence)) {
            setContentDescription(z13 ? null : this.f13664a.f83261e);
        } else {
            setContentDescription(charSequence);
        }
        CharSequence charSequence2 = this.f13664a.f83272r;
        if (TextUtils.isEmpty(charSequence2)) {
            m2.a(this, z13 ? null : this.f13664a.f83261e);
        } else {
            m2.a(this, charSequence2);
        }
    }

    @Override // android.widget.TextView, android.view.View
    public final CharSequence getAccessibilityClassName() {
        return Button.class.getName();
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        q.j jVar = this.f13667d;
        if (jVar != null) {
            jVar.a(this.f13664a);
        }
    }

    @Override // android.widget.TextView, android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.f13670g = f();
        g();
    }

    @Override // androidx.appcompat.widget.AppCompatTextView, android.widget.TextView, android.view.View
    public final void onMeasure(int i5, int i11) {
        int i12;
        boolean zIsEmpty = TextUtils.isEmpty(getText());
        if (!zIsEmpty && (i12 = this.f13672i) >= 0) {
            super.setPadding(i12, getPaddingTop(), getPaddingRight(), getPaddingBottom());
        }
        super.onMeasure(i5, i11);
        int mode = View.MeasureSpec.getMode(i5);
        int size = View.MeasureSpec.getSize(i5);
        int measuredWidth = getMeasuredWidth();
        int i13 = this.f13671h;
        int iMin = mode == Integer.MIN_VALUE ? Math.min(size, i13) : i13;
        if (mode != 1073741824 && i13 > 0 && measuredWidth < iMin) {
            super.onMeasure(View.MeasureSpec.makeMeasureSpec(iMin, 1073741824), i11);
        }
        if (!zIsEmpty || this.f13666c == null) {
            return;
        }
        super.setPadding((getMeasuredWidth() - this.f13666c.getBounds().width()) / 2, getPaddingTop(), getPaddingRight(), getPaddingBottom());
    }

    @Override // android.widget.TextView, android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        super.onRestoreInstanceState(null);
    }

    @Override // android.widget.TextView, android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        b bVar;
        if (this.f13664a.hasSubMenu() && (bVar = this.f13668e) != null && bVar.onTouch(this, motionEvent)) {
            return true;
        }
        return super.onTouchEvent(motionEvent);
    }

    @Override // android.widget.TextView, android.view.View
    public final void setPadding(int i5, int i11, int i12, int i13) {
        this.f13672i = i5;
        super.setPadding(i5, i11, i12, i13);
    }
}
