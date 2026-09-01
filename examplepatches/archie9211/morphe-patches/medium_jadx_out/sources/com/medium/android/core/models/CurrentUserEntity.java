package com.medium.android.core.models;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import defpackage.g76;
import defpackage.ka1;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b>\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001Bù\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\t\u001a\u0004\u0018\u00010\n\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\u0006\u0010\f\u001a\u00020\r\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\n\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\n\u0012\u0006\u0010\u0010\u001a\u00020\u0011\u0012\b\u0010\u0012\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0013\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0014\u001a\u0004\u0018\u00010\u0015\u0012\u0006\u0010\u0016\u001a\u00020\u0011\u0012\u0006\u0010\u0017\u001a\u00020\u0011\u0012\b\u0010\u0018\u001a\u0004\u0018\u00010\n\u0012\u000e\b\u0002\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u001b0\u001a\u0012\b\b\u0002\u0010\u001c\u001a\u00020\u0011\u0012\u000e\b\u0002\u0010\u001d\u001a\b\u0012\u0004\u0012\u00020\u00030\u001a\u0012\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u001f\u0012\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\n\u0012\b\b\u0002\u0010!\u001a\u00020\u0011¢\u0006\u0004\b\"\u0010#J\t\u0010A\u001a\u00020\u0003HÆ\u0003J\t\u0010B\u001a\u00020\u0003HÆ\u0003J\t\u0010C\u001a\u00020\u0003HÆ\u0003J\u000b\u0010D\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010E\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010F\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010G\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0002\u0010,J\u0010\u0010H\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0002\u0010,J\t\u0010I\u001a\u00020\rHÆ\u0003J\u0010\u0010J\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0002\u0010,J\u0010\u0010K\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0002\u0010,J\t\u0010L\u001a\u00020\u0011HÆ\u0003J\u000b\u0010M\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010N\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010O\u001a\u0004\u0018\u00010\u0015HÆ\u0003J\t\u0010P\u001a\u00020\u0011HÆ\u0003J\t\u0010Q\u001a\u00020\u0011HÆ\u0003J\u0010\u0010R\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0002\u0010,J\u000f\u0010S\u001a\b\u0012\u0004\u0012\u00020\u001b0\u001aHÆ\u0003J\t\u0010T\u001a\u00020\u0011HÆ\u0003J\u000f\u0010U\u001a\b\u0012\u0004\u0012\u00020\u00030\u001aHÆ\u0003J\u000b\u0010V\u001a\u0004\u0018\u00010\u001fHÆ\u0003J\u0010\u0010W\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0002\u0010,J\t\u0010X\u001a\u00020\u0011HÆ\u0003J¤\u0002\u0010Y\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\b\b\u0002\u0010\f\u001a\u00020\r2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\n2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00152\b\b\u0002\u0010\u0016\u001a\u00020\u00112\b\b\u0002\u0010\u0017\u001a\u00020\u00112\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\n2\u000e\b\u0002\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u001b0\u001a2\b\b\u0002\u0010\u001c\u001a\u00020\u00112\u000e\b\u0002\u0010\u001d\u001a\b\u0012\u0004\u0012\u00020\u00030\u001a2\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u001f2\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\n2\b\b\u0002\u0010!\u001a\u00020\u0011HÆ\u0001¢\u0006\u0002\u0010ZJ\u0013\u0010[\u001a\u00020\u00112\b\u0010\\\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010]\u001a\u00020^HÖ\u0001J\t\u0010_\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b$\u0010%R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b&\u0010%R\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b'\u0010%R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b(\u0010%R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b)\u0010%R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b*\u0010%R\u0015\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\n\n\u0002\u0010-\u001a\u0004\b+\u0010,R\u0015\u0010\u000b\u001a\u0004\u0018\u00010\n¢\u0006\n\n\u0002\u0010-\u001a\u0004\b.\u0010,R\u0011\u0010\f\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\b/\u00100R\u0015\u0010\u000e\u001a\u0004\u0018\u00010\n¢\u0006\n\n\u0002\u0010-\u001a\u0004\b1\u0010,R\u0015\u0010\u000f\u001a\u0004\u0018\u00010\n¢\u0006\n\n\u0002\u0010-\u001a\u0004\b2\u0010,R\u0011\u0010\u0010\u001a\u00020\u0011¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u00103R\u0013\u0010\u0012\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b4\u0010%R\u0013\u0010\u0013\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b5\u0010%R\u0013\u0010\u0014\u001a\u0004\u0018\u00010\u0015¢\u0006\b\n\u0000\u001a\u0004\b6\u00107R\u0011\u0010\u0016\u001a\u00020\u0011¢\u0006\b\n\u0000\u001a\u0004\b8\u00103R\u0011\u0010\u0017\u001a\u00020\u0011¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u00103R\u0015\u0010\u0018\u001a\u0004\u0018\u00010\n¢\u0006\n\n\u0002\u0010-\u001a\u0004\b9\u0010,R\u0017\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u001b0\u001a¢\u0006\b\n\u0000\u001a\u0004\b:\u0010;R\u0011\u0010\u001c\u001a\u00020\u0011¢\u0006\b\n\u0000\u001a\u0004\b<\u00103R\u0017\u0010\u001d\u001a\b\u0012\u0004\u0012\u00020\u00030\u001a¢\u0006\b\n\u0000\u001a\u0004\b=\u0010;R\u0013\u0010\u001e\u001a\u0004\u0018\u00010\u001f¢\u0006\b\n\u0000\u001a\u0004\b>\u0010?R\u0015\u0010 \u001a\u0004\u0018\u00010\n¢\u0006\n\n\u0002\u0010-\u001a\u0004\b@\u0010,R\u0011\u0010!\u001a\u00020\u0011¢\u0006\b\n\u0000\u001a\u0004\b!\u00103¨\u0006`"}, d2 = {"Lcom/medium/android/core/models/CurrentUserEntity;", "", "id", "", "name", "username", "profileImageId", "bio", "aboutAsHtml", "followerCount", "", "followingCount", "membershipType", "Lcom/medium/android/core/models/MembershipTypeEntity;", "memberSince", "friendSince", "isMembershipTrialEligible", "", "facebookDisplayName", "twitterDisplayName", "mastodonEntity", "Lcom/medium/android/core/models/MastodonEntity;", "hasLists", "isBookAuthor", "firstOpenedAndroidApp", "adminOfCollections", "", "Lcom/medium/android/core/models/CurrentUserAdminCollectionEntity;", "allowEmailAddressSharing", "pronouns", "partnerProgramEnrollment", "Lcom/medium/android/core/models/PartnerProgramEnrollment;", "lastPostCreatedAt", "isSuspended", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Lcom/medium/android/core/models/MembershipTypeEntity;Ljava/lang/Long;Ljava/lang/Long;ZLjava/lang/String;Ljava/lang/String;Lcom/medium/android/core/models/MastodonEntity;ZZLjava/lang/Long;Ljava/util/List;ZLjava/util/List;Lcom/medium/android/core/models/PartnerProgramEnrollment;Ljava/lang/Long;Z)V", "getId", "()Ljava/lang/String;", "getName", "getUsername", "getProfileImageId", "getBio", "getAboutAsHtml", "getFollowerCount", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getFollowingCount", "getMembershipType", "()Lcom/medium/android/core/models/MembershipTypeEntity;", "getMemberSince", "getFriendSince", "()Z", "getFacebookDisplayName", "getTwitterDisplayName", "getMastodonEntity", "()Lcom/medium/android/core/models/MastodonEntity;", "getHasLists", "getFirstOpenedAndroidApp", "getAdminOfCollections", "()Ljava/util/List;", "getAllowEmailAddressSharing", "getPronouns", "getPartnerProgramEnrollment", "()Lcom/medium/android/core/models/PartnerProgramEnrollment;", "getLastPostCreatedAt", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "component12", "component13", "component14", "component15", "component16", "component17", "component18", "component19", "component20", "component21", "component22", "component23", "component24", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Lcom/medium/android/core/models/MembershipTypeEntity;Ljava/lang/Long;Ljava/lang/Long;ZLjava/lang/String;Ljava/lang/String;Lcom/medium/android/core/models/MastodonEntity;ZZLjava/lang/Long;Ljava/util/List;ZLjava/util/List;Lcom/medium/android/core/models/PartnerProgramEnrollment;Ljava/lang/Long;Z)Lcom/medium/android/core/models/CurrentUserEntity;", "equals", "other", "hashCode", "", "toString", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CurrentUserEntity {
    public static final int $stable = 8;
    private final String aboutAsHtml;
    private final List<CurrentUserAdminCollectionEntity> adminOfCollections;
    private final boolean allowEmailAddressSharing;
    private final String bio;
    private final String facebookDisplayName;
    private final Long firstOpenedAndroidApp;
    private final Long followerCount;
    private final Long followingCount;
    private final Long friendSince;
    private final boolean hasLists;
    private final String id;
    private final boolean isBookAuthor;
    private final boolean isMembershipTrialEligible;
    private final boolean isSuspended;
    private final Long lastPostCreatedAt;
    private final MastodonEntity mastodonEntity;
    private final Long memberSince;
    private final MembershipTypeEntity membershipType;
    private final String name;
    private final PartnerProgramEnrollment partnerProgramEnrollment;
    private final String profileImageId;
    private final List<String> pronouns;
    private final String twitterDisplayName;
    private final String username;

    /*  JADX ERROR: NullPointerException in pass: InitCodeVariables
        java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.SSAVar.getPhiList()" because "resultVar" is null
        	at jadx.core.dex.visitors.InitCodeVariables.collectConnectedVars(InitCodeVariables.java:119)
        	at jadx.core.dex.visitors.InitCodeVariables.setCodeVar(InitCodeVariables.java:82)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVar(InitCodeVariables.java:74)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVars(InitCodeVariables.java:48)
        	at jadx.core.dex.visitors.InitCodeVariables.visit(InitCodeVariables.java:29)
        */
    public /* synthetic */ CurrentUserEntity(java.lang.String r28, java.lang.String r29, java.lang.String r30, java.lang.String r31, java.lang.String r32, java.lang.String r33, java.lang.Long r34, java.lang.Long r35, com.medium.android.core.models.MembershipTypeEntity r36, java.lang.Long r37, java.lang.Long r38, boolean r39, java.lang.String r40, java.lang.String r41, com.medium.android.core.models.MastodonEntity r42, boolean r43, boolean r44, java.lang.Long r45, java.util.List r46, boolean r47, java.util.List r48, com.medium.android.core.models.PartnerProgramEnrollment r49, java.lang.Long r50, boolean r51, int r52, defpackage.gy2 r53) {
        /*
            r27 = this;
            r0 = 262144(0x40000, float:3.67342E-40)
            r0 = r52 & r0
            ey3 r1 = defpackage.ey3.a
            if (r0 == 0) goto Lb
            r21 = r1
            goto Ld
        Lb:
            r21 = r46
        Ld:
            r0 = 524288(0x80000, float:7.34684E-40)
            r0 = r52 & r0
            r2 = 0
            if (r0 == 0) goto L17
            r22 = r2
            goto L19
        L17:
            r22 = r47
        L19:
            r0 = 1048576(0x100000, float:1.469368E-39)
            r0 = r52 & r0
            if (r0 == 0) goto L22
            r23 = r1
            goto L24
        L22:
            r23 = r48
        L24:
            r0 = 2097152(0x200000, float:2.938736E-39)
            r0 = r52 & r0
            r1 = 0
            if (r0 == 0) goto L2e
            r24 = r1
            goto L30
        L2e:
            r24 = r49
        L30:
            r0 = 4194304(0x400000, float:5.877472E-39)
            r0 = r52 & r0
            if (r0 == 0) goto L39
            r25 = r1
            goto L3b
        L39:
            r25 = r50
        L3b:
            r0 = 8388608(0x800000, float:1.1754944E-38)
            r0 = r52 & r0
            if (r0 == 0) goto L6a
            r26 = r2
            r3 = r28
            r4 = r29
            r5 = r30
            r6 = r31
            r7 = r32
            r8 = r33
            r9 = r34
            r10 = r35
            r11 = r36
            r12 = r37
            r13 = r38
            r14 = r39
            r15 = r40
            r16 = r41
            r17 = r42
            r18 = r43
            r19 = r44
            r20 = r45
            r2 = r27
            goto L92
        L6a:
            r26 = r51
            r2 = r27
            r3 = r28
            r4 = r29
            r5 = r30
            r6 = r31
            r7 = r32
            r8 = r33
            r9 = r34
            r10 = r35
            r11 = r36
            r12 = r37
            r13 = r38
            r14 = r39
            r15 = r40
            r16 = r41
            r17 = r42
            r18 = r43
            r19 = r44
            r20 = r45
        L92:
            r2.<init>(r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24, r25, r26)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.core.models.CurrentUserEntity.<init>(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.Long, java.lang.Long, com.medium.android.core.models.MembershipTypeEntity, java.lang.Long, java.lang.Long, boolean, java.lang.String, java.lang.String, com.medium.android.core.models.MastodonEntity, boolean, boolean, java.lang.Long, java.util.List, boolean, java.util.List, com.medium.android.core.models.PartnerProgramEnrollment, java.lang.Long, boolean, int, gy2):void");
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ CurrentUserEntity copy$default(CurrentUserEntity currentUserEntity, String str, String str2, String str3, String str4, String str5, String str6, Long l, Long l2, MembershipTypeEntity membershipTypeEntity, Long l3, Long l4, boolean z, String str7, String str8, MastodonEntity mastodonEntity, boolean z2, boolean z3, Long l5, List list, boolean z4, List list2, PartnerProgramEnrollment partnerProgramEnrollment, Long l6, boolean z5, int i, Object obj) {
        boolean z6;
        Long l7;
        String str9 = (i & 1) != 0 ? currentUserEntity.id : str;
        String str10 = (i & 2) != 0 ? currentUserEntity.name : str2;
        String str11 = (i & 4) != 0 ? currentUserEntity.username : str3;
        String str12 = (i & 8) != 0 ? currentUserEntity.profileImageId : str4;
        String str13 = (i & 16) != 0 ? currentUserEntity.bio : str5;
        String str14 = (i & 32) != 0 ? currentUserEntity.aboutAsHtml : str6;
        Long l8 = (i & 64) != 0 ? currentUserEntity.followerCount : l;
        Long l9 = (i & 128) != 0 ? currentUserEntity.followingCount : l2;
        MembershipTypeEntity membershipTypeEntity2 = (i & 256) != 0 ? currentUserEntity.membershipType : membershipTypeEntity;
        Long l10 = (i & 512) != 0 ? currentUserEntity.memberSince : l3;
        Long l11 = (i & 1024) != 0 ? currentUserEntity.friendSince : l4;
        boolean z7 = (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? currentUserEntity.isMembershipTrialEligible : z;
        String str15 = (i & 4096) != 0 ? currentUserEntity.facebookDisplayName : str7;
        String str16 = (i & 8192) != 0 ? currentUserEntity.twitterDisplayName : str8;
        String str17 = str9;
        MastodonEntity mastodonEntity2 = (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? currentUserEntity.mastodonEntity : mastodonEntity;
        boolean z8 = (i & 32768) != 0 ? currentUserEntity.hasLists : z2;
        boolean z9 = (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? currentUserEntity.isBookAuthor : z3;
        Long l12 = (i & 131072) != 0 ? currentUserEntity.firstOpenedAndroidApp : l5;
        List list3 = (i & 262144) != 0 ? currentUserEntity.adminOfCollections : list;
        boolean z10 = (i & 524288) != 0 ? currentUserEntity.allowEmailAddressSharing : z4;
        List list4 = (i & 1048576) != 0 ? currentUserEntity.pronouns : list2;
        PartnerProgramEnrollment partnerProgramEnrollment2 = (i & 2097152) != 0 ? currentUserEntity.partnerProgramEnrollment : partnerProgramEnrollment;
        Long l13 = (i & 4194304) != 0 ? currentUserEntity.lastPostCreatedAt : l6;
        if ((i & 8388608) != 0) {
            l7 = l13;
            z6 = currentUserEntity.isSuspended;
        } else {
            z6 = z5;
            l7 = l13;
        }
        return currentUserEntity.copy(str17, str10, str11, str12, str13, str14, l8, l9, membershipTypeEntity2, l10, l11, z7, str15, str16, mastodonEntity2, z8, z9, l12, list3, z10, list4, partnerProgramEnrollment2, l7, z6);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final Long getMemberSince() {
        return this.memberSince;
    }

    /* JADX INFO: renamed from: component11, reason: from getter */
    public final Long getFriendSince() {
        return this.friendSince;
    }

    /* JADX INFO: renamed from: component12, reason: from getter */
    public final boolean getIsMembershipTrialEligible() {
        return this.isMembershipTrialEligible;
    }

    /* JADX INFO: renamed from: component13, reason: from getter */
    public final String getFacebookDisplayName() {
        return this.facebookDisplayName;
    }

    /* JADX INFO: renamed from: component14, reason: from getter */
    public final String getTwitterDisplayName() {
        return this.twitterDisplayName;
    }

    /* JADX INFO: renamed from: component15, reason: from getter */
    public final MastodonEntity getMastodonEntity() {
        return this.mastodonEntity;
    }

    /* JADX INFO: renamed from: component16, reason: from getter */
    public final boolean getHasLists() {
        return this.hasLists;
    }

    /* JADX INFO: renamed from: component17, reason: from getter */
    public final boolean getIsBookAuthor() {
        return this.isBookAuthor;
    }

    /* JADX INFO: renamed from: component18, reason: from getter */
    public final Long getFirstOpenedAndroidApp() {
        return this.firstOpenedAndroidApp;
    }

    public final List<CurrentUserAdminCollectionEntity> component19() {
        return this.adminOfCollections;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getName() {
        return this.name;
    }

    /* JADX INFO: renamed from: component20, reason: from getter */
    public final boolean getAllowEmailAddressSharing() {
        return this.allowEmailAddressSharing;
    }

    public final List<String> component21() {
        return this.pronouns;
    }

    /* JADX INFO: renamed from: component22, reason: from getter */
    public final PartnerProgramEnrollment getPartnerProgramEnrollment() {
        return this.partnerProgramEnrollment;
    }

    /* JADX INFO: renamed from: component23, reason: from getter */
    public final Long getLastPostCreatedAt() {
        return this.lastPostCreatedAt;
    }

    /* JADX INFO: renamed from: component24, reason: from getter */
    public final boolean getIsSuspended() {
        return this.isSuspended;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getUsername() {
        return this.username;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getProfileImageId() {
        return this.profileImageId;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final String getBio() {
        return this.bio;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final String getAboutAsHtml() {
        return this.aboutAsHtml;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final Long getFollowerCount() {
        return this.followerCount;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final Long getFollowingCount() {
        return this.followingCount;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final MembershipTypeEntity getMembershipType() {
        return this.membershipType;
    }

    public final CurrentUserEntity copy(String id, String name, String username, String profileImageId, String bio, String aboutAsHtml, Long followerCount, Long followingCount, MembershipTypeEntity membershipType, Long memberSince, Long friendSince, boolean isMembershipTrialEligible, String facebookDisplayName, String twitterDisplayName, MastodonEntity mastodonEntity, boolean hasLists, boolean isBookAuthor, Long firstOpenedAndroidApp, List<CurrentUserAdminCollectionEntity> adminOfCollections, boolean allowEmailAddressSharing, List<String> pronouns, PartnerProgramEnrollment partnerProgramEnrollment, Long lastPostCreatedAt, boolean isSuspended) {
        id.getClass();
        name.getClass();
        username.getClass();
        membershipType.getClass();
        adminOfCollections.getClass();
        pronouns.getClass();
        return new CurrentUserEntity(id, name, username, profileImageId, bio, aboutAsHtml, followerCount, followingCount, membershipType, memberSince, friendSince, isMembershipTrialEligible, facebookDisplayName, twitterDisplayName, mastodonEntity, hasLists, isBookAuthor, firstOpenedAndroidApp, adminOfCollections, allowEmailAddressSharing, pronouns, partnerProgramEnrollment, lastPostCreatedAt, isSuspended);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CurrentUserEntity)) {
            return false;
        }
        CurrentUserEntity currentUserEntity = (CurrentUserEntity) other;
        return g76.L(this.id, currentUserEntity.id) && g76.L(this.name, currentUserEntity.name) && g76.L(this.username, currentUserEntity.username) && g76.L(this.profileImageId, currentUserEntity.profileImageId) && g76.L(this.bio, currentUserEntity.bio) && g76.L(this.aboutAsHtml, currentUserEntity.aboutAsHtml) && g76.L(this.followerCount, currentUserEntity.followerCount) && g76.L(this.followingCount, currentUserEntity.followingCount) && this.membershipType == currentUserEntity.membershipType && g76.L(this.memberSince, currentUserEntity.memberSince) && g76.L(this.friendSince, currentUserEntity.friendSince) && this.isMembershipTrialEligible == currentUserEntity.isMembershipTrialEligible && g76.L(this.facebookDisplayName, currentUserEntity.facebookDisplayName) && g76.L(this.twitterDisplayName, currentUserEntity.twitterDisplayName) && g76.L(this.mastodonEntity, currentUserEntity.mastodonEntity) && this.hasLists == currentUserEntity.hasLists && this.isBookAuthor == currentUserEntity.isBookAuthor && g76.L(this.firstOpenedAndroidApp, currentUserEntity.firstOpenedAndroidApp) && g76.L(this.adminOfCollections, currentUserEntity.adminOfCollections) && this.allowEmailAddressSharing == currentUserEntity.allowEmailAddressSharing && g76.L(this.pronouns, currentUserEntity.pronouns) && g76.L(this.partnerProgramEnrollment, currentUserEntity.partnerProgramEnrollment) && g76.L(this.lastPostCreatedAt, currentUserEntity.lastPostCreatedAt) && this.isSuspended == currentUserEntity.isSuspended;
    }

    public final String getAboutAsHtml() {
        return this.aboutAsHtml;
    }

    public final List<CurrentUserAdminCollectionEntity> getAdminOfCollections() {
        return this.adminOfCollections;
    }

    public final boolean getAllowEmailAddressSharing() {
        return this.allowEmailAddressSharing;
    }

    public final String getBio() {
        return this.bio;
    }

    public final String getFacebookDisplayName() {
        return this.facebookDisplayName;
    }

    public final Long getFirstOpenedAndroidApp() {
        return this.firstOpenedAndroidApp;
    }

    public final Long getFollowerCount() {
        return this.followerCount;
    }

    public final Long getFollowingCount() {
        return this.followingCount;
    }

    public final Long getFriendSince() {
        return this.friendSince;
    }

    public final boolean getHasLists() {
        return this.hasLists;
    }

    public final String getId() {
        return this.id;
    }

    public final Long getLastPostCreatedAt() {
        return this.lastPostCreatedAt;
    }

    public final MastodonEntity getMastodonEntity() {
        return this.mastodonEntity;
    }

    public final Long getMemberSince() {
        return this.memberSince;
    }

    public final MembershipTypeEntity getMembershipType() {
        return this.membershipType;
    }

    public final String getName() {
        return this.name;
    }

    public final PartnerProgramEnrollment getPartnerProgramEnrollment() {
        return this.partnerProgramEnrollment;
    }

    public final String getProfileImageId() {
        return this.profileImageId;
    }

    public final List<String> getPronouns() {
        return this.pronouns;
    }

    public final String getTwitterDisplayName() {
        return this.twitterDisplayName;
    }

    public final String getUsername() {
        return this.username;
    }

    public int hashCode() {
        int iO = wgd.o(wgd.o(this.id.hashCode() * 31, 31, this.name), 31, this.username);
        String str = this.profileImageId;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.bio;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.aboutAsHtml;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Long l = this.followerCount;
        int iHashCode4 = (iHashCode3 + (l == null ? 0 : l.hashCode())) * 31;
        Long l2 = this.followingCount;
        int iHashCode5 = (this.membershipType.hashCode() + ((iHashCode4 + (l2 == null ? 0 : l2.hashCode())) * 31)) * 31;
        Long l3 = this.memberSince;
        int iHashCode6 = (iHashCode5 + (l3 == null ? 0 : l3.hashCode())) * 31;
        Long l4 = this.friendSince;
        int iHashCode7 = (((iHashCode6 + (l4 == null ? 0 : l4.hashCode())) * 31) + (this.isMembershipTrialEligible ? 1231 : 1237)) * 31;
        String str4 = this.facebookDisplayName;
        int iHashCode8 = (iHashCode7 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.twitterDisplayName;
        int iHashCode9 = (iHashCode8 + (str5 == null ? 0 : str5.hashCode())) * 31;
        MastodonEntity mastodonEntity = this.mastodonEntity;
        int iHashCode10 = (((((iHashCode9 + (mastodonEntity == null ? 0 : mastodonEntity.hashCode())) * 31) + (this.hasLists ? 1231 : 1237)) * 31) + (this.isBookAuthor ? 1231 : 1237)) * 31;
        Long l5 = this.firstOpenedAndroidApp;
        int iP = wgd.p((wgd.p((iHashCode10 + (l5 == null ? 0 : l5.hashCode())) * 31, 31, this.adminOfCollections) + (this.allowEmailAddressSharing ? 1231 : 1237)) * 31, 31, this.pronouns);
        PartnerProgramEnrollment partnerProgramEnrollment = this.partnerProgramEnrollment;
        int iHashCode11 = (iP + (partnerProgramEnrollment == null ? 0 : partnerProgramEnrollment.hashCode())) * 31;
        Long l6 = this.lastPostCreatedAt;
        return ((iHashCode11 + (l6 != null ? l6.hashCode() : 0)) * 31) + (this.isSuspended ? 1231 : 1237);
    }

    public final boolean isBookAuthor() {
        return this.isBookAuthor;
    }

    public final boolean isMembershipTrialEligible() {
        return this.isMembershipTrialEligible;
    }

    public final boolean isSuspended() {
        return this.isSuspended;
    }

    public CurrentUserEntity(String str, String str2, String str3, String str4, String str5, String str6, Long l, Long l2, MembershipTypeEntity membershipTypeEntity, Long l3, Long l4, boolean z, String str7, String str8, MastodonEntity mastodonEntity, boolean z2, boolean z3, Long l5, List<CurrentUserAdminCollectionEntity> list, boolean z4, List<String> list2, PartnerProgramEnrollment partnerProgramEnrollment, Long l6, boolean z5) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        membershipTypeEntity.getClass();
        list.getClass();
        list2.getClass();
        this.id = str;
        this.name = str2;
        this.username = str3;
        this.profileImageId = str4;
        this.bio = str5;
        this.aboutAsHtml = str6;
        this.followerCount = l;
        this.followingCount = l2;
        this.membershipType = membershipTypeEntity;
        this.memberSince = l3;
        this.friendSince = l4;
        this.isMembershipTrialEligible = z;
        this.facebookDisplayName = str7;
        this.twitterDisplayName = str8;
        this.mastodonEntity = mastodonEntity;
        this.hasLists = z2;
        this.isBookAuthor = z3;
        this.firstOpenedAndroidApp = l5;
        this.adminOfCollections = list;
        this.allowEmailAddressSharing = z4;
        this.pronouns = list2;
        this.partnerProgramEnrollment = partnerProgramEnrollment;
        this.lastPostCreatedAt = l6;
        this.isSuspended = z5;
    }

    public String toString() {
        String str = this.id;
        String str2 = this.name;
        String str3 = this.username;
        String str4 = this.profileImageId;
        String str5 = this.bio;
        String str6 = this.aboutAsHtml;
        Long l = this.followerCount;
        Long l2 = this.followingCount;
        MembershipTypeEntity membershipTypeEntity = this.membershipType;
        Long l3 = this.memberSince;
        Long l4 = this.friendSince;
        boolean z = this.isMembershipTrialEligible;
        String str7 = this.facebookDisplayName;
        String str8 = this.twitterDisplayName;
        MastodonEntity mastodonEntity = this.mastodonEntity;
        boolean z2 = this.hasLists;
        boolean z3 = this.isBookAuthor;
        Long l5 = this.firstOpenedAndroidApp;
        List<CurrentUserAdminCollectionEntity> list = this.adminOfCollections;
        boolean z4 = this.allowEmailAddressSharing;
        List<String> list2 = this.pronouns;
        PartnerProgramEnrollment partnerProgramEnrollment = this.partnerProgramEnrollment;
        Long l6 = this.lastPostCreatedAt;
        boolean z5 = this.isSuspended;
        StringBuilder sbU = y30.u("CurrentUserEntity(id=", str, ", name=", str2, ", username=");
        ka1.C(sbU, str3, ", profileImageId=", str4, ", bio=");
        ka1.C(sbU, str5, ", aboutAsHtml=", str6, ", followerCount=");
        sbU.append(l);
        sbU.append(", followingCount=");
        sbU.append(l2);
        sbU.append(", membershipType=");
        sbU.append(membershipTypeEntity);
        sbU.append(", memberSince=");
        sbU.append(l3);
        sbU.append(", friendSince=");
        sbU.append(l4);
        sbU.append(", isMembershipTrialEligible=");
        sbU.append(z);
        sbU.append(", facebookDisplayName=");
        ka1.C(sbU, str7, ", twitterDisplayName=", str8, ", mastodonEntity=");
        sbU.append(mastodonEntity);
        sbU.append(", hasLists=");
        sbU.append(z2);
        sbU.append(", isBookAuthor=");
        sbU.append(z3);
        sbU.append(", firstOpenedAndroidApp=");
        sbU.append(l5);
        sbU.append(", adminOfCollections=");
        sbU.append(list);
        sbU.append(", allowEmailAddressSharing=");
        sbU.append(z4);
        sbU.append(", pronouns=");
        sbU.append(list2);
        sbU.append(gYpYQDQkhfs.LtvAKQZRvZxXWtE);
        sbU.append(partnerProgramEnrollment);
        sbU.append(", lastPostCreatedAt=");
        sbU.append(l6);
        sbU.append(", isSuspended=");
        sbU.append(z5);
        sbU.append(")");
        return sbU.toString();
    }
}
