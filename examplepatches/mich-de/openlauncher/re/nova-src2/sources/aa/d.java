package aa;

import ads_mobile_sdk.gg0;
import ads_mobile_sdk.tm2;
import ads_mobile_sdk.ut0;
import ads_mobile_sdk.vm2;
import ads_mobile_sdk.wt0;
import android.accounts.Account;
import android.app.PendingIntent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import coil.memory.MemoryCache$Key;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.android.launcher3.util.ComponentKey;
import com.android.launcher3.widget.custom.CustomAppWidgetProviderInfo;
import com.google.android.gms.appset.zza;
import com.google.android.gms.appset.zzc;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.Feature;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.ConnectionTelemetryConfiguration;
import com.google.android.gms.common.internal.GetServiceRequest;
import com.google.android.gms.common.internal.RootTelemetryConfiguration;
import com.google.android.gms.common.internal.zzj;
import com.google.android.gms.internal.measurement.zzdb;
import com.teslacoilsw.conditions.ConditionSetId;
import com.teslacoilsw.conditions.ConditionSetRecord;
import e10.z2;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f554a;

    public /* synthetic */ d(int i5) {
        this.f554a = i5;
    }

    public static void a(GetServiceRequest getServiceRequest, Parcel parcel, int i5) {
        int iJ0 = fg.a.j0(parcel, 20293);
        int i11 = getServiceRequest.f31839f;
        fg.a.i0(parcel, 1, 4);
        parcel.writeInt(i11);
        int i12 = getServiceRequest.f31840g;
        fg.a.i0(parcel, 2, 4);
        parcel.writeInt(i12);
        int i13 = getServiceRequest.f31841h;
        fg.a.i0(parcel, 3, 4);
        parcel.writeInt(i13);
        fg.a.c0(parcel, 4, getServiceRequest.f31842i);
        fg.a.X(parcel, 5, getServiceRequest.f31843j);
        fg.a.f0(parcel, 6, getServiceRequest.f31844k, i5);
        fg.a.U(parcel, 7, getServiceRequest.f31845l);
        fg.a.b0(parcel, 8, getServiceRequest.f31846m, i5);
        fg.a.f0(parcel, 10, getServiceRequest.n, i5);
        fg.a.f0(parcel, 11, getServiceRequest.o, i5);
        boolean z11 = getServiceRequest.f31847p;
        fg.a.i0(parcel, 12, 4);
        parcel.writeInt(z11 ? 1 : 0);
        int i14 = getServiceRequest.f31848q;
        fg.a.i0(parcel, 13, 4);
        parcel.writeInt(i14);
        boolean z12 = getServiceRequest.f31849r;
        fg.a.i0(parcel, 14, 4);
        parcel.writeInt(z12 ? 1 : 0);
        fg.a.c0(parcel, 15, getServiceRequest.f31850s);
        fg.a.k0(parcel, iJ0);
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        switch (this.f554a) {
            case 0:
                return new BitmapInfo(parcel);
            case 1:
                int iN0 = z2.N0(parcel);
                String strN = null;
                while (parcel.dataPosition() < iN0) {
                    int i5 = parcel.readInt();
                    if (((char) i5) != 1) {
                        z2.I0(parcel, i5);
                    } else {
                        strN = z2.N(parcel, i5);
                    }
                }
                z2.U(parcel, iN0);
                return new gg0(strN);
            case 2:
                int iN02 = z2.N0(parcel);
                int iU0 = 0;
                int iU02 = 0;
                int iU03 = 0;
                String strN2 = null;
                String strN3 = null;
                while (parcel.dataPosition() < iN02) {
                    int i11 = parcel.readInt();
                    char c11 = (char) i11;
                    if (c11 == 1) {
                        iU0 = z2.u0(parcel, i11);
                    } else if (c11 == 2) {
                        iU02 = z2.u0(parcel, i11);
                    } else if (c11 == 3) {
                        strN2 = z2.N(parcel, i11);
                    } else if (c11 == 4) {
                        strN3 = z2.N(parcel, i11);
                    } else if (c11 != 5) {
                        z2.I0(parcel, i11);
                    } else {
                        iU03 = z2.u0(parcel, i11);
                    }
                }
                z2.U(parcel, iN02);
                return new tm2(strN2, iU0, iU02, iU03, strN3);
            case 3:
                int iN03 = z2.N0(parcel);
                int iU04 = 0;
                String strN4 = null;
                String strN5 = null;
                while (parcel.dataPosition() < iN03) {
                    int i12 = parcel.readInt();
                    char c12 = (char) i12;
                    if (c12 == 1) {
                        iU04 = z2.u0(parcel, i12);
                    } else if (c12 == 2) {
                        strN4 = z2.N(parcel, i12);
                    } else if (c12 != 3) {
                        z2.I0(parcel, i12);
                    } else {
                        strN5 = z2.N(parcel, i12);
                    }
                }
                z2.U(parcel, iN03);
                return new ut0(iU04, strN4, strN5);
            case 4:
                int iN04 = z2.N0(parcel);
                int iU05 = 0;
                byte[] bArrG = null;
                int iU06 = 0;
                while (parcel.dataPosition() < iN04) {
                    int i13 = parcel.readInt();
                    char c13 = (char) i13;
                    if (c13 == 1) {
                        iU05 = z2.u0(parcel, i13);
                    } else if (c13 == 2) {
                        bArrG = z2.G(parcel, i13);
                    } else if (c13 != 3) {
                        z2.I0(parcel, i13);
                    } else {
                        iU06 = z2.u0(parcel, i13);
                    }
                }
                z2.U(parcel, iN04);
                return new vm2(bArrG, iU05, iU06);
            case 5:
                int iN05 = z2.N0(parcel);
                int iU07 = 0;
                byte[] bArrG2 = null;
                while (parcel.dataPosition() < iN05) {
                    int i14 = parcel.readInt();
                    char c14 = (char) i14;
                    if (c14 == 1) {
                        iU07 = z2.u0(parcel, i14);
                    } else if (c14 != 2) {
                        z2.I0(parcel, i14);
                    } else {
                        bArrG2 = z2.G(parcel, i14);
                    }
                }
                z2.U(parcel, iN05);
                return new wt0(iU07, bArrG2);
            case 6:
                return new CustomAppWidgetProviderInfo(parcel, true, 0);
            case 7:
                int iN06 = z2.N0(parcel);
                Bundle bundleF = null;
                String strN6 = null;
                boolean zP0 = false;
                long jW0 = 0;
                long jW02 = 0;
                while (parcel.dataPosition() < iN06) {
                    int i15 = parcel.readInt();
                    char c15 = (char) i15;
                    if (c15 == 1) {
                        jW0 = z2.w0(parcel, i15);
                    } else if (c15 == 2) {
                        jW02 = z2.w0(parcel, i15);
                    } else if (c15 == 3) {
                        zP0 = z2.p0(parcel, i15);
                    } else if (c15 == 7) {
                        bundleF = z2.F(parcel, i15);
                    } else if (c15 != '\b') {
                        z2.I0(parcel, i15);
                    } else {
                        strN6 = z2.N(parcel, i15);
                    }
                }
                z2.U(parcel, iN06);
                return new zzdb(jW0, jW02, zP0, bundleF, strN6);
            case 8:
                int iN07 = z2.N0(parcel);
                String strN7 = null;
                String strN8 = null;
                while (parcel.dataPosition() < iN07) {
                    int i16 = parcel.readInt();
                    char c16 = (char) i16;
                    if (c16 == 1) {
                        strN7 = z2.N(parcel, i16);
                    } else if (c16 != 2) {
                        z2.I0(parcel, i16);
                    } else {
                        strN8 = z2.N(parcel, i16);
                    }
                }
                z2.U(parcel, iN07);
                return new zza(strN7, strN8);
            case 9:
                int iN08 = z2.N0(parcel);
                String strN9 = null;
                int iU08 = 0;
                while (parcel.dataPosition() < iN08) {
                    int i17 = parcel.readInt();
                    char c17 = (char) i17;
                    if (c17 == 1) {
                        strN9 = z2.N(parcel, i17);
                    } else if (c17 != 2) {
                        z2.I0(parcel, i17);
                    } else {
                        iU08 = z2.u0(parcel, i17);
                    }
                }
                z2.U(parcel, iN08);
                return new zzc(strN9, iU08);
            case 10:
                return new ConditionSetId(parcel.readString());
            case 11:
                String str = ConditionSetId.CREATOR.createFromParcel(parcel).f45529a;
                int i18 = parcel.readInt();
                ArrayList arrayList = new ArrayList(i18);
                for (int i19 = 0; i19 != i18; i19++) {
                    arrayList.add(parcel.readParcelable(ConditionSetRecord.class.getClassLoader()));
                }
                return new ConditionSetRecord(str, arrayList);
            case 12:
                int iN09 = z2.N0(parcel);
                PendingIntent pendingIntent = null;
                String strN10 = null;
                Integer numV0 = null;
                int iU09 = 0;
                int iU010 = 0;
                while (parcel.dataPosition() < iN09) {
                    int i21 = parcel.readInt();
                    char c18 = (char) i21;
                    if (c18 == 1) {
                        iU09 = z2.u0(parcel, i21);
                    } else if (c18 == 2) {
                        iU010 = z2.u0(parcel, i21);
                    } else if (c18 == 3) {
                        pendingIntent = (PendingIntent) z2.L(parcel, i21, PendingIntent.CREATOR);
                    } else if (c18 == 4) {
                        strN10 = z2.N(parcel, i21);
                    } else if (c18 != 5) {
                        z2.I0(parcel, i21);
                    } else {
                        numV0 = z2.v0(parcel, i21);
                    }
                }
                z2.U(parcel, iN09);
                return new ConnectionResult(iU09, iU010, pendingIntent, strN10, numV0);
            case 13:
                int iN010 = z2.N0(parcel);
                int iU011 = 0;
                boolean zP02 = false;
                long jW03 = -1;
                String strN11 = null;
                while (parcel.dataPosition() < iN010) {
                    int i22 = parcel.readInt();
                    char c19 = (char) i22;
                    if (c19 == 1) {
                        strN11 = z2.N(parcel, i22);
                    } else if (c19 == 2) {
                        iU011 = z2.u0(parcel, i22);
                    } else if (c19 == 3) {
                        jW03 = z2.w0(parcel, i22);
                    } else if (c19 != 4) {
                        z2.I0(parcel, i22);
                    } else {
                        zP02 = z2.p0(parcel, i22);
                    }
                }
                z2.U(parcel, iN010);
                return new Feature(iU011, jW03, strN11, zP02);
            case 14:
                return new ShortcutKey(parcel);
            case 15:
                int iN011 = z2.N0(parcel);
                String strN12 = null;
                ConnectionResult connectionResult = null;
                int iU012 = 0;
                PendingIntent pendingIntent2 = null;
                while (parcel.dataPosition() < iN011) {
                    int i23 = parcel.readInt();
                    char c21 = (char) i23;
                    if (c21 == 1) {
                        iU012 = z2.u0(parcel, i23);
                    } else if (c21 == 2) {
                        strN12 = z2.N(parcel, i23);
                    } else if (c21 == 3) {
                        pendingIntent2 = (PendingIntent) z2.L(parcel, i23, PendingIntent.CREATOR);
                    } else if (c21 != 4) {
                        z2.I0(parcel, i23);
                    } else {
                        connectionResult = (ConnectionResult) z2.L(parcel, i23, ConnectionResult.CREATOR);
                    }
                }
                z2.U(parcel, iN011);
                return new Status(iU012, strN12, pendingIntent2, connectionResult);
            case 16:
                int iN012 = z2.N0(parcel);
                boolean zP03 = false;
                int iU013 = 0;
                boolean zP04 = false;
                int iU014 = 0;
                int iU015 = 0;
                while (parcel.dataPosition() < iN012) {
                    int i24 = parcel.readInt();
                    char c22 = (char) i24;
                    if (c22 == 1) {
                        iU013 = z2.u0(parcel, i24);
                    } else if (c22 == 2) {
                        zP03 = z2.p0(parcel, i24);
                    } else if (c22 == 3) {
                        zP04 = z2.p0(parcel, i24);
                    } else if (c22 == 4) {
                        iU014 = z2.u0(parcel, i24);
                    } else if (c22 != 5) {
                        z2.I0(parcel, i24);
                    } else {
                        iU015 = z2.u0(parcel, i24);
                    }
                }
                z2.U(parcel, iN012);
                return new RootTelemetryConfiguration(zP03, iU013, zP04, iU014, iU015);
            case 17:
                int iN013 = z2.N0(parcel);
                Bundle bundleF2 = null;
                ConnectionTelemetryConfiguration connectionTelemetryConfiguration = null;
                int iU016 = 0;
                Feature[] featureArr = null;
                while (parcel.dataPosition() < iN013) {
                    int i25 = parcel.readInt();
                    char c23 = (char) i25;
                    if (c23 == 1) {
                        bundleF2 = z2.F(parcel, i25);
                    } else if (c23 == 2) {
                        featureArr = (Feature[]) z2.Q(parcel, i25, Feature.CREATOR);
                    } else if (c23 == 3) {
                        iU016 = z2.u0(parcel, i25);
                    } else if (c23 != 4) {
                        z2.I0(parcel, i25);
                    } else {
                        connectionTelemetryConfiguration = (ConnectionTelemetryConfiguration) z2.L(parcel, i25, ConnectionTelemetryConfiguration.CREATOR);
                    }
                }
                z2.U(parcel, iN013);
                zzj zzjVar = new zzj();
                zzjVar.f31881f = bundleF2;
                zzjVar.f31882g = featureArr;
                zzjVar.f31883h = iU016;
                zzjVar.f31884i = connectionTelemetryConfiguration;
                return zzjVar;
            case 18:
                int iN014 = z2.N0(parcel);
                Bundle bundle = new Bundle();
                Scope[] scopeArr = GetServiceRequest.f31837t;
                String strN13 = null;
                IBinder iBinderT0 = null;
                Account account = null;
                String strN14 = null;
                int iU017 = 0;
                int iU018 = 0;
                int iU019 = 0;
                boolean zP05 = false;
                int iU020 = 0;
                boolean zP06 = false;
                Feature[] featureArr2 = GetServiceRequest.f31838u;
                Feature[] featureArr3 = featureArr2;
                while (parcel.dataPosition() < iN014) {
                    int i26 = parcel.readInt();
                    switch ((char) i26) {
                        case 1:
                            iU017 = z2.u0(parcel, i26);
                            break;
                        case 2:
                            iU018 = z2.u0(parcel, i26);
                            break;
                        case 3:
                            iU019 = z2.u0(parcel, i26);
                            break;
                        case 4:
                            strN13 = z2.N(parcel, i26);
                            break;
                        case 5:
                            iBinderT0 = z2.t0(parcel, i26);
                            break;
                        case 6:
                            scopeArr = (Scope[]) z2.Q(parcel, i26, Scope.CREATOR);
                            break;
                        case 7:
                            bundle = z2.F(parcel, i26);
                            break;
                        case '\b':
                            account = (Account) z2.L(parcel, i26, Account.CREATOR);
                            break;
                        case '\t':
                        default:
                            z2.I0(parcel, i26);
                            break;
                        case '\n':
                            featureArr2 = (Feature[]) z2.Q(parcel, i26, Feature.CREATOR);
                            break;
                        case 11:
                            featureArr3 = (Feature[]) z2.Q(parcel, i26, Feature.CREATOR);
                            break;
                        case '\f':
                            zP05 = z2.p0(parcel, i26);
                            break;
                        case '\r':
                            iU020 = z2.u0(parcel, i26);
                            break;
                        case 14:
                            zP06 = z2.p0(parcel, i26);
                            break;
                        case 15:
                            strN14 = z2.N(parcel, i26);
                            break;
                    }
                }
                z2.U(parcel, iN014);
                return new GetServiceRequest(iU017, iU018, iU019, strN13, iBinderT0, scopeArr, bundle, account, featureArr2, featureArr3, zP05, iU020, zP06, strN14);
            case 19:
                String string = parcel.readString();
                Intrinsics.d(string);
                int i27 = parcel.readInt();
                LinkedHashMap linkedHashMap = new LinkedHashMap(i27);
                for (int i28 = 0; i28 < i27; i28++) {
                    String string2 = parcel.readString();
                    Intrinsics.d(string2);
                    String string3 = parcel.readString();
                    Intrinsics.d(string3);
                    linkedHashMap.put(string2, string3);
                }
                return new MemoryCache$Key(string, linkedHashMap);
            default:
                return new ComponentKey(parcel);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f554a) {
            case 0:
                return new BitmapInfo[i5];
            case 1:
                return new gg0[i5];
            case 2:
                return new tm2[i5];
            case 3:
                return new ut0[i5];
            case 4:
                return new vm2[i5];
            case 5:
                return new wt0[i5];
            case 6:
                return new CustomAppWidgetProviderInfo[i5];
            case 7:
                return new zzdb[i5];
            case 8:
                return new zza[i5];
            case 9:
                return new zzc[i5];
            case 10:
                return new ConditionSetId[i5];
            case 11:
                return new ConditionSetRecord[i5];
            case 12:
                return new ConnectionResult[i5];
            case 13:
                return new Feature[i5];
            case 14:
                return new ShortcutKey[i5];
            case 15:
                return new Status[i5];
            case 16:
                return new RootTelemetryConfiguration[i5];
            case 17:
                return new zzj[i5];
            case 18:
                return new GetServiceRequest[i5];
            case 19:
                return new MemoryCache$Key[i5];
            default:
                return new ComponentKey[i5];
        }
    }
}
