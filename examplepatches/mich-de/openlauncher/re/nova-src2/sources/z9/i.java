package z9;

import android.graphics.Outline;
import android.graphics.Path;
import android.graphics.drawable.shapes.PathShape;

/* loaded from: classes2.dex */
public final class i extends PathShape {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f98403b = 0;

    /* renamed from: a, reason: collision with root package name */
    public Path f98404a;

    @Override // android.graphics.drawable.shapes.Shape
    public final void getOutline(Outline outline) {
        outline.setConvexPath(this.f98404a);
    }
}
