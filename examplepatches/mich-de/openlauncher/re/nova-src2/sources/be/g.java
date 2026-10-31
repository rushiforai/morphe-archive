package be;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;
import android.util.Base64;
import android.util.Log;
import com.amplitude.android.migration.DatabaseConstants;
import com.google.android.gms.tasks.Task;
import com.google.firebase.crashlytics.internal.CrashlyticsRemoteConfigListener;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigException;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Arrays;
import java.util.Collections;
import java.util.Map;
import java.util.concurrent.Executor;
import org.json.JSONException;

/* loaded from: classes.dex */
public final /* synthetic */ class g implements i, fi.g {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object f17840a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f17841b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f17842c;

    public /* synthetic */ g(Object obj, Object obj2, Object obj3) {
        this.f17840a = obj;
        this.f17841b = obj2;
        this.f17842c = obj3;
    }

    @Override // be.i
    public Object apply(Object obj) {
        long jInsert;
        k kVar = (k) this.f17840a;
        td.h hVar = (td.h) this.f17841b;
        td.l lVar = hVar.f88977c;
        String str = hVar.f88975a;
        td.i iVar = (td.i) this.f17842c;
        SQLiteDatabase sQLiteDatabase = (SQLiteDatabase) obj;
        long jSimpleQueryForLong = kVar.a().compileStatement("PRAGMA page_size").simpleQueryForLong() * kVar.a().compileStatement("PRAGMA page_count").simpleQueryForLong();
        a aVar = kVar.f17850d;
        if (jSimpleQueryForLong >= aVar.f17826a) {
            kVar.e(1L, wd.c.CACHE_FULL, str);
            return -1L;
        }
        Long lB = k.b(sQLiteDatabase, iVar);
        if (lB != null) {
            jInsert = lB.longValue();
        } else {
            ContentValues contentValues = new ContentValues();
            contentValues.put("backend_name", iVar.f88985a);
            contentValues.put("priority", Integer.valueOf(ee.a.a(iVar.f88987c)));
            contentValues.put("next_request_ms", (Integer) 0);
            byte[] bArr = iVar.f88986b;
            if (bArr != null) {
                contentValues.put("extras", Base64.encodeToString(bArr, 0));
            }
            jInsert = sQLiteDatabase.insert("transport_contexts", null, contentValues);
        }
        int i5 = aVar.f17830e;
        byte[] bArr2 = lVar.f88995b;
        boolean z11 = bArr2.length <= i5;
        ContentValues contentValues2 = new ContentValues();
        contentValues2.put("context_id", Long.valueOf(jInsert));
        contentValues2.put("transport_name", str);
        contentValues2.put("timestamp_ms", Long.valueOf(hVar.f88978d));
        contentValues2.put("uptime_ms", Long.valueOf(hVar.f88979e));
        contentValues2.put("payload_encoding", lVar.f88994a.f83917a);
        contentValues2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, hVar.f88976b);
        contentValues2.put("num_attempts", (Integer) 0);
        contentValues2.put("inline", Boolean.valueOf(z11));
        contentValues2.put("payload", z11 ? bArr2 : new byte[0]);
        contentValues2.put("product_id", hVar.f88981g);
        contentValues2.put("pseudonymous_id", hVar.f88982h);
        contentValues2.put("experiment_ids_clear_blob", hVar.f88983i);
        contentValues2.put("experiment_ids_encrypted_blob", hVar.f88984j);
        long jInsert2 = sQLiteDatabase.insert(DatabaseConstants.EVENT_TABLE_NAME, null, contentValues2);
        if (!z11) {
            int iCeil = (int) Math.ceil(bArr2.length / i5);
            for (int i11 = 1; i11 <= iCeil; i11++) {
                byte[] bArrCopyOfRange = Arrays.copyOfRange(bArr2, (i11 - 1) * i5, Math.min(i11 * i5, bArr2.length));
                ContentValues contentValues3 = new ContentValues();
                contentValues3.put("event_id", Long.valueOf(jInsert2));
                contentValues3.put("sequence_num", Integer.valueOf(i11));
                contentValues3.put("bytes", bArrCopyOfRange);
                sQLiteDatabase.insert("event_payloads", null, contentValues3);
            }
        }
        for (Map.Entry entry : Collections.unmodifiableMap(hVar.f88980f).entrySet()) {
            ContentValues contentValues4 = new ContentValues();
            contentValues4.put("event_id", Long.valueOf(jInsert2));
            contentValues4.put(PendingUpgradeStore.KEY_NAME, (String) entry.getKey());
            contentValues4.put("value", (String) entry.getValue());
            sQLiteDatabase.insert("event_metadata", null, contentValues4);
        }
        return Long.valueOf(jInsert2);
    }

    @Override // fi.g
    public void onSuccess(Object obj) throws JSONException {
        x7.h hVar = (x7.h) this.f17840a;
        Task task = (Task) this.f17841b;
        CrashlyticsRemoteConfigListener crashlyticsRemoteConfigListener = (CrashlyticsRemoteConfigListener) this.f17842c;
        try {
            xm.e eVar = (xm.e) task.m();
            if (eVar != null) {
                ((Executor) hVar.f95139d).execute(new ym.a(crashlyticsRemoteConfigListener, ((x7.l) hVar.f95138c).h(eVar), 0));
            }
        } catch (FirebaseRemoteConfigException e3) {
            Log.w("FirebaseRemoteConfig", "Exception publishing RolloutsState to subscriber. Continuing to listen for changes.", e3);
        }
    }
}
