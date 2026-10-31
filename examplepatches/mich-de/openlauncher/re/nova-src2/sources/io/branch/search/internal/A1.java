package io.branch.search.internal;

import android.content.ContentProvider;
import android.net.Uri;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class A1<T> implements ContentProvider.PipeDataWriter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ F4 f61916a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3366s8 f61917b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ C3074b3 f61918c;

    public A1(F4 f42, C3366s8 c3366s8, C3074b3 c3074b3) {
        this.f61916a = f42;
        this.f61917b = c3366s8;
        this.f61918c = c3074b3;
    }

    @Override // android.content.ContentProvider.PipeDataWriter
    public final void writeDataToPipe(ParcelFileDescriptor output, Uri uri, String str, Bundle bundle, Object obj) {
        Intrinsics.g(output, "output");
        Intrinsics.g(uri, "<anonymous parameter 1>");
        Intrinsics.g(str, "<anonymous parameter 2>");
        try {
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(output.getFileDescriptor()), UserMetadata.MAX_INTERNAL_KEY_SIZE);
            F4 f42 = this.f61916a;
            C3366s8 c3366s8 = this.f61917b;
            try {
                D7.Companion.a(f42, c3366s8).a(this.f61918c, bufferedOutputStream);
                Unit unit = Unit.f71706a;
                bufferedOutputStream.close();
            } finally {
            }
        } catch (Throwable th2) {
            EnumC3131e9 logTag = EnumC3131e9.ContentProviderRequests;
            C3309p1 c3309p1 = C3309p1.f65465a;
            Intrinsics.g(logTag, "logTag");
            C3309p1.a(a50.b.f402c, "content-provider-request", "Failed to load image", th2);
        }
    }
}
