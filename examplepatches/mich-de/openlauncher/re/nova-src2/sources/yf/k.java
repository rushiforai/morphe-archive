package yf;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.opengl.GLSurfaceView;
import android.os.Handler;
import android.os.Looper;
import android.view.Surface;
import android.view.View;
import android.view.WindowManager;
import java.util.concurrent.CopyOnWriteArrayList;
import o9.d4;
import wf.v;

/* loaded from: classes3.dex */
public final class k extends GLSurfaceView {

    /* renamed from: a, reason: collision with root package name */
    public final CopyOnWriteArrayList f97293a;

    /* renamed from: b, reason: collision with root package name */
    public final SensorManager f97294b;

    /* renamed from: c, reason: collision with root package name */
    public final Sensor f97295c;

    /* renamed from: d, reason: collision with root package name */
    public final d f97296d;

    /* renamed from: e, reason: collision with root package name */
    public final Handler f97297e;

    /* renamed from: f, reason: collision with root package name */
    public final i f97298f;

    /* renamed from: g, reason: collision with root package name */
    public SurfaceTexture f97299g;

    /* renamed from: h, reason: collision with root package name */
    public Surface f97300h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f97301i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f97302j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f97303k;

    public k(Context context) {
        super(context, null);
        this.f97293a = new CopyOnWriteArrayList();
        this.f97297e = new Handler(Looper.getMainLooper());
        Object systemService = context.getSystemService("sensor");
        systemService.getClass();
        SensorManager sensorManager = (SensorManager) systemService;
        this.f97294b = sensorManager;
        Sensor defaultSensor = v.f94376a >= 18 ? sensorManager.getDefaultSensor(15) : null;
        this.f97295c = defaultSensor == null ? sensorManager.getDefaultSensor(11) : defaultSensor;
        i iVar = new i();
        this.f97298f = iVar;
        j jVar = new j(this, iVar);
        View.OnTouchListener lVar = new l(context, jVar);
        WindowManager windowManager = (WindowManager) context.getSystemService("window");
        windowManager.getClass();
        this.f97296d = new d(windowManager.getDefaultDisplay(), lVar, jVar);
        this.f97301i = true;
        setEGLContextClientVersion(2);
        setRenderer(jVar);
        setOnTouchListener(lVar);
    }

    public final void a() {
        boolean z11 = this.f97301i && this.f97302j;
        Sensor sensor = this.f97295c;
        if (sensor == null || z11 == this.f97303k) {
            return;
        }
        d dVar = this.f97296d;
        SensorManager sensorManager = this.f97294b;
        if (z11) {
            sensorManager.registerListener(dVar, sensor, 0);
        } else {
            sensorManager.unregisterListener(dVar);
        }
        this.f97303k = z11;
    }

    @Override // android.opengl.GLSurfaceView, android.view.SurfaceView, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.f97297e.post(new d4(this, 20));
    }

    @Override // android.opengl.GLSurfaceView
    public final void onPause() {
        this.f97302j = false;
        a();
        super.onPause();
    }

    @Override // android.opengl.GLSurfaceView
    public final void onResume() {
        super.onResume();
        this.f97302j = true;
        a();
    }
}
