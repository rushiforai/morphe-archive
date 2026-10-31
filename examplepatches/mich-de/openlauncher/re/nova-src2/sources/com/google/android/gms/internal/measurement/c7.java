package com.google.android.gms.internal.measurement;

import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import java.util.HashMap;

/* loaded from: classes3.dex */
public abstract class c7 extends q6 implements d7 {
    public static d7 asInterface(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.measurement.api.internal.IAppMeasurementDynamiteService");
        return iInterfaceQueryLocalInterface instanceof d7 ? (d7) iInterfaceQueryLocalInterface : new b7(iBinder, "com.google.android.gms.measurement.api.internal.IAppMeasurementDynamiteService", 0);
    }

    @Override // com.google.android.gms.internal.measurement.q6
    public final boolean T(int i5, Parcel parcel, Parcel parcel2) {
        boolean z11;
        f7 e7Var = null;
        h7 g7Var = null;
        f7 e7Var2 = null;
        f7 e7Var3 = null;
        f7 e7Var4 = null;
        f7 e7Var5 = null;
        k7 i7Var = null;
        k7 i7Var2 = null;
        k7 i7Var3 = null;
        f7 e7Var6 = null;
        f7 e7Var7 = null;
        f7 e7Var8 = null;
        f7 e7Var9 = null;
        f7 e7Var10 = null;
        f7 e7Var11 = null;
        m7 l7Var = null;
        f7 e7Var12 = null;
        f7 e7Var13 = null;
        f7 e7Var14 = null;
        f7 e7Var15 = null;
        f7 e7Var16 = null;
        switch (i5) {
            case 1:
                ah.b bVarU = ah.d.U(parcel.readStrongBinder());
                zzdb zzdbVar = (zzdb) r6.a(parcel, zzdb.CREATOR);
                long j11 = parcel.readLong();
                r6.d(parcel);
                initialize(bVarU, zzdbVar, j11);
                break;
            case 2:
                String string = parcel.readString();
                String string2 = parcel.readString();
                Bundle bundle = (Bundle) r6.a(parcel, Bundle.CREATOR);
                boolean z12 = parcel.readInt() != 0;
                boolean z13 = parcel.readInt() != 0;
                long j12 = parcel.readLong();
                r6.d(parcel);
                logEvent(string, string2, bundle, z12, z13, j12);
                break;
            case 3:
                String string3 = parcel.readString();
                String string4 = parcel.readString();
                Bundle bundle2 = (Bundle) r6.a(parcel, Bundle.CREATOR);
                IBinder strongBinder = parcel.readStrongBinder();
                if (strongBinder != null) {
                    IInterface iInterfaceQueryLocalInterface = strongBinder.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var = iInterfaceQueryLocalInterface instanceof f7 ? (f7) iInterfaceQueryLocalInterface : new e7(strongBinder);
                }
                f7 f7Var = e7Var;
                long j13 = parcel.readLong();
                r6.d(parcel);
                logEventAndBundle(string3, string4, bundle2, f7Var, j13);
                break;
            case 4:
                String string5 = parcel.readString();
                String string6 = parcel.readString();
                ah.b bVarU2 = ah.d.U(parcel.readStrongBinder());
                ClassLoader classLoader = r6.f33029a;
                z11 = parcel.readInt() != 0;
                long j14 = parcel.readLong();
                r6.d(parcel);
                setUserProperty(string5, string6, bVarU2, z11, j14);
                break;
            case 5:
                String string7 = parcel.readString();
                String string8 = parcel.readString();
                ClassLoader classLoader2 = r6.f33029a;
                z11 = parcel.readInt() != 0;
                IBinder strongBinder2 = parcel.readStrongBinder();
                if (strongBinder2 != null) {
                    IInterface iInterfaceQueryLocalInterface2 = strongBinder2.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var16 = iInterfaceQueryLocalInterface2 instanceof f7 ? (f7) iInterfaceQueryLocalInterface2 : new e7(strongBinder2);
                }
                r6.d(parcel);
                getUserProperties(string7, string8, z11, e7Var16);
                break;
            case 6:
                String string9 = parcel.readString();
                IBinder strongBinder3 = parcel.readStrongBinder();
                if (strongBinder3 != null) {
                    IInterface iInterfaceQueryLocalInterface3 = strongBinder3.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var15 = iInterfaceQueryLocalInterface3 instanceof f7 ? (f7) iInterfaceQueryLocalInterface3 : new e7(strongBinder3);
                }
                r6.d(parcel);
                getMaxUserProperties(string9, e7Var15);
                break;
            case 7:
                String string10 = parcel.readString();
                long j15 = parcel.readLong();
                r6.d(parcel);
                setUserId(string10, j15);
                break;
            case 8:
                Bundle bundle3 = (Bundle) r6.a(parcel, Bundle.CREATOR);
                long j16 = parcel.readLong();
                r6.d(parcel);
                setConditionalUserProperty(bundle3, j16);
                break;
            case 9:
                String string11 = parcel.readString();
                String string12 = parcel.readString();
                Bundle bundle4 = (Bundle) r6.a(parcel, Bundle.CREATOR);
                r6.d(parcel);
                clearConditionalUserProperty(string11, string12, bundle4);
                break;
            case 10:
                String string13 = parcel.readString();
                String string14 = parcel.readString();
                IBinder strongBinder4 = parcel.readStrongBinder();
                if (strongBinder4 != null) {
                    IInterface iInterfaceQueryLocalInterface4 = strongBinder4.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var14 = iInterfaceQueryLocalInterface4 instanceof f7 ? (f7) iInterfaceQueryLocalInterface4 : new e7(strongBinder4);
                }
                r6.d(parcel);
                getConditionalUserProperties(string13, string14, e7Var14);
                break;
            case 11:
                ClassLoader classLoader3 = r6.f33029a;
                z11 = parcel.readInt() != 0;
                long j17 = parcel.readLong();
                r6.d(parcel);
                setMeasurementEnabled(z11, j17);
                break;
            case 12:
                long j18 = parcel.readLong();
                r6.d(parcel);
                resetAnalyticsData(j18);
                break;
            case 13:
                long j19 = parcel.readLong();
                r6.d(parcel);
                setMinimumSessionDuration(j19);
                break;
            case 14:
                long j21 = parcel.readLong();
                r6.d(parcel);
                setSessionTimeoutDuration(j21);
                break;
            case 15:
                ah.b bVarU3 = ah.d.U(parcel.readStrongBinder());
                String string15 = parcel.readString();
                String string16 = parcel.readString();
                long j22 = parcel.readLong();
                r6.d(parcel);
                setCurrentScreen(bVarU3, string15, string16, j22);
                break;
            case 16:
                IBinder strongBinder5 = parcel.readStrongBinder();
                if (strongBinder5 != null) {
                    IInterface iInterfaceQueryLocalInterface5 = strongBinder5.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var13 = iInterfaceQueryLocalInterface5 instanceof f7 ? (f7) iInterfaceQueryLocalInterface5 : new e7(strongBinder5);
                }
                r6.d(parcel);
                getCurrentScreenName(e7Var13);
                break;
            case 17:
                IBinder strongBinder6 = parcel.readStrongBinder();
                if (strongBinder6 != null) {
                    IInterface iInterfaceQueryLocalInterface6 = strongBinder6.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var12 = iInterfaceQueryLocalInterface6 instanceof f7 ? (f7) iInterfaceQueryLocalInterface6 : new e7(strongBinder6);
                }
                r6.d(parcel);
                getCurrentScreenClass(e7Var12);
                break;
            case 18:
                IBinder strongBinder7 = parcel.readStrongBinder();
                if (strongBinder7 != null) {
                    IInterface iInterfaceQueryLocalInterface7 = strongBinder7.queryLocalInterface("com.google.android.gms.measurement.api.internal.IStringProvider");
                    l7Var = iInterfaceQueryLocalInterface7 instanceof m7 ? (m7) iInterfaceQueryLocalInterface7 : new l7(strongBinder7, "com.google.android.gms.measurement.api.internal.IStringProvider", 0);
                }
                r6.d(parcel);
                setInstanceIdProvider(l7Var);
                break;
            case 19:
                IBinder strongBinder8 = parcel.readStrongBinder();
                if (strongBinder8 != null) {
                    IInterface iInterfaceQueryLocalInterface8 = strongBinder8.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var11 = iInterfaceQueryLocalInterface8 instanceof f7 ? (f7) iInterfaceQueryLocalInterface8 : new e7(strongBinder8);
                }
                r6.d(parcel);
                getCachedAppInstanceId(e7Var11);
                break;
            case 20:
                IBinder strongBinder9 = parcel.readStrongBinder();
                if (strongBinder9 != null) {
                    IInterface iInterfaceQueryLocalInterface9 = strongBinder9.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var10 = iInterfaceQueryLocalInterface9 instanceof f7 ? (f7) iInterfaceQueryLocalInterface9 : new e7(strongBinder9);
                }
                r6.d(parcel);
                getAppInstanceId(e7Var10);
                break;
            case 21:
                IBinder strongBinder10 = parcel.readStrongBinder();
                if (strongBinder10 != null) {
                    IInterface iInterfaceQueryLocalInterface10 = strongBinder10.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var9 = iInterfaceQueryLocalInterface10 instanceof f7 ? (f7) iInterfaceQueryLocalInterface10 : new e7(strongBinder10);
                }
                r6.d(parcel);
                getGmpAppId(e7Var9);
                break;
            case 22:
                IBinder strongBinder11 = parcel.readStrongBinder();
                if (strongBinder11 != null) {
                    IInterface iInterfaceQueryLocalInterface11 = strongBinder11.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var8 = iInterfaceQueryLocalInterface11 instanceof f7 ? (f7) iInterfaceQueryLocalInterface11 : new e7(strongBinder11);
                }
                r6.d(parcel);
                generateEventId(e7Var8);
                break;
            case 23:
                String string17 = parcel.readString();
                long j23 = parcel.readLong();
                r6.d(parcel);
                beginAdUnitExposure(string17, j23);
                break;
            case 24:
                String string18 = parcel.readString();
                long j24 = parcel.readLong();
                r6.d(parcel);
                endAdUnitExposure(string18, j24);
                break;
            case 25:
                ah.b bVarU4 = ah.d.U(parcel.readStrongBinder());
                long j25 = parcel.readLong();
                r6.d(parcel);
                onActivityStarted(bVarU4, j25);
                break;
            case 26:
                ah.b bVarU5 = ah.d.U(parcel.readStrongBinder());
                long j26 = parcel.readLong();
                r6.d(parcel);
                onActivityStopped(bVarU5, j26);
                break;
            case 27:
                ah.b bVarU6 = ah.d.U(parcel.readStrongBinder());
                Bundle bundle5 = (Bundle) r6.a(parcel, Bundle.CREATOR);
                long j27 = parcel.readLong();
                r6.d(parcel);
                onActivityCreated(bVarU6, bundle5, j27);
                break;
            case 28:
                ah.b bVarU7 = ah.d.U(parcel.readStrongBinder());
                long j28 = parcel.readLong();
                r6.d(parcel);
                onActivityDestroyed(bVarU7, j28);
                break;
            case 29:
                ah.b bVarU8 = ah.d.U(parcel.readStrongBinder());
                long j29 = parcel.readLong();
                r6.d(parcel);
                onActivityPaused(bVarU8, j29);
                break;
            case 30:
                ah.b bVarU9 = ah.d.U(parcel.readStrongBinder());
                long j31 = parcel.readLong();
                r6.d(parcel);
                onActivityResumed(bVarU9, j31);
                break;
            case 31:
                ah.b bVarU10 = ah.d.U(parcel.readStrongBinder());
                IBinder strongBinder12 = parcel.readStrongBinder();
                if (strongBinder12 != null) {
                    IInterface iInterfaceQueryLocalInterface12 = strongBinder12.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var7 = iInterfaceQueryLocalInterface12 instanceof f7 ? (f7) iInterfaceQueryLocalInterface12 : new e7(strongBinder12);
                }
                long j32 = parcel.readLong();
                r6.d(parcel);
                onActivitySaveInstanceState(bVarU10, e7Var7, j32);
                break;
            case 32:
                Bundle bundle6 = (Bundle) r6.a(parcel, Bundle.CREATOR);
                IBinder strongBinder13 = parcel.readStrongBinder();
                if (strongBinder13 != null) {
                    IInterface iInterfaceQueryLocalInterface13 = strongBinder13.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var6 = iInterfaceQueryLocalInterface13 instanceof f7 ? (f7) iInterfaceQueryLocalInterface13 : new e7(strongBinder13);
                }
                long j33 = parcel.readLong();
                r6.d(parcel);
                performAction(bundle6, e7Var6, j33);
                break;
            case 33:
                int i11 = parcel.readInt();
                String string19 = parcel.readString();
                ah.b bVarU11 = ah.d.U(parcel.readStrongBinder());
                ah.b bVarU12 = ah.d.U(parcel.readStrongBinder());
                ah.b bVarU13 = ah.d.U(parcel.readStrongBinder());
                r6.d(parcel);
                logHealthData(i11, string19, bVarU11, bVarU12, bVarU13);
                break;
            case 34:
                IBinder strongBinder14 = parcel.readStrongBinder();
                if (strongBinder14 != null) {
                    IInterface iInterfaceQueryLocalInterface14 = strongBinder14.queryLocalInterface("com.google.android.gms.measurement.api.internal.IEventHandlerProxy");
                    i7Var3 = iInterfaceQueryLocalInterface14 instanceof k7 ? (k7) iInterfaceQueryLocalInterface14 : new i7(strongBinder14);
                }
                r6.d(parcel);
                setEventInterceptor(i7Var3);
                break;
            case 35:
                IBinder strongBinder15 = parcel.readStrongBinder();
                if (strongBinder15 != null) {
                    IInterface iInterfaceQueryLocalInterface15 = strongBinder15.queryLocalInterface("com.google.android.gms.measurement.api.internal.IEventHandlerProxy");
                    i7Var2 = iInterfaceQueryLocalInterface15 instanceof k7 ? (k7) iInterfaceQueryLocalInterface15 : new i7(strongBinder15);
                }
                r6.d(parcel);
                registerOnMeasurementEventListener(i7Var2);
                break;
            case 36:
                IBinder strongBinder16 = parcel.readStrongBinder();
                if (strongBinder16 != null) {
                    IInterface iInterfaceQueryLocalInterface16 = strongBinder16.queryLocalInterface("com.google.android.gms.measurement.api.internal.IEventHandlerProxy");
                    i7Var = iInterfaceQueryLocalInterface16 instanceof k7 ? (k7) iInterfaceQueryLocalInterface16 : new i7(strongBinder16);
                }
                r6.d(parcel);
                unregisterOnMeasurementEventListener(i7Var);
                break;
            case 37:
                HashMap hashMap = parcel.readHashMap(r6.f33029a);
                r6.d(parcel);
                initForTests(hashMap);
                break;
            case 38:
                IBinder strongBinder17 = parcel.readStrongBinder();
                if (strongBinder17 != null) {
                    IInterface iInterfaceQueryLocalInterface17 = strongBinder17.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var5 = iInterfaceQueryLocalInterface17 instanceof f7 ? (f7) iInterfaceQueryLocalInterface17 : new e7(strongBinder17);
                }
                int i12 = parcel.readInt();
                r6.d(parcel);
                getTestFlag(e7Var5, i12);
                break;
            case 39:
                ClassLoader classLoader4 = r6.f33029a;
                z11 = parcel.readInt() != 0;
                r6.d(parcel);
                setDataCollectionEnabled(z11);
                break;
            case 40:
                IBinder strongBinder18 = parcel.readStrongBinder();
                if (strongBinder18 != null) {
                    IInterface iInterfaceQueryLocalInterface18 = strongBinder18.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var4 = iInterfaceQueryLocalInterface18 instanceof f7 ? (f7) iInterfaceQueryLocalInterface18 : new e7(strongBinder18);
                }
                r6.d(parcel);
                isDataCollectionEnabled(e7Var4);
                break;
            case 41:
            case 47:
            case 49:
            default:
                return false;
            case 42:
                Bundle bundle7 = (Bundle) r6.a(parcel, Bundle.CREATOR);
                r6.d(parcel);
                setDefaultEventParameters(bundle7);
                break;
            case 43:
                long j34 = parcel.readLong();
                r6.d(parcel);
                clearMeasurementEnabled(j34);
                break;
            case 44:
                Bundle bundle8 = (Bundle) r6.a(parcel, Bundle.CREATOR);
                long j35 = parcel.readLong();
                r6.d(parcel);
                setConsent(bundle8, j35);
                break;
            case 45:
                Bundle bundle9 = (Bundle) r6.a(parcel, Bundle.CREATOR);
                long j36 = parcel.readLong();
                r6.d(parcel);
                setConsentThirdParty(bundle9, j36);
                break;
            case 46:
                IBinder strongBinder19 = parcel.readStrongBinder();
                if (strongBinder19 != null) {
                    IInterface iInterfaceQueryLocalInterface19 = strongBinder19.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var3 = iInterfaceQueryLocalInterface19 instanceof f7 ? (f7) iInterfaceQueryLocalInterface19 : new e7(strongBinder19);
                }
                r6.d(parcel);
                getSessionId(e7Var3);
                break;
            case 48:
                Intent intent = (Intent) r6.a(parcel, Intent.CREATOR);
                r6.d(parcel);
                setSgtmDebugInfo(intent);
                break;
            case 50:
                zzdd zzddVar = (zzdd) r6.a(parcel, zzdd.CREATOR);
                String string20 = parcel.readString();
                String string21 = parcel.readString();
                long j37 = parcel.readLong();
                r6.d(parcel);
                setCurrentScreenByScionActivityInfo(zzddVar, string20, string21, j37);
                break;
            case 51:
                zzdd zzddVar2 = (zzdd) r6.a(parcel, zzdd.CREATOR);
                long j38 = parcel.readLong();
                r6.d(parcel);
                onActivityStartedByScionActivityInfo(zzddVar2, j38);
                break;
            case 52:
                zzdd zzddVar3 = (zzdd) r6.a(parcel, zzdd.CREATOR);
                long j39 = parcel.readLong();
                r6.d(parcel);
                onActivityStoppedByScionActivityInfo(zzddVar3, j39);
                break;
            case 53:
                zzdd zzddVar4 = (zzdd) r6.a(parcel, zzdd.CREATOR);
                Bundle bundle10 = (Bundle) r6.a(parcel, Bundle.CREATOR);
                long j40 = parcel.readLong();
                r6.d(parcel);
                onActivityCreatedByScionActivityInfo(zzddVar4, bundle10, j40);
                break;
            case 54:
                zzdd zzddVar5 = (zzdd) r6.a(parcel, zzdd.CREATOR);
                long j41 = parcel.readLong();
                r6.d(parcel);
                onActivityDestroyedByScionActivityInfo(zzddVar5, j41);
                break;
            case 55:
                zzdd zzddVar6 = (zzdd) r6.a(parcel, zzdd.CREATOR);
                long j42 = parcel.readLong();
                r6.d(parcel);
                onActivityPausedByScionActivityInfo(zzddVar6, j42);
                break;
            case 56:
                zzdd zzddVar7 = (zzdd) r6.a(parcel, zzdd.CREATOR);
                long j43 = parcel.readLong();
                r6.d(parcel);
                onActivityResumedByScionActivityInfo(zzddVar7, j43);
                break;
            case 57:
                zzdd zzddVar8 = (zzdd) r6.a(parcel, zzdd.CREATOR);
                IBinder strongBinder20 = parcel.readStrongBinder();
                if (strongBinder20 != null) {
                    IInterface iInterfaceQueryLocalInterface20 = strongBinder20.queryLocalInterface("com.google.android.gms.measurement.api.internal.IBundleReceiver");
                    e7Var2 = iInterfaceQueryLocalInterface20 instanceof f7 ? (f7) iInterfaceQueryLocalInterface20 : new e7(strongBinder20);
                }
                long j44 = parcel.readLong();
                r6.d(parcel);
                onActivitySaveInstanceStateByScionActivityInfo(zzddVar8, e7Var2, j44);
                break;
            case 58:
                IBinder strongBinder21 = parcel.readStrongBinder();
                if (strongBinder21 != null) {
                    IInterface iInterfaceQueryLocalInterface21 = strongBinder21.queryLocalInterface("com.google.android.gms.measurement.api.internal.IDynamiteUploadBatchesCallback");
                    g7Var = iInterfaceQueryLocalInterface21 instanceof h7 ? (h7) iInterfaceQueryLocalInterface21 : new g7(strongBinder21, "com.google.android.gms.measurement.api.internal.IDynamiteUploadBatchesCallback", 0);
                }
                r6.d(parcel);
                retrieveAndUploadBatches(g7Var);
                break;
            case 59:
                String string22 = parcel.readString();
                String string23 = parcel.readString();
                Bundle bundle11 = (Bundle) r6.a(parcel, Bundle.CREATOR);
                boolean z14 = parcel.readInt() != 0;
                boolean z15 = parcel.readInt() != 0;
                long j45 = parcel.readLong();
                long j46 = parcel.readLong();
                r6.d(parcel);
                logEventWithElapsedTime(string22, string23, bundle11, z14, z15, j45, j46);
                break;
            case 60:
                ah.b bVarU14 = ah.d.U(parcel.readStrongBinder());
                zzdb zzdbVar2 = (zzdb) r6.a(parcel, zzdb.CREATOR);
                long j47 = parcel.readLong();
                long j48 = parcel.readLong();
                r6.d(parcel);
                initializeWithElapsedTime(bVarU14, zzdbVar2, j47, j48);
                break;
            case 61:
                long j49 = parcel.readLong();
                long j51 = parcel.readLong();
                r6.d(parcel);
                resetAnalyticsDataWithElapsedTime(j49, j51);
                break;
        }
        parcel2.writeNoException();
        return true;
    }
}
