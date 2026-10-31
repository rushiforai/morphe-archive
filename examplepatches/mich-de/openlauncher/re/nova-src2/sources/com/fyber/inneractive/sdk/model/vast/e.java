package com.fyber.inneractive.sdk.model.vast;

import android.text.TextUtils;
import com.amplitude.core.events.Identify;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final String f28591a;

    /* renamed from: b, reason: collision with root package name */
    public final String f28592b;

    /* renamed from: c, reason: collision with root package name */
    public int f28593c;

    /* renamed from: d, reason: collision with root package name */
    public final int f28594d;

    /* JADX WARN: Removed duplicated region for block: B:22:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x009a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public e(String str, String str2) {
        int i5;
        String str3;
        this.f28591a = str;
        this.f28592b = str2;
        int iIntValue = -1;
        if (TextUtils.isEmpty(str2) || str2.startsWith(Identify.UNSET_VALUE)) {
            i5 = 0;
        } else if (str2.endsWith("%") && str2.endsWith("%")) {
            try {
                int i11 = TextUtils.isEmpty(str2) ? -1 : Integer.parseInt(str2.substring(0, str2.length() - 1));
                if (i11 >= 0 && i11 <= 100) {
                    i5 = 1;
                }
            } catch (NumberFormatException e3) {
                IAlog.f("ProgressTrackingEvent: failed isPercentageOffsetValid with %s", e3.getMessage());
            }
        } else if (str2.contains(":")) {
            ArrayList arrayListA = a(str2);
            if (!arrayListA.isEmpty() && ((Integer) arrayListA.get(0)).intValue() >= 0 && ((Integer) arrayListA.get(1)).intValue() >= 0 && ((Integer) arrayListA.get(2)).intValue() >= 0 && ((Integer) arrayListA.get(3)).intValue() >= 0) {
                i5 = 2;
            }
        }
        this.f28594d = i5;
        if (i5 == 2 && (str3 = this.f28592b) != null) {
            ArrayList arrayListA2 = a(str3);
            iIntValue = ((Integer) arrayListA2.get(3)).intValue() + ((((Integer) arrayListA2.get(2)).intValue() + (((Integer) arrayListA2.get(1)).intValue() * 60) + (((Integer) arrayListA2.get(0)).intValue() * 3600)) * 1000);
        }
        this.f28593c = iIntValue;
    }

    public static ArrayList a(String str) {
        ArrayList arrayList = new ArrayList();
        if (str != null) {
            String[] strArrSplit = str.split(":");
            if (strArrSplit.length == 3) {
                String str2 = strArrSplit[0];
                String str3 = strArrSplit[1];
                String[] strArrSplit2 = strArrSplit[2].split("\\.");
                String str4 = strArrSplit2[0];
                String str5 = strArrSplit2.length > 1 ? strArrSplit2[1] : "000";
                try {
                    arrayList.add(Integer.valueOf(Integer.parseInt(str2)));
                    arrayList.add(Integer.valueOf(Integer.parseInt(str3)));
                    arrayList.add(Integer.valueOf(Integer.parseInt(str4)));
                    arrayList.add(Integer.valueOf(Integer.parseInt(str5)));
                    return arrayList;
                } catch (NumberFormatException e3) {
                    IAlog.f("ProgressTrackingEvent: failed convertOffsetToTimeList with %s", e3.getMessage());
                    return new ArrayList();
                }
            }
        }
        return arrayList;
    }
}
