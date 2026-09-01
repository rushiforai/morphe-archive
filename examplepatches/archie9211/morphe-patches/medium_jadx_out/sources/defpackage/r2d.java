package defpackage;

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
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r2d extends MenuInflater {
    public static final Class[] e;
    public static final Class[] f;
    public final Object[] a;
    public final Object[] b;
    public final Context c;
    public Object d;

    static {
        Class[] clsArr = {Context.class};
        e = clsArr;
        f = clsArr;
    }

    public r2d(Context context) {
        super(context);
        this.c = context;
        Object[] objArr = {context};
        this.a = objArr;
        this.b = objArr;
    }

    public static Object a(Object obj) {
        return (!(obj instanceof Activity) && (obj instanceof ContextWrapper)) ? a(((ContextWrapper) obj).getBaseContext()) : obj;
    }

    public final void b(XmlPullParser xmlPullParser, AttributeSet attributeSet, Menu menu) throws XmlPullParserException, IOException {
        int i;
        XmlPullParser xmlPullParser2;
        ColorStateList colorStateList;
        int resourceId;
        q2d q2dVar = new q2d(this, menu);
        int eventType = xmlPullParser.getEventType();
        while (true) {
            i = 2;
            if (eventType == 2) {
                String name = xmlPullParser.getName();
                if (!name.equals("menu")) {
                    ygf.i("Expecting menu, got ".concat(name));
                    return;
                }
                eventType = xmlPullParser.next();
            } else {
                eventType = xmlPullParser.next();
                if (eventType == 1) {
                    break;
                }
            }
        }
        boolean z = false;
        boolean z2 = false;
        String str = null;
        while (!z) {
            if (eventType == 1) {
                ygf.i("Unexpected end of document");
                return;
            }
            Menu menu2 = q2dVar.a;
            if (eventType != i) {
                if (eventType != 3) {
                    xmlPullParser2 = xmlPullParser;
                    z = z;
                } else {
                    String name2 = xmlPullParser.getName();
                    if (z2 && name2.equals(str)) {
                        xmlPullParser2 = xmlPullParser;
                        z2 = false;
                        str = null;
                    } else {
                        if (name2.equals("group")) {
                            q2dVar.b = 0;
                            q2dVar.c = 0;
                            q2dVar.d = 0;
                            q2dVar.e = 0;
                            q2dVar.f = true;
                            q2dVar.g = true;
                        } else if (name2.equals("item")) {
                            if (!q2dVar.h) {
                                tx7 tx7Var = q2dVar.z;
                                if (tx7Var == null || !tx7Var.b.hasSubMenu()) {
                                    q2dVar.h = true;
                                    q2dVar.b(menu2.add(q2dVar.b, q2dVar.i, q2dVar.j, q2dVar.k));
                                } else {
                                    q2dVar.h = true;
                                    q2dVar.b(menu2.addSubMenu(q2dVar.b, q2dVar.i, q2dVar.j, q2dVar.k).getItem());
                                }
                            }
                        } else if (name2.equals("menu")) {
                            xmlPullParser2 = xmlPullParser;
                            z = true;
                        }
                        xmlPullParser2 = xmlPullParser;
                        z = z;
                    }
                }
                eventType = xmlPullParser2.next();
                i = 2;
                z = z;
                z2 = z2;
            } else {
                if (!z2) {
                    String name3 = xmlPullParser.getName();
                    boolean zEquals = name3.equals("group");
                    Context context = this.c;
                    if (zEquals) {
                        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, esa.p);
                        q2dVar.b = typedArrayObtainStyledAttributes.getResourceId(1, 0);
                        q2dVar.c = typedArrayObtainStyledAttributes.getInt(3, 0);
                        q2dVar.d = typedArrayObtainStyledAttributes.getInt(4, 0);
                        q2dVar.e = typedArrayObtainStyledAttributes.getInt(5, 0);
                        q2dVar.f = typedArrayObtainStyledAttributes.getBoolean(2, true);
                        q2dVar.g = typedArrayObtainStyledAttributes.getBoolean(0, true);
                        typedArrayObtainStyledAttributes.recycle();
                    } else {
                        if (name3.equals("item")) {
                            TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, esa.q);
                            q2dVar.i = typedArrayObtainStyledAttributes2.getResourceId(2, 0);
                            q2dVar.j = (typedArrayObtainStyledAttributes2.getInt(5, q2dVar.c) & (-65536)) | (typedArrayObtainStyledAttributes2.getInt(6, q2dVar.d) & 65535);
                            q2dVar.k = typedArrayObtainStyledAttributes2.getText(7);
                            q2dVar.l = typedArrayObtainStyledAttributes2.getText(8);
                            q2dVar.m = typedArrayObtainStyledAttributes2.getResourceId(0, 0);
                            String string = typedArrayObtainStyledAttributes2.getString(9);
                            q2dVar.n = string == null ? (char) 0 : string.charAt(0);
                            q2dVar.o = typedArrayObtainStyledAttributes2.getInt(16, 4096);
                            String string2 = typedArrayObtainStyledAttributes2.getString(10);
                            q2dVar.p = string2 == null ? (char) 0 : string2.charAt(0);
                            q2dVar.q = typedArrayObtainStyledAttributes2.getInt(20, 4096);
                            if (typedArrayObtainStyledAttributes2.hasValue(11)) {
                                q2dVar.r = typedArrayObtainStyledAttributes2.getBoolean(11, false) ? 1 : 0;
                            } else {
                                q2dVar.r = q2dVar.e;
                            }
                            q2dVar.s = typedArrayObtainStyledAttributes2.getBoolean(3, false);
                            q2dVar.t = typedArrayObtainStyledAttributes2.getBoolean(4, q2dVar.f);
                            q2dVar.u = typedArrayObtainStyledAttributes2.getBoolean(1, q2dVar.g);
                            q2dVar.v = typedArrayObtainStyledAttributes2.getInt(21, -1);
                            q2dVar.y = typedArrayObtainStyledAttributes2.getString(12);
                            q2dVar.w = typedArrayObtainStyledAttributes2.getResourceId(13, 0);
                            q2dVar.x = typedArrayObtainStyledAttributes2.getString(15);
                            String string3 = typedArrayObtainStyledAttributes2.getString(14);
                            boolean z3 = string3 != null;
                            if (z3 && q2dVar.w == 0 && q2dVar.x == null) {
                                q2dVar.z = (tx7) q2dVar.a(string3, f, this.b);
                            } else {
                                if (z3) {
                                    Log.w("SupportMenuInflater", "Ignoring attribute 'actionProviderClass'. Action view already specified.");
                                }
                                q2dVar.z = null;
                            }
                            q2dVar.A = typedArrayObtainStyledAttributes2.getText(17);
                            q2dVar.B = typedArrayObtainStyledAttributes2.getText(22);
                            if (typedArrayObtainStyledAttributes2.hasValue(19)) {
                                q2dVar.D = lm3.b(typedArrayObtainStyledAttributes2.getInt(19, -1), q2dVar.D);
                            } else {
                                q2dVar.D = null;
                            }
                            if (typedArrayObtainStyledAttributes2.hasValue(18)) {
                                if (!typedArrayObtainStyledAttributes2.hasValue(18) || (resourceId = typedArrayObtainStyledAttributes2.getResourceId(18, 0)) == 0 || (colorStateList = nm.l(context, resourceId)) == null) {
                                    colorStateList = typedArrayObtainStyledAttributes2.getColorStateList(18);
                                }
                                q2dVar.C = colorStateList;
                            } else {
                                q2dVar.C = null;
                            }
                            typedArrayObtainStyledAttributes2.recycle();
                            q2dVar.h = false;
                            xmlPullParser2 = xmlPullParser;
                        } else if (name3.equals("menu")) {
                            q2dVar.h = true;
                            SubMenu subMenuAddSubMenu = menu2.addSubMenu(q2dVar.b, q2dVar.i, q2dVar.j, q2dVar.k);
                            q2dVar.b(subMenuAddSubMenu.getItem());
                            xmlPullParser2 = xmlPullParser;
                            b(xmlPullParser2, attributeSet, subMenuAddSubMenu);
                        } else {
                            xmlPullParser2 = xmlPullParser;
                            str = name3;
                            z2 = true;
                        }
                        eventType = xmlPullParser2.next();
                        i = 2;
                        z = z;
                        z2 = z2;
                    }
                }
                xmlPullParser2 = xmlPullParser;
                z = z;
            }
            eventType = xmlPullParser2.next();
            i = 2;
            z = z;
            z2 = z2;
        }
    }

    @Override // android.view.MenuInflater
    public final void inflate(int i, Menu menu) {
        if (!(menu instanceof lx7)) {
            super.inflate(i, menu);
            return;
        }
        XmlResourceParser layout = null;
        boolean z = false;
        try {
            try {
                layout = this.c.getResources().getLayout(i);
                AttributeSet attributeSetAsAttributeSet = Xml.asAttributeSet(layout);
                if (menu instanceof lx7) {
                    lx7 lx7Var = (lx7) menu;
                    if (!lx7Var.p) {
                        lx7Var.w();
                        z = true;
                    }
                }
                b(layout, attributeSetAsAttributeSet, menu);
                if (z) {
                    ((lx7) menu).v();
                }
                layout.close();
            } catch (IOException e2) {
                throw new InflateException("Error inflating menu XML", e2);
            } catch (XmlPullParserException e3) {
                throw new InflateException("Error inflating menu XML", e3);
            }
        } catch (Throwable th) {
            if (z) {
                ((lx7) menu).v();
            }
            if (layout != null) {
                layout.close();
            }
            throw th;
        }
    }
}
