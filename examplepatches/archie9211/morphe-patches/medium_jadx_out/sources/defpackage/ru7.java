package defpackage;

import android.widget.RemoteViews;
import android.widget.RemoteViewsService;
import com.medium.android.donkey.widget.MediumWidgetService;
import com.medium.proto.event.WidgetCreated;
import com.medium.reader.R;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ru7 implements RemoteViewsService.RemoteViewsFactory {
    public final MediumWidgetService a;
    public final mq5 b;
    public final cx2 c;
    public final ArrayList d;

    public ru7(MediumWidgetService mediumWidgetService, mq5 mq5Var, cx2 cx2Var) {
        mq5Var.getClass();
        cx2Var.getClass();
        this.a = mediumWidgetService;
        this.b = mq5Var;
        this.c = cx2Var;
        this.d = new ArrayList();
    }

    @Override // android.widget.RemoteViewsService.RemoteViewsFactory
    public final int getCount() {
        return this.d.size();
    }

    @Override // android.widget.RemoteViewsService.RemoteViewsFactory
    public final long getItemId(int i) {
        return i;
    }

    @Override // android.widget.RemoteViewsService.RemoteViewsFactory
    public final RemoteViews getLoadingView() {
        return new RemoteViews(this.a.getPackageName(), R.layout.widget_item_loading);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:11:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0047  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x004c  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0088  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00ee A[Catch: Exception -> 0x00f3, TRY_LEAVE, TryCatch #0 {Exception -> 0x00f3, blocks: (B:30:0x00a3, B:32:0x00ee), top: B:42:0x00a3 }] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0100  */
    /* JADX WARN: Type inference failed for: r2v2, types: [n92] */
    /* JADX WARN: Type inference failed for: r2v6 */
    /* JADX WARN: Type inference failed for: r2v7 */
    @Override // android.widget.RemoteViewsService.RemoteViewsFactory
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.widget.RemoteViews getViewAt(int r10) {
        /*
            Method dump skipped, instruction units count: 295
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ru7.getViewAt(int):android.widget.RemoteViews");
    }

    @Override // android.widget.RemoteViewsService.RemoteViewsFactory
    public final int getViewTypeCount() {
        return 1;
    }

    @Override // android.widget.RemoteViewsService.RemoteViewsFactory
    public final boolean hasStableIds() {
        return true;
    }

    @Override // android.widget.RemoteViewsService.RemoteViewsFactory
    public final void onCreate() {
        rqd.a(this.c.a, new WidgetCreated(null, null, 3, null), "", null, false, null, null, 60);
    }

    @Override // android.widget.RemoteViewsService.RemoteViewsFactory
    public final void onDataSetChanged() {
        this.d.clear();
        try {
            rx0.V(new qu7(this, null));
        } catch (InterruptedException e) {
            wld.a.n(e, "Widget data loading was interrupted", new Object[0]);
            Thread.currentThread().interrupt();
        }
    }

    @Override // android.widget.RemoteViewsService.RemoteViewsFactory
    public final void onDestroy() {
    }
}
