.class public final Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceCpBindMessage"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessageOrBuilder;"
    }
.end annotation


# static fields
.field public static final ACTION_FIELD_NUMBER:I = 0xe

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

.field public static final HOUSEBACKGROUND_FIELD_NUMBER:I = 0x7

.field public static final HOUSEID_FIELD_NUMBER:I = 0x3

.field public static final HOUSEIMAGE_FIELD_NUMBER:I = 0x6

.field public static final HOUSENAME_FIELD_NUMBER:I = 0x4

.field public static final HOUSERANK_FIELD_NUMBER:I = 0x5

.field public static final LIVEID_FIELD_NUMBER:I = 0x2

.field public static final OTHERUSERAVATAR_FIELD_NUMBER:I = 0xd

.field public static final OTHERUSERID_FIELD_NUMBER:I = 0xb

.field public static final OTHERUSERNAME_FIELD_NUMBER:I = 0xc

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static final ROOMID_FIELD_NUMBER:I = 0x1

.field public static final USERAVATAR_FIELD_NUMBER:I = 0xa

.field public static final USERID_FIELD_NUMBER:I = 0x8

.field public static final USERNAME_FIELD_NUMBER:I = 0x9


# instance fields
.field private action_:I

.field private houseBackground_:Ljava/lang/String;

.field private houseId_:Ljava/lang/String;

.field private houseImage_:Ljava/lang/String;

.field private houseName_:Ljava/lang/String;

.field private houseRank_:I

.field private liveId_:Ljava/lang/String;

.field private otherUserAvatar_:Ljava/lang/String;

.field private otherUserId_:Ljava/lang/String;

.field private otherUserName_:Ljava/lang/String;

.field private roomId_:Ljava/lang/String;

.field private userAvatar_:Ljava/lang/String;

.field private userId_:Ljava/lang/String;

.field private userName_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->roomId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->liveId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseId_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseName_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseImage_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseBackground_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userId_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userName_:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userAvatar_:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserId_:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserName_:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserAvatar_:Ljava/lang/String;

    .line 29
    .line 30
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setOtherUserAvatar(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setOtherUserAvatarBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setOtherUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setOtherUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setOtherUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setOtherUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setUserAvatar(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setUserAvatarBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic P()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->clearAction()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->clearHouseBackground()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->clearHouseId()V

    return-void
.end method

.method private clearAction()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->action_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearHouseBackground()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseBackground()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseBackground_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearHouseId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearHouseImage()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseImage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseImage_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearHouseName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearHouseRank()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseRank_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->liveId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOtherUserAvatar()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserAvatar()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserAvatar_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOtherUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOtherUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserAvatar()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getUserAvatar()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userAvatar_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->clearHouseImage()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->clearHouseName()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->clearHouseRank()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->clearLiveId()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->clearOtherUserAvatar()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->clearOtherUserId()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->clearOtherUserName()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->clearRoomId()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->clearUserAvatar()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->clearUserName()V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setAction(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setActionValue(I)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setHouseBackground(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setHouseBackgroundBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setHouseId(Ljava/lang/String;)V

    return-void
.end method

.method private setAction(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->action_:I

    .line 9
    .line 10
    return-void
.end method

.method private setActionValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->action_:I

    .line 2
    .line 3
    return-void
.end method

.method private setHouseBackground(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseBackground_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setHouseBackgroundBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseBackground_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setHouseId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setHouseIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setHouseImage(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseImage_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setHouseImageBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseImage_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setHouseName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setHouseNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setHouseRank(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseRank_:I

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->liveId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->liveId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setOtherUserAvatar(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserAvatar_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOtherUserAvatarBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserAvatar_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setOtherUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOtherUserIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setOtherUserName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOtherUserNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setRoomId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->roomId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setRoomIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserAvatar(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userAvatar_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserAvatarBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userAvatar_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userName_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setHouseIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setHouseImage(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setHouseImageBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setHouseName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setHouseNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setHouseRank(I)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->setLiveId(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x0

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
    return-object v0

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->PARSER:Ll/ng60;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    :goto_0
    monitor-exit p0

    .line 43
    goto :goto_2

    .line 44
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    throw p1

    .line 46
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->PARSER:Ll/ng60;

    .line 47
    .line 48
    return-object p0

    .line 49
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 50
    .line 51
    check-cast p3, Lcom/google/protobuf/h;

    .line 52
    .line 53
    :cond_2
    :goto_3
    if-nez v1, :cond_3

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    sparse-switch p1, :sswitch_data_0

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_2

    .line 67
    .line 68
    :sswitch_0
    move v1, v2

    .line 69
    goto :goto_3

    .line 70
    :catch_0
    move-exception p1

    .line 71
    goto/16 :goto_4

    .line 72
    .line 73
    :catch_1
    move-exception p1

    .line 74
    goto/16 :goto_5

    .line 75
    .line 76
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->action_:I

    .line 81
    .line 82
    goto :goto_3

    .line 83
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserAvatar_:Ljava/lang/String;

    .line 88
    .line 89
    goto :goto_3

    .line 90
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserName_:Ljava/lang/String;

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserId_:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userAvatar_:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userName_:Ljava/lang/String;

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userId_:Ljava/lang/String;

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseBackground_:Ljava/lang/String;

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseImage_:Ljava/lang/String;

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseRank_:I

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseName_:Ljava/lang/String;

    .line 151
    .line 152
    goto :goto_3

    .line 153
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseId_:Ljava/lang/String;

    .line 158
    .line 159
    goto :goto_3

    .line 160
    :sswitch_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->liveId_:Ljava/lang/String;

    .line 165
    .line 166
    goto :goto_3

    .line 167
    :sswitch_e
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->roomId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 172
    .line 173
    goto :goto_3

    .line 174
    :catchall_1
    move-exception p0

    .line 175
    throw p0

    .line 176
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 177
    .line 178
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 190
    .line 191
    .line 192
    return-object v0

    .line 193
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 198
    .line 199
    .line 200
    return-object v0

    .line 201
    :cond_3
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 202
    .line 203
    return-object p0

    .line 204
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 205
    .line 206
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 207
    .line 208
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->roomId_:Ljava/lang/String;

    .line 209
    .line 210
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    xor-int/2addr p1, v2

    .line 215
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->roomId_:Ljava/lang/String;

    .line 216
    .line 217
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->roomId_:Ljava/lang/String;

    .line 218
    .line 219
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 220
    .line 221
    .line 222
    move-result v3

    .line 223
    xor-int/2addr v3, v2

    .line 224
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->roomId_:Ljava/lang/String;

    .line 225
    .line 226
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->roomId_:Ljava/lang/String;

    .line 231
    .line 232
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->liveId_:Ljava/lang/String;

    .line 233
    .line 234
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 235
    .line 236
    .line 237
    move-result p1

    .line 238
    xor-int/2addr p1, v2

    .line 239
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->liveId_:Ljava/lang/String;

    .line 240
    .line 241
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->liveId_:Ljava/lang/String;

    .line 242
    .line 243
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 244
    .line 245
    .line 246
    move-result v3

    .line 247
    xor-int/2addr v3, v2

    .line 248
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->liveId_:Ljava/lang/String;

    .line 249
    .line 250
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->liveId_:Ljava/lang/String;

    .line 255
    .line 256
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseId_:Ljava/lang/String;

    .line 257
    .line 258
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 259
    .line 260
    .line 261
    move-result p1

    .line 262
    xor-int/2addr p1, v2

    .line 263
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseId_:Ljava/lang/String;

    .line 264
    .line 265
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseId_:Ljava/lang/String;

    .line 266
    .line 267
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 268
    .line 269
    .line 270
    move-result v3

    .line 271
    xor-int/2addr v3, v2

    .line 272
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseId_:Ljava/lang/String;

    .line 273
    .line 274
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseId_:Ljava/lang/String;

    .line 279
    .line 280
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseName_:Ljava/lang/String;

    .line 281
    .line 282
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 283
    .line 284
    .line 285
    move-result p1

    .line 286
    xor-int/2addr p1, v2

    .line 287
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseName_:Ljava/lang/String;

    .line 288
    .line 289
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseName_:Ljava/lang/String;

    .line 290
    .line 291
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 292
    .line 293
    .line 294
    move-result v3

    .line 295
    xor-int/2addr v3, v2

    .line 296
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseName_:Ljava/lang/String;

    .line 297
    .line 298
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object p1

    .line 302
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseName_:Ljava/lang/String;

    .line 303
    .line 304
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseRank_:I

    .line 305
    .line 306
    if-eqz p1, :cond_4

    .line 307
    .line 308
    move v0, v2

    .line 309
    goto :goto_6

    .line 310
    :cond_4
    move v0, v1

    .line 311
    :goto_6
    iget v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseRank_:I

    .line 312
    .line 313
    if-eqz v3, :cond_5

    .line 314
    .line 315
    move v4, v2

    .line 316
    goto :goto_7

    .line 317
    :cond_5
    move v4, v1

    .line 318
    :goto_7
    invoke-interface {p2, v0, p1, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 319
    .line 320
    .line 321
    move-result p1

    .line 322
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseRank_:I

    .line 323
    .line 324
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseImage_:Ljava/lang/String;

    .line 325
    .line 326
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 327
    .line 328
    .line 329
    move-result p1

    .line 330
    xor-int/2addr p1, v2

    .line 331
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseImage_:Ljava/lang/String;

    .line 332
    .line 333
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseImage_:Ljava/lang/String;

    .line 334
    .line 335
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 336
    .line 337
    .line 338
    move-result v3

    .line 339
    xor-int/2addr v3, v2

    .line 340
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseImage_:Ljava/lang/String;

    .line 341
    .line 342
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseImage_:Ljava/lang/String;

    .line 347
    .line 348
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseBackground_:Ljava/lang/String;

    .line 349
    .line 350
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 351
    .line 352
    .line 353
    move-result p1

    .line 354
    xor-int/2addr p1, v2

    .line 355
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseBackground_:Ljava/lang/String;

    .line 356
    .line 357
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseBackground_:Ljava/lang/String;

    .line 358
    .line 359
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 360
    .line 361
    .line 362
    move-result v3

    .line 363
    xor-int/2addr v3, v2

    .line 364
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseBackground_:Ljava/lang/String;

    .line 365
    .line 366
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object p1

    .line 370
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseBackground_:Ljava/lang/String;

    .line 371
    .line 372
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userId_:Ljava/lang/String;

    .line 373
    .line 374
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 375
    .line 376
    .line 377
    move-result p1

    .line 378
    xor-int/2addr p1, v2

    .line 379
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userId_:Ljava/lang/String;

    .line 380
    .line 381
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userId_:Ljava/lang/String;

    .line 382
    .line 383
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 384
    .line 385
    .line 386
    move-result v3

    .line 387
    xor-int/2addr v3, v2

    .line 388
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userId_:Ljava/lang/String;

    .line 389
    .line 390
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object p1

    .line 394
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userId_:Ljava/lang/String;

    .line 395
    .line 396
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userName_:Ljava/lang/String;

    .line 397
    .line 398
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 399
    .line 400
    .line 401
    move-result p1

    .line 402
    xor-int/2addr p1, v2

    .line 403
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userName_:Ljava/lang/String;

    .line 404
    .line 405
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userName_:Ljava/lang/String;

    .line 406
    .line 407
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 408
    .line 409
    .line 410
    move-result v3

    .line 411
    xor-int/2addr v3, v2

    .line 412
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userName_:Ljava/lang/String;

    .line 413
    .line 414
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object p1

    .line 418
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userName_:Ljava/lang/String;

    .line 419
    .line 420
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userAvatar_:Ljava/lang/String;

    .line 421
    .line 422
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 423
    .line 424
    .line 425
    move-result p1

    .line 426
    xor-int/2addr p1, v2

    .line 427
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userAvatar_:Ljava/lang/String;

    .line 428
    .line 429
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userAvatar_:Ljava/lang/String;

    .line 430
    .line 431
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 432
    .line 433
    .line 434
    move-result v3

    .line 435
    xor-int/2addr v3, v2

    .line 436
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userAvatar_:Ljava/lang/String;

    .line 437
    .line 438
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object p1

    .line 442
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userAvatar_:Ljava/lang/String;

    .line 443
    .line 444
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserId_:Ljava/lang/String;

    .line 445
    .line 446
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 447
    .line 448
    .line 449
    move-result p1

    .line 450
    xor-int/2addr p1, v2

    .line 451
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserId_:Ljava/lang/String;

    .line 452
    .line 453
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserId_:Ljava/lang/String;

    .line 454
    .line 455
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 456
    .line 457
    .line 458
    move-result v3

    .line 459
    xor-int/2addr v3, v2

    .line 460
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserId_:Ljava/lang/String;

    .line 461
    .line 462
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 463
    .line 464
    .line 465
    move-result-object p1

    .line 466
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserId_:Ljava/lang/String;

    .line 467
    .line 468
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserName_:Ljava/lang/String;

    .line 469
    .line 470
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 471
    .line 472
    .line 473
    move-result p1

    .line 474
    xor-int/2addr p1, v2

    .line 475
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserName_:Ljava/lang/String;

    .line 476
    .line 477
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserName_:Ljava/lang/String;

    .line 478
    .line 479
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 480
    .line 481
    .line 482
    move-result v3

    .line 483
    xor-int/2addr v3, v2

    .line 484
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserName_:Ljava/lang/String;

    .line 485
    .line 486
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object p1

    .line 490
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserName_:Ljava/lang/String;

    .line 491
    .line 492
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserAvatar_:Ljava/lang/String;

    .line 493
    .line 494
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 495
    .line 496
    .line 497
    move-result p1

    .line 498
    xor-int/2addr p1, v2

    .line 499
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserAvatar_:Ljava/lang/String;

    .line 500
    .line 501
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserAvatar_:Ljava/lang/String;

    .line 502
    .line 503
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 504
    .line 505
    .line 506
    move-result v3

    .line 507
    xor-int/2addr v3, v2

    .line 508
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserAvatar_:Ljava/lang/String;

    .line 509
    .line 510
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 511
    .line 512
    .line 513
    move-result-object p1

    .line 514
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserAvatar_:Ljava/lang/String;

    .line 515
    .line 516
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->action_:I

    .line 517
    .line 518
    if-eqz p1, :cond_6

    .line 519
    .line 520
    move v0, v2

    .line 521
    goto :goto_8

    .line 522
    :cond_6
    move v0, v1

    .line 523
    :goto_8
    iget p3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->action_:I

    .line 524
    .line 525
    if-eqz p3, :cond_7

    .line 526
    .line 527
    move v1, v2

    .line 528
    :cond_7
    invoke-interface {p2, v0, p1, v1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 529
    .line 530
    .line 531
    move-result p1

    .line 532
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->action_:I

    .line 533
    .line 534
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 535
    .line 536
    return-object p0

    .line 537
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage$Builder;

    .line 538
    .line 539
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage$Builder;-><init>(Ll/uvo0;)V

    .line 540
    .line 541
    .line 542
    return-object p0

    .line 543
    :pswitch_5
    return-object v0

    .line 544
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 545
    .line 546
    return-object p0

    .line 547
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 548
    .line 549
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;-><init>()V

    .line 550
    .line 551
    .line 552
    return-object p0

    .line 553
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

    .line 554
    .line 555
    .line 556
    .line 557
    .line 558
    .line 559
    .line 560
    .line 561
    .line 562
    .line 563
    .line 564
    .line 565
    .line 566
    .line 567
    .line 568
    .line 569
    .line 570
    .line 571
    .line 572
    .line 573
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_e
        0x12 -> :sswitch_d
        0x1a -> :sswitch_c
        0x22 -> :sswitch_b
        0x28 -> :sswitch_a
        0x32 -> :sswitch_9
        0x3a -> :sswitch_8
        0x42 -> :sswitch_7
        0x4a -> :sswitch_6
        0x52 -> :sswitch_5
        0x5a -> :sswitch_4
        0x62 -> :sswitch_3
        0x6a -> :sswitch_2
        0x70 -> :sswitch_1
    .end sparse-switch
.end method

.method public getAction()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->action_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getActionValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->action_:I

    .line 2
    .line 3
    return p0
.end method

.method public getHouseBackground()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseBackground_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHouseBackgroundBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseBackground_:Ljava/lang/String;

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

.method public getHouseId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHouseIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseId_:Ljava/lang/String;

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

.method public getHouseImage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseImage_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHouseImageBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseImage_:Ljava/lang/String;

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

.method public getHouseName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHouseNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseName_:Ljava/lang/String;

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

.method public getHouseRank()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseRank_:I

    .line 2
    .line 3
    return p0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->liveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->liveId_:Ljava/lang/String;

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

.method public getOtherUserAvatar()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserAvatar_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOtherUserAvatarBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserAvatar_:Ljava/lang/String;

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

.method public getOtherUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOtherUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserId_:Ljava/lang/String;

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

.method public getOtherUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOtherUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserName_:Ljava/lang/String;

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

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->roomId_:Ljava/lang/String;

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
    .locals 3

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getRoomId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->liveId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getLiveId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseName()Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseRank_:I

    .line 81
    .line 82
    if-eqz v1, :cond_5

    .line 83
    .line 84
    const/4 v2, 0x5

    .line 85
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    add-int/2addr v0, v1

    .line 90
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseImage_:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-nez v1, :cond_6

    .line 97
    .line 98
    const/4 v1, 0x6

    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseImage()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    add-int/2addr v0, v1

    .line 108
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseBackground_:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-nez v1, :cond_7

    .line 115
    .line 116
    const/4 v1, 0x7

    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseBackground()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    add-int/2addr v0, v1

    .line 126
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userId_:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-nez v1, :cond_8

    .line 133
    .line 134
    const/16 v1, 0x8

    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getUserId()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    add-int/2addr v0, v1

    .line 145
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userName_:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-nez v1, :cond_9

    .line 152
    .line 153
    const/16 v1, 0x9

    .line 154
    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getUserName()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    add-int/2addr v0, v1

    .line 164
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userAvatar_:Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    if-nez v1, :cond_a

    .line 171
    .line 172
    const/16 v1, 0xa

    .line 173
    .line 174
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getUserAvatar()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    add-int/2addr v0, v1

    .line 183
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserId_:Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    if-nez v1, :cond_b

    .line 190
    .line 191
    const/16 v1, 0xb

    .line 192
    .line 193
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserId()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    add-int/2addr v0, v1

    .line 202
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserName_:Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    if-nez v1, :cond_c

    .line 209
    .line 210
    const/16 v1, 0xc

    .line 211
    .line 212
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserName()Ljava/lang/String;

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
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserAvatar_:Ljava/lang/String;

    .line 222
    .line 223
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    if-nez v1, :cond_d

    .line 228
    .line 229
    const/16 v1, 0xd

    .line 230
    .line 231
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserAvatar()Ljava/lang/String;

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
    :cond_d
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->action_:I

    .line 241
    .line 242
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;->invite:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;

    .line 243
    .line 244
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;->getNumber()I

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    if-eq v1, v2, :cond_e

    .line 249
    .line 250
    const/16 v1, 0xe

    .line 251
    .line 252
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->action_:I

    .line 253
    .line 254
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    add-int/2addr v0, v1

    .line 259
    :cond_e
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 260
    .line 261
    return v0
.end method

.method public getUserAvatar()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userAvatar_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserAvatarBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userAvatar_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userId_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userName_:Ljava/lang/String;

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

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getRoomId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->liveId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getLiveId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseName()Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseRank_:I

    .line 66
    .line 67
    if-eqz v0, :cond_4

    .line 68
    .line 69
    const/4 v1, 0x5

    .line 70
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 71
    .line 72
    .line 73
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseImage_:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_5

    .line 80
    .line 81
    const/4 v0, 0x6

    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseImage()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->houseBackground_:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_6

    .line 96
    .line 97
    const/4 v0, 0x7

    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseBackground()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 103
    .line 104
    .line 105
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userId_:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_7

    .line 112
    .line 113
    const/16 v0, 0x8

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getUserId()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userName_:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-nez v0, :cond_8

    .line 129
    .line 130
    const/16 v0, 0x9

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getUserName()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->userAvatar_:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-nez v0, :cond_9

    .line 146
    .line 147
    const/16 v0, 0xa

    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getUserAvatar()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 154
    .line 155
    .line 156
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserId_:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-nez v0, :cond_a

    .line 163
    .line 164
    const/16 v0, 0xb

    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserId()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 171
    .line 172
    .line 173
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserName_:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-nez v0, :cond_b

    .line 180
    .line 181
    const/16 v0, 0xc

    .line 182
    .line 183
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserName()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 188
    .line 189
    .line 190
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->otherUserAvatar_:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    if-nez v0, :cond_c

    .line 197
    .line 198
    const/16 v0, 0xd

    .line 199
    .line 200
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserAvatar()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 205
    .line 206
    .line 207
    :cond_c
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->action_:I

    .line 208
    .line 209
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;->invite:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;

    .line 210
    .line 211
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindAction;->getNumber()I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    if-eq v0, v1, :cond_d

    .line 216
    .line 217
    const/16 v0, 0xe

    .line 218
    .line 219
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->action_:I

    .line 220
    .line 221
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 222
    .line 223
    .line 224
    :cond_d
    return-void
.end method
