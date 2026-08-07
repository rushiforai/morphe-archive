.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PlayInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfoOrBuilder;"
    }
.end annotation


# static fields
.field public static final AUTHOR_FIELD_NUMBER:I = 0xc

.field public static final BESTSINGERNAME_FIELD_NUMBER:I = 0x16

.field public static final COVER_FIELD_NUMBER:I = 0xd

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

.field public static final DURATIONSECOND_FIELD_NUMBER:I = 0xb

.field public static final GIFTUV_FIELD_NUMBER:I = 0x18

.field public static final LEVELTIP_FIELD_NUMBER:I = 0x13

.field public static final LEVEL_FIELD_NUMBER:I = 0x11

.field public static final LYRICTYPE_FIELD_NUMBER:I = 0x7

.field public static final LYRICURL_FIELD_NUMBER:I = 0x6

.field public static final MASK_FIELD_NUMBER:I = 0x4

.field public static final MAXLEVEL_FIELD_NUMBER:I = 0x12

.field public static final NEXTLEVELGIFTUV_FIELD_NUMBER:I = 0x19

.field public static final ORDERID_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final PREPAREREMAINSECONDS_FIELD_NUMBER:I = 0x9

.field public static final PROVIDER_FIELD_NUMBER:I = 0xf

.field public static final QUICKGIFTINFO_FIELD_NUMBER:I = 0xe

.field public static final SCHEMA_FIELD_NUMBER:I = 0x15

.field public static final SCORE_FIELD_NUMBER:I = 0x14

.field public static final SHOWBGSVGAURL_FIELD_NUMBER:I = 0x17

.field public static final SHOWLEVEL_FIELD_NUMBER:I = 0x10

.field public static final SONGCODE_FIELD_NUMBER:I = 0x2

.field public static final SONGURL_FIELD_NUMBER:I = 0x8

.field public static final STATUS_FIELD_NUMBER:I = 0xa

.field public static final TITLE_FIELD_NUMBER:I = 0x5

.field public static final USERID_FIELD_NUMBER:I = 0x3


# instance fields
.field private author_:Ljava/lang/String;

.field private bestSingerName_:Ljava/lang/String;

.field private cover_:Ljava/lang/String;

.field private durationSecond_:I

.field private giftUv_:I

.field private levelTip_:Ljava/lang/String;

.field private level_:I

.field private lyricType_:Ljava/lang/String;

.field private lyricUrl_:Ljava/lang/String;

.field private mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

.field private maxLevel_:I

.field private nextLevelGiftUv_:I

.field private orderId_:Ljava/lang/String;

.field private prepareRemainSeconds_:I

.field private provider_:Ljava/lang/String;

.field private quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

.field private schema_:Ljava/lang/String;

.field private score_:J

.field private showBgSvgaUrl_:Ljava/lang/String;

.field private showLevel_:Z

.field private songCode_:Ljava/lang/String;

.field private songUrl_:Ljava/lang/String;

.field private status_:Ljava/lang/String;

.field private title_:Ljava/lang/String;

.field private userId_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->orderId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songCode_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->userId_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->title_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricUrl_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricType_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songUrl_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->status_:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->author_:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->cover_:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->provider_:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->levelTip_:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->schema_:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->bestSingerName_:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showBgSvgaUrl_:Ljava/lang/String;

    .line 35
    .line 36
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mergeQuickGiftInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setAuthor(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setAuthorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setBestSingerName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setBestSingerNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setCover(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setCoverBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setDurationSecond(I)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setGiftUv(I)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setLevel(I)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setLevelTip(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setLevelTipBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setLyricType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setLyricTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setLyricUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setLyricUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic Q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setMaxLevel(I)V

    return-void
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setNextLevelGiftUv(I)V

    return-void
.end method

.method public static bridge synthetic U(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setOrderId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic V(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setOrderIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic W(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setPrepareRemainSeconds(I)V

    return-void
.end method

.method public static bridge synthetic X(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setProvider(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic Y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setProviderBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic Z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setQuickGiftInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo$Builder;)V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearAuthor()V

    return-void
.end method

.method public static bridge synthetic a0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setQuickGiftInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearBestSingerName()V

    return-void
.end method

.method public static bridge synthetic b0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setSchema(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearCover()V

    return-void
.end method

.method public static bridge synthetic c0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setSchemaBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private clearAuthor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getAuthor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->author_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearBestSingerName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getBestSingerName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->bestSingerName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearCover()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getCover()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->cover_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearDurationSecond()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->durationSecond_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearGiftUv()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->giftUv_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearLevel()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->level_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearLevelTip()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getLevelTip()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->levelTip_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLyricType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getLyricType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLyricUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getLyricUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearMask()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 3
    .line 4
    return-void
.end method

.method private clearMaxLevel()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->maxLevel_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearNextLevelGiftUv()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->nextLevelGiftUv_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearOrderId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getOrderId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->orderId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPrepareRemainSeconds()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->prepareRemainSeconds_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearProvider()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getProvider()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->provider_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearQuickGiftInfo()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 3
    .line 4
    return-void
.end method

.method private clearSchema()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getSchema()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->schema_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearScore()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->score_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearShowBgSvgaUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getShowBgSvgaUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showBgSvgaUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearShowLevel()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showLevel_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearSongCode()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getSongCode()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songCode_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSongUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getSongUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearStatus()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getStatus()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->status_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTitle()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->title_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearDurationSecond()V

    return-void
.end method

.method public static bridge synthetic d0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setScore(J)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearGiftUv()V

    return-void
.end method

.method public static bridge synthetic e0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setShowBgSvgaUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearLevel()V

    return-void
.end method

.method public static bridge synthetic f0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setShowBgSvgaUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearLevelTip()V

    return-void
.end method

.method public static bridge synthetic g0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setShowLevel(Z)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearLyricType()V

    return-void
.end method

.method public static bridge synthetic h0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setSongCode(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearLyricUrl()V

    return-void
.end method

.method public static bridge synthetic i0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setSongCodeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearMask()V

    return-void
.end method

.method public static bridge synthetic j0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setSongUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearMaxLevel()V

    return-void
.end method

.method public static bridge synthetic k0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setSongUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearNextLevelGiftUv()V

    return-void
.end method

.method public static bridge synthetic l0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setStatus(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearOrderId()V

    return-void
.end method

.method public static bridge synthetic m0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setStatusBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private mergeMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 33
    .line 34
    return-void
.end method

.method private mergeQuickGiftInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;->newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearPrepareRemainSeconds()V

    return-void
.end method

.method public static bridge synthetic n0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setTitle(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearProvider()V

    return-void
.end method

.method public static bridge synthetic o0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setTitleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearQuickGiftInfo()V

    return-void
.end method

.method public static bridge synthetic p0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearSchema()V

    return-void
.end method

.method public static bridge synthetic q0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearScore()V

    return-void
.end method

.method public static bridge synthetic r0()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    return-object v0
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearShowBgSvgaUrl()V

    return-void
.end method

.method private setAuthor(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->author_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAuthorBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->author_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setBestSingerName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->bestSingerName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setBestSingerNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->bestSingerName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setCover(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->cover_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setCoverBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->cover_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setDurationSecond(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->durationSecond_:I

    .line 2
    .line 3
    return-void
.end method

.method private setGiftUv(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->giftUv_:I

    .line 2
    .line 3
    return-void
.end method

.method private setLevel(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->level_:I

    .line 2
    .line 3
    return-void
.end method

.method private setLevelTip(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->levelTip_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLevelTipBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->levelTip_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLyricType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLyricTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLyricUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLyricUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 8
    .line 9
    return-void
.end method

.method private setMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-void
.end method

.method private setMaxLevel(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->maxLevel_:I

    .line 2
    .line 3
    return-void
.end method

.method private setNextLevelGiftUv(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->nextLevelGiftUv_:I

    .line 2
    .line 3
    return-void
.end method

.method private setOrderId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->orderId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOrderIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->orderId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPrepareRemainSeconds(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->prepareRemainSeconds_:I

    .line 2
    .line 3
    return-void
.end method

.method private setProvider(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->provider_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setProviderBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->provider_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setQuickGiftInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 8
    .line 9
    return-void
.end method

.method private setQuickGiftInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    return-void
.end method

.method private setSchema(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->schema_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSchemaBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->schema_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setScore(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->score_:J

    .line 2
    .line 3
    return-void
.end method

.method private setShowBgSvgaUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showBgSvgaUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setShowBgSvgaUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showBgSvgaUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setShowLevel(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showLevel_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setSongCode(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songCode_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSongCodeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songCode_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSongUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSongUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setStatus(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->status_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setStatusBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->status_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->title_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->title_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearShowLevel()V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearSongCode()V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearSongUrl()V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearStatus()V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearTitle()V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mergeMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->PARSER:Ll/ng60;

    if-nez p0, :cond_1

    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    monitor-enter p0

    .line 4
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->PARSER:Ll/ng60;

    if-nez p1, :cond_0

    .line 5
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->PARSER:Ll/ng60;

    return-object p0

    .line 8
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 9
    check-cast p3, Lcom/google/protobuf/h;

    :cond_2
    :goto_3
    if-nez v0, :cond_5

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

    goto/16 :goto_6

    :catch_1
    move-exception v0

    move-object p1, v0

    goto/16 :goto_7

    .line 12
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->nextLevelGiftUv_:I

    goto :goto_3

    .line 13
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->giftUv_:I

    goto :goto_3

    .line 14
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showBgSvgaUrl_:Ljava/lang/String;

    goto :goto_3

    .line 16
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->bestSingerName_:Ljava/lang/String;

    goto :goto_3

    .line 18
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->schema_:Ljava/lang/String;

    goto :goto_3

    .line 20
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->score_:J

    goto :goto_3

    .line 21
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->levelTip_:Ljava/lang/String;

    goto :goto_3

    .line 23
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->maxLevel_:I

    goto :goto_3

    .line 24
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->level_:I

    goto :goto_3

    .line 25
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showLevel_:Z

    goto :goto_3

    .line 26
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->provider_:Ljava/lang/String;

    goto :goto_3

    .line 28
    :sswitch_c
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    if-eqz p1, :cond_3

    .line 29
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo$Builder;

    goto :goto_4

    :cond_3
    move-object p1, v1

    .line 30
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;->parser()Ll/ng60;

    move-result-object v3

    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    if-eqz p1, :cond_2

    .line 31
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 32
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    goto/16 :goto_3

    .line 33
    :sswitch_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->cover_:Ljava/lang/String;

    goto/16 :goto_3

    .line 35
    :sswitch_e
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 36
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->author_:Ljava/lang/String;

    goto/16 :goto_3

    .line 37
    :sswitch_f
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->durationSecond_:I

    goto/16 :goto_3

    .line 38
    :sswitch_10
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->status_:Ljava/lang/String;

    goto/16 :goto_3

    .line 40
    :sswitch_11
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->prepareRemainSeconds_:I

    goto/16 :goto_3

    .line 41
    :sswitch_12
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songUrl_:Ljava/lang/String;

    goto/16 :goto_3

    .line 43
    :sswitch_13
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricType_:Ljava/lang/String;

    goto/16 :goto_3

    .line 45
    :sswitch_14
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 46
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricUrl_:Ljava/lang/String;

    goto/16 :goto_3

    .line 47
    :sswitch_15
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 48
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->title_:Ljava/lang/String;

    goto/16 :goto_3

    .line 49
    :sswitch_16
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    if-eqz p1, :cond_4

    .line 50
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    goto :goto_5

    :cond_4
    move-object p1, v1

    .line 51
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->parser()Ll/ng60;

    move-result-object v3

    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    if-eqz p1, :cond_2

    .line 52
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 53
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    goto/16 :goto_3

    .line 54
    :sswitch_17
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 55
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->userId_:Ljava/lang/String;

    goto/16 :goto_3

    .line 56
    :sswitch_18
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 57
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songCode_:Ljava/lang/String;

    goto/16 :goto_3

    .line 58
    :sswitch_19
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    move-result-object p1

    .line 59
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->orderId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto/16 :goto_3

    :catchall_1
    move-exception v0

    move-object p0, v0

    .line 60
    throw p0

    .line 61
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 62
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    return-object v1

    .line 63
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    move-result-object p0

    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    return-object v1

    .line 64
    :cond_5
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    return-object p0

    .line 65
    :pswitch_3
    move-object v3, p2

    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 66
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 67
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->orderId_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->orderId_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->orderId_:Ljava/lang/String;

    .line 68
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->orderId_:Ljava/lang/String;

    .line 69
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->orderId_:Ljava/lang/String;

    .line 70
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songCode_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songCode_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songCode_:Ljava/lang/String;

    .line 71
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songCode_:Ljava/lang/String;

    .line 72
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songCode_:Ljava/lang/String;

    .line 73
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->userId_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->userId_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->userId_:Ljava/lang/String;

    .line 74
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->userId_:Ljava/lang/String;

    .line 75
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->userId_:Ljava/lang/String;

    .line 76
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 77
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->title_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->title_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->title_:Ljava/lang/String;

    .line 78
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->title_:Ljava/lang/String;

    .line 79
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->title_:Ljava/lang/String;

    .line 80
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricUrl_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricUrl_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricUrl_:Ljava/lang/String;

    .line 81
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricUrl_:Ljava/lang/String;

    .line 82
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricUrl_:Ljava/lang/String;

    .line 83
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricType_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricType_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricType_:Ljava/lang/String;

    .line 84
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricType_:Ljava/lang/String;

    .line 85
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricType_:Ljava/lang/String;

    .line 86
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songUrl_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songUrl_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songUrl_:Ljava/lang/String;

    .line 87
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songUrl_:Ljava/lang/String;

    .line 88
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songUrl_:Ljava/lang/String;

    .line 89
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->prepareRemainSeconds_:I

    if-eqz p1, :cond_6

    move p2, v2

    goto :goto_8

    :cond_6
    move p2, v0

    :goto_8
    iget v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->prepareRemainSeconds_:I

    if-eqz v1, :cond_7

    move v4, v2

    goto :goto_9

    :cond_7
    move v4, v0

    :goto_9
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->prepareRemainSeconds_:I

    .line 90
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->status_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->status_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->status_:Ljava/lang/String;

    .line 91
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->status_:Ljava/lang/String;

    .line 92
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->status_:Ljava/lang/String;

    .line 93
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->durationSecond_:I

    if-eqz p1, :cond_8

    move p2, v2

    goto :goto_a

    :cond_8
    move p2, v0

    :goto_a
    iget v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->durationSecond_:I

    if-eqz v1, :cond_9

    move v4, v2

    goto :goto_b

    :cond_9
    move v4, v0

    :goto_b
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->durationSecond_:I

    .line 94
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->author_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->author_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->author_:Ljava/lang/String;

    .line 95
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->author_:Ljava/lang/String;

    .line 96
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->author_:Ljava/lang/String;

    .line 97
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->cover_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->cover_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->cover_:Ljava/lang/String;

    .line 98
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->cover_:Ljava/lang/String;

    .line 99
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->cover_:Ljava/lang/String;

    .line 100
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 101
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->provider_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->provider_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->provider_:Ljava/lang/String;

    .line 102
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->provider_:Ljava/lang/String;

    .line 103
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->provider_:Ljava/lang/String;

    .line 104
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showLevel_:Z

    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showLevel_:Z

    invoke-interface {v3, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    move-result p1

    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showLevel_:Z

    .line 105
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->level_:I

    if-eqz p1, :cond_a

    move p2, v2

    goto :goto_c

    :cond_a
    move p2, v0

    :goto_c
    iget v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->level_:I

    if-eqz v1, :cond_b

    move v4, v2

    goto :goto_d

    :cond_b
    move v4, v0

    :goto_d
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->level_:I

    .line 106
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->maxLevel_:I

    if-eqz p1, :cond_c

    move p2, v2

    goto :goto_e

    :cond_c
    move p2, v0

    :goto_e
    iget v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->maxLevel_:I

    if-eqz v1, :cond_d

    move v4, v2

    goto :goto_f

    :cond_d
    move v4, v0

    :goto_f
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->maxLevel_:I

    .line 107
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->levelTip_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->levelTip_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->levelTip_:Ljava/lang/String;

    .line 108
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->levelTip_:Ljava/lang/String;

    .line 109
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->levelTip_:Ljava/lang/String;

    .line 110
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->score_:J

    const-wide/16 p1, 0x0

    cmp-long v1, v5, p1

    if-eqz v1, :cond_e

    move v4, v2

    goto :goto_10

    :cond_e
    move v4, v0

    :goto_10
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->score_:J

    cmp-long p1, v8, p1

    if-eqz p1, :cond_f

    move v7, v2

    goto :goto_11

    :cond_f
    move v7, v0

    :goto_11
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->score_:J

    .line 111
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->schema_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->schema_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->schema_:Ljava/lang/String;

    .line 112
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->schema_:Ljava/lang/String;

    .line 113
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->schema_:Ljava/lang/String;

    .line 114
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->bestSingerName_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->bestSingerName_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->bestSingerName_:Ljava/lang/String;

    .line 115
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->bestSingerName_:Ljava/lang/String;

    .line 116
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->bestSingerName_:Ljava/lang/String;

    .line 117
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showBgSvgaUrl_:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    xor-int/2addr p1, v2

    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showBgSvgaUrl_:Ljava/lang/String;

    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showBgSvgaUrl_:Ljava/lang/String;

    .line 118
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showBgSvgaUrl_:Ljava/lang/String;

    .line 119
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showBgSvgaUrl_:Ljava/lang/String;

    .line 120
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->giftUv_:I

    if-eqz p1, :cond_10

    move p2, v2

    goto :goto_12

    :cond_10
    move p2, v0

    :goto_12
    iget v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->giftUv_:I

    if-eqz v1, :cond_11

    move v4, v2

    goto :goto_13

    :cond_11
    move v4, v0

    :goto_13
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->giftUv_:I

    .line 121
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->nextLevelGiftUv_:I

    if-eqz p1, :cond_12

    move p2, v2

    goto :goto_14

    :cond_12
    move p2, v0

    :goto_14
    iget p3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->nextLevelGiftUv_:I

    if-eqz p3, :cond_13

    move v0, v2

    :cond_13
    invoke-interface {v3, p2, p1, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->nextLevelGiftUv_:I

    .line 122
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    return-object p0

    .line 123
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo$Builder;

    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo$Builder;-><init>(Ll/d4w;)V

    return-object p0

    :pswitch_5
    return-object v1

    .line 124
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    return-object p0

    .line 125
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;-><init>()V

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
        0xa -> :sswitch_19
        0x12 -> :sswitch_18
        0x1a -> :sswitch_17
        0x22 -> :sswitch_16
        0x2a -> :sswitch_15
        0x32 -> :sswitch_14
        0x3a -> :sswitch_13
        0x42 -> :sswitch_12
        0x48 -> :sswitch_11
        0x52 -> :sswitch_10
        0x58 -> :sswitch_f
        0x62 -> :sswitch_e
        0x6a -> :sswitch_d
        0x72 -> :sswitch_c
        0x7a -> :sswitch_b
        0x80 -> :sswitch_a
        0x88 -> :sswitch_9
        0x90 -> :sswitch_8
        0x9a -> :sswitch_7
        0xa0 -> :sswitch_6
        0xaa -> :sswitch_5
        0xb2 -> :sswitch_4
        0xba -> :sswitch_3
        0xc0 -> :sswitch_2
        0xc8 -> :sswitch_1
    .end sparse-switch
.end method

.method public getAuthor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->author_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAuthorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->author_:Ljava/lang/String;

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

.method public getBestSingerName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->bestSingerName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBestSingerNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->bestSingerName_:Ljava/lang/String;

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

.method public getCover()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->cover_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCoverBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->cover_:Ljava/lang/String;

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

.method public getDurationSecond()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->durationSecond_:I

    .line 2
    .line 3
    return p0
.end method

.method public getGiftUv()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->giftUv_:I

    .line 2
    .line 3
    return p0
.end method

.method public getLevel()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->level_:I

    .line 2
    .line 3
    return p0
.end method

.method public getLevelTip()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->levelTip_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLevelTipBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->levelTip_:Ljava/lang/String;

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

.method public getLyricType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLyricTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricType_:Ljava/lang/String;

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

.method public getLyricUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLyricUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricUrl_:Ljava/lang/String;

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

.method public getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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

.method public getMaxLevel()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->maxLevel_:I

    .line 2
    .line 3
    return p0
.end method

.method public getNextLevelGiftUv()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->nextLevelGiftUv_:I

    .line 2
    .line 3
    return p0
.end method

.method public getOrderId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->orderId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOrderIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->orderId_:Ljava/lang/String;

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

.method public getPrepareRemainSeconds()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->prepareRemainSeconds_:I

    .line 2
    .line 3
    return p0
.end method

.method public getProvider()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->provider_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProviderBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->provider_:Ljava/lang/String;

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

.method public getQuickGiftInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getSchema()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->schema_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSchemaBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->schema_:Ljava/lang/String;

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

.method public getScore()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->score_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getSerializedSize()I
    .locals 5

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->orderId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getOrderId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songCode_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getSongCode()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getUserId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    const/4 v1, 0x4

    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    add-int/2addr v0, v1

    .line 76
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->title_:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-nez v1, :cond_5

    .line 83
    .line 84
    const/4 v1, 0x5

    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getTitle()Ljava/lang/String;

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
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricUrl_:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_6

    .line 101
    .line 102
    const/4 v1, 0x6

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getLyricUrl()Ljava/lang/String;

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
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricType_:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-nez v1, :cond_7

    .line 119
    .line 120
    const/4 v1, 0x7

    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getLyricType()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    add-int/2addr v0, v1

    .line 130
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getSongUrl()Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->prepareRemainSeconds_:I

    .line 150
    .line 151
    if-eqz v1, :cond_9

    .line 152
    .line 153
    const/16 v2, 0x9

    .line 154
    .line 155
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    add-int/2addr v0, v1

    .line 160
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->status_:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    if-nez v1, :cond_a

    .line 167
    .line 168
    const/16 v1, 0xa

    .line 169
    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getStatus()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    add-int/2addr v0, v1

    .line 179
    :cond_a
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->durationSecond_:I

    .line 180
    .line 181
    if-eqz v1, :cond_b

    .line 182
    .line 183
    const/16 v2, 0xb

    .line 184
    .line 185
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    add-int/2addr v0, v1

    .line 190
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->author_:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    if-nez v1, :cond_c

    .line 197
    .line 198
    const/16 v1, 0xc

    .line 199
    .line 200
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getAuthor()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    add-int/2addr v0, v1

    .line 209
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->cover_:Ljava/lang/String;

    .line 210
    .line 211
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    if-nez v1, :cond_d

    .line 216
    .line 217
    const/16 v1, 0xd

    .line 218
    .line 219
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getCover()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    add-int/2addr v0, v1

    .line 228
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 229
    .line 230
    if-eqz v1, :cond_e

    .line 231
    .line 232
    const/16 v1, 0xe

    .line 233
    .line 234
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getQuickGiftInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 239
    .line 240
    .line 241
    move-result v1

    .line 242
    add-int/2addr v0, v1

    .line 243
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->provider_:Ljava/lang/String;

    .line 244
    .line 245
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    if-nez v1, :cond_f

    .line 250
    .line 251
    const/16 v1, 0xf

    .line 252
    .line 253
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getProvider()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    add-int/2addr v0, v1

    .line 262
    :cond_f
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showLevel_:Z

    .line 263
    .line 264
    if-eqz v1, :cond_10

    .line 265
    .line 266
    const/16 v2, 0x10

    .line 267
    .line 268
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    add-int/2addr v0, v1

    .line 273
    :cond_10
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->level_:I

    .line 274
    .line 275
    if-eqz v1, :cond_11

    .line 276
    .line 277
    const/16 v2, 0x11

    .line 278
    .line 279
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    add-int/2addr v0, v1

    .line 284
    :cond_11
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->maxLevel_:I

    .line 285
    .line 286
    if-eqz v1, :cond_12

    .line 287
    .line 288
    const/16 v2, 0x12

    .line 289
    .line 290
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    add-int/2addr v0, v1

    .line 295
    :cond_12
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->levelTip_:Ljava/lang/String;

    .line 296
    .line 297
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 298
    .line 299
    .line 300
    move-result v1

    .line 301
    if-nez v1, :cond_13

    .line 302
    .line 303
    const/16 v1, 0x13

    .line 304
    .line 305
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getLevelTip()Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 310
    .line 311
    .line 312
    move-result v1

    .line 313
    add-int/2addr v0, v1

    .line 314
    :cond_13
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->score_:J

    .line 315
    .line 316
    const-wide/16 v3, 0x0

    .line 317
    .line 318
    cmp-long v3, v1, v3

    .line 319
    .line 320
    if-eqz v3, :cond_14

    .line 321
    .line 322
    const/16 v3, 0x14

    .line 323
    .line 324
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 325
    .line 326
    .line 327
    move-result v1

    .line 328
    add-int/2addr v0, v1

    .line 329
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->schema_:Ljava/lang/String;

    .line 330
    .line 331
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 332
    .line 333
    .line 334
    move-result v1

    .line 335
    if-nez v1, :cond_15

    .line 336
    .line 337
    const/16 v1, 0x15

    .line 338
    .line 339
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getSchema()Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object v2

    .line 343
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 344
    .line 345
    .line 346
    move-result v1

    .line 347
    add-int/2addr v0, v1

    .line 348
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->bestSingerName_:Ljava/lang/String;

    .line 349
    .line 350
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 351
    .line 352
    .line 353
    move-result v1

    .line 354
    if-nez v1, :cond_16

    .line 355
    .line 356
    const/16 v1, 0x16

    .line 357
    .line 358
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getBestSingerName()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v2

    .line 362
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 363
    .line 364
    .line 365
    move-result v1

    .line 366
    add-int/2addr v0, v1

    .line 367
    :cond_16
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showBgSvgaUrl_:Ljava/lang/String;

    .line 368
    .line 369
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 370
    .line 371
    .line 372
    move-result v1

    .line 373
    if-nez v1, :cond_17

    .line 374
    .line 375
    const/16 v1, 0x17

    .line 376
    .line 377
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getShowBgSvgaUrl()Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object v2

    .line 381
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 382
    .line 383
    .line 384
    move-result v1

    .line 385
    add-int/2addr v0, v1

    .line 386
    :cond_17
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->giftUv_:I

    .line 387
    .line 388
    if-eqz v1, :cond_18

    .line 389
    .line 390
    const/16 v2, 0x18

    .line 391
    .line 392
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 393
    .line 394
    .line 395
    move-result v1

    .line 396
    add-int/2addr v0, v1

    .line 397
    :cond_18
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->nextLevelGiftUv_:I

    .line 398
    .line 399
    if-eqz v1, :cond_19

    .line 400
    .line 401
    const/16 v2, 0x19

    .line 402
    .line 403
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 404
    .line 405
    .line 406
    move-result v1

    .line 407
    add-int/2addr v0, v1

    .line 408
    :cond_19
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 409
    .line 410
    return v0
.end method

.method public getShowBgSvgaUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showBgSvgaUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getShowBgSvgaUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showBgSvgaUrl_:Ljava/lang/String;

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

.method public getShowLevel()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showLevel_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getSongCode()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songCode_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSongCodeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songCode_:Ljava/lang/String;

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

.method public getSongUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSongUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songUrl_:Ljava/lang/String;

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

.method public getStatus()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->status_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStatusBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->status_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->title_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->title_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->userId_:Ljava/lang/String;

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

.method public hasMask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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

.method public hasQuickGiftInfo()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

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
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->orderId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getOrderId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songCode_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getSongCode()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    const/4 v0, 0x4

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->title_:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_4

    .line 68
    .line 69
    const/4 v0, 0x5

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getTitle()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricUrl_:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_5

    .line 84
    .line 85
    const/4 v0, 0x6

    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getLyricUrl()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->lyricType_:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_6

    .line 100
    .line 101
    const/4 v0, 0x7

    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getLyricType()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->songUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getSongUrl()Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->prepareRemainSeconds_:I

    .line 127
    .line 128
    if-eqz v0, :cond_8

    .line 129
    .line 130
    const/16 v1, 0x9

    .line 131
    .line 132
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 133
    .line 134
    .line 135
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->status_:Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_9

    .line 142
    .line 143
    const/16 v0, 0xa

    .line 144
    .line 145
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getStatus()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 150
    .line 151
    .line 152
    :cond_9
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->durationSecond_:I

    .line 153
    .line 154
    if-eqz v0, :cond_a

    .line 155
    .line 156
    const/16 v1, 0xb

    .line 157
    .line 158
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 159
    .line 160
    .line 161
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->author_:Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-nez v0, :cond_b

    .line 168
    .line 169
    const/16 v0, 0xc

    .line 170
    .line 171
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getAuthor()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 176
    .line 177
    .line 178
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->cover_:Ljava/lang/String;

    .line 179
    .line 180
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    if-nez v0, :cond_c

    .line 185
    .line 186
    const/16 v0, 0xd

    .line 187
    .line 188
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getCover()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 193
    .line 194
    .line 195
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->quickGiftInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 196
    .line 197
    if-eqz v0, :cond_d

    .line 198
    .line 199
    const/16 v0, 0xe

    .line 200
    .line 201
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getQuickGiftInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 206
    .line 207
    .line 208
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->provider_:Ljava/lang/String;

    .line 209
    .line 210
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    if-nez v0, :cond_e

    .line 215
    .line 216
    const/16 v0, 0xf

    .line 217
    .line 218
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getProvider()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 223
    .line 224
    .line 225
    :cond_e
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showLevel_:Z

    .line 226
    .line 227
    if-eqz v0, :cond_f

    .line 228
    .line 229
    const/16 v1, 0x10

    .line 230
    .line 231
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 232
    .line 233
    .line 234
    :cond_f
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->level_:I

    .line 235
    .line 236
    if-eqz v0, :cond_10

    .line 237
    .line 238
    const/16 v1, 0x11

    .line 239
    .line 240
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 241
    .line 242
    .line 243
    :cond_10
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->maxLevel_:I

    .line 244
    .line 245
    if-eqz v0, :cond_11

    .line 246
    .line 247
    const/16 v1, 0x12

    .line 248
    .line 249
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 250
    .line 251
    .line 252
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->levelTip_:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 255
    .line 256
    .line 257
    move-result v0

    .line 258
    if-nez v0, :cond_12

    .line 259
    .line 260
    const/16 v0, 0x13

    .line 261
    .line 262
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getLevelTip()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 267
    .line 268
    .line 269
    :cond_12
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->score_:J

    .line 270
    .line 271
    const-wide/16 v2, 0x0

    .line 272
    .line 273
    cmp-long v2, v0, v2

    .line 274
    .line 275
    if-eqz v2, :cond_13

    .line 276
    .line 277
    const/16 v2, 0x14

    .line 278
    .line 279
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 280
    .line 281
    .line 282
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->schema_:Ljava/lang/String;

    .line 283
    .line 284
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    if-nez v0, :cond_14

    .line 289
    .line 290
    const/16 v0, 0x15

    .line 291
    .line 292
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getSchema()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v1

    .line 296
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 297
    .line 298
    .line 299
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->bestSingerName_:Ljava/lang/String;

    .line 300
    .line 301
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    if-nez v0, :cond_15

    .line 306
    .line 307
    const/16 v0, 0x16

    .line 308
    .line 309
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getBestSingerName()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 314
    .line 315
    .line 316
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->showBgSvgaUrl_:Ljava/lang/String;

    .line 317
    .line 318
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 319
    .line 320
    .line 321
    move-result v0

    .line 322
    if-nez v0, :cond_16

    .line 323
    .line 324
    const/16 v0, 0x17

    .line 325
    .line 326
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getShowBgSvgaUrl()Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object v1

    .line 330
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 331
    .line 332
    .line 333
    :cond_16
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->giftUv_:I

    .line 334
    .line 335
    if-eqz v0, :cond_17

    .line 336
    .line 337
    const/16 v1, 0x18

    .line 338
    .line 339
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 340
    .line 341
    .line 342
    :cond_17
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->nextLevelGiftUv_:I

    .line 343
    .line 344
    if-eqz p0, :cond_18

    .line 345
    .line 346
    const/16 v0, 0x19

    .line 347
    .line 348
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 349
    .line 350
    .line 351
    :cond_18
    return-void
.end method
