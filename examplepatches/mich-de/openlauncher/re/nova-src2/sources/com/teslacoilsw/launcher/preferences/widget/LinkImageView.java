package com.teslacoilsw.launcher.preferences.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.widget.ImageView;
import fk.t;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.SourceDebugExtension;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/widget/LinkImageView;", "Landroid/widget/ImageView;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class LinkImageView extends ImageView {

    /* renamed from: a, reason: collision with root package name */
    public String f46136a;

    @JvmOverloads
    public LinkImageView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.C);
        this.f46136a = typedArrayObtainStyledAttributes.getString(0);
        Unit unit = Unit.f71706a;
        typedArrayObtainStyledAttributes.recycle();
        setOnClickListener(new t(this, 12));
    }
}
