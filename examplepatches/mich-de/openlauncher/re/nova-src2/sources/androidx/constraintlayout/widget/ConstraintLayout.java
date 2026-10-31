package androidx.constraintlayout.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.node.LayoutNode;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.android.gms.internal.consent_sdk.a;
import fa.u;
import fl.l;
import g4.d;
import g4.e;
import g4.g;
import g4.h;
import g4.j;
import h4.i;
import h4.k;
import h4.o;
import j4.c;
import j4.f;
import j4.m;
import j4.n;
import j4.p;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes2.dex */
public class ConstraintLayout extends ViewGroup {
    public static final /* synthetic */ int o = 0;

    /* renamed from: a, reason: collision with root package name */
    public final SparseArray f14181a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f14182b;

    /* renamed from: c, reason: collision with root package name */
    public final e f14183c;

    /* renamed from: d, reason: collision with root package name */
    public int f14184d;

    /* renamed from: e, reason: collision with root package name */
    public int f14185e;

    /* renamed from: f, reason: collision with root package name */
    public int f14186f;

    /* renamed from: g, reason: collision with root package name */
    public int f14187g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f14188h;

    /* renamed from: i, reason: collision with root package name */
    public int f14189i;

    /* renamed from: j, reason: collision with root package name */
    public m f14190j;

    /* renamed from: k, reason: collision with root package name */
    public int f14191k;

    /* renamed from: l, reason: collision with root package name */
    public HashMap f14192l;

    /* renamed from: m, reason: collision with root package name */
    public final SparseArray f14193m;
    public final u n;

    public ConstraintLayout(Context context, AttributeSet attributeSet) throws XmlPullParserException, IOException, NumberFormatException {
        super(context, attributeSet);
        this.f14181a = new SparseArray();
        this.f14182b = new ArrayList(4);
        this.f14183c = new e();
        this.f14184d = 0;
        this.f14185e = 0;
        this.f14186f = LayoutNode.NotPlacedPlaceOrder;
        this.f14187g = LayoutNode.NotPlacedPlaceOrder;
        this.f14188h = true;
        this.f14189i = 257;
        this.f14190j = null;
        this.f14191k = -1;
        this.f14192l = new HashMap();
        this.f14193m = new SparseArray();
        this.n = new u(this, this);
        j(attributeSet, 0);
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof j4.e;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) throws NumberFormatException {
        Object tag;
        int size;
        ArrayList arrayList = this.f14182b;
        if (arrayList != null && (size = arrayList.size()) > 0) {
            for (int i5 = 0; i5 < size; i5++) {
                ((c) arrayList.get(i5)).getClass();
            }
        }
        super.dispatchDraw(canvas);
        if (isInEditMode()) {
            float width = getWidth();
            float height = getHeight();
            int childCount = getChildCount();
            for (int i11 = 0; i11 < childCount; i11++) {
                View childAt = getChildAt(i11);
                if (childAt.getVisibility() != 8 && (tag = childAt.getTag()) != null && (tag instanceof String)) {
                    String[] strArrSplit = ((String) tag).split(",");
                    if (strArrSplit.length == 4) {
                        int i12 = Integer.parseInt(strArrSplit[0]);
                        int i13 = Integer.parseInt(strArrSplit[1]);
                        int i14 = Integer.parseInt(strArrSplit[2]);
                        int i15 = (int) ((i12 / 1080.0f) * width);
                        int i16 = (int) ((i13 / 1920.0f) * height);
                        Paint paint = new Paint();
                        paint.setColor(-65536);
                        float f11 = i15;
                        float f12 = i16;
                        float f13 = i15 + ((int) ((i14 / 1080.0f) * width));
                        canvas.drawLine(f11, f12, f13, f12, paint);
                        float f14 = i16 + ((int) ((Integer.parseInt(strArrSplit[3]) / 1920.0f) * height));
                        canvas.drawLine(f13, f12, f13, f14, paint);
                        canvas.drawLine(f13, f14, f11, f14, paint);
                        canvas.drawLine(f11, f14, f11, f12, paint);
                        paint.setColor(-16711936);
                        canvas.drawLine(f11, f12, f13, f14, paint);
                        canvas.drawLine(f11, f14, f13, f12, paint);
                    }
                }
            }
        }
    }

    @Override // android.view.View
    public final void forceLayout() {
        this.f14188h = true;
        super.forceLayout();
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new j4.e(-2, -2);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) throws NumberFormatException {
        Context context = getContext();
        j4.e eVar = new j4.e(context, attributeSet);
        eVar.f68913a = -1;
        eVar.f68915b = -1;
        eVar.f68917c = -1.0f;
        eVar.f68919d = true;
        eVar.f68921e = -1;
        eVar.f68923f = -1;
        eVar.f68925g = -1;
        eVar.f68927h = -1;
        eVar.f68929i = -1;
        eVar.f68931j = -1;
        eVar.f68933k = -1;
        eVar.f68935l = -1;
        eVar.f68937m = -1;
        eVar.n = -1;
        eVar.o = -1;
        eVar.f68941p = -1;
        eVar.f68943q = 0;
        eVar.f68944r = 0.0f;
        eVar.f68945s = -1;
        eVar.f68946t = -1;
        eVar.f68947u = -1;
        eVar.f68948v = -1;
        eVar.f68949w = Integer.MIN_VALUE;
        eVar.f68950x = Integer.MIN_VALUE;
        eVar.f68951y = Integer.MIN_VALUE;
        eVar.f68952z = Integer.MIN_VALUE;
        eVar.A = Integer.MIN_VALUE;
        eVar.B = Integer.MIN_VALUE;
        eVar.C = Integer.MIN_VALUE;
        eVar.D = 0;
        eVar.E = 0.5f;
        eVar.F = 0.5f;
        eVar.G = null;
        eVar.H = -1.0f;
        eVar.I = -1.0f;
        eVar.J = 0;
        eVar.K = 0;
        eVar.L = 0;
        eVar.M = 0;
        eVar.N = 0;
        eVar.O = 0;
        eVar.P = 0;
        eVar.Q = 0;
        eVar.R = 1.0f;
        eVar.S = 1.0f;
        eVar.T = -1;
        eVar.U = -1;
        eVar.V = -1;
        eVar.W = false;
        eVar.X = false;
        eVar.Y = null;
        eVar.Z = 0;
        eVar.f68914a0 = true;
        eVar.f68916b0 = true;
        eVar.f68918c0 = false;
        eVar.f68920d0 = false;
        eVar.f68922e0 = false;
        eVar.f68924f0 = -1;
        eVar.f68926g0 = -1;
        eVar.f68928h0 = -1;
        eVar.f68930i0 = -1;
        eVar.f68932j0 = Integer.MIN_VALUE;
        eVar.f68934k0 = Integer.MIN_VALUE;
        eVar.f68936l0 = 0.5f;
        eVar.f68942p0 = new d();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, p.f69050b);
        int indexCount = typedArrayObtainStyledAttributes.getIndexCount();
        for (int i5 = 0; i5 < indexCount; i5++) {
            int index = typedArrayObtainStyledAttributes.getIndex(i5);
            int i11 = j4.d.f68912a.get(index);
            switch (i11) {
                case 1:
                    eVar.V = typedArrayObtainStyledAttributes.getInt(index, eVar.V);
                    break;
                case 2:
                    int resourceId = typedArrayObtainStyledAttributes.getResourceId(index, eVar.f68941p);
                    eVar.f68941p = resourceId;
                    if (resourceId == -1) {
                        eVar.f68941p = typedArrayObtainStyledAttributes.getInt(index, -1);
                        break;
                    } else {
                        break;
                    }
                case 3:
                    eVar.f68943q = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, eVar.f68943q);
                    break;
                case 4:
                    float f11 = typedArrayObtainStyledAttributes.getFloat(index, eVar.f68944r) % 360.0f;
                    eVar.f68944r = f11;
                    if (f11 < 0.0f) {
                        eVar.f68944r = (360.0f - f11) % 360.0f;
                        break;
                    } else {
                        break;
                    }
                case 5:
                    eVar.f68913a = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, eVar.f68913a);
                    break;
                case 6:
                    eVar.f68915b = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, eVar.f68915b);
                    break;
                case 7:
                    eVar.f68917c = typedArrayObtainStyledAttributes.getFloat(index, eVar.f68917c);
                    break;
                case 8:
                    int resourceId2 = typedArrayObtainStyledAttributes.getResourceId(index, eVar.f68921e);
                    eVar.f68921e = resourceId2;
                    if (resourceId2 == -1) {
                        eVar.f68921e = typedArrayObtainStyledAttributes.getInt(index, -1);
                        break;
                    } else {
                        break;
                    }
                case 9:
                    int resourceId3 = typedArrayObtainStyledAttributes.getResourceId(index, eVar.f68923f);
                    eVar.f68923f = resourceId3;
                    if (resourceId3 == -1) {
                        eVar.f68923f = typedArrayObtainStyledAttributes.getInt(index, -1);
                        break;
                    } else {
                        break;
                    }
                case 10:
                    int resourceId4 = typedArrayObtainStyledAttributes.getResourceId(index, eVar.f68925g);
                    eVar.f68925g = resourceId4;
                    if (resourceId4 == -1) {
                        eVar.f68925g = typedArrayObtainStyledAttributes.getInt(index, -1);
                        break;
                    } else {
                        break;
                    }
                case 11:
                    int resourceId5 = typedArrayObtainStyledAttributes.getResourceId(index, eVar.f68927h);
                    eVar.f68927h = resourceId5;
                    if (resourceId5 == -1) {
                        eVar.f68927h = typedArrayObtainStyledAttributes.getInt(index, -1);
                        break;
                    } else {
                        break;
                    }
                case 12:
                    int resourceId6 = typedArrayObtainStyledAttributes.getResourceId(index, eVar.f68929i);
                    eVar.f68929i = resourceId6;
                    if (resourceId6 == -1) {
                        eVar.f68929i = typedArrayObtainStyledAttributes.getInt(index, -1);
                        break;
                    } else {
                        break;
                    }
                case 13:
                    int resourceId7 = typedArrayObtainStyledAttributes.getResourceId(index, eVar.f68931j);
                    eVar.f68931j = resourceId7;
                    if (resourceId7 == -1) {
                        eVar.f68931j = typedArrayObtainStyledAttributes.getInt(index, -1);
                        break;
                    } else {
                        break;
                    }
                case 14:
                    int resourceId8 = typedArrayObtainStyledAttributes.getResourceId(index, eVar.f68933k);
                    eVar.f68933k = resourceId8;
                    if (resourceId8 == -1) {
                        eVar.f68933k = typedArrayObtainStyledAttributes.getInt(index, -1);
                        break;
                    } else {
                        break;
                    }
                case 15:
                    int resourceId9 = typedArrayObtainStyledAttributes.getResourceId(index, eVar.f68935l);
                    eVar.f68935l = resourceId9;
                    if (resourceId9 == -1) {
                        eVar.f68935l = typedArrayObtainStyledAttributes.getInt(index, -1);
                        break;
                    } else {
                        break;
                    }
                case 16:
                    int resourceId10 = typedArrayObtainStyledAttributes.getResourceId(index, eVar.f68937m);
                    eVar.f68937m = resourceId10;
                    if (resourceId10 == -1) {
                        eVar.f68937m = typedArrayObtainStyledAttributes.getInt(index, -1);
                        break;
                    } else {
                        break;
                    }
                case 17:
                    int resourceId11 = typedArrayObtainStyledAttributes.getResourceId(index, eVar.f68945s);
                    eVar.f68945s = resourceId11;
                    if (resourceId11 == -1) {
                        eVar.f68945s = typedArrayObtainStyledAttributes.getInt(index, -1);
                        break;
                    } else {
                        break;
                    }
                case 18:
                    int resourceId12 = typedArrayObtainStyledAttributes.getResourceId(index, eVar.f68946t);
                    eVar.f68946t = resourceId12;
                    if (resourceId12 == -1) {
                        eVar.f68946t = typedArrayObtainStyledAttributes.getInt(index, -1);
                        break;
                    } else {
                        break;
                    }
                case 19:
                    int resourceId13 = typedArrayObtainStyledAttributes.getResourceId(index, eVar.f68947u);
                    eVar.f68947u = resourceId13;
                    if (resourceId13 == -1) {
                        eVar.f68947u = typedArrayObtainStyledAttributes.getInt(index, -1);
                        break;
                    } else {
                        break;
                    }
                case 20:
                    int resourceId14 = typedArrayObtainStyledAttributes.getResourceId(index, eVar.f68948v);
                    eVar.f68948v = resourceId14;
                    if (resourceId14 == -1) {
                        eVar.f68948v = typedArrayObtainStyledAttributes.getInt(index, -1);
                        break;
                    } else {
                        break;
                    }
                case 21:
                    eVar.f68949w = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, eVar.f68949w);
                    break;
                case 22:
                    eVar.f68950x = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, eVar.f68950x);
                    break;
                case 23:
                    eVar.f68951y = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, eVar.f68951y);
                    break;
                case 24:
                    eVar.f68952z = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, eVar.f68952z);
                    break;
                case 25:
                    eVar.A = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, eVar.A);
                    break;
                case 26:
                    eVar.B = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, eVar.B);
                    break;
                case 27:
                    eVar.W = typedArrayObtainStyledAttributes.getBoolean(index, eVar.W);
                    break;
                case 28:
                    eVar.X = typedArrayObtainStyledAttributes.getBoolean(index, eVar.X);
                    break;
                case 29:
                    eVar.E = typedArrayObtainStyledAttributes.getFloat(index, eVar.E);
                    break;
                case 30:
                    eVar.F = typedArrayObtainStyledAttributes.getFloat(index, eVar.F);
                    break;
                case 31:
                    int i12 = typedArrayObtainStyledAttributes.getInt(index, 0);
                    eVar.L = i12;
                    if (i12 == 1) {
                        Log.e("ConstraintLayout", "layout_constraintWidth_default=\"wrap\" is deprecated.\nUse layout_width=\"WRAP_CONTENT\" and layout_constrainedWidth=\"true\" instead.");
                        break;
                    } else {
                        break;
                    }
                case 32:
                    int i13 = typedArrayObtainStyledAttributes.getInt(index, 0);
                    eVar.M = i13;
                    if (i13 == 1) {
                        Log.e("ConstraintLayout", "layout_constraintHeight_default=\"wrap\" is deprecated.\nUse layout_height=\"WRAP_CONTENT\" and layout_constrainedHeight=\"true\" instead.");
                        break;
                    } else {
                        break;
                    }
                case 33:
                    try {
                        eVar.N = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, eVar.N);
                        break;
                    } catch (Exception unused) {
                        if (typedArrayObtainStyledAttributes.getInt(index, eVar.N) == -2) {
                            eVar.N = -2;
                            break;
                        } else {
                            break;
                        }
                    }
                case 34:
                    try {
                        eVar.P = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, eVar.P);
                        break;
                    } catch (Exception unused2) {
                        if (typedArrayObtainStyledAttributes.getInt(index, eVar.P) == -2) {
                            eVar.P = -2;
                            break;
                        } else {
                            break;
                        }
                    }
                case 35:
                    eVar.R = Math.max(0.0f, typedArrayObtainStyledAttributes.getFloat(index, eVar.R));
                    eVar.L = 2;
                    break;
                case 36:
                    try {
                        eVar.O = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, eVar.O);
                        break;
                    } catch (Exception unused3) {
                        if (typedArrayObtainStyledAttributes.getInt(index, eVar.O) == -2) {
                            eVar.O = -2;
                            break;
                        } else {
                            break;
                        }
                    }
                case 37:
                    try {
                        eVar.Q = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, eVar.Q);
                        break;
                    } catch (Exception unused4) {
                        if (typedArrayObtainStyledAttributes.getInt(index, eVar.Q) == -2) {
                            eVar.Q = -2;
                            break;
                        } else {
                            break;
                        }
                    }
                case 38:
                    eVar.S = Math.max(0.0f, typedArrayObtainStyledAttributes.getFloat(index, eVar.S));
                    eVar.M = 2;
                    break;
                default:
                    switch (i11) {
                        case 44:
                            m.h(eVar, typedArrayObtainStyledAttributes.getString(index));
                            break;
                        case 45:
                            eVar.H = typedArrayObtainStyledAttributes.getFloat(index, eVar.H);
                            break;
                        case 46:
                            eVar.I = typedArrayObtainStyledAttributes.getFloat(index, eVar.I);
                            break;
                        case 47:
                            eVar.J = typedArrayObtainStyledAttributes.getInt(index, 0);
                            break;
                        case 48:
                            eVar.K = typedArrayObtainStyledAttributes.getInt(index, 0);
                            break;
                        case 49:
                            eVar.T = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, eVar.T);
                            break;
                        case 50:
                            eVar.U = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, eVar.U);
                            break;
                        case 51:
                            eVar.Y = typedArrayObtainStyledAttributes.getString(index);
                            break;
                        case 52:
                            int resourceId15 = typedArrayObtainStyledAttributes.getResourceId(index, eVar.n);
                            eVar.n = resourceId15;
                            if (resourceId15 == -1) {
                                eVar.n = typedArrayObtainStyledAttributes.getInt(index, -1);
                                break;
                            } else {
                                break;
                            }
                        case 53:
                            int resourceId16 = typedArrayObtainStyledAttributes.getResourceId(index, eVar.o);
                            eVar.o = resourceId16;
                            if (resourceId16 == -1) {
                                eVar.o = typedArrayObtainStyledAttributes.getInt(index, -1);
                                break;
                            } else {
                                break;
                            }
                        case 54:
                            eVar.D = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, eVar.D);
                            break;
                        case 55:
                            eVar.C = typedArrayObtainStyledAttributes.getDimensionPixelSize(index, eVar.C);
                            break;
                        default:
                            switch (i11) {
                                case 64:
                                    m.g(eVar, typedArrayObtainStyledAttributes, index, 0);
                                    break;
                                case 65:
                                    m.g(eVar, typedArrayObtainStyledAttributes, index, 1);
                                    break;
                                case 66:
                                    eVar.Z = typedArrayObtainStyledAttributes.getInt(index, eVar.Z);
                                    break;
                                case 67:
                                    eVar.f68919d = typedArrayObtainStyledAttributes.getBoolean(index, eVar.f68919d);
                                    break;
                            }
                    }
            }
        }
        typedArrayObtainStyledAttributes.recycle();
        eVar.a();
        return eVar;
    }

    public final d i(View view) {
        if (view == this) {
            return this.f14183c;
        }
        if (view == null) {
            return null;
        }
        if (view.getLayoutParams() instanceof j4.e) {
            return ((j4.e) view.getLayoutParams()).f68942p0;
        }
        view.setLayoutParams(generateLayoutParams(view.getLayoutParams()));
        if (view.getLayoutParams() instanceof j4.e) {
            return ((j4.e) view.getLayoutParams()).f68942p0;
        }
        return null;
    }

    public final void j(AttributeSet attributeSet, int i5) throws XmlPullParserException, IOException, NumberFormatException {
        e eVar = this.f14183c;
        eVar.f57091e0 = this;
        u uVar = this.n;
        eVar.f57125t0 = uVar;
        eVar.f57123r0.f59105h = uVar;
        this.f14181a.put(getId(), this);
        this.f14190j = null;
        if (attributeSet != null) {
            TypedArray typedArrayObtainStyledAttributes = getContext().obtainStyledAttributes(attributeSet, p.f69050b, i5, 0);
            int indexCount = typedArrayObtainStyledAttributes.getIndexCount();
            for (int i11 = 0; i11 < indexCount; i11++) {
                int index = typedArrayObtainStyledAttributes.getIndex(i11);
                if (index == 16) {
                    this.f14184d = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, this.f14184d);
                } else if (index == 17) {
                    this.f14185e = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, this.f14185e);
                } else if (index == 14) {
                    this.f14186f = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, this.f14186f);
                } else if (index == 15) {
                    this.f14187g = typedArrayObtainStyledAttributes.getDimensionPixelOffset(index, this.f14187g);
                } else if (index == 113) {
                    this.f14189i = typedArrayObtainStyledAttributes.getInt(index, this.f14189i);
                } else if (index == 56) {
                    int resourceId = typedArrayObtainStyledAttributes.getResourceId(index, 0);
                    if (resourceId != 0) {
                        try {
                            k(resourceId);
                        } catch (Resources.NotFoundException unused) {
                        }
                    }
                } else if (index == 34) {
                    int resourceId2 = typedArrayObtainStyledAttributes.getResourceId(index, 0);
                    try {
                        m mVar = new m();
                        this.f14190j = mVar;
                        mVar.e(getContext(), resourceId2);
                    } catch (Resources.NotFoundException unused2) {
                        this.f14190j = null;
                    }
                    this.f14191k = resourceId2;
                }
            }
            typedArrayObtainStyledAttributes.recycle();
        }
        eVar.C0 = this.f14189i;
        e4.c.f52134q = eVar.R(EventBridgeChannel.QUEUE_CAPACITY);
    }

    public final void k(int i5) throws XmlPullParserException, Resources.NotFoundException, IOException, NumberFormatException {
        String str;
        Context context = getContext();
        io.sentry.internal.debugmeta.c cVar = new io.sentry.internal.debugmeta.c();
        cVar.f67327a = new SparseArray();
        cVar.f67328b = new SparseArray();
        XmlResourceParser xml = context.getResources().getXml(i5);
        try {
            a aVar = null;
            for (int eventType = xml.getEventType(); eventType != 1; eventType = xml.next()) {
                if (eventType == 2) {
                    String name = xml.getName();
                    switch (name.hashCode()) {
                        case -1349929691:
                            if (name.equals("ConstraintSet")) {
                                cVar.y(context, xml);
                                break;
                            } else {
                                break;
                            }
                        case 80204913:
                            if (name.equals("State")) {
                                a aVar2 = new a(context, xml);
                                ((SparseArray) cVar.f67327a).put(aVar2.f31984b, aVar2);
                                aVar = aVar2;
                                break;
                            } else {
                                break;
                            }
                        case 1382829617:
                            str = "StateSet";
                            name.equals(str);
                            break;
                        case 1657696882:
                            str = "layoutDescription";
                            name.equals(str);
                            break;
                        case 1901439077:
                            if (name.equals("Variant")) {
                                f fVar = new f(context, xml);
                                if (aVar != null) {
                                    ((ArrayList) aVar.f31986d).add(fVar);
                                    break;
                                } else {
                                    break;
                                }
                            } else {
                                break;
                            }
                    }
                }
            }
        } catch (IOException e3) {
            Log.e("ConstraintLayoutStates", "Error parsing resource: " + i5, e3);
        } catch (XmlPullParserException e11) {
            Log.e("ConstraintLayoutStates", "Error parsing resource: " + i5, e11);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:165:0x032f  */
    /* JADX WARN: Removed duplicated region for block: B:169:0x0350  */
    /* JADX WARN: Removed duplicated region for block: B:174:0x0372  */
    /* JADX WARN: Removed duplicated region for block: B:183:0x038f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void l(e eVar, int i5, int i11, int i12) {
        int iMin;
        int iMax;
        int iMin2;
        int iMax2;
        int i13;
        char c11;
        boolean z11;
        int i14;
        int i15;
        boolean z12;
        u uVar;
        int i16;
        boolean zO;
        int i17;
        int i18;
        u uVar2;
        int i19;
        boolean z13;
        int i21;
        u uVar3;
        int i22;
        k kVar;
        h4.m mVar;
        int i23;
        int i24;
        int i25;
        int i26;
        int i27;
        int i28;
        int i29;
        boolean z14;
        Iterator it;
        Iterator it2;
        boolean z15;
        int mode = View.MeasureSpec.getMode(i11);
        int size = View.MeasureSpec.getSize(i11);
        int mode2 = View.MeasureSpec.getMode(i12);
        int size2 = View.MeasureSpec.getSize(i12);
        int iMax3 = Math.max(0, getPaddingTop());
        int iMax4 = Math.max(0, getPaddingBottom());
        int i31 = iMax3 + iMax4;
        int iMax5 = Math.max(0, getPaddingRight()) + Math.max(0, getPaddingLeft());
        int iMax6 = Math.max(0, getPaddingEnd()) + Math.max(0, getPaddingStart());
        if (iMax6 > 0) {
            iMax5 = iMax6;
        }
        u uVar4 = this.n;
        uVar4.f54499a = iMax3;
        uVar4.f54500b = iMax4;
        uVar4.f54501c = iMax5;
        uVar4.f54502d = i31;
        uVar4.f54503e = i11;
        uVar4.f54504f = i12;
        int iMax7 = Math.max(0, getPaddingStart());
        int iMax8 = Math.max(0, getPaddingEnd());
        int i32 = 1;
        if (iMax7 <= 0 && iMax8 <= 0) {
            iMax7 = Math.max(0, getPaddingLeft());
        } else if ((getContext().getApplicationInfo().flags & 4194304) != 0 && 1 == getLayoutDirection()) {
            iMax7 = iMax8;
        }
        int i33 = size - iMax5;
        int i34 = size2 - i31;
        int i35 = uVar4.f54502d;
        int i36 = uVar4.f54501c;
        int childCount = getChildCount();
        if (mode != Integer.MIN_VALUE) {
            if (mode != 0) {
                if (mode != 1073741824) {
                    iMin = 0;
                } else {
                    iMin = Math.min(this.f14186f - i36, i33);
                    i32 = 1;
                }
            } else if (childCount == 0) {
                iMax = Math.max(0, this.f14184d);
                iMin = iMax;
                i32 = 2;
            } else {
                iMin = 0;
                i32 = 2;
            }
        } else if (childCount == 0) {
            iMax = Math.max(0, this.f14184d);
            iMin = iMax;
            i32 = 2;
        } else {
            iMin = i33;
            i32 = 2;
        }
        if (mode2 != Integer.MIN_VALUE) {
            if (mode2 != 0) {
                iMin2 = mode2 != 1073741824 ? 0 : Math.min(this.f14187g - i35, i34);
                i13 = 1;
            } else if (childCount == 0) {
                iMax2 = Math.max(0, this.f14185e);
                iMin2 = iMax2;
                i13 = 2;
            } else {
                iMin2 = 0;
                i13 = 2;
            }
        } else if (childCount == 0) {
            iMax2 = Math.max(0, this.f14185e);
            iMin2 = iMax2;
            i13 = 2;
        } else {
            iMin2 = i34;
            i13 = 2;
        }
        int iN = eVar.n();
        h4.e eVar2 = eVar.f57123r0;
        int[] iArr = eVar.B;
        int i37 = iMin;
        if (i37 == iN && iMin2 == eVar.k()) {
            c11 = 1;
        } else {
            eVar2.f59100c = true;
            c11 = 1;
        }
        eVar.X = 0;
        eVar.Y = 0;
        iArr[0] = this.f14186f - i36;
        iArr[c11] = this.f14187g - i35;
        eVar.f57083a0 = 0;
        eVar.f57085b0 = 0;
        eVar.H(i32);
        eVar.J(i37);
        eVar.I(i13);
        eVar.G(iMin2);
        int i38 = this.f14184d - i36;
        if (i38 < 0) {
            eVar.f57083a0 = 0;
        } else {
            eVar.f57083a0 = i38;
        }
        int i39 = this.f14185e - i35;
        if (i39 < 0) {
            eVar.f57085b0 = 0;
        } else {
            eVar.f57085b0 = i39;
        }
        eVar.f57128w0 = iMax7;
        eVar.f57129x0 = iMax3;
        l lVar = eVar.f57122q0;
        e eVar3 = (e) lVar.f55375c;
        ArrayList arrayList = (ArrayList) lVar.f55376d;
        u uVar5 = eVar.f57125t0;
        int size3 = eVar.f57121p0.size();
        int iN2 = eVar.n();
        int iK = eVar.k();
        boolean zC = j.c(i5, 128);
        boolean z16 = zC || j.c(i5, 64);
        if (z16) {
            int i40 = 0;
            while (i40 < size3) {
                boolean z17 = z16;
                d dVar = (d) eVar.f57121p0.get(i40);
                int i41 = i40;
                int[] iArr2 = dVar.f57109o0;
                i14 = size3;
                boolean z18 = (iArr2[0] == 3) && (iArr2[1] == 3) && dVar.V > 0.0f;
                if ((dVar.u() && z18) || ((dVar.v() && z18) || (dVar instanceof g) || dVar.u() || dVar.v())) {
                    i15 = 1073741824;
                    z11 = false;
                    break;
                } else {
                    i40 = i41 + 1;
                    z16 = z17;
                    size3 = i14;
                }
            }
            z11 = z16;
            i14 = size3;
            i15 = 1073741824;
        } else {
            z11 = z16;
            i14 = size3;
            i15 = 1073741824;
        }
        boolean z19 = z11 & ((mode == i15 && mode2 == i15) || zC);
        if (z19) {
            int iMin3 = Math.min(iArr[0], i33);
            int iMin4 = Math.min(iArr[1], i34);
            int i42 = 1073741824;
            if (mode == 1073741824) {
                if (eVar.n() != iMin3) {
                    eVar.J(iMin3);
                    eVar2.f59099b = true;
                }
                i42 = 1073741824;
            }
            if (mode2 == i42 && eVar.k() != iMin4) {
                eVar.G(iMin4);
                eVar2.f59099b = true;
            }
            if (mode == i42 && mode2 == i42) {
                ArrayList arrayList2 = (ArrayList) eVar2.f59103f;
                e eVar4 = (e) eVar2.f59101d;
                if (eVar2.f59099b || eVar2.f59100c) {
                    Iterator it3 = eVar4.f57121p0.iterator();
                    while (it3.hasNext()) {
                        d dVar2 = (d) it3.next();
                        dVar2.h();
                        dVar2.f57082a = false;
                        dVar2.f57088d.n();
                        dVar2.f57090e.m();
                        z19 = z19;
                    }
                    z12 = z19;
                    eVar4.h();
                    i25 = 0;
                    eVar4.f57082a = false;
                    eVar4.f57088d.n();
                    eVar4.f57090e.m();
                    eVar2.f59100c = false;
                } else {
                    z12 = z19;
                    i25 = 0;
                }
                eVar2.b((e) eVar2.f59102e);
                eVar4.X = i25;
                int[] iArr3 = eVar4.f57109o0;
                eVar4.Y = i25;
                int iJ = eVar4.j(i25);
                int iJ2 = eVar4.j(1);
                if (eVar2.f59099b) {
                    eVar2.c();
                }
                int iO = eVar4.o();
                int iP = eVar4.p();
                uVar = uVar5;
                eVar4.f57088d.f59139h.d(iO);
                eVar4.f57090e.f59139h.d(iP);
                eVar2.g();
                if (iJ == 2 || iJ2 == 2) {
                    if (zC) {
                        Iterator it4 = arrayList2.iterator();
                        while (true) {
                            if (it4.hasNext()) {
                                if (!((o) it4.next()).k()) {
                                    zC = false;
                                    break;
                                }
                            } else {
                                break;
                            }
                        }
                    }
                    if (zC && iJ == 2) {
                        eVar4.H(1);
                        i26 = iO;
                        eVar4.J(eVar2.d(eVar4, 0));
                        eVar4.f57088d.f59136e.d(eVar4.n());
                    } else {
                        i26 = iO;
                    }
                    if (zC && iJ2 == 2) {
                        i27 = 1;
                        eVar4.I(1);
                        eVar4.G(eVar2.d(eVar4, 1));
                        eVar4.f57090e.f59136e.d(eVar4.k());
                    }
                    i28 = iArr3[0];
                    if (i28 != i27 || i28 == 4) {
                        int iN3 = eVar4.n() + i26;
                        eVar4.f57088d.f59140i.d(iN3);
                        eVar4.f57088d.f59136e.d(iN3 - i26);
                        eVar2.g();
                        i29 = iArr3[1];
                        if (i29 != 1 || i29 == 4) {
                            int iK2 = eVar4.k() + iP;
                            eVar4.f57090e.f59140i.d(iK2);
                            eVar4.f57090e.f59136e.d(iK2 - iP);
                        }
                        eVar2.g();
                        z14 = true;
                    } else {
                        z14 = false;
                    }
                    it = arrayList2.iterator();
                    while (it.hasNext()) {
                        o oVar = (o) it.next();
                        if (oVar.f59133b != eVar4 || oVar.f59138g) {
                            oVar.e();
                        }
                    }
                    it2 = arrayList2.iterator();
                    while (it2.hasNext()) {
                        o oVar2 = (o) it2.next();
                        if (z14 || oVar2.f59133b != eVar4) {
                            if (!oVar2.f59139h.f59116j || ((!oVar2.f59140i.f59116j && !(oVar2 instanceof i)) || (!oVar2.f59136e.f59116j && !(oVar2 instanceof h4.c) && !(oVar2 instanceof i)))) {
                                z15 = false;
                                break;
                            }
                        }
                    }
                    z15 = true;
                    eVar4.H(iJ);
                    eVar4.I(iJ2);
                    zO = z15;
                    i16 = 2;
                    i24 = 1073741824;
                } else {
                    i26 = iO;
                }
                i27 = 1;
                i28 = iArr3[0];
                if (i28 != i27) {
                    int iN32 = eVar4.n() + i26;
                    eVar4.f57088d.f59140i.d(iN32);
                    eVar4.f57088d.f59136e.d(iN32 - i26);
                    eVar2.g();
                    i29 = iArr3[1];
                    if (i29 != 1) {
                        int iK22 = eVar4.k() + iP;
                        eVar4.f57090e.f59140i.d(iK22);
                        eVar4.f57090e.f59136e.d(iK22 - iP);
                        eVar2.g();
                        z14 = true;
                        it = arrayList2.iterator();
                        while (it.hasNext()) {
                        }
                        it2 = arrayList2.iterator();
                        while (it2.hasNext()) {
                        }
                        z15 = true;
                        eVar4.H(iJ);
                        eVar4.I(iJ2);
                        zO = z15;
                        i16 = 2;
                        i24 = 1073741824;
                    }
                }
            } else {
                z12 = z19;
                uVar = uVar5;
                e eVar5 = (e) eVar2.f59101d;
                if (eVar2.f59099b) {
                    Iterator it5 = eVar5.f57121p0.iterator();
                    while (it5.hasNext()) {
                        d dVar3 = (d) it5.next();
                        dVar3.h();
                        dVar3.f57082a = false;
                        k kVar2 = dVar3.f57088d;
                        kVar2.f59136e.f59116j = false;
                        kVar2.f59138g = false;
                        kVar2.n();
                        h4.m mVar2 = dVar3.f57090e;
                        mVar2.f59136e.f59116j = false;
                        mVar2.f59138g = false;
                        mVar2.m();
                    }
                    i23 = 0;
                    eVar5.h();
                    eVar5.f57082a = false;
                    k kVar3 = eVar5.f57088d;
                    kVar3.f59136e.f59116j = false;
                    kVar3.f59138g = false;
                    kVar3.n();
                    h4.m mVar3 = eVar5.f57090e;
                    mVar3.f59136e.f59116j = false;
                    mVar3.f59138g = false;
                    mVar3.m();
                    eVar2.c();
                } else {
                    i23 = 0;
                }
                eVar2.b((e) eVar2.f59102e);
                eVar5.X = i23;
                eVar5.Y = i23;
                eVar5.f57088d.f59139h.d(i23);
                eVar5.f57090e.f59139h.d(i23);
                i24 = 1073741824;
                if (mode == 1073741824) {
                    zO = eVar.O(i23, zC);
                    i16 = 1;
                } else {
                    i16 = 0;
                    zO = true;
                }
                if (mode2 == 1073741824) {
                    zO &= eVar.O(1, zC);
                    i16++;
                }
            }
            if (zO) {
                eVar.K(mode == i24, mode2 == i24);
            }
        } else {
            z12 = z19;
            uVar = uVar5;
            i16 = 0;
            zO = false;
        }
        if (zO && i16 == 2) {
            return;
        }
        int i43 = eVar.C0;
        if (i14 > 0) {
            int size4 = eVar.f57121p0.size();
            boolean zR = eVar.R(64);
            u uVar6 = eVar.f57125t0;
            int i44 = 0;
            while (i44 < size4) {
                d dVar4 = (d) eVar.f57121p0.get(i44);
                if ((dVar4 instanceof h) || (dVar4 instanceof g4.a) || dVar4.E || (zR && (kVar = dVar4.f57088d) != null && (mVar = dVar4.f57090e) != null && kVar.f59136e.f59116j && mVar.f59136e.f59116j)) {
                    i22 = size4;
                } else {
                    int iJ3 = dVar4.j(0);
                    int iJ4 = dVar4.j(1);
                    i22 = size4;
                    boolean z21 = iJ3 == 3 && dVar4.f57111q != 1 && iJ4 == 3 && dVar4.f57112r != 1;
                    if (!z21 && eVar.R(1) && !(dVar4 instanceof g)) {
                        if (iJ3 == 3 && dVar4.f57111q == 0 && iJ4 != 3 && !dVar4.u()) {
                            z21 = true;
                        }
                        if (iJ4 == 3 && dVar4.f57112r == 0 && iJ3 != 3 && !dVar4.u()) {
                            z21 = true;
                        }
                        if ((iJ3 == 3 || iJ4 == 3) && dVar4.V > 0.0f) {
                            z21 = true;
                        }
                    }
                    if (!z21) {
                        lVar.q(0, uVar6, dVar4);
                    }
                }
                i44++;
                size4 = i22;
            }
            ConstraintLayout constraintLayout = (ConstraintLayout) uVar6.f54505g;
            int childCount2 = constraintLayout.getChildCount();
            ArrayList arrayList3 = constraintLayout.f14182b;
            for (int i45 = 0; i45 < childCount2; i45++) {
                constraintLayout.getChildAt(i45);
            }
            int size5 = arrayList3.size();
            if (size5 > 0) {
                for (int i46 = 0; i46 < size5; i46++) {
                    ((c) arrayList3.get(i46)).getClass();
                }
            }
        }
        lVar.E(eVar);
        int size6 = arrayList.size();
        if (i14 > 0) {
            lVar.A(eVar, 0, iN2, iK);
        }
        if (size6 > 0) {
            int[] iArr4 = eVar.f57109o0;
            boolean z22 = iArr4[0] == 2;
            boolean z23 = iArr4[1] == 2;
            int iMax9 = Math.max(eVar.n(), eVar3.f57083a0);
            int iMax10 = Math.max(eVar.k(), eVar3.f57085b0);
            int i47 = 0;
            boolean z24 = false;
            while (i47 < size6) {
                d dVar5 = (d) arrayList.get(i47);
                if (dVar5 instanceof g) {
                    int iN4 = dVar5.n();
                    int iK3 = dVar5.k();
                    z13 = z23;
                    i21 = i47;
                    uVar3 = uVar;
                    boolean zQ = z24 | lVar.q(1, uVar3, dVar5);
                    int iN5 = dVar5.n();
                    boolean z25 = zQ;
                    int iK4 = dVar5.k();
                    if (iN5 != iN4) {
                        dVar5.J(iN5);
                        if (z22 && dVar5.o() + dVar5.T > iMax9) {
                            iMax9 = Math.max(iMax9, dVar5.i(4).e() + dVar5.o() + dVar5.T);
                        }
                        z25 = true;
                    }
                    if (iK4 != iK3) {
                        dVar5.G(iK4);
                        if (z13 && dVar5.p() + dVar5.U > iMax10) {
                            iMax10 = Math.max(iMax10, dVar5.i(5).e() + dVar5.p() + dVar5.U);
                        }
                        z25 = true;
                    }
                    z24 = z25 | ((g) dVar5).f57155x0;
                } else {
                    z13 = z23;
                    i21 = i47;
                    uVar3 = uVar;
                }
                i47 = i21 + 1;
                uVar = uVar3;
                z23 = z13;
            }
            boolean z26 = z23;
            int i48 = 0;
            while (true) {
                u uVar7 = uVar;
                if (i48 >= 2) {
                    break;
                }
                boolean zQ2 = z24;
                int i49 = 0;
                while (i49 < size6) {
                    d dVar6 = (d) arrayList.get(i49);
                    if ((!(dVar6 instanceof g4.i) || (dVar6 instanceof g)) && !(dVar6 instanceof h)) {
                        i17 = size6;
                        if (dVar6.f57093f0 != 8 && ((!z12 || !dVar6.f57088d.f59136e.f59116j || !dVar6.f57090e.f59136e.f59116j) && !(dVar6 instanceof g))) {
                            int iN6 = dVar6.n();
                            int iK5 = dVar6.k();
                            i18 = i49;
                            int i51 = dVar6.Z;
                            zQ2 |= lVar.q(i48 == 1 ? 2 : 1, uVar7, dVar6);
                            uVar2 = uVar7;
                            int iN7 = dVar6.n();
                            i19 = i48;
                            int iK6 = dVar6.k();
                            if (iN7 != iN6) {
                                dVar6.J(iN7);
                                if (z22 && dVar6.o() + dVar6.T > iMax9) {
                                    iMax9 = Math.max(iMax9, dVar6.i(4).e() + dVar6.o() + dVar6.T);
                                }
                                zQ2 = true;
                            }
                            if (iK6 != iK5) {
                                dVar6.G(iK6);
                                if (z26 && dVar6.p() + dVar6.U > iMax10) {
                                    iMax10 = Math.max(iMax10, dVar6.i(5).e() + dVar6.p() + dVar6.U);
                                }
                                zQ2 = true;
                            }
                            if (dVar6.D && i51 != dVar6.Z) {
                                zQ2 = true;
                            }
                        }
                        i49 = i18 + 1;
                        size6 = i17;
                        i48 = i19;
                        uVar7 = uVar2;
                    } else {
                        i17 = size6;
                    }
                    uVar2 = uVar7;
                    i19 = i48;
                    i18 = i49;
                    i49 = i18 + 1;
                    size6 = i17;
                    i48 = i19;
                    uVar7 = uVar2;
                }
                int i52 = size6;
                uVar = uVar7;
                int i53 = i48;
                if (!zQ2) {
                    break;
                }
                int i54 = i53 + 1;
                lVar.A(eVar, i54, iN2, iK);
                i48 = i54;
                size6 = i52;
                z24 = false;
            }
        }
        eVar.C0 = i43;
        e4.c.f52134q = eVar.R(EventBridgeChannel.QUEUE_CAPACITY);
    }

    public final void m(d dVar, j4.e eVar, SparseArray sparseArray, int i5, int i11) {
        View view = (View) this.f14181a.get(i5);
        d dVar2 = (d) sparseArray.get(i5);
        if (dVar2 == null || view == null || !(view.getLayoutParams() instanceof j4.e)) {
            return;
        }
        eVar.f68918c0 = true;
        if (i11 == 6) {
            j4.e eVar2 = (j4.e) view.getLayoutParams();
            eVar2.f68918c0 = true;
            eVar2.f68942p0.D = true;
        }
        dVar.i(6).b(dVar2.i(i11), eVar.D, eVar.C, true);
        dVar.D = true;
        dVar.i(3).j();
        dVar.i(5).j();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int childCount = getChildCount();
        boolean zIsInEditMode = isInEditMode();
        for (int i14 = 0; i14 < childCount; i14++) {
            View childAt = getChildAt(i14);
            j4.e eVar = (j4.e) childAt.getLayoutParams();
            d dVar = eVar.f68942p0;
            if (childAt.getVisibility() != 8 || eVar.f68920d0 || eVar.f68922e0 || zIsInEditMode) {
                int iO = dVar.o();
                int iP = dVar.p();
                childAt.layout(iO, iP, dVar.n() + iO, dVar.k() + iP);
            }
        }
        ArrayList arrayList = this.f14182b;
        int size = arrayList.size();
        if (size > 0) {
            for (int i15 = 0; i15 < size; i15++) {
                ((c) arrayList.get(i15)).getClass();
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:111:0x01cf  */
    /* JADX WARN: Removed duplicated region for block: B:164:0x0334  */
    /* JADX WARN: Removed duplicated region for block: B:169:0x034c  */
    /* JADX WARN: Removed duplicated region for block: B:176:0x036a  */
    /* JADX WARN: Removed duplicated region for block: B:181:0x038c  */
    /* JADX WARN: Removed duplicated region for block: B:189:0x03b7  */
    /* JADX WARN: Removed duplicated region for block: B:194:0x03d4  */
    /* JADX WARN: Removed duplicated region for block: B:201:0x03f6  */
    /* JADX WARN: Removed duplicated region for block: B:203:0x0401  */
    /* JADX WARN: Removed duplicated region for block: B:211:0x041f  */
    /* JADX WARN: Removed duplicated region for block: B:214:0x0427  */
    /* JADX WARN: Removed duplicated region for block: B:287:0x054c  */
    /* JADX WARN: Removed duplicated region for block: B:290:0x0552  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onMeasure(int i5, int i11) {
        boolean z11;
        int i12;
        boolean z12;
        d dVar;
        int i13;
        d dVar2;
        int i14;
        int i15;
        int i16;
        d dVar3;
        int i17;
        int i18;
        int i19;
        int i21;
        int i22;
        d dVar4;
        int i23;
        int i24;
        d dVar5;
        j4.e eVar;
        int i25;
        d dVar6;
        float f11;
        int i26;
        int i27;
        int i28;
        int i29;
        int i31;
        float fAbs;
        int i32;
        char c11;
        SparseArray sparseArray;
        ArrayList arrayList;
        ArrayList arrayList2;
        SparseArray sparseArray2;
        String str;
        int iF;
        int i33;
        d dVar7;
        ConstraintLayout constraintLayout = this;
        boolean z13 = constraintLayout.f14188h;
        constraintLayout.f14188h = z13;
        int i34 = 1;
        int i35 = 0;
        if (!z13) {
            int childCount = constraintLayout.getChildCount();
            int i36 = 0;
            while (true) {
                if (i36 >= childCount) {
                    break;
                }
                if (constraintLayout.getChildAt(i36).isLayoutRequested()) {
                    constraintLayout.f14188h = true;
                    break;
                }
                i36++;
            }
        }
        boolean z14 = (constraintLayout.getContext().getApplicationInfo().flags & 4194304) != 0 && 1 == constraintLayout.getLayoutDirection();
        e eVar2 = constraintLayout.f14183c;
        eVar2.f57126u0 = z14;
        if (constraintLayout.f14188h) {
            constraintLayout.f14188h = false;
            int childCount2 = constraintLayout.getChildCount();
            int i37 = 0;
            while (true) {
                if (i37 >= childCount2) {
                    z11 = false;
                    break;
                } else {
                    if (constraintLayout.getChildAt(i37).isLayoutRequested()) {
                        z11 = true;
                        break;
                    }
                    i37++;
                }
            }
            if (z11) {
                boolean zIsInEditMode = constraintLayout.isInEditMode();
                int childCount3 = constraintLayout.getChildCount();
                for (int i38 = 0; i38 < childCount3; i38++) {
                    d dVarI = constraintLayout.i(constraintLayout.getChildAt(i38));
                    if (dVarI != null) {
                        dVarI.z();
                    }
                }
                SparseArray sparseArray3 = constraintLayout.f14181a;
                if (zIsInEditMode) {
                    int i39 = 0;
                    while (i39 < childCount3) {
                        View childAt = constraintLayout.getChildAt(i39);
                        try {
                            String resourceName = constraintLayout.getResources().getResourceName(childAt.getId());
                            Integer numValueOf = Integer.valueOf(childAt.getId());
                            if (resourceName != null) {
                                i33 = i34;
                                try {
                                    if (constraintLayout.f14192l == null) {
                                        constraintLayout.f14192l = new HashMap();
                                    }
                                    int iIndexOf = resourceName.indexOf("/");
                                    constraintLayout.f14192l.put(iIndexOf != -1 ? resourceName.substring(iIndexOf + 1) : resourceName, numValueOf);
                                } catch (Resources.NotFoundException unused) {
                                }
                            } else {
                                i33 = i34;
                            }
                            int iIndexOf2 = resourceName.indexOf(47);
                            if (iIndexOf2 != -1) {
                                resourceName = resourceName.substring(iIndexOf2 + 1);
                            }
                            int id2 = childAt.getId();
                            if (id2 != 0) {
                                View viewFindViewById = (View) sparseArray3.get(id2);
                                if (viewFindViewById == null && (viewFindViewById = constraintLayout.findViewById(id2)) != null && viewFindViewById != constraintLayout && viewFindViewById.getParent() == constraintLayout) {
                                    constraintLayout.onViewAdded(viewFindViewById);
                                }
                                if (viewFindViewById == constraintLayout) {
                                    dVar7 = eVar2;
                                    dVar7.f57095g0 = resourceName;
                                } else {
                                    dVar7 = viewFindViewById == null ? null : ((j4.e) viewFindViewById.getLayoutParams()).f68942p0;
                                    dVar7.f57095g0 = resourceName;
                                }
                            } else {
                                dVar7 = eVar2;
                                dVar7.f57095g0 = resourceName;
                            }
                        } catch (Resources.NotFoundException unused2) {
                            i33 = i34;
                        }
                        i39++;
                        i34 = i33;
                    }
                }
                int i40 = i34;
                if (constraintLayout.f14191k != -1) {
                    for (int i41 = 0; i41 < childCount3; i41++) {
                        constraintLayout.getChildAt(i41).getId();
                    }
                }
                m mVar = constraintLayout.f14190j;
                if (mVar != null) {
                    mVar.a(constraintLayout);
                }
                eVar2.f57121p0.clear();
                ArrayList arrayList3 = constraintLayout.f14182b;
                int size = arrayList3.size();
                if (size > 0) {
                    int i42 = 0;
                    while (i42 < size) {
                        c cVar = (c) arrayList3.get(i42);
                        HashMap map = cVar.f68911g;
                        if (cVar.isInEditMode()) {
                            cVar.h(cVar.f68909e);
                        }
                        g4.i iVar = cVar.f68908d;
                        if (iVar == null) {
                            sparseArray = sparseArray3;
                            arrayList = arrayList3;
                        } else {
                            iVar.f57165q0 = i35;
                            Arrays.fill(iVar.f57164p0, (Object) null);
                            int i43 = i35;
                            while (i43 < cVar.f68906b) {
                                int i44 = cVar.f68905a[i43];
                                View view = (View) sparseArray3.get(i44);
                                if (view != null || (iF = cVar.f(constraintLayout, (str = (String) map.get(Integer.valueOf(i44))))) == 0) {
                                    arrayList2 = arrayList3;
                                } else {
                                    arrayList2 = arrayList3;
                                    cVar.f68905a[i43] = iF;
                                    map.put(Integer.valueOf(iF), str);
                                    view = (View) sparseArray3.get(iF);
                                }
                                View view2 = view;
                                if (view2 != null) {
                                    g4.i iVar2 = cVar.f68908d;
                                    d dVarI2 = constraintLayout.i(view2);
                                    iVar2.getClass();
                                    if (dVarI2 == iVar2 || dVarI2 == null) {
                                        sparseArray2 = sparseArray3;
                                    } else {
                                        int i45 = iVar2.f57165q0 + 1;
                                        sparseArray2 = sparseArray3;
                                        d[] dVarArr = iVar2.f57164p0;
                                        if (i45 > dVarArr.length) {
                                            iVar2.f57164p0 = (d[]) Arrays.copyOf(dVarArr, dVarArr.length * 2);
                                        }
                                        d[] dVarArr2 = iVar2.f57164p0;
                                        int i46 = iVar2.f57165q0;
                                        dVarArr2[i46] = dVarI2;
                                        iVar2.f57165q0 = i46 + 1;
                                    }
                                }
                                i43++;
                                sparseArray3 = sparseArray2;
                                arrayList3 = arrayList2;
                            }
                            sparseArray = sparseArray3;
                            arrayList = arrayList3;
                            cVar.f68908d.N();
                        }
                        i42++;
                        sparseArray3 = sparseArray;
                        arrayList3 = arrayList;
                        i35 = 0;
                    }
                }
                int i47 = 2;
                for (int i48 = 0; i48 < childCount3; i48++) {
                    constraintLayout.getChildAt(i48);
                }
                SparseArray sparseArray4 = constraintLayout.f14193m;
                sparseArray4.clear();
                sparseArray4.put(0, eVar2);
                sparseArray4.put(constraintLayout.getId(), eVar2);
                for (int i49 = 0; i49 < childCount3; i49++) {
                    View childAt2 = constraintLayout.getChildAt(i49);
                    sparseArray4.put(childAt2.getId(), constraintLayout.i(childAt2));
                }
                int i51 = 0;
                while (i51 < childCount3) {
                    View childAt3 = constraintLayout.getChildAt(i51);
                    d dVarI3 = constraintLayout.i(childAt3);
                    if (dVarI3 == null) {
                        i12 = i51;
                        z12 = z11;
                        i28 = i47;
                    } else {
                        j4.e eVar3 = (j4.e) childAt3.getLayoutParams();
                        eVar2.f57121p0.add(dVarI3);
                        d dVar8 = dVarI3.S;
                        if (dVar8 != null) {
                            ((e) dVar8).f57121p0.remove(dVarI3);
                            dVarI3.z();
                        }
                        dVarI3.S = eVar2;
                        eVar3.a();
                        dVarI3.f57093f0 = childAt3.getVisibility();
                        dVarI3.f57091e0 = childAt3;
                        if (childAt3 instanceof c) {
                            ((c) childAt3).g(dVarI3, eVar2.f57126u0);
                        }
                        if (eVar3.f68920d0) {
                            h hVar = (h) dVarI3;
                            int i52 = eVar3.f68938m0;
                            int i53 = eVar3.f68939n0;
                            float f12 = eVar3.f68940o0;
                            if (f12 != -1.0f) {
                                if (f12 > -1.0f) {
                                    hVar.f57158p0 = f12;
                                    c11 = 65535;
                                    hVar.f57159q0 = -1;
                                    hVar.f57160r0 = -1;
                                    i12 = i51;
                                    z12 = z11;
                                    i28 = i47;
                                }
                                i12 = i51;
                                z12 = z11;
                                i28 = i47;
                            } else {
                                c11 = 65535;
                                if (i52 != -1) {
                                    if (i52 > -1) {
                                        hVar.f57158p0 = -1.0f;
                                        hVar.f57159q0 = i52;
                                        hVar.f57160r0 = -1;
                                    }
                                } else if (i53 != -1 && i53 > -1) {
                                    hVar.f57158p0 = -1.0f;
                                    hVar.f57159q0 = -1;
                                    hVar.f57160r0 = i53;
                                    i12 = i51;
                                    z12 = z11;
                                    i28 = i47;
                                }
                                i12 = i51;
                                z12 = z11;
                                i28 = i47;
                            }
                        } else {
                            int i54 = eVar3.f68924f0;
                            int i55 = eVar3.f68926g0;
                            int i56 = eVar3.f68928h0;
                            int i57 = eVar3.f68930i0;
                            int i58 = eVar3.f68932j0;
                            int i59 = eVar3.f68934k0;
                            i12 = i51;
                            float f13 = eVar3.f68936l0;
                            int i61 = eVar3.f68941p;
                            z12 = z11;
                            if (i61 != -1) {
                                d dVar9 = (d) sparseArray4.get(i61);
                                if (dVar9 != null) {
                                    float f14 = eVar3.f68944r;
                                    dVarI3.s(7, 7, eVar3.f68943q, 0, dVar9);
                                    dVarI3.C = f14;
                                }
                                constraintLayout = this;
                                dVar6 = dVarI3;
                                eVar = eVar3;
                                i17 = 4;
                                i16 = 2;
                            } else {
                                if (i54 != -1) {
                                    d dVar10 = (d) sparseArray4.get(i54);
                                    if (dVar10 != null) {
                                        dVar = dVarI3;
                                        i13 = 2;
                                        dVar.s(2, 2, ((ViewGroup.MarginLayoutParams) eVar3).leftMargin, i58, dVar10);
                                    } else {
                                        dVar = dVarI3;
                                        i13 = 2;
                                    }
                                } else {
                                    dVar = dVarI3;
                                    i13 = 2;
                                    if (i55 != -1 && (dVar2 = (d) sparseArray4.get(i55)) != null) {
                                        dVar.s(2, 4, ((ViewGroup.MarginLayoutParams) eVar3).leftMargin, i58, dVar2);
                                        i14 = 2;
                                        i15 = 4;
                                    }
                                    if (i56 == -1) {
                                        d dVar11 = (d) sparseArray4.get(i56);
                                        if (dVar11 != null) {
                                            dVar.s(i15, i14, ((ViewGroup.MarginLayoutParams) eVar3).rightMargin, i59, dVar11);
                                        }
                                        i16 = i14;
                                    } else {
                                        i16 = i14;
                                        if (i57 != -1 && (dVar3 = (d) sparseArray4.get(i57)) != null) {
                                            dVar.s(i15, i15, ((ViewGroup.MarginLayoutParams) eVar3).rightMargin, i59, dVar3);
                                        }
                                    }
                                    i17 = i15;
                                    i18 = eVar3.f68929i;
                                    if (i18 == -1) {
                                        d dVar12 = (d) sparseArray4.get(i18);
                                        if (dVar12 != null) {
                                            i26 = 3;
                                            dVar.s(3, 3, ((ViewGroup.MarginLayoutParams) eVar3).topMargin, eVar3.f68950x, dVar12);
                                        } else {
                                            i26 = 3;
                                        }
                                        i21 = i26;
                                        i22 = 5;
                                        i19 = -1;
                                    } else {
                                        int i62 = eVar3.f68931j;
                                        i19 = -1;
                                        if (i62 == -1 || (dVar4 = (d) sparseArray4.get(i62)) == null) {
                                            i21 = 3;
                                            i22 = 5;
                                        } else {
                                            dVar.s(3, 5, ((ViewGroup.MarginLayoutParams) eVar3).topMargin, eVar3.f68950x, dVar4);
                                            i21 = 3;
                                            i22 = 5;
                                        }
                                    }
                                    i23 = eVar3.f68933k;
                                    if (i23 == i19) {
                                        d dVar13 = (d) sparseArray4.get(i23);
                                        if (dVar13 != null) {
                                            int i63 = i21;
                                            dVar.s(i22, i63, ((ViewGroup.MarginLayoutParams) eVar3).bottomMargin, eVar3.f68952z, dVar13);
                                            i24 = i63;
                                        } else {
                                            i24 = i21;
                                        }
                                    } else {
                                        i24 = i21;
                                        int i64 = eVar3.f68935l;
                                        if (i64 != i19 && (dVar5 = (d) sparseArray4.get(i64)) != null) {
                                            dVar.s(i22, i22, ((ViewGroup.MarginLayoutParams) eVar3).bottomMargin, eVar3.f68952z, dVar5);
                                        }
                                    }
                                    eVar = eVar3;
                                    i25 = eVar.f68937m;
                                    if (i25 == -1) {
                                        constraintLayout = this;
                                        dVar6 = dVar;
                                        constraintLayout.m(dVar6, eVar, sparseArray4, i25, 6);
                                    } else {
                                        int i65 = eVar.n;
                                        if (i65 != -1) {
                                            constraintLayout = this;
                                            dVar6 = dVar;
                                            constraintLayout.m(dVar6, eVar, sparseArray4, i65, i24);
                                        } else {
                                            int i66 = eVar.o;
                                            constraintLayout = this;
                                            dVar6 = dVar;
                                            int i67 = i22;
                                            if (i66 != -1) {
                                                constraintLayout.m(dVar6, eVar, sparseArray4, i66, i67);
                                            }
                                            if (f13 >= 0.0f) {
                                                dVar6.f57087c0 = f13;
                                            }
                                            f11 = eVar.F;
                                            if (f11 >= 0.0f) {
                                                dVar6.f57089d0 = f11;
                                            }
                                        }
                                    }
                                    if (f13 >= 0.0f) {
                                    }
                                    f11 = eVar.F;
                                    if (f11 >= 0.0f) {
                                    }
                                }
                                i14 = i13;
                                i15 = 4;
                                if (i56 == -1) {
                                }
                                i17 = i15;
                                i18 = eVar3.f68929i;
                                if (i18 == -1) {
                                }
                                i23 = eVar3.f68933k;
                                if (i23 == i19) {
                                }
                                eVar = eVar3;
                                i25 = eVar.f68937m;
                                if (i25 == -1) {
                                }
                                if (f13 >= 0.0f) {
                                }
                                f11 = eVar.F;
                                if (f11 >= 0.0f) {
                                }
                            }
                            if (zIsInEditMode && ((i32 = eVar.T) != -1 || eVar.U != -1)) {
                                int i68 = eVar.U;
                                dVar6.X = i32;
                                dVar6.Y = i68;
                            }
                            if (eVar.f68914a0) {
                                dVar6.H(i40);
                                dVar6.J(((ViewGroup.MarginLayoutParams) eVar).width);
                                if (((ViewGroup.MarginLayoutParams) eVar).width == -2) {
                                    dVar6.H(i47);
                                }
                            } else if (((ViewGroup.MarginLayoutParams) eVar).width == -1) {
                                if (eVar.W) {
                                    dVar6.H(3);
                                } else {
                                    dVar6.H(4);
                                }
                                dVar6.i(i16).f57079g = ((ViewGroup.MarginLayoutParams) eVar).leftMargin;
                                dVar6.i(i17).f57079g = ((ViewGroup.MarginLayoutParams) eVar).rightMargin;
                            } else {
                                dVar6.H(3);
                                dVar6.J(0);
                            }
                            if (eVar.f68916b0) {
                                i27 = -1;
                                dVar6.I(1);
                                dVar6.G(((ViewGroup.MarginLayoutParams) eVar).height);
                                if (((ViewGroup.MarginLayoutParams) eVar).height == -2) {
                                    dVar6.I(2);
                                }
                            } else {
                                i27 = -1;
                                if (((ViewGroup.MarginLayoutParams) eVar).height == -1) {
                                    if (eVar.X) {
                                        dVar6.I(3);
                                    } else {
                                        dVar6.I(4);
                                    }
                                    dVar6.i(3).f57079g = ((ViewGroup.MarginLayoutParams) eVar).topMargin;
                                    dVar6.i(5).f57079g = ((ViewGroup.MarginLayoutParams) eVar).bottomMargin;
                                } else {
                                    dVar6.I(3);
                                    dVar6.G(0);
                                }
                            }
                            String str2 = eVar.G;
                            if (str2 == null || str2.length() == 0) {
                                dVar6.V = 0.0f;
                            } else {
                                int length = str2.length();
                                int iIndexOf3 = str2.indexOf(44);
                                if (iIndexOf3 <= 0 || iIndexOf3 >= length - 1) {
                                    i29 = i27;
                                    i31 = 0;
                                } else {
                                    String strSubstring = str2.substring(0, iIndexOf3);
                                    i29 = strSubstring.equalsIgnoreCase("W") ? 0 : strSubstring.equalsIgnoreCase("H") ? 1 : i27;
                                    i31 = iIndexOf3 + 1;
                                }
                                int iIndexOf4 = str2.indexOf(58);
                                if (iIndexOf4 < 0 || iIndexOf4 >= length - 1) {
                                    String strSubstring2 = str2.substring(i31);
                                    fAbs = strSubstring2.length() > 0 ? Float.parseFloat(strSubstring2) : 0.0f;
                                    if (fAbs > 0.0f) {
                                        dVar6.V = fAbs;
                                        dVar6.W = i29;
                                    }
                                } else {
                                    String strSubstring3 = str2.substring(i31, iIndexOf4);
                                    String strSubstring4 = str2.substring(iIndexOf4 + 1);
                                    if (strSubstring3.length() > 0 && strSubstring4.length() > 0) {
                                        try {
                                            float f15 = Float.parseFloat(strSubstring3);
                                            float f16 = Float.parseFloat(strSubstring4);
                                            if (f15 > 0.0f && f16 > 0.0f) {
                                                fAbs = i29 == 1 ? Math.abs(f16 / f15) : Math.abs(f15 / f16);
                                            }
                                        } catch (NumberFormatException unused3) {
                                        }
                                        if (fAbs > 0.0f) {
                                        }
                                    }
                                }
                            }
                            float f17 = eVar.H;
                            float[] fArr = dVar6.f57101j0;
                            fArr[0] = f17;
                            i40 = 1;
                            fArr[1] = eVar.I;
                            dVar6.f57097h0 = eVar.J;
                            dVar6.f57099i0 = eVar.K;
                            int i69 = eVar.Z;
                            if (i69 >= 0 && i69 <= 3) {
                                dVar6.f57110p = i69;
                            }
                            int i71 = eVar.L;
                            int i72 = eVar.N;
                            int i73 = eVar.P;
                            float f18 = eVar.R;
                            dVar6.f57111q = i71;
                            dVar6.f57114t = i72;
                            if (i73 == Integer.MAX_VALUE) {
                                i73 = 0;
                            }
                            dVar6.f57115u = i73;
                            dVar6.f57116v = f18;
                            if (f18 > 0.0f && f18 < 1.0f && i71 == 0) {
                                dVar6.f57111q = 2;
                            }
                            int i74 = eVar.M;
                            int i75 = eVar.O;
                            int i76 = eVar.Q;
                            float f19 = eVar.S;
                            dVar6.f57112r = i74;
                            dVar6.f57117w = i75;
                            if (i76 == Integer.MAX_VALUE) {
                                i76 = 0;
                            }
                            dVar6.f57118x = i76;
                            dVar6.f57119y = f19;
                            if (f19 <= 0.0f || f19 >= 1.0f || i74 != 0) {
                                i28 = 2;
                            } else {
                                i28 = 2;
                                dVar6.f57112r = 2;
                            }
                        }
                    }
                    i51 = i12 + 1;
                    i47 = i28;
                    z11 = z12;
                }
            }
            if (z11) {
                eVar2.f57122q0.E(eVar2);
            }
        }
        eVar2.f57127v0.getClass();
        constraintLayout.l(eVar2, constraintLayout.f14189i, i5, i11);
        int iN = eVar2.n();
        int iK = eVar2.k();
        boolean z15 = eVar2.D0;
        boolean z16 = eVar2.E0;
        u uVar = constraintLayout.n;
        int i77 = uVar.f54502d;
        int iResolveSizeAndState = View.resolveSizeAndState(iN + uVar.f54501c, i5, 0);
        int iResolveSizeAndState2 = View.resolveSizeAndState(iK + i77, i11, 0) & 16777215;
        int iMin = Math.min(constraintLayout.f14186f, iResolveSizeAndState & 16777215);
        int iMin2 = Math.min(constraintLayout.f14187g, iResolveSizeAndState2);
        if (z15) {
            iMin |= 16777216;
        }
        if (z16) {
            iMin2 |= 16777216;
        }
        constraintLayout.setMeasuredDimension(iMin, iMin2);
    }

    @Override // android.view.ViewGroup
    public final void onViewAdded(View view) {
        super.onViewAdded(view);
        d dVarI = i(view);
        if ((view instanceof n) && !(dVarI instanceof h)) {
            j4.e eVar = (j4.e) view.getLayoutParams();
            h hVar = new h();
            eVar.f68942p0 = hVar;
            eVar.f68920d0 = true;
            hVar.N(eVar.V);
        }
        if (view instanceof c) {
            c cVar = (c) view;
            cVar.k();
            ((j4.e) view.getLayoutParams()).f68922e0 = true;
            ArrayList arrayList = this.f14182b;
            if (!arrayList.contains(cVar)) {
                arrayList.add(cVar);
            }
        }
        this.f14181a.put(view.getId(), view);
        this.f14188h = true;
    }

    @Override // android.view.ViewGroup
    public void onViewRemoved(View view) {
        super.onViewRemoved(view);
        this.f14181a.remove(view.getId());
        d dVarI = i(view);
        this.f14183c.f57121p0.remove(dVarI);
        dVarI.z();
        this.f14182b.remove(view);
        this.f14188h = true;
    }

    @Override // android.view.View, android.view.ViewParent
    public final void requestLayout() {
        this.f14188h = true;
        super.requestLayout();
    }

    @Override // android.view.View
    public final void setId(int i5) {
        int id2 = getId();
        SparseArray sparseArray = this.f14181a;
        sparseArray.remove(id2);
        super.setId(i5);
        sparseArray.put(getId(), this);
    }

    @Override // android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        return false;
    }

    public ConstraintLayout(Context context, AttributeSet attributeSet, int i5) throws XmlPullParserException, IOException, NumberFormatException {
        super(context, attributeSet, i5);
        this.f14181a = new SparseArray();
        this.f14182b = new ArrayList(4);
        this.f14183c = new e();
        this.f14184d = 0;
        this.f14185e = 0;
        this.f14186f = LayoutNode.NotPlacedPlaceOrder;
        this.f14187g = LayoutNode.NotPlacedPlaceOrder;
        this.f14188h = true;
        this.f14189i = 257;
        this.f14190j = null;
        this.f14191k = -1;
        this.f14192l = new HashMap();
        this.f14193m = new SparseArray();
        this.n = new u(this, this);
        j(attributeSet, i5);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        j4.e eVar = new j4.e(layoutParams);
        eVar.f68913a = -1;
        eVar.f68915b = -1;
        eVar.f68917c = -1.0f;
        eVar.f68919d = true;
        eVar.f68921e = -1;
        eVar.f68923f = -1;
        eVar.f68925g = -1;
        eVar.f68927h = -1;
        eVar.f68929i = -1;
        eVar.f68931j = -1;
        eVar.f68933k = -1;
        eVar.f68935l = -1;
        eVar.f68937m = -1;
        eVar.n = -1;
        eVar.o = -1;
        eVar.f68941p = -1;
        eVar.f68943q = 0;
        eVar.f68944r = 0.0f;
        eVar.f68945s = -1;
        eVar.f68946t = -1;
        eVar.f68947u = -1;
        eVar.f68948v = -1;
        eVar.f68949w = Integer.MIN_VALUE;
        eVar.f68950x = Integer.MIN_VALUE;
        eVar.f68951y = Integer.MIN_VALUE;
        eVar.f68952z = Integer.MIN_VALUE;
        eVar.A = Integer.MIN_VALUE;
        eVar.B = Integer.MIN_VALUE;
        eVar.C = Integer.MIN_VALUE;
        eVar.D = 0;
        eVar.E = 0.5f;
        eVar.F = 0.5f;
        eVar.G = null;
        eVar.H = -1.0f;
        eVar.I = -1.0f;
        eVar.J = 0;
        eVar.K = 0;
        eVar.L = 0;
        eVar.M = 0;
        eVar.N = 0;
        eVar.O = 0;
        eVar.P = 0;
        eVar.Q = 0;
        eVar.R = 1.0f;
        eVar.S = 1.0f;
        eVar.T = -1;
        eVar.U = -1;
        eVar.V = -1;
        eVar.W = false;
        eVar.X = false;
        eVar.Y = null;
        eVar.Z = 0;
        eVar.f68914a0 = true;
        eVar.f68916b0 = true;
        eVar.f68918c0 = false;
        eVar.f68920d0 = false;
        eVar.f68922e0 = false;
        eVar.f68924f0 = -1;
        eVar.f68926g0 = -1;
        eVar.f68928h0 = -1;
        eVar.f68930i0 = -1;
        eVar.f68932j0 = Integer.MIN_VALUE;
        eVar.f68934k0 = Integer.MIN_VALUE;
        eVar.f68936l0 = 0.5f;
        eVar.f68942p0 = new d();
        if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
            ((ViewGroup.MarginLayoutParams) eVar).leftMargin = marginLayoutParams.leftMargin;
            ((ViewGroup.MarginLayoutParams) eVar).rightMargin = marginLayoutParams.rightMargin;
            ((ViewGroup.MarginLayoutParams) eVar).topMargin = marginLayoutParams.topMargin;
            ((ViewGroup.MarginLayoutParams) eVar).bottomMargin = marginLayoutParams.bottomMargin;
            eVar.setMarginStart(marginLayoutParams.getMarginStart());
            eVar.setMarginEnd(marginLayoutParams.getMarginEnd());
        }
        if (!(layoutParams instanceof j4.e)) {
            return eVar;
        }
        j4.e eVar2 = (j4.e) layoutParams;
        eVar.f68913a = eVar2.f68913a;
        eVar.f68915b = eVar2.f68915b;
        eVar.f68917c = eVar2.f68917c;
        eVar.f68919d = eVar2.f68919d;
        eVar.f68921e = eVar2.f68921e;
        eVar.f68923f = eVar2.f68923f;
        eVar.f68925g = eVar2.f68925g;
        eVar.f68927h = eVar2.f68927h;
        eVar.f68929i = eVar2.f68929i;
        eVar.f68931j = eVar2.f68931j;
        eVar.f68933k = eVar2.f68933k;
        eVar.f68935l = eVar2.f68935l;
        eVar.f68937m = eVar2.f68937m;
        eVar.n = eVar2.n;
        eVar.o = eVar2.o;
        eVar.f68941p = eVar2.f68941p;
        eVar.f68943q = eVar2.f68943q;
        eVar.f68944r = eVar2.f68944r;
        eVar.f68945s = eVar2.f68945s;
        eVar.f68946t = eVar2.f68946t;
        eVar.f68947u = eVar2.f68947u;
        eVar.f68948v = eVar2.f68948v;
        eVar.f68949w = eVar2.f68949w;
        eVar.f68950x = eVar2.f68950x;
        eVar.f68951y = eVar2.f68951y;
        eVar.f68952z = eVar2.f68952z;
        eVar.A = eVar2.A;
        eVar.B = eVar2.B;
        eVar.C = eVar2.C;
        eVar.D = eVar2.D;
        eVar.E = eVar2.E;
        eVar.F = eVar2.F;
        eVar.G = eVar2.G;
        eVar.H = eVar2.H;
        eVar.I = eVar2.I;
        eVar.J = eVar2.J;
        eVar.K = eVar2.K;
        eVar.W = eVar2.W;
        eVar.X = eVar2.X;
        eVar.L = eVar2.L;
        eVar.M = eVar2.M;
        eVar.N = eVar2.N;
        eVar.P = eVar2.P;
        eVar.O = eVar2.O;
        eVar.Q = eVar2.Q;
        eVar.R = eVar2.R;
        eVar.S = eVar2.S;
        eVar.T = eVar2.T;
        eVar.U = eVar2.U;
        eVar.V = eVar2.V;
        eVar.f68914a0 = eVar2.f68914a0;
        eVar.f68916b0 = eVar2.f68916b0;
        eVar.f68918c0 = eVar2.f68918c0;
        eVar.f68920d0 = eVar2.f68920d0;
        eVar.f68924f0 = eVar2.f68924f0;
        eVar.f68926g0 = eVar2.f68926g0;
        eVar.f68928h0 = eVar2.f68928h0;
        eVar.f68930i0 = eVar2.f68930i0;
        eVar.f68932j0 = eVar2.f68932j0;
        eVar.f68934k0 = eVar2.f68934k0;
        eVar.f68936l0 = eVar2.f68936l0;
        eVar.Y = eVar2.Y;
        eVar.Z = eVar2.Z;
        eVar.f68942p0 = eVar2.f68942p0;
        return eVar;
    }
}
