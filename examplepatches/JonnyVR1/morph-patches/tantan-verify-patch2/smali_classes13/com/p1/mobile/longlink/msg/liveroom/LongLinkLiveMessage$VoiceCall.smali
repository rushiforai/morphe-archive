.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCallOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceCall"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCallOrBuilder;"
    }
.end annotation


# static fields
.field public static final ANCHORUSERID_FIELD_NUMBER:I = 0xe

.field public static final ANCHORUSERNAME_FIELD_NUMBER:I = 0xf

.field public static final ANCHORUSERPROFILE_FIELD_NUMBER:I = 0x10

.field public static final AWAYREASON_FIELD_NUMBER:I = 0x15

.field public static final BOSSMODEINFO_FIELD_NUMBER:I = 0x1b

.field public static final CALLEFFECT_FIELD_NUMBER:I = 0x1c

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

.field public static final FROMMANAGER_FIELD_NUMBER:I = 0x17

.field public static final HANGUPREASON_FIELD_NUMBER:I = 0x13

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final INTENDPOSITION_FIELD_NUMBER:I = 0x7

.field public static final INVITEID_FIELD_NUMBER:I = 0x11

.field public static final ISAWAY_FIELD_NUMBER:I = 0x12

.field public static final MANAGERUSERID_FIELD_NUMBER:I = 0x18

.field public static final MANAGERUSERNAME_FIELD_NUMBER:I = 0x19

.field public static final MANAGERUSERPROFILE_FIELD_NUMBER:I = 0x1a

.field public static final MUTEDBYANCHOR_FIELD_NUMBER:I = 0xa

.field public static final MUTEDBYUSER_FIELD_NUMBER:I = 0x9

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;",
            ">;"
        }
    .end annotation
.end field

.field public static final POSITION_FIELD_NUMBER:I = 0x8

.field public static final ROLE_FIELD_NUMBER:I = 0x14

.field public static final SOURCE_FIELD_NUMBER:I = 0x4

.field public static final STARTTIME_FIELD_NUMBER:I = 0x16

.field public static final STATE_FIELD_NUMBER:I = 0x3

.field public static final USERID_FIELD_NUMBER:I = 0xb

.field public static final USERNAMEGRADIENTCOLORS_FIELD_NUMBER:I = 0x1d

.field public static final USERNAME_FIELD_NUMBER:I = 0xc

.field public static final USERPROFILE_FIELD_NUMBER:I = 0xd

.field public static final USERRECVREWARDPOINT_FIELD_NUMBER:I = 0x6

.field public static final USERSENDREWARDPOINT_FIELD_NUMBER:I = 0x5

.field public static final VOICELIVEID_FIELD_NUMBER:I = 0x2


# instance fields
.field private anchorUserId_:Ljava/lang/String;

.field private anchorUserName_:Ljava/lang/String;

.field private anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

.field private awayReason_:I

.field private bitField0_:I

.field private bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

.field private callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

.field private fromManager_:Z

.field private hangupReason_:Ljava/lang/String;

.field private id_:Ljava/lang/String;

.field private intendPosition_:I

.field private inviteId_:Ljava/lang/String;

.field private isAway_:Z

.field private managerUserName_:Ljava/lang/String;

.field private managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

.field private managerUserid_:Ljava/lang/String;

.field private mutedByAnchor_:Z

.field private mutedByUser_:Z

.field private position_:I

.field private role_:Ljava/lang/String;

.field private source_:Ljava/lang/String;

.field private startTime_:J

.field private state_:Ljava/lang/String;

.field private userId_:Ljava/lang/String;

.field private userNameGradientColors_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private userName_:Ljava/lang/String;

.field private userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

.field private userRecvRewardPoint_:J

.field private userSendRewardPoint_:J

.field private voiceLiveId_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->voiceLiveId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->state_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->source_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userId_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userName_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserId_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserName_:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->inviteId_:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->hangupReason_:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->role_:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserid_:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserName_:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 37
    .line 38
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearUserName()V

    return-void
.end method

.method public static bridge synthetic A0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setUserNameGradientColors(ILjava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearUserNameGradientColors()V

    return-void
.end method

.method public static bridge synthetic B0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearUserProfile()V

    return-void
.end method

.method public static bridge synthetic C0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearUserRecvRewardPoint()V

    return-void
.end method

.method public static bridge synthetic D0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setUserRecvRewardPoint(J)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearUserSendRewardPoint()V

    return-void
.end method

.method public static bridge synthetic E0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setUserSendRewardPoint(J)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearVoiceLiveId()V

    return-void
.end method

.method public static bridge synthetic F0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setVoiceLiveId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mergeAnchorUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    return-void
.end method

.method public static bridge synthetic G0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setVoiceLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mergeBossModeInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;)V

    return-void
.end method

.method public static bridge synthetic H0()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    return-object v0
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mergeCallEffect(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mergeManagerUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mergeUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setAnchorUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setAnchorUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setAnchorUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setAnchorUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setAnchorUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)V

    return-void
.end method

.method public static bridge synthetic Q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setAnchorUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setAwayReason(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;)V

    return-void
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setAwayReasonValue(I)V

    return-void
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setBossModeInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo$Builder;)V

    return-void
.end method

.method public static bridge synthetic U(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setBossModeInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;)V

    return-void
.end method

.method public static bridge synthetic V(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setCallEffect(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig$Builder;)V

    return-void
.end method

.method public static bridge synthetic W(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setCallEffect(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;)V

    return-void
.end method

.method public static bridge synthetic X(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setFromManager(Z)V

    return-void
.end method

.method public static bridge synthetic Y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setHangupReason(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic Z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setHangupReasonBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->addAllUserNameGradientColors(Ljava/lang/Iterable;)V

    return-void
.end method

.method public static bridge synthetic a0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setId(Ljava/lang/String;)V

    return-void
.end method

.method private addAllUserNameGradientColors(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->ensureUserNameGradientColorsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addUserNameGradientColors(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->ensureUserNameGradientColorsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private addUserNameGradientColorsBytes(Lcom/google/protobuf/ByteString;)V
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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->ensureUserNameGradientColorsIsMutable()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->addUserNameGradientColors(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic b0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->addUserNameGradientColorsBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic c0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setIntendPosition(I)V

    return-void
.end method

.method private clearAnchorUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getAnchorUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAnchorUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getAnchorUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAnchorUserProfile()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 3
    .line 4
    return-void
.end method

.method private clearAwayReason()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->awayReason_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearBossModeInfo()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 3
    .line 4
    return-void
.end method

.method private clearCallEffect()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 3
    .line 4
    return-void
.end method

.method private clearFromManager()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->fromManager_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearHangupReason()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getHangupReason()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->hangupReason_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIntendPosition()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->intendPosition_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearInviteId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getInviteId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->inviteId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIsAway()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->isAway_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearManagerUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getManagerUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearManagerUserProfile()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 3
    .line 4
    return-void
.end method

.method private clearManagerUserid()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getManagerUserid()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserid_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearMutedByAnchor()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByAnchor_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearMutedByUser()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByUser_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearPosition()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->position_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearRole()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getRole()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->role_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSource()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getSource()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->source_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearStartTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->startTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearState()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getState()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->state_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserNameGradientColors()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearUserProfile()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userRecvRewardPoint_:J

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
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userSendRewardPoint_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearVoiceLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getVoiceLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->voiceLiveId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearAnchorUserId()V

    return-void
.end method

.method public static bridge synthetic d0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setInviteId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearAnchorUserName()V

    return-void
.end method

.method public static bridge synthetic e0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setInviteIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private ensureUserNameGradientColorsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/l$h;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearAnchorUserProfile()V

    return-void
.end method

.method public static bridge synthetic f0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setIsAway(Z)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearAwayReason()V

    return-void
.end method

.method public static bridge synthetic g0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setManagerUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearBossModeInfo()V

    return-void
.end method

.method public static bridge synthetic h0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setManagerUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearCallEffect()V

    return-void
.end method

.method public static bridge synthetic i0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setManagerUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearFromManager()V

    return-void
.end method

.method public static bridge synthetic j0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setManagerUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearHangupReason()V

    return-void
.end method

.method public static bridge synthetic k0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setManagerUserid(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearId()V

    return-void
.end method

.method public static bridge synthetic l0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setManagerUseridBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearIntendPosition()V

    return-void
.end method

.method public static bridge synthetic m0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setMutedByAnchor(Z)V

    return-void
.end method

.method private mergeAnchorUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 33
    .line 34
    return-void
.end method

.method private mergeBossModeInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;->newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 33
    .line 34
    return-void
.end method

.method private mergeCallEffect(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 33
    .line 34
    return-void
.end method

.method private mergeManagerUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 33
    .line 34
    return-void
.end method

.method private mergeUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearInviteId()V

    return-void
.end method

.method public static bridge synthetic n0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setMutedByUser(Z)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearIsAway()V

    return-void
.end method

.method public static bridge synthetic o0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setPosition(I)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearManagerUserName()V

    return-void
.end method

.method public static bridge synthetic p0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setRole(Ljava/lang/String;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearManagerUserProfile()V

    return-void
.end method

.method public static bridge synthetic q0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setRoleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearManagerUserid()V

    return-void
.end method

.method public static bridge synthetic r0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setSource(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearMutedByAnchor()V

    return-void
.end method

.method public static bridge synthetic s0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setSourceBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private setAnchorUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserName_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserName_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 8
    .line 9
    return-void
.end method

.method private setAnchorUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    return-void
.end method

.method private setAwayReason(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->awayReason_:I

    .line 9
    .line 10
    return-void
.end method

.method private setAwayReasonValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->awayReason_:I

    .line 2
    .line 3
    return-void
.end method

.method private setBossModeInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 8
    .line 9
    return-void
.end method

.method private setBossModeInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    return-void
.end method

.method private setCallEffect(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setCallEffect(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    return-void
.end method

.method private setFromManager(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->fromManager_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setHangupReason(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->hangupReason_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->hangupReason_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIntendPosition(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->intendPosition_:I

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->inviteId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->inviteId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIsAway(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->isAway_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setManagerUserName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setManagerUserNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setManagerUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 8
    .line 9
    return-void
.end method

.method private setManagerUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    return-void
.end method

.method private setManagerUserid(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserid_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setManagerUseridBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserid_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setMutedByAnchor(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByAnchor_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setMutedByUser(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByUser_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setPosition(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->position_:I

    .line 2
    .line 3
    return-void
.end method

.method private setRole(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->role_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setRoleBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->role_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSource(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->source_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->source_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setStartTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->startTime_:J

    .line 2
    .line 3
    return-void
.end method

.method private setState(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->state_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->state_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userName_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserNameGradientColors(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->ensureUserNameGradientColorsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 8
    .line 9
    return-void
.end method

.method private setUserProfile(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    return-void
.end method

.method private setUserRecvRewardPoint(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userRecvRewardPoint_:J

    .line 2
    .line 3
    return-void
.end method

.method private setUserSendRewardPoint(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userSendRewardPoint_:J

    .line 2
    .line 3
    return-void
.end method

.method private setVoiceLiveId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->voiceLiveId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setVoiceLiveIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->voiceLiveId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearMutedByUser()V

    return-void
.end method

.method public static bridge synthetic t0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setStartTime(J)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearPosition()V

    return-void
.end method

.method public static bridge synthetic u0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setState(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearRole()V

    return-void
.end method

.method public static bridge synthetic v0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setStateBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearSource()V

    return-void
.end method

.method public static bridge synthetic w0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearStartTime()V

    return-void
.end method

.method public static bridge synthetic x0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearState()V

    return-void
.end method

.method public static bridge synthetic y0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic z0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->setUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v1, 0x0

    const/4 v0, 0x0

    const/4 v2, 0x1

    packed-switch p1, :pswitch_data_0

    .line 2
    invoke-static {}, Ll/l710;->a()V

    return-object v1

    .line 3
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->PARSER:Ll/ng60;

    if-nez p0, :cond_1

    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    monitor-enter p0

    .line 4
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->PARSER:Ll/ng60;

    if-nez p1, :cond_0

    .line 5
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->PARSER:Ll/ng60;

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    goto :goto_1

    .line 6
    :cond_0
    :goto_0
    monitor-exit p0

    goto :goto_2

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 7
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->PARSER:Ll/ng60;

    return-object p0

    .line 8
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 9
    check-cast p3, Lcom/google/protobuf/h;

    :cond_2
    :goto_3
    if-nez v0, :cond_9

    .line 10
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    move-result p1

    sparse-switch p1, :sswitch_data_0

    .line 11
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    move-result p1

    if-nez p1, :cond_2

    :sswitch_0
    move v0, v2

    goto :goto_3

    :catch_0
    move-exception v0

    move-object p1, v0

    goto/16 :goto_9

    :catch_1
    move-exception v0

    move-object p1, v0

    goto/16 :goto_a

    .line 12
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 13
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    invoke-interface {v3}, Lcom/google/protobuf/l$h;->q()Z

    move-result v3

    if-nez v3, :cond_3

    .line 14
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 15
    invoke-static {v3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    move-result-object v3

    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 16
    :cond_3
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 17
    :sswitch_2
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    if-eqz p1, :cond_4

    .line 18
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig$Builder;

    goto :goto_4

    :cond_4
    move-object p1, v1

    .line 19
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;->parser()Ll/ng60;

    move-result-object v3

    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    if-eqz p1, :cond_2

    .line 20
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 21
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    goto :goto_3

    .line 22
    :sswitch_3
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    if-eqz p1, :cond_5

    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo$Builder;

    goto :goto_5

    :cond_5
    move-object p1, v1

    .line 24
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;->parser()Ll/ng60;

    move-result-object v3

    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    if-eqz p1, :cond_2

    .line 25
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 26
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    goto :goto_3

    .line 27
    :sswitch_4
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    if-eqz p1, :cond_6

    .line 28
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;

    goto :goto_6

    :cond_6
    move-object p1, v1

    .line 29
    :goto_6
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->parser()Ll/ng60;

    move-result-object v3

    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    if-eqz p1, :cond_2

    .line 30
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 31
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    goto/16 :goto_3

    .line 32
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserName_:Ljava/lang/String;

    goto/16 :goto_3

    .line 34
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserid_:Ljava/lang/String;

    goto/16 :goto_3

    .line 36
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->fromManager_:Z

    goto/16 :goto_3

    .line 37
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->startTime_:J

    goto/16 :goto_3

    .line 38
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    move-result p1

    .line 39
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->awayReason_:I

    goto/16 :goto_3

    .line 40
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->role_:Ljava/lang/String;

    goto/16 :goto_3

    .line 42
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 43
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->hangupReason_:Ljava/lang/String;

    goto/16 :goto_3

    .line 44
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->isAway_:Z

    goto/16 :goto_3

    .line 45
    :sswitch_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 46
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->inviteId_:Ljava/lang/String;

    goto/16 :goto_3

    .line 47
    :sswitch_e
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    if-eqz p1, :cond_7

    .line 48
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;

    goto :goto_7

    :cond_7
    move-object p1, v1

    .line 49
    :goto_7
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->parser()Ll/ng60;

    move-result-object v3

    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    if-eqz p1, :cond_2

    .line 50
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 51
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    goto/16 :goto_3

    .line 52
    :sswitch_f
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 53
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserName_:Ljava/lang/String;

    goto/16 :goto_3

    .line 54
    :sswitch_10
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 55
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserId_:Ljava/lang/String;

    goto/16 :goto_3

    .line 56
    :sswitch_11
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    if-eqz p1, :cond_8

    .line 57
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;

    goto :goto_8

    :cond_8
    move-object p1, v1

    .line 58
    :goto_8
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->parser()Ll/ng60;

    move-result-object v3

    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    if-eqz p1, :cond_2

    .line 59
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 60
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    goto/16 :goto_3

    .line 61
    :sswitch_12
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 62
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userName_:Ljava/lang/String;

    goto/16 :goto_3

    .line 63
    :sswitch_13
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 64
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userId_:Ljava/lang/String;

    goto/16 :goto_3

    .line 65
    :sswitch_14
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByAnchor_:Z

    goto/16 :goto_3

    .line 66
    :sswitch_15
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByUser_:Z

    goto/16 :goto_3

    .line 67
    :sswitch_16
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->position_:I

    goto/16 :goto_3

    .line 68
    :sswitch_17
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->intendPosition_:I

    goto/16 :goto_3

    .line 69
    :sswitch_18
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userRecvRewardPoint_:J

    goto/16 :goto_3

    .line 70
    :sswitch_19
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userSendRewardPoint_:J

    goto/16 :goto_3

    .line 71
    :sswitch_1a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 72
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->source_:Ljava/lang/String;

    goto/16 :goto_3

    .line 73
    :sswitch_1b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 74
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->state_:Ljava/lang/String;

    goto/16 :goto_3

    .line 75
    :sswitch_1c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 76
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->voiceLiveId_:Ljava/lang/String;

    goto/16 :goto_3

    .line 77
    :sswitch_1d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 78
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->id_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto/16 :goto_3

    :catchall_1
    move-exception v0

    move-object p0, v0

    .line 79
    throw p0

    .line 80
    :goto_9
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 81
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    return-object v1

    .line 82
    :goto_a
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    return-object v1

    .line 83
    :cond_9
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    return-object p0

    .line 84
    :pswitch_3
    move-object v3, p2

    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 85
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    .line 86
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->id_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->id_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->id_:Ljava/lang/String;

    .line 87
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->id_:Ljava/lang/String;

    .line 88
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->id_:Ljava/lang/String;

    .line 89
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->voiceLiveId_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->voiceLiveId_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->voiceLiveId_:Ljava/lang/String;

    .line 90
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->voiceLiveId_:Ljava/lang/String;

    .line 91
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->voiceLiveId_:Ljava/lang/String;

    .line 92
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->state_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->state_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->state_:Ljava/lang/String;

    .line 93
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->state_:Ljava/lang/String;

    .line 94
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->state_:Ljava/lang/String;

    .line 95
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->source_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->source_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->source_:Ljava/lang/String;

    .line 96
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->source_:Ljava/lang/String;

    .line 97
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->source_:Ljava/lang/String;

    .line 98
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userSendRewardPoint_:J

    const-wide/16 p1, 0x0

    cmp-long v1, v5, p1

    if-eqz v1, :cond_a

    move v4, v2

    goto :goto_b

    :cond_a
    move v4, v0

    :goto_b
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userSendRewardPoint_:J

    cmp-long v1, v8, p1

    if-eqz v1, :cond_b

    move v7, v2

    goto :goto_c

    :cond_b
    move v7, v0

    :goto_c
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userSendRewardPoint_:J

    .line 99
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userRecvRewardPoint_:J

    cmp-long v1, v5, p1

    if-eqz v1, :cond_c

    move v4, v2

    goto :goto_d

    :cond_c
    move v4, v0

    :goto_d
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userRecvRewardPoint_:J

    cmp-long v1, v8, p1

    if-eqz v1, :cond_d

    move v7, v2

    goto :goto_e

    :cond_d
    move v7, v0

    :goto_e
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userRecvRewardPoint_:J

    .line 100
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->intendPosition_:I

    if-eqz v1, :cond_e

    move v4, v2

    goto :goto_f

    :cond_e
    move v4, v0

    :goto_f
    iget v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->intendPosition_:I

    if-eqz v5, :cond_f

    move v6, v2

    goto :goto_10

    :cond_f
    move v6, v0

    :goto_10
    invoke-interface {v3, v4, v1, v6, v5}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    move-result v1

    iput v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->intendPosition_:I

    .line 101
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->position_:I

    if-eqz v1, :cond_10

    move v4, v2

    goto :goto_11

    :cond_10
    move v4, v0

    :goto_11
    iget v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->position_:I

    if-eqz v5, :cond_11

    move v6, v2

    goto :goto_12

    :cond_11
    move v6, v0

    :goto_12
    invoke-interface {v3, v4, v1, v6, v5}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    move-result v1

    iput v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->position_:I

    .line 102
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByUser_:Z

    iget-boolean v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByUser_:Z

    invoke-interface {v3, v1, v1, v4, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByUser_:Z

    .line 103
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByAnchor_:Z

    iget-boolean v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByAnchor_:Z

    invoke-interface {v3, v1, v1, v4, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByAnchor_:Z

    .line 104
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userId_:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userId_:Ljava/lang/String;

    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userId_:Ljava/lang/String;

    .line 105
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    xor-int/2addr v5, v2

    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userId_:Ljava/lang/String;

    .line 106
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userId_:Ljava/lang/String;

    .line 107
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userName_:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userName_:Ljava/lang/String;

    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userName_:Ljava/lang/String;

    .line 108
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    xor-int/2addr v5, v2

    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userName_:Ljava/lang/String;

    .line 109
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userName_:Ljava/lang/String;

    .line 110
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    invoke-interface {v3, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 111
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserId_:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserId_:Ljava/lang/String;

    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserId_:Ljava/lang/String;

    .line 112
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    xor-int/2addr v5, v2

    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserId_:Ljava/lang/String;

    .line 113
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserId_:Ljava/lang/String;

    .line 114
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserName_:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserName_:Ljava/lang/String;

    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserName_:Ljava/lang/String;

    .line 115
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    xor-int/2addr v5, v2

    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserName_:Ljava/lang/String;

    .line 116
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserName_:Ljava/lang/String;

    .line 117
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    invoke-interface {v3, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 118
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->inviteId_:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->inviteId_:Ljava/lang/String;

    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->inviteId_:Ljava/lang/String;

    .line 119
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    xor-int/2addr v5, v2

    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->inviteId_:Ljava/lang/String;

    .line 120
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->inviteId_:Ljava/lang/String;

    .line 121
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->isAway_:Z

    iget-boolean v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->isAway_:Z

    invoke-interface {v3, v1, v1, v4, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->isAway_:Z

    .line 122
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->hangupReason_:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->hangupReason_:Ljava/lang/String;

    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->hangupReason_:Ljava/lang/String;

    .line 123
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    xor-int/2addr v5, v2

    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->hangupReason_:Ljava/lang/String;

    .line 124
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->hangupReason_:Ljava/lang/String;

    .line 125
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->role_:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->role_:Ljava/lang/String;

    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->role_:Ljava/lang/String;

    .line 126
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    xor-int/2addr v5, v2

    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->role_:Ljava/lang/String;

    .line 127
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->role_:Ljava/lang/String;

    .line 128
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->awayReason_:I

    if-eqz v1, :cond_12

    move v4, v2

    goto :goto_13

    :cond_12
    move v4, v0

    :goto_13
    iget v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->awayReason_:I

    if-eqz v5, :cond_13

    move v6, v2

    goto :goto_14

    :cond_13
    move v6, v0

    :goto_14
    invoke-interface {v3, v4, v1, v6, v5}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    move-result v1

    iput v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->awayReason_:I

    .line 129
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->startTime_:J

    cmp-long v1, v5, p1

    if-eqz v1, :cond_14

    move v4, v2

    goto :goto_15

    :cond_14
    move v4, v0

    :goto_15
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->startTime_:J

    cmp-long p1, v8, p1

    if-eqz p1, :cond_15

    move v7, v2

    goto :goto_16

    :cond_15
    move v7, v0

    :goto_16
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->startTime_:J

    .line 130
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->fromManager_:Z

    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->fromManager_:Z

    invoke-interface {v3, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->fromManager_:Z

    .line 131
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserid_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserid_:Ljava/lang/String;

    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserid_:Ljava/lang/String;

    .line 132
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    xor-int/2addr v0, v2

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserid_:Ljava/lang/String;

    .line 133
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserid_:Ljava/lang/String;

    .line 134
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserName_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserName_:Ljava/lang/String;

    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserName_:Ljava/lang/String;

    .line 135
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    xor-int/2addr v0, v2

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserName_:Ljava/lang/String;

    .line 136
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserName_:Ljava/lang/String;

    .line 137
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 138
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 139
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 140
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 141
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    if-ne v3, p1, :cond_16

    .line 142
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bitField0_:I

    iget p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bitField0_:I

    or-int/2addr p1, p2

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bitField0_:I

    :cond_16
    return-object p0

    .line 143
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall$Builder;

    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall$Builder;-><init>(Ll/c3w;)V

    return-object p0

    .line 144
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    return-object v1

    .line 145
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    return-object p0

    .line 146
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;

    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;-><init>()V

    return-object p0

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

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_1d
        0x12 -> :sswitch_1c
        0x1a -> :sswitch_1b
        0x22 -> :sswitch_1a
        0x28 -> :sswitch_19
        0x30 -> :sswitch_18
        0x38 -> :sswitch_17
        0x40 -> :sswitch_16
        0x48 -> :sswitch_15
        0x50 -> :sswitch_14
        0x5a -> :sswitch_13
        0x62 -> :sswitch_12
        0x6a -> :sswitch_11
        0x72 -> :sswitch_10
        0x7a -> :sswitch_f
        0x82 -> :sswitch_e
        0x8a -> :sswitch_d
        0x90 -> :sswitch_c
        0x9a -> :sswitch_b
        0xa2 -> :sswitch_a
        0xa8 -> :sswitch_9
        0xb0 -> :sswitch_8
        0xb8 -> :sswitch_7
        0xc2 -> :sswitch_6
        0xca -> :sswitch_5
        0xd2 -> :sswitch_4
        0xda -> :sswitch_3
        0xe2 -> :sswitch_2
        0xea -> :sswitch_1
    .end sparse-switch
.end method

.method public getAnchorUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserId_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserName_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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

.method public getAwayReason()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->awayReason_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getAwayReasonValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->awayReason_:I

    .line 2
    .line 3
    return p0
.end method

.method public getBossModeInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getCallEffect()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getFromManager()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->fromManager_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getHangupReason()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->hangupReason_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHangupReasonBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->hangupReason_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->id_:Ljava/lang/String;

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
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->intendPosition_:I

    .line 2
    .line 3
    return p0
.end method

.method public getInviteId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->inviteId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInviteIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->inviteId_:Ljava/lang/String;

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
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->isAway_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getManagerUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getManagerUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserName_:Ljava/lang/String;

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

.method public getManagerUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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

.method public getManagerUserid()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserid_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getManagerUseridBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserid_:Ljava/lang/String;

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
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByAnchor_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getMutedByUser()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByUser_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getPosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->position_:I

    .line 2
    .line 3
    return p0
.end method

.method public getRole()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->role_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->role_:Ljava/lang/String;

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

.method public getSerializedSize()I
    .locals 8

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->id_:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-static {v2, v0}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v0, v1

    .line 27
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->voiceLiveId_:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    const/4 v3, 0x2

    .line 34
    if-nez v2, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getVoiceLiveId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    add-int/2addr v0, v2

    .line 45
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->state_:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-nez v2, :cond_3

    .line 52
    .line 53
    const/4 v2, 0x3

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getState()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    add-int/2addr v0, v2

    .line 63
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->source_:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-nez v2, :cond_4

    .line 70
    .line 71
    const/4 v2, 0x4

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getSource()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    add-int/2addr v0, v2

    .line 81
    :cond_4
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userSendRewardPoint_:J

    .line 82
    .line 83
    const-wide/16 v6, 0x0

    .line 84
    .line 85
    cmp-long v2, v4, v6

    .line 86
    .line 87
    if-eqz v2, :cond_5

    .line 88
    .line 89
    const/4 v2, 0x5

    .line 90
    invoke-static {v2, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    add-int/2addr v0, v2

    .line 95
    :cond_5
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userRecvRewardPoint_:J

    .line 96
    .line 97
    cmp-long v2, v4, v6

    .line 98
    .line 99
    if-eqz v2, :cond_6

    .line 100
    .line 101
    const/4 v2, 0x6

    .line 102
    invoke-static {v2, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    add-int/2addr v0, v2

    .line 107
    :cond_6
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->intendPosition_:I

    .line 108
    .line 109
    if-eqz v2, :cond_7

    .line 110
    .line 111
    const/4 v4, 0x7

    .line 112
    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    add-int/2addr v0, v2

    .line 117
    :cond_7
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->position_:I

    .line 118
    .line 119
    if-eqz v2, :cond_8

    .line 120
    .line 121
    const/16 v4, 0x8

    .line 122
    .line 123
    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    add-int/2addr v0, v2

    .line 128
    :cond_8
    iget-boolean v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByUser_:Z

    .line 129
    .line 130
    if-eqz v2, :cond_9

    .line 131
    .line 132
    const/16 v4, 0x9

    .line 133
    .line 134
    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    add-int/2addr v0, v2

    .line 139
    :cond_9
    iget-boolean v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByAnchor_:Z

    .line 140
    .line 141
    if-eqz v2, :cond_a

    .line 142
    .line 143
    const/16 v4, 0xa

    .line 144
    .line 145
    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    add-int/2addr v0, v2

    .line 150
    :cond_a
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userId_:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    if-nez v2, :cond_b

    .line 157
    .line 158
    const/16 v2, 0xb

    .line 159
    .line 160
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserId()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    add-int/2addr v0, v2

    .line 169
    :cond_b
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userName_:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    if-nez v2, :cond_c

    .line 176
    .line 177
    const/16 v2, 0xc

    .line 178
    .line 179
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserName()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v4

    .line 183
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    add-int/2addr v0, v2

    .line 188
    :cond_c
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 189
    .line 190
    if-eqz v2, :cond_d

    .line 191
    .line 192
    const/16 v2, 0xd

    .line 193
    .line 194
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 195
    .line 196
    .line 197
    move-result-object v4

    .line 198
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 199
    .line 200
    .line 201
    move-result v2

    .line 202
    add-int/2addr v0, v2

    .line 203
    :cond_d
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserId_:Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    if-nez v2, :cond_e

    .line 210
    .line 211
    const/16 v2, 0xe

    .line 212
    .line 213
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getAnchorUserId()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v4

    .line 217
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 218
    .line 219
    .line 220
    move-result v2

    .line 221
    add-int/2addr v0, v2

    .line 222
    :cond_e
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserName_:Ljava/lang/String;

    .line 223
    .line 224
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    if-nez v2, :cond_f

    .line 229
    .line 230
    const/16 v2, 0xf

    .line 231
    .line 232
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getAnchorUserName()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 237
    .line 238
    .line 239
    move-result v2

    .line 240
    add-int/2addr v0, v2

    .line 241
    :cond_f
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 242
    .line 243
    if-eqz v2, :cond_10

    .line 244
    .line 245
    const/16 v2, 0x10

    .line 246
    .line 247
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getAnchorUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 248
    .line 249
    .line 250
    move-result-object v4

    .line 251
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    add-int/2addr v0, v2

    .line 256
    :cond_10
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->inviteId_:Ljava/lang/String;

    .line 257
    .line 258
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 259
    .line 260
    .line 261
    move-result v2

    .line 262
    if-nez v2, :cond_11

    .line 263
    .line 264
    const/16 v2, 0x11

    .line 265
    .line 266
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getInviteId()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v4

    .line 270
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 271
    .line 272
    .line 273
    move-result v2

    .line 274
    add-int/2addr v0, v2

    .line 275
    :cond_11
    iget-boolean v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->isAway_:Z

    .line 276
    .line 277
    if-eqz v2, :cond_12

    .line 278
    .line 279
    const/16 v4, 0x12

    .line 280
    .line 281
    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 282
    .line 283
    .line 284
    move-result v2

    .line 285
    add-int/2addr v0, v2

    .line 286
    :cond_12
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->hangupReason_:Ljava/lang/String;

    .line 287
    .line 288
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 289
    .line 290
    .line 291
    move-result v2

    .line 292
    if-nez v2, :cond_13

    .line 293
    .line 294
    const/16 v2, 0x13

    .line 295
    .line 296
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getHangupReason()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v4

    .line 300
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 301
    .line 302
    .line 303
    move-result v2

    .line 304
    add-int/2addr v0, v2

    .line 305
    :cond_13
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->role_:Ljava/lang/String;

    .line 306
    .line 307
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 308
    .line 309
    .line 310
    move-result v2

    .line 311
    if-nez v2, :cond_14

    .line 312
    .line 313
    const/16 v2, 0x14

    .line 314
    .line 315
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getRole()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v4

    .line 319
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 320
    .line 321
    .line 322
    move-result v2

    .line 323
    add-int/2addr v0, v2

    .line 324
    :cond_14
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->awayReason_:I

    .line 325
    .line 326
    sget-object v4, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;->nil:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;

    .line 327
    .line 328
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;->getNumber()I

    .line 329
    .line 330
    .line 331
    move-result v4

    .line 332
    if-eq v2, v4, :cond_15

    .line 333
    .line 334
    const/16 v2, 0x15

    .line 335
    .line 336
    iget v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->awayReason_:I

    .line 337
    .line 338
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 339
    .line 340
    .line 341
    move-result v2

    .line 342
    add-int/2addr v0, v2

    .line 343
    :cond_15
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->startTime_:J

    .line 344
    .line 345
    cmp-long v2, v4, v6

    .line 346
    .line 347
    if-eqz v2, :cond_16

    .line 348
    .line 349
    const/16 v2, 0x16

    .line 350
    .line 351
    invoke-static {v2, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 352
    .line 353
    .line 354
    move-result v2

    .line 355
    add-int/2addr v0, v2

    .line 356
    :cond_16
    iget-boolean v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->fromManager_:Z

    .line 357
    .line 358
    if-eqz v2, :cond_17

    .line 359
    .line 360
    const/16 v4, 0x17

    .line 361
    .line 362
    invoke-static {v4, v2}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 363
    .line 364
    .line 365
    move-result v2

    .line 366
    add-int/2addr v0, v2

    .line 367
    :cond_17
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserid_:Ljava/lang/String;

    .line 368
    .line 369
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 370
    .line 371
    .line 372
    move-result v2

    .line 373
    if-nez v2, :cond_18

    .line 374
    .line 375
    const/16 v2, 0x18

    .line 376
    .line 377
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getManagerUserid()Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object v4

    .line 381
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 382
    .line 383
    .line 384
    move-result v2

    .line 385
    add-int/2addr v0, v2

    .line 386
    :cond_18
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserName_:Ljava/lang/String;

    .line 387
    .line 388
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 389
    .line 390
    .line 391
    move-result v2

    .line 392
    if-nez v2, :cond_19

    .line 393
    .line 394
    const/16 v2, 0x19

    .line 395
    .line 396
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getManagerUserName()Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    move-result-object v4

    .line 400
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 401
    .line 402
    .line 403
    move-result v2

    .line 404
    add-int/2addr v0, v2

    .line 405
    :cond_19
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 406
    .line 407
    if-eqz v2, :cond_1a

    .line 408
    .line 409
    const/16 v2, 0x1a

    .line 410
    .line 411
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getManagerUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 412
    .line 413
    .line 414
    move-result-object v4

    .line 415
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 416
    .line 417
    .line 418
    move-result v2

    .line 419
    add-int/2addr v0, v2

    .line 420
    :cond_1a
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 421
    .line 422
    if-eqz v2, :cond_1b

    .line 423
    .line 424
    const/16 v2, 0x1b

    .line 425
    .line 426
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getBossModeInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 427
    .line 428
    .line 429
    move-result-object v4

    .line 430
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 431
    .line 432
    .line 433
    move-result v2

    .line 434
    add-int/2addr v0, v2

    .line 435
    :cond_1b
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 436
    .line 437
    if-eqz v2, :cond_1c

    .line 438
    .line 439
    const/16 v2, 0x1c

    .line 440
    .line 441
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getCallEffect()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 442
    .line 443
    .line 444
    move-result-object v4

    .line 445
    invoke-static {v2, v4}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 446
    .line 447
    .line 448
    move-result v2

    .line 449
    add-int/2addr v0, v2

    .line 450
    :cond_1c
    move v2, v1

    .line 451
    :goto_1
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 452
    .line 453
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 454
    .line 455
    .line 456
    move-result v4

    .line 457
    if-ge v1, v4, :cond_1d

    .line 458
    .line 459
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 460
    .line 461
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 462
    .line 463
    .line 464
    move-result-object v4

    .line 465
    check-cast v4, Ljava/lang/String;

    .line 466
    .line 467
    invoke-static {v4}, Lcom/google/protobuf/CodedOutputStream;->L(Ljava/lang/String;)I

    .line 468
    .line 469
    .line 470
    move-result v4

    .line 471
    add-int/2addr v2, v4

    .line 472
    add-int/lit8 v1, v1, 0x1

    .line 473
    .line 474
    goto :goto_1

    .line 475
    :cond_1d
    add-int/2addr v0, v2

    .line 476
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserNameGradientColorsList()Ljava/util/List;

    .line 477
    .line 478
    .line 479
    move-result-object v1

    .line 480
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 481
    .line 482
    .line 483
    move-result v1

    .line 484
    mul-int/2addr v1, v3

    .line 485
    add-int/2addr v0, v1

    .line 486
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 487
    .line 488
    return v0
.end method

.method public getSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->source_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSourceBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->source_:Ljava/lang/String;

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

.method public getStartTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->startTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getState()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->state_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStateBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->state_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userId_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userName_:Ljava/lang/String;

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

.method public getUserNameGradientColors(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public getUserNameGradientColorsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getUserNameGradientColorsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getUserNameGradientColorsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userRecvRewardPoint_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getUserSendRewardPoint()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userSendRewardPoint_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getVoiceLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->voiceLiveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVoiceLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->voiceLiveId_:Ljava/lang/String;

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

.method public hasAnchorUserProfile()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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

.method public hasBossModeInfo()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

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

.method public hasCallEffect()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

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

.method public hasManagerUserProfile()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->voiceLiveId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getVoiceLiveId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->state_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getState()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->source_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getSource()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userSendRewardPoint_:J

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userRecvRewardPoint_:J

    .line 78
    .line 79
    cmp-long v4, v0, v2

    .line 80
    .line 81
    if-eqz v4, :cond_5

    .line 82
    .line 83
    const/4 v4, 0x6

    .line 84
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 85
    .line 86
    .line 87
    :cond_5
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->intendPosition_:I

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->position_:I

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
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByUser_:Z

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
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->mutedByAnchor_:Z

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserName()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 157
    .line 158
    if-eqz v0, :cond_c

    .line 159
    .line 160
    const/16 v0, 0xd

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getAnchorUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getAnchorUserName()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->anchorUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 204
    .line 205
    if-eqz v0, :cond_f

    .line 206
    .line 207
    const/16 v0, 0x10

    .line 208
    .line 209
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getAnchorUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->inviteId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getInviteId()Ljava/lang/String;

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
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->isAway_:Z

    .line 234
    .line 235
    if-eqz v0, :cond_11

    .line 236
    .line 237
    const/16 v1, 0x12

    .line 238
    .line 239
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 240
    .line 241
    .line 242
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->hangupReason_:Ljava/lang/String;

    .line 243
    .line 244
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-nez v0, :cond_12

    .line 249
    .line 250
    const/16 v0, 0x13

    .line 251
    .line 252
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getHangupReason()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 257
    .line 258
    .line 259
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->role_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getRole()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 274
    .line 275
    .line 276
    :cond_13
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->awayReason_:I

    .line 277
    .line 278
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;->nil:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;

    .line 279
    .line 280
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;->getNumber()I

    .line 281
    .line 282
    .line 283
    move-result v1

    .line 284
    if-eq v0, v1, :cond_14

    .line 285
    .line 286
    const/16 v0, 0x15

    .line 287
    .line 288
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->awayReason_:I

    .line 289
    .line 290
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 291
    .line 292
    .line 293
    :cond_14
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->startTime_:J

    .line 294
    .line 295
    cmp-long v2, v0, v2

    .line 296
    .line 297
    if-eqz v2, :cond_15

    .line 298
    .line 299
    const/16 v2, 0x16

    .line 300
    .line 301
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 302
    .line 303
    .line 304
    :cond_15
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->fromManager_:Z

    .line 305
    .line 306
    if-eqz v0, :cond_16

    .line 307
    .line 308
    const/16 v1, 0x17

    .line 309
    .line 310
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 311
    .line 312
    .line 313
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserid_:Ljava/lang/String;

    .line 314
    .line 315
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 316
    .line 317
    .line 318
    move-result v0

    .line 319
    if-nez v0, :cond_17

    .line 320
    .line 321
    const/16 v0, 0x18

    .line 322
    .line 323
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getManagerUserid()Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 328
    .line 329
    .line 330
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserName_:Ljava/lang/String;

    .line 331
    .line 332
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 333
    .line 334
    .line 335
    move-result v0

    .line 336
    if-nez v0, :cond_18

    .line 337
    .line 338
    const/16 v0, 0x19

    .line 339
    .line 340
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getManagerUserName()Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v1

    .line 344
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 345
    .line 346
    .line 347
    :cond_18
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->managerUserProfile_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 348
    .line 349
    if-eqz v0, :cond_19

    .line 350
    .line 351
    const/16 v0, 0x1a

    .line 352
    .line 353
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getManagerUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 358
    .line 359
    .line 360
    :cond_19
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->bossModeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 361
    .line 362
    if-eqz v0, :cond_1a

    .line 363
    .line 364
    const/16 v0, 0x1b

    .line 365
    .line 366
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getBossModeInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 371
    .line 372
    .line 373
    :cond_1a
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->callEffect_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 374
    .line 375
    if-eqz v0, :cond_1b

    .line 376
    .line 377
    const/16 v0, 0x1c

    .line 378
    .line 379
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getCallEffect()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 380
    .line 381
    .line 382
    move-result-object v1

    .line 383
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 384
    .line 385
    .line 386
    :cond_1b
    const/4 v0, 0x0

    .line 387
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 388
    .line 389
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 390
    .line 391
    .line 392
    move-result v1

    .line 393
    if-ge v0, v1, :cond_1c

    .line 394
    .line 395
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 396
    .line 397
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 398
    .line 399
    .line 400
    move-result-object v1

    .line 401
    check-cast v1, Ljava/lang/String;

    .line 402
    .line 403
    const/16 v2, 0x1d

    .line 404
    .line 405
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 406
    .line 407
    .line 408
    add-int/lit8 v0, v0, 0x1

    .line 409
    .line 410
    goto :goto_0

    .line 411
    :cond_1c
    return-void
.end method
