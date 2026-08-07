.class public final Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TurboCardInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;",
        "Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfoOrBuilder;"
    }
.end annotation


# static fields
.field public static final ACTION_FIELD_NUMBER:I = 0x1

.field public static final CARDTYPE_FIELD_NUMBER:I = 0xe

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

.field public static final EXPOSURETIMEEND_FIELD_NUMBER:I = 0x5

.field public static final EXPOSURETIMESTART_FIELD_NUMBER:I = 0x4

.field public static final MSGTYPE_FIELD_NUMBER:I = 0xd

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final PREPARETIMEEND_FIELD_NUMBER:I = 0x3

.field public static final PREPARETIMESTART_FIELD_NUMBER:I = 0x2

.field public static final ROOMID_FIELD_NUMBER:I = 0xb

.field public static final TEXT_FIELD_NUMBER:I = 0xc

.field public static final USERHIERARCHY_FIELD_NUMBER:I = 0x9

.field public static final USERID_FIELD_NUMBER:I = 0x7

.field public static final USERMEDAL_FIELD_NUMBER:I = 0xa

.field public static final USERNAME_FIELD_NUMBER:I = 0x8

.field public static final USERTYPE_FIELD_NUMBER:I = 0x6


# instance fields
.field private action_:Ljava/lang/String;

.field private cardType_:Ljava/lang/String;

.field private exposureTimeEnd_:J

.field private exposureTimeStart_:J

.field private msgType_:Ljava/lang/String;

.field private prepareTimeEnd_:J

.field private prepareTimeStart_:J

.field private roomId_:Ljava/lang/String;

.field private text_:Ljava/lang/String;

.field private userHierarchy_:J

.field private userId_:Ljava/lang/String;

.field private userMedal_:Ljava/lang/String;

.field private userName_:Ljava/lang/String;

.field private userType_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->action_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userType_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userId_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userName_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userMedal_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->roomId_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->text_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->msgType_:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->cardType_:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setText(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setTextBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setUserHierarchy(J)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setUserMedal(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setUserMedalBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setUserType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setUserTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic L()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->clearAction()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->clearCardType()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->clearExposureTimeEnd()V

    return-void
.end method

.method private clearAction()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getAction()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->action_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearCardType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getCardType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->cardType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearExposureTimeEnd()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeEnd_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearExposureTimeStart()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeStart_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearMsgType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getMsgType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->msgType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPrepareTimeEnd()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeEnd_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearPrepareTimeStart()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeStart_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearText()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->text_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserHierarchy()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userHierarchy_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserMedal()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getUserMedal()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userMedal_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getUserType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->clearExposureTimeStart()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->clearMsgType()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->clearPrepareTimeEnd()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->clearPrepareTimeStart()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->clearRoomId()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->clearText()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->clearUserHierarchy()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->clearUserMedal()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->clearUserName()V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->clearUserType()V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setAction(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setActionBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setCardType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setCardTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setExposureTimeEnd(J)V

    return-void
.end method

.method private setAction(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->action_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setActionBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->action_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setCardType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->cardType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setCardTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->cardType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setExposureTimeEnd(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeEnd_:J

    .line 2
    .line 3
    return-void
.end method

.method private setExposureTimeStart(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeStart_:J

    .line 2
    .line 3
    return-void
.end method

.method private setMsgType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->msgType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setMsgTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->msgType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPrepareTimeEnd(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeEnd_:J

    .line 2
    .line 3
    return-void
.end method

.method private setPrepareTimeStart(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeStart_:J

    .line 2
    .line 3
    return-void
.end method

.method private setRoomId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setText(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->text_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTextBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->text_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserHierarchy(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userHierarchy_:J

    .line 2
    .line 3
    return-void
.end method

.method private setUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserMedal(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userMedal_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserMedalBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userMedal_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userName_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setExposureTimeStart(J)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setMsgType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setMsgTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setPrepareTimeEnd(J)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setPrepareTimeStart(J)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_3

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
    goto/16 :goto_4

    .line 74
    .line 75
    :catch_1
    move-exception v0

    .line 76
    move-object p1, v0

    .line 77
    goto/16 :goto_5

    .line 78
    .line 79
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->cardType_:Ljava/lang/String;

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->msgType_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->text_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->roomId_:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userMedal_:Ljava/lang/String;

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 115
    .line 116
    .line 117
    move-result-wide v3

    .line 118
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userHierarchy_:J

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userName_:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userId_:Ljava/lang/String;

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userType_:Ljava/lang/String;

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 143
    .line 144
    .line 145
    move-result-wide v3

    .line 146
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeEnd_:J

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 150
    .line 151
    .line 152
    move-result-wide v3

    .line 153
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeStart_:J

    .line 154
    .line 155
    goto :goto_3

    .line 156
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 157
    .line 158
    .line 159
    move-result-wide v3

    .line 160
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeEnd_:J

    .line 161
    .line 162
    goto :goto_3

    .line 163
    :sswitch_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 164
    .line 165
    .line 166
    move-result-wide v3

    .line 167
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeStart_:J

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :sswitch_e
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->action_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 175
    .line 176
    goto :goto_3

    .line 177
    :catchall_1
    move-exception v0

    .line 178
    move-object p0, v0

    .line 179
    throw p0

    .line 180
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 181
    .line 182
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 194
    .line 195
    .line 196
    return-object v1

    .line 197
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 202
    .line 203
    .line 204
    return-object v1

    .line 205
    :cond_3
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 206
    .line 207
    return-object p0

    .line 208
    :pswitch_3
    move-object v3, p2

    .line 209
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 210
    .line 211
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 212
    .line 213
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->action_:Ljava/lang/String;

    .line 214
    .line 215
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    xor-int/2addr p1, v2

    .line 220
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->action_:Ljava/lang/String;

    .line 221
    .line 222
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->action_:Ljava/lang/String;

    .line 223
    .line 224
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    xor-int/2addr v1, v2

    .line 229
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->action_:Ljava/lang/String;

    .line 230
    .line 231
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->action_:Ljava/lang/String;

    .line 236
    .line 237
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeStart_:J

    .line 238
    .line 239
    const-wide/16 p1, 0x0

    .line 240
    .line 241
    cmp-long v1, v5, p1

    .line 242
    .line 243
    if-eqz v1, :cond_4

    .line 244
    .line 245
    move v4, v2

    .line 246
    goto :goto_6

    .line 247
    :cond_4
    move v4, v0

    .line 248
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeStart_:J

    .line 249
    .line 250
    cmp-long v1, v8, p1

    .line 251
    .line 252
    if-eqz v1, :cond_5

    .line 253
    .line 254
    move v7, v2

    .line 255
    goto :goto_7

    .line 256
    :cond_5
    move v7, v0

    .line 257
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 258
    .line 259
    .line 260
    move-result-wide v4

    .line 261
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeStart_:J

    .line 262
    .line 263
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeEnd_:J

    .line 264
    .line 265
    cmp-long v1, v5, p1

    .line 266
    .line 267
    if-eqz v1, :cond_6

    .line 268
    .line 269
    move v4, v2

    .line 270
    goto :goto_8

    .line 271
    :cond_6
    move v4, v0

    .line 272
    :goto_8
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeEnd_:J

    .line 273
    .line 274
    cmp-long v1, v8, p1

    .line 275
    .line 276
    if-eqz v1, :cond_7

    .line 277
    .line 278
    move v7, v2

    .line 279
    goto :goto_9

    .line 280
    :cond_7
    move v7, v0

    .line 281
    :goto_9
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 282
    .line 283
    .line 284
    move-result-wide v4

    .line 285
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeEnd_:J

    .line 286
    .line 287
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeStart_:J

    .line 288
    .line 289
    cmp-long v1, v5, p1

    .line 290
    .line 291
    if-eqz v1, :cond_8

    .line 292
    .line 293
    move v4, v2

    .line 294
    goto :goto_a

    .line 295
    :cond_8
    move v4, v0

    .line 296
    :goto_a
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeStart_:J

    .line 297
    .line 298
    cmp-long v1, v8, p1

    .line 299
    .line 300
    if-eqz v1, :cond_9

    .line 301
    .line 302
    move v7, v2

    .line 303
    goto :goto_b

    .line 304
    :cond_9
    move v7, v0

    .line 305
    :goto_b
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 306
    .line 307
    .line 308
    move-result-wide v4

    .line 309
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeStart_:J

    .line 310
    .line 311
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeEnd_:J

    .line 312
    .line 313
    cmp-long v1, v5, p1

    .line 314
    .line 315
    if-eqz v1, :cond_a

    .line 316
    .line 317
    move v4, v2

    .line 318
    goto :goto_c

    .line 319
    :cond_a
    move v4, v0

    .line 320
    :goto_c
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeEnd_:J

    .line 321
    .line 322
    cmp-long v1, v8, p1

    .line 323
    .line 324
    if-eqz v1, :cond_b

    .line 325
    .line 326
    move v7, v2

    .line 327
    goto :goto_d

    .line 328
    :cond_b
    move v7, v0

    .line 329
    :goto_d
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 330
    .line 331
    .line 332
    move-result-wide v4

    .line 333
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeEnd_:J

    .line 334
    .line 335
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userType_:Ljava/lang/String;

    .line 336
    .line 337
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 338
    .line 339
    .line 340
    move-result v1

    .line 341
    xor-int/2addr v1, v2

    .line 342
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userType_:Ljava/lang/String;

    .line 343
    .line 344
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userType_:Ljava/lang/String;

    .line 345
    .line 346
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 347
    .line 348
    .line 349
    move-result v5

    .line 350
    xor-int/2addr v5, v2

    .line 351
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userType_:Ljava/lang/String;

    .line 352
    .line 353
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userType_:Ljava/lang/String;

    .line 358
    .line 359
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userId_:Ljava/lang/String;

    .line 360
    .line 361
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 362
    .line 363
    .line 364
    move-result v1

    .line 365
    xor-int/2addr v1, v2

    .line 366
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userId_:Ljava/lang/String;

    .line 367
    .line 368
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userId_:Ljava/lang/String;

    .line 369
    .line 370
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 371
    .line 372
    .line 373
    move-result v5

    .line 374
    xor-int/2addr v5, v2

    .line 375
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userId_:Ljava/lang/String;

    .line 376
    .line 377
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object v1

    .line 381
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userId_:Ljava/lang/String;

    .line 382
    .line 383
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userName_:Ljava/lang/String;

    .line 384
    .line 385
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 386
    .line 387
    .line 388
    move-result v1

    .line 389
    xor-int/2addr v1, v2

    .line 390
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userName_:Ljava/lang/String;

    .line 391
    .line 392
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userName_:Ljava/lang/String;

    .line 393
    .line 394
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 395
    .line 396
    .line 397
    move-result v5

    .line 398
    xor-int/2addr v5, v2

    .line 399
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userName_:Ljava/lang/String;

    .line 400
    .line 401
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object v1

    .line 405
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userName_:Ljava/lang/String;

    .line 406
    .line 407
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userHierarchy_:J

    .line 408
    .line 409
    cmp-long v1, v5, p1

    .line 410
    .line 411
    if-eqz v1, :cond_c

    .line 412
    .line 413
    move v4, v2

    .line 414
    goto :goto_e

    .line 415
    :cond_c
    move v4, v0

    .line 416
    :goto_e
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userHierarchy_:J

    .line 417
    .line 418
    cmp-long p1, v8, p1

    .line 419
    .line 420
    if-eqz p1, :cond_d

    .line 421
    .line 422
    move v7, v2

    .line 423
    goto :goto_f

    .line 424
    :cond_d
    move v7, v0

    .line 425
    :goto_f
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 426
    .line 427
    .line 428
    move-result-wide p1

    .line 429
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userHierarchy_:J

    .line 430
    .line 431
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userMedal_:Ljava/lang/String;

    .line 432
    .line 433
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 434
    .line 435
    .line 436
    move-result p1

    .line 437
    xor-int/2addr p1, v2

    .line 438
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userMedal_:Ljava/lang/String;

    .line 439
    .line 440
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userMedal_:Ljava/lang/String;

    .line 441
    .line 442
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 443
    .line 444
    .line 445
    move-result v0

    .line 446
    xor-int/2addr v0, v2

    .line 447
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userMedal_:Ljava/lang/String;

    .line 448
    .line 449
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 450
    .line 451
    .line 452
    move-result-object p1

    .line 453
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userMedal_:Ljava/lang/String;

    .line 454
    .line 455
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->roomId_:Ljava/lang/String;

    .line 456
    .line 457
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 458
    .line 459
    .line 460
    move-result p1

    .line 461
    xor-int/2addr p1, v2

    .line 462
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->roomId_:Ljava/lang/String;

    .line 463
    .line 464
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->roomId_:Ljava/lang/String;

    .line 465
    .line 466
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 467
    .line 468
    .line 469
    move-result v0

    .line 470
    xor-int/2addr v0, v2

    .line 471
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->roomId_:Ljava/lang/String;

    .line 472
    .line 473
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 474
    .line 475
    .line 476
    move-result-object p1

    .line 477
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->roomId_:Ljava/lang/String;

    .line 478
    .line 479
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->text_:Ljava/lang/String;

    .line 480
    .line 481
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 482
    .line 483
    .line 484
    move-result p1

    .line 485
    xor-int/2addr p1, v2

    .line 486
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->text_:Ljava/lang/String;

    .line 487
    .line 488
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->text_:Ljava/lang/String;

    .line 489
    .line 490
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 491
    .line 492
    .line 493
    move-result v0

    .line 494
    xor-int/2addr v0, v2

    .line 495
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->text_:Ljava/lang/String;

    .line 496
    .line 497
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 498
    .line 499
    .line 500
    move-result-object p1

    .line 501
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->text_:Ljava/lang/String;

    .line 502
    .line 503
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->msgType_:Ljava/lang/String;

    .line 504
    .line 505
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 506
    .line 507
    .line 508
    move-result p1

    .line 509
    xor-int/2addr p1, v2

    .line 510
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->msgType_:Ljava/lang/String;

    .line 511
    .line 512
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->msgType_:Ljava/lang/String;

    .line 513
    .line 514
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 515
    .line 516
    .line 517
    move-result v0

    .line 518
    xor-int/2addr v0, v2

    .line 519
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->msgType_:Ljava/lang/String;

    .line 520
    .line 521
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 522
    .line 523
    .line 524
    move-result-object p1

    .line 525
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->msgType_:Ljava/lang/String;

    .line 526
    .line 527
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->cardType_:Ljava/lang/String;

    .line 528
    .line 529
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 530
    .line 531
    .line 532
    move-result p1

    .line 533
    xor-int/2addr p1, v2

    .line 534
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->cardType_:Ljava/lang/String;

    .line 535
    .line 536
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->cardType_:Ljava/lang/String;

    .line 537
    .line 538
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 539
    .line 540
    .line 541
    move-result v0

    .line 542
    xor-int/2addr v0, v2

    .line 543
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->cardType_:Ljava/lang/String;

    .line 544
    .line 545
    invoke-interface {v3, p1, p2, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 546
    .line 547
    .line 548
    move-result-object p1

    .line 549
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->cardType_:Ljava/lang/String;

    .line 550
    .line 551
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 552
    .line 553
    return-object p0

    .line 554
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo$Builder;

    .line 555
    .line 556
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo$Builder;-><init>(Ll/g3w;)V

    .line 557
    .line 558
    .line 559
    return-object p0

    .line 560
    :pswitch_5
    return-object v1

    .line 561
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 562
    .line 563
    return-object p0

    .line 564
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;

    .line 565
    .line 566
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;-><init>()V

    .line 567
    .line 568
    .line 569
    return-object p0

    .line 570
    nop

    .line 571
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

    .line 572
    .line 573
    .line 574
    .line 575
    .line 576
    .line 577
    .line 578
    .line 579
    .line 580
    .line 581
    .line 582
    .line 583
    .line 584
    .line 585
    .line 586
    .line 587
    .line 588
    .line 589
    .line 590
    .line 591
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_e
        0x10 -> :sswitch_d
        0x18 -> :sswitch_c
        0x20 -> :sswitch_b
        0x28 -> :sswitch_a
        0x32 -> :sswitch_9
        0x3a -> :sswitch_8
        0x42 -> :sswitch_7
        0x48 -> :sswitch_6
        0x52 -> :sswitch_5
        0x5a -> :sswitch_4
        0x62 -> :sswitch_3
        0x6a -> :sswitch_2
        0x72 -> :sswitch_1
    .end sparse-switch
.end method

.method public getAction()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->action_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getActionBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->action_:Ljava/lang/String;

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

.method public getCardType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->cardType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCardTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->cardType_:Ljava/lang/String;

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

.method public getExposureTimeEnd()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeEnd_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getExposureTimeStart()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeStart_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getMsgType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->msgType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMsgTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->msgType_:Ljava/lang/String;

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

.method public getPrepareTimeEnd()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeEnd_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getPrepareTimeStart()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeStart_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->roomId_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->action_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getAction()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeStart_:J

    .line 27
    .line 28
    const-wide/16 v3, 0x0

    .line 29
    .line 30
    cmp-long v5, v1, v3

    .line 31
    .line 32
    if-eqz v5, :cond_2

    .line 33
    .line 34
    const/4 v5, 0x2

    .line 35
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/2addr v0, v1

    .line 40
    :cond_2
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeEnd_:J

    .line 41
    .line 42
    cmp-long v5, v1, v3

    .line 43
    .line 44
    if-eqz v5, :cond_3

    .line 45
    .line 46
    const/4 v5, 0x3

    .line 47
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    add-int/2addr v0, v1

    .line 52
    :cond_3
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeStart_:J

    .line 53
    .line 54
    cmp-long v5, v1, v3

    .line 55
    .line 56
    if-eqz v5, :cond_4

    .line 57
    .line 58
    const/4 v5, 0x4

    .line 59
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    add-int/2addr v0, v1

    .line 64
    :cond_4
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeEnd_:J

    .line 65
    .line 66
    cmp-long v5, v1, v3

    .line 67
    .line 68
    if-eqz v5, :cond_5

    .line 69
    .line 70
    const/4 v5, 0x5

    .line 71
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    add-int/2addr v0, v1

    .line 76
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userType_:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-nez v1, :cond_6

    .line 83
    .line 84
    const/4 v1, 0x6

    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getUserType()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    add-int/2addr v0, v1

    .line 94
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userId_:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_7

    .line 101
    .line 102
    const/4 v1, 0x7

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getUserId()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v0, v1

    .line 112
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userName_:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-nez v1, :cond_8

    .line 119
    .line 120
    const/16 v1, 0x8

    .line 121
    .line 122
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getUserName()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    add-int/2addr v0, v1

    .line 131
    :cond_8
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userHierarchy_:J

    .line 132
    .line 133
    cmp-long v3, v1, v3

    .line 134
    .line 135
    if-eqz v3, :cond_9

    .line 136
    .line 137
    const/16 v3, 0x9

    .line 138
    .line 139
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    add-int/2addr v0, v1

    .line 144
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userMedal_:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-nez v1, :cond_a

    .line 151
    .line 152
    const/16 v1, 0xa

    .line 153
    .line 154
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getUserMedal()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    add-int/2addr v0, v1

    .line 163
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->roomId_:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    if-nez v1, :cond_b

    .line 170
    .line 171
    const/16 v1, 0xb

    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getRoomId()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    add-int/2addr v0, v1

    .line 182
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->text_:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    if-nez v1, :cond_c

    .line 189
    .line 190
    const/16 v1, 0xc

    .line 191
    .line 192
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getText()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    add-int/2addr v0, v1

    .line 201
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->msgType_:Ljava/lang/String;

    .line 202
    .line 203
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    if-nez v1, :cond_d

    .line 208
    .line 209
    const/16 v1, 0xd

    .line 210
    .line 211
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getMsgType()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    add-int/2addr v0, v1

    .line 220
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->cardType_:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    if-nez v1, :cond_e

    .line 227
    .line 228
    const/16 v1, 0xe

    .line 229
    .line 230
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getCardType()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    add-int/2addr v0, v1

    .line 239
    :cond_e
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 240
    .line 241
    return v0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->text_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->text_:Ljava/lang/String;

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

.method public getUserHierarchy()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userHierarchy_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userId_:Ljava/lang/String;

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

.method public getUserMedal()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userMedal_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserMedalBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userMedal_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userName_:Ljava/lang/String;

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

.method public getUserType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userType_:Ljava/lang/String;

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
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->action_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getAction()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeStart_:J

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long v4, v0, v2

    .line 22
    .line 23
    if-eqz v4, :cond_1

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->prepareTimeEnd_:J

    .line 30
    .line 31
    cmp-long v4, v0, v2

    .line 32
    .line 33
    if-eqz v4, :cond_2

    .line 34
    .line 35
    const/4 v4, 0x3

    .line 36
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeStart_:J

    .line 40
    .line 41
    cmp-long v4, v0, v2

    .line 42
    .line 43
    if-eqz v4, :cond_3

    .line 44
    .line 45
    const/4 v4, 0x4

    .line 46
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 47
    .line 48
    .line 49
    :cond_3
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->exposureTimeEnd_:J

    .line 50
    .line 51
    cmp-long v4, v0, v2

    .line 52
    .line 53
    if-eqz v4, :cond_4

    .line 54
    .line 55
    const/4 v4, 0x5

    .line 56
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 57
    .line 58
    .line 59
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userType_:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_5

    .line 66
    .line 67
    const/4 v0, 0x6

    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getUserType()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userId_:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_6

    .line 82
    .line 83
    const/4 v0, 0x7

    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getUserId()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userName_:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_7

    .line 98
    .line 99
    const/16 v0, 0x8

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getUserName()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :cond_7
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userHierarchy_:J

    .line 109
    .line 110
    cmp-long v2, v0, v2

    .line 111
    .line 112
    if-eqz v2, :cond_8

    .line 113
    .line 114
    const/16 v2, 0x9

    .line 115
    .line 116
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 117
    .line 118
    .line 119
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->userMedal_:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_9

    .line 126
    .line 127
    const/16 v0, 0xa

    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getUserMedal()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->roomId_:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-nez v0, :cond_a

    .line 143
    .line 144
    const/16 v0, 0xb

    .line 145
    .line 146
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getRoomId()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 151
    .line 152
    .line 153
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->text_:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-nez v0, :cond_b

    .line 160
    .line 161
    const/16 v0, 0xc

    .line 162
    .line 163
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getText()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 168
    .line 169
    .line 170
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->msgType_:Ljava/lang/String;

    .line 171
    .line 172
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-nez v0, :cond_c

    .line 177
    .line 178
    const/16 v0, 0xd

    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getMsgType()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 185
    .line 186
    .line 187
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->cardType_:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-nez v0, :cond_d

    .line 194
    .line 195
    const/16 v0, 0xe

    .line 196
    .line 197
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveoperationplace/LongLinkLiveTurboCard$TurboCardInfo;->getCardType()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 202
    .line 203
    .line 204
    :cond_d
    return-void
.end method
