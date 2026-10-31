package o9;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import android.util.ArrayMap;
import android.util.AttributeSet;
import android.util.Log;
import android.util.Pair;
import android.util.Xml;
import com.android.launcher3.LauncherProvider;
import java.io.IOException;
import java.util.Locale;
import java.util.function.Supplier;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes2.dex */
public class j {

    /* renamed from: m, reason: collision with root package name */
    public static final String f79907m = g2.b(-101);

    /* renamed from: a, reason: collision with root package name */
    public final Context f79908a;

    /* renamed from: b, reason: collision with root package name */
    public final ab.m f79909b;

    /* renamed from: c, reason: collision with root package name */
    public final g f79910c;

    /* renamed from: d, reason: collision with root package name */
    public final PackageManager f79911d;

    /* renamed from: e, reason: collision with root package name */
    public final Resources f79912e;

    /* renamed from: f, reason: collision with root package name */
    public final Supplier f79913f;

    /* renamed from: g, reason: collision with root package name */
    public final int f79914g;

    /* renamed from: h, reason: collision with root package name */
    public final int f79915h;

    /* renamed from: i, reason: collision with root package name */
    public final int[] f79916i;

    /* renamed from: j, reason: collision with root package name */
    public final ContentValues f79917j;

    /* renamed from: k, reason: collision with root package name */
    public final String f79918k;

    /* renamed from: l, reason: collision with root package name */
    public SQLiteDatabase f79919l;

    public j(Context context, ab.m mVar, g gVar, final Resources resources, final int i5, String str) {
        this(context, mVar, gVar, resources, new Supplier() { // from class: o9.d
            @Override // java.util.function.Supplier
            public final Object get() {
                return resources.getXml(i5);
            }
        }, str);
    }

    public static void b(XmlPullParser xmlPullParser, String str) throws XmlPullParserException, IOException {
        int next;
        do {
            next = xmlPullParser.next();
            if (next == 2) {
                break;
            }
        } while (next != 1);
        if (next != 2) {
            throw new XmlPullParserException("No start tag found");
        }
        if (xmlPullParser.getName().equals(str)) {
            return;
        }
        throw new XmlPullParserException("Unexpected start tag: found " + xmlPullParser.getName() + ", expected " + str);
    }

    public static j c(Context context, ab.m mVar, g gVar) {
        Pair pairS = x7.e.s(context.getPackageManager(), "android.autoinstalls.config.action.PLAY_AUTO_INSTALL");
        if (pairS == null) {
            return null;
        }
        String str = (String) pairS.first;
        Resources resources = (Resources) pairS.second;
        z0 z0Var = (z0) z0.f80267w.h(context);
        Locale locale = Locale.ENGLISH;
        int i5 = z0Var.f80269b;
        int i11 = z0Var.f80268a;
        int i12 = z0Var.f80278k;
        StringBuilder sbT = b.c0.t(i5, "default_layout_", "x", i11, "_h");
        sbT.append(i12);
        int identifier = resources.getIdentifier(sbT.toString(), "xml", str);
        if (identifier == 0) {
            identifier = resources.getIdentifier(b.c0.g(z0Var.f80269b, z0Var.f80268a, "default_layout_", "x"), "xml", str);
        }
        if (identifier == 0) {
            identifier = resources.getIdentifier("default_layout", "xml", str);
        }
        int i13 = identifier;
        if (i13 != 0) {
            return new j(context, mVar, gVar, resources, i13, "workspace");
        }
        Log.e("AutoInstalls", "Layout definition not found in package: " + str);
        return null;
    }

    public static int d(XmlPullParser xmlPullParser, String str) {
        AttributeSet attributeSetAsAttributeSet = Xml.asAttributeSet(xmlPullParser);
        int attributeResourceValue = attributeSetAsAttributeSet.getAttributeResourceValue("http://schemas.android.com/apk/res-auto/com.android.launcher3", str, 0);
        return attributeResourceValue == 0 ? attributeSetAsAttributeSet.getAttributeResourceValue(null, str, 0) : attributeResourceValue;
    }

    public static String e(XmlPullParser xmlPullParser, String str) {
        String attributeValue = xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res-auto/com.android.launcher3", str);
        return attributeValue == null ? xmlPullParser.getAttributeValue(null, str) : attributeValue;
    }

    public final int a(int i5, Intent intent, String str) {
        f2 f2Var = (f2) this.f79910c;
        int iC = f2Var.c();
        String uri = intent.toUri(0);
        ContentValues contentValues = this.f79917j;
        contentValues.put("intent", uri);
        contentValues.put("title", str);
        contentValues.put("itemType", Integer.valueOf(i5));
        contentValues.put("spanX", (Integer) 1);
        contentValues.put("spanY", (Integer) 1);
        contentValues.put("_id", Integer.valueOf(iC));
        SQLiteDatabase sQLiteDatabase = this.f79919l;
        f2Var.getClass();
        if (LauncherProvider.c(f2Var, sQLiteDatabase, "favorites", contentValues) < 0) {
            return -1;
        }
        return iC;
    }

    public ArrayMap f() {
        ArrayMap arrayMap = new ArrayMap();
        arrayMap.put("appicon", new e(this, 0));
        arrayMap.put("autoinstall", new e(this, 1));
        arrayMap.put("shortcut", new f(this, this.f79912e, 1));
        return arrayMap;
    }

    public ArrayMap g() {
        ArrayMap arrayMap = new ArrayMap();
        arrayMap.put("appicon", new e(this, 0));
        arrayMap.put("autoinstall", new e(this, 1));
        arrayMap.put("folder", new f(this, f(), 0));
        arrayMap.put("appwidget", new e(this, 2));
        arrayMap.put("searchwidget", new h(this, 0));
        arrayMap.put("shortcut", new f(this, this.f79912e, 1));
        return arrayMap;
    }

    public final int h(SQLiteDatabase sQLiteDatabase, ya.p pVar) {
        this.f79919l = sQLiteDatabase;
        try {
            return j((XmlPullParser) this.f79913f.get(), pVar);
        } catch (Exception e3) {
            Log.e("AutoInstalls", "Error parsing layout: ", e3);
            return -1;
        }
    }

    public void i(XmlPullParser xmlPullParser, int[] iArr) {
        if (f79907m.equals(e(xmlPullParser, "container"))) {
            iArr[0] = -101;
            iArr[1] = Integer.parseInt(e(xmlPullParser, "screen"));
        } else {
            iArr[0] = -100;
            iArr[1] = Integer.parseInt(e(xmlPullParser, "screen"));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0043  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int j(XmlPullParser xmlPullParser, ya.p pVar) throws XmlPullParserException, IOException {
        int i5;
        int i11;
        b(xmlPullParser, this.f79918k);
        int depth = xmlPullParser.getDepth();
        ArrayMap arrayMapG = g();
        int i12 = 0;
        while (true) {
            int next = xmlPullParser.next();
            if (next == 3 && xmlPullParser.getDepth() <= depth) {
                break;
            }
            int iJ = 1;
            if (next == 1) {
                break;
            }
            if (next == 2) {
                if ("include".equals(xmlPullParser.getName())) {
                    int iD = d(xmlPullParser, "workspace");
                    iJ = iD != 0 ? j(this.f79912e.getXml(iD), pVar) : 0;
                    i12 += iJ;
                } else {
                    ContentValues contentValues = this.f79917j;
                    contentValues.clear();
                    int[] iArr = this.f79916i;
                    i(xmlPullParser, iArr);
                    int i13 = iArr[0];
                    int i14 = iArr[1];
                    contentValues.put("container", Integer.valueOf(i13));
                    contentValues.put("screen", Integer.valueOf(i14));
                    String strE = e(xmlPullParser, "x");
                    if (!TextUtils.isEmpty(strE) && (i11 = Integer.parseInt(strE)) < 0) {
                        strE = Integer.toString(this.f79915h + i11);
                    }
                    contentValues.put("cellX", strE);
                    String strE2 = e(xmlPullParser, "y");
                    if (!TextUtils.isEmpty(strE2) && (i5 = Integer.parseInt(strE2)) < 0) {
                        strE2 = Integer.toString(this.f79914g + i5);
                    }
                    contentValues.put("cellY", strE2);
                    if (i13 == -101) {
                        contentValues.put("rank", Integer.valueOf(Integer.parseInt(e(xmlPullParser, "rank"))));
                    }
                    i iVar = (i) arrayMapG.get(xmlPullParser.getName());
                    if (iVar != null && iVar.a(xmlPullParser) >= 0) {
                        if (!pVar.f(i14) && i13 == -100) {
                            pVar.c(i14);
                        }
                    }
                    i12 += iJ;
                }
            }
        }
        return i12;
    }

    public j(Context context, ab.m mVar, g gVar, Resources resources, Supplier supplier, String str) {
        this.f79916i = new int[2];
        this.f79908a = context;
        this.f79909b = mVar;
        this.f79910c = gVar;
        this.f79911d = context.getPackageManager();
        this.f79917j = new ContentValues();
        this.f79918k = str;
        this.f79912e = resources;
        this.f79913f = supplier;
        z0 z0Var = (z0) z0.f80267w.h(context);
        this.f79914g = z0Var.f80268a;
        this.f79915h = z0Var.f80269b;
    }
}
