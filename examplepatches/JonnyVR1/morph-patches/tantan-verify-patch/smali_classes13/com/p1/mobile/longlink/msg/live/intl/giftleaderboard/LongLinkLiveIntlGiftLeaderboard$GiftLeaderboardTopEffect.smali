.class public final Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffectOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "GiftLeaderboardTopEffect"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;",
        "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffectOrBuilder;"
    }
.end annotation


# static fields
.field public static final BACKGROUNDSVGAURL_FIELD_NUMBER:I = 0x7

.field public static final BACKGROUNDURL_FIELD_NUMBER:I = 0x6

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

.field public static final DURATION_FIELD_NUMBER:I = 0x4

.field public static final EFFECTBACKGROUNDURL_FIELD_NUMBER:I = 0x8

.field public static final ENDBACKENDCOLOR_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;",
            ">;"
        }
    .end annotation
.end field

.field public static final ROOMID_FIELD_NUMBER:I = 0x5

.field public static final STARTBACKENDCOLOR_FIELD_NUMBER:I = 0x2

.field public static final TEMPLATE_FIELD_NUMBER:I = 0x1


# instance fields
.field private backgroundSvgaUrl_:Ljava/lang/String;

.field private backgroundUrl_:Ljava/lang/String;

.field private duration_:J

.field private effectBackgroundUrl_:Ljava/lang/String;

.field private endBackendColor_:Ljava/lang/String;

.field private roomId_:Ljava/lang/String;

.field private startBackendColor_:Ljava/lang/String;

.field private template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->startBackendColor_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->endBackendColor_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->roomId_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundUrl_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundSvgaUrl_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->effectBackgroundUrl_:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->clearBackgroundSvgaUrl()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->clearBackgroundUrl()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->clearDuration()V

    return-void
.end method

.method private clearBackgroundSvgaUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getBackgroundSvgaUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundSvgaUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearBackgroundUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getBackgroundUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundUrl_:Ljava/lang/String;

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
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->duration_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearEffectBackgroundUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getEffectBackgroundUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->effectBackgroundUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearEndBackendColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getEndBackendColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->endBackendColor_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearStartBackendColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getStartBackendColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->startBackendColor_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTemplate()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->clearEffectBackgroundUrl()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->clearEndBackendColor()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->clearRoomId()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->clearStartBackendColor()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->clearTemplate()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->mergeTemplate(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->setBackgroundSvgaUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->setBackgroundSvgaUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->setBackgroundUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->setBackgroundUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private mergeTemplate(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;->newBuilder(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->setDuration(J)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->setEffectBackgroundUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->setEffectBackgroundUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->setEndBackendColor(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->setEndBackendColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method private setBackgroundSvgaUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundSvgaUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setBackgroundSvgaUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundSvgaUrl_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundUrl_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->duration_:J

    .line 2
    .line 3
    return-void
.end method

.method private setEffectBackgroundUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->effectBackgroundUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setEffectBackgroundUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->effectBackgroundUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setEndBackendColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->endBackendColor_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setEndBackendColorBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->endBackendColor_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setStartBackendColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->startBackendColor_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setStartBackendColorBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->startBackendColor_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTemplate(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 8
    .line 9
    return-void
.end method

.method private setTemplate(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->setStartBackendColor(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->setStartBackendColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->setTemplate(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData$Builder;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->setTemplate(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;)V

    return-void
.end method

.method public static bridge synthetic y()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->PARSER:Ll/ng60;

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
    const/16 v3, 0xa

    .line 63
    .line 64
    if-eq p1, v3, :cond_b

    .line 65
    .line 66
    const/16 v3, 0x12

    .line 67
    .line 68
    if-eq p1, v3, :cond_a

    .line 69
    .line 70
    const/16 v3, 0x1a

    .line 71
    .line 72
    if-eq p1, v3, :cond_9

    .line 73
    .line 74
    const/16 v3, 0x20

    .line 75
    .line 76
    if-eq p1, v3, :cond_8

    .line 77
    .line 78
    const/16 v3, 0x2a

    .line 79
    .line 80
    if-eq p1, v3, :cond_7

    .line 81
    .line 82
    const/16 v3, 0x32

    .line 83
    .line 84
    if-eq p1, v3, :cond_6

    .line 85
    .line 86
    const/16 v3, 0x3a

    .line 87
    .line 88
    if-eq p1, v3, :cond_5

    .line 89
    .line 90
    const/16 v3, 0x42

    .line 91
    .line 92
    if-eq p1, v3, :cond_4

    .line 93
    .line 94
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_2

    .line 99
    .line 100
    :cond_3
    move v0, v2

    .line 101
    goto :goto_3

    .line 102
    :catch_0
    move-exception v0

    .line 103
    move-object p1, v0

    .line 104
    goto :goto_5

    .line 105
    :catch_1
    move-exception v0

    .line 106
    move-object p1, v0

    .line 107
    goto/16 :goto_6

    .line 108
    .line 109
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->effectBackgroundUrl_:Ljava/lang/String;

    .line 114
    .line 115
    goto :goto_3

    .line 116
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundSvgaUrl_:Ljava/lang/String;

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundUrl_:Ljava/lang/String;

    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->roomId_:Ljava/lang/String;

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 138
    .line 139
    .line 140
    move-result-wide v3

    .line 141
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->duration_:J

    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->endBackendColor_:Ljava/lang/String;

    .line 149
    .line 150
    goto :goto_3

    .line 151
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->startBackendColor_:Ljava/lang/String;

    .line 156
    .line 157
    goto :goto_3

    .line 158
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 159
    .line 160
    if-eqz p1, :cond_c

    .line 161
    .line 162
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData$Builder;

    .line 167
    .line 168
    goto :goto_4

    .line 169
    :cond_c
    move-object p1, v1

    .line 170
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;->parser()Ll/ng60;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    check-cast v3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 179
    .line 180
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 181
    .line 182
    if-eqz p1, :cond_2

    .line 183
    .line 184
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 185
    .line 186
    .line 187
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 192
    .line 193
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 194
    .line 195
    goto/16 :goto_3

    .line 196
    .line 197
    :catchall_1
    move-exception v0

    .line 198
    move-object p0, v0

    .line 199
    throw p0

    .line 200
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 201
    .line 202
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 214
    .line 215
    .line 216
    return-object v1

    .line 217
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 222
    .line 223
    .line 224
    return-object v1

    .line 225
    :cond_d
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 226
    .line 227
    return-object p0

    .line 228
    :pswitch_3
    move-object v3, p2

    .line 229
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 230
    .line 231
    check-cast p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 232
    .line 233
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 234
    .line 235
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 236
    .line 237
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 242
    .line 243
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 244
    .line 245
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->startBackendColor_:Ljava/lang/String;

    .line 246
    .line 247
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 248
    .line 249
    .line 250
    move-result p1

    .line 251
    xor-int/2addr p1, v2

    .line 252
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->startBackendColor_:Ljava/lang/String;

    .line 253
    .line 254
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->startBackendColor_:Ljava/lang/String;

    .line 255
    .line 256
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    xor-int/2addr v1, v2

    .line 261
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->startBackendColor_:Ljava/lang/String;

    .line 262
    .line 263
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->startBackendColor_:Ljava/lang/String;

    .line 268
    .line 269
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->endBackendColor_:Ljava/lang/String;

    .line 270
    .line 271
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    xor-int/2addr p1, v2

    .line 276
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->endBackendColor_:Ljava/lang/String;

    .line 277
    .line 278
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->endBackendColor_:Ljava/lang/String;

    .line 279
    .line 280
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 281
    .line 282
    .line 283
    move-result v1

    .line 284
    xor-int/2addr v1, v2

    .line 285
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->endBackendColor_:Ljava/lang/String;

    .line 286
    .line 287
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->endBackendColor_:Ljava/lang/String;

    .line 292
    .line 293
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->duration_:J

    .line 294
    .line 295
    const-wide/16 p1, 0x0

    .line 296
    .line 297
    cmp-long v1, v5, p1

    .line 298
    .line 299
    if-eqz v1, :cond_e

    .line 300
    .line 301
    move v4, v2

    .line 302
    goto :goto_7

    .line 303
    :cond_e
    move v4, v0

    .line 304
    :goto_7
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->duration_:J

    .line 305
    .line 306
    cmp-long p1, v8, p1

    .line 307
    .line 308
    if-eqz p1, :cond_f

    .line 309
    .line 310
    move v7, v2

    .line 311
    goto :goto_8

    .line 312
    :cond_f
    move v7, v0

    .line 313
    :goto_8
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 314
    .line 315
    .line 316
    move-result-wide p1

    .line 317
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->duration_:J

    .line 318
    .line 319
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->roomId_:Ljava/lang/String;

    .line 320
    .line 321
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 322
    .line 323
    .line 324
    move-result p1

    .line 325
    xor-int/2addr p1, v2

    .line 326
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->roomId_:Ljava/lang/String;

    .line 327
    .line 328
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->roomId_:Ljava/lang/String;

    .line 329
    .line 330
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    xor-int/2addr v0, v2

    .line 335
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->roomId_:Ljava/lang/String;

    .line 336
    .line 337
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->roomId_:Ljava/lang/String;

    .line 342
    .line 343
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundUrl_:Ljava/lang/String;

    .line 344
    .line 345
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 346
    .line 347
    .line 348
    move-result p1

    .line 349
    xor-int/2addr p1, v2

    .line 350
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundUrl_:Ljava/lang/String;

    .line 351
    .line 352
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundUrl_:Ljava/lang/String;

    .line 353
    .line 354
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 355
    .line 356
    .line 357
    move-result v0

    .line 358
    xor-int/2addr v0, v2

    .line 359
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundUrl_:Ljava/lang/String;

    .line 360
    .line 361
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundUrl_:Ljava/lang/String;

    .line 366
    .line 367
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundSvgaUrl_:Ljava/lang/String;

    .line 368
    .line 369
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 370
    .line 371
    .line 372
    move-result p1

    .line 373
    xor-int/2addr p1, v2

    .line 374
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundSvgaUrl_:Ljava/lang/String;

    .line 375
    .line 376
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundSvgaUrl_:Ljava/lang/String;

    .line 377
    .line 378
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    xor-int/2addr v0, v2

    .line 383
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundSvgaUrl_:Ljava/lang/String;

    .line 384
    .line 385
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object p1

    .line 389
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundSvgaUrl_:Ljava/lang/String;

    .line 390
    .line 391
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->effectBackgroundUrl_:Ljava/lang/String;

    .line 392
    .line 393
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 394
    .line 395
    .line 396
    move-result p1

    .line 397
    xor-int/2addr p1, v2

    .line 398
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->effectBackgroundUrl_:Ljava/lang/String;

    .line 399
    .line 400
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->effectBackgroundUrl_:Ljava/lang/String;

    .line 401
    .line 402
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 403
    .line 404
    .line 405
    move-result v0

    .line 406
    xor-int/2addr v0, v2

    .line 407
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->effectBackgroundUrl_:Ljava/lang/String;

    .line 408
    .line 409
    invoke-interface {v3, p1, p2, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object p1

    .line 413
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->effectBackgroundUrl_:Ljava/lang/String;

    .line 414
    .line 415
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 416
    .line 417
    return-object p0

    .line 418
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect$Builder;

    .line 419
    .line 420
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect$Builder;-><init>(Ll/a3w;)V

    .line 421
    .line 422
    .line 423
    return-object p0

    .line 424
    :pswitch_5
    return-object v1

    .line 425
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 426
    .line 427
    return-object p0

    .line 428
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 429
    .line 430
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;-><init>()V

    .line 431
    .line 432
    .line 433
    return-object p0

    .line 434
    nop

    .line 435
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

.method public getBackgroundSvgaUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundSvgaUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBackgroundSvgaUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundSvgaUrl_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBackgroundUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundUrl_:Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->duration_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getEffectBackgroundUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->effectBackgroundUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEffectBackgroundUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->effectBackgroundUrl_:Ljava/lang/String;

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

.method public getEndBackendColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->endBackendColor_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEndBackendColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->endBackendColor_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->roomId_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getTemplate()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 v0, 0x0

    .line 22
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->startBackendColor_:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getStartBackendColor()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/2addr v0, v1

    .line 40
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->endBackendColor_:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getEndBackendColor()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    :cond_3
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->duration_:J

    .line 59
    .line 60
    const-wide/16 v3, 0x0

    .line 61
    .line 62
    cmp-long v3, v1, v3

    .line 63
    .line 64
    if-eqz v3, :cond_4

    .line 65
    .line 66
    const/4 v3, 0x4

    .line 67
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    add-int/2addr v0, v1

    .line 72
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->roomId_:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_5

    .line 79
    .line 80
    const/4 v1, 0x5

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getRoomId()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    add-int/2addr v0, v1

    .line 90
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getBackgroundUrl()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundSvgaUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getBackgroundSvgaUrl()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->effectBackgroundUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getEffectBackgroundUrl()Ljava/lang/String;

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
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 146
    .line 147
    return v0
.end method

.method public getStartBackendColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->startBackendColor_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStartBackendColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->startBackendColor_:Ljava/lang/String;

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

.method public getTemplate()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public hasTemplate()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->template_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getTemplate()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->startBackendColor_:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getStartBackendColor()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->endBackendColor_:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getEndBackendColor()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->duration_:J

    .line 46
    .line 47
    const-wide/16 v2, 0x0

    .line 48
    .line 49
    cmp-long v2, v0, v2

    .line 50
    .line 51
    if-eqz v2, :cond_3

    .line 52
    .line 53
    const/4 v2, 0x4

    .line 54
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->roomId_:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_4

    .line 64
    .line 65
    const/4 v0, 0x5

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getRoomId()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getBackgroundUrl()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->backgroundSvgaUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getBackgroundSvgaUrl()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->effectBackgroundUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getEffectBackgroundUrl()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_7
    return-void
.end method
