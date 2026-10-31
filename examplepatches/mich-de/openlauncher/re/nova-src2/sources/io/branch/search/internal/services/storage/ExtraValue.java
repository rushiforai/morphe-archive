package io.branch.search.internal.services.storage;

import a2.c;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.search.internal.C3380t5;
import io.branch.search.internal.Z;
import java.lang.annotation.Annotation;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.reflect.KClass;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SealedClassSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Serializable
/* loaded from: classes4.dex */
public interface ExtraValue {

    @NotNull
    public static final Companion Companion = Companion.f65779a;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0002¨\u0006\u0004"}, d2 = {"Lio/branch/search/internal/services/storage/ExtraValue$BooleanValue;", "Lio/branch/search/internal/services/storage/ExtraValue;", k.O, "$serializer", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    @Serializable
    @SerialName("bool")
    public static final /* data */ class BooleanValue implements ExtraValue {

        /* renamed from: Companion, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion();

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final String f65777a;

        /* renamed from: b, reason: collision with root package name */
        public final boolean f65778b;

        @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/services/storage/ExtraValue$BooleanValue$Companion;", b.f42142b, "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lio/branch/search/internal/services/storage/ExtraValue$BooleanValue;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
        public static final class Companion {
            @NotNull
            public final KSerializer<BooleanValue> serializer() {
                return ExtraValue$BooleanValue$$serializer.INSTANCE;
            }
        }

        @Deprecated
        public /* synthetic */ BooleanValue(int i5, String str, boolean z11) {
            if (3 != (i5 & 3)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 3, ExtraValue$BooleanValue$$serializer.INSTANCE.getDescriptor());
            }
            this.f65777a = str;
            this.f65778b = z11;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof BooleanValue)) {
                return false;
            }
            BooleanValue booleanValue = (BooleanValue) obj;
            return Intrinsics.b(this.f65777a, booleanValue.f65777a) && this.f65778b == booleanValue.f65778b;
        }

        @Override // io.branch.search.internal.services.storage.ExtraValue
        @NotNull
        /* renamed from: getKey, reason: from getter */
        public final String getF65784a() {
            return this.f65777a;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public final int hashCode() {
            int iHashCode = this.f65777a.hashCode() * 31;
            boolean z11 = this.f65778b;
            int i5 = z11;
            if (z11 != 0) {
                i5 = 1;
            }
            return iHashCode + i5;
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("BooleanValue(key=");
            sb2.append(this.f65777a);
            sb2.append(", value=");
            return c.p(sb2, this.f65778b, ')');
        }

        public BooleanValue(@NotNull String key, boolean z11) {
            Intrinsics.g(key, "key");
            this.f65777a = key;
            this.f65778b = z11;
        }
    }

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/services/storage/ExtraValue$Companion;", b.f42142b, "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lio/branch/search/internal/services/storage/ExtraValue;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final class Companion {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ Companion f65779a = new Companion();

        @NotNull
        public final KSerializer<ExtraValue> serializer() {
            ReflectionFactory reflectionFactory = Reflection.f71864a;
            return new SealedClassSerializer("io.branch.search.internal.services.storage.ExtraValue", reflectionFactory.getOrCreateKotlinClass(ExtraValue.class), new KClass[]{reflectionFactory.getOrCreateKotlinClass(BooleanValue.class), reflectionFactory.getOrCreateKotlinClass(IntValue.class), reflectionFactory.getOrCreateKotlinClass(LongValue.class), reflectionFactory.getOrCreateKotlinClass(StringValue.class)}, new KSerializer[]{ExtraValue$BooleanValue$$serializer.INSTANCE, ExtraValue$IntValue$$serializer.INSTANCE, ExtraValue$LongValue$$serializer.INSTANCE, ExtraValue$StringValue$$serializer.INSTANCE}, new Annotation[0]);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0002¨\u0006\u0004"}, d2 = {"Lio/branch/search/internal/services/storage/ExtraValue$IntValue;", "Lio/branch/search/internal/services/storage/ExtraValue;", k.O, "$serializer", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    @Serializable
    @SerialName("int")
    public static final /* data */ class IntValue implements ExtraValue {

        /* renamed from: Companion, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion();

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final String f65780a;

        /* renamed from: b, reason: collision with root package name */
        public final int f65781b;

        @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/services/storage/ExtraValue$IntValue$Companion;", b.f42142b, "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lio/branch/search/internal/services/storage/ExtraValue$IntValue;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
        public static final class Companion {
            @NotNull
            public final KSerializer<IntValue> serializer() {
                return ExtraValue$IntValue$$serializer.INSTANCE;
            }
        }

        @Deprecated
        public /* synthetic */ IntValue(int i5, String str, int i11) {
            if (3 != (i5 & 3)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 3, ExtraValue$IntValue$$serializer.INSTANCE.getDescriptor());
            }
            this.f65780a = str;
            this.f65781b = i11;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof IntValue)) {
                return false;
            }
            IntValue intValue = (IntValue) obj;
            return Intrinsics.b(this.f65780a, intValue.f65780a) && this.f65781b == intValue.f65781b;
        }

        @Override // io.branch.search.internal.services.storage.ExtraValue
        @NotNull
        /* renamed from: getKey, reason: from getter */
        public final String getF65784a() {
            return this.f65780a;
        }

        public final int hashCode() {
            return Integer.hashCode(this.f65781b) + (this.f65780a.hashCode() * 31);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("IntValue(key=");
            sb2.append(this.f65780a);
            sb2.append(", value=");
            return c.m(sb2, this.f65781b, ')');
        }

        public IntValue(@NotNull String key, int i5) {
            Intrinsics.g(key, "key");
            this.f65780a = key;
            this.f65781b = i5;
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0002¨\u0006\u0004"}, d2 = {"Lio/branch/search/internal/services/storage/ExtraValue$LongValue;", "Lio/branch/search/internal/services/storage/ExtraValue;", k.O, "$serializer", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    @Serializable
    @SerialName("long")
    public static final /* data */ class LongValue implements ExtraValue {

        /* renamed from: Companion, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion();

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final String f65782a;

        /* renamed from: b, reason: collision with root package name */
        public final long f65783b;

        @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/services/storage/ExtraValue$LongValue$Companion;", b.f42142b, "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lio/branch/search/internal/services/storage/ExtraValue$LongValue;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
        public static final class Companion {
            @NotNull
            public final KSerializer<LongValue> serializer() {
                return ExtraValue$LongValue$$serializer.INSTANCE;
            }
        }

        @Deprecated
        public /* synthetic */ LongValue(int i5, String str, long j11) {
            if (3 != (i5 & 3)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 3, ExtraValue$LongValue$$serializer.INSTANCE.getDescriptor());
            }
            this.f65782a = str;
            this.f65783b = j11;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof LongValue)) {
                return false;
            }
            LongValue longValue = (LongValue) obj;
            return Intrinsics.b(this.f65782a, longValue.f65782a) && this.f65783b == longValue.f65783b;
        }

        @Override // io.branch.search.internal.services.storage.ExtraValue
        @NotNull
        /* renamed from: getKey, reason: from getter */
        public final String getF65784a() {
            return this.f65782a;
        }

        public final int hashCode() {
            return Long.hashCode(this.f65783b) + (this.f65782a.hashCode() * 31);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("LongValue(key=");
            sb2.append(this.f65782a);
            sb2.append(", value=");
            return C3380t5.a(sb2, this.f65783b, ')');
        }

        public LongValue(@NotNull String key, long j11) {
            Intrinsics.g(key, "key");
            this.f65782a = key;
            this.f65783b = j11;
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0002¨\u0006\u0004"}, d2 = {"Lio/branch/search/internal/services/storage/ExtraValue$StringValue;", "Lio/branch/search/internal/services/storage/ExtraValue;", k.O, "$serializer", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    @Serializable
    @SerialName("string")
    public static final /* data */ class StringValue implements ExtraValue {

        /* renamed from: Companion, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion();

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final String f65784a;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final String f65785b;

        @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/services/storage/ExtraValue$StringValue$Companion;", b.f42142b, "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lio/branch/search/internal/services/storage/ExtraValue$StringValue;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
        public static final class Companion {
            @NotNull
            public final KSerializer<StringValue> serializer() {
                return ExtraValue$StringValue$$serializer.INSTANCE;
            }
        }

        @Deprecated
        public /* synthetic */ StringValue(int i5, String str, String str2) {
            if (3 != (i5 & 3)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 3, ExtraValue$StringValue$$serializer.INSTANCE.getDescriptor());
            }
            this.f65784a = str;
            this.f65785b = str2;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof StringValue)) {
                return false;
            }
            StringValue stringValue = (StringValue) obj;
            return Intrinsics.b(this.f65784a, stringValue.f65784a) && Intrinsics.b(this.f65785b, stringValue.f65785b);
        }

        @Override // io.branch.search.internal.services.storage.ExtraValue
        @NotNull
        /* renamed from: getKey, reason: from getter */
        public final String getF65784a() {
            return this.f65784a;
        }

        public final int hashCode() {
            return this.f65785b.hashCode() + (this.f65784a.hashCode() * 31);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("StringValue(key=");
            sb2.append(this.f65784a);
            sb2.append(", value=");
            return Z.a(sb2, this.f65785b, ')');
        }

        public StringValue(@NotNull String key, @NotNull String value) {
            Intrinsics.g(key, "key");
            Intrinsics.g(value, "value");
            this.f65784a = key;
            this.f65785b = value;
        }
    }

    @NotNull
    /* renamed from: getKey */
    String getF65784a();
}
