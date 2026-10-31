package da;

import com.google.protobuf.r0;

/* loaded from: classes2.dex */
public enum q implements r0 {
    TO_STATE_UNSPECIFIED(0),
    /* JADX INFO: Fake field, exist only in values array */
    UNCHANGED(1),
    TO_SUGGESTION0(2),
    TO_SUGGESTION1_WITH_VALID_PRIMARY(3),
    TO_SUGGESTION1_WITH_EMPTY_PRIMARY(4),
    TO_SUGGESTION2_WITH_VALID_PRIMARY(5),
    TO_SUGGESTION2_WITH_EMPTY_PRIMARY(6),
    TO_SUGGESTION3_WITH_VALID_PRIMARY(7),
    TO_SUGGESTION3_WITH_EMPTY_PRIMARY(8),
    TO_EMPTY_WITH_VALID_PRIMARY(9),
    TO_EMPTY_WITH_VALID_SUGGESTIONS_AND_EMPTY_PRIMARY(10),
    TO_EMPTY_WITH_EMPTY_SUGGESTIONS(11),
    TO_EMPTY_WITH_SUGGESTIONS_DISABLED(12),
    TO_CUSTOM_WITH_VALID_PRIMARY(13),
    TO_CUSTOM_WITH_VALID_SUGGESTIONS_AND_EMPTY_PRIMARY(14),
    TO_CUSTOM_WITH_EMPTY_SUGGESTIONS(15),
    TO_CUSTOM_WITH_SUGGESTIONS_DISABLED(16);


    /* renamed from: a, reason: collision with root package name */
    public final int f49119a;

    q(int i5) {
        this.f49119a = i5;
    }

    @Override // com.google.protobuf.r0
    public final int getNumber() {
        return this.f49119a;
    }
}
