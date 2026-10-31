package aa;

import android.util.Property;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.pageindicators.PageIndicatorDots;
import com.android.launcher3.pageindicators.WorkspacePageIndicator;
import com.android.launcher3.views.RecyclerViewFastScroller;
import o9.u0;

/* loaded from: classes.dex */
public final class l extends Property {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f605a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l(int i5, Class cls, String str) {
        super(cls, str);
        this.f605a = i5;
    }

    @Override // android.util.Property
    public final Object get(Object obj) {
        switch (this.f605a) {
            case 0:
                return Float.valueOf(((n) obj).f634i);
            case 1:
                return Float.valueOf(((PageIndicatorDots) obj).f21206f);
            case 2:
                return Integer.valueOf(((WorkspacePageIndicator) obj).f21222j.getAlpha());
            case 3:
                return Float.valueOf(((WorkspacePageIndicator) obj).f21219g);
            case 4:
                return Integer.valueOf(((WorkspacePageIndicator) obj).f21221i);
            case 5:
                return Float.valueOf(((BubbleTextView) obj).G());
            case 6:
                return Float.valueOf(((BubbleTextView) obj).o);
            case 7:
                return Float.valueOf(((o9.w) obj).f80205j);
            case 8:
                return Float.valueOf(((u0) obj).f80150d);
            case 9:
                return Integer.valueOf(((y9.y) obj).f96983j);
            case 10:
                return Integer.valueOf(((y9.y) obj).f96984k);
            case 11:
                return Integer.valueOf(((za.h) obj).f98431b);
            case 12:
                return Integer.valueOf(((za.h) obj).f98432c);
            default:
                return Integer.valueOf(((RecyclerViewFastScroller) obj).f21290f);
        }
    }

    @Override // android.util.Property
    public final void set(Object obj, Object obj2) {
        switch (this.f605a) {
            case 0:
                n nVar = (n) obj;
                nVar.f634i = ((Float) obj2).floatValue();
                nVar.invalidateSelf();
                break;
            case 1:
                PageIndicatorDots pageIndicatorDots = (PageIndicatorDots) obj;
                pageIndicatorDots.f21206f = ((Float) obj2).floatValue();
                pageIndicatorDots.invalidate();
                pageIndicatorDots.invalidateOutline();
                break;
            case 2:
                WorkspacePageIndicator workspacePageIndicator = (WorkspacePageIndicator) obj;
                workspacePageIndicator.e(((Integer) obj2).intValue());
                workspacePageIndicator.invalidate();
                break;
            case 3:
                WorkspacePageIndicator workspacePageIndicator2 = (WorkspacePageIndicator) obj;
                workspacePageIndicator2.f21219g = ((Float) obj2).floatValue();
                workspacePageIndicator2.invalidate();
                break;
            case 4:
                WorkspacePageIndicator workspacePageIndicator3 = (WorkspacePageIndicator) obj;
                workspacePageIndicator3.f21221i = ((Integer) obj2).intValue();
                workspacePageIndicator3.invalidate();
                break;
            case 5:
                ((BubbleTextView) obj).L(((Float) obj2).floatValue());
                break;
            case 6:
                ((BubbleTextView) obj).P(((Float) obj2).floatValue());
                break;
            case 7:
                o9.w.a((o9.w) obj, ((Float) obj2).floatValue());
                break;
            case 8:
                ((u0) obj).f80150d = ((Float) obj2).floatValue();
                break;
            case 9:
                y9.y yVar = (y9.y) obj;
                yVar.f96983j = ((Integer) obj2).intValue();
                yVar.i();
                break;
            case 10:
                y9.y yVar2 = (y9.y) obj;
                yVar2.f96984k = ((Integer) obj2).intValue();
                yVar2.i();
                break;
            case 11:
                ((za.h) obj).f98431b = ((Integer) obj2).intValue();
                break;
            case 12:
                ((za.h) obj).f98432c = ((Integer) obj2).intValue();
                break;
            default:
                RecyclerViewFastScroller recyclerViewFastScroller = (RecyclerViewFastScroller) obj;
                int iIntValue = ((Integer) obj2).intValue();
                if (recyclerViewFastScroller.f21290f != iIntValue) {
                    recyclerViewFastScroller.f21290f = iIntValue;
                    recyclerViewFastScroller.invalidate();
                    break;
                }
                break;
        }
    }
}
