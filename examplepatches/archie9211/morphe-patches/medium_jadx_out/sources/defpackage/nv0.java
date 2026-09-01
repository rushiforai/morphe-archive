package defpackage;

import android.content.Context;
import com.medium.android.graphql.type.LayoutType;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class nv0 implements m45 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ nv0(b55 b55Var, lv0 lv0Var, boolean z) {
        this.c = b55Var;
        this.d = lv0Var;
        this.b = z;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int dimensionPixelSize;
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj = this.d;
        boolean z = this.b;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                ((b55) obj2).invoke((lv0) obj, Boolean.valueOf(z));
                return c1eVar;
            case 1:
                LayoutType layoutType = (LayoutType) obj2;
                Context context = (Context) obj;
                if (z || layoutType == LayoutType.FULL_WIDTH) {
                    dimensionPixelSize = context.getResources().getDisplayMetrics().widthPixels;
                } else {
                    int dimensionPixelSize2 = context.getResources().getDimensionPixelSize(R.dimen.common_paragraph_container_horizontal_padding);
                    dimensionPixelSize = context.getResources().getDimensionPixelSize(R.dimen.medium_screen_breakpoint_without_margins);
                    int i2 = context.getResources().getDisplayMetrics().widthPixels - (dimensionPixelSize2 * 2);
                    if (i2 <= dimensionPixelSize) {
                        dimensionPixelSize = i2;
                    }
                }
                return Integer.valueOf(dimensionPixelSize);
            default:
                ((l78) obj).setValue(Boolean.FALSE);
                ko9 ko9Var = ((lo9) obj2).a;
                vx0.c0(f76.F(ko9Var), null, null, new wd0(!z, ko9Var, (n92) null, 4), 3);
                return c1eVar;
        }
    }

    public /* synthetic */ nv0(lo9 lo9Var, boolean z, l78 l78Var) {
        this.c = lo9Var;
        this.b = z;
        this.d = l78Var;
    }

    public /* synthetic */ nv0(boolean z, LayoutType layoutType, Context context) {
        this.b = z;
        this.c = layoutType;
        this.d = context;
    }
}
