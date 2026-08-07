.class public final Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceLiveHourLeaderboardTopEffectMessage"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessageOrBuilder;"
    }
.end annotation


# static fields
.field public static final ANCHORID_FIELD_NUMBER:I = 0x3

.field public static final ANCHORIMAGE_FIELD_NUMBER:I = 0x4

.field public static final ANCHORNAME_FIELD_NUMBER:I = 0x5

.field public static final BACKGROUNDURL_FIELD_NUMBER:I = 0xa

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

.field public static final DURATION_FIELD_NUMBER:I = 0xb

.field public static final LIVEID_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static final ROOMID_FIELD_NUMBER:I = 0x1

.field public static final TITLECOLOR_FIELD_NUMBER:I = 0x7

.field public static final TITLE_FIELD_NUMBER:I = 0x6


# instance fields
.field private anchorId_:Ljava/lang/String;

.field private anchorImage_:Ljava/lang/String;

.field private anchorName_:Ljava/lang/String;

.field private backgroundUrl_:Ljava/lang/String;

.field private duration_:J

.field private liveId_:Ljava/lang/String;

.field private roomId_:Ljava/lang/String;

.field private titleColor_:Ljava/lang/String;

.field private title_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->roomId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->liveId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorId_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorImage_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorName_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->title_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->titleColor_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->backgroundUrl_:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic A()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->clearAnchorId()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->clearAnchorImage()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->clearAnchorName()V

    return-void
.end method

.method private clearAnchorId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getAnchorId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAnchorImage()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getAnchorImage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorImage_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAnchorName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getAnchorName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearBackgroundUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getBackgroundUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->backgroundUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearDuration()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->duration_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->liveId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTitle()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->title_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTitleColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getTitleColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->titleColor_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->clearBackgroundUrl()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->clearDuration()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->clearLiveId()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->clearRoomId()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->clearTitle()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->clearTitleColor()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setAnchorId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setAnchorIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setAnchorImage(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setAnchorImageBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setAnchorName(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setAnchorNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setBackgroundUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setBackgroundUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setDuration(J)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setLiveId(Ljava/lang/String;)V

    return-void
.end method

.method private setAnchorId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAnchorIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAnchorImage(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorImage_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAnchorImageBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorImage_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAnchorName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAnchorNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setBackgroundUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->backgroundUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setBackgroundUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->backgroundUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->duration_:J

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->liveId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->liveId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->title_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->title_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTitleColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->titleColor_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTitleColorBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->titleColor_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setTitle(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setTitleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setTitleColor(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->setTitleColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_d

    .line 55
    .line 56
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    const/16 p3, 0xa

    .line 63
    .line 64
    if-eq p1, p3, :cond_c

    .line 65
    .line 66
    const/16 p3, 0x12

    .line 67
    .line 68
    if-eq p1, p3, :cond_b

    .line 69
    .line 70
    const/16 p3, 0x1a

    .line 71
    .line 72
    if-eq p1, p3, :cond_a

    .line 73
    .line 74
    const/16 p3, 0x22

    .line 75
    .line 76
    if-eq p1, p3, :cond_9

    .line 77
    .line 78
    const/16 p3, 0x2a

    .line 79
    .line 80
    if-eq p1, p3, :cond_8

    .line 81
    .line 82
    const/16 p3, 0x32

    .line 83
    .line 84
    if-eq p1, p3, :cond_7

    .line 85
    .line 86
    const/16 p3, 0x3a

    .line 87
    .line 88
    if-eq p1, p3, :cond_6

    .line 89
    .line 90
    const/16 p3, 0x52

    .line 91
    .line 92
    if-eq p1, p3, :cond_5

    .line 93
    .line 94
    const/16 p3, 0x58

    .line 95
    .line 96
    if-eq p1, p3, :cond_4

    .line 97
    .line 98
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-nez p1, :cond_2

    .line 103
    .line 104
    :cond_3
    move v0, v2

    .line 105
    goto :goto_3

    .line 106
    :catch_0
    move-exception v0

    .line 107
    move-object p1, v0

    .line 108
    goto :goto_4

    .line 109
    :catch_1
    move-exception v0

    .line 110
    move-object p1, v0

    .line 111
    goto :goto_5

    .line 112
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 113
    .line 114
    .line 115
    move-result-wide v3

    .line 116
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->duration_:J

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->backgroundUrl_:Ljava/lang/String;

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->titleColor_:Ljava/lang/String;

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->title_:Ljava/lang/String;

    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorName_:Ljava/lang/String;

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorImage_:Ljava/lang/String;

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorId_:Ljava/lang/String;

    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->liveId_:Ljava/lang/String;

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->roomId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 173
    .line 174
    goto :goto_3

    .line 175
    :catchall_1
    move-exception v0

    .line 176
    move-object p0, v0

    .line 177
    throw p0

    .line 178
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 179
    .line 180
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 192
    .line 193
    .line 194
    return-object v1

    .line 195
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 200
    .line 201
    .line 202
    return-object v1

    .line 203
    :cond_d
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 204
    .line 205
    return-object p0

    .line 206
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 207
    .line 208
    check-cast p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 209
    .line 210
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->roomId_:Ljava/lang/String;

    .line 211
    .line 212
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    xor-int/2addr p1, v2

    .line 217
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->roomId_:Ljava/lang/String;

    .line 218
    .line 219
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->roomId_:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 222
    .line 223
    .line 224
    move-result v3

    .line 225
    xor-int/2addr v3, v2

    .line 226
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->roomId_:Ljava/lang/String;

    .line 227
    .line 228
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->roomId_:Ljava/lang/String;

    .line 233
    .line 234
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->liveId_:Ljava/lang/String;

    .line 235
    .line 236
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    xor-int/2addr p1, v2

    .line 241
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->liveId_:Ljava/lang/String;

    .line 242
    .line 243
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->liveId_:Ljava/lang/String;

    .line 244
    .line 245
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 246
    .line 247
    .line 248
    move-result v3

    .line 249
    xor-int/2addr v3, v2

    .line 250
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->liveId_:Ljava/lang/String;

    .line 251
    .line 252
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->liveId_:Ljava/lang/String;

    .line 257
    .line 258
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorId_:Ljava/lang/String;

    .line 259
    .line 260
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 261
    .line 262
    .line 263
    move-result p1

    .line 264
    xor-int/2addr p1, v2

    .line 265
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorId_:Ljava/lang/String;

    .line 266
    .line 267
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorId_:Ljava/lang/String;

    .line 268
    .line 269
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 270
    .line 271
    .line 272
    move-result v3

    .line 273
    xor-int/2addr v3, v2

    .line 274
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorId_:Ljava/lang/String;

    .line 275
    .line 276
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorId_:Ljava/lang/String;

    .line 281
    .line 282
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorImage_:Ljava/lang/String;

    .line 283
    .line 284
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 285
    .line 286
    .line 287
    move-result p1

    .line 288
    xor-int/2addr p1, v2

    .line 289
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorImage_:Ljava/lang/String;

    .line 290
    .line 291
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorImage_:Ljava/lang/String;

    .line 292
    .line 293
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 294
    .line 295
    .line 296
    move-result v3

    .line 297
    xor-int/2addr v3, v2

    .line 298
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorImage_:Ljava/lang/String;

    .line 299
    .line 300
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object p1

    .line 304
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorImage_:Ljava/lang/String;

    .line 305
    .line 306
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorName_:Ljava/lang/String;

    .line 307
    .line 308
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 309
    .line 310
    .line 311
    move-result p1

    .line 312
    xor-int/2addr p1, v2

    .line 313
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorName_:Ljava/lang/String;

    .line 314
    .line 315
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorName_:Ljava/lang/String;

    .line 316
    .line 317
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 318
    .line 319
    .line 320
    move-result v3

    .line 321
    xor-int/2addr v3, v2

    .line 322
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorName_:Ljava/lang/String;

    .line 323
    .line 324
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object p1

    .line 328
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorName_:Ljava/lang/String;

    .line 329
    .line 330
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->title_:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->title_:Ljava/lang/String;

    .line 338
    .line 339
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->title_:Ljava/lang/String;

    .line 340
    .line 341
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 342
    .line 343
    .line 344
    move-result v3

    .line 345
    xor-int/2addr v3, v2

    .line 346
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->title_:Ljava/lang/String;

    .line 347
    .line 348
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->title_:Ljava/lang/String;

    .line 353
    .line 354
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->titleColor_:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->titleColor_:Ljava/lang/String;

    .line 362
    .line 363
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->titleColor_:Ljava/lang/String;

    .line 364
    .line 365
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 366
    .line 367
    .line 368
    move-result v3

    .line 369
    xor-int/2addr v3, v2

    .line 370
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->titleColor_:Ljava/lang/String;

    .line 371
    .line 372
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object p1

    .line 376
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->titleColor_:Ljava/lang/String;

    .line 377
    .line 378
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->backgroundUrl_:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->backgroundUrl_:Ljava/lang/String;

    .line 386
    .line 387
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->backgroundUrl_:Ljava/lang/String;

    .line 388
    .line 389
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 390
    .line 391
    .line 392
    move-result v3

    .line 393
    xor-int/2addr v3, v2

    .line 394
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->backgroundUrl_:Ljava/lang/String;

    .line 395
    .line 396
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    move-result-object p1

    .line 400
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->backgroundUrl_:Ljava/lang/String;

    .line 401
    .line 402
    move p1, v2

    .line 403
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->duration_:J

    .line 404
    .line 405
    const-wide/16 v4, 0x0

    .line 406
    .line 407
    cmp-long v1, v2, v4

    .line 408
    .line 409
    if-eqz v1, :cond_e

    .line 410
    .line 411
    move v1, p1

    .line 412
    goto :goto_6

    .line 413
    :cond_e
    move v1, v0

    .line 414
    :goto_6
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->duration_:J

    .line 415
    .line 416
    cmp-long p3, v6, v4

    .line 417
    .line 418
    if-eqz p3, :cond_f

    .line 419
    .line 420
    move v4, p1

    .line 421
    move-object v0, p2

    .line 422
    move-wide v5, v6

    .line 423
    goto :goto_7

    .line 424
    :cond_f
    move v4, v0

    .line 425
    move-wide v5, v6

    .line 426
    move-object v0, p2

    .line 427
    :goto_7
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 428
    .line 429
    .line 430
    move-result-wide p1

    .line 431
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->duration_:J

    .line 432
    .line 433
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 434
    .line 435
    return-object p0

    .line 436
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage$Builder;

    .line 437
    .line 438
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage$Builder;-><init>(Ll/k5o0;)V

    .line 439
    .line 440
    .line 441
    return-object p0

    .line 442
    :pswitch_5
    return-object v1

    .line 443
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 444
    .line 445
    return-object p0

    .line 446
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;

    .line 447
    .line 448
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;-><init>()V

    .line 449
    .line 450
    .line 451
    return-object p0

    .line 452
    nop

    .line 453
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
.end method

.method public getAnchorId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorId_:Ljava/lang/String;

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

.method public getAnchorImage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorImage_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorImageBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorImage_:Ljava/lang/String;

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

.method public getAnchorName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorName_:Ljava/lang/String;

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

.method public getBackgroundUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->backgroundUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBackgroundUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->backgroundUrl_:Ljava/lang/String;

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

.method public getDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->duration_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->liveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->liveId_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->roomId_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getRoomId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->liveId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getLiveId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getAnchorId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorImage_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getAnchorImage()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getAnchorName()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->title_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getTitle()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->titleColor_:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-nez v1, :cond_7

    .line 123
    .line 124
    const/4 v1, 0x7

    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getTitleColor()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    add-int/2addr v0, v1

    .line 134
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->backgroundUrl_:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-nez v1, :cond_8

    .line 141
    .line 142
    const/16 v1, 0xa

    .line 143
    .line 144
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getBackgroundUrl()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    add-int/2addr v0, v1

    .line 153
    :cond_8
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->duration_:J

    .line 154
    .line 155
    const-wide/16 v3, 0x0

    .line 156
    .line 157
    cmp-long v3, v1, v3

    .line 158
    .line 159
    if-eqz v3, :cond_9

    .line 160
    .line 161
    const/16 v3, 0xb

    .line 162
    .line 163
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    add-int/2addr v0, v1

    .line 168
    :cond_9
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 169
    .line 170
    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->title_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->title_:Ljava/lang/String;

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

.method public getTitleColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->titleColor_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitleColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->titleColor_:Ljava/lang/String;

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
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getRoomId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->liveId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getLiveId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getAnchorId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorImage_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getAnchorImage()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->anchorName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getAnchorName()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->title_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getTitle()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->titleColor_:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_6

    .line 104
    .line 105
    const/4 v0, 0x7

    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getTitleColor()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->backgroundUrl_:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_7

    .line 120
    .line 121
    const/16 v0, 0xa

    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getBackgroundUrl()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_7
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->duration_:J

    .line 131
    .line 132
    const-wide/16 v2, 0x0

    .line 133
    .line 134
    cmp-long p0, v0, v2

    .line 135
    .line 136
    if-eqz p0, :cond_8

    .line 137
    .line 138
    const/16 p0, 0xb

    .line 139
    .line 140
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 141
    .line 142
    .line 143
    :cond_8
    return-void
.end method
