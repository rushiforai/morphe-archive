.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuideOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceUserGuide"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuideOrBuilder;"
    }
.end annotation


# static fields
.field public static final BGSTYLE_FIELD_NUMBER:I = 0x2

.field public static final CONTENT_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

.field public static final GUIDETYPE_FIELD_NUMBER:I = 0x6

.field public static final ICON_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;",
            ">;"
        }
    .end annotation
.end field

.field public static final SCHEMA_FIELD_NUMBER:I = 0x4

.field public static final SHOWSECONDS_FIELD_NUMBER:I = 0x5


# instance fields
.field private bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

.field private content_:Ljava/lang/String;

.field private guideType_:Ljava/lang/String;

.field private icon_:Ljava/lang/String;

.field private schema_:Ljava/lang/String;

.field private showSeconds_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->icon_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->content_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->schema_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->guideType_:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->clearBgStyle()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->clearContent()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->clearGuideType()V

    return-void
.end method

.method private clearBgStyle()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 3
    .line 4
    return-void
.end method

.method private clearContent()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getContent()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->content_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearGuideType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getGuideType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->guideType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIcon()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->icon_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSchema()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getSchema()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->schema_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearShowSeconds()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->showSeconds_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->clearIcon()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->clearSchema()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->clearShowSeconds()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->mergeBgStyle(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->setBgStyle(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle$Builder;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->setBgStyle(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->setContent(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->setContentBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->setGuideType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->setGuideTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private mergeBgStyle(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;->newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->setIcon(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->setIconBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->setSchema(Ljava/lang/String;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->setSchemaBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->setShowSeconds(J)V

    return-void
.end method

.method public static bridge synthetic s()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    return-object v0
.end method

.method private setBgStyle(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 8
    .line 9
    return-void
.end method

.method private setBgStyle(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    return-void
.end method

.method private setContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->content_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->content_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setGuideType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->guideType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setGuideTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->guideType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIcon(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->icon_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIconBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->icon_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSchema(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->schema_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->schema_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setShowSeconds(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->showSeconds_:J

    .line 2
    .line 3
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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_b

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
    if-eq p1, v3, :cond_a

    .line 65
    .line 66
    const/16 v3, 0x12

    .line 67
    .line 68
    if-eq p1, v3, :cond_8

    .line 69
    .line 70
    const/16 v3, 0x1a

    .line 71
    .line 72
    if-eq p1, v3, :cond_7

    .line 73
    .line 74
    const/16 v3, 0x22

    .line 75
    .line 76
    if-eq p1, v3, :cond_6

    .line 77
    .line 78
    const/16 v3, 0x28

    .line 79
    .line 80
    if-eq p1, v3, :cond_5

    .line 81
    .line 82
    const/16 v3, 0x32

    .line 83
    .line 84
    if-eq p1, v3, :cond_4

    .line 85
    .line 86
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_2

    .line 91
    .line 92
    :cond_3
    move v0, v2

    .line 93
    goto :goto_3

    .line 94
    :catch_0
    move-exception v0

    .line 95
    move-object p1, v0

    .line 96
    goto :goto_5

    .line 97
    :catch_1
    move-exception v0

    .line 98
    move-object p1, v0

    .line 99
    goto :goto_6

    .line 100
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->guideType_:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 108
    .line 109
    .line 110
    move-result-wide v3

    .line 111
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->showSeconds_:J

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->schema_:Ljava/lang/String;

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->content_:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 129
    .line 130
    if-eqz p1, :cond_9

    .line 131
    .line 132
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle$Builder;

    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_9
    move-object p1, v1

    .line 140
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;->parser()Ll/ng60;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 149
    .line 150
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 151
    .line 152
    if-eqz p1, :cond_2

    .line 153
    .line 154
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 155
    .line 156
    .line 157
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 162
    .line 163
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->icon_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :catchall_1
    move-exception v0

    .line 174
    move-object p0, v0

    .line 175
    throw p0

    .line 176
    :goto_5
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
    return-object v1

    .line 193
    :goto_6
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
    return-object v1

    .line 201
    :cond_b
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 202
    .line 203
    return-object p0

    .line 204
    :pswitch_3
    move-object v3, p2

    .line 205
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 206
    .line 207
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 208
    .line 209
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->icon_:Ljava/lang/String;

    .line 210
    .line 211
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    xor-int/2addr p1, v2

    .line 216
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->icon_:Ljava/lang/String;

    .line 217
    .line 218
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->icon_:Ljava/lang/String;

    .line 219
    .line 220
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    xor-int/2addr v1, v2

    .line 225
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->icon_:Ljava/lang/String;

    .line 226
    .line 227
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->icon_:Ljava/lang/String;

    .line 232
    .line 233
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 234
    .line 235
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 236
    .line 237
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 242
    .line 243
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 244
    .line 245
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->content_:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->content_:Ljava/lang/String;

    .line 253
    .line 254
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->content_:Ljava/lang/String;

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
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->content_:Ljava/lang/String;

    .line 262
    .line 263
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->content_:Ljava/lang/String;

    .line 268
    .line 269
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->schema_:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->schema_:Ljava/lang/String;

    .line 277
    .line 278
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->schema_:Ljava/lang/String;

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
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->schema_:Ljava/lang/String;

    .line 286
    .line 287
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->schema_:Ljava/lang/String;

    .line 292
    .line 293
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->showSeconds_:J

    .line 294
    .line 295
    const-wide/16 p1, 0x0

    .line 296
    .line 297
    cmp-long v1, v5, p1

    .line 298
    .line 299
    if-eqz v1, :cond_c

    .line 300
    .line 301
    move v4, v2

    .line 302
    goto :goto_7

    .line 303
    :cond_c
    move v4, v0

    .line 304
    :goto_7
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->showSeconds_:J

    .line 305
    .line 306
    cmp-long p1, v8, p1

    .line 307
    .line 308
    if-eqz p1, :cond_d

    .line 309
    .line 310
    move v7, v2

    .line 311
    goto :goto_8

    .line 312
    :cond_d
    move v7, v0

    .line 313
    :goto_8
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 314
    .line 315
    .line 316
    move-result-wide p1

    .line 317
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->showSeconds_:J

    .line 318
    .line 319
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->guideType_:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->guideType_:Ljava/lang/String;

    .line 327
    .line 328
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->guideType_:Ljava/lang/String;

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
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->guideType_:Ljava/lang/String;

    .line 336
    .line 337
    invoke-interface {v3, p1, p2, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->guideType_:Ljava/lang/String;

    .line 342
    .line 343
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 344
    .line 345
    return-object p0

    .line 346
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide$Builder;

    .line 347
    .line 348
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide$Builder;-><init>(Ll/b4w;)V

    .line 349
    .line 350
    .line 351
    return-object p0

    .line 352
    :pswitch_5
    return-object v1

    .line 353
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 354
    .line 355
    return-object p0

    .line 356
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;

    .line 357
    .line 358
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;-><init>()V

    .line 359
    .line 360
    .line 361
    return-object p0

    .line 362
    nop

    .line 363
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

.method public getBgStyle()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getContent()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->content_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContentBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->content_:Ljava/lang/String;

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

.method public getGuideType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->guideType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGuideTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->guideType_:Ljava/lang/String;

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

.method public getIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->icon_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->icon_:Ljava/lang/String;

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

.method public getSchema()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->schema_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSchemaBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->schema_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->icon_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getIcon()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getBgStyle()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/2addr v0, v1

    .line 40
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->content_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getContent()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->schema_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getSchema()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->showSeconds_:J

    .line 77
    .line 78
    const-wide/16 v3, 0x0

    .line 79
    .line 80
    cmp-long v3, v1, v3

    .line 81
    .line 82
    if-eqz v3, :cond_5

    .line 83
    .line 84
    const/4 v3, 0x5

    .line 85
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    add-int/2addr v0, v1

    .line 90
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->guideType_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getGuideType()Ljava/lang/String;

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
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 109
    .line 110
    return v0
.end method

.method public getShowSeconds()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->showSeconds_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hasBgStyle()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->icon_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getIcon()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->bgStyle_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getBgStyle()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->content_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getContent()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->schema_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getSchema()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->showSeconds_:J

    .line 62
    .line 63
    const-wide/16 v2, 0x0

    .line 64
    .line 65
    cmp-long v2, v0, v2

    .line 66
    .line 67
    if-eqz v2, :cond_4

    .line 68
    .line 69
    const/4 v2, 0x5

    .line 70
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 71
    .line 72
    .line 73
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->guideType_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceUserGuide;->getGuideType()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_5
    return-void
.end method
