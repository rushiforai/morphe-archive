package com.instabridge.mobilesdk.internal.esim;

import android.annotation.SuppressLint;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import android.telephony.CarrierConfigManager;
import android.telephony.SubscriptionInfo;
import android.telephony.SubscriptionManager;
import android.telephony.TelephonyManager;
import android.telephony.ims.ImsManager;
import android.telephony.ims.ImsMmTelManager;
import com.instabridge.mobilesdk.internal.Logger;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import r70.i;

@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010$\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0001\u0018\u0000 $2\u00020\u0001:\u0001$B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u0014\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\tJ\u0006\u0010\n\u001a\u00020\u000bJ\u0017\u0010\f\u001a\u00020\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0003¢\u0006\u0002\u0010\u0010J'\u0010\u0011\u001a\u0012\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u0005\u0018\u00010\t2\b\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0002¢\u0006\u0002\u0010\u0012J\u0017\u0010\u0013\u001a\u00020\u000b2\b\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0003¢\u0006\u0002\u0010\u0014J\u0017\u0010\u0015\u001a\u00020\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0003¢\u0006\u0002\u0010\u0010J\u0017\u0010\u0016\u001a\u00020\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0003¢\u0006\u0002\u0010\u0010J\u0017\u0010\u0017\u001a\u00020\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0003¢\u0006\u0002\u0010\u0010J\u0017\u0010\u0018\u001a\u00020\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0003¢\u0006\u0002\u0010\u0010J\u0010\u0010\u0019\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0003J\u000f\u0010\u001a\u001a\u0004\u0018\u00010\u000fH\u0003¢\u0006\u0002\u0010\u001bJ\u001f\u0010\u001c\u001a\u00020\u000b2\u0006\u0010\u001d\u001a\u00020\u00052\f\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\u000b0\u001fH\u0082\bJ\u001f\u0010 \u001a\u00020\r2\u0006\u0010\u001d\u001a\u00020\u00052\f\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\r0\u001fH\u0082\bJ.\u0010!\u001a\u0004\u0018\u0001H\"\"\u0004\b\u0000\u0010\"2\u0006\u0010\u001d\u001a\u00020\u00052\u000e\u0010\u001e\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001H\"0\u001fH\u0082\b¢\u0006\u0002\u0010#R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006%"}, d2 = {"Lcom/instabridge/mobilesdk/internal/esim/CarrierConfigurator;", b.f42142b, "appContext", "Landroid/content/Context;", "operatorName", b.f42142b, "<init>", "(Landroid/content/Context;Ljava/lang/String;)V", "configureAfterInstall", b.f42142b, "openVoLteSettings", b.f42142b, "configureApn", b.f42142b, "subId", b.f42142b, "(Ljava/lang/Integer;)Z", "preferredApn", "(Ljava/lang/Integer;)Ljava/util/Map;", "reloadCarrierConfig", "(Ljava/lang/Integer;)V", "setLteOnly", "isLteOnlySet", "setOperatorBrand", "configureVoLte", "isVoLteEnabled", "privilegedSubscriptionId", "()Ljava/lang/Integer;", "runSafely", "label", "block", "Lkotlin/Function0;", "step", "stepOrNull", "T", "(Ljava/lang/String;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class CarrierConfigurator {

    @Deprecated
    @NotNull
    public static final String APN_APN = "internet";

    @Deprecated
    @NotNull
    public static final String APN_MCC = "314";

    @Deprecated
    @NotNull
    public static final String APN_MNC = "720";

    @Deprecated
    @NotNull
    public static final String APN_NAME = "OXIO";

    @Deprecated
    @NotNull
    public static final String APN_PROTOCOL = "IPv4/IPv6";

    @Deprecated
    @NotNull
    public static final String APN_ROAMING_PROTOCOL = "IPv4/IPv6";

    @Deprecated
    @NotNull
    public static final String APN_TYPE = "default";

    @NotNull
    private static final Uri CARRIERS_URI;

    @Deprecated
    @NotNull
    public static final String ENHANCED_4G_MODE_KEY = "enhanced_4g_mode_enabled";

    @NotNull
    private static final Uri PREFER_APN_URI;

    @Deprecated
    @NotNull
    public static final String VOLTE_VT_ENABLED_KEY = "volte_vt_enabled";

    @NotNull
    private final Context appContext;

    @NotNull
    private final String operatorName;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u000e\u001a\u00020\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0012\u001a\u00020\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0011¨\u0006\u0014"}, d2 = {"Lcom/instabridge/mobilesdk/internal/esim/CarrierConfigurator$Companion;", b.f42142b, "<init>", "()V", "APN_NAME", b.f42142b, "APN_APN", "APN_MCC", "APN_MNC", "APN_TYPE", "APN_PROTOCOL", "APN_ROAMING_PROTOCOL", "VOLTE_VT_ENABLED_KEY", "ENHANCED_4G_MODE_KEY", "CARRIERS_URI", "Landroid/net/Uri;", "getCARRIERS_URI", "()Landroid/net/Uri;", "PREFER_APN_URI", "getPREFER_APN_URI", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final Uri getCARRIERS_URI() {
            return CarrierConfigurator.CARRIERS_URI;
        }

        @NotNull
        public final Uri getPREFER_APN_URI() {
            return CarrierConfigurator.PREFER_APN_URI;
        }

        private Companion() {
        }
    }

    static {
        Uri uri = Uri.parse("content://telephony/carriers");
        Intrinsics.f(uri, "parse(...)");
        CARRIERS_URI = uri;
        Uri uri2 = Uri.parse("content://telephony/carriers/preferapn");
        Intrinsics.f(uri2, "parse(...)");
        PREFER_APN_URI = uri2;
    }

    public CarrierConfigurator(@NotNull Context appContext, @NotNull String operatorName) {
        Intrinsics.g(appContext, "appContext");
        Intrinsics.g(operatorName, "operatorName");
        this.appContext = appContext;
        this.operatorName = operatorName;
    }

    @SuppressLint({"InlinedApi"})
    private final boolean configureApn(Integer subId) throws IOException {
        Long lValueOf;
        String lastPathSegment;
        Uri uri;
        if (subId == null) {
            Logger.INSTANCE.d("APN config skipped: no carrier-privileged subscription");
            return false;
        }
        ContentResolver contentResolver = this.appContext.getContentResolver();
        ContentValues contentValues = new ContentValues();
        contentValues.put(PendingUpgradeStore.KEY_NAME, APN_NAME);
        contentValues.put("apn", APN_APN);
        contentValues.put("mcc", APN_MCC);
        contentValues.put("mnc", APN_MNC);
        contentValues.put("numeric", r70.k.Y0(3, APN_MCC) + r70.k.Y0(2, APN_MNC));
        contentValues.put("carrier_enabled", (Integer) 1);
        contentValues.put(TTConst.TRACK_TYPE, APN_TYPE);
        contentValues.put("protocol", "IPv4/IPv6");
        contentValues.put("roaming_protocol", "IPv4/IPv6");
        int i5 = Build.VERSION.SDK_INT;
        if (i5 >= 29) {
            contentValues.put("sub_id", subId);
        }
        Uri uri2 = CARRIERS_URI;
        Cursor cursorQuery = contentResolver.query(uri2, new String[]{"_id"}, "apn=? AND mcc=? AND mnc=?", new String[]{APN_APN, APN_MCC, APN_MNC}, null);
        if (cursorQuery != null) {
            try {
                lValueOf = cursorQuery.moveToFirst() ? Long.valueOf(cursorQuery.getLong(cursorQuery.getColumnIndexOrThrow("_id"))) : null;
                cursorQuery.close();
            } finally {
            }
        } else {
            lValueOf = null;
        }
        if (lValueOf != null) {
            contentResolver.update(Uri.withAppendedPath(uri2, lValueOf.toString()), contentValues, null, null);
        } else {
            Uri uriInsert = contentResolver.insert(uri2, contentValues);
            lValueOf = (uriInsert == null || (lastPathSegment = uriInsert.getLastPathSegment()) == null) ? null : i.v0(lastPathSegment);
        }
        if (lValueOf == null) {
            Logger.e$default(Logger.INSTANCE, "APN insert/update failed — likely missing carrier privileges", null, 2, null);
            return false;
        }
        if (i5 >= 29) {
            uri = Uri.parse("content://telephony/carriers/preferapn/subId/" + subId);
        } else {
            uri = PREFER_APN_URI;
        }
        contentResolver.delete(uri, null, null);
        ContentValues contentValues2 = new ContentValues();
        contentValues2.put("apn_id", lValueOf);
        contentValues2.put("sub_id", subId);
        Unit unit = Unit.f71706a;
        if (contentResolver.insert(uri, contentValues2) == null) {
            Logger.e$default(Logger.INSTANCE, "Preferred APN set failed — likely missing carrier privileges", null, 2, null);
            return false;
        }
        Logger.INSTANCE.d("APN configured + set as preferred for sub " + subId);
        reloadCarrierConfig(subId);
        return true;
    }

    @SuppressLint({"MissingPermission"})
    private final boolean configureVoLte(Integer subId) {
        Object objA;
        if (subId == null) {
            Logger.INSTANCE.d("VoLTE step skipped: no carrier-privileged subscription");
            return false;
        }
        try {
            int i5 = Result.f71687b;
            Settings.Global.putInt(this.appContext.getContentResolver(), VOLTE_VT_ENABLED_KEY, 1);
            objA = Boolean.valueOf(Settings.Global.putInt(this.appContext.getContentResolver(), ENHANCED_4G_MODE_KEY, 1));
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            Logger.INSTANCE.d("VoLTE Settings write skipped: " + thA.getMessage());
        }
        boolean zIsVoLteEnabled = isVoLteEnabled(subId.intValue());
        Logger.INSTANCE.d("VoLTE enabled=" + zIsVoLteEnabled + " for sub " + subId);
        return zIsVoLteEnabled;
    }

    @SuppressLint({"InlinedApi", "MissingPermission"})
    private final boolean isLteOnlySet(Integer subId) {
        TelephonyManager telephonyManager;
        TelephonyManager telephonyManagerCreateForSubscriptionId;
        return (Build.VERSION.SDK_INT < 31 || subId == null || (telephonyManager = (TelephonyManager) this.appContext.getSystemService(TelephonyManager.class)) == null || (telephonyManagerCreateForSubscriptionId = telephonyManager.createForSubscriptionId(subId.intValue())) == null || telephonyManagerCreateForSubscriptionId.getAllowedNetworkTypesForReason(2) != 4096) ? false : true;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x002c A[Catch: all -> 0x0020, TryCatch #0 {all -> 0x0020, blocks: (B:3:0x0002, B:5:0x000b, B:7:0x001b, B:12:0x0025, B:22:0x0050, B:15:0x002c, B:18:0x003c), top: B:30:0x0002 }] */
    @SuppressLint({"MissingPermission"})
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final boolean isVoLteEnabled(int subId) {
        Object objA;
        try {
            int i5 = Result.f71687b;
            boolean z11 = true;
            if (Build.VERSION.SDK_INT < 30) {
                ContentResolver contentResolver = this.appContext.getContentResolver();
                if (Settings.Global.getInt(contentResolver, ENHANCED_4G_MODE_KEY, 0) != 1) {
                    if (Settings.Global.getInt(contentResolver, "enhanced_4g_mode_enabled_" + subId, 0) != 1) {
                        z11 = false;
                    }
                }
                objA = Boolean.valueOf(z11);
            } else {
                ImsManager imsManagerH = bc.a.h(this.appContext.getSystemService(bc.a.m()));
                ImsMmTelManager imsMmTelManager = imsManagerH != null ? imsManagerH.getImsMmTelManager(subId) : null;
                if (imsMmTelManager == null || !imsMmTelManager.isAdvancedCallingSettingEnabled()) {
                }
                objA = Boolean.valueOf(z11);
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Object obj = Boolean.FALSE;
        if (objA instanceof Result.Failure) {
            objA = obj;
        }
        return ((Boolean) objA).booleanValue();
    }

    private final Map<String, String> preferredApn(Integer subId) throws IOException {
        Uri uri;
        Map<String, String> mapJ0 = null;
        if (subId == null) {
            return null;
        }
        ContentResolver contentResolver = this.appContext.getContentResolver();
        if (Build.VERSION.SDK_INT >= 29) {
            uri = Uri.parse("content://telephony/carriers/preferapn/subId/" + subId);
        } else {
            uri = PREFER_APN_URI;
        }
        Cursor cursorQuery = contentResolver.query(uri, new String[]{"_id"}, null, null, null);
        if (cursorQuery != null) {
            try {
                Long lValueOf = cursorQuery.moveToFirst() ? Long.valueOf(cursorQuery.getLong(cursorQuery.getColumnIndexOrThrow("_id"))) : null;
                cursorQuery.close();
                if (lValueOf != null) {
                    cursorQuery = contentResolver.query(Uri.withAppendedPath(CARRIERS_URI, String.valueOf(lValueOf.longValue())), null, null, null, null);
                    if (cursorQuery == null) {
                        return null;
                    }
                    try {
                        if (cursorQuery.moveToFirst()) {
                            mapJ0 = MapsKt.j0(new Pair("apn_name", preferredApn$lambda$16$value(cursorQuery, PendingUpgradeStore.KEY_NAME)), new Pair("apn", preferredApn$lambda$16$value(cursorQuery, "apn")), new Pair("apn_mcc", preferredApn$lambda$16$value(cursorQuery, "mcc")), new Pair("apn_mnc", preferredApn$lambda$16$value(cursorQuery, "mnc")), new Pair("apn_type", preferredApn$lambda$16$value(cursorQuery, TTConst.TRACK_TYPE)), new Pair("apn_protocol", preferredApn$lambda$16$value(cursorQuery, "protocol")), new Pair("apn_roaming_protocol", preferredApn$lambda$16$value(cursorQuery, "roaming_protocol")));
                        }
                        cursorQuery.close();
                        return mapJ0;
                    } finally {
                    }
                }
            } finally {
                try {
                    throw th;
                } finally {
                }
            }
        }
        return null;
    }

    private static final String preferredApn$lambda$16$value(Cursor cursor, String str) {
        int columnIndex = cursor.getColumnIndex(str);
        if (columnIndex < 0 || cursor.isNull(columnIndex)) {
            return null;
        }
        return cursor.getString(columnIndex);
    }

    @SuppressLint({"MissingPermission"})
    private final Integer privilegedSubscriptionId() {
        SubscriptionManager subscriptionManager;
        Object objA;
        Object next;
        TelephonyManager telephonyManager = (TelephonyManager) this.appContext.getSystemService(TelephonyManager.class);
        if (telephonyManager == null || (subscriptionManager = (SubscriptionManager) this.appContext.getSystemService(SubscriptionManager.class)) == null) {
            return null;
        }
        try {
            int i5 = Result.f71687b;
            objA = subscriptionManager.getAccessibleSubscriptionInfoList();
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        Iterable iterable = (List) objA;
        if (iterable == null) {
            iterable = EmptyList.f71733a;
        }
        Iterator it = iterable.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (telephonyManager.createForSubscriptionId(((SubscriptionInfo) next).getSubscriptionId()).hasCarrierPrivileges()) {
                break;
            }
        }
        SubscriptionInfo subscriptionInfo = (SubscriptionInfo) next;
        if (subscriptionInfo != null) {
            return Integer.valueOf(subscriptionInfo.getSubscriptionId());
        }
        return null;
    }

    @SuppressLint({"MissingPermission"})
    private final void reloadCarrierConfig(Integer subId) {
        if (subId == null) {
            Logger.INSTANCE.d("Carrier config reload skipped: no carrier-privileged subscription");
            return;
        }
        CarrierConfigManager carrierConfigManager = (CarrierConfigManager) this.appContext.getSystemService(CarrierConfigManager.class);
        if (carrierConfigManager == null) {
            return;
        }
        carrierConfigManager.notifyConfigChangedForSubId(subId.intValue());
        Logger.INSTANCE.d("Carrier config reload requested for sub " + subId);
    }

    private final void runSafely(String label, Function0<Unit> block) {
        try {
            block.invoke();
        } catch (Throwable th2) {
            if (!(th2 instanceof SecurityException)) {
                Logger.INSTANCE.e(label + " failed", th2);
                return;
            }
            Logger.INSTANCE.d(label + " skipped: " + th2.getMessage());
        }
    }

    @SuppressLint({"InlinedApi", "MissingPermission"})
    private final boolean setLteOnly(Integer subId) {
        TelephonyManager telephonyManagerCreateForSubscriptionId;
        if (Build.VERSION.SDK_INT < 31) {
            Logger.INSTANCE.d("LTE-only set skipped: setAllowedNetworkTypesForReason requires API 31+");
            return false;
        }
        if (subId == null) {
            Logger.INSTANCE.d("LTE-only set skipped: no carrier-privileged subscription");
            return false;
        }
        TelephonyManager telephonyManager = (TelephonyManager) this.appContext.getSystemService(TelephonyManager.class);
        if (telephonyManager == null || (telephonyManagerCreateForSubscriptionId = telephonyManager.createForSubscriptionId(subId.intValue())) == null) {
            return false;
        }
        telephonyManagerCreateForSubscriptionId.setAllowedNetworkTypesForReason(2, 4096L);
        Logger.INSTANCE.d("LTE-only network type applied to sub " + subId);
        return true;
    }

    @SuppressLint({"MissingPermission"})
    private final boolean setOperatorBrand(Integer subId) {
        TelephonyManager telephonyManagerCreateForSubscriptionId;
        if (subId == null) {
            Logger.INSTANCE.d("Operator brand override skipped: no carrier-privileged subscription");
            return false;
        }
        TelephonyManager telephonyManager = (TelephonyManager) this.appContext.getSystemService(TelephonyManager.class);
        if (telephonyManager == null || (telephonyManagerCreateForSubscriptionId = telephonyManager.createForSubscriptionId(subId.intValue())) == null) {
            return false;
        }
        telephonyManagerCreateForSubscriptionId.setOperatorBrandOverride(this.operatorName);
        Logger.INSTANCE.d("Operator brand override set to \"" + this.operatorName + "\" for sub " + subId);
        return true;
    }

    private final boolean step(String label, Function0<Boolean> block) {
        try {
            return ((Boolean) block.invoke()).booleanValue();
        } catch (Throwable th2) {
            if (!(th2 instanceof SecurityException)) {
                Logger.INSTANCE.e(label + " failed", th2);
                return false;
            }
            Logger.INSTANCE.d(label + " skipped: " + th2.getMessage());
            return false;
        }
    }

    private final <T> T stepOrNull(String label, Function0<? extends T> block) {
        try {
            return (T) block.invoke();
        } catch (Throwable th2) {
            if (!(th2 instanceof SecurityException)) {
                Logger.INSTANCE.e(label + " failed", th2);
                return null;
            }
            Logger.INSTANCE.d(label + " skipped: " + th2.getMessage());
            return null;
        }
    }

    @NotNull
    public final Map<String, Object> configureAfterInstall() {
        Object objA;
        boolean operatorBrand;
        boolean zConfigureVoLte;
        boolean zIsLteOnlySet;
        try {
            int i5 = Result.f71687b;
            objA = privilegedSubscriptionId();
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Map<String, String> mapPreferredApn = null;
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        Integer num = (Integer) objA;
        try {
            reloadCarrierConfig(num);
        } catch (Throwable th3) {
            if (th3 instanceof SecurityException) {
                Logger.INSTANCE.d("Carrier config reload skipped: " + th3.getMessage());
            } else {
                Logger.INSTANCE.e("Carrier config reload failed", th3);
            }
        }
        try {
            configureApn(num);
        } catch (Throwable th4) {
            if (th4 instanceof SecurityException) {
                Logger.INSTANCE.d("APN configuration skipped: " + th4.getMessage());
            } else {
                Logger.INSTANCE.e("APN configuration failed", th4);
            }
        }
        try {
            setLteOnly(num);
        } catch (Throwable th5) {
            if (th5 instanceof SecurityException) {
                Logger.INSTANCE.d("LTE-only set skipped: " + th5.getMessage());
            } else {
                Logger.INSTANCE.e("LTE-only set failed", th5);
            }
        }
        try {
            operatorBrand = setOperatorBrand(num);
        } catch (Throwable th6) {
            if (th6 instanceof SecurityException) {
                Logger.INSTANCE.d("Operator brand override skipped: " + th6.getMessage());
            } else {
                Logger.INSTANCE.e("Operator brand override failed", th6);
            }
            operatorBrand = false;
        }
        try {
            zConfigureVoLte = configureVoLte(num);
        } catch (Throwable th7) {
            if (th7 instanceof SecurityException) {
                Logger.INSTANCE.d("VoLTE configure skipped: " + th7.getMessage());
            } else {
                Logger.INSTANCE.e("VoLTE configure failed", th7);
            }
            zConfigureVoLte = false;
        }
        try {
            zIsLteOnlySet = isLteOnlySet(num);
        } catch (Throwable th8) {
            if (th8 instanceof SecurityException) {
                Logger.INSTANCE.d("LTE-only read-back skipped: " + th8.getMessage());
            } else {
                Logger.INSTANCE.e("LTE-only read-back failed", th8);
            }
            zIsLteOnlySet = false;
        }
        try {
            mapPreferredApn = preferredApn(num);
        } catch (Throwable th9) {
            if (th9 instanceof SecurityException) {
                Logger.INSTANCE.d("Preferred APN read-back skipped: " + th9.getMessage());
            } else {
                Logger.INSTANCE.e("Preferred APN read-back failed", th9);
            }
        }
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put("carrier_privileges", Boolean.valueOf(num != null));
        if (num != null) {
            mapBuilder.put("sub_id", Integer.valueOf(num.intValue()));
        }
        mapBuilder.put("volte_enabled", Boolean.valueOf(zConfigureVoLte));
        mapBuilder.put("lte_only", Boolean.valueOf(zIsLteOnlySet));
        mapBuilder.put("apn_configured", Boolean.valueOf(mapPreferredApn != null));
        if (mapPreferredApn != null) {
            for (Map.Entry<String, String> entry : mapPreferredApn.entrySet()) {
                mapBuilder.put(entry.getKey(), entry.getValue());
            }
        }
        mapBuilder.put("operator_brand_set", Boolean.valueOf(operatorBrand));
        return mapBuilder.b();
    }

    public final void openVoLteSettings() {
        Intent intentAddFlags = new Intent("android.settings.NETWORK_OPERATOR_SETTINGS").addFlags(268435456);
        Intrinsics.f(intentAddFlags, "addFlags(...)");
        try {
            this.appContext.startActivity(intentAddFlags);
        } catch (Throwable th2) {
            if (!(th2 instanceof SecurityException)) {
                Logger.INSTANCE.e("Open VoLTE settings failed", th2);
                return;
            }
            Logger.INSTANCE.d("Open VoLTE settings skipped: " + th2.getMessage());
        }
    }
}
