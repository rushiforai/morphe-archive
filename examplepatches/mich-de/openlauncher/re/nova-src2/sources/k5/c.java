package k5;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.Parcel;
import android.os.ResultReceiver;
import b10.d0;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Set;
import java.util.concurrent.Executor;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class c {

    /* renamed from: c, reason: collision with root package name */
    public static final a f71100c = new a();

    /* renamed from: d, reason: collision with root package name */
    public static final Set f71101d = kotlin.collections.c.f1(new Integer[]{7, 20});

    /* renamed from: e, reason: collision with root package name */
    public static final int f71102e = 1;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ int f71103f = 0;

    /* renamed from: a, reason: collision with root package name */
    public final Context f71104a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f71105b;

    public c(Context context) {
        Intrinsics.g(context, "context");
        Intrinsics.g(context, "context");
        this.f71104a = context;
        this.f71105b = context;
    }

    public static void a(ResultReceiver resultReceiver, Intent intent, String str) {
        Intrinsics.g(resultReceiver, "resultReceiver");
        intent.putExtra("TYPE", str);
        intent.putExtra("ACTIVITY_REQUEST_CODE", f71102e);
        Parcel parcelObtain = Parcel.obtain();
        Intrinsics.f(parcelObtain, "obtain(...)");
        resultReceiver.writeToParcel(parcelObtain, 0);
        parcelObtain.setDataPosition(0);
        ResultReceiver resultReceiver2 = (ResultReceiver) ResultReceiver.CREATOR.createFromParcel(parcelObtain);
        parcelObtain.recycle();
        intent.putExtra("RESULT_RECEIVER", resultReceiver2);
        intent.setFlags(SQLiteDatabase.OPEN_FULLMUTEX);
    }

    public static boolean b(Bundle bundle, Function2 function2, Executor executor, f5.d dVar, CancellationSignal cancellationSignal) {
        if (!bundle.getBoolean("FAILURE_RESPONSE")) {
            return false;
        }
        b.a(cancellationSignal, new d0(21, executor, dVar, function2.invoke(bundle.getString("EXCEPTION_TYPE"), bundle.getString("EXCEPTION_MESSAGE"))));
        return true;
    }
}
