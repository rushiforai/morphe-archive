package com.medium.android.graphql.fragment;

import com.apollographql.apollo.exception.ApolloGraphQLException;
import com.medium.android.graphql.fragment.CurrentUserData;
import com.medium.android.graphql.fragment.MembershipFragmentImpl_ResponseAdapter;
import com.medium.android.graphql.type.PartnerProgramV4EnrollmentStatus;
import com.medium.android.graphql.type.adapter.PartnerProgramV4EnrollmentStatus_ResponseAdapter;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.dq1;
import defpackage.ev6;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.xl8;
import defpackage.yl2;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\f\bÆ\u0002\u0018\u00002\u00020\u0001:\t\u0004\u0005\u0006\u0007\b\t\n\u000b\fB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\r"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserDataImpl_ResponseAdapter;", "", "<init>", "()V", "CurrentUserData", "SocialStats", "Membership", "ViewerEdge", "Verifications", "PartnerProgramEnrollment", "AdminCollection", "LinkedAccounts", "Mastodon", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CurrentUserDataImpl_ResponseAdapter {
    public static final CurrentUserDataImpl_ResponseAdapter INSTANCE = new CurrentUserDataImpl_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserDataImpl_ResponseAdapter$AdminCollection;", "Lc8;", "Lcom/medium/android/graphql/fragment/CurrentUserData$AdminCollection;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CurrentUserData$AdminCollection;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CurrentUserData$AdminCollection;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class AdminCollection implements c8 {
        public static final AdminCollection INSTANCE = new AdminCollection();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "name");

        private AdminCollection() {
        }

        @Override // defpackage.c8
        public final CurrentUserData.AdminCollection fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                } else {
                    if (iN0 != 2) {
                        break;
                    }
                    str = (String) k8.g.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new CurrentUserData.AdminCollection(strQ, strQ2, str);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CurrentUserData.AdminCollection value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("name");
            k8.g.toJson(writer, customScalarAdapters, value.getName());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserDataImpl_ResponseAdapter$CurrentUserData;", "Lc8;", "Lcom/medium/android/graphql/fragment/CurrentUserData;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CurrentUserData;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CurrentUserData;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class CurrentUserData implements c8 {
        public static final CurrentUserData INSTANCE = new CurrentUserData();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "name", "username", "imageId", "bio", "aboutAsHtml", "socialStats", "membership", "isMembershipTrialEligible", "viewerEdge", "twitterScreenName", "verifications", "partnerProgramEnrollment", "adminCollections", "allowEmailAddressSharingEditorWriter", "pronouns", "isSuspended", "xDisplayName", "linkedAccounts");

        private CurrentUserData() {
        }

        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.CurrentUserData fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            CurrentUserData.LinkedAccounts linkedAccounts;
            Boolean bool;
            String str;
            Object objFromJson2;
            Object objFromJson3;
            Object objFromJson4;
            Object objFromJson5;
            Boolean bool2;
            CurrentUserData.LinkedAccounts linkedAccounts2;
            reader.getClass();
            customScalarAdapters.getClass();
            Boolean boolValueOf = null;
            String strQ = null;
            String strQ2 = null;
            String str2 = null;
            String str3 = null;
            String str4 = null;
            String str5 = null;
            String str6 = null;
            CurrentUserData.SocialStats socialStats = null;
            CurrentUserData.Membership membership = null;
            Boolean bool3 = null;
            CurrentUserData.ViewerEdge viewerEdge = null;
            String strQ3 = null;
            CurrentUserData.Verifications verifications = null;
            CurrentUserData.PartnerProgramEnrollment partnerProgramEnrollment = null;
            ArrayList arrayList = null;
            Boolean bool4 = null;
            ArrayList arrayList2 = null;
            String strQ4 = null;
            CurrentUserData.LinkedAccounts linkedAccounts3 = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        break;
                    case 1:
                        linkedAccounts = linkedAccounts3;
                        fa4 fa4Var2 = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                        linkedAccounts3 = linkedAccounts;
                        break;
                    case 2:
                        linkedAccounts = linkedAccounts3;
                        str2 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        linkedAccounts3 = linkedAccounts;
                        break;
                    case 3:
                        linkedAccounts = linkedAccounts3;
                        str3 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        linkedAccounts3 = linkedAccounts;
                        break;
                    case 4:
                        linkedAccounts = linkedAccounts3;
                        str4 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        linkedAccounts3 = linkedAccounts;
                        break;
                    case 5:
                        linkedAccounts = linkedAccounts3;
                        str5 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        linkedAccounts3 = linkedAccounts;
                        break;
                    case 6:
                        linkedAccounts = linkedAccounts3;
                        str6 = (String) k8.g.fromJson(reader, customScalarAdapters);
                        linkedAccounts3 = linkedAccounts;
                        break;
                    case 7:
                        bool = boolValueOf;
                        linkedAccounts = linkedAccounts3;
                        str = strQ;
                        sv0 sv0VarC = k8.c(SocialStats.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson2 = null;
                        } else {
                            objFromJson2 = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        socialStats = (CurrentUserData.SocialStats) objFromJson2;
                        boolValueOf = bool;
                        strQ = str;
                        linkedAccounts3 = linkedAccounts;
                        break;
                    case 8:
                        bool = boolValueOf;
                        linkedAccounts = linkedAccounts3;
                        str = strQ;
                        sv0 sv0VarC2 = k8.c(Membership.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson3 = null;
                        } else {
                            objFromJson3 = sv0VarC2.fromJson(reader, customScalarAdapters);
                        }
                        membership = (CurrentUserData.Membership) objFromJson3;
                        boolValueOf = bool;
                        strQ = str;
                        linkedAccounts3 = linkedAccounts;
                        break;
                    case 9:
                        linkedAccounts = linkedAccounts3;
                        bool3 = (Boolean) k8.j.fromJson(reader, customScalarAdapters);
                        linkedAccounts3 = linkedAccounts;
                        break;
                    case 10:
                        linkedAccounts = linkedAccounts3;
                        viewerEdge = (CurrentUserData.ViewerEdge) k8.c(ViewerEdge.INSTANCE, false).fromJson(reader, customScalarAdapters);
                        boolValueOf = boolValueOf;
                        linkedAccounts3 = linkedAccounts;
                        break;
                    case 11:
                        linkedAccounts = linkedAccounts3;
                        fa4 fa4Var3 = k8.a;
                        strQ3 = reader.q();
                        strQ3.getClass();
                        linkedAccounts3 = linkedAccounts;
                        break;
                    case 12:
                        bool = boolValueOf;
                        linkedAccounts = linkedAccounts3;
                        str = strQ;
                        sv0 sv0VarC3 = k8.c(Verifications.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson4 = null;
                        } else {
                            objFromJson4 = sv0VarC3.fromJson(reader, customScalarAdapters);
                        }
                        verifications = (CurrentUserData.Verifications) objFromJson4;
                        boolValueOf = bool;
                        strQ = str;
                        linkedAccounts3 = linkedAccounts;
                        break;
                    case 13:
                        bool = boolValueOf;
                        linkedAccounts = linkedAccounts3;
                        str = strQ;
                        sv0 sv0VarC4 = k8.c(PartnerProgramEnrollment.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson5 = null;
                        } else {
                            objFromJson5 = sv0VarC4.fromJson(reader, customScalarAdapters);
                        }
                        partnerProgramEnrollment = (CurrentUserData.PartnerProgramEnrollment) objFromJson5;
                        boolValueOf = bool;
                        strQ = str;
                        linkedAccounts3 = linkedAccounts;
                        break;
                    case 14:
                        bool = boolValueOf;
                        CurrentUserData.LinkedAccounts linkedAccounts4 = linkedAccounts3;
                        str = strQ;
                        sv0 sv0VarC5 = k8.c(AdminCollection.INSTANCE, false);
                        ArrayList arrayListE = ev6.E(reader);
                        while (reader.hasNext()) {
                            try {
                                arrayListE.add(sv0VarC5.fromJson(reader, customScalarAdapters));
                                linkedAccounts4 = linkedAccounts4;
                            } catch (ApolloGraphQLException e) {
                                while (reader.hasNext()) {
                                    reader.v();
                                }
                                reader.k();
                                throw e;
                            }
                            break;
                        }
                        linkedAccounts = linkedAccounts4;
                        reader.k();
                        arrayList = arrayListE;
                        boolValueOf = bool;
                        strQ = str;
                        linkedAccounts3 = linkedAccounts;
                        break;
                    case 15:
                        bool2 = boolValueOf;
                        linkedAccounts2 = linkedAccounts3;
                        bool4 = (Boolean) k8.j.fromJson(reader, customScalarAdapters);
                        linkedAccounts3 = linkedAccounts2;
                        boolValueOf = bool2;
                        break;
                    case 16:
                        bool2 = boolValueOf;
                        linkedAccounts2 = linkedAccounts3;
                        String str7 = strQ;
                        fa4 fa4Var4 = k8.a;
                        ArrayList arrayListE2 = ev6.E(reader);
                        while (reader.hasNext()) {
                            try {
                                String strQ5 = reader.q();
                                strQ5.getClass();
                                arrayListE2.add(strQ5);
                            } catch (ApolloGraphQLException e2) {
                                while (reader.hasNext()) {
                                    reader.v();
                                }
                                reader.k();
                                throw e2;
                            }
                            break;
                        }
                        reader.k();
                        arrayList2 = arrayListE2;
                        strQ = str7;
                        linkedAccounts3 = linkedAccounts2;
                        boolValueOf = bool2;
                        break;
                    case 17:
                        fa4 fa4Var5 = k8.a;
                        linkedAccounts3 = linkedAccounts3;
                        boolValueOf = Boolean.valueOf(reader.nextBoolean());
                        break;
                    case 18:
                        bool2 = boolValueOf;
                        linkedAccounts2 = linkedAccounts3;
                        fa4 fa4Var6 = k8.a;
                        strQ4 = reader.q();
                        strQ4.getClass();
                        linkedAccounts3 = linkedAccounts2;
                        boolValueOf = bool2;
                        break;
                    case 19:
                        Boolean bool5 = boolValueOf;
                        sv0 sv0VarC6 = k8.c(LinkedAccounts.INSTANCE, false);
                        String str8 = strQ;
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC6.fromJson(reader, customScalarAdapters);
                        }
                        boolValueOf = bool5;
                        strQ = str8;
                        linkedAccounts3 = (CurrentUserData.LinkedAccounts) objFromJson;
                        break;
                    default:
                        Boolean bool6 = boolValueOf;
                        if (strQ == null) {
                            kng.L(reader, "__typename");
                            throw null;
                        }
                        if (strQ2 == null) {
                            kng.L(reader, "id");
                            throw null;
                        }
                        if (viewerEdge == null) {
                            kng.L(reader, "viewerEdge");
                            throw null;
                        }
                        if (strQ3 == null) {
                            kng.L(reader, "twitterScreenName");
                            throw null;
                        }
                        if (arrayList == null) {
                            kng.L(reader, "adminCollections");
                            throw null;
                        }
                        if (arrayList2 == null) {
                            kng.L(reader, "pronouns");
                            throw null;
                        }
                        if (bool6 == null) {
                            kng.L(reader, "isSuspended");
                            throw null;
                        }
                        boolean zBooleanValue = bool6.booleanValue();
                        if (strQ4 != null) {
                            return new com.medium.android.graphql.fragment.CurrentUserData(strQ, strQ2, str2, str3, str4, str5, str6, socialStats, membership, bool3, viewerEdge, strQ3, verifications, partnerProgramEnrollment, arrayList, bool4, arrayList2, zBooleanValue, strQ4, linkedAccounts3);
                        }
                        kng.L(reader, "xDisplayName");
                        throw null;
                }
            }
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.CurrentUserData value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("name");
            xl8 xl8Var = k8.g;
            xl8Var.toJson(writer, customScalarAdapters, value.getName());
            writer.t0("username");
            xl8Var.toJson(writer, customScalarAdapters, value.getUsername());
            writer.t0("imageId");
            xl8Var.toJson(writer, customScalarAdapters, value.getImageId());
            writer.t0("bio");
            xl8Var.toJson(writer, customScalarAdapters, value.getBio());
            writer.t0("aboutAsHtml");
            xl8Var.toJson(writer, customScalarAdapters, value.getAboutAsHtml());
            writer.t0("socialStats");
            sv0 sv0VarC = k8.c(SocialStats.INSTANCE, false);
            CurrentUserData.SocialStats socialStats = value.getSocialStats();
            if (socialStats == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, socialStats);
            }
            writer.t0("membership");
            sv0 sv0VarC2 = k8.c(Membership.INSTANCE, true);
            CurrentUserData.Membership membership = value.getMembership();
            if (membership == null) {
                writer.s0();
            } else {
                sv0VarC2.toJson(writer, customScalarAdapters, membership);
            }
            writer.t0("isMembershipTrialEligible");
            xl8 xl8Var2 = k8.j;
            xl8Var2.toJson(writer, customScalarAdapters, value.isMembershipTrialEligible());
            writer.t0("viewerEdge");
            k8.c(ViewerEdge.INSTANCE, false).toJson(writer, customScalarAdapters, value.getViewerEdge());
            writer.t0("twitterScreenName");
            fa4Var.toJson(writer, customScalarAdapters, value.getTwitterScreenName());
            writer.t0("verifications");
            sv0 sv0VarC3 = k8.c(Verifications.INSTANCE, false);
            CurrentUserData.Verifications verifications = value.getVerifications();
            if (verifications == null) {
                writer.s0();
            } else {
                sv0VarC3.toJson(writer, customScalarAdapters, verifications);
            }
            writer.t0("partnerProgramEnrollment");
            sv0 sv0VarC4 = k8.c(PartnerProgramEnrollment.INSTANCE, false);
            CurrentUserData.PartnerProgramEnrollment partnerProgramEnrollment = value.getPartnerProgramEnrollment();
            if (partnerProgramEnrollment == null) {
                writer.s0();
            } else {
                sv0VarC4.toJson(writer, customScalarAdapters, partnerProgramEnrollment);
            }
            writer.t0("adminCollections");
            sv0 sv0VarC5 = k8.c(AdminCollection.INSTANCE, false);
            List<CurrentUserData.AdminCollection> adminCollections = value.getAdminCollections();
            adminCollections.getClass();
            writer.n();
            Iterator<T> it2 = adminCollections.iterator();
            while (it2.hasNext()) {
                sv0VarC5.toJson(writer, customScalarAdapters, it2.next());
            }
            writer.k();
            writer.t0("allowEmailAddressSharingEditorWriter");
            xl8Var2.toJson(writer, customScalarAdapters, value.getAllowEmailAddressSharingEditorWriter());
            writer.t0("pronouns");
            List<String> pronouns = value.getPronouns();
            pronouns.getClass();
            writer.n();
            Iterator<T> it3 = pronouns.iterator();
            while (it3.hasNext()) {
                fa4Var.toJson(writer, customScalarAdapters, it3.next());
            }
            writer.k();
            writer.t0("isSuspended");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isSuspended()));
            writer.t0("xDisplayName");
            fa4Var.toJson(writer, customScalarAdapters, value.getXDisplayName());
            writer.t0("linkedAccounts");
            sv0 sv0VarC6 = k8.c(LinkedAccounts.INSTANCE, false);
            CurrentUserData.LinkedAccounts linkedAccounts = value.getLinkedAccounts();
            if (linkedAccounts == null) {
                writer.s0();
            } else {
                sv0VarC6.toJson(writer, customScalarAdapters, linkedAccounts);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserDataImpl_ResponseAdapter$LinkedAccounts;", "Lc8;", "Lcom/medium/android/graphql/fragment/CurrentUserData$LinkedAccounts;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CurrentUserData$LinkedAccounts;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CurrentUserData$LinkedAccounts;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class LinkedAccounts implements c8 {
        public static final LinkedAccounts INSTANCE = new LinkedAccounts();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "mastodon");

        private LinkedAccounts() {
        }

        @Override // defpackage.c8
        public final CurrentUserData.LinkedAccounts fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            CurrentUserData.Mastodon mastodon = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else {
                    if (iN0 != 1) {
                        break;
                    }
                    sv0 sv0VarC = k8.c(Mastodon.INSTANCE, false);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    mastodon = (CurrentUserData.Mastodon) objFromJson;
                }
            }
            if (strQ != null) {
                return new CurrentUserData.LinkedAccounts(strQ, mastodon);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CurrentUserData.LinkedAccounts value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("mastodon");
            sv0 sv0VarC = k8.c(Mastodon.INSTANCE, false);
            CurrentUserData.Mastodon mastodon = value.getMastodon();
            if (mastodon == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, mastodon);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserDataImpl_ResponseAdapter$Mastodon;", "Lc8;", "Lcom/medium/android/graphql/fragment/CurrentUserData$Mastodon;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CurrentUserData$Mastodon;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CurrentUserData$Mastodon;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Mastodon implements c8 {
        public static final Mastodon INSTANCE = new Mastodon();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "domain", "username");

        private Mastodon() {
        }

        @Override // defpackage.c8
        public final CurrentUserData.Mastodon fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String strQ3 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                } else {
                    if (iN0 != 2) {
                        break;
                    }
                    fa4 fa4Var3 = k8.a;
                    strQ3 = reader.q();
                    strQ3.getClass();
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 == null) {
                kng.L(reader, "domain");
                throw null;
            }
            if (strQ3 != null) {
                return new CurrentUserData.Mastodon(strQ, strQ2, strQ3);
            }
            kng.L(reader, "username");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CurrentUserData.Mastodon value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("domain");
            fa4Var.toJson(writer, customScalarAdapters, value.getDomain());
            writer.t0("username");
            fa4Var.toJson(writer, customScalarAdapters, value.getUsername());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserDataImpl_ResponseAdapter$Membership;", "Lc8;", "Lcom/medium/android/graphql/fragment/CurrentUserData$Membership;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CurrentUserData$Membership;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CurrentUserData$Membership;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Membership implements c8 {
        public static final Membership INSTANCE = new Membership();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private Membership() {
        }

        @Override // defpackage.c8
        public final CurrentUserData.Membership fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            reader.j();
            MembershipFragment membershipFragmentFromJson = MembershipFragmentImpl_ResponseAdapter.MembershipFragment.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ != null) {
                return new CurrentUserData.Membership(strQ, membershipFragmentFromJson);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CurrentUserData.Membership value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            MembershipFragmentImpl_ResponseAdapter.MembershipFragment.INSTANCE.toJson(writer, customScalarAdapters, value.getMembershipFragment());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserDataImpl_ResponseAdapter$PartnerProgramEnrollment;", "Lc8;", "Lcom/medium/android/graphql/fragment/CurrentUserData$PartnerProgramEnrollment;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CurrentUserData$PartnerProgramEnrollment;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CurrentUserData$PartnerProgramEnrollment;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PartnerProgramEnrollment implements c8 {
        public static final PartnerProgramEnrollment INSTANCE = new PartnerProgramEnrollment();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "status");

        private PartnerProgramEnrollment() {
        }

        @Override // defpackage.c8
        public final CurrentUserData.PartnerProgramEnrollment fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            PartnerProgramV4EnrollmentStatus partnerProgramV4EnrollmentStatusFromJson = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else {
                    if (iN0 != 1) {
                        break;
                    }
                    partnerProgramV4EnrollmentStatusFromJson = PartnerProgramV4EnrollmentStatus_ResponseAdapter.INSTANCE.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (partnerProgramV4EnrollmentStatusFromJson != null) {
                return new CurrentUserData.PartnerProgramEnrollment(strQ, partnerProgramV4EnrollmentStatusFromJson);
            }
            kng.L(reader, "status");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CurrentUserData.PartnerProgramEnrollment value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("status");
            PartnerProgramV4EnrollmentStatus_ResponseAdapter.INSTANCE.toJson(writer, customScalarAdapters, value.getStatus());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserDataImpl_ResponseAdapter$SocialStats;", "Lc8;", "Lcom/medium/android/graphql/fragment/CurrentUserData$SocialStats;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CurrentUserData$SocialStats;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CurrentUserData$SocialStats;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class SocialStats implements c8 {
        public static final SocialStats INSTANCE = new SocialStats();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "followerCount", "followingCount", "collectionFollowingCount");

        private SocialStats() {
        }

        @Override // defpackage.c8
        public final CurrentUserData.SocialStats fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Long lValueOf = null;
            Long lValueOf2 = null;
            Long lValueOf3 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    dq1 dq1Var = k8.d;
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        lValueOf = null;
                    } else {
                        lValueOf = Long.valueOf(reader.nextLong());
                    }
                } else if (iN0 == 2) {
                    dq1 dq1Var2 = k8.d;
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        lValueOf2 = null;
                    } else {
                        lValueOf2 = Long.valueOf(reader.nextLong());
                    }
                } else {
                    if (iN0 != 3) {
                        break;
                    }
                    dq1 dq1Var3 = k8.d;
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        lValueOf3 = null;
                    } else {
                        lValueOf3 = Long.valueOf(reader.nextLong());
                    }
                }
            }
            if (strQ != null) {
                return new CurrentUserData.SocialStats(strQ, lValueOf, lValueOf2, lValueOf3);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CurrentUserData.SocialStats value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("followerCount");
            dq1 dq1Var = k8.d;
            Long followerCount = value.getFollowerCount();
            if (followerCount == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, followerCount);
            }
            writer.t0("followingCount");
            Long followingCount = value.getFollowingCount();
            if (followingCount == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, followingCount);
            }
            writer.t0("collectionFollowingCount");
            Long collectionFollowingCount = value.getCollectionFollowingCount();
            if (collectionFollowingCount == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, collectionFollowingCount);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserDataImpl_ResponseAdapter$Verifications;", "Lc8;", "Lcom/medium/android/graphql/fragment/CurrentUserData$Verifications;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CurrentUserData$Verifications;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CurrentUserData$Verifications;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Verifications implements c8 {
        public static final Verifications INSTANCE = new Verifications();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "isBookAuthor");

        private Verifications() {
        }

        @Override // defpackage.c8
        public final CurrentUserData.Verifications fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Boolean boolValueOf = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else {
                    if (iN0 != 1) {
                        break;
                    }
                    fa4 fa4Var2 = k8.a;
                    boolValueOf = Boolean.valueOf(reader.nextBoolean());
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (boolValueOf != null) {
                return new CurrentUserData.Verifications(strQ, boolValueOf.booleanValue());
            }
            kng.L(reader, "isBookAuthor");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CurrentUserData.Verifications value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("isBookAuthor");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.isBookAuthor()));
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CurrentUserDataImpl_ResponseAdapter$ViewerEdge;", "Lc8;", "Lcom/medium/android/graphql/fragment/CurrentUserData$ViewerEdge;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/CurrentUserData$ViewerEdge;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/CurrentUserData$ViewerEdge;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class ViewerEdge implements c8 {
        public static final ViewerEdge INSTANCE = new ViewerEdge();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "facebookDisplayName", "hasList", "firstOpenedAndroidApp", "lastPostCreatedAt", "id");

        private ViewerEdge() {
        }

        @Override // defpackage.c8
        public final CurrentUserData.ViewerEdge fromJson(fd6 reader, yl2 customScalarAdapters) {
            Boolean bool;
            reader.getClass();
            customScalarAdapters.getClass();
            Boolean boolValueOf = null;
            String strQ = null;
            String str = null;
            Long lValueOf = null;
            Long lValueOf2 = null;
            String strQ2 = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    bool = boolValueOf;
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    bool = boolValueOf;
                    str = (String) k8.g.fromJson(reader, customScalarAdapters);
                } else if (iN0 == 2) {
                    fa4 fa4Var2 = k8.a;
                    boolValueOf = Boolean.valueOf(reader.nextBoolean());
                } else if (iN0 == 3) {
                    bool = boolValueOf;
                    dq1 dq1Var = k8.d;
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        lValueOf = null;
                    } else {
                        lValueOf = Long.valueOf(reader.nextLong());
                    }
                } else if (iN0 == 4) {
                    bool = boolValueOf;
                    dq1 dq1Var2 = k8.d;
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        lValueOf2 = null;
                    } else {
                        lValueOf2 = Long.valueOf(reader.nextLong());
                    }
                } else {
                    if (iN0 != 5) {
                        break;
                    }
                    bool = boolValueOf;
                    fa4 fa4Var3 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                }
                boolValueOf = bool;
            }
            Boolean bool2 = boolValueOf;
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (bool2 == null) {
                kng.L(reader, "hasList");
                throw null;
            }
            boolean zBooleanValue = bool2.booleanValue();
            if (strQ2 != null) {
                return new CurrentUserData.ViewerEdge(strQ, str, zBooleanValue, lValueOf, lValueOf2, strQ2);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, CurrentUserData.ViewerEdge value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("facebookDisplayName");
            k8.g.toJson(writer, customScalarAdapters, value.getFacebookDisplayName());
            writer.t0("hasList");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.getHasList()));
            writer.t0("firstOpenedAndroidApp");
            dq1 dq1Var = k8.d;
            Long firstOpenedAndroidApp = value.getFirstOpenedAndroidApp();
            if (firstOpenedAndroidApp == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, firstOpenedAndroidApp);
            }
            writer.t0("lastPostCreatedAt");
            Long lastPostCreatedAt = value.getLastPostCreatedAt();
            if (lastPostCreatedAt == null) {
                writer.s0();
            } else {
                dq1Var.toJson(writer, customScalarAdapters, lastPostCreatedAt);
            }
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }
    }

    private CurrentUserDataImpl_ResponseAdapter() {
    }
}
