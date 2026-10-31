package j00;

import com.teslacoilsw.conditions.rules.ConditionModel;
import kotlin.NoWhenBranchMatchedException;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.functions.Function1;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class c {

    /* renamed from: d, reason: collision with root package name */
    public static final c f68456d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ c[] f68457e;

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f68458a;

    /* renamed from: b, reason: collision with root package name */
    public final String f68459b;

    /* renamed from: c, reason: collision with root package name */
    public final String f68460c;

    static {
        c cVar = new c("Time", 0, new iw.p(2), "TimeAndDayConditionScreenUI", null);
        c cVar2 = new c("Wifi", 1, new iw.p(3), "ShowWifiConnectedConditionScreen", "android.permission.ACCESS_FINE_LOCATION");
        f68456d = cVar2;
        c[] cVarArr = {cVar, cVar2, new c("Weather", 2, new iw.p(4), "ShowWeatherConditionScreen", null), new c("Bluetooth", 3, new iw.p(5), "ShowBluetoothDeviceScreen", n00.f.f77555a)};
        f68457e = cVarArr;
        EnumEntriesKt.a(cVarArr);
    }

    public c(String str, int i5, Function1 function1, String str2, String str3) {
        this.f68458a = function1;
        this.f68459b = str2;
        this.f68460c = str3;
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f68457e.clone();
    }

    public final boolean a(ConditionModel conditionModel) {
        int iOrdinal = ordinal();
        if (iOrdinal == 0) {
            return conditionModel instanceof ConditionModel.TimeOfDayDurationModel;
        }
        if (iOrdinal == 1) {
            return conditionModel instanceof ConditionModel.WifiConnectedModel;
        }
        if (iOrdinal == 2) {
            return conditionModel instanceof ConditionModel.WeatherChangeModel;
        }
        if (iOrdinal == 3) {
            return conditionModel instanceof ConditionModel.BluetoothConnectedModel;
        }
        throw new NoWhenBranchMatchedException();
    }
}
