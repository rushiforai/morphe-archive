package com.google.android.gms.internal.consent_sdk;

import android.app.Application;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.Base64;
import java.io.ByteArrayOutputStream;
import java.util.concurrent.Executor;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final /* synthetic */ class r implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32220a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ v f32221b;

    public /* synthetic */ r(v vVar, int i5) {
        this.f32220a = i5;
        this.f32221b = vVar;
    }

    @Override // java.lang.Runnable
    public final void run() throws JSONException {
        switch (this.f32220a) {
            case 0:
                v vVar = this.f32221b;
                vVar.getClass();
                ((Executor) vVar.f32262d).execute(new r(vVar, 1));
                break;
            default:
                JSONObject jSONObject = new JSONObject();
                v vVar2 = this.f32221b;
                Application application = (Application) vVar2.f32259a;
                try {
                    jSONObject.put("app_name", application.getPackageManager().getApplicationLabel(application.getApplicationInfo()).toString());
                    Drawable applicationIcon = application.getPackageManager().getApplicationIcon(application.getApplicationInfo());
                    String strConcat = null;
                    if (applicationIcon != null && applicationIcon.getIntrinsicWidth() > 0 && applicationIcon.getIntrinsicHeight() > 0) {
                        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(applicationIcon.getIntrinsicWidth(), applicationIcon.getIntrinsicHeight(), Bitmap.Config.ARGB_8888);
                        Canvas canvas = new Canvas(bitmapCreateBitmap);
                        applicationIcon.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
                        applicationIcon.draw(canvas);
                        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                        bitmapCreateBitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
                        strConcat = "data:image/png;base64,".concat(String.valueOf(Base64.encodeToString(byteArrayOutputStream.toByteArray(), 2)));
                    }
                    jSONObject.put("app_icon", strConcat);
                    JSONObject jSONObject2 = new JSONObject();
                    h hVar = (h) vVar2.f32266h;
                    for (String str : hVar.a().keySet()) {
                        jSONObject2.put(str, hVar.a().get(str));
                    }
                    jSONObject.put("stored_infos_map", jSONObject2);
                } catch (JSONException unused) {
                }
                ((m) vVar2.f32265g).f32140h.a("UMP_configureFormWithAppAssets", jSONObject.toString());
                break;
        }
    }
}
