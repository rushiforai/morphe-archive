.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUpOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoicePayGuidePopUp"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUpOrBuilder;"
    }
.end annotation


# static fields
.field public static final BUBBLETITLE_FIELD_NUMBER:I = 0x5

.field public static final BUTTONTITLE_FIELD_NUMBER:I = 0x6

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

.field public static final GIFTCOUNT_FIELD_NUMBER:I = 0xc

.field public static final GIFTICON_FIELD_NUMBER:I = 0x8

.field public static final GIFTID_FIELD_NUMBER:I = 0x7

.field public static final GUIDETYPE_FIELD_NUMBER:I = 0x9

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;",
            ">;"
        }
    .end annotation
.end field

.field public static final ROOMID_FIELD_NUMBER:I = 0x2

.field public static final SUBTITLE_FIELD_NUMBER:I = 0x4

.field public static final TITLE_FIELD_NUMBER:I = 0x3

.field public static final TOUSERMASK_FIELD_NUMBER:I = 0xa

.field public static final USERID_FIELD_NUMBER:I = 0x1

.field public static final USERTAG_FIELD_NUMBER:I = 0xb


# instance fields
.field private bubbleTitle_:Ljava/lang/String;

.field private buttonTitle_:Ljava/lang/String;

.field private giftCount_:J

.field private giftIcon_:Ljava/lang/String;

.field private giftId_:J

.field private guideType_:I

.field private roomId_:Ljava/lang/String;

.field private subTitle_:Ljava/lang/String;

.field private title_:Ljava/lang/String;

.field private toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

.field private userId_:Ljava/lang/String;

.field private userTag_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->roomId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->title_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->subTitle_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->bubbleTitle_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->buttonTitle_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftIcon_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userTag_:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setSubTitleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setTitle(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setTitleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setToUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setToUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setUserTag(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setUserTagBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic J()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->clearBubbleTitle()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->clearButtonTitle()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->clearGiftCount()V

    return-void
.end method

.method private clearBubbleTitle()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getBubbleTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->bubbleTitle_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearButtonTitle()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getButtonTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->buttonTitle_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearGiftCount()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftCount_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearGiftIcon()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGiftIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftIcon_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearGiftId()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftId_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearGuideType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->guideType_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSubTitle()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getSubTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->subTitle_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTitle()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->title_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearToUserMask()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 3
    .line 4
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserTag()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getUserTag()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userTag_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->clearGiftIcon()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->clearGiftId()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->clearGuideType()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->clearRoomId()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->clearSubTitle()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->clearTitle()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->clearToUserMask()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->clearUserTag()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->mergeToUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method private mergeToUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->newBuilder(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setBubbleTitle(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setBubbleTitleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setButtonTitle(Ljava/lang/String;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setButtonTitleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setGiftCount(J)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setGiftIcon(Ljava/lang/String;)V

    return-void
.end method

.method private setBubbleTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->bubbleTitle_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setBubbleTitleBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->bubbleTitle_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setButtonTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->buttonTitle_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setButtonTitleBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->buttonTitle_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setGiftCount(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftCount_:J

    .line 2
    .line 3
    return-void
.end method

.method private setGiftIcon(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftIcon_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setGiftIconBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftIcon_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setGiftId(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftId_:J

    .line 2
    .line 3
    return-void
.end method

.method private setGuideType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$GuideType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$GuideType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->guideType_:I

    .line 9
    .line 10
    return-void
.end method

.method private setGuideTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->guideType_:I

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSubTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->subTitle_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSubTitleBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->subTitle_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->title_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTitleBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->title_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setToUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 8
    .line 9
    return-void
.end method

.method private setToUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-void
.end method

.method private setUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserTag(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userTag_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserTagBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userTag_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setGiftIconBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setGiftId(J)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$GuideType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setGuideType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$GuideType;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setGuideTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->setSubTitle(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_4

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
    goto/16 :goto_5

    .line 74
    .line 75
    :catch_1
    move-exception v0

    .line 76
    move-object p1, v0

    .line 77
    goto/16 :goto_6

    .line 78
    .line 79
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 80
    .line 81
    .line 82
    move-result-wide v3

    .line 83
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftCount_:J

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userTag_:Ljava/lang/String;

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :sswitch_3
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 94
    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_3
    move-object p1, v1

    .line 105
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->parser()Ll/ng60;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 114
    .line 115
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 116
    .line 117
    if-eqz p1, :cond_2

    .line 118
    .line 119
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 127
    .line 128
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->guideType_:I

    .line 136
    .line 137
    goto :goto_3

    .line 138
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftIcon_:Ljava/lang/String;

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 146
    .line 147
    .line 148
    move-result-wide v3

    .line 149
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftId_:J

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->buttonTitle_:Ljava/lang/String;

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->bubbleTitle_:Ljava/lang/String;

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->subTitle_:Ljava/lang/String;

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->title_:Ljava/lang/String;

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->roomId_:Ljava/lang/String;

    .line 185
    .line 186
    goto/16 :goto_3

    .line 187
    .line 188
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 193
    .line 194
    goto/16 :goto_3

    .line 195
    .line 196
    :catchall_1
    move-exception v0

    .line 197
    move-object p0, v0

    .line 198
    throw p0

    .line 199
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 200
    .line 201
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 213
    .line 214
    .line 215
    return-object v1

    .line 216
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 221
    .line 222
    .line 223
    return-object v1

    .line 224
    :cond_4
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 225
    .line 226
    return-object p0

    .line 227
    :pswitch_3
    move-object v3, p2

    .line 228
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 229
    .line 230
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 231
    .line 232
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userId_:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userId_:Ljava/lang/String;

    .line 240
    .line 241
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userId_:Ljava/lang/String;

    .line 242
    .line 243
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    xor-int/2addr v1, v2

    .line 248
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userId_:Ljava/lang/String;

    .line 249
    .line 250
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userId_:Ljava/lang/String;

    .line 255
    .line 256
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->roomId_:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->roomId_:Ljava/lang/String;

    .line 264
    .line 265
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->roomId_:Ljava/lang/String;

    .line 266
    .line 267
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 268
    .line 269
    .line 270
    move-result v1

    .line 271
    xor-int/2addr v1, v2

    .line 272
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->roomId_:Ljava/lang/String;

    .line 273
    .line 274
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->roomId_:Ljava/lang/String;

    .line 279
    .line 280
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->title_:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->title_:Ljava/lang/String;

    .line 288
    .line 289
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->title_:Ljava/lang/String;

    .line 290
    .line 291
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 292
    .line 293
    .line 294
    move-result v1

    .line 295
    xor-int/2addr v1, v2

    .line 296
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->title_:Ljava/lang/String;

    .line 297
    .line 298
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object p1

    .line 302
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->title_:Ljava/lang/String;

    .line 303
    .line 304
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->subTitle_:Ljava/lang/String;

    .line 305
    .line 306
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 307
    .line 308
    .line 309
    move-result p1

    .line 310
    xor-int/2addr p1, v2

    .line 311
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->subTitle_:Ljava/lang/String;

    .line 312
    .line 313
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->subTitle_:Ljava/lang/String;

    .line 314
    .line 315
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    xor-int/2addr v1, v2

    .line 320
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->subTitle_:Ljava/lang/String;

    .line 321
    .line 322
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object p1

    .line 326
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->subTitle_:Ljava/lang/String;

    .line 327
    .line 328
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->bubbleTitle_:Ljava/lang/String;

    .line 329
    .line 330
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 331
    .line 332
    .line 333
    move-result p1

    .line 334
    xor-int/2addr p1, v2

    .line 335
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->bubbleTitle_:Ljava/lang/String;

    .line 336
    .line 337
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->bubbleTitle_:Ljava/lang/String;

    .line 338
    .line 339
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 340
    .line 341
    .line 342
    move-result v1

    .line 343
    xor-int/2addr v1, v2

    .line 344
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->bubbleTitle_:Ljava/lang/String;

    .line 345
    .line 346
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object p1

    .line 350
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->bubbleTitle_:Ljava/lang/String;

    .line 351
    .line 352
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->buttonTitle_:Ljava/lang/String;

    .line 353
    .line 354
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 355
    .line 356
    .line 357
    move-result p1

    .line 358
    xor-int/2addr p1, v2

    .line 359
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->buttonTitle_:Ljava/lang/String;

    .line 360
    .line 361
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->buttonTitle_:Ljava/lang/String;

    .line 362
    .line 363
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 364
    .line 365
    .line 366
    move-result v1

    .line 367
    xor-int/2addr v1, v2

    .line 368
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->buttonTitle_:Ljava/lang/String;

    .line 369
    .line 370
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->buttonTitle_:Ljava/lang/String;

    .line 375
    .line 376
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftId_:J

    .line 377
    .line 378
    const-wide/16 p1, 0x0

    .line 379
    .line 380
    cmp-long v1, v5, p1

    .line 381
    .line 382
    if-eqz v1, :cond_5

    .line 383
    .line 384
    move v4, v2

    .line 385
    goto :goto_7

    .line 386
    :cond_5
    move v4, v0

    .line 387
    :goto_7
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftId_:J

    .line 388
    .line 389
    cmp-long v1, v8, p1

    .line 390
    .line 391
    if-eqz v1, :cond_6

    .line 392
    .line 393
    move v7, v2

    .line 394
    goto :goto_8

    .line 395
    :cond_6
    move v7, v0

    .line 396
    :goto_8
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 397
    .line 398
    .line 399
    move-result-wide v4

    .line 400
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftId_:J

    .line 401
    .line 402
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftIcon_:Ljava/lang/String;

    .line 403
    .line 404
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 405
    .line 406
    .line 407
    move-result v1

    .line 408
    xor-int/2addr v1, v2

    .line 409
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftIcon_:Ljava/lang/String;

    .line 410
    .line 411
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftIcon_:Ljava/lang/String;

    .line 412
    .line 413
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 414
    .line 415
    .line 416
    move-result v5

    .line 417
    xor-int/2addr v5, v2

    .line 418
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftIcon_:Ljava/lang/String;

    .line 419
    .line 420
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 421
    .line 422
    .line 423
    move-result-object v1

    .line 424
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftIcon_:Ljava/lang/String;

    .line 425
    .line 426
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->guideType_:I

    .line 427
    .line 428
    if-eqz v1, :cond_7

    .line 429
    .line 430
    move v4, v2

    .line 431
    goto :goto_9

    .line 432
    :cond_7
    move v4, v0

    .line 433
    :goto_9
    iget v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->guideType_:I

    .line 434
    .line 435
    if-eqz v5, :cond_8

    .line 436
    .line 437
    move v6, v2

    .line 438
    goto :goto_a

    .line 439
    :cond_8
    move v6, v0

    .line 440
    :goto_a
    invoke-interface {v3, v4, v1, v6, v5}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 441
    .line 442
    .line 443
    move-result v1

    .line 444
    iput v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->guideType_:I

    .line 445
    .line 446
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 447
    .line 448
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 449
    .line 450
    invoke-interface {v3, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 451
    .line 452
    .line 453
    move-result-object v1

    .line 454
    check-cast v1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 455
    .line 456
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 457
    .line 458
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userTag_:Ljava/lang/String;

    .line 459
    .line 460
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 461
    .line 462
    .line 463
    move-result v1

    .line 464
    xor-int/2addr v1, v2

    .line 465
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userTag_:Ljava/lang/String;

    .line 466
    .line 467
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userTag_:Ljava/lang/String;

    .line 468
    .line 469
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 470
    .line 471
    .line 472
    move-result v5

    .line 473
    xor-int/2addr v5, v2

    .line 474
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userTag_:Ljava/lang/String;

    .line 475
    .line 476
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 477
    .line 478
    .line 479
    move-result-object v1

    .line 480
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userTag_:Ljava/lang/String;

    .line 481
    .line 482
    move v1, v0

    .line 483
    move v4, v2

    .line 484
    move-object v0, v3

    .line 485
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftCount_:J

    .line 486
    .line 487
    cmp-long v5, v2, p1

    .line 488
    .line 489
    if-eqz v5, :cond_9

    .line 490
    .line 491
    move v5, v1

    .line 492
    move v1, v4

    .line 493
    goto :goto_b

    .line 494
    :cond_9
    move v5, v1

    .line 495
    :goto_b
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftCount_:J

    .line 496
    .line 497
    cmp-long p1, v6, p1

    .line 498
    .line 499
    if-eqz p1, :cond_a

    .line 500
    .line 501
    :goto_c
    move-wide v5, v6

    .line 502
    goto :goto_d

    .line 503
    :cond_a
    move v4, v5

    .line 504
    goto :goto_c

    .line 505
    :goto_d
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 506
    .line 507
    .line 508
    move-result-wide p1

    .line 509
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftCount_:J

    .line 510
    .line 511
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 512
    .line 513
    return-object p0

    .line 514
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp$Builder;

    .line 515
    .line 516
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp$Builder;-><init>(Ll/b4w;)V

    .line 517
    .line 518
    .line 519
    return-object p0

    .line 520
    :pswitch_5
    return-object v1

    .line 521
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 522
    .line 523
    return-object p0

    .line 524
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;

    .line 525
    .line 526
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;-><init>()V

    .line 527
    .line 528
    .line 529
    return-object p0

    .line 530
    nop

    .line 531
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
    .line 542
    .line 543
    .line 544
    .line 545
    .line 546
    .line 547
    .line 548
    .line 549
    .line 550
    .line 551
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_c
        0x12 -> :sswitch_b
        0x1a -> :sswitch_a
        0x22 -> :sswitch_9
        0x2a -> :sswitch_8
        0x32 -> :sswitch_7
        0x38 -> :sswitch_6
        0x42 -> :sswitch_5
        0x48 -> :sswitch_4
        0x52 -> :sswitch_3
        0x5a -> :sswitch_2
        0x60 -> :sswitch_1
    .end sparse-switch
.end method

.method public getBubbleTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->bubbleTitle_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBubbleTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->bubbleTitle_:Ljava/lang/String;

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

.method public getButtonTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->buttonTitle_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getButtonTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->buttonTitle_:Ljava/lang/String;

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

.method public getGiftCount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftCount_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getGiftIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftIcon_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGiftIconBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftIcon_:Ljava/lang/String;

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

.method public getGiftId()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftId_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getGuideType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$GuideType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->guideType_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$GuideType;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$GuideType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$GuideType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$GuideType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getGuideTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->guideType_:I

    .line 2
    .line 3
    return p0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->roomId_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getUserId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getRoomId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->title_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getTitle()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->subTitle_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getSubTitle()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->bubbleTitle_:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-nez v1, :cond_5

    .line 87
    .line 88
    const/4 v1, 0x5

    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getBubbleTitle()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    add-int/2addr v0, v1

    .line 98
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->buttonTitle_:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_6

    .line 105
    .line 106
    const/4 v1, 0x6

    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getButtonTitle()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    add-int/2addr v0, v1

    .line 116
    :cond_6
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftId_:J

    .line 117
    .line 118
    const-wide/16 v3, 0x0

    .line 119
    .line 120
    cmp-long v5, v1, v3

    .line 121
    .line 122
    if-eqz v5, :cond_7

    .line 123
    .line 124
    const/4 v5, 0x7

    .line 125
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    add-int/2addr v0, v1

    .line 130
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftIcon_:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-nez v1, :cond_8

    .line 137
    .line 138
    const/16 v1, 0x8

    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGiftIcon()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    add-int/2addr v0, v1

    .line 149
    :cond_8
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->guideType_:I

    .line 150
    .line 151
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$GuideType;->empty:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$GuideType;

    .line 152
    .line 153
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$GuideType;->getNumber()I

    .line 154
    .line 155
    .line 156
    move-result v2

    .line 157
    if-eq v1, v2, :cond_9

    .line 158
    .line 159
    const/16 v1, 0x9

    .line 160
    .line 161
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->guideType_:I

    .line 162
    .line 163
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    add-int/2addr v0, v1

    .line 168
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 169
    .line 170
    if-eqz v1, :cond_a

    .line 171
    .line 172
    const/16 v1, 0xa

    .line 173
    .line 174
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getToUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    add-int/2addr v0, v1

    .line 183
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userTag_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getUserTag()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftCount_:J

    .line 203
    .line 204
    cmp-long v3, v1, v3

    .line 205
    .line 206
    if-eqz v3, :cond_c

    .line 207
    .line 208
    const/16 v3, 0xc

    .line 209
    .line 210
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    add-int/2addr v0, v1

    .line 215
    :cond_c
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 216
    .line 217
    return v0
.end method

.method public getSubTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->subTitle_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSubTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->subTitle_:Ljava/lang/String;

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

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->title_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->title_:Ljava/lang/String;

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

.method public getToUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userId_:Ljava/lang/String;

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

.method public getUserTag()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userTag_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserTagBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userTag_:Ljava/lang/String;

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

.method public hasToUserMask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getRoomId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->title_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getTitle()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->subTitle_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getSubTitle()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->bubbleTitle_:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_4

    .line 72
    .line 73
    const/4 v0, 0x5

    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getBubbleTitle()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->buttonTitle_:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_5

    .line 88
    .line 89
    const/4 v0, 0x6

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getButtonTitle()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_5
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftId_:J

    .line 98
    .line 99
    const-wide/16 v2, 0x0

    .line 100
    .line 101
    cmp-long v4, v0, v2

    .line 102
    .line 103
    if-eqz v4, :cond_6

    .line 104
    .line 105
    const/4 v4, 0x7

    .line 106
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 107
    .line 108
    .line 109
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftIcon_:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_7

    .line 116
    .line 117
    const/16 v0, 0x8

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getGiftIcon()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 124
    .line 125
    .line 126
    :cond_7
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->guideType_:I

    .line 127
    .line 128
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$GuideType;->empty:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$GuideType;

    .line 129
    .line 130
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$GuideType;->getNumber()I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-eq v0, v1, :cond_8

    .line 135
    .line 136
    const/16 v0, 0x9

    .line 137
    .line 138
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->guideType_:I

    .line 139
    .line 140
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 141
    .line 142
    .line 143
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->toUserMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 144
    .line 145
    if-eqz v0, :cond_9

    .line 146
    .line 147
    const/16 v0, 0xa

    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getToUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 154
    .line 155
    .line 156
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->userTag_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->getUserTag()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuidePopUp;->giftCount_:J

    .line 174
    .line 175
    cmp-long p0, v0, v2

    .line 176
    .line 177
    if-eqz p0, :cond_b

    .line 178
    .line 179
    const/16 p0, 0xc

    .line 180
    .line 181
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 182
    .line 183
    .line 184
    :cond_b
    return-void
.end method
