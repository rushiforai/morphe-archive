package com.bytedance.sdk.component.ycx;

import java.lang.reflect.Type;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
class ul {
    private jc ycx;

    private ul(jc jcVar) {
        this.ycx = jcVar;
    }

    public static ul ycx(jc jcVar) {
        return new ul(jcVar);
    }

    public <T> T ycx(String str, Type type) throws JSONException {
        ycx(str);
        return (type.equals(JSONObject.class) || ((type instanceof Class) && JSONObject.class.isAssignableFrom((Class) type))) ? (T) new JSONObject(str) : (T) this.ycx.ycx(str, type);
    }

    public <T> String ycx(T t6) {
        String string;
        if (t6 == null) {
            return "{}";
        }
        if (!(t6 instanceof JSONObject) && !(t6 instanceof JSONArray)) {
            string = this.ycx.ycx(t6);
        } else {
            string = t6.toString();
        }
        ycx(string);
        return string;
    }

    private static void ycx(String str) {
        if (str.startsWith("{") && str.endsWith("}")) {
            return;
        }
        fby.ycx(new IllegalArgumentException("Param is not allowed to be List or JSONArray, rawString:\n ".concat(str)));
    }
}
