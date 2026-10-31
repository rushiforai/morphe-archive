package vl;

import android.text.TextUtils;
import com.google.firebase.abt.AbtException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import yl.c;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: g, reason: collision with root package name */
    public static final String[] f92841g = {"experimentId", "experimentStartTime", "timeToLiveMillis", "triggerTimeoutMillis", "variantId"};

    /* renamed from: h, reason: collision with root package name */
    public static final SimpleDateFormat f92842h = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.US);

    /* renamed from: a, reason: collision with root package name */
    public final String f92843a;

    /* renamed from: b, reason: collision with root package name */
    public final String f92844b;

    /* renamed from: c, reason: collision with root package name */
    public final String f92845c;

    /* renamed from: d, reason: collision with root package name */
    public final Date f92846d;

    /* renamed from: e, reason: collision with root package name */
    public final long f92847e;

    /* renamed from: f, reason: collision with root package name */
    public final long f92848f;

    public a(String str, String str2, String str3, Date date, long j11, long j12) {
        this.f92843a = str;
        this.f92844b = str2;
        this.f92845c = str3;
        this.f92846d = date;
        this.f92847e = j11;
        this.f92848f = j12;
    }

    public static a a(c cVar) {
        String str = cVar.f97377d;
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return new a(cVar.f97375b, String.valueOf(cVar.f97376c), str, new Date(cVar.f97386m), cVar.f97378e, cVar.f97383j);
    }

    public static a b(Map map) throws AbtException, NumberFormatException, ParseException {
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < 5; i5++) {
            String str = f92841g[i5];
            if (!map.containsKey(str)) {
                arrayList.add(str);
            }
        }
        if (!arrayList.isEmpty()) {
            throw new AbtException(String.format("The following keys are missing from the experiment info map: %s", arrayList));
        }
        try {
            return new a((String) map.get("experimentId"), (String) map.get("variantId"), map.containsKey("triggerEvent") ? (String) map.get("triggerEvent") : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, f92842h.parse((String) map.get("experimentStartTime")), Long.parseLong((String) map.get("triggerTimeoutMillis")), Long.parseLong((String) map.get("timeToLiveMillis")));
        } catch (NumberFormatException e3) {
            throw new AbtException("Could not process experiment: one of the durations could not be converted into a long.", e3);
        } catch (ParseException e11) {
            throw new AbtException("Could not process experiment: parsing experiment start time failed.", e11);
        }
    }

    public final String c() {
        return this.f92843a;
    }

    public final String d() {
        return this.f92844b;
    }

    public final c e() {
        c cVar = new c();
        cVar.f97374a = "frc";
        cVar.f97386m = this.f92846d.getTime();
        cVar.f97375b = this.f92843a;
        cVar.f97376c = this.f92844b;
        String str = this.f92845c;
        if (TextUtils.isEmpty(str)) {
            str = null;
        }
        cVar.f97377d = str;
        cVar.f97378e = this.f92847e;
        cVar.f97383j = this.f92848f;
        return cVar;
    }
}
