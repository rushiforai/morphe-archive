package o9;

import android.content.ComponentName;
import android.content.ContentValues;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import com.amplitude.android.migration.DatabaseConstants;
import com.android.launcher3.LauncherProvider;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes2.dex */
public class e implements i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79813a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ j f79814b;

    public /* synthetic */ e(j jVar, int i5) {
        this.f79813a = i5;
        this.f79814b = jVar;
    }

    @Override // o9.i
    public final int a(XmlPullParser xmlPullParser) throws XmlPullParserException, PackageManager.NameNotFoundException, IOException {
        ActivityInfo activityInfo;
        ComponentName componentName;
        switch (this.f79813a) {
            case 0:
                j jVar = this.f79814b;
                PackageManager packageManager = jVar.f79911d;
                String strE = j.e(xmlPullParser, "packageName");
                String strE2 = j.e(xmlPullParser, "className");
                if (TextUtils.isEmpty(strE) || TextUtils.isEmpty(strE2)) {
                    return c(xmlPullParser);
                }
                try {
                    try {
                        componentName = new ComponentName(strE, strE2);
                        activityInfo = packageManager.getActivityInfo(componentName, 0);
                    } catch (PackageManager.NameNotFoundException unused) {
                        ComponentName componentName2 = new ComponentName(packageManager.currentToCanonicalPackageNames(new String[]{strE})[0], strE2);
                        activityInfo = packageManager.getActivityInfo(componentName2, 0);
                        componentName = componentName2;
                    }
                    return jVar.a(0, new Intent("android.intent.action.MAIN", (Uri) null).addCategory("android.intent.category.LAUNCHER").setComponent(componentName).setFlags(270532608), activityInfo.loadLabel(packageManager).toString());
                } catch (PackageManager.NameNotFoundException unused2) {
                    Log.e("AutoInstalls", "Favorite not found: " + strE + "/" + strE2);
                    return -1;
                }
            case 1:
                String strE3 = j.e(xmlPullParser, "packageName");
                String strE4 = j.e(xmlPullParser, "className");
                if (TextUtils.isEmpty(strE3) || TextUtils.isEmpty(strE4)) {
                    return -1;
                }
                j jVar2 = this.f79814b;
                jVar2.f79917j.put("restored", (Integer) 2);
                return jVar2.a(0, new Intent("android.intent.action.MAIN", (Uri) null).addCategory("android.intent.category.LAUNCHER").setComponent(new ComponentName(strE3, strE4)).setFlags(270532608), jVar2.f79908a.getString(2132019042));
            default:
                ContentValues contentValues = this.f79814b.f79917j;
                ComponentName componentNameB = b(xmlPullParser);
                if (componentNameB == null) {
                    return -1;
                }
                contentValues.put("spanX", j.e(xmlPullParser, "spanX"));
                contentValues.put("spanY", j.e(xmlPullParser, "spanY"));
                contentValues.put("itemType", (Integer) 4);
                Bundle bundle = new Bundle();
                int depth = xmlPullParser.getDepth();
                while (true) {
                    int next = xmlPullParser.next();
                    if (next == 3 && xmlPullParser.getDepth() <= depth) {
                        return d(componentNameB, bundle);
                    }
                    if (next == 2) {
                        if (!"extra".equals(xmlPullParser.getName())) {
                            throw new RuntimeException("Widgets can contain only extras");
                        }
                        String strE5 = j.e(xmlPullParser, DatabaseConstants.KEY_FIELD);
                        String strE6 = j.e(xmlPullParser, "value");
                        if (strE5 != null && strE6 != null) {
                            bundle.putString(strE5, strE6);
                        }
                    }
                }
                throw new RuntimeException("Widget extras must have a key and value");
        }
    }

    public ComponentName b(XmlPullParser xmlPullParser) {
        String strE = j.e(xmlPullParser, "packageName");
        String strE2 = j.e(xmlPullParser, "className");
        if (TextUtils.isEmpty(strE) || TextUtils.isEmpty(strE2)) {
            return null;
        }
        return new ComponentName(strE, strE2);
    }

    public int c(XmlPullParser xmlPullParser) {
        Log.w("AutoInstalls", "Skipping invalid <favorite> with no component");
        return -1;
    }

    public int d(ComponentName componentName, Bundle bundle) {
        j jVar = this.f79814b;
        ContentValues contentValues = jVar.f79917j;
        contentValues.put("appWidgetProvider", componentName.flattenToString());
        contentValues.put("restored", (Integer) 35);
        g gVar = jVar.f79910c;
        contentValues.put("_id", Integer.valueOf(((f2) gVar).c()));
        if (!bundle.isEmpty()) {
            contentValues.put("intent", new Intent().putExtras(bundle).toUri(0));
        }
        SQLiteDatabase sQLiteDatabase = jVar.f79919l;
        f2 f2Var = (f2) gVar;
        f2Var.getClass();
        int iC = LauncherProvider.c(f2Var, sQLiteDatabase, "favorites", contentValues);
        if (iC < 0) {
            return -1;
        }
        return iC;
    }
}
