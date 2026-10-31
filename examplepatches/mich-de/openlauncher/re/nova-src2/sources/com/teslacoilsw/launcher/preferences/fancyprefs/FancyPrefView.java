package com.teslacoilsw.launcher.preferences.fancyprefs;

import ae.i;
import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ScrollView;
import android.widget.TextView;
import androidx.constraintlayout.widget.ConstraintLayout;
import b.c0;
import bh.g;
import c10.a;
import com.instabridge.ai.chat.ui.v2.j;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.teslacoilsw.launcher.preferences.SettingsActivityLegacy;
import d00.t;
import e0.z1;
import e10.a3;
import e10.s2;
import e10.t2;
import e10.y2;
import f10.n;
import f10.o;
import f10.r;
import f10.v;
import ib0.d;
import java.util.Arrays;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.StringCompanionObject;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;
import xb0.c;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0017\u0018\u0000*\b\b\u0000\u0010\u0002*\u00020\u00012\u00020\u0003¨\u0006\u0004"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefView;", b.f42142b, "T", "Landroidx/constraintlayout/widget/ConstraintLayout;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public class FancyPrefView<T> extends ConstraintLayout {
    public static final /* synthetic */ int J = 0;
    public final Object A;
    public CharSequence B;
    public Function2 C;
    public String D;
    public Object E;
    public v F;
    public c G;
    public d H;
    public final String I;

    /* renamed from: p, reason: collision with root package name */
    public final Context f46008p;

    /* renamed from: q, reason: collision with root package name */
    public final ImageView f46009q;

    /* renamed from: r, reason: collision with root package name */
    public final TextView f46010r;

    /* renamed from: s, reason: collision with root package name */
    public final TextView f46011s;

    /* renamed from: t, reason: collision with root package name */
    public final ImageView f46012t;

    /* renamed from: u, reason: collision with root package name */
    public final FrameLayout f46013u;

    /* renamed from: v, reason: collision with root package name */
    public final boolean f46014v;

    /* renamed from: w, reason: collision with root package name */
    public final r f46015w;

    /* renamed from: x, reason: collision with root package name */
    public final String f46016x;

    /* renamed from: y, reason: collision with root package name */
    public boolean f46017y;

    /* renamed from: z, reason: collision with root package name */
    public boolean f46018z;

    @JvmOverloads
    public FancyPrefView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 4, 0);
    }

    public static boolean u(View view) {
        Object parent = view.getParent();
        if (parent == null || (parent instanceof ScrollView)) {
            return true;
        }
        if (parent instanceof ViewGroup) {
            return ((ViewGroup) parent).getVisibility() == 0 && u((View) parent);
        }
        throw new IllegalArgumentException("View.parentVisible must be called with an actual parent");
    }

    public final void A(String str) {
        this.D = str;
        boolean zU0 = k.U0(str);
        ImageView imageView = this.f46012t;
        if (zU0) {
            if (imageView != null) {
                imageView.setVisibility(8);
            }
        } else {
            Intrinsics.d(imageView);
            imageView.setImageAlpha(192);
            imageView.setVisibility(0);
            imageView.setOnClickListener(new ay.k(this, 24));
            setOnLongClickListener(new e10.k(this, 2));
        }
    }

    public final void B(Function2 function2) {
        this.C = function2;
    }

    public final void C(CharSequence charSequence) {
        this.B = charSequence;
        I();
    }

    public final void D(CharSequence charSequence) {
        TextView textView = this.f46010r;
        if (textView != null) {
            textView.setText(charSequence);
        }
        if (textView != null) {
            textView.setVisibility(charSequence != null ? 0 : 8);
        }
    }

    public final void E(Object obj) {
        this.E = obj;
        t(obj);
    }

    public final void F(int i5) {
        FrameLayout frameLayout = this.f46013u;
        Intrinsics.d(frameLayout);
        frameLayout.removeAllViews();
        LayoutInflater.from(getContext()).inflate(i5, (ViewGroup) frameLayout, true);
    }

    public String G(Object obj, String str) {
        StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
        return String.format(str, Arrays.copyOf(new Object[]{obj}, 1));
    }

    public final void H() {
        if (isAttachedToWindow()) {
            c cVar = this.G;
            if (cVar == null) {
                cVar = new c();
            }
            this.G = cVar;
            v vVar = this.F;
            if (vVar != null) {
                cVar.c(vVar.b().a(new i(new n(this, 0), 29)));
            }
            d dVar = this.H;
            if (dVar != null) {
                cVar.c(dVar.a(new o(new n(this, 1), 0)));
            }
        }
    }

    public void I() {
        CharSequence charSequenceG = this.B;
        if (charSequenceG != null && k.L0(charSequenceG, '%') && this.E != null) {
            charSequenceG = G(r(), charSequenceG.toString());
        }
        J(charSequenceG);
    }

    public final void J(CharSequence charSequence) {
        Context context;
        int i5;
        TextView textView = this.f46011s;
        if (textView != null) {
            textView.setText(charSequence);
        }
        if (textView != null) {
            textView.setVisibility(charSequence == null ? 8 : 0);
        }
        FrameLayout frameLayout = this.f46013u;
        if (frameLayout != null) {
            if (charSequence == null) {
                context = getContext();
                i5 = 32;
            } else {
                context = getContext();
                i5 = 48;
            }
            frameLayout.setMinimumHeight(g.M(context, i5));
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchRestoreInstanceState(SparseArray sparseArray) {
    }

    public final void n(v vVar) {
        if (this.F != null) {
            throw new IllegalStateException("FancyPref Pref may only be set once");
        }
        c cVar = this.G;
        if (cVar != null) {
            cVar.b();
        }
        this.G = null;
        this.F = vVar;
        E(vVar.f());
        H();
    }

    public int o(AttributeSet attributeSet) {
        TypedArray typedArrayObtainStyledAttributes = getContext().obtainStyledAttributes(attributeSet, u2.f80172w);
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(18, 2131624129);
        typedArrayObtainStyledAttributes.recycle();
        return resourceId;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        H();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        c cVar = this.G;
        if (cVar != null) {
            cVar.b();
        }
        this.G = null;
    }

    @Override // android.view.View
    public void onFinishInflate() {
        super.onFinishInflate();
        if (getMinimumHeight() == 0) {
            setMinimumHeight(g.M(getContext(), 56));
        }
        String str = this.I;
        if (str != null) {
            y2.f51877a.getClass();
            s2 s2Var = (s2) y2.f51897f.get(str);
            if (s2Var == null) {
                throw new IllegalStateException(c0.l("No such pref '", str, "'"));
            }
            if (s2Var instanceof e10.u2) {
                e10.u2 u2Var = (e10.u2) s2Var;
                n(new a(u2Var, new z1(10), new cw.c0(u2Var, 12)));
            } else if (s2Var instanceof t2) {
                n((t2) s2Var);
            } else {
                n(s2Var);
            }
        }
        this.f46018z = true;
    }

    /* renamed from: p, reason: from getter */
    public final CharSequence getB() {
        return this.B;
    }

    public final CharSequence q() {
        TextView textView = this.f46010r;
        if (textView != null) {
            return textView.getText();
        }
        return null;
    }

    public final Object r() {
        Object obj = this.E;
        if (obj != null) {
            return obj;
        }
        Intrinsics.m("valueField");
        throw null;
    }

    /* renamed from: s, reason: from getter */
    public final FrameLayout getF46013u() {
        return this.f46013u;
    }

    @Override // android.view.View
    public final void setOnClickListener(View.OnClickListener onClickListener) {
        if (this.f46014v) {
            super.setOnClickListener(new com.google.android.material.datepicker.n(onClickListener, 1));
        } else {
            super.setOnClickListener(onClickListener);
        }
    }

    public void t(Object obj) {
        v vVar = this.F;
        if (vVar != null) {
            vVar.k(obj);
        }
        CharSequence charSequence = this.B;
        if (charSequence == null || !k.L0(charSequence, '%')) {
            return;
        }
        I();
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [java.lang.Object, kotlin.Lazy] */
    public final void v() {
        if (this.f46014v) {
            boolean z11 = a3.f51435a.f51552h;
            ((View) this.A.getValue()).setVisibility(!z11 ? 0 : 8);
            TextView textView = this.f46010r;
            if (textView != null) {
                textView.setDuplicateParentStateEnabled(z11);
            }
            if (textView != null) {
                textView.setEnabled(z11);
            }
            TextView textView2 = this.f46011s;
            if (textView2 != null) {
                textView2.setDuplicateParentStateEnabled(z11);
            }
            if (textView2 != null) {
                textView2.setEnabled(z11);
            }
            ImageView imageView = this.f46009q;
            if (imageView != null) {
                imageView.setImageTintList(ColorStateList.valueOf(!z11 ? -5921371 : lx.d.b(getContext(), 2130968934)));
            }
            FrameLayout frameLayout = this.f46013u;
            if (frameLayout != null) {
                frameLayout.setDuplicateParentStateEnabled(z11);
            }
            if (frameLayout != null) {
                frameLayout.setEnabled(z11);
            }
        }
    }

    public final void w(d dVar) {
        if (this.H != null) {
            throw new IllegalStateException("FancyPref enableCondition may only be set once");
        }
        this.H = dVar;
        H();
    }

    public final void x(Object obj) {
        Object objR = r();
        E(obj);
        Function2 function2 = this.C;
        if (function2 != null) {
            function2.invoke(objR, obj);
        }
        if (this.f46017y) {
            Activity activityA = lx.d.a(getContext());
            SettingsActivityLegacy settingsActivityLegacy = activityA instanceof SettingsActivityLegacy ? (SettingsActivityLegacy) activityA : null;
            if (settingsActivityLegacy != null) {
                settingsActivityLegacy.f45977u = true;
            }
        }
    }

    public final void y(Drawable drawable) {
        z(-1);
        ImageView imageView = this.f46009q;
        if (drawable == null) {
            if (imageView != null) {
                imageView.setImageDrawable(null);
            }
            if (imageView != null) {
                imageView.setVisibility(8);
                return;
            }
            return;
        }
        if (imageView != null) {
            imageView.setImageDrawable(drawable);
        }
        if (imageView != null) {
            imageView.setVisibility(0);
        }
    }

    public final void z(int i5) {
        if (i5 == -1) {
            return;
        }
        if (i5 == 0) {
            y(null);
            return;
        }
        ImageView imageView = this.f46009q;
        if (imageView != null) {
            imageView.setImageResource(i5);
        }
        if (imageView != null) {
            imageView.setVisibility(0);
        }
    }

    public /* synthetic */ FancyPrefView(Context context, AttributeSet attributeSet, int i5, int i11) {
        this(context, (i5 & 2) != 0 ? null : attributeSet, 0);
    }

    /* JADX WARN: Finally extract failed */
    public FancyPrefView(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        this.f46008p = context;
        t tVar = new t(this, 27);
        dy.k kVar = lx.d.f75158a;
        this.A = LazyKt.b(LazyThreadSafetyMode.f71681c, tVar);
        String str = b.f42142b;
        this.D = b.f42142b;
        if (getBackground() == null) {
            setBackground(lx.d.c(context, 2130969920));
        }
        setMinimumHeight(g.M(context, 64));
        LayoutInflater.from(context).inflate(o(attributeSet), (ViewGroup) this, true);
        this.f46009q = (ImageView) findViewById(2131428202);
        TextView textView = (TextView) findViewById(2131429031);
        this.f46010r = textView;
        this.f46011s = (TextView) findViewById(2131428944);
        this.f46012t = (ImageView) findViewById(2131428230);
        this.f46013u = (FrameLayout) findViewById(2131429213);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80172w);
        try {
            String string = typedArrayObtainStyledAttributes.getString(7);
            D(string == null ? typedArrayObtainStyledAttributes.getString(6) : string);
            int i11 = 8;
            C(typedArrayObtainStyledAttributes.getString(8));
            int resourceId = typedArrayObtainStyledAttributes.getResourceId(17, 0);
            if (resourceId != 0) {
                Intrinsics.d(textView);
                textView.setTextAppearance(resourceId);
            }
            String string2 = typedArrayObtainStyledAttributes.getString(16);
            A(string2 == null ? b.f42142b : string2);
            z(typedArrayObtainStyledAttributes.getResourceId(0, 0));
            if (!typedArrayObtainStyledAttributes.hasValue(1) && !typedArrayObtainStyledAttributes.hasValue(3) && !typedArrayObtainStyledAttributes.hasValue(5) && !typedArrayObtainStyledAttributes.hasValue(2) && !typedArrayObtainStyledAttributes.hasValue(4) && !typedArrayObtainStyledAttributes.hasValue(11) && !typedArrayObtainStyledAttributes.hasValue(12)) {
                int iN = g.N(context.getResources().getDisplayMetrics(), 8);
                setPadding(getPaddingLeft(), iN, getPaddingRight(), iN);
            }
            boolean z11 = typedArrayObtainStyledAttributes.getBoolean(20, false);
            this.f46014v = z11;
            if (!isInEditMode() && !a3.f51435a.f51552h && z11) {
                v();
            }
            this.f46015w = r.values()[typedArrayObtainStyledAttributes.getInt(15, 1)];
            String string3 = typedArrayObtainStyledAttributes.getString(22);
            if (string3 != null) {
                str = string3;
            }
            this.f46016x = str;
            this.I = typedArrayObtainStyledAttributes.getString(13);
            this.f46017y = typedArrayObtainStyledAttributes.getBoolean(21, false);
            int resourceId2 = typedArrayObtainStyledAttributes.getResourceId(9, 0);
            if (resourceId2 != 0) {
                F(resourceId2);
            }
            String string4 = typedArrayObtainStyledAttributes.getString(10);
            if (string4 != null && !k.U0(string4)) {
                setOnClickListener(new j(i11, context, string4, typedArrayObtainStyledAttributes.getString(14)));
            }
            typedArrayObtainStyledAttributes.recycle();
            v();
        } catch (Throwable th2) {
            typedArrayObtainStyledAttributes.recycle();
            throw th2;
        }
    }
}
