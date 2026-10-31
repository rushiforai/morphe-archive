package com.tiktok.appevents.edp;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.TextView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.TikTokBusinessSdk;
import com.tiktok.appevents.edp.proxy.ITouchListener;
import com.tiktok.appevents.edp.proxy.TouchProxyHelper;
import com.tiktok.util.JSON;
import com.tiktok.util.RegexUtil;
import java.lang.ref.WeakReference;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class TTHierarchyHelper {
    public static volatile Handler mHandler;

    /* renamed from: com.tiktok.appevents.edp.TTHierarchyHelper$1, reason: invalid class name */
    public static class AnonymousClass1 implements ITouchListener {
        long touchDown = 0;
        final /* synthetic */ Activity val$act;
        final /* synthetic */ View val$view;

        public AnonymousClass1(Activity activity, View view) {
            this.val$act = activity;
            this.val$view = view;
        }

        @Override // com.tiktok.appevents.edp.proxy.ITouchListener
        public boolean onTouch(final View view, MotionEvent motionEvent) {
            String string = b.f42142b;
            if (!EDPConfig.enable_click_track) {
                return false;
            }
            Activity activity = this.val$act;
            if (activity != null && !activity.isFinishing() && !this.val$act.isDestroyed()) {
                if (this.val$view == null || view == null) {
                    return false;
                }
                int action = motionEvent.getAction();
                try {
                    if (action == 0) {
                        this.touchDown = System.currentTimeMillis();
                    } else if (action == 1) {
                        Activity activity2 = this.val$act;
                        if (activity2 != null && !activity2.isFinishing() && !this.val$act.isDestroyed()) {
                            if (EDPConfig.button_black_list.contains(view.getClass().getCanonicalName())) {
                                return false;
                            }
                            if (TTEDPEventTrack.checkUpload() && !TTEDPEventTrack.isSending) {
                                if (System.currentTimeMillis() - TTEDPEventTrack.LAST_CLICK_TS <= EDPConfig.time_diff_frequency_control * 1000.0d) {
                                    return false;
                                }
                                TTEDPEventTrack.isSending = true;
                                final String canonicalName = view.getClass().getCanonicalName();
                                final float rawX = motionEvent.getRawX();
                                final float rawY = motionEvent.getRawY();
                                final View decorView = this.val$act.getWindow().getDecorView();
                                final int measuredWidth = view.getMeasuredWidth();
                                final int measuredHeight = view.getMeasuredHeight();
                                try {
                                    if (view instanceof TextView) {
                                        string = ((TextView) view).getText().toString();
                                    }
                                } catch (Throwable unused) {
                                }
                                final String str = string;
                                TikTokBusinessSdk.getAppEventLogger().addToQ(new Runnable() { // from class: com.tiktok.appevents.edp.TTHierarchyHelper.1.1
                                    @Override // java.lang.Runnable
                                    public void run() {
                                        Activity activity3;
                                        if (EDPConfig.enable_click_track && (activity3 = AnonymousClass1.this.val$act) != null && !activity3.isFinishing() && !AnonymousClass1.this.val$act.isDestroyed()) {
                                            AnonymousClass1 anonymousClass1 = AnonymousClass1.this;
                                            if (anonymousClass1.val$view != null && view != null) {
                                                TTEDPEventTrack.trackClick(canonicalName, rawX, rawY, measuredWidth, measuredHeight, str, anonymousClass1.val$act.getClass().getSimpleName(), TTHierarchyHelper.getViewHierarchy(new WeakReference(decorView), EDPConfig.page_detail_upload_deep_count), TTHierarchyHelper.getViewHierarchyCount(new WeakReference(decorView)), System.currentTimeMillis() - AnonymousClass1.this.touchDown);
                                                TTEDPEventTrack.isSending = false;
                                            }
                                        }
                                    }
                                });
                            }
                        }
                        return false;
                    }
                } catch (Throwable unused2) {
                }
            }
            return false;
        }
    }

    public static Handler getHandler() {
        if (mHandler == null) {
            synchronized (TTHierarchyHelper.class) {
                try {
                    if (mHandler == null) {
                        mHandler = new Handler(Looper.getMainLooper());
                    }
                } finally {
                }
            }
        }
        return mHandler;
    }

    public static JSONObject getViewHierarchy(WeakReference<View> weakReference, int i5) {
        JSONObject jSONObjectBuild = JSON.build();
        if (i5 > 0) {
            try {
                View view = weakReference.get();
                if (view != null) {
                    JSON.putObject(jSONObjectBuild, TTEDPEventConstants.EDP_EVENT_PROPERTY_CLASS_NAME, view.getClass().getCanonicalName());
                    if (view instanceof TextView) {
                        String strReplaceAllToHash = b.f42142b;
                        if (((TextView) view).getText() != null) {
                            strReplaceAllToHash = ((TextView) view).getText().toString();
                        }
                        if (!TextUtils.isEmpty(strReplaceAllToHash)) {
                            strReplaceAllToHash = RegexUtil.replaceAllToHash(EDPConfig.sensig_filtering_regex_list, strReplaceAllToHash);
                        }
                        JSON.putObject(jSONObjectBuild, "text", strReplaceAllToHash);
                        JSON.putDouble(jSONObjectBuild, "font_size", ((TextView) view).getTextSize());
                    }
                    int[] iArr = new int[2];
                    view.getLocationOnScreen(iArr);
                    JSON.putInt(jSONObjectBuild, "left", iArr[0]);
                    JSON.putInt(jSONObjectBuild, "top", iArr[1]);
                    JSON.putInt(jSONObjectBuild, "width", view.getMeasuredWidth());
                    JSON.putInt(jSONObjectBuild, "height", view.getMeasuredHeight());
                    JSON.putInt(jSONObjectBuild, "scroll_x", view.getScrollX());
                    JSON.putInt(jSONObjectBuild, "scroll_y", view.getScrollY());
                    if (view instanceof ViewGroup) {
                        JSONArray jSONArrayBuildArr = JSON.buildArr();
                        ViewGroup viewGroup = (ViewGroup) view;
                        int childCount = viewGroup.getChildCount();
                        for (int i11 = 0; i11 < childCount; i11++) {
                            JSON.putArr(jSONArrayBuildArr, getViewHierarchy(new WeakReference(viewGroup.getChildAt(i11)), i5 - 1));
                        }
                        JSON.putObject(jSONObjectBuild, "child_views", jSONArrayBuildArr);
                    }
                }
            } catch (Throwable unused) {
            }
        }
        return jSONObjectBuild;
    }

    public static int getViewHierarchyCount(WeakReference<View> weakReference) {
        if (weakReference == null) {
            return 0;
        }
        try {
            View view = weakReference.get();
            if (view == null) {
                return 0;
            }
            if (!(view instanceof ViewGroup)) {
                return 1;
            }
            ViewGroup viewGroup = (ViewGroup) view;
            int childCount = viewGroup.getChildCount();
            int iMax = 1;
            for (int i5 = 0; i5 < childCount; i5++) {
                iMax = Math.max(getViewHierarchyCount(new WeakReference(viewGroup.getChildAt(i5))) + 1, iMax);
            }
            return iMax;
        } catch (Throwable unused) {
            return 0;
        }
    }

    public static int getViewHierarchyCountAndRegisterOnTouch(final WeakReference<View> weakReference, final WeakReference<Activity> weakReference2) {
        final View view;
        try {
            Activity activity = weakReference2.get();
            if (activity == null || activity.isFinishing() || activity.isDestroyed() || (view = weakReference.get()) == null) {
                return 0;
            }
            if (EDPConfig.enable_click_track) {
                getHandler().post(new Runnable() { // from class: com.tiktok.appevents.edp.TTHierarchyHelper.2
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            TTHierarchyHelper.proxyOnTouch(weakReference, weakReference2);
                        } catch (Throwable unused) {
                        }
                    }
                });
            }
            if (EDPConfig.enable_webview_request_track && (view instanceof WebView)) {
                getHandler().post(new Runnable() { // from class: com.tiktok.appevents.edp.TTHierarchyHelper.3
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            if (EDPConfig.enable_webview_request_track) {
                                String originalUrl = ((WebView) view).getOriginalUrl();
                                if (TextUtils.isEmpty(originalUrl)) {
                                    return;
                                }
                                TTEDPEventTrack.trackWebviewRequest(originalUrl);
                            }
                        } catch (Throwable unused) {
                        }
                    }
                });
            }
            if (!(view instanceof ViewGroup)) {
                return 1;
            }
            ViewGroup viewGroup = (ViewGroup) view;
            int childCount = viewGroup.getChildCount();
            int iMax = 1;
            for (int i5 = 0; i5 < childCount; i5++) {
                iMax = Math.max(getViewHierarchyCountAndRegisterOnTouch(new WeakReference(viewGroup.getChildAt(i5)), weakReference2) + 1, iMax);
            }
            viewGroup.setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() { // from class: com.tiktok.appevents.edp.TTHierarchyHelper.4
                @Override // android.view.ViewGroup.OnHierarchyChangeListener
                public void onChildViewAdded(View view2, View view3) {
                    try {
                        TTHierarchyHelper.getViewHierarchyCountAndRegisterOnTouch(new WeakReference(view3), weakReference2);
                    } catch (Throwable unused) {
                    }
                }

                @Override // android.view.ViewGroup.OnHierarchyChangeListener
                public void onChildViewRemoved(View view2, View view3) {
                }
            });
            return iMax;
        } catch (Throwable unused) {
        }
        return 0;
    }

    public static void proxyOnTouch(WeakReference<View> weakReference, WeakReference<Activity> weakReference2) {
        View view;
        Activity activity;
        try {
            if (EDPConfig.enable_click_track && weakReference != null && (view = weakReference.get()) != null && (activity = weakReference2.get()) != null && !activity.isFinishing() && !activity.isDestroyed()) {
                TouchProxyHelper.proxy(weakReference, new AnonymousClass1(activity, view));
            }
        } catch (Throwable unused) {
        }
    }
}
