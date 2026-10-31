package ca;

import android.graphics.Rect;
import com.android.launcher3.folder.FolderPagedView;
import java.util.function.ToIntFunction;
import o9.b3;

/* loaded from: classes2.dex */
public final /* synthetic */ class g implements ToIntFunction {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19925a;

    public /* synthetic */ g(int i5) {
        this.f19925a = i5;
    }

    @Override // java.util.function.ToIntFunction
    public final int applyAsInt(Object obj) {
        switch (this.f19925a) {
            case 0:
                return ((Rect) obj).centerY();
            case 1:
                return ((Rect) obj).centerX();
            case 2:
                int[] iArr = FolderPagedView.f21135k0;
                return ((b3) obj).getChildCount() - 1;
            default:
                int[] iArr2 = FolderPagedView.f21135k0;
                return 0;
        }
    }
}
