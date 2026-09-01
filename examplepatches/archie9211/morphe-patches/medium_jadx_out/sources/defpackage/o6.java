package defpackage;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.job.JobParameters;
import android.content.Context;
import android.content.res.Configuration;
import android.icu.text.DecimalFormatSymbols;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.os.Build;
import android.os.LocaleList;
import android.os.UserManager;
import android.provider.Settings;
import android.text.Html;
import android.text.Spanned;
import android.view.inputmethod.EditorInfo;
import j$.util.stream.IntStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Locale;
import java.util.MissingResourceException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class o6 {
    public static boolean a(NotificationManager notificationManager) {
        return notificationManager.areNotificationsEnabled();
    }

    public static IntStream b(CharSequence charSequence) {
        return IntStream.VivifiedWrapper.convert(charSequence.chars());
    }

    public static IntStream c(CharSequence charSequence) {
        return IntStream.VivifiedWrapper.convert(charSequence.codePoints());
    }

    public static Context d(Context context) {
        return context.createDeviceProtectedStorageContext();
    }

    public static Context e(Context context) {
        return context.createDeviceProtectedStorageContext();
    }

    public static LocaleList f(Locale... localeArr) {
        return new LocaleList(localeArr);
    }

    public static Spanned g(String str) {
        return Html.fromHtml(str, 63, null, null);
    }

    public static LocaleList h() {
        return LocaleList.getDefault();
    }

    public static DecimalFormatSymbols i(Locale locale) {
        return DecimalFormatSymbols.getInstance(locale);
    }

    public static LocaleList j(Configuration configuration) {
        return configuration.getLocales();
    }

    public static String[] k(JobParameters jobParameters) {
        return jobParameters.getTriggeredContentAuthorities();
    }

    public static Uri[] l(JobParameters jobParameters) {
        return jobParameters.getTriggeredContentUris();
    }

    public static boolean m(Context context) {
        return context.isDeviceProtectedStorage();
    }

    public static boolean n(Activity activity) {
        return activity.isInMultiWindowMode();
    }

    public static boolean o(Context context) {
        return ((UserManager) context.getSystemService(UserManager.class)).isUserUnlocked();
    }

    public static rqd p(Context context, o08 o08Var, zk2 zk2Var, fh5 fh5Var, sb2 sb2Var) throws IOException {
        o08Var.getClass();
        zk2Var.getClass();
        sb2Var.getClass();
        int i = Build.VERSION.SDK_INT;
        Locale locale = i >= 24 ? LocaleList.getDefault().get(0) : Locale.getDefault();
        String string = Settings.Secure.getString(context.getContentResolver(), "android_id");
        String iSO3Country = "";
        String str = string == null ? "" : string;
        String strF0 = bu1.F0(d46.R(Build.PRODUCT, Build.DEVICE, Build.MODEL, Build.VERSION.CODENAME, Integer.valueOf(i)), ",", null, null, null, 62);
        String country = locale.getCountry();
        country.getClass();
        try {
            iSO3Country = locale.getISO3Country();
        } catch (MissingResourceException e) {
            wld.a.e(e, ev6.x("Locale ", locale.getDisplayCountry(), " doesn't have an ISO country"), new Object[0]);
        }
        String str2 = iSO3Country;
        str2.getClass();
        return new rqd(fh5Var, o08Var, zk2Var, str, strF0, country, str2, sb2Var);
    }

    public static final void q(ConnectivityManager connectivityManager, ConnectivityManager.NetworkCallback networkCallback) {
        connectivityManager.getClass();
        networkCallback.getClass();
        connectivityManager.registerDefaultNetworkCallback(networkCallback);
    }

    public static void r(Notification.Action.Builder builder) {
        builder.setAllowGeneratedReplies(true);
    }

    public static void s(EditorInfo editorInfo, h67 h67Var) {
        if (g76.L(h67Var, h67.c)) {
            editorInfo.hintLocales = null;
            return;
        }
        ArrayList arrayList = new ArrayList(cu1.k0(h67Var, 10));
        Iterator it2 = h67Var.a.iterator();
        while (it2.hasNext()) {
            arrayList.add(((f67) it2.next()).a);
        }
        Locale[] localeArr = (Locale[]) arrayList.toArray(new Locale[0]);
        editorInfo.hintLocales = new LocaleList((Locale[]) Arrays.copyOf(localeArr, localeArr.length));
    }

    public static void t(Notification.Builder builder) {
        builder.setRemoteInputHistory(null);
    }

    public static void u(ys ysVar, h67 h67Var) {
        ArrayList arrayList = new ArrayList(cu1.k0(h67Var, 10));
        Iterator it2 = h67Var.a.iterator();
        while (it2.hasNext()) {
            arrayList.add(((f67) it2.next()).a);
        }
        Locale[] localeArr = (Locale[]) arrayList.toArray(new Locale[0]);
        ysVar.setTextLocales(new LocaleList((Locale[]) Arrays.copyOf(localeArr, localeArr.length)));
    }
}
