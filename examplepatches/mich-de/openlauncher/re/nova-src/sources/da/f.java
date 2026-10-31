package da;

import com.google.protobuf.r0;

/* loaded from: classes2.dex */
public enum f implements r0 {
    FROM_STATE_UNSPECIFIED(0),
    FROM_EMPTY(1),
    FROM_CUSTOM(2),
    FROM_SUGGESTED(3);


    /* renamed from: a, reason: collision with root package name */
    public final int f49103a;

    f(int i5) {
        this.f49103a = i5;
    }

    @Override // com.google.protobuf.r0
    public final int getNumber() {
        return this.f49103a;
    }
}
