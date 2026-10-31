package androidx.appcompat.view;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.util.AttributeSet;
import android.util.Log;
import android.util.Xml;
import android.view.InflateException;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.SubMenu;
import androidx.recyclerview.widget.u1;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import r.a1;

/* loaded from: classes2.dex */
public final class i extends MenuInflater {

    /* renamed from: e, reason: collision with root package name */
    public static final Class[] f13648e;

    /* renamed from: f, reason: collision with root package name */
    public static final Class[] f13649f;

    /* renamed from: a, reason: collision with root package name */
    public final Object[] f13650a;

    /* renamed from: b, reason: collision with root package name */
    public final Object[] f13651b;

    /* renamed from: c, reason: collision with root package name */
    public final Context f13652c;

    /* renamed from: d, reason: collision with root package name */
    public Object f13653d;

    static {
        Class[] clsArr = {Context.class};
        f13648e = clsArr;
        f13649f = clsArr;
    }

    public i(Context context) {
        super(context);
        this.f13652c = context;
        Object[] objArr = {context};
        this.f13650a = objArr;
        this.f13651b = objArr;
    }

    public static Object a(Object obj) {
        return (!(obj instanceof Activity) && (obj instanceof ContextWrapper)) ? a(((ContextWrapper) obj).getBaseContext()) : obj;
    }

    public final void b(XmlPullParser xmlPullParser, AttributeSet attributeSet, Menu menu) throws XmlPullParserException, IllegalAccessException, IOException, IllegalArgumentException, InvocationTargetException {
        int i5;
        XmlPullParser xmlPullParser2;
        ColorStateList colorStateList;
        int resourceId;
        h hVar = new h(this, menu);
        int eventType = xmlPullParser.getEventType();
        while (true) {
            i5 = 2;
            if (eventType == 2) {
                String name = xmlPullParser.getName();
                if (!name.equals("menu")) {
                    throw new RuntimeException("Expecting menu, got ".concat(name));
                }
                eventType = xmlPullParser.next();
            } else {
                eventType = xmlPullParser.next();
                if (eventType == 1) {
                    break;
                }
            }
        }
        boolean z11 = false;
        boolean z12 = false;
        String str = null;
        while (!z11) {
            if (eventType == 1) {
                throw new RuntimeException("Unexpected end of document");
            }
            if (eventType != i5) {
                if (eventType != 3) {
                    xmlPullParser2 = xmlPullParser;
                    z11 = z11;
                } else {
                    String name2 = xmlPullParser.getName();
                    if (z12 && name2.equals(str)) {
                        xmlPullParser2 = xmlPullParser;
                        z12 = false;
                        str = null;
                    } else {
                        if (name2.equals("group")) {
                            hVar.f13625b = 0;
                            hVar.f13626c = 0;
                            hVar.f13627d = 0;
                            hVar.f13628e = 0;
                            hVar.f13629f = true;
                            hVar.f13630g = true;
                        } else if (name2.equals("item")) {
                            if (!hVar.f13631h) {
                                q.n nVar = hVar.f13647z;
                                if (nVar == null || !nVar.f83283c.hasSubMenu()) {
                                    hVar.f13631h = true;
                                    hVar.b(hVar.f13624a.add(hVar.f13625b, hVar.f13632i, hVar.f13633j, hVar.f13634k));
                                } else {
                                    hVar.f13631h = true;
                                    hVar.b(hVar.f13624a.addSubMenu(hVar.f13625b, hVar.f13632i, hVar.f13633j, hVar.f13634k).getItem());
                                }
                            }
                        } else if (name2.equals("menu")) {
                            xmlPullParser2 = xmlPullParser;
                            z11 = true;
                        }
                        xmlPullParser2 = xmlPullParser;
                        z11 = z11;
                    }
                }
                eventType = xmlPullParser2.next();
                i5 = 2;
                z11 = z11;
                z12 = z12;
            } else {
                if (!z12) {
                    String name3 = xmlPullParser.getName();
                    boolean zEquals = name3.equals("group");
                    Context context = this.f13652c;
                    if (zEquals) {
                        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, l.a.f72901p);
                        hVar.f13625b = typedArrayObtainStyledAttributes.getResourceId(1, 0);
                        hVar.f13626c = typedArrayObtainStyledAttributes.getInt(3, 0);
                        hVar.f13627d = typedArrayObtainStyledAttributes.getInt(4, 0);
                        hVar.f13628e = typedArrayObtainStyledAttributes.getInt(5, 0);
                        hVar.f13629f = typedArrayObtainStyledAttributes.getBoolean(2, true);
                        hVar.f13630g = typedArrayObtainStyledAttributes.getBoolean(0, true);
                        typedArrayObtainStyledAttributes.recycle();
                    } else {
                        if (name3.equals("item")) {
                            TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, l.a.f72902q);
                            hVar.f13632i = typedArrayObtainStyledAttributes2.getResourceId(2, 0);
                            hVar.f13633j = (typedArrayObtainStyledAttributes2.getInt(5, hVar.f13626c) & (-65536)) | (typedArrayObtainStyledAttributes2.getInt(6, hVar.f13627d) & 65535);
                            hVar.f13634k = typedArrayObtainStyledAttributes2.getText(7);
                            hVar.f13635l = typedArrayObtainStyledAttributes2.getText(8);
                            hVar.f13636m = typedArrayObtainStyledAttributes2.getResourceId(0, 0);
                            String string = typedArrayObtainStyledAttributes2.getString(9);
                            hVar.n = string == null ? (char) 0 : string.charAt(0);
                            hVar.o = typedArrayObtainStyledAttributes2.getInt(16, u1.FLAG_APPEARED_IN_PRE_LAYOUT);
                            String string2 = typedArrayObtainStyledAttributes2.getString(10);
                            hVar.f13637p = string2 == null ? (char) 0 : string2.charAt(0);
                            hVar.f13638q = typedArrayObtainStyledAttributes2.getInt(20, u1.FLAG_APPEARED_IN_PRE_LAYOUT);
                            if (typedArrayObtainStyledAttributes2.hasValue(11)) {
                                hVar.f13639r = typedArrayObtainStyledAttributes2.getBoolean(11, false) ? 1 : 0;
                            } else {
                                hVar.f13639r = hVar.f13628e;
                            }
                            hVar.f13640s = typedArrayObtainStyledAttributes2.getBoolean(3, false);
                            hVar.f13641t = typedArrayObtainStyledAttributes2.getBoolean(4, hVar.f13629f);
                            hVar.f13642u = typedArrayObtainStyledAttributes2.getBoolean(1, hVar.f13630g);
                            hVar.f13643v = typedArrayObtainStyledAttributes2.getInt(21, -1);
                            hVar.f13646y = typedArrayObtainStyledAttributes2.getString(12);
                            hVar.f13644w = typedArrayObtainStyledAttributes2.getResourceId(13, 0);
                            hVar.f13645x = typedArrayObtainStyledAttributes2.getString(15);
                            String string3 = typedArrayObtainStyledAttributes2.getString(14);
                            boolean z13 = string3 != null;
                            if (z13 && hVar.f13644w == 0 && hVar.f13645x == null) {
                                hVar.f13647z = (q.n) hVar.a(string3, f13649f, this.f13651b);
                            } else {
                                if (z13) {
                                    Log.w("SupportMenuInflater", "Ignoring attribute 'actionProviderClass'. Action view already specified.");
                                }
                                hVar.f13647z = null;
                            }
                            hVar.A = typedArrayObtainStyledAttributes2.getText(17);
                            hVar.B = typedArrayObtainStyledAttributes2.getText(22);
                            if (typedArrayObtainStyledAttributes2.hasValue(19)) {
                                hVar.D = a1.c(typedArrayObtainStyledAttributes2.getInt(19, -1), hVar.D);
                            } else {
                                hVar.D = null;
                            }
                            if (typedArrayObtainStyledAttributes2.hasValue(18)) {
                                if (!typedArrayObtainStyledAttributes2.hasValue(18) || (resourceId = typedArrayObtainStyledAttributes2.getResourceId(18, 0)) == 0 || (colorStateList = o4.a.b(context, resourceId)) == null) {
                                    colorStateList = typedArrayObtainStyledAttributes2.getColorStateList(18);
                                }
                                hVar.C = colorStateList;
                            } else {
                                hVar.C = null;
                            }
                            typedArrayObtainStyledAttributes2.recycle();
                            hVar.f13631h = false;
                            xmlPullParser2 = xmlPullParser;
                        } else if (name3.equals("menu")) {
                            hVar.f13631h = true;
                            SubMenu subMenuAddSubMenu = hVar.f13624a.addSubMenu(hVar.f13625b, hVar.f13632i, hVar.f13633j, hVar.f13634k);
                            hVar.b(subMenuAddSubMenu.getItem());
                            xmlPullParser2 = xmlPullParser;
                            b(xmlPullParser2, attributeSet, subMenuAddSubMenu);
                        } else {
                            xmlPullParser2 = xmlPullParser;
                            str = name3;
                            z12 = true;
                        }
                        eventType = xmlPullParser2.next();
                        i5 = 2;
                        z11 = z11;
                        z12 = z12;
                    }
                }
                xmlPullParser2 = xmlPullParser;
                z11 = z11;
            }
            eventType = xmlPullParser2.next();
            i5 = 2;
            z11 = z11;
            z12 = z12;
        }
    }

    @Override // android.view.MenuInflater
    public final void inflate(int i5, Menu menu) {
        if (!(menu instanceof q.k)) {
            super.inflate(i5, menu);
            return;
        }
        XmlResourceParser layout = null;
        boolean z11 = false;
        try {
            try {
                layout = this.f13652c.getResources().getLayout(i5);
                AttributeSet attributeSetAsAttributeSet = Xml.asAttributeSet(layout);
                if (menu instanceof q.k) {
                    q.k kVar = (q.k) menu;
                    if (!kVar.f83245p) {
                        kVar.w();
                        z11 = true;
                    }
                }
                b(layout, attributeSetAsAttributeSet, menu);
                if (z11) {
                    ((q.k) menu).v();
                }
                layout.close();
            } catch (IOException e3) {
                throw new InflateException("Error inflating menu XML", e3);
            } catch (XmlPullParserException e11) {
                throw new InflateException("Error inflating menu XML", e11);
            }
        } catch (Throwable th2) {
            if (z11) {
                ((q.k) menu).v();
            }
            if (layout != null) {
                layout.close();
            }
            throw th2;
        }
    }
}
