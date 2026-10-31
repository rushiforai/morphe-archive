package b00;

import android.database.Cursor;
import android.net.Uri;
import android.provider.MediaStore;
import java.io.IOException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f16299t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ f f16300u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ ArrayList f16301v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ ArrayList f16302w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(f fVar, ArrayList arrayList, ArrayList arrayList2, Continuation continuation) {
        super(2, continuation);
        this.f16300u = fVar;
        this.f16301v = arrayList;
        this.f16302w = arrayList2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        b bVar = new b(this.f16300u, this.f16301v, this.f16302w, continuation);
        bVar.f16299t = obj;
        return bVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((b) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws IOException {
        Object objA;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        f fVar = this.f16300u;
        try {
            int i5 = Result.f71687b;
            objA = fVar.f16342a.getContentResolver().query(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, new String[]{"_id", "title", "date_added", "bucket_display_name"}, "height IS NOT NULL AND\nwidth IS NOT NULL AND\n(bucket_display_name = ? OR\n bucket_display_name = ?\n) AND\n(isprivate IS NULL OR\n isprivate = 0\n) AND\ndate_added > ?", new String[]{"Screenshots", "Camera", String.valueOf((System.currentTimeMillis() - 604800000) / 1000)}, "date_added DESC");
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        Cursor cursor = (Cursor) objA;
        if (cursor == null) {
            return null;
        }
        ArrayList arrayList = this.f16301v;
        ArrayList arrayList2 = this.f16302w;
        try {
            int columnIndexOrThrow = cursor.getColumnIndexOrThrow("_id");
            int columnIndexOrThrow2 = cursor.getColumnIndexOrThrow("title");
            int columnIndexOrThrow3 = cursor.getColumnIndexOrThrow("date_added");
            int columnIndexOrThrow4 = cursor.getColumnIndexOrThrow("bucket_display_name");
            while (cursor.moveToNext()) {
                Uri uriBuild = MediaStore.Images.Media.EXTERNAL_CONTENT_URI.buildUpon().appendPath(String.valueOf(cursor.getLong(columnIndexOrThrow))).build();
                v10.b bVar = new v10.b(r70.k.a1(cursor.getString(columnIndexOrThrow2), "Screenshot_"), uriBuild, Date.from(Instant.ofEpochSecond(cursor.getLong(columnIndexOrThrow3))), uriBuild);
                String string = cursor.getString(columnIndexOrThrow4);
                if (Intrinsics.b(string, "Camera")) {
                    arrayList.add(bVar);
                } else if (Intrinsics.b(string, "Screenshots")) {
                    arrayList2.add(bVar);
                }
            }
            Unit unit = Unit.f71706a;
            cursor.close();
            return Unit.f71706a;
        } catch (Throwable th3) {
            try {
                throw th3;
            } catch (Throwable th4) {
                CloseableKt.a(cursor, th3);
                throw th4;
            }
        }
    }
}
