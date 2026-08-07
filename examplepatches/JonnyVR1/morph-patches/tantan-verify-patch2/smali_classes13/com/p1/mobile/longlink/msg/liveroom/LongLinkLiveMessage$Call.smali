.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Call"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallOrBuilder;"
    }
.end annotation


# static fields
.field public static final ANCHORUSERID_FIELD_NUMBER:I = 0xe

.field public static final ANCHORUSERNAME_FIELD_NUMBER:I = 0xf

.field public static final ANCHORUSERPROFILE_FIELD_NUMBER:I = 0x10

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

.field public static final HANGUPREASON_FIELD_NUMBER:I = 0x14

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final INTENDPOSITION_FIELD_NUMBER:I = 0x7

.field public static final INVITEID_FIELD_NUMBER:I = 0x12

.field public static final ISAWAY_FIELD_NUMBER:I = 0x13

.field public static final LIVEID_FIELD_NUMBER:I = 0x2

.field public static final MUTEDBYANCHOR_FIELD_NUMBER:I = 0xa

.field public static final MUTEDBYUSER_FIELD_NUMBER:I = 0x9

.field public static final OPSTATE_FIELD_NUMBER:I = 0x11

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;",
            ">;"
        }
    .end annotation
.end field

.field public static final POSITION_FIELD_NUMBER:I = 0x8

.field public static final SOURCE_FIELD_NUMBER:I = 0x4

.field public static final STATE_FIELD_NUMBER:I = 0x3

.field public static final USERID_FIELD_NUMBER:I = 0xb

.field public static final USERNAME_FIELD_NUMBER:I = 0xc

.field public static final USERPROFILE_FIELD_NUMBER:I = 0xd

.field public static final USERRECVREWARDPOINT_FIELD_NUMBER:I = 0x6

.field public static final USERSENDREWARDPOINT_FIELD_NUMBER:I = 0x5


# instance fields
.field private anchorUserId_:Ljava/lang/String;

.field private anchorUserName_:Ljava/lang/String;

.field private anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

.field private hangupReason_:Ljava/lang/String;

.field private id_:Ljava/lang/String;

.field private intendPosition_:I

.field private inviteId_:Ljava/lang/String;

.field private isAway_:Z

.field private liveId_:Ljava/lang/String;

.field private mutedByAnchor_:Z

.field private mutedByUser_:Z

.field private opState_:Ljava/lang/String;

.field private position_:I

.field private source_:Ljava/lang/String;

.field private state_:Ljava/lang/String;

.field private userId_:Ljava/lang/String;

.field private userName_:Ljava/lang/String;

.field private userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

.field private userRecvRewardPoint_:J

.field private userSendRewardPoint_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->makeImmutable()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->liveId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->state_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->source_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userId_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userName_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserId_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserName_:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->opState_:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->inviteId_:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hangupReason_:Ljava/lang/String;

    .line 27
    .line 28
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setAnchorUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setAnchorUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setHangupReason(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setHangupReasonBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setIntendPosition(I)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setInviteId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setInviteIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setIsAway(Z)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setLiveId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setMutedByAnchor(Z)V

    return-void
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setMutedByUser(Z)V

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setOpState(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setOpStateBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic Q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setPosition(I)V

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setSource(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setSourceBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setState(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic U(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setStateBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic V(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic W(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic X(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic Y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic Z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearAnchorUserId()V

    return-void
.end method

.method public static bridge synthetic a0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearAnchorUserName()V

    return-void
.end method

.method public static bridge synthetic b0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setUserRecvRewardPoint(J)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearAnchorUserProfile()V

    return-void
.end method

.method public static bridge synthetic c0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setUserSendRewardPoint(J)V

    return-void
.end method

.method private clearAnchorUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAnchorUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAnchorUserProfile()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 3
    .line 4
    return-void
.end method

.method private clearHangupReason()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getHangupReason()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hangupReason_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIntendPosition()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->intendPosition_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearInviteId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getInviteId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->inviteId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIsAway()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->isAway_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->liveId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearMutedByAnchor()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByAnchor_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearMutedByUser()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByUser_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearOpState()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getOpState()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->opState_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPosition()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->position_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearSource()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getSource()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->source_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearState()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getState()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->state_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserProfile()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 3
    .line 4
    return-void
.end method

.method private clearUserRecvRewardPoint()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userRecvRewardPoint_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearUserSendRewardPoint()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userSendRewardPoint_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearHangupReason()V

    return-void
.end method

.method public static bridge synthetic d0()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    return-object v0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearId()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearIntendPosition()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearInviteId()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearIsAway()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearLiveId()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearMutedByAnchor()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearMutedByUser()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearOpState()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearPosition()V

    return-void
.end method

.method private mergeAnchorUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 33
    .line 34
    return-void
.end method

.method private mergeUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearSource()V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearState()V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearUserId()V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->getParserForType()Ll/ng60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearUserName()V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearUserProfile()V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearUserRecvRewardPoint()V

    return-void
.end method

.method private setAnchorUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAnchorUserIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAnchorUserName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAnchorUserNameBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAnchorUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 8
    .line 9
    return-void
.end method

.method private setAnchorUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    return-void
.end method

.method private setHangupReason(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hangupReason_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setHangupReasonBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hangupReason_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->id_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIntendPosition(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->intendPosition_:I

    .line 2
    .line 3
    return-void
.end method

.method private setInviteId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->inviteId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setInviteIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->inviteId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIsAway(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->isAway_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setLiveId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->liveId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLiveIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->liveId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setMutedByAnchor(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByAnchor_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setMutedByUser(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByUser_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setOpState(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->opState_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOpStateBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->opState_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPosition(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->position_:I

    .line 2
    .line 3
    return-void
.end method

.method private setSource(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->source_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSourceBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->source_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setState(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->state_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setStateBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->state_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserNameBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 8
    .line 9
    return-void
.end method

.method private setUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    return-void
.end method

.method private setUserRecvRewardPoint(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userRecvRewardPoint_:J

    .line 2
    .line 3
    return-void
.end method

.method private setUserSendRewardPoint(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userSendRewardPoint_:J

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->clearUserSendRewardPoint()V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mergeAnchorUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mergeUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setAnchorUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setAnchorUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setAnchorUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->setAnchorUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    packed-switch p1, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/l710;->a()V

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->PARSER:Ll/ng60;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    move-object p1, v0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    monitor-exit p0

    .line 44
    goto :goto_2

    .line 45
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    throw p1

    .line 47
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->PARSER:Ll/ng60;

    .line 48
    .line 49
    return-object p0

    .line 50
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 51
    .line 52
    check-cast p3, Lcom/google/protobuf/h;

    .line 53
    .line 54
    :cond_2
    :goto_3
    if-nez v0, :cond_5

    .line 55
    .line 56
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    sparse-switch p1, :sswitch_data_0

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_2

    .line 68
    .line 69
    :sswitch_0
    move v0, v2

    .line 70
    goto :goto_3

    .line 71
    :catch_0
    move-exception v0

    .line 72
    move-object p1, v0

    .line 73
    goto/16 :goto_6

    .line 74
    .line 75
    :catch_1
    move-exception v0

    .line 76
    move-object p1, v0

    .line 77
    goto/16 :goto_7

    .line 78
    .line 79
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hangupReason_:Ljava/lang/String;

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->isAway_:Z

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->inviteId_:Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->opState_:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :sswitch_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 108
    .line 109
    if-eqz p1, :cond_3

    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;

    .line 116
    .line 117
    goto :goto_4

    .line 118
    :cond_3
    move-object p1, v1

    .line 119
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->parser()Ll/ng60;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 128
    .line 129
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 130
    .line 131
    if-eqz p1, :cond_2

    .line 132
    .line 133
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 141
    .line 142
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserName_:Ljava/lang/String;

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserId_:Ljava/lang/String;

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :sswitch_8
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 160
    .line 161
    if-eqz p1, :cond_4

    .line 162
    .line 163
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;

    .line 168
    .line 169
    goto :goto_5

    .line 170
    :cond_4
    move-object p1, v1

    .line 171
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->parser()Ll/ng60;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 180
    .line 181
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 182
    .line 183
    if-eqz p1, :cond_2

    .line 184
    .line 185
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 193
    .line 194
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 195
    .line 196
    goto/16 :goto_3

    .line 197
    .line 198
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userName_:Ljava/lang/String;

    .line 203
    .line 204
    goto/16 :goto_3

    .line 205
    .line 206
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userId_:Ljava/lang/String;

    .line 211
    .line 212
    goto/16 :goto_3

    .line 213
    .line 214
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 215
    .line 216
    .line 217
    move-result p1

    .line 218
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByAnchor_:Z

    .line 219
    .line 220
    goto/16 :goto_3

    .line 221
    .line 222
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByUser_:Z

    .line 227
    .line 228
    goto/16 :goto_3

    .line 229
    .line 230
    :sswitch_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 231
    .line 232
    .line 233
    move-result p1

    .line 234
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->position_:I

    .line 235
    .line 236
    goto/16 :goto_3

    .line 237
    .line 238
    :sswitch_e
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 239
    .line 240
    .line 241
    move-result p1

    .line 242
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->intendPosition_:I

    .line 243
    .line 244
    goto/16 :goto_3

    .line 245
    .line 246
    :sswitch_f
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 247
    .line 248
    .line 249
    move-result-wide v3

    .line 250
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userRecvRewardPoint_:J

    .line 251
    .line 252
    goto/16 :goto_3

    .line 253
    .line 254
    :sswitch_10
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 255
    .line 256
    .line 257
    move-result-wide v3

    .line 258
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userSendRewardPoint_:J

    .line 259
    .line 260
    goto/16 :goto_3

    .line 261
    .line 262
    :sswitch_11
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->source_:Ljava/lang/String;

    .line 267
    .line 268
    goto/16 :goto_3

    .line 269
    .line 270
    :sswitch_12
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->state_:Ljava/lang/String;

    .line 275
    .line 276
    goto/16 :goto_3

    .line 277
    .line 278
    :sswitch_13
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->liveId_:Ljava/lang/String;

    .line 283
    .line 284
    goto/16 :goto_3

    .line 285
    .line 286
    :sswitch_14
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object p1

    .line 290
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->id_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 291
    .line 292
    goto/16 :goto_3

    .line 293
    .line 294
    :catchall_1
    move-exception v0

    .line 295
    move-object p0, v0

    .line 296
    throw p0

    .line 297
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 298
    .line 299
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 307
    .line 308
    .line 309
    move-result-object p0

    .line 310
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 311
    .line 312
    .line 313
    return-object v1

    .line 314
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 315
    .line 316
    .line 317
    move-result-object p0

    .line 318
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 319
    .line 320
    .line 321
    return-object v1

    .line 322
    :cond_5
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 323
    .line 324
    return-object p0

    .line 325
    :pswitch_3
    move-object v3, p2

    .line 326
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 327
    .line 328
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 329
    .line 330
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->id_:Ljava/lang/String;

    .line 331
    .line 332
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 333
    .line 334
    .line 335
    move-result p1

    .line 336
    xor-int/2addr p1, v2

    .line 337
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->id_:Ljava/lang/String;

    .line 338
    .line 339
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->id_:Ljava/lang/String;

    .line 340
    .line 341
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    xor-int/2addr v1, v2

    .line 346
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->id_:Ljava/lang/String;

    .line 347
    .line 348
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->id_:Ljava/lang/String;

    .line 353
    .line 354
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->liveId_:Ljava/lang/String;

    .line 355
    .line 356
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 357
    .line 358
    .line 359
    move-result p1

    .line 360
    xor-int/2addr p1, v2

    .line 361
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->liveId_:Ljava/lang/String;

    .line 362
    .line 363
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->liveId_:Ljava/lang/String;

    .line 364
    .line 365
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 366
    .line 367
    .line 368
    move-result v1

    .line 369
    xor-int/2addr v1, v2

    .line 370
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->liveId_:Ljava/lang/String;

    .line 371
    .line 372
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object p1

    .line 376
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->liveId_:Ljava/lang/String;

    .line 377
    .line 378
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->state_:Ljava/lang/String;

    .line 379
    .line 380
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 381
    .line 382
    .line 383
    move-result p1

    .line 384
    xor-int/2addr p1, v2

    .line 385
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->state_:Ljava/lang/String;

    .line 386
    .line 387
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->state_:Ljava/lang/String;

    .line 388
    .line 389
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 390
    .line 391
    .line 392
    move-result v1

    .line 393
    xor-int/2addr v1, v2

    .line 394
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->state_:Ljava/lang/String;

    .line 395
    .line 396
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    move-result-object p1

    .line 400
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->state_:Ljava/lang/String;

    .line 401
    .line 402
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->source_:Ljava/lang/String;

    .line 403
    .line 404
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 405
    .line 406
    .line 407
    move-result p1

    .line 408
    xor-int/2addr p1, v2

    .line 409
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->source_:Ljava/lang/String;

    .line 410
    .line 411
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->source_:Ljava/lang/String;

    .line 412
    .line 413
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 414
    .line 415
    .line 416
    move-result v1

    .line 417
    xor-int/2addr v1, v2

    .line 418
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->source_:Ljava/lang/String;

    .line 419
    .line 420
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 421
    .line 422
    .line 423
    move-result-object p1

    .line 424
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->source_:Ljava/lang/String;

    .line 425
    .line 426
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userSendRewardPoint_:J

    .line 427
    .line 428
    const-wide/16 p1, 0x0

    .line 429
    .line 430
    cmp-long v1, v5, p1

    .line 431
    .line 432
    if-eqz v1, :cond_6

    .line 433
    .line 434
    move v4, v2

    .line 435
    goto :goto_8

    .line 436
    :cond_6
    move v4, v0

    .line 437
    :goto_8
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userSendRewardPoint_:J

    .line 438
    .line 439
    cmp-long v1, v8, p1

    .line 440
    .line 441
    if-eqz v1, :cond_7

    .line 442
    .line 443
    move v7, v2

    .line 444
    goto :goto_9

    .line 445
    :cond_7
    move v7, v0

    .line 446
    :goto_9
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 447
    .line 448
    .line 449
    move-result-wide v4

    .line 450
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userSendRewardPoint_:J

    .line 451
    .line 452
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userRecvRewardPoint_:J

    .line 453
    .line 454
    cmp-long v1, v5, p1

    .line 455
    .line 456
    if-eqz v1, :cond_8

    .line 457
    .line 458
    move v4, v2

    .line 459
    goto :goto_a

    .line 460
    :cond_8
    move v4, v0

    .line 461
    :goto_a
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userRecvRewardPoint_:J

    .line 462
    .line 463
    cmp-long p1, v8, p1

    .line 464
    .line 465
    if-eqz p1, :cond_9

    .line 466
    .line 467
    move v7, v2

    .line 468
    goto :goto_b

    .line 469
    :cond_9
    move v7, v0

    .line 470
    :goto_b
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 471
    .line 472
    .line 473
    move-result-wide p1

    .line 474
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userRecvRewardPoint_:J

    .line 475
    .line 476
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->intendPosition_:I

    .line 477
    .line 478
    if-eqz p1, :cond_a

    .line 479
    .line 480
    move p2, v2

    .line 481
    goto :goto_c

    .line 482
    :cond_a
    move p2, v0

    .line 483
    :goto_c
    iget v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->intendPosition_:I

    .line 484
    .line 485
    if-eqz v1, :cond_b

    .line 486
    .line 487
    move v4, v2

    .line 488
    goto :goto_d

    .line 489
    :cond_b
    move v4, v0

    .line 490
    :goto_d
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 491
    .line 492
    .line 493
    move-result p1

    .line 494
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->intendPosition_:I

    .line 495
    .line 496
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->position_:I

    .line 497
    .line 498
    if-eqz p1, :cond_c

    .line 499
    .line 500
    move p2, v2

    .line 501
    goto :goto_e

    .line 502
    :cond_c
    move p2, v0

    .line 503
    :goto_e
    iget v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->position_:I

    .line 504
    .line 505
    if-eqz v1, :cond_d

    .line 506
    .line 507
    move v0, v2

    .line 508
    :cond_d
    invoke-interface {v3, p2, p1, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 509
    .line 510
    .line 511
    move-result p1

    .line 512
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->position_:I

    .line 513
    .line 514
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByUser_:Z

    .line 515
    .line 516
    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByUser_:Z

    .line 517
    .line 518
    invoke-interface {v3, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 519
    .line 520
    .line 521
    move-result p1

    .line 522
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByUser_:Z

    .line 523
    .line 524
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByAnchor_:Z

    .line 525
    .line 526
    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByAnchor_:Z

    .line 527
    .line 528
    invoke-interface {v3, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 529
    .line 530
    .line 531
    move-result p1

    .line 532
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByAnchor_:Z

    .line 533
    .line 534
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userId_:Ljava/lang/String;

    .line 535
    .line 536
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 537
    .line 538
    .line 539
    move-result p1

    .line 540
    xor-int/2addr p1, v2

    .line 541
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userId_:Ljava/lang/String;

    .line 542
    .line 543
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userId_:Ljava/lang/String;

    .line 544
    .line 545
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 546
    .line 547
    .line 548
    move-result v0

    .line 549
    xor-int/2addr v0, v2

    .line 550
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userId_:Ljava/lang/String;

    .line 551
    .line 552
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 553
    .line 554
    .line 555
    move-result-object p1

    .line 556
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userId_:Ljava/lang/String;

    .line 557
    .line 558
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userName_:Ljava/lang/String;

    .line 559
    .line 560
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 561
    .line 562
    .line 563
    move-result p1

    .line 564
    xor-int/2addr p1, v2

    .line 565
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userName_:Ljava/lang/String;

    .line 566
    .line 567
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userName_:Ljava/lang/String;

    .line 568
    .line 569
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 570
    .line 571
    .line 572
    move-result v0

    .line 573
    xor-int/2addr v0, v2

    .line 574
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userName_:Ljava/lang/String;

    .line 575
    .line 576
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 577
    .line 578
    .line 579
    move-result-object p1

    .line 580
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userName_:Ljava/lang/String;

    .line 581
    .line 582
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 583
    .line 584
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 585
    .line 586
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 587
    .line 588
    .line 589
    move-result-object p1

    .line 590
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 591
    .line 592
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 593
    .line 594
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserId_:Ljava/lang/String;

    .line 595
    .line 596
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 597
    .line 598
    .line 599
    move-result p1

    .line 600
    xor-int/2addr p1, v2

    .line 601
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserId_:Ljava/lang/String;

    .line 602
    .line 603
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserId_:Ljava/lang/String;

    .line 604
    .line 605
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 606
    .line 607
    .line 608
    move-result v0

    .line 609
    xor-int/2addr v0, v2

    .line 610
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserId_:Ljava/lang/String;

    .line 611
    .line 612
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 613
    .line 614
    .line 615
    move-result-object p1

    .line 616
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserId_:Ljava/lang/String;

    .line 617
    .line 618
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserName_:Ljava/lang/String;

    .line 619
    .line 620
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 621
    .line 622
    .line 623
    move-result p1

    .line 624
    xor-int/2addr p1, v2

    .line 625
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserName_:Ljava/lang/String;

    .line 626
    .line 627
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserName_:Ljava/lang/String;

    .line 628
    .line 629
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 630
    .line 631
    .line 632
    move-result v0

    .line 633
    xor-int/2addr v0, v2

    .line 634
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserName_:Ljava/lang/String;

    .line 635
    .line 636
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 637
    .line 638
    .line 639
    move-result-object p1

    .line 640
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserName_:Ljava/lang/String;

    .line 641
    .line 642
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 643
    .line 644
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 645
    .line 646
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 647
    .line 648
    .line 649
    move-result-object p1

    .line 650
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 651
    .line 652
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 653
    .line 654
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->opState_:Ljava/lang/String;

    .line 655
    .line 656
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 657
    .line 658
    .line 659
    move-result p1

    .line 660
    xor-int/2addr p1, v2

    .line 661
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->opState_:Ljava/lang/String;

    .line 662
    .line 663
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->opState_:Ljava/lang/String;

    .line 664
    .line 665
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 666
    .line 667
    .line 668
    move-result v0

    .line 669
    xor-int/2addr v0, v2

    .line 670
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->opState_:Ljava/lang/String;

    .line 671
    .line 672
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 673
    .line 674
    .line 675
    move-result-object p1

    .line 676
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->opState_:Ljava/lang/String;

    .line 677
    .line 678
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->inviteId_:Ljava/lang/String;

    .line 679
    .line 680
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 681
    .line 682
    .line 683
    move-result p1

    .line 684
    xor-int/2addr p1, v2

    .line 685
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->inviteId_:Ljava/lang/String;

    .line 686
    .line 687
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->inviteId_:Ljava/lang/String;

    .line 688
    .line 689
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 690
    .line 691
    .line 692
    move-result v0

    .line 693
    xor-int/2addr v0, v2

    .line 694
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->inviteId_:Ljava/lang/String;

    .line 695
    .line 696
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 697
    .line 698
    .line 699
    move-result-object p1

    .line 700
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->inviteId_:Ljava/lang/String;

    .line 701
    .line 702
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->isAway_:Z

    .line 703
    .line 704
    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->isAway_:Z

    .line 705
    .line 706
    invoke-interface {v3, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 707
    .line 708
    .line 709
    move-result p1

    .line 710
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->isAway_:Z

    .line 711
    .line 712
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hangupReason_:Ljava/lang/String;

    .line 713
    .line 714
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 715
    .line 716
    .line 717
    move-result p1

    .line 718
    xor-int/2addr p1, v2

    .line 719
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hangupReason_:Ljava/lang/String;

    .line 720
    .line 721
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hangupReason_:Ljava/lang/String;

    .line 722
    .line 723
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 724
    .line 725
    .line 726
    move-result v0

    .line 727
    xor-int/2addr v0, v2

    .line 728
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hangupReason_:Ljava/lang/String;

    .line 729
    .line 730
    invoke-interface {v3, p1, p2, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 731
    .line 732
    .line 733
    move-result-object p1

    .line 734
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hangupReason_:Ljava/lang/String;

    .line 735
    .line 736
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 737
    .line 738
    return-object p0

    .line 739
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;

    .line 740
    .line 741
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call$Builder;-><init>(Ll/c3w;)V

    .line 742
    .line 743
    .line 744
    return-object p0

    .line 745
    :pswitch_5
    return-object v1

    .line 746
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 747
    .line 748
    return-object p0

    .line 749
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;

    .line 750
    .line 751
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;-><init>()V

    .line 752
    .line 753
    .line 754
    return-object p0

    .line 755
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch

    .line 756
    .line 757
    .line 758
    .line 759
    .line 760
    .line 761
    .line 762
    .line 763
    .line 764
    .line 765
    .line 766
    .line 767
    .line 768
    .line 769
    .line 770
    .line 771
    .line 772
    .line 773
    .line 774
    .line 775
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_14
        0x12 -> :sswitch_13
        0x1a -> :sswitch_12
        0x22 -> :sswitch_11
        0x28 -> :sswitch_10
        0x30 -> :sswitch_f
        0x38 -> :sswitch_e
        0x40 -> :sswitch_d
        0x48 -> :sswitch_c
        0x50 -> :sswitch_b
        0x5a -> :sswitch_a
        0x62 -> :sswitch_9
        0x6a -> :sswitch_8
        0x72 -> :sswitch_7
        0x7a -> :sswitch_6
        0x82 -> :sswitch_5
        0x8a -> :sswitch_4
        0x92 -> :sswitch_3
        0x98 -> :sswitch_2
        0xa2 -> :sswitch_1
    .end sparse-switch
.end method

.method public getAnchorUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserId_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getAnchorUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserName_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getAnchorUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getHangupReason()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hangupReason_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHangupReasonBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hangupReason_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->id_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getIntendPosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->intendPosition_:I

    .line 2
    .line 3
    return p0
.end method

.method public getInviteId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->inviteId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInviteIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->inviteId_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getIsAway()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->isAway_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->liveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->liveId_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getMutedByAnchor()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByAnchor_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getMutedByUser()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByUser_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getOpState()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->opState_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOpStateBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->opState_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->position_:I

    .line 2
    .line 3
    return p0
.end method

.method public getSerializedSize()I
    .locals 6

    .line 1
    iget v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->id_:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v0, 0x0

    .line 26
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->liveId_:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x2

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getLiveId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    add-int/2addr v0, v1

    .line 44
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->state_:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    const/4 v1, 0x3

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getState()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    add-int/2addr v0, v1

    .line 62
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->source_:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_4

    .line 69
    .line 70
    const/4 v1, 0x4

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getSource()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    add-int/2addr v0, v1

    .line 80
    :cond_4
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userSendRewardPoint_:J

    .line 81
    .line 82
    const-wide/16 v3, 0x0

    .line 83
    .line 84
    cmp-long v5, v1, v3

    .line 85
    .line 86
    if-eqz v5, :cond_5

    .line 87
    .line 88
    const/4 v5, 0x5

    .line 89
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    add-int/2addr v0, v1

    .line 94
    :cond_5
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userRecvRewardPoint_:J

    .line 95
    .line 96
    cmp-long v3, v1, v3

    .line 97
    .line 98
    if-eqz v3, :cond_6

    .line 99
    .line 100
    const/4 v3, 0x6

    .line 101
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    add-int/2addr v0, v1

    .line 106
    :cond_6
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->intendPosition_:I

    .line 107
    .line 108
    if-eqz v1, :cond_7

    .line 109
    .line 110
    const/4 v2, 0x7

    .line 111
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    add-int/2addr v0, v1

    .line 116
    :cond_7
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->position_:I

    .line 117
    .line 118
    if-eqz v1, :cond_8

    .line 119
    .line 120
    const/16 v2, 0x8

    .line 121
    .line 122
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    add-int/2addr v0, v1

    .line 127
    :cond_8
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByUser_:Z

    .line 128
    .line 129
    if-eqz v1, :cond_9

    .line 130
    .line 131
    const/16 v2, 0x9

    .line 132
    .line 133
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    add-int/2addr v0, v1

    .line 138
    :cond_9
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByAnchor_:Z

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    const/16 v2, 0xa

    .line 143
    .line 144
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    add-int/2addr v0, v1

    .line 149
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userId_:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-nez v1, :cond_b

    .line 156
    .line 157
    const/16 v1, 0xb

    .line 158
    .line 159
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserId()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    add-int/2addr v0, v1

    .line 168
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userName_:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-nez v1, :cond_c

    .line 175
    .line 176
    const/16 v1, 0xc

    .line 177
    .line 178
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserName()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    add-int/2addr v0, v1

    .line 187
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 188
    .line 189
    if-eqz v1, :cond_d

    .line 190
    .line 191
    const/16 v1, 0xd

    .line 192
    .line 193
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    add-int/2addr v0, v1

    .line 202
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserId_:Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    if-nez v1, :cond_e

    .line 209
    .line 210
    const/16 v1, 0xe

    .line 211
    .line 212
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserId()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 217
    .line 218
    .line 219
    move-result v1

    .line 220
    add-int/2addr v0, v1

    .line 221
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserName_:Ljava/lang/String;

    .line 222
    .line 223
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    if-nez v1, :cond_f

    .line 228
    .line 229
    const/16 v1, 0xf

    .line 230
    .line 231
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserName()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    add-int/2addr v0, v1

    .line 240
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 241
    .line 242
    if-eqz v1, :cond_10

    .line 243
    .line 244
    const/16 v1, 0x10

    .line 245
    .line 246
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    add-int/2addr v0, v1

    .line 255
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->opState_:Ljava/lang/String;

    .line 256
    .line 257
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    if-nez v1, :cond_11

    .line 262
    .line 263
    const/16 v1, 0x11

    .line 264
    .line 265
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getOpState()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v2

    .line 269
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    add-int/2addr v0, v1

    .line 274
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->inviteId_:Ljava/lang/String;

    .line 275
    .line 276
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    if-nez v1, :cond_12

    .line 281
    .line 282
    const/16 v1, 0x12

    .line 283
    .line 284
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getInviteId()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v2

    .line 288
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 289
    .line 290
    .line 291
    move-result v1

    .line 292
    add-int/2addr v0, v1

    .line 293
    :cond_12
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->isAway_:Z

    .line 294
    .line 295
    if-eqz v1, :cond_13

    .line 296
    .line 297
    const/16 v2, 0x13

    .line 298
    .line 299
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    add-int/2addr v0, v1

    .line 304
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hangupReason_:Ljava/lang/String;

    .line 305
    .line 306
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 307
    .line 308
    .line 309
    move-result v1

    .line 310
    if-nez v1, :cond_14

    .line 311
    .line 312
    const/16 v1, 0x14

    .line 313
    .line 314
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getHangupReason()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v2

    .line 318
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 319
    .line 320
    .line 321
    move-result v1

    .line 322
    add-int/2addr v0, v1

    .line 323
    :cond_14
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 324
    .line 325
    return v0
.end method

.method public getSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->source_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSourceBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->source_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getState()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->state_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStateBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->state_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userName_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getUserRecvRewardPoint()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userRecvRewardPoint_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getUserSendRewardPoint()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userSendRewardPoint_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hasAnchorUserProfile()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public hasUserProfile()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->id_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->liveId_:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x2

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getLiveId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->state_:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    const/4 v0, 0x3

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getState()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->source_:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_3

    .line 56
    .line 57
    const/4 v0, 0x4

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getSource()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userSendRewardPoint_:J

    .line 66
    .line 67
    const-wide/16 v2, 0x0

    .line 68
    .line 69
    cmp-long v4, v0, v2

    .line 70
    .line 71
    if-eqz v4, :cond_4

    .line 72
    .line 73
    const/4 v4, 0x5

    .line 74
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 75
    .line 76
    .line 77
    :cond_4
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userRecvRewardPoint_:J

    .line 78
    .line 79
    cmp-long v2, v0, v2

    .line 80
    .line 81
    if-eqz v2, :cond_5

    .line 82
    .line 83
    const/4 v2, 0x6

    .line 84
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 85
    .line 86
    .line 87
    :cond_5
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->intendPosition_:I

    .line 88
    .line 89
    if-eqz v0, :cond_6

    .line 90
    .line 91
    const/4 v1, 0x7

    .line 92
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 93
    .line 94
    .line 95
    :cond_6
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->position_:I

    .line 96
    .line 97
    if-eqz v0, :cond_7

    .line 98
    .line 99
    const/16 v1, 0x8

    .line 100
    .line 101
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 102
    .line 103
    .line 104
    :cond_7
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByUser_:Z

    .line 105
    .line 106
    if-eqz v0, :cond_8

    .line 107
    .line 108
    const/16 v1, 0x9

    .line 109
    .line 110
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 111
    .line 112
    .line 113
    :cond_8
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->mutedByAnchor_:Z

    .line 114
    .line 115
    if-eqz v0, :cond_9

    .line 116
    .line 117
    const/16 v1, 0xa

    .line 118
    .line 119
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 120
    .line 121
    .line 122
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userId_:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-nez v0, :cond_a

    .line 129
    .line 130
    const/16 v0, 0xb

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserId()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userName_:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-nez v0, :cond_b

    .line 146
    .line 147
    const/16 v0, 0xc

    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserName()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 154
    .line 155
    .line 156
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 157
    .line 158
    if-eqz v0, :cond_c

    .line 159
    .line 160
    const/16 v0, 0xd

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 167
    .line 168
    .line 169
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserId_:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-nez v0, :cond_d

    .line 176
    .line 177
    const/16 v0, 0xe

    .line 178
    .line 179
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserId()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 184
    .line 185
    .line 186
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserName_:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-nez v0, :cond_e

    .line 193
    .line 194
    const/16 v0, 0xf

    .line 195
    .line 196
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserName()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 201
    .line 202
    .line 203
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 204
    .line 205
    if-eqz v0, :cond_f

    .line 206
    .line 207
    const/16 v0, 0x10

    .line 208
    .line 209
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 214
    .line 215
    .line 216
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->opState_:Ljava/lang/String;

    .line 217
    .line 218
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-nez v0, :cond_10

    .line 223
    .line 224
    const/16 v0, 0x11

    .line 225
    .line 226
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getOpState()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 231
    .line 232
    .line 233
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->inviteId_:Ljava/lang/String;

    .line 234
    .line 235
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 236
    .line 237
    .line 238
    move-result v0

    .line 239
    if-nez v0, :cond_11

    .line 240
    .line 241
    const/16 v0, 0x12

    .line 242
    .line 243
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getInviteId()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 248
    .line 249
    .line 250
    :cond_11
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->isAway_:Z

    .line 251
    .line 252
    if-eqz v0, :cond_12

    .line 253
    .line 254
    const/16 v1, 0x13

    .line 255
    .line 256
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 257
    .line 258
    .line 259
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->hangupReason_:Ljava/lang/String;

    .line 260
    .line 261
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    if-nez v0, :cond_13

    .line 266
    .line 267
    const/16 v0, 0x14

    .line 268
    .line 269
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getHangupReason()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 274
    .line 275
    .line 276
    :cond_13
    return-void
.end method
