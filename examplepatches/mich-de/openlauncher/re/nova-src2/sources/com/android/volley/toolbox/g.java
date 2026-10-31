package com.android.volley.toolbox;

import com.android.volley.ParseError;
import java.io.UnsupportedEncodingException;
import jb.m;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public abstract class g extends h {
    @Override // jb.i
    public m parseNetworkResponse(jb.f fVar) {
        try {
            return new m(new JSONObject(new String(fVar.f69396b, ex.i.L(fVar.f69397c))), ex.i.K(fVar));
        } catch (UnsupportedEncodingException e3) {
            return new m(new ParseError(e3));
        } catch (JSONException e11) {
            return new m(new ParseError(e11));
        }
    }
}
