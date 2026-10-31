package v80;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import b.c0;
import java.util.List;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.api_integration.AskPermissionActivity;
import org.jetbrains.annotations.NotNull;
import s80.d;
import s80.e;
import t70.m0;
import t70.y0;

/* loaded from: classes5.dex */
public final class b implements s80.a, d {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: c, reason: collision with root package name */
    public static final List f92215c = ul.b.Q("application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/vnd.oasis.opendocument.spreadsheet", "application/vnd.google-apps.spreadsheet");

    /* renamed from: d, reason: collision with root package name */
    public static final List f92216d = ul.b.Q("application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "application/vnd.oasis.opendocument.text", "application/vnd.google-apps.document");

    /* renamed from: e, reason: collision with root package name */
    public static final List f92217e = ul.b.Q("application/vnd.ms-powerpoint", "application/vnd.openxmlformats-officedocument.presentationml.presentation", "application/vnd.oasis.opendocument.presentation", "application/vnd.google-apps.presentation");

    /* renamed from: f, reason: collision with root package name */
    public static final List f92218f = ul.b.Q("application/zip", "application/vnd.rar");

    /* renamed from: a, reason: collision with root package name */
    public final Context f92219a;

    /* renamed from: b, reason: collision with root package name */
    public final String f92220b;

    public b(Context context) {
        Intrinsics.g(context, "context");
        this.f92219a = context;
        this.f92220b = c0.E(context.getPackageName(), ".searchResultFileProvider");
    }

    @Override // s80.c
    public final e a() {
        return e.f86765a;
    }

    @Override // s80.a
    public final Intent b(Activity activity) {
        int i5 = Build.VERSION.SDK_INT;
        if (i5 < 30) {
            AskPermissionActivity.Companion.getClass();
            return s80.b.a(activity, new String[]{"android.permission.READ_EXTERNAL_STORAGE"});
        }
        if (i5 >= 33) {
            AskPermissionActivity.Companion.getClass();
            return s80.b.a(activity, new String[]{"android.permission.READ_MEDIA_IMAGES", "android.permission.READ_MEDIA_VIDEO", "android.permission.READ_MEDIA_AUDIO"});
        }
        AskPermissionActivity.Companion.getClass();
        return s80.b.a(activity, new String[]{"android.permission.READ_EXTERNAL_STORAGE"});
    }

    @Override // s80.a
    public final String c(Context context) {
        Intrinsics.g(context, "context");
        String string = context.getString(2132019549);
        Intrinsics.f(string, "getString(...)");
        return string;
    }

    @Override // s80.c
    public final String d() {
        return "com.google.android.apps.nbu.files";
    }

    @Override // s80.d
    public final Object e(ContinuationImpl continuationImpl) {
        a80.e eVar = y0.f88884a;
        return m0.y(a80.d.f488c, new iv.b(this, null, 27), continuationImpl);
    }

    @Override // s80.a
    public final Object f(int i5, Intent intent, Continuation continuation) {
        return Boolean.valueOf(g());
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0041 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0042 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean g() {
        int i5 = Build.VERSION.SDK_INT;
        Context context = this.f92219a;
        if (i5 >= 30) {
            if (i5 >= 33) {
                return (o4.a.a(context, "android.permission.READ_MEDIA_AUDIO") == 0) || (o4.a.a(context, "android.permission.READ_MEDIA_AUDIO") == 0) || (o4.a.a(context, "android.permission.READ_MEDIA_AUDIO") == 0);
            }
            if (o4.a.a(context, "android.permission.READ_EXTERNAL_STORAGE") == 0) {
            }
        } else if (o4.a.a(context, "android.permission.READ_EXTERNAL_STORAGE") == 0) {
        }
    }
}
