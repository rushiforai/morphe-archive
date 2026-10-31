package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.graphics.Canvas;
import android.util.AttributeSet;
import com.teslacoilsw.launcher.preferences.widget.RoundRectView;
import dy.k;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.SourceDebugExtension;
import lx.d;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001B\u001d\b\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/PaddingPreviewView;", "Lcom/teslacoilsw/launcher/preferences/widget/RoundRectView;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class PaddingPreviewView extends RoundRectView {

    /* renamed from: a, reason: collision with root package name */
    public final int f46027a;

    /* renamed from: b, reason: collision with root package name */
    public int f46028b;

    /* renamed from: c, reason: collision with root package name */
    public int f46029c;

    @JvmOverloads
    public PaddingPreviewView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f46027a = Integer.MIN_VALUE;
        setWillNotDraw(false);
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int iSave = canvas.save();
        try {
            int i5 = this.f46028b;
            int i11 = this.f46029c;
            int width = canvas.getWidth() - this.f46028b;
            int height = canvas.getHeight() - this.f46029c;
            k kVar = d.f75158a;
            canvas.clipOutRect(i5, i11, width, height);
            canvas.drawColor(this.f46027a);
        } finally {
            canvas.restoreToCount(iSave);
        }
    }
}
