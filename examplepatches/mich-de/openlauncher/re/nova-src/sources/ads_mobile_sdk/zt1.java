package ads_mobile_sdk;

import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import java.lang.ref.WeakReference;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import ni.o;

/* loaded from: classes2.dex */
public abstract class zt1 {

    /* renamed from: a, reason: collision with root package name */
    public final AtomicBoolean f12652a = new AtomicBoolean(false);

    /* renamed from: b, reason: collision with root package name */
    public final AtomicBoolean f12653b = new AtomicBoolean(false);

    /* renamed from: c, reason: collision with root package name */
    public WeakReference f12654c = new WeakReference(null);

    /* renamed from: d, reason: collision with root package name */
    public WeakReference f12655d = new WeakReference(null);

    /* renamed from: e, reason: collision with root package name */
    public WeakReference f12656e = new WeakReference(null);

    /* renamed from: f, reason: collision with root package name */
    public WeakReference f12657f = new WeakReference(null);

    public abstract com.google.gson.r a(o oVar, ImageView.ScaleType scaleType, LinkedHashMap linkedHashMap);

    public abstract void a();

    public abstract void a(View view, int i5);

    public abstract void a(View view, o oVar, LinkedHashMap linkedHashMap, ImageView.ScaleType scaleType);

    public abstract void a(FrameLayout frameLayout, ImageView.ScaleType scaleType, Map map);

    public abstract void a(WeakReference weakReference, o oVar, LinkedHashMap linkedHashMap, ew1 ew1Var, ew1 ew1Var2);

    public abstract void a(o oVar, MotionEvent motionEvent);

    public abstract void a(o oVar, LinkedHashMap linkedHashMap);

    public abstract void a$1();

    public abstract com.google.gson.r b(o oVar, ImageView.ScaleType scaleType, LinkedHashMap linkedHashMap);

    public abstract void b(FrameLayout frameLayout, ImageView.ScaleType scaleType, Map map);

    public abstract void c();

    public abstract boolean d();

    public abstract int e();

    public abstract boolean k();
}
