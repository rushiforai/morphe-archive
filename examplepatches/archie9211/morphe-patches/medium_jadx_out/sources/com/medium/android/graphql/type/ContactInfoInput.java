package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0016\b\u0002\u0010\u0005\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00030\u0002¢\u0006\u0004\b\u0006\u0010\u0007J\u001e\u0010\b\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\b\u0010\tJ(\u0010\n\u001a\u00020\u00002\u0016\b\u0002\u0010\u0005\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00030\u0002HÆ\u0001¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\f\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u000eHÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R%\u0010\u0005\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0015\u001a\u0004\b\u0016\u0010\t¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/type/ContactInfoInput;", "", "Lzv8;", "", "", "emails", "<init>", "(Lzv8;)V", "component1", "()Lzv8;", "copy", "(Lzv8;)Lcom/medium/android/graphql/type/ContactInfoInput;", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getEmails", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ContactInfoInput {
    private final zv8 emails;

    public /* synthetic */ ContactInfoInput(zv8 zv8Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? xv8.a : zv8Var);
    }

    public static /* synthetic */ ContactInfoInput copy$default(ContactInfoInput contactInfoInput, zv8 zv8Var, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = contactInfoInput.emails;
        }
        return contactInfoInput.copy(zv8Var);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getEmails() {
        return this.emails;
    }

    public final ContactInfoInput copy(zv8 emails) {
        emails.getClass();
        return new ContactInfoInput(emails);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof ContactInfoInput) && g76.L(this.emails, ((ContactInfoInput) other).emails);
    }

    public final zv8 getEmails() {
        return this.emails;
    }

    public final int hashCode() {
        return this.emails.hashCode();
    }

    public final String toString() {
        return "ContactInfoInput(emails=" + this.emails + ")";
    }

    public ContactInfoInput(zv8 zv8Var) {
        zv8Var.getClass();
        this.emails = zv8Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public ContactInfoInput() {
        this(null, 1, 0 == true ? 1 : 0);
    }
}
