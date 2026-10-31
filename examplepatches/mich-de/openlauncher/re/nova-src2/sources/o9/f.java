package o9;

import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Intent;
import android.content.res.Resources;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Process;
import android.text.TextUtils;
import android.util.ArrayMap;
import android.util.Patterns;
import com.android.launcher3.LauncherProvider;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes2.dex */
public class f implements i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79826a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ j f79827b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f79828c;

    public /* synthetic */ f(j jVar, Object obj, int i5) {
        this.f79826a = i5;
        this.f79827b = jVar;
        this.f79828c = obj;
    }

    @Override // o9.i
    public int a(XmlPullParser xmlPullParser) throws XmlPullParserException, Resources.NotFoundException, IOException {
        String strE;
        String str;
        String str2;
        Intent intentB;
        Drawable drawable;
        switch (this.f79826a) {
            case 0:
                int iD = j.d(xmlPullParser, "title");
                j jVar = this.f79827b;
                if (iD != 0) {
                    strE = jVar.f79912e.getString(iD);
                } else {
                    strE = j.e(xmlPullParser, "titleText");
                    if (TextUtils.isEmpty(strE)) {
                        strE = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                }
                ContentValues contentValues = jVar.f79917j;
                g gVar = jVar.f79910c;
                ContentValues contentValues2 = jVar.f79917j;
                contentValues.put("title", strE);
                contentValues2.put("itemType", (Integer) 2);
                contentValues2.put("spanX", (Integer) 1);
                contentValues2.put("spanY", (Integer) 1);
                contentValues2.put("_id", Integer.valueOf(((f2) gVar).c()));
                SQLiteDatabase sQLiteDatabase = jVar.f79919l;
                f2 f2Var = (f2) gVar;
                f2Var.getClass();
                int iC = LauncherProvider.c(f2Var, sQLiteDatabase, "favorites", contentValues2);
                if (iC >= 0) {
                    ContentValues contentValues3 = new ContentValues(contentValues2);
                    ya.p pVar = new ya.p();
                    int depth = xmlPullParser.getDepth();
                    int i5 = 0;
                    while (true) {
                        int next = xmlPullParser.next();
                        if (next != 3 || xmlPullParser.getDepth() > depth) {
                            if (next == 2) {
                                contentValues2.clear();
                                contentValues2.put("container", Integer.valueOf(iC));
                                contentValues2.put("rank", Integer.valueOf(i5));
                                i iVar = (i) ((ArrayMap) this.f79828c).get(xmlPullParser.getName());
                                if (iVar == null) {
                                    throw new RuntimeException("Invalid folder item " + xmlPullParser.getName());
                                }
                                int iA = iVar.a(xmlPullParser);
                                if (iA >= 0) {
                                    pVar.c(iA);
                                    i5++;
                                }
                            }
                        } else {
                            if (pVar.f97194b >= 2) {
                                return iC;
                            }
                            Uri uriC = g2.c(iC);
                            if (uriC.getPathSegments().size() == 1) {
                                str2 = uriC.getPathSegments().get(0);
                                str = null;
                            } else {
                                if (uriC.getPathSegments().size() != 2) {
                                    throw new IllegalArgumentException(h6.c1.p(uriC, "Invalid URI: "));
                                }
                                if (!TextUtils.isEmpty(null)) {
                                    throw new UnsupportedOperationException(h6.c1.p(uriC, "WHERE clause not supported: "));
                                }
                                String str3 = uriC.getPathSegments().get(0);
                                str = "_id=" + ContentUris.parseId(uriC);
                                str2 = str3;
                            }
                            jVar.f79919l.delete(str2, str, null);
                            if (pVar.f97194b == 1) {
                                ContentValues contentValues4 = new ContentValues();
                                contentValues4.put("container", contentValues3.getAsInteger("container"));
                                contentValues4.put("screen", contentValues3.getAsInteger("screen"));
                                contentValues4.put("cellX", contentValues3.getAsInteger("cellX"));
                                contentValues4.put("cellY", contentValues3.getAsInteger("cellY"));
                                int iJ = pVar.j(0);
                                jVar.f79919l.update("favorites", contentValues4, b.c0.h(iJ, "_id="), null);
                                return iJ;
                            }
                        }
                    }
                }
                return -1;
            default:
                Resources resources = (Resources) this.f79828c;
                j jVar2 = this.f79827b;
                ContentValues contentValues5 = jVar2.f79917j;
                int iD2 = j.d(xmlPullParser, "title");
                int iD3 = j.d(xmlPullParser, "icon");
                if (iD2 == 0 || iD3 == 0 || (intentB = b(xmlPullParser)) == null || (drawable = resources.getDrawable(iD3)) == null) {
                    return -1;
                }
                aa.g0 g0VarW = aa.g0.w(jVar2.f79908a);
                contentValues5.put("icon", aa.p.a(g0VarW.c(drawable, Process.myUserHandle(), Build.VERSION.SDK_INT).f21151a));
                g0VarW.D();
                contentValues5.put("iconPackage", resources.getResourcePackageName(iD3));
                contentValues5.put("iconResource", resources.getResourceName(iD3));
                intentB.setFlags(270532608);
                return jVar2.a(1, intentB, jVar2.f79912e.getString(iD2));
        }
    }

    public Intent b(XmlPullParser xmlPullParser) {
        String strE = j.e(xmlPullParser, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
        if (TextUtils.isEmpty(strE) || !Patterns.WEB_URL.matcher(strE).matches()) {
            return null;
        }
        return new Intent("android.intent.action.VIEW", (Uri) null).setData(Uri.parse(strE));
    }
}
