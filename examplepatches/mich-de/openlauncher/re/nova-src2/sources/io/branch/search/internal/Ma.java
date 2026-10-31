package io.branch.search.internal;

import android.os.UserHandle;
import io.branch.search.internal.C3250la;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$onShortcutsChanged$2", f = "PackageSyncManager.kt", l = {565, 567, 570}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class Ma extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public List f62936a;

    /* renamed from: b, reason: collision with root package name */
    public String f62937b;

    /* renamed from: c, reason: collision with root package name */
    public Object f62938c;

    /* renamed from: d, reason: collision with root package name */
    public Iterator f62939d;

    /* renamed from: e, reason: collision with root package name */
    public int f62940e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ C3250la f62941f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ String f62942g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ UserHandle f62943h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Ma(C3250la c3250la, String str, UserHandle userHandle, Continuation<? super Ma> continuation) {
        super(2, continuation);
        this.f62941f = c3250la;
        this.f62942g = str;
        this.f62943h = userHandle;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new Ma(this.f62941f, this.f62942g, this.f62943h, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((Ma) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0049, code lost:
    
        if (r8 == r0) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x008a  */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(@NotNull Object obj) {
        List<C3460y0> list;
        String str;
        UserHandle userHandle;
        Iterator it;
        String str2;
        UserHandle userHandle2;
        Iterator it2;
        List<C3460y0> list2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f62940e;
        if (i5 == 0) {
            ResultKt.b(obj);
            InterfaceC3183ha interfaceC3183ha = this.f62941f.f64966c;
            String str3 = this.f62942g;
            UserHandle userHandle3 = this.f62943h;
            this.f62940e = 1;
            obj = interfaceC3183ha.b(str3, userHandle3);
        } else {
            if (i5 != 1) {
                if (i5 != 2) {
                    if (i5 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    it2 = this.f62939d;
                    userHandle2 = (UserHandle) this.f62938c;
                    str2 = this.f62937b;
                    list2 = this.f62936a;
                    ResultKt.b(obj);
                    while (it2.hasNext()) {
                        C3250la.d dVar = (C3250la.d) it2.next();
                        this.f62936a = list2;
                        this.f62937b = str2;
                        this.f62938c = userHandle2;
                        this.f62939d = it2;
                        this.f62940e = 3;
                        if (dVar.a(str2, userHandle2, list2, this) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
                    return Unit.f71706a;
                }
                it = this.f62939d;
                userHandle = (UserHandle) this.f62938c;
                str = this.f62937b;
                List<C3460y0> list3 = this.f62936a;
                ResultKt.b(obj);
                list = list3;
                while (it.hasNext()) {
                    C3250la.b bVar = (C3250la.b) it.next();
                    this.f62936a = list;
                    this.f62937b = str;
                    this.f62938c = userHandle;
                    this.f62939d = it;
                    this.f62940e = 2;
                    if (bVar.a(str, userHandle, list, this) == coroutineSingletons) {
                        break;
                    }
                }
                ArrayList arrayList = this.f62941f.f64971h;
                str2 = this.f62942g;
                userHandle2 = this.f62943h;
                it2 = arrayList.iterator();
                list2 = list;
                while (it2.hasNext()) {
                }
                return Unit.f71706a;
            }
            ResultKt.b(obj);
        }
        list = (List) obj;
        ArrayList arrayList2 = this.f62941f.f64970g;
        str = this.f62942g;
        userHandle = this.f62943h;
        it = arrayList2.iterator();
        while (it.hasNext()) {
        }
        ArrayList arrayList3 = this.f62941f.f64971h;
        str2 = this.f62942g;
        userHandle2 = this.f62943h;
        it2 = arrayList3.iterator();
        list2 = list;
        while (it2.hasNext()) {
        }
        return Unit.f71706a;
    }
}
