package o9;

import android.util.FloatProperty;
import android.util.Property;
import android.view.View;

/* loaded from: classes.dex */
public abstract class p1 {

    /* renamed from: a, reason: collision with root package name */
    public static final ca.c f80062a;

    /* renamed from: b, reason: collision with root package name */
    public static final lz.e f80063b;

    /* renamed from: c, reason: collision with root package name */
    public static final lz.e f80064c;

    /* renamed from: d, reason: collision with root package name */
    public static final FloatProperty f80065d;

    /* renamed from: e, reason: collision with root package name */
    public static final FloatProperty f80066e;

    /* renamed from: f, reason: collision with root package name */
    public static final FloatProperty f80067f;

    /* renamed from: g, reason: collision with root package name */
    public static final lz.e f80068g;

    static {
        new lz.e("drawableAlpha", 1);
        f80062a = new ca.c("scale", 4);
        f80063b = new lz.e("width", 2);
        f80064c = new lz.e("height", 3);
        Property property = View.TRANSLATION_X;
        f80065d = property instanceof FloatProperty ? (FloatProperty) property : new eb.b(4);
        Property property2 = View.TRANSLATION_Y;
        f80066e = property2 instanceof FloatProperty ? (FloatProperty) property2 : new eb.b(5);
        Property property3 = View.ALPHA;
        f80067f = property3 instanceof FloatProperty ? (FloatProperty) property3 : new eb.b(6);
        f80068g = new lz.e("backgroundColor", 4);
    }
}
