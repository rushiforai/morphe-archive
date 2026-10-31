package com.bytedance.adsdk.ycx.zb.zb.ycx;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ul implements com.bytedance.adsdk.ycx.zb.zb.ycx {
    private final Object ycx;

    public ul(String str) {
        if (str.equalsIgnoreCase(InneractiveMediationDefs.SHOW_HOUSE_AD_YES)) {
            this.ycx = Boolean.TRUE;
        } else if (str.equalsIgnoreCase("false")) {
            this.ycx = Boolean.FALSE;
        } else {
            if (!str.equalsIgnoreCase(AbstractJsonLexerKt.NULL)) {
                throw new IllegalArgumentException();
            }
            this.ycx = null;
        }
    }

    public String toString() {
        return "KeywordNode [keywordValue=" + this.ycx + "]";
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public Object ycx(Map<String, JSONObject> map) {
        return this.ycx;
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public String zb() {
        Object obj = this.ycx;
        return obj != null ? obj.toString() : "NULL";
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public com.bytedance.adsdk.ycx.zb.dj.lud ycx() {
        return com.bytedance.adsdk.ycx.zb.dj.lt.CONSTANT;
    }
}
