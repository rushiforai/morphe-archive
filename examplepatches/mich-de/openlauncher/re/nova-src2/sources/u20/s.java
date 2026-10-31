package u20;

import ab.e0;
import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import com.teslacoilsw.launcher.NovaLauncher;
import e10.y2;
import fz.d0;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import mx.p1;
import o9.t1;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

/* loaded from: classes4.dex */
public class s extends f {

    /* renamed from: d, reason: collision with root package name */
    public Resources f90507d;

    /* renamed from: e, reason: collision with root package name */
    public final String f90508e;

    /* renamed from: f, reason: collision with root package name */
    public final v20.e f90509f;

    /* renamed from: g, reason: collision with root package name */
    public final ex.a f90510g;

    /* renamed from: h, reason: collision with root package name */
    public final int f90511h;

    /* renamed from: i, reason: collision with root package name */
    public final int f90512i;

    /* renamed from: j, reason: collision with root package name */
    public final ComponentName f90513j;

    public s(Activity activity, String str, v20.e eVar, ex.a aVar, int i5, int i11, ComponentName componentName) {
        super(activity);
        this.f90508e = str;
        this.f90509f = eVar;
        this.f90510g = aVar;
        this.f90511h = i5;
        this.f90512i = i11;
        this.f90513j = componentName;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x00b7  */
    @Override // android.content.AsyncTaskLoader
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public List loadInBackground() throws XmlPullParserException, IOException {
        Bitmap bitmapC;
        aa.n nVar;
        gz.f fVar;
        String str = this.f90508e;
        this.f90507d = null;
        try {
            this.f90507d = this.f90471b.getResourcesForApplication(str);
        } catch (PackageManager.NameNotFoundException e3) {
            e3.printStackTrace();
        }
        ex.a aVar = this.f90510g;
        String str2 = aVar.f53057b;
        Resources resources = this.f90507d;
        int identifier = resources.getIdentifier("appfilter", "xml", str);
        Context context = this.f90470a;
        if (identifier != 0) {
            fz.u uVarC = e0.c(context, this.f90512i, this.f90511h, (fz.d) y2.f51877a.i().l(), ((Object) str2) + ":GO:" + str);
            d0 d0Var = new d0(context, t1.a(context), null, uVarC, true, false);
            fVar = (gz.f) uVarC.f56363e;
            if (!fVar.a()) {
                Resources resources2 = context.getResources();
                int i5 = this.f90512i;
                int i11 = this.f90511h;
                Bitmap bitmapB = dy.g.b(resources2, 2131231591, i5, i11, i11, null, true);
                Bitmap bitmapI = fVar.i(context, NovaLauncher.f45646r1, new aa.n(bitmapB, 0, false));
                if (bitmapI == null || bitmapI == bitmapB) {
                    nVar = null;
                } else {
                    nVar = new aa.n(bitmapI, 0, false);
                    nVar.setAlpha(128);
                    nVar.j(true);
                }
                ComponentName componentName = this.f90513j;
                if (componentName == null || ((!((gz.f) d0Var.f56214w.f56363e).a() && !((gz.f) d0Var.f56214w.f56363e).j(componentName)) || (bitmapC = fVar.c(context, d0Var.O(), componentName)) == null)) {
                    bitmapC = null;
                }
            }
        } else {
            try {
                InputStream inputStreamOpen = resources.getAssets().open("appfilter.xml");
                XmlPullParserFactory xmlPullParserFactoryNewInstance = XmlPullParserFactory.newInstance();
                xmlPullParserFactoryNewInstance.setNamespaceAware(true);
                XmlPullParser xmlPullParserNewPullParser = xmlPullParserFactoryNewInstance.newPullParser();
                xmlPullParserNewPullParser.setInput(inputStreamOpen, "UTF-8");
                xmlPullParserNewPullParser.next();
                inputStreamOpen.close();
                fz.u uVarC2 = e0.c(context, this.f90512i, this.f90511h, (fz.d) y2.f51877a.i().l(), ((Object) str2) + ":GO:" + str);
                d0 d0Var2 = new d0(context, t1.a(context), null, uVarC2, true, false);
                fVar = (gz.f) uVarC2.f56363e;
                if (!fVar.a()) {
                }
            } catch (IOException | XmlPullParserException unused) {
                bitmapC = null;
                nVar = null;
            }
        }
        r rVarH = this.f90509f.h(context, this.f90507d, str, bitmapC);
        rVarH.f90503b = aVar;
        if (bitmapC != null) {
            rVarH.f90504c.add(bitmapC);
        }
        rVarH.f90505d = nVar;
        try {
            p1.c("ThemePicker loadInBackground");
            return rVarH;
        } catch (InterruptedException unused2) {
            return null;
        }
    }
}
