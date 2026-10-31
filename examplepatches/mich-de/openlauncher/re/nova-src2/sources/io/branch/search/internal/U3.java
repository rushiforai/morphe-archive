package io.branch.search.internal;

import android.content.ContentProviderClient;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.CancellationSignal;
import android.os.DeadObjectException;
import io.branch.search.internal.A4;
import kotlin.Pair;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class U3 extends Lambda implements Function0<Pair<? extends Cursor, ? extends Boolean>> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef<ContentProviderClient> f63417a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Context f63418b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Uri f63419c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ C3085be f63420d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public U3(Ref.ObjectRef<ContentProviderClient> objectRef, Context context, Uri uri, C3085be c3085be, S3 s32) {
        super(0);
        this.f63417a = objectRef;
        this.f63418b = context;
        this.f63419c = uri;
        this.f63420d = c3085be;
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0079 A[Catch: all -> 0x0062, TRY_LEAVE, TryCatch #1 {all -> 0x0062, blocks: (B:14:0x0055, B:17:0x005d, B:21:0x0066, B:23:0x0071, B:24:0x0079), top: B:39:0x0055 }] */
    @Override // kotlin.jvm.functions.Function0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke() {
        Pair pair;
        CancellationSignal cancellationSignal;
        String strConcat = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        try {
            this.f63417a.f71863a = this.f63418b.getContentResolver().acquireUnstableContentProviderClient(this.f63419c);
            C3085be c3085be = this.f63420d;
            if (c3085be != null && (cancellationSignal = c3085be.f64037b) != null) {
                cancellationSignal.throwIfCanceled();
            }
            C3309p1 c3309p1 = C3309p1.f65465a;
            EnumC3131e9 tag = EnumC3131e9.ContentProviderRequests;
            String str = "IPC query " + this.f63419c;
            Ref.ObjectRef<ContentProviderClient> objectRef = this.f63417a;
            Uri uri = this.f63419c;
            C3085be c3085be2 = this.f63420d;
            c3309p1.getClass();
            Intrinsics.g(tag, "tag");
            long jCurrentTimeMillis = System.currentTimeMillis();
            String simpleName = null;
            try {
                ContentProviderClient contentProviderClient = (ContentProviderClient) objectRef.f71863a;
                if (contentProviderClient == null) {
                    A4.c cVar = A4.Companion;
                    Exception exc = new Exception(uri + " returned null cursor");
                    cVar.getClass();
                    pair = new Pair(A4.c.a(exc), Boolean.TRUE);
                } else {
                    Cursor cursorQuery = contentProviderClient.query(uri, null, null, null, null, c3085be2 != null ? c3085be2.f64037b : null);
                    if (cursorQuery != null) {
                        pair = new Pair(cursorQuery, Boolean.FALSE);
                    }
                }
                String message = str + com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                Intrinsics.g(message, "message");
                C3309p1.c(tag, message + " took " + (System.currentTimeMillis() - jCurrentTimeMillis) + "ms");
                return pair;
            } catch (Throwable th2) {
                try {
                    simpleName = th2.getClass().getSimpleName();
                    throw th2;
                } catch (Throwable th3) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(str);
                    if (simpleName != null) {
                        strConcat = " FAILING with ".concat(simpleName);
                    }
                    sb2.append(strConcat);
                    String message2 = sb2.toString();
                    Intrinsics.g(message2, "message");
                    C3309p1.c(tag, message2 + " took " + (System.currentTimeMillis() - jCurrentTimeMillis) + "ms");
                    throw th3;
                }
            }
        } catch (DeadObjectException e3) {
            C3309p1.c(EnumC3131e9.ContentProviderRequests, "A Dead Object Exception occurred on query for " + this.f63419c);
            A4.Companion.getClass();
            return new Pair(A4.c.a(e3), Boolean.TRUE);
        } catch (Throwable th4) {
            A4.Companion.getClass();
            return new Pair(A4.c.a(th4), Boolean.FALSE);
        }
    }
}
