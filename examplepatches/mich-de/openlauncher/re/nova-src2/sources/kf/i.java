package kf;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class i implements jf.f {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f71522a;

    /* renamed from: b, reason: collision with root package name */
    public List f71523b;

    @Override // jf.f
    public int a(long j11) {
        switch (this.f71522a) {
            case 0:
                if (j11 < 0) {
                }
                break;
            case 1:
                break;
            case 2:
                break;
            default:
                if (j11 < 0) {
                }
                break;
        }
        return -1;
    }

    @Override // jf.f
    public List h(long j11) {
        switch (this.f71522a) {
            case 0:
                return j11 >= 0 ? this.f71523b : Collections.EMPTY_LIST;
            case 1:
                return this.f71523b;
            case 2:
                return this.f71523b;
            default:
                return j11 >= 0 ? this.f71523b : Collections.EMPTY_LIST;
        }
    }

    @Override // jf.f
    public long p(int i5) {
        switch (this.f71522a) {
            case 0:
                wf.a.e(i5 == 0);
                break;
            case 1:
                break;
            case 2:
                break;
            default:
                wf.a.e(i5 == 0);
                break;
        }
        return 0L;
    }

    @Override // jf.f
    public int r() {
        switch (this.f71522a) {
        }
        return 1;
    }

    public /* synthetic */ i(int i5, List list) {
        this.f71522a = i5;
        this.f71523b = list;
    }

    public i(List confirmationDefinitions) {
        this.f71522a = 3;
        Intrinsics.g(confirmationDefinitions, "confirmationDefinitions");
        this.f71523b = confirmationDefinitions;
    }

    public i(ArrayList arrayList) {
        this.f71522a = 4;
        this.f71523b = Collections.unmodifiableList(arrayList);
    }
}
