package com.bytedance.sdk.openadsdk.wwx;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import com.amplitude.android.migration.DatabaseConstants;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt {
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private WeakReference<fby> f27360zb;
    private Map<String, ycx> sya = new HashMap();

    /* renamed from: dj, reason: collision with root package name */
    private SensorEventListener f27357dj = new SensorEventListener() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.1
        @Override // android.hardware.SensorEventListener
        public void onAccuracyChanged(Sensor sensor, int i5) {
        }

        @Override // android.hardware.SensorEventListener
        public void onSensorChanged(SensorEvent sensorEvent) {
            fby fbyVarDj;
            if (sensorEvent.sensor.getType() != 1 || (fbyVarDj = lt.this.dj()) == null) {
                return;
            }
            float[] fArr = sensorEvent.values;
            float f11 = fArr[0];
            float f12 = fArr[1];
            float f13 = fArr[2];
            try {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("x", f11);
                jSONObject.put("y", f12);
                jSONObject.put("z", f13);
                fbyVarDj.ycx("accelerometer_callback", jSONObject);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKqWfVPhRWnLR+/", "VOAekA2vZtWjQtZTixSk", 48);
            }
        }
    };
    private SensorEventListener lud = new SensorEventListener() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.12
        @Override // android.hardware.SensorEventListener
        public void onAccuracyChanged(Sensor sensor, int i5) {
        }

        @Override // android.hardware.SensorEventListener
        public void onSensorChanged(SensorEvent sensorEvent) {
            fby fbyVarDj;
            if (sensorEvent.sensor.getType() != 4 || (fbyVarDj = lt.this.dj()) == null) {
                return;
            }
            float degrees = (float) Math.toDegrees(sensorEvent.values[0]);
            float degrees2 = (float) Math.toDegrees(sensorEvent.values[1]);
            float degrees3 = (float) Math.toDegrees(sensorEvent.values[2]);
            try {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("x", degrees);
                jSONObject.put("y", degrees2);
                jSONObject.put("z", degrees3);
                fbyVarDj.ycx("gyro_callback", jSONObject);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKqWfVPhRWnLR+8", "VOAekA2vZtWjQtZTixSk", 76);
            }
        }
    };

    /* renamed from: lt, reason: collision with root package name */
    private SensorEventListener f27358lt = new SensorEventListener() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.23
        @Override // android.hardware.SensorEventListener
        public void onAccuracyChanged(Sensor sensor, int i5) {
        }

        @Override // android.hardware.SensorEventListener
        public void onSensorChanged(SensorEvent sensorEvent) {
            fby fbyVarDj;
            if (sensorEvent.sensor.getType() != 10 || (fbyVarDj = lt.this.dj()) == null) {
                return;
            }
            float[] fArr = sensorEvent.values;
            float f11 = fArr[0];
            float f12 = fArr[1];
            float f13 = fArr[2];
            try {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("x", f11);
                jSONObject.put("y", f12);
                jSONObject.put("z", f13);
                fbyVarDj.ycx("accelerometer_grativityless_callback", jSONObject);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKqWfVPhRWnLR+9", "VOAekA2vZtWjQtZTixSk", 104);
            }
        }
    };

    /* renamed from: ul, reason: collision with root package name */
    private SensorEventListener f27359ul = new SensorEventListener() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.34
        @Override // android.hardware.SensorEventListener
        public void onAccuracyChanged(Sensor sensor, int i5) {
        }

        @Override // android.hardware.SensorEventListener
        public void onSensorChanged(SensorEvent sensorEvent) {
            if (sensorEvent.sensor.getType() == 1) {
                float[] fArr = sensorEvent.values;
                float[] fArr2 = jc.f27356zb;
                System.arraycopy(fArr, 0, fArr2, 0, fArr2.length);
            } else if (sensorEvent.sensor.getType() == 2) {
                float[] fArr3 = sensorEvent.values;
                float[] fArr4 = jc.sya;
                System.arraycopy(fArr3, 0, fArr4, 0, fArr4.length);
            }
            float[] fArr5 = jc.f27355dj;
            SensorManager.getRotationMatrix(fArr5, null, jc.f27356zb, jc.sya);
            float[] fArr6 = jc.lud;
            SensorManager.getOrientation(fArr5, fArr6);
            fby fbyVarDj = lt.this.dj();
            if (fbyVarDj == null) {
                return;
            }
            float f11 = fArr6[0];
            float f12 = fArr6[1];
            float f13 = fArr6[2];
            try {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("alpha", f11);
                jSONObject.put("beta", f12);
                jSONObject.put("gamma", f13);
                fbyVarDj.ycx("rotation_vector_callback", jSONObject);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKqWfVPhRWnLR+6", "VOAekA2vZtWjQtZTixSk", 143);
            }
        }
    };

    public interface ycx {
        JSONObject ycx(JSONObject jSONObject) throws Throwable;
    }

    public lt(fby fbyVar) {
        this.ycx = fbyVar.ycx();
        this.f27360zb = new WeakReference<>(fbyVar);
        sya();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public fby dj() {
        WeakReference<fby> weakReference = this.f27360zb;
        if (weakReference == null) {
            return null;
        }
        return weakReference.get();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public com.bytedance.sdk.openadsdk.wwx.ycx lud() {
        fby fbyVarDj = dj();
        if (fbyVarDj == null) {
            return null;
        }
        return fbyVarDj.wie();
    }

    private void sya() {
        this.sya.put("adInfo", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.45
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                if (fbyVarDj == null) {
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                JSONObject jSONObjectUh = fbyVarDj.uh();
                if (jSONObjectUh != null) {
                    jSONObjectUh.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                    return jSONObjectUh;
                }
                JSONObject jSONObject3 = new JSONObject();
                jSONObject3.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                return jSONObject3;
            }
        });
        this.sya.put("appInfo", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.56
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                jSONObject2.put("appName", "playable_sdk");
                jSONObject2.put("playableSdkEdition", "6.6.0");
                JSONArray jSONArray = new JSONArray();
                Iterator<String> it = lt.this.ycx().iterator();
                while (it.hasNext()) {
                    jSONArray.put(it.next());
                }
                jSONObject2.put("supportList", jSONArray);
                fby fbyVarDj = lt.this.dj();
                if (fbyVarDj != null) {
                    jSONObject2.put("deviceId", fbyVarDj.ul());
                    jSONObject2.put("netType", fbyVarDj.dy());
                    jSONObject2.put("innerAppName", fbyVarDj.dj());
                    jSONObject2.put("appName", fbyVarDj.lud());
                    jSONObject2.put("appVersion", fbyVarDj.lt());
                    Map<String, String> mapZb = fbyVarDj.zb();
                    for (String str : mapZb.keySet()) {
                        jSONObject2.put(str, mapZb.get(str));
                    }
                }
                return jSONObject2;
            }
        });
        this.sya.put("playableSDKInfo", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.62
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                jSONObject2.put("appName", "playable_sdk");
                jSONObject2.put("playableSdkEdition", "6.6.0");
                jSONObject2.put("os", "android");
                return jSONObject2;
            }
        });
        this.sya.put("subscribe_app_ad", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.63
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                com.bytedance.sdk.openadsdk.wwx.ycx ycxVarLud = lt.this.lud();
                JSONObject jSONObject2 = new JSONObject();
                if (ycxVarLud == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("download_app_ad", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.64
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                com.bytedance.sdk.openadsdk.wwx.ycx ycxVarLud = lt.this.lud();
                JSONObject jSONObject2 = new JSONObject();
                if (ycxVarLud == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("isViewable", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.2
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                if (fbyVarDj == null) {
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                JSONObject jSONObject3 = new JSONObject();
                jSONObject3.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                jSONObject3.put("viewStatus", fbyVarDj.jw());
                return jSONObject3;
            }
        });
        this.sya.put("getVolume", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.3
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                if (fbyVarDj == null) {
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                JSONObject jSONObject3 = new JSONObject();
                jSONObject3.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                jSONObject3.put("endcard_mute", fbyVarDj.fby());
                return jSONObject3;
            }
        });
        this.sya.put("getScreenSize", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.4
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                if (fbyVarDj == null) {
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                JSONObject jSONObjectPmi = fbyVarDj.pmi();
                jSONObjectPmi.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObjectPmi;
            }
        });
        this.sya.put("start_accelerometer_observer", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.5
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                JSONObject jSONObject2 = new JSONObject();
                int iOptInt = 2;
                if (jSONObject != null) {
                    try {
                        iOptInt = jSONObject.optInt("interval_android", 2);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKqWfVPhRWnLR+/fg==", "UuA7mgi5", Sdk.SDKError.Reason.SILENT_MODE_MONITOR_ERROR_VALUE);
                        ul.ycx("PlayableJsBridge", "invoke start_accelerometer_observer error", th2);
                        jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                        jSONObject2.put("codeMsg", th2.toString());
                        return jSONObject2;
                    }
                }
                jc.ycx(lt.this.ycx, lt.this.f27357dj, iOptInt);
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("close_accelerometer_observer", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.6
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                JSONObject jSONObject2 = new JSONObject();
                try {
                    jc.ycx(lt.this.ycx, lt.this.f27357dj);
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                    return jSONObject2;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKqWfVPhRWnLR+/eQ==", "UuA7mgi5", 336);
                    ul.ycx("PlayableJsBridge", "invoke close_accelerometer_observer error", th2);
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    jSONObject2.put("codeMsg", th2.toString());
                    return jSONObject2;
                }
            }
        });
        this.sya.put("start_gyro_observer", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.7
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                JSONObject jSONObject2 = new JSONObject();
                int iOptInt = 2;
                if (jSONObject != null) {
                    try {
                        iOptInt = jSONObject.optInt("interval_android", 2);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKqWfVPhRWnLR+/eA==", "UuA7mgi5", 358);
                        ul.ycx("PlayableJsBridge", "invoke start_gyro_observer error", th2);
                        jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                        jSONObject2.put("codeMsg", th2.toString());
                        return jSONObject2;
                    }
                }
                jc.zb(lt.this.ycx, lt.this.lud, iOptInt);
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("close_gyro_observer", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.8
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                JSONObject jSONObject2 = new JSONObject();
                try {
                    jc.ycx(lt.this.ycx, lt.this.lud);
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                    return jSONObject2;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKqWfVPhRWnLR+/ew==", "UuA7mgi5", 375);
                    ul.ycx("PlayableJsBridge", "invoke close_gyro_observer error", th2);
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    jSONObject2.put("codeMsg", th2.toString());
                    return jSONObject2;
                }
            }
        });
        this.sya.put("start_accelerometer_grativityless_observer", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.9
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                JSONObject jSONObject2 = new JSONObject();
                int iOptInt = 2;
                if (jSONObject != null) {
                    try {
                        iOptInt = jSONObject.optInt("interval_android", 2);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKqWfVPhRWnLR+/eg==", "UuA7mgi5", 396);
                        ul.ycx("PlayableJsBridge", "invoke start_accelerometer_grativityless_observer error", th2);
                        jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                        jSONObject2.put("codeMsg", th2.toString());
                        return jSONObject2;
                    }
                }
                jc.sya(lt.this.ycx, lt.this.f27358lt, iOptInt);
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("close_accelerometer_grativityless_observer", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.10
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                JSONObject jSONObject2 = new JSONObject();
                try {
                    jc.ycx(lt.this.ycx, lt.this.f27358lt);
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                    return jSONObject2;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKqWfVPhRWnLR+/dQ==", "UuA7mgi5", TTAdConstant.VIDEO_INFO_CODE);
                    ul.ycx("PlayableJsBridge", "invoke close_accelerometer_grativityless_observer error", th2);
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    jSONObject2.put("codeMsg", th2.toString());
                    return jSONObject2;
                }
            }
        });
        this.sya.put("start_rotation_vector_observer", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.11
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                JSONObject jSONObject2 = new JSONObject();
                int iOptInt = 2;
                if (jSONObject != null) {
                    try {
                        iOptInt = jSONObject.optInt("interval_android", 2);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKqWfVPhRWnLR+/dA==", "UuA7mgi5", 435);
                        ul.ycx("PlayableJsBridge", "invoke start_rotation_vector_observer error", th2);
                        jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                        jSONObject2.put("codeMsg", th2.toString());
                        return jSONObject2;
                    }
                }
                jc.dj(lt.this.ycx, lt.this.f27359ul, iOptInt);
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("close_rotation_vector_observer", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.13
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                JSONObject jSONObject2 = new JSONObject();
                try {
                    jc.ycx(lt.this.ycx, lt.this.f27359ul);
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                    return jSONObject2;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKqWfVPhRWnLR+8fQ==", "UuA7mgi5", 452);
                    ul.ycx("PlayableJsBridge", "invoke close_rotation_vector_observer error", th2);
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    jSONObject2.put("codeMsg", th2.toString());
                    return jSONObject2;
                }
            }
        });
        this.sya.put("device_shake", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.14
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                JSONObject jSONObject2 = new JSONObject();
                try {
                    jc.ycx(lt.this.ycx, 300L);
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                    return jSONObject2;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKqWfVPhRWnLR+8fA==", "UuA7mgi5", 470);
                    ul.ycx("PlayableJsBridge", "invoke device_shake error", th2);
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    jSONObject2.put("codeMsg", th2.toString());
                    return jSONObject2;
                }
            }
        });
        this.sya.put("device_shake_short", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.15
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                JSONObject jSONObject2 = new JSONObject();
                try {
                    jc.ycx(lt.this.ycx, 150L);
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                    return jSONObject2;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKqWfVPhRWnLR+8fw==", "UuA7mgi5", 487);
                    ul.ycx("PlayableJsBridge", "invoke device_shake error", th2);
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    jSONObject2.put("codeMsg", th2.toString());
                    return jSONObject2;
                }
            }
        });
        this.sya.put("playable_style", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.16
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                JSONObject jSONObjectSya = fbyVarDj.sya();
                jSONObjectSya.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObjectSya;
            }
        });
        this.sya.put("sendReward", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.17
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.thx();
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playableInteractionTriggered", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.18
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.wwx();
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("webview_time_track", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.19
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                return new JSONObject();
            }
        });
        this.sya.put("playable_event", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.20
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null || jSONObject == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.zb(jSONObject.optString(DatabaseConstants.EVENT_FIELD, null), jSONObject.optJSONObject("params"));
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("reportAd", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.21
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put(n.f39150d, new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.22
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("openAdLandPageLinks", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.24
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("get_viewport", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.25
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                JSONObject jSONObjectHtf = fbyVarDj.htf();
                jSONObjectHtf.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObjectHtf;
            }
        });
        this.sya.put("jssdk_load_finish", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.26
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.aeu();
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_material_render_result", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.27
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.jw(jSONObject);
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("detect_change_playable_click", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.28
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                JSONObject jSONObjectJc = fbyVarDj.jc();
                jSONObjectJc.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObjectJc;
            }
        });
        this.sya.put("check_camera_permission", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.29
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                JSONObject jSONObjectRy = fbyVarDj.ry();
                jSONObjectRy.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObjectRy;
            }
        });
        this.sya.put("check_external_storage", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.30
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                JSONObject jSONObjectXkz = fbyVarDj.xkz();
                if (jSONObjectXkz.isNull("result")) {
                    jSONObjectXkz.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObjectXkz;
                }
                jSONObjectXkz.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObjectXkz;
            }
        });
        this.sya.put("playable_open_camera", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.31
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_pick_photo", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.32
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_download_media_in_photos", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.33
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.ycx(jSONObject);
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_preventTouchEvent", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.35
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.zb(jSONObject);
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_settings_info", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.36
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                JSONObject jSONObjectSyc = fbyVarDj.syc();
                jSONObjectSyc.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObjectSyc;
            }
        });
        this.sya.put("playable_load_main_scene", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.37
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.tn();
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_enter_section", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.38
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.dj(jSONObject);
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_end", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.39
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.dv();
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_finish_play_playable", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.40
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.oty();
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_transfrom_module_show", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.41
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.hf();
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_transfrom_module_change_color", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.42
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.tru();
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_set_scroll_rect", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.43
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_click_area", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.44
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.lud(jSONObject);
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_real_play_start", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.46
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_material_first_frame_show", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.47
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.bhi();
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_stuck_check_pong", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.48
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.av();
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_material_adnormal_mask", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.49
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                fbyVarDj.lt(jSONObject);
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_long_press_panel", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.50
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_alpha_player_play", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.51
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_transfrom_module_highlight", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.52
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_send_click_event", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.53
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_query_media_permission_declare", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.54
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                JSONObject jSONObjectUl = fbyVarDj.ul(jSONObject);
                jSONObjectUl.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObjectUl;
            }
        });
        this.sya.put("playable_query_media_permission_enable", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.55
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                fby fbyVarDj = lt.this.dj();
                JSONObject jSONObject2 = new JSONObject();
                if (fbyVarDj == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                JSONObject jSONObjectFby = fbyVarDj.fby(jSONObject);
                jSONObjectFby.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObjectFby;
            }
        });
        this.sya.put("playable_apply_media_permission", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.57
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                com.bytedance.sdk.openadsdk.wwx.ycx ycxVarLud = lt.this.lud();
                JSONObject jSONObject2 = new JSONObject();
                if (ycxVarLud == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_start_kws", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.58
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                com.bytedance.sdk.openadsdk.wwx.ycx ycxVarLud = lt.this.lud();
                JSONObject jSONObject2 = new JSONObject();
                if (ycxVarLud == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_close_kws", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.59
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                com.bytedance.sdk.openadsdk.wwx.ycx ycxVarLud = lt.this.lud();
                JSONObject jSONObject2 = new JSONObject();
                if (ycxVarLud == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_video_preload_task_add", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.60
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                com.bytedance.sdk.openadsdk.wwx.ycx ycxVarLud = lt.this.lud();
                JSONObject jSONObject2 = new JSONObject();
                if (ycxVarLud == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
        this.sya.put("playable_video_preload_task_cancel", new ycx() { // from class: com.bytedance.sdk.openadsdk.wwx.lt.61
            @Override // com.bytedance.sdk.openadsdk.wwx.lt.ycx
            public JSONObject ycx(JSONObject jSONObject) throws Throwable {
                com.bytedance.sdk.openadsdk.wwx.ycx ycxVarLud = lt.this.lud();
                JSONObject jSONObject2 = new JSONObject();
                if (ycxVarLud == null) {
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                    return jSONObject2;
                }
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 1);
                return jSONObject2;
            }
        });
    }

    public Set<String> ycx() {
        return this.sya.keySet();
    }

    public void zb() {
        jc.ycx(this.ycx, this.f27357dj);
        jc.ycx(this.ycx, this.lud);
        jc.ycx(this.ycx, this.f27358lt);
        jc.ycx(this.ycx, this.f27359ul);
    }

    public JSONObject ycx(String str, JSONObject jSONObject) {
        try {
            ycx ycxVar = this.sya.get(str);
            if (ycxVar == null) {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, -1);
                return jSONObject2;
            }
            return ycxVar.ycx(jSONObject);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5wdoTFa7CGQ", "a+IsjAK+ZcKqWfVPhRWnLQ==", "UuA7mgi5", 1180);
            ul.ycx("PlayableJsBridge", "invoke error", th2);
            return null;
        }
    }
}
