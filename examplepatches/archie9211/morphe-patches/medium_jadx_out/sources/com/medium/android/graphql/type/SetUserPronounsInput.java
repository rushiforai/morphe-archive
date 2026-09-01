package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.ka1;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0015\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u0019\u0010\n\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0001J\u0013\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0004HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/type/SetUserPronounsInput;", "", "pronouns", "", "", "<init>", "(Ljava/util/List;)V", "getPronouns", "()Ljava/util/List;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SetUserPronounsInput {
    private final List<String> pronouns;

    public SetUserPronounsInput(List<String> list) {
        list.getClass();
        this.pronouns = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ SetUserPronounsInput copy$default(SetUserPronounsInput setUserPronounsInput, List list, int i, Object obj) {
        if ((i & 1) != 0) {
            list = setUserPronounsInput.pronouns;
        }
        return setUserPronounsInput.copy(list);
    }

    public final List<String> component1() {
        return this.pronouns;
    }

    public final SetUserPronounsInput copy(List<String> pronouns) {
        pronouns.getClass();
        return new SetUserPronounsInput(pronouns);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof SetUserPronounsInput) && g76.L(this.pronouns, ((SetUserPronounsInput) other).pronouns);
    }

    public final List<String> getPronouns() {
        return this.pronouns;
    }

    public final int hashCode() {
        return this.pronouns.hashCode();
    }

    public final String toString() {
        return ka1.t("SetUserPronounsInput(pronouns=", ")", this.pronouns);
    }
}
