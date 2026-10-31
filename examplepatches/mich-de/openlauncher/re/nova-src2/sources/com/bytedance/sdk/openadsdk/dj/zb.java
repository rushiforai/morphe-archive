package com.bytedance.sdk.openadsdk.dj;

import com.bytedance.sdk.openadsdk.dj.sya.ycx;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/* loaded from: classes2.dex */
public class zb {
    public static final String ycx = ycx.InterfaceC0094ycx.ycx;

    /* renamed from: zb, reason: collision with root package name */
    public static final String f26768zb = ycx.InterfaceC0094ycx.f26669zb;
    public static final String sya = ycx.InterfaceC0094ycx.sya;

    /* renamed from: dj, reason: collision with root package name */
    public static final String f26765dj = ycx.InterfaceC0094ycx.f26667dj;
    public static final String lud = ycx.InterfaceC0094ycx.lud;

    /* renamed from: lt, reason: collision with root package name */
    public static final String f26766lt = ycx.InterfaceC0094ycx.f26668lt;

    /* renamed from: ul, reason: collision with root package name */
    public static final Set<String> f26767ul = new HashSet(Arrays.asList(TTEDPEventConstants.EDP_EVENT_NAME_CLICK, "show", "insight_log"));

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        public static String f26769dj = "saLandingPageLinks";
        public static String sya = "direct";
        public static String ycx = "openDetailPage";

        /* renamed from: zb, reason: collision with root package name */
        public static String f26770zb = "openAdLandPageLinks";
    }

    /* renamed from: com.bytedance.sdk.openadsdk.dj.zb$zb, reason: collision with other inner class name */
    public static class C0100zb {
        public static int sya = 100;
        public static int ycx = 1;

        /* renamed from: zb, reason: collision with root package name */
        public static int f26771zb = 2;
    }

    public static boolean ycx(String str) {
        return "embeded_ad".equals(str) || "banner_ad".equals(str) || "interaction".equals(str) || "slide_banner_ad".equals(str);
    }
}
