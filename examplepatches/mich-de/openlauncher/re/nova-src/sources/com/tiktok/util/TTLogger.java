package com.tiktok.util;

import android.util.Log;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.TikTokBusinessSdk;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public class TTLogger {
    public final TikTokBusinessSdk.LogLevel logLevel;
    private final String tag;

    public TTLogger(String str, TikTokBusinessSdk.LogLevel logLevel) {
        this.tag = wrapTag(str);
        this.logLevel = logLevel;
    }

    private String resolvedStr(String str, Object... objArr) {
        return str == null ? AbstractJsonLexerKt.NULL : objArr.length == 0 ? str : String.format(str, objArr);
    }

    private boolean shouldLog(TikTokBusinessSdk.LogLevel logLevel) {
        return this.logLevel.ordinal() >= logLevel.ordinal();
    }

    private String wrapTag(String str) {
        if (str == null) {
            str = b.f42142b;
        }
        return "TTSDK-".concat(str);
    }

    public void debug(String str, Object... objArr) {
        if (shouldLog(TikTokBusinessSdk.LogLevel.DEBUG)) {
            String strResolvedStr = resolvedStr(str, objArr);
            if (strResolvedStr.length() > 1000) {
                debug(strResolvedStr.substring(1000), new Object[0]);
            }
        }
    }

    public void error(Throwable th2, String str, Object... objArr) {
        if (shouldLog(TikTokBusinessSdk.LogLevel.INFO)) {
            Log.e(this.tag, resolvedStr(str, objArr), th2);
        }
    }

    public void info(String str, Object... objArr) {
        if (shouldLog(TikTokBusinessSdk.LogLevel.INFO)) {
            String strResolvedStr = resolvedStr(str, objArr);
            if (strResolvedStr.length() <= 1000) {
                Log.i(this.tag, strResolvedStr);
            } else {
                Log.i(this.tag, strResolvedStr.substring(0, 1000));
                info(strResolvedStr.substring(1000), new Object[0]);
            }
        }
    }

    public void warn(String str, Object... objArr) {
        if (shouldLog(TikTokBusinessSdk.LogLevel.WARN)) {
            Log.w(this.tag, resolvedStr(str, objArr));
        }
    }
}
