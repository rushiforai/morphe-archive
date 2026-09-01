package com.medium.android.donkey.widget;

import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.widget.RemoteViews;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.home.ui.home.HomeFragment;
import com.medium.reader.R;
import defpackage.gp7;
import defpackage.uz5;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class MediumAppWidgetProvider extends AppWidgetProvider {
    /* JADX WARN: Removed duplicated region for block: B:17:0x00c1  */
    @Override // android.appwidget.AppWidgetProvider, android.content.BroadcastReceiver
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onReceive(android.content.Context r53, android.content.Intent r54) {
        /*
            Method dump skipped, instruction units count: 226
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.donkey.widget.MediumAppWidgetProvider.onReceive(android.content.Context, android.content.Intent):void");
    }

    @Override // android.appwidget.AppWidgetProvider
    public final void onUpdate(Context context, AppWidgetManager appWidgetManager, int[] iArr) {
        context.getClass();
        appWidgetManager.getClass();
        iArr.getClass();
        for (int i : iArr) {
            uz5 uz5Var = new uz5(context);
            uz5Var.n();
            ((Intent) uz5Var.c).setComponent(new ComponentName(context, (Class<?>) MainActivity.class));
            String strU = gp7.u(new SourceParameter("widget", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null));
            Bundle bundle = new Bundle();
            bundle.putParcelable("bundle_info", new HomeFragment.BundleInfo(strU));
            uz5Var.a(R.id.homeFragment, bundle);
            PendingIntent pendingIntentB = uz5Var.b();
            Intent intent = new Intent(context, (Class<?>) MediumWidgetService.class);
            intent.putExtra("appWidgetId", i);
            intent.setData(Uri.parse(intent.toUri(1)));
            RemoteViews remoteViews = new RemoteViews(context.getPackageName(), R.layout.widget_layout);
            remoteViews.setOnClickPendingIntent(R.id.wordmark, pendingIntentB);
            remoteViews.setRemoteAdapter(R.id.widget_list, intent);
            remoteViews.setEmptyView(R.id.widget_list, R.id.widget_empty_view);
            Intent intent2 = new Intent(context, (Class<?>) MediumAppWidgetProvider.class);
            intent2.setAction("WIDGET_ITEM_OPEN_POST_ACTION");
            intent2.putExtra("appWidgetId", i);
            remoteViews.setPendingIntentTemplate(R.id.widget_list, PendingIntent.getBroadcast(context, 0, intent2, Build.VERSION.SDK_INT >= 31 ? 167772160 : 134217728));
            Intent intent3 = new Intent(context, (Class<?>) MediumAppWidgetProvider.class);
            intent3.setAction("WIDGET_REFRESH");
            intent3.putExtra("appWidgetIds", iArr);
            remoteViews.setOnClickPendingIntent(R.id.refresh, PendingIntent.getBroadcast(context, 0, intent3, 201326592));
            appWidgetManager.updateAppWidget(i, remoteViews);
        }
        super.onUpdate(context, appWidgetManager, iArr);
    }
}
