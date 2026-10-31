package o9;

import android.appwidget.AppWidgetManager;
import android.content.ComponentName;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.Log;
import com.android.launcher3.LauncherProvider;
import com.android.launcher3.qsb.QsbContainerView;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes2.dex */
public final class h extends e {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f79858c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ j f79859d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ h(j jVar, int i5) {
        super(jVar, 2);
        this.f79858c = i5;
        this.f79859d = jVar;
    }

    @Override // o9.e
    public ComponentName b(XmlPullParser xmlPullParser) {
        switch (this.f79858c) {
            case 0:
                return QsbContainerView.a(this.f79859d.f79908a);
            default:
                return super.b(xmlPullParser);
        }
    }

    @Override // o9.e
    public final int d(ComponentName componentName, Bundle bundle) throws PackageManager.NameNotFoundException {
        switch (this.f79858c) {
            case 0:
                ContentValues contentValues = this.f79859d.f79917j;
                contentValues.put("options", (Integer) 1);
                contentValues.put("restored", Integer.valueOf(contentValues.getAsInteger("restored").intValue() | 4));
                return super.d(componentName, bundle);
            default:
                f0 f0Var = (f0) this.f79859d;
                g gVar = f0Var.f79910c;
                Context context = f0Var.f79908a;
                ab.m mVar = f0Var.f79909b;
                PackageManager packageManager = f0Var.f79911d;
                ContentValues contentValues2 = f0Var.f79917j;
                int iC = -1;
                try {
                    packageManager.getReceiverInfo(componentName, 0);
                } catch (Exception unused) {
                    ComponentName componentName2 = new ComponentName(packageManager.currentToCanonicalPackageNames(new String[]{componentName.getPackageName()})[0], componentName.getClassName());
                    try {
                        packageManager.getReceiverInfo(componentName2, 0);
                        componentName = componentName2;
                    } catch (Exception unused2) {
                        componentName2.getClassName();
                    }
                }
                AppWidgetManager appWidgetManager = AppWidgetManager.getInstance(context);
                try {
                    int iAllocateAppWidgetId = mVar.allocateAppWidgetId();
                    if (appWidgetManager.bindAppWidgetIdIfAllowed(iAllocateAppWidgetId, componentName)) {
                        contentValues2.put("appWidgetId", Integer.valueOf(iAllocateAppWidgetId));
                        contentValues2.put("appWidgetProvider", componentName.flattenToString());
                        contentValues2.put("_id", Integer.valueOf(((f2) gVar).c()));
                        SQLiteDatabase sQLiteDatabase = f0Var.f79919l;
                        f2 f2Var = (f2) gVar;
                        f2Var.getClass();
                        iC = LauncherProvider.c(f2Var, sQLiteDatabase, "favorites", contentValues2);
                        if (iC < 0) {
                            mVar.deleteAppWidgetId(iAllocateAppWidgetId);
                        } else if (!bundle.isEmpty()) {
                            Intent intent = new Intent("com.android.launcher.action.APPWIDGET_DEFAULT_WORKSPACE_CONFIGURE");
                            intent.setComponent(componentName);
                            intent.putExtras(bundle);
                            intent.putExtra("appWidgetId", iAllocateAppWidgetId);
                            context.sendBroadcast(intent);
                        }
                    } else {
                        Log.e("DefaultLayoutParser", "Unable to bind app widget id " + componentName);
                        mVar.deleteAppWidgetId(iAllocateAppWidgetId);
                    }
                } catch (RuntimeException e3) {
                    Log.e("DefaultLayoutParser", "Problem allocating appWidgetId", e3);
                }
                return iC;
        }
    }
}
