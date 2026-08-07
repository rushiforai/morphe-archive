.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LiveSticker"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerOrBuilder;"
    }
.end annotation


# static fields
.field public static final CONTENT_FIELD_NUMBER:I = 0x4

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

.field public static final GIFTICON_FIELD_NUMBER:I = 0x7

.field public static final GIFTID_FIELD_NUMBER:I = 0x6

.field public static final ID_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;",
            ">;"
        }
    .end annotation
.end field

.field public static final POSITION_FIELD_NUMBER:I = 0x5

.field public static final TEMPLATEID_FIELD_NUMBER:I = 0x2

.field public static final VERSION_FIELD_NUMBER:I = 0x3


# instance fields
.field private content_:Ljava/lang/String;

.field private giftIcon_:Ljava/lang/String;

.field private giftId_:Ljava/lang/String;

.field private id_:Ljava/lang/String;

.field private position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

.field private templateId_:Ljava/lang/String;

.field private version_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->templateId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->content_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftId_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftIcon_:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->clearContent()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->clearGiftIcon()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->clearGiftId()V

    return-void
.end method

.method private clearContent()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getContent()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->content_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearGiftIcon()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getGiftIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftIcon_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearGiftId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getGiftId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPosition()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 3
    .line 4
    return-void
.end method

.method private clearTemplateId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getTemplateId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->templateId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearVersion()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->version_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->clearId()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->clearPosition()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->clearTemplateId()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->clearVersion()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->mergePosition(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->setContent(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->setContentBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->setGiftIcon(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->setGiftIconBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->setGiftId(Ljava/lang/String;)V

    return-void
.end method

.method private mergePosition(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;->newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->setGiftIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->setPosition(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position$Builder;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->setPosition(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->setTemplateId(Ljava/lang/String;)V

    return-void
.end method

.method private setContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->content_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setContentBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->content_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setGiftIcon(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftIcon_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftIcon_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setGiftId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setGiftIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPosition(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 8
    .line 9
    return-void
.end method

.method private setPosition(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    return-void
.end method

.method private setTemplateId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->templateId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTemplateIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->templateId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setVersion(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->version_:J

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->setTemplateIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->setVersion(J)V

    return-void
.end method

.method public static bridge synthetic v()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    return-object v0
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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_c

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
    const/16 v3, 0x18

    .line 71
    .line 72
    if-eq p1, v3, :cond_9

    .line 73
    .line 74
    const/16 v3, 0x22

    .line 75
    .line 76
    if-eq p1, v3, :cond_8

    .line 77
    .line 78
    const/16 v3, 0x2a

    .line 79
    .line 80
    if-eq p1, v3, :cond_6

    .line 81
    .line 82
    const/16 v3, 0x32

    .line 83
    .line 84
    if-eq p1, v3, :cond_5

    .line 85
    .line 86
    const/16 v3, 0x3a

    .line 87
    .line 88
    if-eq p1, v3, :cond_4

    .line 89
    .line 90
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_2

    .line 95
    .line 96
    :cond_3
    move v0, v2

    .line 97
    goto :goto_3

    .line 98
    :catch_0
    move-exception v0

    .line 99
    move-object p1, v0

    .line 100
    goto :goto_5

    .line 101
    :catch_1
    move-exception v0

    .line 102
    move-object p1, v0

    .line 103
    goto :goto_6

    .line 104
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftIcon_:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftId_:Ljava/lang/String;

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 119
    .line 120
    if-eqz p1, :cond_7

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position$Builder;

    .line 127
    .line 128
    goto :goto_4

    .line 129
    :cond_7
    move-object p1, v1

    .line 130
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;->parser()Ll/ng60;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 139
    .line 140
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 141
    .line 142
    if-eqz p1, :cond_2

    .line 143
    .line 144
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 145
    .line 146
    .line 147
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 152
    .line 153
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 154
    .line 155
    goto :goto_3

    .line 156
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->content_:Ljava/lang/String;

    .line 161
    .line 162
    goto :goto_3

    .line 163
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 164
    .line 165
    .line 166
    move-result-wide v3

    .line 167
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->version_:J

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->templateId_:Ljava/lang/String;

    .line 175
    .line 176
    goto :goto_3

    .line 177
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->id_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 182
    .line 183
    goto/16 :goto_3

    .line 184
    .line 185
    :catchall_1
    move-exception v0

    .line 186
    move-object p0, v0

    .line 187
    throw p0

    .line 188
    :goto_5
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
    return-object v1

    .line 205
    :goto_6
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
    return-object v1

    .line 213
    :cond_c
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 214
    .line 215
    return-object p0

    .line 216
    :pswitch_3
    move-object v3, p2

    .line 217
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 218
    .line 219
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 220
    .line 221
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->id_:Ljava/lang/String;

    .line 222
    .line 223
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 224
    .line 225
    .line 226
    move-result p1

    .line 227
    xor-int/2addr p1, v2

    .line 228
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->id_:Ljava/lang/String;

    .line 229
    .line 230
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->id_:Ljava/lang/String;

    .line 231
    .line 232
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    xor-int/2addr v1, v2

    .line 237
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->id_:Ljava/lang/String;

    .line 238
    .line 239
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->id_:Ljava/lang/String;

    .line 244
    .line 245
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->templateId_:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->templateId_:Ljava/lang/String;

    .line 253
    .line 254
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->templateId_:Ljava/lang/String;

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
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->templateId_:Ljava/lang/String;

    .line 262
    .line 263
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->templateId_:Ljava/lang/String;

    .line 268
    .line 269
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->version_:J

    .line 270
    .line 271
    const-wide/16 p1, 0x0

    .line 272
    .line 273
    cmp-long v1, v5, p1

    .line 274
    .line 275
    if-eqz v1, :cond_d

    .line 276
    .line 277
    move v4, v2

    .line 278
    goto :goto_7

    .line 279
    :cond_d
    move v4, v0

    .line 280
    :goto_7
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->version_:J

    .line 281
    .line 282
    cmp-long p1, v8, p1

    .line 283
    .line 284
    if-eqz p1, :cond_e

    .line 285
    .line 286
    move v7, v2

    .line 287
    goto :goto_8

    .line 288
    :cond_e
    move v7, v0

    .line 289
    :goto_8
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 290
    .line 291
    .line 292
    move-result-wide p1

    .line 293
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->version_:J

    .line 294
    .line 295
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->content_:Ljava/lang/String;

    .line 296
    .line 297
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 298
    .line 299
    .line 300
    move-result p1

    .line 301
    xor-int/2addr p1, v2

    .line 302
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->content_:Ljava/lang/String;

    .line 303
    .line 304
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->content_:Ljava/lang/String;

    .line 305
    .line 306
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    xor-int/2addr v0, v2

    .line 311
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->content_:Ljava/lang/String;

    .line 312
    .line 313
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object p1

    .line 317
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->content_:Ljava/lang/String;

    .line 318
    .line 319
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 320
    .line 321
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 322
    .line 323
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 328
    .line 329
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 330
    .line 331
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftId_:Ljava/lang/String;

    .line 332
    .line 333
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 334
    .line 335
    .line 336
    move-result p1

    .line 337
    xor-int/2addr p1, v2

    .line 338
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftId_:Ljava/lang/String;

    .line 339
    .line 340
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftId_:Ljava/lang/String;

    .line 341
    .line 342
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 343
    .line 344
    .line 345
    move-result v0

    .line 346
    xor-int/2addr v0, v2

    .line 347
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftId_:Ljava/lang/String;

    .line 348
    .line 349
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object p1

    .line 353
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftId_:Ljava/lang/String;

    .line 354
    .line 355
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftIcon_:Ljava/lang/String;

    .line 356
    .line 357
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 358
    .line 359
    .line 360
    move-result p1

    .line 361
    xor-int/2addr p1, v2

    .line 362
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftIcon_:Ljava/lang/String;

    .line 363
    .line 364
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftIcon_:Ljava/lang/String;

    .line 365
    .line 366
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    xor-int/2addr v0, v2

    .line 371
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftIcon_:Ljava/lang/String;

    .line 372
    .line 373
    invoke-interface {v3, p1, p2, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object p1

    .line 377
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftIcon_:Ljava/lang/String;

    .line 378
    .line 379
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 380
    .line 381
    return-object p0

    .line 382
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker$Builder;

    .line 383
    .line 384
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker$Builder;-><init>(Ll/c3w;)V

    .line 385
    .line 386
    .line 387
    return-object p0

    .line 388
    :pswitch_5
    return-object v1

    .line 389
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 390
    .line 391
    return-object p0

    .line 392
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 393
    .line 394
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;-><init>()V

    .line 395
    .line 396
    .line 397
    return-object p0

    .line 398
    nop

    .line 399
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

.method public getContent()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->content_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContentBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->content_:Ljava/lang/String;

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

.method public getGiftIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftIcon_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGiftIconBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftIcon_:Ljava/lang/String;

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

.method public getGiftId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGiftIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftId_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->id_:Ljava/lang/String;

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

.method public getPosition()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->templateId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getTemplateId()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->version_:J

    .line 45
    .line 46
    const-wide/16 v3, 0x0

    .line 47
    .line 48
    cmp-long v3, v1, v3

    .line 49
    .line 50
    if-eqz v3, :cond_3

    .line 51
    .line 52
    const/4 v3, 0x3

    .line 53
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->content_:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_4

    .line 65
    .line 66
    const/4 v1, 0x4

    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getContent()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    add-int/2addr v0, v1

    .line 76
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    const/4 v1, 0x5

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getPosition()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    add-int/2addr v0, v1

    .line 90
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getGiftId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftIcon_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getGiftIcon()Ljava/lang/String;

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
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 127
    .line 128
    return v0
.end method

.method public getTemplateId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->templateId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTemplateIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->templateId_:Ljava/lang/String;

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

.method public getVersion()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->version_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hasPosition()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->templateId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getTemplateId()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->version_:J

    .line 34
    .line 35
    const-wide/16 v2, 0x0

    .line 36
    .line 37
    cmp-long v2, v0, v2

    .line 38
    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    const/4 v2, 0x3

    .line 42
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->content_:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    const/4 v0, 0x4

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getContent()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->position_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 62
    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    const/4 v0, 0x5

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getPosition()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 71
    .line 72
    .line 73
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getGiftId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->giftIcon_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getGiftIcon()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 103
    .line 104
    .line 105
    :cond_6
    return-void
.end method
