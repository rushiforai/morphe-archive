package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0005\u0003\u0004\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/model/ConsentUi;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "ConsentPane", "ConsentSection", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.E, "com/stripe/android/model/i", "ft/e", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class ConsentUi implements StripeModel {

    /* renamed from: a, reason: collision with root package name */
    public final ConsentPane f43255a;

    /* renamed from: b, reason: collision with root package name */
    public final ConsentSection f43256b;

    @NotNull
    public static final ft.e Companion = new ft.e();

    @NotNull
    public static final Parcelable.Creator<ConsentUi> CREATOR = new v();

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0003\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/ConsentUi$ConsentPane;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "ScopesSection", "com/stripe/android/model/j", "com/stripe/android/model/k", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable
    public static final /* data */ class ConsentPane implements StripeModel {

        /* renamed from: a, reason: collision with root package name */
        public final String f43257a;

        /* renamed from: b, reason: collision with root package name */
        public final ScopesSection f43258b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43259c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43260d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43261e;

        @NotNull
        public static final k Companion = new k();

        @NotNull
        public static final Parcelable.Creator<ConsentPane> CREATOR = new l();

        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0003\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/ConsentUi$ConsentPane$ScopesSection;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "Scope", "com/stripe/android/model/m", "com/stripe/android/model/n", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        @Serializable
        public static final /* data */ class ScopesSection implements StripeModel {

            /* renamed from: a, reason: collision with root package name */
            public final String f43263a;

            /* renamed from: b, reason: collision with root package name */
            public final List f43264b;

            @NotNull
            public static final n Companion = new n();

            @NotNull
            public static final Parcelable.Creator<ScopesSection> CREATOR = new o();

            /* renamed from: c, reason: collision with root package name */
            public static final KSerializer[] f43262c = {null, new ArrayListSerializer(p.f44043a)};

            @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/ConsentUi$ConsentPane$ScopesSection$Scope;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/stripe/android/model/p", "com/stripe/android/model/q", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
            @Serializable
            public static final /* data */ class Scope implements StripeModel {

                /* renamed from: a, reason: collision with root package name */
                public final Icon f43265a;

                /* renamed from: b, reason: collision with root package name */
                public final String f43266b;

                /* renamed from: c, reason: collision with root package name */
                public final String f43267c;

                @NotNull
                public static final q Companion = new q();

                @NotNull
                public static final Parcelable.Creator<Scope> CREATOR = new r();

                public /* synthetic */ Scope(int i5, Icon icon, String str, String str2) {
                    if (7 != (i5 & 7)) {
                        PluginExceptionsKt.throwMissingFieldException(i5, 7, p.f44043a.getDescriptor());
                    }
                    this.f43265a = icon;
                    this.f43266b = str;
                    this.f43267c = str2;
                }

                @Override // android.os.Parcelable
                public final int describeContents() {
                    return 0;
                }

                public final boolean equals(Object obj) {
                    if (this == obj) {
                        return true;
                    }
                    if (!(obj instanceof Scope)) {
                        return false;
                    }
                    Scope scope = (Scope) obj;
                    return Intrinsics.b(this.f43265a, scope.f43265a) && Intrinsics.b(this.f43266b, scope.f43266b) && Intrinsics.b(this.f43267c, scope.f43267c);
                }

                public final int hashCode() {
                    int iHashCode = this.f43265a.f43269a.hashCode() * 31;
                    String str = this.f43266b;
                    return this.f43267c.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
                }

                public final String toString() {
                    StringBuilder sb2 = new StringBuilder("Scope(icon=");
                    sb2.append(this.f43265a);
                    sb2.append(", header=");
                    sb2.append(this.f43266b);
                    sb2.append(", description=");
                    return b.c0.q(sb2, this.f43267c, ")");
                }

                @Override // android.os.Parcelable
                public final void writeToParcel(Parcel dest, int i5) {
                    Intrinsics.g(dest, "dest");
                    this.f43265a.writeToParcel(dest, i5);
                    dest.writeString(this.f43266b);
                    dest.writeString(this.f43267c);
                }

                public Scope(Icon icon, String str, String description) {
                    Intrinsics.g(icon, "icon");
                    Intrinsics.g(description, "description");
                    this.f43265a = icon;
                    this.f43266b = str;
                    this.f43267c = description;
                }
            }

            public /* synthetic */ ScopesSection(int i5, String str, List list) {
                if (3 != (i5 & 3)) {
                    PluginExceptionsKt.throwMissingFieldException(i5, 3, m.f44042a.getDescriptor());
                }
                this.f43263a = str;
                this.f43264b = list;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof ScopesSection)) {
                    return false;
                }
                ScopesSection scopesSection = (ScopesSection) obj;
                return Intrinsics.b(this.f43263a, scopesSection.f43263a) && Intrinsics.b(this.f43264b, scopesSection.f43264b);
            }

            public final int hashCode() {
                return this.f43264b.hashCode() + (this.f43263a.hashCode() * 31);
            }

            public final String toString() {
                return "ScopesSection(header=" + this.f43263a + ", scopes=" + this.f43264b + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43263a);
                Iterator itK = fq.c.k(this.f43264b, dest);
                while (itK.hasNext()) {
                    ((Scope) itK.next()).writeToParcel(dest, i5);
                }
            }

            public ScopesSection(String header, List scopes) {
                Intrinsics.g(header, "header");
                Intrinsics.g(scopes, "scopes");
                this.f43263a = header;
                this.f43264b = scopes;
            }
        }

        public /* synthetic */ ConsentPane(int i5, String str, ScopesSection scopesSection, String str2, String str3, String str4) {
            if (31 != (i5 & 31)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 31, j.f44040a.getDescriptor());
            }
            this.f43257a = str;
            this.f43258b = scopesSection;
            this.f43259c = str2;
            this.f43260d = str3;
            this.f43261e = str4;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ConsentPane)) {
                return false;
            }
            ConsentPane consentPane = (ConsentPane) obj;
            return Intrinsics.b(this.f43257a, consentPane.f43257a) && Intrinsics.b(this.f43258b, consentPane.f43258b) && Intrinsics.b(this.f43259c, consentPane.f43259c) && Intrinsics.b(this.f43260d, consentPane.f43260d) && Intrinsics.b(this.f43261e, consentPane.f43261e);
        }

        public final int hashCode() {
            int iHashCode = (this.f43258b.hashCode() + (this.f43257a.hashCode() * 31)) * 31;
            String str = this.f43259c;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43260d;
            return this.f43261e.hashCode() + ((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("ConsentPane(title=");
            sb2.append(this.f43257a);
            sb2.append(", scopesSection=");
            sb2.append(this.f43258b);
            sb2.append(", disclaimer=");
            b.c0.D(sb2, this.f43259c, ", denyButtonLabel=", this.f43260d, ", allowButtonLabel=");
            return b.c0.q(sb2, this.f43261e, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43257a);
            this.f43258b.writeToParcel(dest, i5);
            dest.writeString(this.f43259c);
            dest.writeString(this.f43260d);
            dest.writeString(this.f43261e);
        }

        public ConsentPane(String title, ScopesSection scopesSection, String str, String str2, String allowButtonLabel) {
            Intrinsics.g(title, "title");
            Intrinsics.g(scopesSection, "scopesSection");
            Intrinsics.g(allowButtonLabel, "allowButtonLabel");
            this.f43257a = title;
            this.f43258b = scopesSection;
            this.f43259c = str;
            this.f43260d = str2;
            this.f43261e = allowButtonLabel;
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/ConsentUi$ConsentSection;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/stripe/android/model/s", "com/stripe/android/model/t", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable
    public static final /* data */ class ConsentSection implements StripeModel {

        /* renamed from: a, reason: collision with root package name */
        public final String f43268a;

        @NotNull
        public static final t Companion = new t();

        @NotNull
        public static final Parcelable.Creator<ConsentSection> CREATOR = new u();

        public /* synthetic */ ConsentSection(int i5, String str) {
            if (1 != (i5 & 1)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 1, s.f44053a.getDescriptor());
            }
            this.f43268a = str;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof ConsentSection) && Intrinsics.b(this.f43268a, ((ConsentSection) obj).f43268a);
        }

        public final int hashCode() {
            return this.f43268a.hashCode();
        }

        public final String toString() {
            return b.c0.l("ConsentSection(disclaimer=", this.f43268a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43268a);
        }

        public ConsentSection(String disclaimer) {
            Intrinsics.g(disclaimer, "disclaimer");
            this.f43268a = disclaimer;
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/ConsentUi$Icon;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/stripe/android/model/w", "com/stripe/android/model/x", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable
    public static final /* data */ class Icon implements StripeModel {

        /* renamed from: a, reason: collision with root package name */
        public final String f43269a;

        @NotNull
        public static final x Companion = new x();

        @NotNull
        public static final Parcelable.Creator<Icon> CREATOR = new y();

        public /* synthetic */ Icon(int i5, String str) {
            if (1 != (i5 & 1)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 1, w.f44058a.getDescriptor());
            }
            this.f43269a = str;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Icon) && Intrinsics.b(this.f43269a, ((Icon) obj).f43269a);
        }

        public final int hashCode() {
            return this.f43269a.hashCode();
        }

        public final String toString() {
            return b.c0.l("Icon(default=", this.f43269a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43269a);
        }

        public Icon(String str) {
            Intrinsics.g(str, "default");
            this.f43269a = str;
        }
    }

    public /* synthetic */ ConsentUi(int i5, ConsentPane consentPane, ConsentSection consentSection) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, i.f44038a.getDescriptor());
        }
        this.f43255a = consentPane;
        this.f43256b = consentSection;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ConsentUi)) {
            return false;
        }
        ConsentUi consentUi = (ConsentUi) obj;
        return Intrinsics.b(this.f43255a, consentUi.f43255a) && Intrinsics.b(this.f43256b, consentUi.f43256b);
    }

    public final int hashCode() {
        ConsentPane consentPane = this.f43255a;
        int iHashCode = (consentPane == null ? 0 : consentPane.hashCode()) * 31;
        ConsentSection consentSection = this.f43256b;
        return iHashCode + (consentSection != null ? consentSection.f43268a.hashCode() : 0);
    }

    public final String toString() {
        return "ConsentUi(consentPane=" + this.f43255a + ", consentSection=" + this.f43256b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        ConsentPane consentPane = this.f43255a;
        if (consentPane == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            consentPane.writeToParcel(dest, i5);
        }
        ConsentSection consentSection = this.f43256b;
        if (consentSection == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            consentSection.writeToParcel(dest, i5);
        }
    }

    public ConsentUi(ConsentPane consentPane, ConsentSection consentSection) {
        this.f43255a = consentPane;
        this.f43256b = consentSection;
    }
}
