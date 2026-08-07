.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MultiCallMessage"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;,
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessageOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

.field public static final MULTICALL_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static final TEMPLATE_FIELD_NUMBER:I = 0x4

.field public static final TOAST_FIELD_NUMBER:I = 0x3

.field public static final TYPE_FIELD_NUMBER:I = 0x1


# instance fields
.field private multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

.field private template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

.field private toast_:Ljava/lang/String;

.field private type_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->toast_:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->clearMultiCall()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->clearTemplate()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->clearToast()V

    return-void
.end method

.method private clearMultiCall()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 3
    .line 4
    return-void
.end method

.method private clearTemplate()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 3
    .line 4
    return-void
.end method

.method private clearToast()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->getToast()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->toast_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->type_:I

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->clearType()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->mergeMultiCall(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->mergeTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->setMultiCall(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall$Builder;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->setMultiCall(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->setTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->setTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->setToast(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->setToastBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->setType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;)V

    return-void
.end method

.method private mergeMultiCall(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 33
    .line 34
    return-void
.end method

.method private mergeTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->newBuilder(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->setTypeValue(I)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

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

.method private setMultiCall(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 8
    .line 9
    return-void
.end method

.method private setMultiCall(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    return-void
.end method

.method private setTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 8
    .line 9
    return-void
.end method

.method private setTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    return-void
.end method

.method private setToast(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->toast_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setToastBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->toast_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->type_:I

    .line 9
    .line 10
    return-void
.end method

.method private setTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->type_:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    return-object v1

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_a

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
    const/16 v3, 0x8

    .line 62
    .line 63
    if-eq p1, v3, :cond_9

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq p1, v3, :cond_7

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq p1, v3, :cond_6

    .line 72
    .line 73
    const/16 v3, 0x22

    .line 74
    .line 75
    if-eq p1, v3, :cond_4

    .line 76
    .line 77
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-nez p1, :cond_2

    .line 82
    .line 83
    :cond_3
    move v0, v2

    .line 84
    goto :goto_3

    .line 85
    :catch_0
    move-exception p1

    .line 86
    goto :goto_6

    .line 87
    :catch_1
    move-exception p1

    .line 88
    goto/16 :goto_7

    .line 89
    .line 90
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 91
    .line 92
    if-eqz p1, :cond_5

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 99
    .line 100
    goto :goto_4

    .line 101
    :cond_5
    move-object p1, v1

    .line 102
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->parser()Ll/ng60;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    check-cast v3, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 111
    .line 112
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 113
    .line 114
    if-eqz p1, :cond_2

    .line 115
    .line 116
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 124
    .line 125
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->toast_:Ljava/lang/String;

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 136
    .line 137
    if-eqz p1, :cond_8

    .line 138
    .line 139
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall$Builder;

    .line 144
    .line 145
    goto :goto_5

    .line 146
    :cond_8
    move-object p1, v1

    .line 147
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->parser()Ll/ng60;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 156
    .line 157
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 158
    .line 159
    if-eqz p1, :cond_2

    .line 160
    .line 161
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 169
    .line 170
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->type_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :catchall_1
    move-exception p0

    .line 181
    throw p0

    .line 182
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 183
    .line 184
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 196
    .line 197
    .line 198
    return-object v1

    .line 199
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 204
    .line 205
    .line 206
    return-object v1

    .line 207
    :cond_a
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    .line 208
    .line 209
    return-object p0

    .line 210
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 211
    .line 212
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    .line 213
    .line 214
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->type_:I

    .line 215
    .line 216
    if-eqz p1, :cond_b

    .line 217
    .line 218
    move v1, v2

    .line 219
    goto :goto_8

    .line 220
    :cond_b
    move v1, v0

    .line 221
    :goto_8
    iget v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->type_:I

    .line 222
    .line 223
    if-eqz v3, :cond_c

    .line 224
    .line 225
    move v0, v2

    .line 226
    :cond_c
    invoke-interface {p2, v1, p1, v0, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 227
    .line 228
    .line 229
    move-result p1

    .line 230
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->type_:I

    .line 231
    .line 232
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 233
    .line 234
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 235
    .line 236
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 241
    .line 242
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 243
    .line 244
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->toast_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->toast_:Ljava/lang/String;

    .line 252
    .line 253
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->toast_:Ljava/lang/String;

    .line 254
    .line 255
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    xor-int/2addr v1, v2

    .line 260
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->toast_:Ljava/lang/String;

    .line 261
    .line 262
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->toast_:Ljava/lang/String;

    .line 267
    .line 268
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 269
    .line 270
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 271
    .line 272
    invoke-interface {p2, p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 277
    .line 278
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 279
    .line 280
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 281
    .line 282
    return-object p0

    .line 283
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Builder;

    .line 284
    .line 285
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Builder;-><init>(Ll/m3w;)V

    .line 286
    .line 287
    .line 288
    return-object p0

    .line 289
    :pswitch_5
    return-object v1

    .line 290
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    .line 291
    .line 292
    return-object p0

    .line 293
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;

    .line 294
    .line 295
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;-><init>()V

    .line 296
    .line 297
    .line 298
    return-object p0

    .line 299
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

.method public getMultiCall()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->type_:I

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->apply:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->getNumber()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->type_:I

    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->getMultiCall()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->toast_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->getToast()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x4

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    add-int/2addr v0, v1

    .line 72
    :cond_4
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 73
    .line 74
    return v0
.end method

.method public getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getToast()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->toast_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToastBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->toast_:Ljava/lang/String;

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

.method public getType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->type_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->type_:I

    .line 2
    .line 3
    return p0
.end method

.method public hasMultiCall()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

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

.method public hasTemplate()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->type_:I

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->apply:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;->getNumber()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->type_:I

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->multiCall_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->getMultiCall()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->toast_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->getToast()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    const/4 v0, 0x4

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    return-void
.end method
