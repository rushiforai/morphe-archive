package defpackage;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j6d extends View {
    public final /* synthetic */ ViewGroup a;
    public final /* synthetic */ l6d b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j6d(l6d l6dVar, Context context, ViewGroup viewGroup) {
        super(context);
        this.b = l6dVar;
        this.a = viewGroup;
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        l6d l6dVar = this.b;
        ArrayList arrayList = l6dVar.b;
        Drawable background = this.a.getBackground();
        int color = background instanceof ColorDrawable ? ((ColorDrawable) background).getColor() : 0;
        if (l6dVar.e != color) {
            l6dVar.e = color;
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                ((a5a) arrayList.get(size)).b(color);
            }
        }
    }
}
