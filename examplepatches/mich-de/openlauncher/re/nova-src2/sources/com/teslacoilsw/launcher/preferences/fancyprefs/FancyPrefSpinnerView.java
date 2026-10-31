package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.PopupWindow;
import android.widget.TextView;
import androidx.compose.ui.node.LayoutNode;
import ay.k;
import b.e8;
import b70.c;
import bh.g;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSpinnerView;
import d00.t;
import f10.u;
import f10.x;
import f10.y;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import lx.d;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r4.a;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0017\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefSpinnerView;", "Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefSummaryListView;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public class FancyPrefSpinnerView extends FancyPrefSummaryListView {

    /* renamed from: e0, reason: collision with root package name */
    public static final /* synthetic */ int f46003e0 = 0;

    /* renamed from: c0, reason: collision with root package name */
    public final boolean f46004c0;

    /* renamed from: d0, reason: collision with root package name */
    public final TextView f46005d0;

    @JvmOverloads
    public FancyPrefSpinnerView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    @Override // f10.d
    public final void L() {
        int i5;
        int i11 = this.L;
        Context context = this.f46008p;
        View viewInflate = i11 != 0 ? LayoutInflater.from(context).inflate(this.L, (ViewGroup) null, false) : new FrameLayout(context);
        Function0 function0K = K(viewInflate);
        DisplayMetrics displayMetrics = getResources().getDisplayMetrics();
        Function1 function1 = this.P;
        if (function1 != null) {
            function1.invoke(viewInflate);
        }
        u uVar = new u(viewInflate);
        uVar.setFocusable(true);
        uVar.setOutsideTouchable(true);
        uVar.setTouchInterceptor(new e8(uVar, 2));
        int iM = g.M(context, 16);
        int iB = d.b(context, 2130970347);
        if (a.g(iB, -16777216) < 2.0d) {
            iB = a.j(285212671, iB);
        }
        viewInflate.setBackground(new InsetDrawable((Drawable) new ColorDrawable(iB), iM, 0, iM, 0));
        uVar.setElevation(g.N(context.getResources().getDisplayMetrics(), 8));
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(displayMetrics.widthPixels, Integer.MIN_VALUE);
        TextView textView = this.f46005d0;
        viewInflate.measure(iMakeMeasureSpec, View.MeasureSpec.makeMeasureSpec(uVar.getMaxAvailableHeight(textView), Integer.MIN_VALUE));
        uVar.setWidth(viewInflate.getMeasuredWidth());
        uVar.setHeight(viewInflate.getMeasuredHeight());
        int[] iArr = new int[2];
        textView.getLocationInWindow(iArr);
        int iN = g.N(context.getResources().getDisplayMetrics(), 16);
        int i12 = iArr[0];
        if (i12 < iN) {
            i5 = iN - i12;
        } else {
            int width = textView.getWidth() + i12 + iN;
            int i13 = displayMetrics.widthPixels;
            i5 = width >= i13 ? (i13 - iArr[0]) - iN : 0;
        }
        uVar.setOverlapAnchor(true);
        uVar.showAsDropDown(textView, i5 + iM, 0);
        final t tVar = (t) function0K;
        uVar.setOnDismissListener(new PopupWindow.OnDismissListener() { // from class: f10.k
            @Override // android.widget.PopupWindow.OnDismissListener
            public final void onDismiss() {
                int i14 = FancyPrefSpinnerView.f46003e0;
                String str = (String) tVar.invoke();
                FancyPrefSpinnerView fancyPrefSpinnerView = this;
                fancyPrefSpinnerView.x(str);
                fancyPrefSpinnerView.K = null;
            }
        });
        this.K = uVar;
    }

    @Override // f10.m
    public final y O(ViewGroup viewGroup, int i5, View.OnClickListener onClickListener) {
        y yVarO = super.O(viewGroup, i5, onClickListener);
        FancyPrefCheckableView fancyPrefCheckableView = yVarO.f54225b;
        TextView textView = fancyPrefCheckableView.f46010r;
        Intrinsics.d(textView);
        ViewGroup.LayoutParams layoutParams = textView.getLayoutParams();
        if (layoutParams == null) {
            throw new NullPointerException("null cannot be cast to non-null type android.view.ViewGroup.MarginLayoutParams");
        }
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
        marginLayoutParams.width = -2;
        int i11 = marginLayoutParams.topMargin;
        int i12 = marginLayoutParams.bottomMargin;
        marginLayoutParams.setMarginStart(0);
        marginLayoutParams.topMargin = i11;
        marginLayoutParams.setMarginEnd(0);
        marginLayoutParams.bottomMargin = i12;
        textView.setLayoutParams(marginLayoutParams);
        fancyPrefCheckableView.findViewById(2131429213).setVisibility(8);
        return yVarO;
    }

    @Override // f10.m
    public final void P() {
        if (this.f46004c0) {
            T();
        }
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSummaryListView, com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    /* renamed from: R, reason: merged with bridge method [inline-methods] */
    public final void t(String str) {
        super.t(str);
        this.f46005d0.setText(S(str));
    }

    public CharSequence S(String str) {
        CharSequence charSequence;
        x xVarM = M(str);
        return (xVarM == null || (charSequence = xVarM.f54220b) == null) ? str : charSequence;
    }

    public final void T() {
        TextView textView = this.f46005d0;
        if (textView.getMaxWidth() == Integer.MAX_VALUE) {
            return;
        }
        CharSequence text = textView.getText();
        List list = this.T;
        ArrayList arrayList = new ArrayList(c.u0(list, 10));
        Iterator it = list.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            textView.setText(S(((x) it.next()).f54219a));
            textView.measure(0, 0);
            arrayList.add(Integer.valueOf(textView.getMeasuredWidth()));
        }
        Integer num = (Integer) b70.g.j1(arrayList);
        int iIntValue = num != null ? num.intValue() : 0;
        textView.setText(text);
        textView.setMinWidth(iIntValue);
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final int o(AttributeSet attributeSet) {
        TypedArray typedArrayObtainStyledAttributes = getContext().obtainStyledAttributes(attributeSet, u2.f80170u);
        try {
            if (typedArrayObtainStyledAttributes.getBoolean(3, true)) {
                return super.o(attributeSet);
            }
            typedArrayObtainStyledAttributes.recycle();
            return 2131624137;
        } finally {
            typedArrayObtainStyledAttributes.recycle();
        }
    }

    public FancyPrefSpinnerView(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, 0);
        F(2131624138);
        FrameLayout frameLayout = this.f46013u;
        Intrinsics.d(frameLayout);
        ViewGroup.LayoutParams layoutParams = frameLayout.getLayoutParams();
        if (layoutParams == null) {
            throw new NullPointerException("null cannot be cast to non-null type android.view.ViewGroup.MarginLayoutParams");
        }
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
        marginLayoutParams.setMarginEnd(g.N(context.getResources().getDisplayMetrics(), 8));
        frameLayout.setLayoutParams(marginLayoutParams);
        TextView textView = (TextView) findViewById(2131428896);
        this.f46005d0 = textView;
        if (this.f46013u.getLayoutParams().width == -1) {
            textView.setMaxWidth(LayoutNode.NotPlacedPlaceOrder);
            ViewGroup.LayoutParams layoutParams2 = textView.getLayoutParams();
            if (layoutParams2 == null) {
                throw new NullPointerException("null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams");
            }
            FrameLayout.LayoutParams layoutParams3 = (FrameLayout.LayoutParams) layoutParams2;
            layoutParams3.gravity = 17;
            textView.setLayoutParams(layoutParams3);
        }
        T();
        setOnClickListener(new k(this, 23));
        this.f46004c0 = true;
    }
}
