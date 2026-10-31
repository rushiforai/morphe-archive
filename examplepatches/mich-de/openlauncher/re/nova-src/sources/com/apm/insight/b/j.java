package com.apm.insight.b;

import android.os.Looper;
import android.os.Message;
import android.os.MessageQueue;
import java.lang.reflect.Field;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    private static MessageQueue f21523a;

    /* renamed from: b, reason: collision with root package name */
    private static Field f21524b;

    /* renamed from: c, reason: collision with root package name */
    private static Field f21525c;

    public static MessageQueue a() {
        if (f21523a == null && Looper.getMainLooper() != null) {
            Looper mainLooper = Looper.getMainLooper();
            if (mainLooper == Looper.myLooper()) {
                f21523a = Looper.myQueue();
            } else {
                f21523a = mainLooper.getQueue();
            }
        }
        return f21523a;
    }

    public static Message a(MessageQueue messageQueue) throws NoSuchFieldException, SecurityException {
        Field field = f21524b;
        if (field == null) {
            try {
                Field declaredField = Class.forName("android.os.MessageQueue").getDeclaredField("mMessages");
                f21524b = declaredField;
                declaredField.setAccessible(true);
                return (Message) f21524b.get(messageQueue);
            } catch (Exception unused) {
                return null;
            }
        }
        try {
            return (Message) field.get(messageQueue);
        } catch (Exception unused2) {
            return null;
        }
    }

    private static Message a(Message message) throws NoSuchFieldException, SecurityException {
        Field field = f21525c;
        if (field == null) {
            try {
                Field declaredField = Class.forName("android.os.Message").getDeclaredField("next");
                f21525c = declaredField;
                declaredField.setAccessible(true);
                return (Message) f21525c.get(message);
            } catch (Exception unused) {
                return null;
            }
        }
        try {
            return (Message) field.get(message);
        } catch (Exception unused2) {
            return null;
        }
    }

    private static JSONObject a(Message message, long j11) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        if (message != null) {
            try {
                jSONObject.put("when", message.getWhen() - j11);
                if (message.getCallback() != null) {
                    jSONObject.put("callback", String.valueOf(message.getCallback()));
                }
                jSONObject.put("what", message.what);
                if (message.getTarget() != null) {
                    jSONObject.put("target", String.valueOf(message.getTarget()));
                } else {
                    jSONObject.put("barrier", message.arg1);
                }
                jSONObject.put("arg1", message.arg1);
                jSONObject.put("arg2", message.arg2);
                Object obj = message.obj;
                if (obj != null) {
                    jSONObject.put("obj", obj);
                }
            } catch (JSONException e3) {
                e3.printStackTrace();
                return jSONObject;
            }
        }
        return jSONObject;
    }

    public static JSONArray a(long j11) {
        MessageQueue messageQueueA = a();
        JSONArray jSONArray = new JSONArray();
        if (messageQueueA != null) {
            try {
                synchronized (messageQueueA) {
                    try {
                        Message messageA = a(messageQueueA);
                        if (messageA == null) {
                            return jSONArray;
                        }
                        int i5 = 0;
                        int i11 = 0;
                        while (messageA != null && i5 < 100) {
                            i5++;
                            i11++;
                            JSONObject jSONObjectA = a(messageA, j11);
                            try {
                                jSONObjectA.put("id", i11);
                            } catch (JSONException unused) {
                            }
                            jSONArray.put(jSONObjectA);
                            messageA = a(messageA);
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
            } catch (Throwable th3) {
                com.apm.insight.c.a();
                com.apm.insight.runtime.j.a(th3, "NPTH_CATCH");
                return jSONArray;
            }
        }
        return jSONArray;
    }
}
