package o9;

import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.text.TextUtils;
import android.util.Log;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.net.URISyntaxException;
import java.util.List;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes2.dex */
public final class b0 extends e {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ f0 f79771c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(f0 f0Var) {
        super(f0Var, 0);
        this.f79771c = f0Var;
    }

    @Override // o9.e
    public final int c(XmlPullParser xmlPullParser) throws URISyntaxException {
        String strE = j.e(xmlPullParser, "uri");
        if (TextUtils.isEmpty(strE)) {
            Log.e("DefaultLayoutParser", "Skipping invalid <favorite> with no component or uri");
            return -1;
        }
        try {
            Intent uri = Intent.parseUri(strE, 0);
            f0 f0Var = this.f79771c;
            ResolveInfo resolveInfoResolveActivity = f0Var.f79911d.resolveActivity(uri, SQLiteDatabase.OPEN_FULLMUTEX);
            List<ResolveInfo> listQueryIntentActivities = f0Var.f79911d.queryIntentActivities(uri, SQLiteDatabase.OPEN_FULLMUTEX);
            int i5 = 0;
            while (true) {
                if (i5 < listQueryIntentActivities.size()) {
                    ResolveInfo resolveInfo = listQueryIntentActivities.get(i5);
                    if (resolveInfo.activityInfo.name.equals(resolveInfoResolveActivity.activityInfo.name) && resolveInfo.activityInfo.packageName.equals(resolveInfoResolveActivity.activityInfo.packageName)) {
                        break;
                    }
                    i5++;
                } else {
                    int size = listQueryIntentActivities.size();
                    ResolveInfo resolveInfo2 = null;
                    for (int i11 = 0; i11 < size; i11++) {
                        try {
                        } catch (PackageManager.NameNotFoundException e3) {
                            Log.w("DefaultLayoutParser", "Unable to get info about resolve results", e3);
                        }
                        if ((f0Var.f79911d.getApplicationInfo(listQueryIntentActivities.get(i11).activityInfo.packageName, 0).flags & 1) != 0) {
                            if (resolveInfo2 != null) {
                                resolveInfoResolveActivity = null;
                                break;
                            }
                            resolveInfo2 = listQueryIntentActivities.get(i11);
                        }
                    }
                    resolveInfoResolveActivity = resolveInfo2;
                    if (resolveInfoResolveActivity == null) {
                        Log.w("DefaultLayoutParser", "No preference or single system activity found for " + uri.toString());
                        return -1;
                    }
                }
            }
            ActivityInfo activityInfo = resolveInfoResolveActivity.activityInfo;
            Intent launchIntentForPackage = f0Var.f79911d.getLaunchIntentForPackage(activityInfo.packageName);
            if (launchIntentForPackage == null) {
                return -1;
            }
            launchIntentForPackage.setFlags(270532608);
            return f0Var.a(0, launchIntentForPackage, activityInfo.loadLabel(f0Var.f79911d).toString());
        } catch (URISyntaxException e11) {
            Log.e("DefaultLayoutParser", "Unable to add meta-favorite: " + strE, e11);
            return -1;
        }
    }
}
