.class public final Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyleOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ButtonJumpStyle"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;",
        "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyleOrBuilder;"
    }
.end annotation


# static fields
.field public static final BGCOLOR_FIELD_NUMBER:I = 0x1

.field public static final CONTENT_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

.field public static final ICON_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;",
            ">;"
        }
    .end annotation
.end field

.field public static final TEXTCOLOR_FIELD_NUMBER:I = 0x2

.field public static final URL_FIELD_NUMBER:I = 0x5


# instance fields
.field private bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

.field private content_:Ljava/lang/String;

.field private icon_:Ljava/lang/String;

.field private textColor_:Ljava/lang/String;

.field private url_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->textColor_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->content_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->icon_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->url_:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->clearBgcolor()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->clearContent()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->clearIcon()V

    return-void
.end method

.method private clearBgcolor()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 3
    .line 4
    return-void
.end method

.method private clearContent()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getContent()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->content_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIcon()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->icon_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTextColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getTextColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->textColor_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->url_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->clearTextColor()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->clearUrl()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->mergeBgcolor(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->setBgcolor(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle$Builder;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->setBgcolor(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->setContent(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->setContentBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->setIcon(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->setIconBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->setTextColor(Ljava/lang/String;)V

    return-void
.end method

.method private mergeBgcolor(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->newBuilder(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->setTextColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->setUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->setUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

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

.method public static bridge synthetic q()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    return-object v0
.end method

.method private setBgcolor(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 8
    .line 9
    return-void
.end method

.method private setBgcolor(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    return-void
.end method

.method private setContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->content_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->content_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->icon_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->icon_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTextColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->textColor_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTextColorBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->textColor_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->url_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->url_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    const/4 v1, 0x1

    .line 11
    packed-switch p1, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/l710;->a()V

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->PARSER:Ll/ng60;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    :goto_0
    monitor-exit p0

    .line 42
    goto :goto_2

    .line 43
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    throw p1

    .line 45
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->PARSER:Ll/ng60;

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 49
    .line 50
    check-cast p3, Lcom/google/protobuf/h;

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    :cond_2
    :goto_3
    if-nez p1, :cond_a

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    const/16 v3, 0xa

    .line 62
    .line 63
    if-eq v2, v3, :cond_8

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq v2, v3, :cond_7

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq v2, v3, :cond_6

    .line 72
    .line 73
    const/16 v3, 0x22

    .line 74
    .line 75
    if-eq v2, v3, :cond_5

    .line 76
    .line 77
    const/16 v3, 0x2a

    .line 78
    .line 79
    if-eq v2, v3, :cond_4

    .line 80
    .line 81
    invoke-virtual {p2, v2}, Lcom/google/protobuf/e;->R(I)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-nez v2, :cond_2

    .line 86
    .line 87
    :cond_3
    move p1, v1

    .line 88
    goto :goto_3

    .line 89
    :catch_0
    move-exception p1

    .line 90
    goto :goto_5

    .line 91
    :catch_1
    move-exception p1

    .line 92
    goto :goto_6

    .line 93
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->url_:Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->icon_:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->content_:Ljava/lang/String;

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->textColor_:Ljava/lang/String;

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_8
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 122
    .line 123
    if-eqz v2, :cond_9

    .line 124
    .line 125
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle$Builder;

    .line 130
    .line 131
    goto :goto_4

    .line 132
    :cond_9
    move-object v2, v0

    .line 133
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->parser()Ll/ng60;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 142
    .line 143
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 144
    .line 145
    if-eqz v2, :cond_2

    .line 146
    .line 147
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 155
    .line 156
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :catchall_1
    move-exception p0

    .line 160
    throw p0

    .line 161
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 162
    .line 163
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 175
    .line 176
    .line 177
    return-object v0

    .line 178
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 183
    .line 184
    .line 185
    return-object v0

    .line 186
    :cond_a
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 187
    .line 188
    return-object p0

    .line 189
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 190
    .line 191
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 192
    .line 193
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 194
    .line 195
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 196
    .line 197
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 202
    .line 203
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 204
    .line 205
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->textColor_:Ljava/lang/String;

    .line 206
    .line 207
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    xor-int/2addr p1, v1

    .line 212
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->textColor_:Ljava/lang/String;

    .line 213
    .line 214
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->textColor_:Ljava/lang/String;

    .line 215
    .line 216
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 217
    .line 218
    .line 219
    move-result v2

    .line 220
    xor-int/2addr v2, v1

    .line 221
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->textColor_:Ljava/lang/String;

    .line 222
    .line 223
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->textColor_:Ljava/lang/String;

    .line 228
    .line 229
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->content_:Ljava/lang/String;

    .line 230
    .line 231
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 232
    .line 233
    .line 234
    move-result p1

    .line 235
    xor-int/2addr p1, v1

    .line 236
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->content_:Ljava/lang/String;

    .line 237
    .line 238
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->content_:Ljava/lang/String;

    .line 239
    .line 240
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 241
    .line 242
    .line 243
    move-result v2

    .line 244
    xor-int/2addr v2, v1

    .line 245
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->content_:Ljava/lang/String;

    .line 246
    .line 247
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->content_:Ljava/lang/String;

    .line 252
    .line 253
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->icon_:Ljava/lang/String;

    .line 254
    .line 255
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    xor-int/2addr p1, v1

    .line 260
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->icon_:Ljava/lang/String;

    .line 261
    .line 262
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->icon_:Ljava/lang/String;

    .line 263
    .line 264
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 265
    .line 266
    .line 267
    move-result v2

    .line 268
    xor-int/2addr v2, v1

    .line 269
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->icon_:Ljava/lang/String;

    .line 270
    .line 271
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->icon_:Ljava/lang/String;

    .line 276
    .line 277
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->url_:Ljava/lang/String;

    .line 278
    .line 279
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 280
    .line 281
    .line 282
    move-result p1

    .line 283
    xor-int/2addr p1, v1

    .line 284
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->url_:Ljava/lang/String;

    .line 285
    .line 286
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->url_:Ljava/lang/String;

    .line 287
    .line 288
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 289
    .line 290
    .line 291
    move-result v2

    .line 292
    xor-int/2addr v1, v2

    .line 293
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->url_:Ljava/lang/String;

    .line 294
    .line 295
    invoke-interface {p2, p1, v0, v1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->url_:Ljava/lang/String;

    .line 300
    .line 301
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 302
    .line 303
    return-object p0

    .line 304
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle$Builder;

    .line 305
    .line 306
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle$Builder;-><init>(Ll/q1w;)V

    .line 307
    .line 308
    .line 309
    return-object p0

    .line 310
    :pswitch_5
    return-object v0

    .line 311
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 312
    .line 313
    return-object p0

    .line 314
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 315
    .line 316
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;-><init>()V

    .line 317
    .line 318
    .line 319
    return-object p0

    .line 320
    nop

    .line 321
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

.method public getBgcolor()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->content_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContentBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->content_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->icon_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->icon_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getBgcolor()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->textColor_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getTextColor()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->content_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getContent()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->icon_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getIcon()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->url_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getUrl()Ljava/lang/String;

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
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 95
    .line 96
    return v0
.end method

.method public getTextColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->textColor_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->textColor_:Ljava/lang/String;

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

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->url_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->url_:Ljava/lang/String;

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

.method public hasBgcolor()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

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
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->bgcolor_:Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getBgcolor()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$BgStyle;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->textColor_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getTextColor()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->content_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getContent()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->icon_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getIcon()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->url_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;->getUrl()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_4
    return-void
.end method
