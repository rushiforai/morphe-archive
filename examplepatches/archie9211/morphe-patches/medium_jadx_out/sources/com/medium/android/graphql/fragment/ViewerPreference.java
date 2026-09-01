package com.medium.android.graphql.fragment;

import defpackage.b09;
import defpackage.ev6;
import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0086\b\u0018\u00002\u00020\u0001:\u0006\u001e\u001f !\"#B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\nJ\u0010\u0010\f\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ.\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\nJ\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\nR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0019\u001a\u0004\b\u001b\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001c\u001a\u0004\b\u001d\u0010\r¨\u0006$"}, d2 = {"Lcom/medium/android/graphql/fragment/ViewerPreference;", "Lg15;", "", "__typename", "name", "Lcom/medium/android/graphql/fragment/ViewerPreference$Value;", "value", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ViewerPreference$Value;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Lcom/medium/android/graphql/fragment/ViewerPreference$Value;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ViewerPreference$Value;)Lcom/medium/android/graphql/fragment/ViewerPreference;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getName", "Lcom/medium/android/graphql/fragment/ViewerPreference$Value;", "getValue", "Value", "OnStringPreferenceValue", "OnBooleanPreferenceValue", "OnIntPreferenceValue", "OnStringSetPreferenceValue", "OnEnumPreferenceValue", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ViewerPreference implements g15 {
    private final String __typename;
    private final String name;
    private final Value value;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u00032\b\u0010\u000b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\f\u001a\u00020\rHÖ\u0001J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/ViewerPreference$OnBooleanPreferenceValue;", "", "booleanValue", "", "<init>", "(Z)V", "getBooleanValue", "()Z", "component1", "copy", "equals", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnBooleanPreferenceValue {
        private final boolean booleanValue;

        public OnBooleanPreferenceValue(boolean z) {
            this.booleanValue = z;
        }

        public static OnBooleanPreferenceValue copy$default(OnBooleanPreferenceValue onBooleanPreferenceValue, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                z = onBooleanPreferenceValue.booleanValue;
            }
            onBooleanPreferenceValue.getClass();
            return new OnBooleanPreferenceValue(z);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final boolean getBooleanValue() {
            return this.booleanValue;
        }

        public final OnBooleanPreferenceValue copy(boolean booleanValue) {
            return new OnBooleanPreferenceValue(booleanValue);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnBooleanPreferenceValue) && this.booleanValue == ((OnBooleanPreferenceValue) other).booleanValue;
        }

        public final boolean getBooleanValue() {
            return this.booleanValue;
        }

        public final int hashCode() {
            return this.booleanValue ? 1231 : 1237;
        }

        public final String toString() {
            return b09.z("OnBooleanPreferenceValue(booleanValue=", ")", this.booleanValue);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/ViewerPreference$OnEnumPreferenceValue;", "", "enumValue", "", "<init>", "(Ljava/lang/String;)V", "getEnumValue", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnEnumPreferenceValue {
        private final String enumValue;

        public OnEnumPreferenceValue(String str) {
            str.getClass();
            this.enumValue = str;
        }

        public static /* synthetic */ OnEnumPreferenceValue copy$default(OnEnumPreferenceValue onEnumPreferenceValue, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onEnumPreferenceValue.enumValue;
            }
            return onEnumPreferenceValue.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getEnumValue() {
            return this.enumValue;
        }

        public final OnEnumPreferenceValue copy(String enumValue) {
            enumValue.getClass();
            return new OnEnumPreferenceValue(enumValue);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnEnumPreferenceValue) && g76.L(this.enumValue, ((OnEnumPreferenceValue) other).enumValue);
        }

        public final String getEnumValue() {
            return this.enumValue;
        }

        public final int hashCode() {
            return this.enumValue.hashCode();
        }

        public final String toString() {
            return ev6.x("OnEnumPreferenceValue(enumValue=", this.enumValue, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u0003HÖ\u0001J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/ViewerPreference$OnIntPreferenceValue;", "", "intValue", "", "<init>", "(I)V", "getIntValue", "()I", "component1", "copy", "equals", "", "other", "hashCode", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnIntPreferenceValue {
        private final int intValue;

        public OnIntPreferenceValue(int i) {
            this.intValue = i;
        }

        public static OnIntPreferenceValue copy$default(OnIntPreferenceValue onIntPreferenceValue, int i, int i2, Object obj) {
            if ((i2 & 1) != 0) {
                i = onIntPreferenceValue.intValue;
            }
            onIntPreferenceValue.getClass();
            return new OnIntPreferenceValue(i);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final int getIntValue() {
            return this.intValue;
        }

        public final OnIntPreferenceValue copy(int intValue) {
            return new OnIntPreferenceValue(intValue);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnIntPreferenceValue) && this.intValue == ((OnIntPreferenceValue) other).intValue;
        }

        public final int getIntValue() {
            return this.intValue;
        }

        public final int hashCode() {
            return this.intValue;
        }

        public final String toString() {
            return ev6.w("OnIntPreferenceValue(intValue=", this.intValue, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/fragment/ViewerPreference$OnStringPreferenceValue;", "", "stringValue", "", "<init>", "(Ljava/lang/String;)V", "getStringValue", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnStringPreferenceValue {
        private final String stringValue;

        public OnStringPreferenceValue(String str) {
            str.getClass();
            this.stringValue = str;
        }

        public static /* synthetic */ OnStringPreferenceValue copy$default(OnStringPreferenceValue onStringPreferenceValue, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onStringPreferenceValue.stringValue;
            }
            return onStringPreferenceValue.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getStringValue() {
            return this.stringValue;
        }

        public final OnStringPreferenceValue copy(String stringValue) {
            stringValue.getClass();
            return new OnStringPreferenceValue(stringValue);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnStringPreferenceValue) && g76.L(this.stringValue, ((OnStringPreferenceValue) other).stringValue);
        }

        public final String getStringValue() {
            return this.stringValue;
        }

        public final int hashCode() {
            return this.stringValue.hashCode();
        }

        public final String toString() {
            return ev6.x(dpBiLjNeNsiASg.toPRYnNJULWnVa, this.stringValue, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0015\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u0019\u0010\n\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0001J\u0013\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0004HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/fragment/ViewerPreference$OnStringSetPreferenceValue;", "", "stringSetValue", "", "", "<init>", "(Ljava/util/List;)V", "getStringSetValue", "()Ljava/util/List;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnStringSetPreferenceValue {
        private final List<String> stringSetValue;

        public OnStringSetPreferenceValue(List<String> list) {
            list.getClass();
            this.stringSetValue = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ OnStringSetPreferenceValue copy$default(OnStringSetPreferenceValue onStringSetPreferenceValue, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                list = onStringSetPreferenceValue.stringSetValue;
            }
            return onStringSetPreferenceValue.copy(list);
        }

        public final List<String> component1() {
            return this.stringSetValue;
        }

        public final OnStringSetPreferenceValue copy(List<String> stringSetValue) {
            stringSetValue.getClass();
            return new OnStringSetPreferenceValue(stringSetValue);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnStringSetPreferenceValue) && g76.L(this.stringSetValue, ((OnStringSetPreferenceValue) other).stringSetValue);
        }

        public final List<String> getStringSetValue() {
            return this.stringSetValue;
        }

        public final int hashCode() {
            return this.stringSetValue.hashCode();
        }

        public final String toString() {
            return ka1.t("OnStringSetPreferenceValue(stringSetValue=", ")", this.stringSetValue);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0016\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BA\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\u000e\u0010\u000fJ\t\u0010\u001c\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u001d\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u001e\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u001f\u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u0010 \u001a\u0004\u0018\u00010\u000bHÆ\u0003J\u000b\u0010!\u001a\u0004\u0018\u00010\rHÆ\u0003JO\u0010\"\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\rHÆ\u0001J\u0013\u0010#\u001a\u00020$2\b\u0010%\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010&\u001a\u00020'HÖ\u0001J\t\u0010(\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0013\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001b¨\u0006)"}, d2 = {"Lcom/medium/android/graphql/fragment/ViewerPreference$Value;", "", "__typename", "", "onStringPreferenceValue", "Lcom/medium/android/graphql/fragment/ViewerPreference$OnStringPreferenceValue;", "onBooleanPreferenceValue", "Lcom/medium/android/graphql/fragment/ViewerPreference$OnBooleanPreferenceValue;", "onIntPreferenceValue", "Lcom/medium/android/graphql/fragment/ViewerPreference$OnIntPreferenceValue;", "onStringSetPreferenceValue", "Lcom/medium/android/graphql/fragment/ViewerPreference$OnStringSetPreferenceValue;", "onEnumPreferenceValue", "Lcom/medium/android/graphql/fragment/ViewerPreference$OnEnumPreferenceValue;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/ViewerPreference$OnStringPreferenceValue;Lcom/medium/android/graphql/fragment/ViewerPreference$OnBooleanPreferenceValue;Lcom/medium/android/graphql/fragment/ViewerPreference$OnIntPreferenceValue;Lcom/medium/android/graphql/fragment/ViewerPreference$OnStringSetPreferenceValue;Lcom/medium/android/graphql/fragment/ViewerPreference$OnEnumPreferenceValue;)V", "get__typename", "()Ljava/lang/String;", "getOnStringPreferenceValue", "()Lcom/medium/android/graphql/fragment/ViewerPreference$OnStringPreferenceValue;", "getOnBooleanPreferenceValue", "()Lcom/medium/android/graphql/fragment/ViewerPreference$OnBooleanPreferenceValue;", "getOnIntPreferenceValue", "()Lcom/medium/android/graphql/fragment/ViewerPreference$OnIntPreferenceValue;", "getOnStringSetPreferenceValue", "()Lcom/medium/android/graphql/fragment/ViewerPreference$OnStringSetPreferenceValue;", "getOnEnumPreferenceValue", "()Lcom/medium/android/graphql/fragment/ViewerPreference$OnEnumPreferenceValue;", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Value {
        private final String __typename;
        private final OnBooleanPreferenceValue onBooleanPreferenceValue;
        private final OnEnumPreferenceValue onEnumPreferenceValue;
        private final OnIntPreferenceValue onIntPreferenceValue;
        private final OnStringPreferenceValue onStringPreferenceValue;
        private final OnStringSetPreferenceValue onStringSetPreferenceValue;

        public Value(String str, OnStringPreferenceValue onStringPreferenceValue, OnBooleanPreferenceValue onBooleanPreferenceValue, OnIntPreferenceValue onIntPreferenceValue, OnStringSetPreferenceValue onStringSetPreferenceValue, OnEnumPreferenceValue onEnumPreferenceValue) {
            str.getClass();
            this.__typename = str;
            this.onStringPreferenceValue = onStringPreferenceValue;
            this.onBooleanPreferenceValue = onBooleanPreferenceValue;
            this.onIntPreferenceValue = onIntPreferenceValue;
            this.onStringSetPreferenceValue = onStringSetPreferenceValue;
            this.onEnumPreferenceValue = onEnumPreferenceValue;
        }

        public static /* synthetic */ Value copy$default(Value value, String str, OnStringPreferenceValue onStringPreferenceValue, OnBooleanPreferenceValue onBooleanPreferenceValue, OnIntPreferenceValue onIntPreferenceValue, OnStringSetPreferenceValue onStringSetPreferenceValue, OnEnumPreferenceValue onEnumPreferenceValue, int i, Object obj) {
            if ((i & 1) != 0) {
                str = value.__typename;
            }
            if ((i & 2) != 0) {
                onStringPreferenceValue = value.onStringPreferenceValue;
            }
            if ((i & 4) != 0) {
                onBooleanPreferenceValue = value.onBooleanPreferenceValue;
            }
            if ((i & 8) != 0) {
                onIntPreferenceValue = value.onIntPreferenceValue;
            }
            if ((i & 16) != 0) {
                onStringSetPreferenceValue = value.onStringSetPreferenceValue;
            }
            if ((i & 32) != 0) {
                onEnumPreferenceValue = value.onEnumPreferenceValue;
            }
            OnStringSetPreferenceValue onStringSetPreferenceValue2 = onStringSetPreferenceValue;
            OnEnumPreferenceValue onEnumPreferenceValue2 = onEnumPreferenceValue;
            return value.copy(str, onStringPreferenceValue, onBooleanPreferenceValue, onIntPreferenceValue, onStringSetPreferenceValue2, onEnumPreferenceValue2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnStringPreferenceValue getOnStringPreferenceValue() {
            return this.onStringPreferenceValue;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnBooleanPreferenceValue getOnBooleanPreferenceValue() {
            return this.onBooleanPreferenceValue;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnIntPreferenceValue getOnIntPreferenceValue() {
            return this.onIntPreferenceValue;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final OnStringSetPreferenceValue getOnStringSetPreferenceValue() {
            return this.onStringSetPreferenceValue;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final OnEnumPreferenceValue getOnEnumPreferenceValue() {
            return this.onEnumPreferenceValue;
        }

        public final Value copy(String __typename, OnStringPreferenceValue onStringPreferenceValue, OnBooleanPreferenceValue onBooleanPreferenceValue, OnIntPreferenceValue onIntPreferenceValue, OnStringSetPreferenceValue onStringSetPreferenceValue, OnEnumPreferenceValue onEnumPreferenceValue) {
            __typename.getClass();
            return new Value(__typename, onStringPreferenceValue, onBooleanPreferenceValue, onIntPreferenceValue, onStringSetPreferenceValue, onEnumPreferenceValue);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Value)) {
                return false;
            }
            Value value = (Value) other;
            return g76.L(this.__typename, value.__typename) && g76.L(this.onStringPreferenceValue, value.onStringPreferenceValue) && g76.L(this.onBooleanPreferenceValue, value.onBooleanPreferenceValue) && g76.L(this.onIntPreferenceValue, value.onIntPreferenceValue) && g76.L(this.onStringSetPreferenceValue, value.onStringSetPreferenceValue) && g76.L(this.onEnumPreferenceValue, value.onEnumPreferenceValue);
        }

        public final OnBooleanPreferenceValue getOnBooleanPreferenceValue() {
            return this.onBooleanPreferenceValue;
        }

        public final OnEnumPreferenceValue getOnEnumPreferenceValue() {
            return this.onEnumPreferenceValue;
        }

        public final OnIntPreferenceValue getOnIntPreferenceValue() {
            return this.onIntPreferenceValue;
        }

        public final OnStringPreferenceValue getOnStringPreferenceValue() {
            return this.onStringPreferenceValue;
        }

        public final OnStringSetPreferenceValue getOnStringSetPreferenceValue() {
            return this.onStringSetPreferenceValue;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnStringPreferenceValue onStringPreferenceValue = this.onStringPreferenceValue;
            int iHashCode2 = (iHashCode + (onStringPreferenceValue == null ? 0 : onStringPreferenceValue.hashCode())) * 31;
            OnBooleanPreferenceValue onBooleanPreferenceValue = this.onBooleanPreferenceValue;
            int iHashCode3 = (iHashCode2 + (onBooleanPreferenceValue == null ? 0 : onBooleanPreferenceValue.hashCode())) * 31;
            OnIntPreferenceValue onIntPreferenceValue = this.onIntPreferenceValue;
            int iHashCode4 = (iHashCode3 + (onIntPreferenceValue == null ? 0 : onIntPreferenceValue.hashCode())) * 31;
            OnStringSetPreferenceValue onStringSetPreferenceValue = this.onStringSetPreferenceValue;
            int iHashCode5 = (iHashCode4 + (onStringSetPreferenceValue == null ? 0 : onStringSetPreferenceValue.hashCode())) * 31;
            OnEnumPreferenceValue onEnumPreferenceValue = this.onEnumPreferenceValue;
            return iHashCode5 + (onEnumPreferenceValue != null ? onEnumPreferenceValue.hashCode() : 0);
        }

        public final String toString() {
            return "Value(__typename=" + this.__typename + ", onStringPreferenceValue=" + this.onStringPreferenceValue + ", onBooleanPreferenceValue=" + this.onBooleanPreferenceValue + ", onIntPreferenceValue=" + this.onIntPreferenceValue + ", onStringSetPreferenceValue=" + this.onStringSetPreferenceValue + ", onEnumPreferenceValue=" + this.onEnumPreferenceValue + ")";
        }
    }

    public ViewerPreference(String str, String str2, Value value) {
        str.getClass();
        str2.getClass();
        value.getClass();
        this.__typename = str;
        this.name = str2;
        this.value = value;
    }

    public static /* synthetic */ ViewerPreference copy$default(ViewerPreference viewerPreference, String str, String str2, Value value, int i, Object obj) {
        if ((i & 1) != 0) {
            str = viewerPreference.__typename;
        }
        if ((i & 2) != 0) {
            str2 = viewerPreference.name;
        }
        if ((i & 4) != 0) {
            value = viewerPreference.value;
        }
        return viewerPreference.copy(str, str2, value);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getName() {
        return this.name;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final Value getValue() {
        return this.value;
    }

    public final ViewerPreference copy(String __typename, String name, Value value) {
        __typename.getClass();
        name.getClass();
        value.getClass();
        return new ViewerPreference(__typename, name, value);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ViewerPreference)) {
            return false;
        }
        ViewerPreference viewerPreference = (ViewerPreference) other;
        return g76.L(this.__typename, viewerPreference.__typename) && g76.L(this.name, viewerPreference.name) && g76.L(this.value, viewerPreference.value);
    }

    public final String getName() {
        return this.name;
    }

    public final Value getValue() {
        return this.value;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        return this.value.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.name);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.name;
        Value value = this.value;
        StringBuilder sbU = y30.u("ViewerPreference(__typename=", str, ", name=", str2, ", value=");
        sbU.append(value);
        sbU.append(")");
        return sbU.toString();
    }
}
