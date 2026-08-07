.class public final Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceCpHouseUpgradeMessage"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessageOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

.field public static final HOUSEBACKGROUND_FIELD_NUMBER:I = 0x7

.field public static final HOUSEID_FIELD_NUMBER:I = 0x3

.field public static final HOUSEIMAGE_FIELD_NUMBER:I = 0x6

.field public static final HOUSENAME_FIELD_NUMBER:I = 0x4

.field public static final HOUSERANK_FIELD_NUMBER:I = 0x5

.field public static final LIVEID_FIELD_NUMBER:I = 0x2

.field public static final OTHERUSERID_FIELD_NUMBER:I = 0xb

.field public static final OTHERUSERNAME_FIELD_NUMBER:I = 0xc

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static final REWARDLIST_FIELD_NUMBER:I = 0xd

.field public static final ROOMID_FIELD_NUMBER:I = 0x1

.field public static final USERID_FIELD_NUMBER:I = 0x8

.field public static final USERNAME_FIELD_NUMBER:I = 0x9


# instance fields
.field private bitField0_:I

.field private houseBackground_:Ljava/lang/String;

.field private houseId_:Ljava/lang/String;

.field private houseImage_:Ljava/lang/String;

.field private houseName_:Ljava/lang/String;

.field private houseRank_:I

.field private liveId_:Ljava/lang/String;

.field private otherUserId_:Ljava/lang/String;

.field private otherUserName_:Ljava/lang/String;

.field private rewardList_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;",
            ">;"
        }
    .end annotation
.end field

.field private roomId_:Ljava/lang/String;

.field private userId_:Ljava/lang/String;

.field private userName_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->roomId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->liveId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseId_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseName_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseImage_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseBackground_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userId_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userName_:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserId_:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserName_:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 31
    .line 32
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setHouseRank(I)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setLiveId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setOtherUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setOtherUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setOtherUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setOtherUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;ILcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setRewardList(ILcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward$Builder;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;ILcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setRewardList(ILcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic P()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->addAllRewardList(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllRewardList(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->ensureRewardListIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addRewardList(ILcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->ensureRewardListIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addRewardList(ILcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->ensureRewardListIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addRewardList(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->ensureRewardListIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addRewardList(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->ensureRewardListIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;ILcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->addRewardList(ILcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward$Builder;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;ILcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->addRewardList(ILcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;)V

    return-void
.end method

.method private clearHouseBackground()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getHouseBackground()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseBackground_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearHouseId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getHouseId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearHouseImage()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getHouseImage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseImage_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearHouseName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getHouseName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearHouseRank()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseRank_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->liveId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOtherUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getOtherUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOtherUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getOtherUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRewardList()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->addRewardList(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward$Builder;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->addRewardList(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;)V

    return-void
.end method

.method private ensureRewardListIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->clearHouseBackground()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->clearHouseId()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->clearHouseImage()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->clearHouseName()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->clearHouseRank()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->clearLiveId()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->clearOtherUserId()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->clearOtherUserName()V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->clearRewardList()V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->clearRoomId()V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->clearUserId()V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->clearUserName()V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->removeRewardList(I)V

    return-void
.end method

.method private removeRewardList(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->ensureRewardListIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setHouseBackground(Ljava/lang/String;)V

    return-void
.end method

.method private setHouseBackground(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseBackground_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseBackground_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseImage_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseImage_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseName_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setHouseRank(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseRank_:I

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->liveId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->liveId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserName_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setRewardList(ILcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->ensureRewardListIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setRewardList(ILcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->ensureRewardListIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setRoomId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userName_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setHouseBackgroundBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setHouseId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setHouseIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setHouseImage(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setHouseImageBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setHouseName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->setHouseNameBytes(Lcom/google/protobuf/ByteString;)V

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->PARSER:Ll/ng60;

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
    if-nez v1, :cond_4

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
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 77
    .line 78
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->q()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-nez p1, :cond_3

    .line 83
    .line 84
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 85
    .line 86
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 91
    .line 92
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;->parser()Ll/ng60;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;

    .line 103
    .line 104
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    goto :goto_3

    .line 108
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserName_:Ljava/lang/String;

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserId_:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userName_:Ljava/lang/String;

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userId_:Ljava/lang/String;

    .line 134
    .line 135
    goto :goto_3

    .line 136
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseBackground_:Ljava/lang/String;

    .line 141
    .line 142
    goto :goto_3

    .line 143
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseImage_:Ljava/lang/String;

    .line 148
    .line 149
    goto :goto_3

    .line 150
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseRank_:I

    .line 155
    .line 156
    goto :goto_3

    .line 157
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseName_:Ljava/lang/String;

    .line 162
    .line 163
    goto :goto_3

    .line 164
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseId_:Ljava/lang/String;

    .line 169
    .line 170
    goto :goto_3

    .line 171
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->liveId_:Ljava/lang/String;

    .line 176
    .line 177
    goto :goto_3

    .line 178
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->roomId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 183
    .line 184
    goto/16 :goto_3

    .line 185
    .line 186
    :catchall_1
    move-exception p0

    .line 187
    throw p0

    .line 188
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 189
    .line 190
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 202
    .line 203
    .line 204
    return-object v0

    .line 205
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 210
    .line 211
    .line 212
    return-object v0

    .line 213
    :cond_4
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 214
    .line 215
    return-object p0

    .line 216
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 217
    .line 218
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 219
    .line 220
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->roomId_:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    xor-int/2addr p1, v2

    .line 227
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->roomId_:Ljava/lang/String;

    .line 228
    .line 229
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->roomId_:Ljava/lang/String;

    .line 230
    .line 231
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 232
    .line 233
    .line 234
    move-result v3

    .line 235
    xor-int/2addr v3, v2

    .line 236
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->roomId_:Ljava/lang/String;

    .line 237
    .line 238
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->roomId_:Ljava/lang/String;

    .line 243
    .line 244
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->liveId_:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 247
    .line 248
    .line 249
    move-result p1

    .line 250
    xor-int/2addr p1, v2

    .line 251
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->liveId_:Ljava/lang/String;

    .line 252
    .line 253
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->liveId_:Ljava/lang/String;

    .line 254
    .line 255
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 256
    .line 257
    .line 258
    move-result v3

    .line 259
    xor-int/2addr v3, v2

    .line 260
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->liveId_:Ljava/lang/String;

    .line 261
    .line 262
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->liveId_:Ljava/lang/String;

    .line 267
    .line 268
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseId_:Ljava/lang/String;

    .line 269
    .line 270
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 271
    .line 272
    .line 273
    move-result p1

    .line 274
    xor-int/2addr p1, v2

    .line 275
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseId_:Ljava/lang/String;

    .line 276
    .line 277
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseId_:Ljava/lang/String;

    .line 278
    .line 279
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 280
    .line 281
    .line 282
    move-result v3

    .line 283
    xor-int/2addr v3, v2

    .line 284
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseId_:Ljava/lang/String;

    .line 285
    .line 286
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object p1

    .line 290
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseId_:Ljava/lang/String;

    .line 291
    .line 292
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseName_:Ljava/lang/String;

    .line 293
    .line 294
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 295
    .line 296
    .line 297
    move-result p1

    .line 298
    xor-int/2addr p1, v2

    .line 299
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseName_:Ljava/lang/String;

    .line 300
    .line 301
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseName_:Ljava/lang/String;

    .line 302
    .line 303
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 304
    .line 305
    .line 306
    move-result v3

    .line 307
    xor-int/2addr v3, v2

    .line 308
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseName_:Ljava/lang/String;

    .line 309
    .line 310
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseName_:Ljava/lang/String;

    .line 315
    .line 316
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseRank_:I

    .line 317
    .line 318
    if-eqz p1, :cond_5

    .line 319
    .line 320
    move v0, v2

    .line 321
    goto :goto_6

    .line 322
    :cond_5
    move v0, v1

    .line 323
    :goto_6
    iget v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseRank_:I

    .line 324
    .line 325
    if-eqz v3, :cond_6

    .line 326
    .line 327
    move v1, v2

    .line 328
    :cond_6
    invoke-interface {p2, v0, p1, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 329
    .line 330
    .line 331
    move-result p1

    .line 332
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseRank_:I

    .line 333
    .line 334
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseImage_:Ljava/lang/String;

    .line 335
    .line 336
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 337
    .line 338
    .line 339
    move-result p1

    .line 340
    xor-int/2addr p1, v2

    .line 341
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseImage_:Ljava/lang/String;

    .line 342
    .line 343
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseImage_:Ljava/lang/String;

    .line 344
    .line 345
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 346
    .line 347
    .line 348
    move-result v1

    .line 349
    xor-int/2addr v1, v2

    .line 350
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseImage_:Ljava/lang/String;

    .line 351
    .line 352
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object p1

    .line 356
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseImage_:Ljava/lang/String;

    .line 357
    .line 358
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseBackground_:Ljava/lang/String;

    .line 359
    .line 360
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 361
    .line 362
    .line 363
    move-result p1

    .line 364
    xor-int/2addr p1, v2

    .line 365
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseBackground_:Ljava/lang/String;

    .line 366
    .line 367
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseBackground_:Ljava/lang/String;

    .line 368
    .line 369
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 370
    .line 371
    .line 372
    move-result v1

    .line 373
    xor-int/2addr v1, v2

    .line 374
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseBackground_:Ljava/lang/String;

    .line 375
    .line 376
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object p1

    .line 380
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseBackground_:Ljava/lang/String;

    .line 381
    .line 382
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userId_:Ljava/lang/String;

    .line 383
    .line 384
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 385
    .line 386
    .line 387
    move-result p1

    .line 388
    xor-int/2addr p1, v2

    .line 389
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userId_:Ljava/lang/String;

    .line 390
    .line 391
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userId_:Ljava/lang/String;

    .line 392
    .line 393
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 394
    .line 395
    .line 396
    move-result v1

    .line 397
    xor-int/2addr v1, v2

    .line 398
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userId_:Ljava/lang/String;

    .line 399
    .line 400
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object p1

    .line 404
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userId_:Ljava/lang/String;

    .line 405
    .line 406
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userName_:Ljava/lang/String;

    .line 407
    .line 408
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 409
    .line 410
    .line 411
    move-result p1

    .line 412
    xor-int/2addr p1, v2

    .line 413
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userName_:Ljava/lang/String;

    .line 414
    .line 415
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userName_:Ljava/lang/String;

    .line 416
    .line 417
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 418
    .line 419
    .line 420
    move-result v1

    .line 421
    xor-int/2addr v1, v2

    .line 422
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userName_:Ljava/lang/String;

    .line 423
    .line 424
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object p1

    .line 428
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userName_:Ljava/lang/String;

    .line 429
    .line 430
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserId_:Ljava/lang/String;

    .line 431
    .line 432
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 433
    .line 434
    .line 435
    move-result p1

    .line 436
    xor-int/2addr p1, v2

    .line 437
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserId_:Ljava/lang/String;

    .line 438
    .line 439
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserId_:Ljava/lang/String;

    .line 440
    .line 441
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 442
    .line 443
    .line 444
    move-result v1

    .line 445
    xor-int/2addr v1, v2

    .line 446
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserId_:Ljava/lang/String;

    .line 447
    .line 448
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 449
    .line 450
    .line 451
    move-result-object p1

    .line 452
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserId_:Ljava/lang/String;

    .line 453
    .line 454
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserName_:Ljava/lang/String;

    .line 455
    .line 456
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 457
    .line 458
    .line 459
    move-result p1

    .line 460
    xor-int/2addr p1, v2

    .line 461
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserName_:Ljava/lang/String;

    .line 462
    .line 463
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserName_:Ljava/lang/String;

    .line 464
    .line 465
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 466
    .line 467
    .line 468
    move-result v1

    .line 469
    xor-int/2addr v1, v2

    .line 470
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserName_:Ljava/lang/String;

    .line 471
    .line 472
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 473
    .line 474
    .line 475
    move-result-object p1

    .line 476
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserName_:Ljava/lang/String;

    .line 477
    .line 478
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 479
    .line 480
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 481
    .line 482
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 483
    .line 484
    .line 485
    move-result-object p1

    .line 486
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 487
    .line 488
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 489
    .line 490
    if-ne p2, p1, :cond_7

    .line 491
    .line 492
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->bitField0_:I

    .line 493
    .line 494
    iget p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->bitField0_:I

    .line 495
    .line 496
    or-int/2addr p1, p2

    .line 497
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->bitField0_:I

    .line 498
    .line 499
    :cond_7
    return-object p0

    .line 500
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage$Builder;

    .line 501
    .line 502
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage$Builder;-><init>(Ll/uvo0;)V

    .line 503
    .line 504
    .line 505
    return-object p0

    .line 506
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 507
    .line 508
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 509
    .line 510
    .line 511
    return-object v0

    .line 512
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 513
    .line 514
    return-object p0

    .line 515
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;

    .line 516
    .line 517
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;-><init>()V

    .line 518
    .line 519
    .line 520
    return-object p0

    .line 521
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

    .line 522
    .line 523
    .line 524
    .line 525
    .line 526
    .line 527
    .line 528
    .line 529
    .line 530
    .line 531
    .line 532
    .line 533
    .line 534
    .line 535
    .line 536
    .line 537
    .line 538
    .line 539
    .line 540
    .line 541
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_c
        0x12 -> :sswitch_b
        0x1a -> :sswitch_a
        0x22 -> :sswitch_9
        0x28 -> :sswitch_8
        0x32 -> :sswitch_7
        0x3a -> :sswitch_6
        0x42 -> :sswitch_5
        0x4a -> :sswitch_4
        0x5a -> :sswitch_3
        0x62 -> :sswitch_2
        0x6a -> :sswitch_1
    .end sparse-switch
.end method

.method public getHouseBackground()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseBackground_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHouseBackgroundBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseBackground_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHouseIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseId_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseImage_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHouseImageBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseImage_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHouseNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseName_:Ljava/lang/String;

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
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseRank_:I

    .line 2
    .line 3
    return p0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->liveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->liveId_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOtherUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserId_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOtherUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserName_:Ljava/lang/String;

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

.method public getRewardList(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;

    .line 8
    .line 9
    return-object p0
.end method

.method public getRewardListCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

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

.method public getRewardListList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseReward;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRewardListOrBuilder(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseRewardOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseRewardOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getRewardListOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseRewardOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->roomId_:Ljava/lang/String;

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
    .locals 4

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getRoomId()Ljava/lang/String;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->liveId_:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_2

    .line 34
    .line 35
    const/4 v2, 0x2

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getLiveId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    add-int/2addr v0, v2

    .line 45
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getHouseId()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    add-int/2addr v0, v2

    .line 63
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getHouseName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    add-int/2addr v0, v2

    .line 81
    :cond_4
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseRank_:I

    .line 82
    .line 83
    if-eqz v2, :cond_5

    .line 84
    .line 85
    const/4 v3, 0x5

    .line 86
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    add-int/2addr v0, v2

    .line 91
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseImage_:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-nez v2, :cond_6

    .line 98
    .line 99
    const/4 v2, 0x6

    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getHouseImage()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    add-int/2addr v0, v2

    .line 109
    :cond_6
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseBackground_:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-nez v2, :cond_7

    .line 116
    .line 117
    const/4 v2, 0x7

    .line 118
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getHouseBackground()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    add-int/2addr v0, v2

    .line 127
    :cond_7
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userId_:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    if-nez v2, :cond_8

    .line 134
    .line 135
    const/16 v2, 0x8

    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getUserId()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    add-int/2addr v0, v2

    .line 146
    :cond_8
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userName_:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    if-nez v2, :cond_9

    .line 153
    .line 154
    const/16 v2, 0x9

    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getUserName()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 161
    .line 162
    .line 163
    move-result v2

    .line 164
    add-int/2addr v0, v2

    .line 165
    :cond_9
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserId_:Ljava/lang/String;

    .line 166
    .line 167
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    if-nez v2, :cond_a

    .line 172
    .line 173
    const/16 v2, 0xb

    .line 174
    .line 175
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getOtherUserId()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    add-int/2addr v0, v2

    .line 184
    :cond_a
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserName_:Ljava/lang/String;

    .line 185
    .line 186
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    if-nez v2, :cond_b

    .line 191
    .line 192
    const/16 v2, 0xc

    .line 193
    .line 194
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getOtherUserName()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 199
    .line 200
    .line 201
    move-result v2

    .line 202
    add-int/2addr v0, v2

    .line 203
    :cond_b
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 204
    .line 205
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    if-ge v1, v2, :cond_c

    .line 210
    .line 211
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 212
    .line 213
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    check-cast v2, Lcom/google/protobuf/q;

    .line 218
    .line 219
    const/16 v3, 0xd

    .line 220
    .line 221
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 222
    .line 223
    .line 224
    move-result v2

    .line 225
    add-int/2addr v0, v2

    .line 226
    add-int/lit8 v1, v1, 0x1

    .line 227
    .line 228
    goto :goto_1

    .line 229
    :cond_c
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 230
    .line 231
    return v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userId_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userName_:Ljava/lang/String;

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
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getRoomId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->liveId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getLiveId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getHouseId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getHouseName()Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseRank_:I

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseImage_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getHouseImage()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->houseBackground_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getHouseBackground()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->userName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getUserName()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserId_:Ljava/lang/String;

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
    const/16 v0, 0xb

    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getOtherUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->otherUserName_:Ljava/lang/String;

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
    const/16 v0, 0xc

    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->getOtherUserName()Ljava/lang/String;

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
    const/4 v0, 0x0

    .line 174
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 175
    .line 176
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    if-ge v0, v1, :cond_b

    .line 181
    .line 182
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpHouseUpgradeMessage;->rewardList_:Lcom/google/protobuf/l$h;

    .line 183
    .line 184
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    check-cast v1, Lcom/google/protobuf/q;

    .line 189
    .line 190
    const/16 v2, 0xd

    .line 191
    .line 192
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 193
    .line 194
    .line 195
    add-int/lit8 v0, v0, 0x1

    .line 196
    .line 197
    goto :goto_0

    .line 198
    :cond_b
    return-void
.end method
