package io.branch.search.internal;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import java.io.Serializable;
import java.util.List;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager", f = "PackageSyncManager.kt", l = {PglCryptUtils.DECRYPT_FAILED, PglCryptUtils.UNKNOWN_ERR, 609, 610}, m = "onPackageChanged")
/* loaded from: classes4.dex */
public final class Ba extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public C3250la f62142a;

    /* renamed from: b, reason: collision with root package name */
    public Serializable f62143b;

    /* renamed from: c, reason: collision with root package name */
    public Object f62144c;

    /* renamed from: d, reason: collision with root package name */
    public List f62145d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f62146e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ C3250la f62147f;

    /* renamed from: g, reason: collision with root package name */
    public int f62148g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Ba(C3250la c3250la, Continuation<? super Ba> continuation) {
        super(continuation);
        this.f62147f = c3250la;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        this.f62146e = obj;
        this.f62148g |= Integer.MIN_VALUE;
        return C3250la.b(this.f62147f, null, null, this);
    }
}
