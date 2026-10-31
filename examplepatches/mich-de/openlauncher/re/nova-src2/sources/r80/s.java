package r80;

import android.content.ContentResolver;
import android.content.Context;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.ContactActionsHelper;
import nova.branch.engage.sesame_lite.internal.IdHash;

/* loaded from: classes5.dex */
public final class s extends w {

    /* renamed from: c, reason: collision with root package name */
    public final long f85707c;

    /* renamed from: d, reason: collision with root package name */
    public final String f85708d;

    /* renamed from: e, reason: collision with root package name */
    public final b f85709e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s(IdHash idHash, long j11, String lookupKey) {
        super(idHash, null);
        Intrinsics.g(idHash, "idHash");
        Intrinsics.g(lookupKey, "lookupKey");
        this.f85707c = j11;
        this.f85708d = lookupKey;
        this.f85709e = b.values()[idHash.m447getSubtypew2LRezQ() & 255];
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(Context context, ContinuationImpl continuationImpl) {
        r rVar;
        s sVar;
        if (continuationImpl instanceof r) {
            rVar = (r) continuationImpl;
            int i5 = rVar.f85706w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rVar.f85706w = i5 - Integer.MIN_VALUE;
            } else {
                rVar = new r(this, continuationImpl);
            }
        }
        Object launchDataForType = rVar.f85704u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = rVar.f85706w;
        if (i11 == 0) {
            ResultKt.b(launchDataForType);
            ContactActionsHelper contactActionsHelper = ContactActionsHelper.INSTANCE;
            ContentResolver contentResolver = context.getContentResolver();
            Intrinsics.f(contentResolver, "getContentResolver(...)");
            rVar.f85703t = this;
            rVar.f85706w = 1;
            launchDataForType = contactActionsHelper.getLaunchDataForType(contentResolver, this.f85709e, this.f85708d, rVar);
            if (launchDataForType == coroutineSingletons) {
                return coroutineSingletons;
            }
            sVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            sVar = rVar.f85703t;
            ResultKt.b(launchDataForType);
        }
        String str = (String) launchDataForType;
        return str != null ? ContactActionsHelper.INSTANCE.makeIntent(sVar.f85709e, sVar.f85707c, str) : ContactActionsHelper.INSTANCE.makeIntent(b.f85649b, sVar.f85707c, sVar.f85708d);
    }
}
