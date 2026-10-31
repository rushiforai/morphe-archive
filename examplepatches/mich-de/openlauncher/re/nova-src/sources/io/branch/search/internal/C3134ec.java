package io.branch.search.internal;

import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.RegionIterator;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.ColorDrawable;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.ec, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3134ec {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Path f64393a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f64394b = false;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final ThreadLocal<Paint> f64395c = new ThreadLocal<>();

    /* renamed from: io.branch.search.internal.ec$a */
    public static final class a {
        @NotNull
        public static C3134ec a() {
            int iB = MathKt.b(100.0f);
            AdaptiveIconDrawable adaptiveIconDrawable = new AdaptiveIconDrawable(new ColorDrawable(0), new ColorDrawable(0));
            adaptiveIconDrawable.setBounds(0, 0, iB, iB);
            Path path = adaptiveIconDrawable.getIconMask();
            Region region = new Region();
            region.setPath(path, new Region(0, 0, iB, iB));
            Rect bounds = region.getBounds();
            Intrinsics.f(bounds, "region.bounds");
            RegionIterator regionIterator = new RegionIterator(region);
            Rect rect = new Rect();
            int iHeight = 0;
            while (regionIterator.next(rect)) {
                iHeight += rect.height() * rect.width();
            }
            boolean z11 = ((float) bounds.left) > 1.0f || ((float) bounds.top) > 1.0f || ((float) bounds.right) < 99.0f || ((float) bounds.bottom) < 99.0f;
            boolean z12 = ((float) iHeight) / ((float) (iB * iB)) <= 0.8f;
            if (z11 || z12) {
                Path path2 = new Path();
                path2.addRoundRect(0.0f, 0.0f, 100.0f, 100.0f, 20.0f, 20.0f, Path.Direction.CCW);
                path = path2;
            }
            Intrinsics.f(path, "path");
            return new C3134ec(path);
        }
    }

    public C3134ec(Path path) {
        this.f64393a = path;
    }
}
