package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import d00.t;
import f10.l;
import f10.m;
import f10.x;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\b\u0017\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefSummaryListView;", "Lf10/m;", b.f42142b, "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public class FancyPrefSummaryListView extends m {
    public final int V;
    public final ImageView W;

    /* renamed from: a0, reason: collision with root package name */
    public final TextView f46006a0;

    /* renamed from: b0, reason: collision with root package name */
    public String f46007b0;

    @JvmOverloads
    public FancyPrefSummaryListView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 4, 0);
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final String G(Object obj, String str) {
        StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
        x xVarM = M((String) obj);
        return String.format(str, Arrays.copyOf(new Object[]{xVarM != null ? xVarM.f54220b : null}, 1));
    }

    @Override // f10.d
    public Function0 K(View view) {
        this.f46007b0 = (String) r();
        RecyclerView recyclerView = (RecyclerView) view.findViewById(2131428684);
        view.getContext();
        recyclerView.setLayoutManager(new LinearLayoutManager());
        recyclerView.setAdapter(new l(recyclerView, this, view));
        return new t(this, 26);
    }

    @Override // f10.m
    public final boolean N(String str) {
        String str2 = this.f46007b0;
        if (str2 != null) {
            return Intrinsics.b(str2, str);
        }
        Intrinsics.m("dialogValue");
        throw null;
    }

    @Override // f10.m
    public void Q(x xVar) {
        this.f46007b0 = xVar.f54219a;
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    /* renamed from: R */
    public void t(String str) {
        super.t(str);
        if (this.V == 2) {
            x xVarM = M(str);
            ImageView imageView = this.W;
            Intrinsics.d(imageView);
            CharSequence charSequence = null;
            int i5 = 8;
            if (xVarM == null) {
                imageView.setImageDrawable(null);
            } else {
                Drawable drawable = xVarM.f54223e;
                if (drawable != null) {
                    imageView.setImageDrawable(drawable);
                } else {
                    int i11 = xVarM.f54222d;
                    if (i11 != 0) {
                        imageView.setImageResource(i11);
                    } else {
                        imageView.setImageDrawable(null);
                    }
                }
                i5 = 0;
            }
            imageView.setVisibility(i5);
            TextView textView = this.f46006a0;
            Intrinsics.d(textView);
            if ((xVarM == null || !xVarM.f54224f) && xVarM != null) {
                charSequence = xVarM.f54220b;
            }
            textView.setText(charSequence);
        }
    }

    public /* synthetic */ FancyPrefSummaryListView(Context context, AttributeSet attributeSet, int i5, int i11) {
        this(context, (i5 & 2) != 0 ? null : attributeSet, 0);
    }

    public FancyPrefSummaryListView(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80171v);
        try {
            int i11 = typedArrayObtainStyledAttributes.getInt(6, 0);
            this.V = i11;
            typedArrayObtainStyledAttributes.recycle();
            if (i11 == 2) {
                F(2131624143);
            }
            this.W = (ImageView) findViewById(2131429202);
            this.f46006a0 = (TextView) findViewById(2131429205);
        } catch (Throwable th2) {
            typedArrayObtainStyledAttributes.recycle();
            throw th2;
        }
    }
}
