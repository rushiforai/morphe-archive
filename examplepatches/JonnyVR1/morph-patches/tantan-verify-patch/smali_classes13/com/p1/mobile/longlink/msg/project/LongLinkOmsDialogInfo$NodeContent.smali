.class public final Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContentOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "NodeContent"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContentOrBuilder;"
    }
.end annotation


# static fields
.field public static final BACKGROUNDCOLOR_FIELD_NUMBER:I = 0x5

.field public static final COLOR_FIELD_NUMBER:I = 0x2

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

.field public static final FONT_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;",
            ">;"
        }
    .end annotation
.end field

.field public static final SIZE_FIELD_NUMBER:I = 0x3

.field public static final STRIKETHROUGH_FIELD_NUMBER:I = 0x6

.field public static final UNDERLINE_FIELD_NUMBER:I = 0x7

.field public static final URL_FIELD_NUMBER:I = 0x8

.field public static final VALUE_FIELD_NUMBER:I = 0x1


# instance fields
.field private backgroundColor_:Ljava/lang/String;

.field private color_:Ljava/lang/String;

.field private font_:Ljava/lang/String;

.field private size_:I

.field private strikethrough_:Z

.field private underline_:Z

.field private url_:Ljava/lang/String;

.field private value_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->value_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->color_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->font_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->backgroundColor_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->url_:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->clearBackgroundColor()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->clearColor()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->clearFont()V

    return-void
.end method

.method private clearBackgroundColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getBackgroundColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->backgroundColor_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->color_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearFont()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getFont()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->font_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSize()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->size_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearStrikethrough()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->strikethrough_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearUnderline()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->underline_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->url_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearValue()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getValue()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->value_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->clearSize()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->clearStrikethrough()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->clearUnderline()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->clearUrl()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->clearValue()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->setBackgroundColor(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->setBackgroundColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->setColor(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->setColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->setFont(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->setFontBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->setSize(I)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->setStrikethrough(Z)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->setUnderline(Z)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->setUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->setUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private setBackgroundColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->backgroundColor_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setBackgroundColorBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->backgroundColor_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->color_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setColorBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->color_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setFont(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->font_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setFontBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->font_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->size_:I

    .line 2
    .line 3
    return-void
.end method

.method private setStrikethrough(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->strikethrough_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setUnderline(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->underline_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->url_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->url_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setValue(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->value_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setValueBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->value_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->setValue(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->setValueBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic v()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->PARSER:Ll/ng60;

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
    if-nez v1, :cond_c

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    const/16 p3, 0xa

    .line 62
    .line 63
    if-eq p1, p3, :cond_b

    .line 64
    .line 65
    const/16 p3, 0x12

    .line 66
    .line 67
    if-eq p1, p3, :cond_a

    .line 68
    .line 69
    const/16 p3, 0x18

    .line 70
    .line 71
    if-eq p1, p3, :cond_9

    .line 72
    .line 73
    const/16 p3, 0x22

    .line 74
    .line 75
    if-eq p1, p3, :cond_8

    .line 76
    .line 77
    const/16 p3, 0x2a

    .line 78
    .line 79
    if-eq p1, p3, :cond_7

    .line 80
    .line 81
    const/16 p3, 0x30

    .line 82
    .line 83
    if-eq p1, p3, :cond_6

    .line 84
    .line 85
    const/16 p3, 0x38

    .line 86
    .line 87
    if-eq p1, p3, :cond_5

    .line 88
    .line 89
    const/16 p3, 0x42

    .line 90
    .line 91
    if-eq p1, p3, :cond_4

    .line 92
    .line 93
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-nez p1, :cond_2

    .line 98
    .line 99
    :cond_3
    move v1, v2

    .line 100
    goto :goto_3

    .line 101
    :catch_0
    move-exception p1

    .line 102
    goto :goto_4

    .line 103
    :catch_1
    move-exception p1

    .line 104
    goto :goto_5

    .line 105
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->url_:Ljava/lang/String;

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->underline_:Z

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->strikethrough_:Z

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->backgroundColor_:Ljava/lang/String;

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->font_:Ljava/lang/String;

    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->size_:I

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->color_:Ljava/lang/String;

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->value_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 159
    .line 160
    goto :goto_3

    .line 161
    :catchall_1
    move-exception p0

    .line 162
    throw p0

    .line 163
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 164
    .line 165
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 177
    .line 178
    .line 179
    return-object v0

    .line 180
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 185
    .line 186
    .line 187
    return-object v0

    .line 188
    :cond_c
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 189
    .line 190
    return-object p0

    .line 191
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 192
    .line 193
    check-cast p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 194
    .line 195
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->value_:Ljava/lang/String;

    .line 196
    .line 197
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    xor-int/2addr p1, v2

    .line 202
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->value_:Ljava/lang/String;

    .line 203
    .line 204
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->value_:Ljava/lang/String;

    .line 205
    .line 206
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    xor-int/2addr v3, v2

    .line 211
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->value_:Ljava/lang/String;

    .line 212
    .line 213
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->value_:Ljava/lang/String;

    .line 218
    .line 219
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->color_:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    xor-int/2addr p1, v2

    .line 226
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->color_:Ljava/lang/String;

    .line 227
    .line 228
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->color_:Ljava/lang/String;

    .line 229
    .line 230
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 231
    .line 232
    .line 233
    move-result v3

    .line 234
    xor-int/2addr v3, v2

    .line 235
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->color_:Ljava/lang/String;

    .line 236
    .line 237
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->color_:Ljava/lang/String;

    .line 242
    .line 243
    iget p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->size_:I

    .line 244
    .line 245
    if-eqz p1, :cond_d

    .line 246
    .line 247
    move v0, v2

    .line 248
    goto :goto_6

    .line 249
    :cond_d
    move v0, v1

    .line 250
    :goto_6
    iget v3, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->size_:I

    .line 251
    .line 252
    if-eqz v3, :cond_e

    .line 253
    .line 254
    move v1, v2

    .line 255
    :cond_e
    invoke-interface {p2, v0, p1, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->size_:I

    .line 260
    .line 261
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->font_:Ljava/lang/String;

    .line 262
    .line 263
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 264
    .line 265
    .line 266
    move-result p1

    .line 267
    xor-int/2addr p1, v2

    .line 268
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->font_:Ljava/lang/String;

    .line 269
    .line 270
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->font_:Ljava/lang/String;

    .line 271
    .line 272
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    xor-int/2addr v1, v2

    .line 277
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->font_:Ljava/lang/String;

    .line 278
    .line 279
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->font_:Ljava/lang/String;

    .line 284
    .line 285
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->backgroundColor_:Ljava/lang/String;

    .line 286
    .line 287
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 288
    .line 289
    .line 290
    move-result p1

    .line 291
    xor-int/2addr p1, v2

    .line 292
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->backgroundColor_:Ljava/lang/String;

    .line 293
    .line 294
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->backgroundColor_:Ljava/lang/String;

    .line 295
    .line 296
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 297
    .line 298
    .line 299
    move-result v1

    .line 300
    xor-int/2addr v1, v2

    .line 301
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->backgroundColor_:Ljava/lang/String;

    .line 302
    .line 303
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->backgroundColor_:Ljava/lang/String;

    .line 308
    .line 309
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->strikethrough_:Z

    .line 310
    .line 311
    iget-boolean v0, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->strikethrough_:Z

    .line 312
    .line 313
    invoke-interface {p2, p1, p1, v0, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 314
    .line 315
    .line 316
    move-result p1

    .line 317
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->strikethrough_:Z

    .line 318
    .line 319
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->underline_:Z

    .line 320
    .line 321
    iget-boolean v0, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->underline_:Z

    .line 322
    .line 323
    invoke-interface {p2, p1, p1, v0, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 324
    .line 325
    .line 326
    move-result p1

    .line 327
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->underline_:Z

    .line 328
    .line 329
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->url_:Ljava/lang/String;

    .line 330
    .line 331
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 332
    .line 333
    .line 334
    move-result p1

    .line 335
    xor-int/2addr p1, v2

    .line 336
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->url_:Ljava/lang/String;

    .line 337
    .line 338
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->url_:Ljava/lang/String;

    .line 339
    .line 340
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 341
    .line 342
    .line 343
    move-result v1

    .line 344
    xor-int/2addr v1, v2

    .line 345
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->url_:Ljava/lang/String;

    .line 346
    .line 347
    invoke-interface {p2, p1, v0, v1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->url_:Ljava/lang/String;

    .line 352
    .line 353
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 354
    .line 355
    return-object p0

    .line 356
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent$Builder;

    .line 357
    .line 358
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent$Builder;-><init>(Ll/p3w;)V

    .line 359
    .line 360
    .line 361
    return-object p0

    .line 362
    :pswitch_5
    return-object v0

    .line 363
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 364
    .line 365
    return-object p0

    .line 366
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;

    .line 367
    .line 368
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;-><init>()V

    .line 369
    .line 370
    .line 371
    return-object p0

    .line 372
    nop

    .line 373
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

.method public getBackgroundColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->backgroundColor_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBackgroundColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->backgroundColor_:Ljava/lang/String;

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

.method public getColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->color_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->color_:Ljava/lang/String;

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

.method public getFont()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->font_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFontBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->font_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->value_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getValue()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->color_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getColor()Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->size_:I

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    const/4 v2, 0x3

    .line 49
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    add-int/2addr v0, v1

    .line 54
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->font_:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x4

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getFont()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    add-int/2addr v0, v1

    .line 72
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->backgroundColor_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getBackgroundColor()Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->strikethrough_:Z

    .line 91
    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    const/4 v2, 0x6

    .line 95
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    add-int/2addr v0, v1

    .line 100
    :cond_6
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->underline_:Z

    .line 101
    .line 102
    if-eqz v1, :cond_7

    .line 103
    .line 104
    const/4 v2, 0x7

    .line 105
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    add-int/2addr v0, v1

    .line 110
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->url_:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-nez v1, :cond_8

    .line 117
    .line 118
    const/16 v1, 0x8

    .line 119
    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getUrl()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    add-int/2addr v0, v1

    .line 129
    :cond_8
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 130
    .line 131
    return v0
.end method

.method public getSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->size_:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrikethrough()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->strikethrough_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getUnderline()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->underline_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->url_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->url_:Ljava/lang/String;

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

.method public getValue()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->value_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getValueBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->value_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->value_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getValue()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->color_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getColor()Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->size_:I

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const/4 v1, 0x3

    .line 38
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 39
    .line 40
    .line 41
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->font_:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_3

    .line 48
    .line 49
    const/4 v0, 0x4

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getFont()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->backgroundColor_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getBackgroundColor()Ljava/lang/String;

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
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->strikethrough_:Z

    .line 74
    .line 75
    if-eqz v0, :cond_5

    .line 76
    .line 77
    const/4 v1, 0x6

    .line 78
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 79
    .line 80
    .line 81
    :cond_5
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->underline_:Z

    .line 82
    .line 83
    if-eqz v0, :cond_6

    .line 84
    .line 85
    const/4 v1, 0x7

    .line 86
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 87
    .line 88
    .line 89
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->url_:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_7

    .line 96
    .line 97
    const/16 v0, 0x8

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$NodeContent;->getUrl()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :cond_7
    return-void
.end method
