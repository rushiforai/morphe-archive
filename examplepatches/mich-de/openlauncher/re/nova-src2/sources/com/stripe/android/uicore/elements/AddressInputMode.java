package com.stripe.android.uicore.elements;

import android.os.Parcel;
import android.os.Parcelable;
import cl.k0;
import java.io.Serializable;
import java.util.Iterator;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/uicore/elements/AddressInputMode;", "Landroid/os/Parcelable;", "AutocompleteCondensed", "AutocompleteExpanded", "NoAutocomplete", "Lcom/stripe/android/uicore/elements/AddressInputMode$AutocompleteCondensed;", "Lcom/stripe/android/uicore/elements/AddressInputMode$AutocompleteExpanded;", "Lcom/stripe/android/uicore/elements/AddressInputMode$NoAutocomplete;", "stripe-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class AddressInputMode implements Parcelable {

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/uicore/elements/AddressInputMode$AutocompleteCondensed;", "Lcom/stripe/android/uicore/elements/AddressInputMode;", "Liw/c;", "stripe-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class AutocompleteCondensed extends AddressInputMode implements iw.c {

        @NotNull
        public static final Parcelable.Creator<AutocompleteCondensed> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final String f45348a;

        /* renamed from: b, reason: collision with root package name */
        public final Set f45349b;

        /* renamed from: c, reason: collision with root package name */
        public final kw.c f45350c;

        /* renamed from: d, reason: collision with root package name */
        public final kw.c f45351d;

        /* renamed from: e, reason: collision with root package name */
        public final kw.c f45352e;

        /* renamed from: f, reason: collision with root package name */
        public final Function0 f45353f;

        public AutocompleteCondensed(String str, Set set, kw.c phoneNumberConfig, kw.c nameConfig, kw.c emailConfig, Function0 onNavigation) {
            Intrinsics.g(phoneNumberConfig, "phoneNumberConfig");
            Intrinsics.g(nameConfig, "nameConfig");
            Intrinsics.g(emailConfig, "emailConfig");
            Intrinsics.g(onNavigation, "onNavigation");
            this.f45348a = str;
            this.f45349b = set;
            this.f45350c = phoneNumberConfig;
            this.f45351d = nameConfig;
            this.f45352e = emailConfig;
            this.f45353f = onNavigation;
        }

        @Override // iw.c
        /* renamed from: b, reason: from getter */
        public final String getF45354a() {
            return this.f45348a;
        }

        @Override // iw.c
        public final boolean d(String str, boolean z11) {
            return k0.T(this, str, z11);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // iw.c
        /* renamed from: e, reason: from getter */
        public final Function0 getF45359f() {
            return this.f45353f;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof AutocompleteCondensed)) {
                return false;
            }
            AutocompleteCondensed autocompleteCondensed = (AutocompleteCondensed) obj;
            return Intrinsics.b(this.f45348a, autocompleteCondensed.f45348a) && Intrinsics.b(this.f45349b, autocompleteCondensed.f45349b) && this.f45350c == autocompleteCondensed.f45350c && this.f45351d == autocompleteCondensed.f45351d && this.f45352e == autocompleteCondensed.f45352e && Intrinsics.b(this.f45353f, autocompleteCondensed.f45353f);
        }

        public final int hashCode() {
            String str = this.f45348a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            Set set = this.f45349b;
            return this.f45353f.hashCode() + ((this.f45352e.hashCode() + ((this.f45351d.hashCode() + ((this.f45350c.hashCode() + ((iHashCode + (set != null ? set.hashCode() : 0)) * 31)) * 31)) * 31)) * 31);
        }

        @Override // iw.c
        /* renamed from: i, reason: from getter */
        public final Set getF45355b() {
            return this.f45349b;
        }

        @Override // com.stripe.android.uicore.elements.AddressInputMode
        /* renamed from: l, reason: from getter */
        public final kw.c getF45362c() {
            return this.f45352e;
        }

        @Override // com.stripe.android.uicore.elements.AddressInputMode
        /* renamed from: m, reason: from getter */
        public final kw.c getF45361b() {
            return this.f45351d;
        }

        @Override // com.stripe.android.uicore.elements.AddressInputMode
        /* renamed from: p, reason: from getter */
        public final kw.c getF45360a() {
            return this.f45350c;
        }

        public final String toString() {
            return "AutocompleteCondensed(googleApiKey=" + this.f45348a + ", autocompleteCountries=" + this.f45349b + ", phoneNumberConfig=" + this.f45350c + ", nameConfig=" + this.f45351d + ", emailConfig=" + this.f45352e + ", onNavigation=" + this.f45353f + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f45348a);
            Set set = this.f45349b;
            if (set == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeInt(set.size());
                Iterator it = set.iterator();
                while (it.hasNext()) {
                    dest.writeString((String) it.next());
                }
            }
            dest.writeString(this.f45350c.name());
            dest.writeString(this.f45351d.name());
            dest.writeString(this.f45352e.name());
            dest.writeSerializable((Serializable) this.f45353f);
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/uicore/elements/AddressInputMode$AutocompleteExpanded;", "Lcom/stripe/android/uicore/elements/AddressInputMode;", "Liw/c;", "stripe-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class AutocompleteExpanded extends AddressInputMode implements iw.c {

        @NotNull
        public static final Parcelable.Creator<AutocompleteExpanded> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final String f45354a;

        /* renamed from: b, reason: collision with root package name */
        public final Set f45355b;

        /* renamed from: c, reason: collision with root package name */
        public final kw.c f45356c;

        /* renamed from: d, reason: collision with root package name */
        public final kw.c f45357d;

        /* renamed from: e, reason: collision with root package name */
        public final kw.c f45358e;

        /* renamed from: f, reason: collision with root package name */
        public final Function0 f45359f;

        public AutocompleteExpanded(String str, Set set, kw.c phoneNumberConfig, kw.c nameConfig, kw.c emailConfig, Function0 onNavigation) {
            Intrinsics.g(phoneNumberConfig, "phoneNumberConfig");
            Intrinsics.g(nameConfig, "nameConfig");
            Intrinsics.g(emailConfig, "emailConfig");
            Intrinsics.g(onNavigation, "onNavigation");
            this.f45354a = str;
            this.f45355b = set;
            this.f45356c = phoneNumberConfig;
            this.f45357d = nameConfig;
            this.f45358e = emailConfig;
            this.f45359f = onNavigation;
        }

        @Override // iw.c
        /* renamed from: b, reason: from getter */
        public final String getF45354a() {
            return this.f45354a;
        }

        @Override // iw.c
        public final boolean d(String str, boolean z11) {
            return k0.T(this, str, z11);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // iw.c
        /* renamed from: e, reason: from getter */
        public final Function0 getF45359f() {
            return this.f45359f;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof AutocompleteExpanded)) {
                return false;
            }
            AutocompleteExpanded autocompleteExpanded = (AutocompleteExpanded) obj;
            return Intrinsics.b(this.f45354a, autocompleteExpanded.f45354a) && Intrinsics.b(this.f45355b, autocompleteExpanded.f45355b) && this.f45356c == autocompleteExpanded.f45356c && this.f45357d == autocompleteExpanded.f45357d && this.f45358e == autocompleteExpanded.f45358e && Intrinsics.b(this.f45359f, autocompleteExpanded.f45359f);
        }

        public final int hashCode() {
            String str = this.f45354a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            Set set = this.f45355b;
            return this.f45359f.hashCode() + ((this.f45358e.hashCode() + ((this.f45357d.hashCode() + ((this.f45356c.hashCode() + ((iHashCode + (set != null ? set.hashCode() : 0)) * 31)) * 31)) * 31)) * 31);
        }

        @Override // iw.c
        /* renamed from: i, reason: from getter */
        public final Set getF45355b() {
            return this.f45355b;
        }

        @Override // com.stripe.android.uicore.elements.AddressInputMode
        /* renamed from: l, reason: from getter */
        public final kw.c getF45362c() {
            return this.f45358e;
        }

        @Override // com.stripe.android.uicore.elements.AddressInputMode
        /* renamed from: m, reason: from getter */
        public final kw.c getF45361b() {
            return this.f45357d;
        }

        @Override // com.stripe.android.uicore.elements.AddressInputMode
        /* renamed from: p, reason: from getter */
        public final kw.c getF45360a() {
            return this.f45356c;
        }

        public final String toString() {
            return "AutocompleteExpanded(googleApiKey=" + this.f45354a + ", autocompleteCountries=" + this.f45355b + ", phoneNumberConfig=" + this.f45356c + ", nameConfig=" + this.f45357d + ", emailConfig=" + this.f45358e + ", onNavigation=" + this.f45359f + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f45354a);
            Set set = this.f45355b;
            if (set == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeInt(set.size());
                Iterator it = set.iterator();
                while (it.hasNext()) {
                    dest.writeString((String) it.next());
                }
            }
            dest.writeString(this.f45356c.name());
            dest.writeString(this.f45357d.name());
            dest.writeString(this.f45358e.name());
            dest.writeSerializable((Serializable) this.f45359f);
        }
    }

    /* renamed from: l */
    public abstract kw.c getF45362c();

    /* renamed from: m */
    public abstract kw.c getF45361b();

    /* renamed from: p */
    public abstract kw.c getF45360a();

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/uicore/elements/AddressInputMode$NoAutocomplete;", "Lcom/stripe/android/uicore/elements/AddressInputMode;", "stripe-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class NoAutocomplete extends AddressInputMode {

        @NotNull
        public static final Parcelable.Creator<NoAutocomplete> CREATOR = new d();

        /* renamed from: a, reason: collision with root package name */
        public final kw.c f45360a;

        /* renamed from: b, reason: collision with root package name */
        public final kw.c f45361b;

        /* renamed from: c, reason: collision with root package name */
        public final kw.c f45362c;

        public NoAutocomplete(kw.c phoneNumberConfig, kw.c nameConfig, kw.c emailConfig) {
            Intrinsics.g(phoneNumberConfig, "phoneNumberConfig");
            Intrinsics.g(nameConfig, "nameConfig");
            Intrinsics.g(emailConfig, "emailConfig");
            this.f45360a = phoneNumberConfig;
            this.f45361b = nameConfig;
            this.f45362c = emailConfig;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof NoAutocomplete)) {
                return false;
            }
            NoAutocomplete noAutocomplete = (NoAutocomplete) obj;
            return this.f45360a == noAutocomplete.f45360a && this.f45361b == noAutocomplete.f45361b && this.f45362c == noAutocomplete.f45362c;
        }

        public final int hashCode() {
            return this.f45362c.hashCode() + ((this.f45361b.hashCode() + (this.f45360a.hashCode() * 31)) * 31);
        }

        @Override // com.stripe.android.uicore.elements.AddressInputMode
        /* renamed from: l, reason: from getter */
        public final kw.c getF45362c() {
            return this.f45362c;
        }

        @Override // com.stripe.android.uicore.elements.AddressInputMode
        /* renamed from: m, reason: from getter */
        public final kw.c getF45361b() {
            return this.f45361b;
        }

        @Override // com.stripe.android.uicore.elements.AddressInputMode
        /* renamed from: p, reason: from getter */
        public final kw.c getF45360a() {
            return this.f45360a;
        }

        public final String toString() {
            return "NoAutocomplete(phoneNumberConfig=" + this.f45360a + ", nameConfig=" + this.f45361b + ", emailConfig=" + this.f45362c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f45360a.name());
            dest.writeString(this.f45361b.name());
            dest.writeString(this.f45362c.name());
        }

        public /* synthetic */ NoAutocomplete(kw.c cVar, int i5) {
            this((i5 & 1) != 0 ? kw.c.f72330b : cVar, (i5 & 2) != 0 ? kw.c.f72330b : kw.c.f72332d, kw.c.f72330b);
        }
    }
}
