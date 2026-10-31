package com.bytedance.sdk.component.adexpress.dynamic.dj;

import android.text.TextUtils;
import b.c0;
import com.amplitude.core.events.Plan;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public class lud {
    public static final Map<String, Integer> ycx;

    /* renamed from: dj, reason: collision with root package name */
    private lt f23367dj;

    /* renamed from: lt, reason: collision with root package name */
    private String f23368lt;
    private lt lud;
    private String sya;

    /* renamed from: zb, reason: collision with root package name */
    private String f23369zb;

    static {
        HashMap map = new HashMap();
        ycx = map;
        map.put("root", 8);
        map.put("footer", 6);
        map.put("empty", 6);
        map.put("title", 0);
        map.put("subtitle", 0);
        map.put(Plan.AMP_PLAN_SOURCE, 0);
        map.put("score-count", 0);
        map.put("text_star", 0);
        map.put("text", 0);
        map.put("tag-group", 17);
        map.put("app-version", 0);
        map.put("development-name", 0);
        map.put("privacy-detail", 23);
        map.put("image", 1);
        map.put("image-wide", 1);
        map.put("image-square", 1);
        map.put("image-long", 1);
        map.put("image-splash", 1);
        map.put("image-cover", 1);
        map.put("app-icon", 1);
        map.put("icon-download", 1);
        map.put("logoad", 4);
        map.put("logounion", 5);
        map.put("logo-union", 9);
        map.put("dislike", 3);
        map.put(n.f39150d, 3);
        map.put("close-fill", 3);
        map.put("webview-close", 22);
        map.put("feedback-dislike", 12);
        map.put("button", 2);
        map.put("downloadWithIcon", 2);
        map.put("downloadButton", 2);
        map.put("fillButton", 2);
        map.put("laceButton", 2);
        map.put("cardButton", 2);
        map.put("colourMixtureButton", 2);
        map.put("arrowButton", 1);
        map.put("download-progress-button", 2);
        map.put("vessel", 6);
        map.put("image-group", 6);
        map.put("custom-component-vessel", 6);
        map.put("carousel", 24);
        map.put("carousel-vessel", 26);
        map.put("leisure-interact", 25);
        map.put("video-hd", 7);
        map.put("video", 7);
        map.put("video-vd", 7);
        map.put("video-sq", 7);
        map.put("muted", 10);
        map.put("star", 11);
        map.put("skip-countdowns", 19);
        map.put("skip-with-countdowns-skip-btn", 21);
        map.put("skip-with-countdowns-video-countdown", 13);
        map.put("skip-with-countdowns-skip-countdown", 20);
        map.put("skip-with-time", 14);
        map.put("skip-with-time-countdown", 13);
        map.put("skip-with-time-skip-btn", 15);
        map.put("skip", 27);
        map.put("timedown", 13);
        map.put("icon", 16);
        map.put("scoreCountWithIcon", 6);
        map.put("split-line", 18);
        map.put("creative-playable-bait", 0);
        map.put("score-count-type-2", 0);
        map.put("lottie", 28);
    }

    public String dj() {
        return this.f23368lt;
    }

    public int lt() {
        return this.f23367dj.ufy();
    }

    public lt lud() {
        return this.f23367dj;
    }

    public String sya() {
        return this.sya;
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder("DynamicLayoutBrick{type='");
        sb2.append(this.f23369zb);
        sb2.append("', data='");
        sb2.append(this.sya);
        sb2.append("', value=");
        sb2.append(this.f23367dj);
        sb2.append(", themeValue=");
        sb2.append(this.lud);
        sb2.append(", dataExtraInfo='");
        return c0.q(sb2, this.f23368lt, "'}");
    }

    public lt ul() {
        return this.lud;
    }

    public int ycx() {
        if (TextUtils.isEmpty(this.f23369zb)) {
            return 0;
        }
        if (this.f23369zb.equals("logo")) {
            String str = this.f23369zb + this.sya;
            this.f23369zb = str;
            if (str.contains("logoad")) {
                return 4;
            }
            if (this.f23369zb.contains("logounion")) {
                return 5;
            }
        }
        Map<String, Integer> map = ycx;
        if (map.get(this.f23369zb) != null) {
            return map.get(this.f23369zb).intValue();
        }
        return -1;
    }

    public String zb() {
        return this.f23369zb;
    }

    public void sya(String str) {
        this.f23368lt = str;
    }

    public void zb(String str) {
        this.sya = str;
    }

    public void zb(lt ltVar) {
        this.lud = ltVar;
    }

    public void ycx(String str) {
        this.f23369zb = str;
    }

    public void ycx(lt ltVar) {
        this.f23367dj = ltVar;
    }
}
