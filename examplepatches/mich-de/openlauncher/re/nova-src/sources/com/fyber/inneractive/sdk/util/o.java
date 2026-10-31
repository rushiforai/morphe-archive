package com.fyber.inneractive.sdk.util;

import android.app.Application;
import android.content.Context;
import android.content.pm.Signature;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Display;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.vungle.ads.internal.protos.Sdk;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

/* loaded from: classes.dex */
public abstract class o {

    /* renamed from: a, reason: collision with root package name */
    public static Application f31210a;

    public static boolean a(String str) {
        return f31210a.checkCallingOrSelfPermission(str) == 0;
    }

    public static int b() {
        Application application = f31210a;
        int i5 = (application == null || application.getResources() == null || application.getResources().getConfiguration() == null) ? 1 : application.getResources().getConfiguration().orientation;
        try {
            if (Settings.System.getInt(application.getContentResolver(), "accelerometer_rotation", 0) != 1) {
                i5 = 1;
            }
        } catch (Throwable th2) {
            IAlog.a("failed getOrientation. returning portrait orientation", th2, new Object[0]);
        }
        IAlog.a("The device orientation: %s", i5 == 1 ? "portrait" : "landscape");
        return i5;
    }

    public static int c() {
        int i5;
        WindowManager windowManager;
        Display defaultDisplay;
        if (f31210a == null || (windowManager = (WindowManager) IAConfigManager.Q.f27762v.a().getSystemService("window")) == null || (defaultDisplay = windowManager.getDefaultDisplay()) == null) {
            i5 = -1;
        } else {
            Point point = new Point();
            defaultDisplay.getSize(point);
            i5 = point.y;
        }
        if (i5 != -1) {
            return i5;
        }
        try {
            DisplayMetrics displayMetrics = Resources.getSystem().getDisplayMetrics();
            if (displayMetrics != null) {
                i5 = displayMetrics.heightPixels;
            }
        } catch (Throwable unused) {
        }
        if (i5 == -1) {
            return 480;
        }
        return i5;
    }

    public static int d() {
        int i5;
        WindowManager windowManager;
        Display defaultDisplay;
        if (f31210a == null || (windowManager = (WindowManager) IAConfigManager.Q.f27762v.a().getSystemService("window")) == null || (defaultDisplay = windowManager.getDefaultDisplay()) == null) {
            i5 = -1;
        } else {
            Point point = new Point();
            defaultDisplay.getSize(point);
            i5 = point.x;
        }
        if (i5 != -1) {
            return i5;
        }
        try {
            DisplayMetrics displayMetrics = Resources.getSystem().getDisplayMetrics();
            if (displayMetrics != null) {
                i5 = displayMetrics.widthPixels;
            }
        } catch (Throwable unused) {
        }
        return i5 == -1 ? Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE : i5;
    }

    public static String e() throws InterruptedException {
        IAConfigManager iAConfigManager;
        int i5 = 0;
        while (true) {
            iAConfigManager = IAConfigManager.Q;
            if (!iAConfigManager.f27765y.f31228a.get() || iAConfigManager.f27765y.f31231d.compareAndSet(true, true) || i5 >= 25) {
                break;
            }
            IAlog.a("UserAgentProvider | waiting on user agent", new Object[0]);
            try {
                Thread.sleep(100L);
            } catch (InterruptedException unused) {
            }
            i5++;
        }
        return iAConfigManager.f27765y.a();
    }

    public static void a(View view, Drawable drawable) {
        view.setBackground(drawable);
    }

    public static int a(int i5) {
        return Math.round(((IAConfigManager.Q.f27762v.a().getResources().getConfiguration().densityDpi / 160.0f) * i5) + 0.5f);
    }

    public static String b(String str) throws IOException {
        String string = (String) n.f31205a.get(str);
        if (TextUtils.isEmpty(string)) {
            IAlog.a("Assets cache: reading file: %s", str);
            try {
                InputStream inputStreamOpen = f31210a.getAssets().open(str, 3);
                StringBuffer stringBuffer = new StringBuffer();
                byte[] bArr = new byte[androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT];
                for (int i5 = 0; i5 != -1; i5 = inputStreamOpen.read(bArr)) {
                    stringBuffer.append(new String(bArr, 0, i5));
                }
                inputStreamOpen.close();
                string = stringBuffer.toString();
                IAlog.a("Assets cache: success - %s", str);
            } catch (IOException e3) {
                IAlog.a("Assets cache: Could not read response from file", new Object[0]);
                IAlog.e(v.b(e3), new Object[0]);
            }
            if (!TextUtils.isEmpty(string)) {
                n.f31205a.put(str, string);
            }
            return string;
        }
        IAlog.a("Assets cache: returning cached assets for %s", str);
        return string;
    }

    public static int a() {
        return ((WindowManager) IAConfigManager.Q.f27762v.a().getSystemService("window")).getDefaultDisplay().getRotation();
    }

    public static Drawable d(int i5) {
        return IAConfigManager.Q.f27762v.a().getDrawable(i5);
    }

    public static int c(int i5) {
        try {
            return (int) ((i5 / (IAConfigManager.Q.f27762v.a().getResources().getConfiguration().densityDpi / 160.0f)) + 0.5f);
        } catch (Exception unused) {
            return -1;
        }
    }

    public static int a(float f11) {
        return (int) (TypedValue.applyDimension(1, f11, IAConfigManager.Q.f27762v.a().getResources().getDisplayMetrics()) + 0.5f);
    }

    public static String a(ArrayList arrayList) {
        return String.join(",", arrayList);
    }

    public static void a(Context context, byte[] bArr) {
        FileOutputStream fileOutputStreamOpenFileOutput;
        try {
            fileOutputStreamOpenFileOutput = context.openFileOutput("session_details.json", 0);
        } catch (Throwable unused) {
            fileOutputStreamOpenFileOutput = null;
        }
        try {
            fileOutputStreamOpenFileOutput.write(bArr);
            fileOutputStreamOpenFileOutput.flush();
        } catch (Throwable unused2) {
            try {
                IAlog.a("writeFileWithContext failed writing %s", "session_details.json");
            } finally {
                v.a(fileOutputStreamOpenFileOutput);
            }
        }
    }

    public static String a(Context context) throws NoSuchAlgorithmException {
        if (context != null) {
            try {
                Signature[] signatureArr = context.getPackageManager().getPackageInfo(context.getPackageName(), 64).signatures;
                if (signatureArr.length > 0) {
                    Signature signature = signatureArr[0];
                    MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
                    messageDigest.update(signature.toByteArray());
                    byte[] bArrDigest = messageDigest.digest();
                    StringBuilder sb2 = new StringBuilder();
                    for (byte b11 : bArrDigest) {
                        String hexString = Integer.toHexString(b11 & 255);
                        if (hexString.length() == 1) {
                            sb2.append("0");
                        }
                        sb2.append(hexString);
                    }
                    return sb2.toString();
                }
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            } catch (Exception unused) {
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
        }
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public static int b(int i5) {
        return (int) (((IAConfigManager.Q.f27762v.a().getResources().getConfiguration().densityDpi / 160.0f) * i5) + 0.5f);
    }

    public static void a(View view, int i5) {
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        if (layoutParams instanceof FrameLayout.LayoutParams) {
            ((FrameLayout.LayoutParams) layoutParams).gravity = i5;
        } else if (layoutParams instanceof LinearLayout.LayoutParams) {
            ((LinearLayout.LayoutParams) layoutParams).gravity = i5;
        } else if (layoutParams instanceof RelativeLayout.LayoutParams) {
            RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) layoutParams;
            if (i5 == 17) {
                layoutParams2.addRule(13);
            } else {
                int i11 = i5 & 7;
                if (i11 == 1) {
                    layoutParams2.addRule(14);
                } else if (i11 == 3) {
                    layoutParams2.addRule(9);
                } else if (i11 == 5) {
                    layoutParams2.addRule(11);
                }
                int i12 = i5 & 112;
                if (i12 == 16) {
                    layoutParams2.addRule(15);
                } else if (i12 == 48) {
                    layoutParams2.addRule(10);
                } else if (i12 == 80) {
                    layoutParams2.addRule(12);
                }
            }
        }
        view.setLayoutParams(layoutParams);
    }

    public static Context a(View view) {
        if (view != null) {
            return view.getContext();
        }
        return f31210a;
    }

    public static void a(FrameLayout frameLayout) {
        if (Build.VERSION.SDK_INT >= 35) {
            frameLayout.setOnApplyWindowInsetsListener(new m());
        }
    }
}
