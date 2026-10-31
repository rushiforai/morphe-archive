package com.bytedance.sdk.openadsdk.core.ry.zb;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.component.utils.wwx;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class ycx extends com.bytedance.adsdk.ugeno.jc.lt.zb {
    public ycx(Context context) {
        super(context);
    }

    @Override // com.bytedance.adsdk.ugeno.jc.lt.zb
    public void xkz(String str) {
        super.xkz(str);
        if (TextUtils.isEmpty(str) || TextUtils.equals(AbstractJsonLexerKt.NULL, str)) {
            return;
        }
        try {
            String str2 = String.format(wwx.ycx(this.f22701zb, "tt_comment_num"), Integer.valueOf(Integer.parseInt(str)));
            ((com.bytedance.adsdk.ugeno.jc.lt.ycx) this.lud).setText("(" + str2 + ")");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJqyI1a2FOJH7Q=", "eOEgmAayfemVR+BUiBalPA==", "SOs5oQakfQ==", 38);
        }
    }
}
