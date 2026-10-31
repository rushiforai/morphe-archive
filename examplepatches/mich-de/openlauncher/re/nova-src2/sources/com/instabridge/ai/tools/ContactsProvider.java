package com.instabridge.ai.tools;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import h6.c1;
import java.util.List;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001:\u0001\nJ&\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\u0006\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\bH¦@¢\u0006\u0002\u0010\t¨\u0006\u000b"}, d2 = {"Lcom/instabridge/ai/tools/ContactsProvider;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "searchContacts", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/tools/ContactsProvider$ContactResult;", "query", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "limit", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/String;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "ContactResult", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface ContactsProvider {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public static final class DefaultImpls {
        public static /* synthetic */ Object searchContacts$default(ContactsProvider contactsProvider, String str, int i5, Continuation continuation, int i11, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: searchContacts");
            }
            if ((i11 & 2) != 0) {
                i5 = 10;
            }
            return contactsProvider.searchContacts(str, i5, continuation);
        }
    }

    @Nullable
    Object searchContacts(@NotNull String str, int i5, @NotNull Continuation<? super List<ContactResult>> continuation);

    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/instabridge/ai/tools/ContactsProvider$ContactResult;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "phoneNumber", "phoneType", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getName", "()Ljava/lang/String;", "getPhoneNumber", "getPhoneType", "component1", "component2", "component3", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ContactResult {
        public static final int $stable = 0;

        @NotNull
        private final String name;

        @NotNull
        private final String phoneNumber;

        @Nullable
        private final String phoneType;

        public ContactResult(@NotNull String name, @NotNull String phoneNumber, @Nullable String str) {
            Intrinsics.g(name, "name");
            Intrinsics.g(phoneNumber, "phoneNumber");
            this.name = name;
            this.phoneNumber = phoneNumber;
            this.phoneType = str;
        }

        public static /* synthetic */ ContactResult copy$default(ContactResult contactResult, String str, String str2, String str3, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = contactResult.name;
            }
            if ((i5 & 2) != 0) {
                str2 = contactResult.phoneNumber;
            }
            if ((i5 & 4) != 0) {
                str3 = contactResult.phoneType;
            }
            return contactResult.copy(str, str2, str3);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getName() {
            return this.name;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getPhoneNumber() {
            return this.phoneNumber;
        }

        @Nullable
        /* renamed from: component3, reason: from getter */
        public final String getPhoneType() {
            return this.phoneType;
        }

        @NotNull
        public final ContactResult copy(@NotNull String name, @NotNull String phoneNumber, @Nullable String phoneType) {
            Intrinsics.g(name, "name");
            Intrinsics.g(phoneNumber, "phoneNumber");
            return new ContactResult(name, phoneNumber, phoneType);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ContactResult)) {
                return false;
            }
            ContactResult contactResult = (ContactResult) other;
            return Intrinsics.b(this.name, contactResult.name) && Intrinsics.b(this.phoneNumber, contactResult.phoneNumber) && Intrinsics.b(this.phoneType, contactResult.phoneType);
        }

        @NotNull
        public final String getName() {
            return this.name;
        }

        @NotNull
        public final String getPhoneNumber() {
            return this.phoneNumber;
        }

        @Nullable
        public final String getPhoneType() {
            return this.phoneType;
        }

        public int hashCode() {
            int iE = c0.e(this.name.hashCode() * 31, 31, this.phoneNumber);
            String str = this.phoneType;
            return iE + (str == null ? 0 : str.hashCode());
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("ContactResult(name=");
            sb2.append(this.name);
            sb2.append(", phoneNumber=");
            sb2.append(this.phoneNumber);
            sb2.append(", phoneType=");
            return c1.t(sb2, this.phoneType, ')');
        }

        public /* synthetic */ ContactResult(String str, String str2, String str3, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(str, str2, (i5 & 4) != 0 ? null : str3);
        }
    }
}
