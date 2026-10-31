package o9;

import android.content.Context;
import android.content.res.Resources;
import android.util.ArrayMap;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes2.dex */
public final class f0 extends j {
    public f0(Context context, ab.m mVar, g gVar, Resources resources, int i5) {
        super(context, mVar, gVar, resources, i5, "favorites");
    }

    @Override // o9.j
    public final ArrayMap f() {
        ArrayMap arrayMap = new ArrayMap();
        arrayMap.put("favorite", new b0(this));
        arrayMap.put("shortcut", new e0(this, this.f79912e, 1));
        return arrayMap;
    }

    @Override // o9.j
    public final ArrayMap g() {
        ArrayMap arrayMap = new ArrayMap();
        arrayMap.put("favorite", new b0(this));
        arrayMap.put("appwidget", new h(this, 1));
        arrayMap.put("searchwidget", new h(this, 0));
        arrayMap.put("shortcut", new e0(this, this.f79912e, 1));
        arrayMap.put("resolve", new d0(this, 1));
        arrayMap.put("folder", new c0(this));
        arrayMap.put("partner-folder", new d0(this, 0));
        return arrayMap;
    }

    @Override // o9.j
    public final void i(XmlPullParser xmlPullParser, int[] iArr) {
        iArr[0] = -100;
        String strE = j.e(xmlPullParser, "container");
        if (strE != null) {
            iArr[0] = Integer.parseInt(strE);
        }
        iArr[1] = 0;
        String strE2 = j.e(xmlPullParser, "screen");
        if (strE2 != null) {
            iArr[1] = Integer.parseInt(strE2);
        }
    }
}
