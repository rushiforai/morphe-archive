package io.branch.search.internal.requesthandler.model;

import a2.c;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.search.internal.C3231k8;
import io.branch.search.internal.C3248l8;
import io.branch.search.internal.I8;
import io.branch.search.internal.Z;
import java.lang.annotation.Annotation;
import java.util.List;
import kotlin.Deprecated;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.reflect.KClass;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SealedClassSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ObjectSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Serializable
/* loaded from: classes4.dex */
public interface Link {

    @NotNull
    public static final Companion Companion = Companion.f65651a;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$Companion;", b.f42142b, "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lio/branch/search/internal/requesthandler/model/Link;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final class Companion {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ Companion f65651a = new Companion();

        @NotNull
        public final KSerializer<Link> serializer() {
            ReflectionFactory reflectionFactory = Reflection.f71864a;
            return new SealedClassSerializer("io.branch.search.internal.requesthandler.model.Link", reflectionFactory.getOrCreateKotlinClass(Link.class), new KClass[]{reflectionFactory.getOrCreateKotlinClass(AppLink.class), reflectionFactory.getOrCreateKotlinClass(CustomIntentLink.class), reflectionFactory.getOrCreateKotlinClass(LaunchIntentLink.class), reflectionFactory.getOrCreateKotlinClass(ShortcutLink.class), reflectionFactory.getOrCreateKotlinClass(TestInstalledLink.class), reflectionFactory.getOrCreateKotlinClass(TestNotInstalledLink.class), reflectionFactory.getOrCreateKotlinClass(UriLink.class), reflectionFactory.getOrCreateKotlinClass(ViewIntentLink.class)}, new KSerializer[]{Link$AppLink$$serializer.INSTANCE, Link$CustomIntentLink$$serializer.INSTANCE, new ObjectSerializer("io.branch.search.internal.requesthandler.model.Link.LaunchIntentLink", LaunchIntentLink.f65657a, new Annotation[0]), Link$ShortcutLink$$serializer.INSTANCE, Link$TestInstalledLink$$serializer.INSTANCE, Link$TestNotInstalledLink$$serializer.INSTANCE, Link$UriLink$$serializer.INSTANCE, Link$ViewIntentLink$$serializer.INSTANCE}, new Annotation[0]);
        }
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0005\u0010\u0006J\u0016\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00000\u0002HÆ\u0001¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0007"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$LaunchIntentLink;", "Lio/branch/search/internal/requesthandler/model/Link;", "Lkotlinx/serialization/KSerializer;", "serializer", "()Lkotlinx/serialization/KSerializer;", "<init>", "()V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    @Serializable
    public static final class LaunchIntentLink implements Link {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final LaunchIntentLink f65657a = new LaunchIntentLink();

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final String f65658b = "launch_intent";

        /* renamed from: c, reason: collision with root package name */
        public static final /* synthetic */ Lazy<KSerializer<Object>> f65659c = LazyKt.b(LazyThreadSafetyMode.f71680b, a.f65660a);

        public static final class a extends Lambda implements Function0<KSerializer<Object>> {

            /* renamed from: a, reason: collision with root package name */
            public static final a f65660a = new a();

            public a() {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                return new ObjectSerializer("io.branch.search.internal.requesthandler.model.Link.LaunchIntentLink", LaunchIntentLink.f65657a, new Annotation[0]);
            }
        }

        @Override // io.branch.search.internal.requesthandler.model.Link
        @NotNull
        /* renamed from: a */
        public final String getF65679e() {
            return f65658b;
        }

        @NotNull
        public final KSerializer<LaunchIntentLink> serializer() {
            return (KSerializer) f65659c.getValue();
        }
    }

    @NotNull
    /* renamed from: a */
    String getF65679e();

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0002¨\u0006\u0004"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$AppLink;", "Lio/branch/search/internal/requesthandler/model/Link;", k.O, "$serializer", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    @Serializable
    public static final /* data */ class AppLink implements Link {

        /* renamed from: Companion, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion();

        /* renamed from: a, reason: collision with root package name */
        @Nullable
        public final String f65647a;

        /* renamed from: b, reason: collision with root package name */
        public final long f65648b;

        /* renamed from: c, reason: collision with root package name */
        @Nullable
        public final String f65649c;

        /* renamed from: d, reason: collision with root package name */
        @NotNull
        public final String f65650d;

        @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$AppLink$Companion;", b.f42142b, "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lio/branch/search/internal/requesthandler/model/Link$AppLink;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
        public static final class Companion {
            @NotNull
            public final KSerializer<AppLink> serializer() {
                return Link$AppLink$$serializer.INSTANCE;
            }
        }

        @Deprecated
        public /* synthetic */ AppLink(int i5, String str, long j11, String str2, String str3) {
            if (7 != (i5 & 7)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 7, Link$AppLink$$serializer.INSTANCE.getDescriptor());
            }
            this.f65647a = str;
            this.f65648b = j11;
            this.f65649c = str2;
            if ((i5 & 8) == 0) {
                this.f65650d = I8.a(1);
            } else {
                this.f65650d = str3;
            }
        }

        @Override // io.branch.search.internal.requesthandler.model.Link
        @NotNull
        /* renamed from: a, reason: from getter */
        public final String getF65679e() {
            return this.f65650d;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof AppLink)) {
                return false;
            }
            AppLink appLink = (AppLink) obj;
            return Intrinsics.b(this.f65647a, appLink.f65647a) && this.f65648b == appLink.f65648b && Intrinsics.b(this.f65649c, appLink.f65649c);
        }

        public final int hashCode() {
            String str = this.f65647a;
            int iA = C3231k8.a(this.f65648b, (str == null ? 0 : str.hashCode()) * 31, 31);
            String str2 = this.f65649c;
            return iA + (str2 != null ? str2.hashCode() : 0);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("AppLink(packageName=");
            sb2.append(this.f65647a);
            sb2.append(", user=");
            sb2.append(this.f65648b);
            sb2.append(", activity=");
            return Z.a(sb2, this.f65649c, ')');
        }

        public AppLink(long j11, @Nullable String str, @Nullable String str2) {
            this.f65647a = str;
            this.f65648b = j11;
            this.f65649c = str2;
            this.f65650d = I8.a(1);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0002¨\u0006\u0004"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$CustomIntentLink;", "Lio/branch/search/internal/requesthandler/model/Link;", k.O, "$serializer", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    @Serializable
    public static final /* data */ class CustomIntentLink implements Link {

        /* renamed from: Companion, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion();

        /* renamed from: a, reason: collision with root package name */
        @Nullable
        public final String f65652a;

        /* renamed from: b, reason: collision with root package name */
        @Nullable
        public final String f65653b;

        /* renamed from: c, reason: collision with root package name */
        @Nullable
        public final String f65654c;

        /* renamed from: d, reason: collision with root package name */
        @Nullable
        public final String f65655d;

        /* renamed from: e, reason: collision with root package name */
        @NotNull
        public final String f65656e;

        @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$CustomIntentLink$Companion;", b.f42142b, "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lio/branch/search/internal/requesthandler/model/Link$CustomIntentLink;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
        public static final class Companion {
            @NotNull
            public final KSerializer<CustomIntentLink> serializer() {
                return Link$CustomIntentLink$$serializer.INSTANCE;
            }
        }

        @Deprecated
        public /* synthetic */ CustomIntentLink(int i5, String str, String str2, String str3, String str4, String str5) {
            if (15 != (i5 & 15)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 15, Link$CustomIntentLink$$serializer.INSTANCE.getDescriptor());
            }
            this.f65652a = str;
            this.f65653b = str2;
            this.f65654c = str3;
            this.f65655d = str4;
            if ((i5 & 16) == 0) {
                this.f65656e = I8.a(6);
            } else {
                this.f65656e = str5;
            }
        }

        @Override // io.branch.search.internal.requesthandler.model.Link
        @NotNull
        /* renamed from: a, reason: from getter */
        public final String getF65679e() {
            return this.f65656e;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof CustomIntentLink)) {
                return false;
            }
            CustomIntentLink customIntentLink = (CustomIntentLink) obj;
            return Intrinsics.b(this.f65652a, customIntentLink.f65652a) && Intrinsics.b(this.f65653b, customIntentLink.f65653b) && Intrinsics.b(this.f65654c, customIntentLink.f65654c) && Intrinsics.b(this.f65655d, customIntentLink.f65655d);
        }

        public final int hashCode() {
            String str = this.f65652a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f65653b;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f65654c;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f65655d;
            return iHashCode3 + (str4 != null ? str4.hashCode() : 0);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("CustomIntentLink(data=");
            sb2.append(this.f65652a);
            sb2.append(", category=");
            sb2.append(this.f65653b);
            sb2.append(", packageName=");
            sb2.append(this.f65654c);
            sb2.append(", className=");
            return Z.a(sb2, this.f65655d, ')');
        }

        public CustomIntentLink(@Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable String str4) {
            this.f65652a = str;
            this.f65653b = str2;
            this.f65654c = str3;
            this.f65655d = str4;
            this.f65656e = I8.a(6);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0002¨\u0006\u0004"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$ShortcutLink;", "Lio/branch/search/internal/requesthandler/model/Link;", k.O, "$serializer", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    @Serializable
    public static final /* data */ class ShortcutLink implements Link {

        /* renamed from: Companion, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion();

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final String f65661a;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final String f65662b;

        /* renamed from: c, reason: collision with root package name */
        public final long f65663c;

        /* renamed from: d, reason: collision with root package name */
        public final boolean f65664d;

        /* renamed from: e, reason: collision with root package name */
        @NotNull
        public final String f65665e;

        @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$ShortcutLink$Companion;", b.f42142b, "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lio/branch/search/internal/requesthandler/model/Link$ShortcutLink;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
        public static final class Companion {
            @NotNull
            public final KSerializer<ShortcutLink> serializer() {
                return Link$ShortcutLink$$serializer.INSTANCE;
            }
        }

        @Deprecated
        public /* synthetic */ ShortcutLink(int i5, String str, String str2, long j11, boolean z11, String str3) {
            if (15 != (i5 & 15)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 15, Link$ShortcutLink$$serializer.INSTANCE.getDescriptor());
            }
            this.f65661a = str;
            this.f65662b = str2;
            this.f65663c = j11;
            this.f65664d = z11;
            if ((i5 & 16) == 0) {
                this.f65665e = I8.a(2);
            } else {
                this.f65665e = str3;
            }
        }

        @Override // io.branch.search.internal.requesthandler.model.Link
        @NotNull
        /* renamed from: a, reason: from getter */
        public final String getF65679e() {
            return this.f65665e;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ShortcutLink)) {
                return false;
            }
            ShortcutLink shortcutLink = (ShortcutLink) obj;
            return Intrinsics.b(this.f65661a, shortcutLink.f65661a) && Intrinsics.b(this.f65662b, shortcutLink.f65662b) && this.f65663c == shortcutLink.f65663c && this.f65664d == shortcutLink.f65664d;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public final int hashCode() {
            int iA = C3231k8.a(this.f65663c, C3248l8.a(this.f65662b, this.f65661a.hashCode() * 31, 31), 31);
            boolean z11 = this.f65664d;
            int i5 = z11;
            if (z11 != 0) {
                i5 = 1;
            }
            return iA + i5;
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("ShortcutLink(id=");
            sb2.append(this.f65661a);
            sb2.append(", packageName=");
            sb2.append(this.f65662b);
            sb2.append(", user=");
            sb2.append(this.f65663c);
            sb2.append(", isDynamic=");
            return c.p(sb2, this.f65664d, ')');
        }

        public ShortcutLink(@NotNull String id2, @NotNull String packageName, long j11, boolean z11) {
            Intrinsics.g(id2, "id");
            Intrinsics.g(packageName, "packageName");
            this.f65661a = id2;
            this.f65662b = packageName;
            this.f65663c = j11;
            this.f65664d = z11;
            this.f65665e = I8.a(2);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0002¨\u0006\u0004"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$UriLink;", "Lio/branch/search/internal/requesthandler/model/Link;", k.O, "$serializer", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    @Serializable
    public static final /* data */ class UriLink implements Link {

        /* renamed from: Companion, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion();

        /* renamed from: a, reason: collision with root package name */
        @Nullable
        public final String f65672a;

        /* renamed from: b, reason: collision with root package name */
        @Nullable
        public final String f65673b;

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public final String f65674c;

        @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$UriLink$Companion;", b.f42142b, "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lio/branch/search/internal/requesthandler/model/Link$UriLink;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
        public static final class Companion {
            @NotNull
            public final KSerializer<UriLink> serializer() {
                return Link$UriLink$$serializer.INSTANCE;
            }
        }

        @Deprecated
        public /* synthetic */ UriLink(int i5, String str, String str2, String str3) {
            if (3 != (i5 & 3)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 3, Link$UriLink$$serializer.INSTANCE.getDescriptor());
            }
            this.f65672a = str;
            this.f65673b = str2;
            if ((i5 & 4) == 0) {
                this.f65674c = I8.a(3);
            } else {
                this.f65674c = str3;
            }
        }

        @Override // io.branch.search.internal.requesthandler.model.Link
        @NotNull
        /* renamed from: a, reason: from getter */
        public final String getF65679e() {
            return this.f65674c;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof UriLink)) {
                return false;
            }
            UriLink uriLink = (UriLink) obj;
            return Intrinsics.b(this.f65672a, uriLink.f65672a) && Intrinsics.b(this.f65673b, uriLink.f65673b);
        }

        public final int hashCode() {
            String str = this.f65672a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f65673b;
            return iHashCode + (str2 != null ? str2.hashCode() : 0);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("UriLink(intentUri=");
            sb2.append(this.f65672a);
            sb2.append(", packageName=");
            return Z.a(sb2, this.f65673b, ')');
        }

        public UriLink(@Nullable String str, @Nullable String str2) {
            this.f65672a = str;
            this.f65673b = str2;
            this.f65674c = I8.a(3);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0002¨\u0006\u0004"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$ViewIntentLink;", "Lio/branch/search/internal/requesthandler/model/Link;", k.O, "$serializer", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    @Serializable
    public static final /* data */ class ViewIntentLink implements Link {

        /* renamed from: Companion, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion();

        /* renamed from: a, reason: collision with root package name */
        @Nullable
        public final String f65675a;

        /* renamed from: b, reason: collision with root package name */
        @Nullable
        public final String f65676b;

        /* renamed from: c, reason: collision with root package name */
        @Nullable
        public final String f65677c;

        /* renamed from: d, reason: collision with root package name */
        @Nullable
        public final Boolean f65678d;

        /* renamed from: e, reason: collision with root package name */
        @NotNull
        public final String f65679e;

        @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$ViewIntentLink$Companion;", b.f42142b, "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lio/branch/search/internal/requesthandler/model/Link$ViewIntentLink;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
        public static final class Companion {
            @NotNull
            public final KSerializer<ViewIntentLink> serializer() {
                return Link$ViewIntentLink$$serializer.INSTANCE;
            }
        }

        @Deprecated
        public /* synthetic */ ViewIntentLink(int i5, String str, String str2, String str3, Boolean bool, String str4) {
            if (3 != (i5 & 3)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 3, Link$ViewIntentLink$$serializer.INSTANCE.getDescriptor());
            }
            this.f65675a = str;
            this.f65676b = str2;
            if ((i5 & 4) == 0) {
                this.f65677c = null;
            } else {
                this.f65677c = str3;
            }
            if ((i5 & 8) == 0) {
                this.f65678d = null;
            } else {
                this.f65678d = bool;
            }
            if ((i5 & 16) == 0) {
                this.f65679e = I8.a(4);
            } else {
                this.f65679e = str4;
            }
        }

        @Override // io.branch.search.internal.requesthandler.model.Link
        @NotNull
        /* renamed from: a, reason: from getter */
        public final String getF65679e() {
            return this.f65679e;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ViewIntentLink)) {
                return false;
            }
            ViewIntentLink viewIntentLink = (ViewIntentLink) obj;
            return Intrinsics.b(this.f65675a, viewIntentLink.f65675a) && Intrinsics.b(this.f65676b, viewIntentLink.f65676b) && Intrinsics.b(this.f65677c, viewIntentLink.f65677c) && Intrinsics.b(this.f65678d, viewIntentLink.f65678d);
        }

        public final int hashCode() {
            String str = this.f65675a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f65676b;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f65677c;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            Boolean bool = this.f65678d;
            return iHashCode3 + (bool != null ? bool.hashCode() : 0);
        }

        @NotNull
        public final String toString() {
            return "ViewIntentLink(data=" + this.f65675a + ", forcePackage=" + this.f65676b + ", targetPackageName=" + this.f65677c + ", followRedirects=" + this.f65678d + ')';
        }

        public ViewIntentLink(@Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable Boolean bool) {
            this.f65675a = str;
            this.f65676b = str2;
            this.f65677c = str3;
            this.f65678d = bool;
            this.f65679e = I8.a(4);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0002¨\u0006\u0004"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$TestInstalledLink;", "Lio/branch/search/internal/requesthandler/model/Link;", k.O, "$serializer", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    @Serializable
    public static final /* data */ class TestInstalledLink implements Link {

        /* renamed from: Companion, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion();

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final List<Link> f65666a;

        /* renamed from: b, reason: collision with root package name */
        @Nullable
        public final String f65667b;

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public final String f65668c;

        @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$TestInstalledLink$Companion;", b.f42142b, "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lio/branch/search/internal/requesthandler/model/Link$TestInstalledLink;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
        public static final class Companion {
            @NotNull
            public final KSerializer<TestInstalledLink> serializer() {
                return Link$TestInstalledLink$$serializer.INSTANCE;
            }
        }

        public TestInstalledLink(@Nullable String str, @NotNull List links) {
            Intrinsics.g(links, "links");
            this.f65666a = links;
            this.f65667b = str;
            this.f65668c = I8.a(8);
        }

        @Override // io.branch.search.internal.requesthandler.model.Link
        @NotNull
        /* renamed from: a, reason: from getter */
        public final String getF65679e() {
            return this.f65668c;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof TestInstalledLink)) {
                return false;
            }
            TestInstalledLink testInstalledLink = (TestInstalledLink) obj;
            return Intrinsics.b(this.f65666a, testInstalledLink.f65666a) && Intrinsics.b(this.f65667b, testInstalledLink.f65667b);
        }

        public final int hashCode() {
            int iHashCode = this.f65666a.hashCode() * 31;
            String str = this.f65667b;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("TestInstalledLink(links=");
            sb2.append(this.f65666a);
            sb2.append(", packageName=");
            return Z.a(sb2, this.f65667b, ')');
        }

        @Deprecated
        public /* synthetic */ TestInstalledLink(int i5, List list, String str, String str2) {
            if (3 != (i5 & 3)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 3, Link$TestInstalledLink$$serializer.INSTANCE.getDescriptor());
            }
            this.f65666a = list;
            this.f65667b = str;
            if ((i5 & 4) == 0) {
                this.f65668c = I8.a(8);
            } else {
                this.f65668c = str2;
            }
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0002¨\u0006\u0004"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$TestNotInstalledLink;", "Lio/branch/search/internal/requesthandler/model/Link;", k.O, "$serializer", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    @Serializable
    public static final /* data */ class TestNotInstalledLink implements Link {

        /* renamed from: Companion, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion();

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final List<Link> f65669a;

        /* renamed from: b, reason: collision with root package name */
        @Nullable
        public final String f65670b;

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public final String f65671c;

        @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/requesthandler/model/Link$TestNotInstalledLink$Companion;", b.f42142b, "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lio/branch/search/internal/requesthandler/model/Link$TestNotInstalledLink;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
        public static final class Companion {
            @NotNull
            public final KSerializer<TestNotInstalledLink> serializer() {
                return Link$TestNotInstalledLink$$serializer.INSTANCE;
            }
        }

        public TestNotInstalledLink(@Nullable String str, @NotNull List links) {
            Intrinsics.g(links, "links");
            this.f65669a = links;
            this.f65670b = str;
            this.f65671c = I8.a(7);
        }

        @Override // io.branch.search.internal.requesthandler.model.Link
        @NotNull
        /* renamed from: a, reason: from getter */
        public final String getF65679e() {
            return this.f65671c;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof TestNotInstalledLink)) {
                return false;
            }
            TestNotInstalledLink testNotInstalledLink = (TestNotInstalledLink) obj;
            return Intrinsics.b(this.f65669a, testNotInstalledLink.f65669a) && Intrinsics.b(this.f65670b, testNotInstalledLink.f65670b);
        }

        public final int hashCode() {
            int iHashCode = this.f65669a.hashCode() * 31;
            String str = this.f65670b;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("TestNotInstalledLink(links=");
            sb2.append(this.f65669a);
            sb2.append(", packageName=");
            return Z.a(sb2, this.f65670b, ')');
        }

        @Deprecated
        public /* synthetic */ TestNotInstalledLink(int i5, List list, String str, String str2) {
            if (3 != (i5 & 3)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 3, Link$TestNotInstalledLink$$serializer.INSTANCE.getDescriptor());
            }
            this.f65669a = list;
            this.f65670b = str;
            if ((i5 & 4) == 0) {
                this.f65671c = I8.a(7);
            } else {
                this.f65671c = str2;
            }
        }
    }
}
