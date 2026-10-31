package com.bytedance.sdk.openadsdk.core;

import com.bytedance.sdk.component.embedapplog.IDefaultEncrypt;
import com.bytedance.sdk.component.embedapplog.PangleEncryptConstant;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class oty implements IDefaultEncrypt {
    private final PangleEncryptConstant.CryptDataScene ycx;

    public oty(PangleEncryptConstant.CryptDataScene cryptDataScene) {
        this.ycx = cryptDataScene;
    }

    @Override // com.bytedance.sdk.component.embedapplog.IDefaultEncrypt
    public JSONObject encrypt(JSONObject jSONObject, int i5) {
        hf.ycx(1, this.ycx, i5);
        return com.bytedance.sdk.component.utils.ycx.ycx(jSONObject);
    }
}
