.class public final Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PkItemCard"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;",
        "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

.field public static final DURATION_FIELD_NUMBER:I = 0x4

.field public static final ICON_FIELD_NUMBER:I = 0x7

.field public static final ISRESULT_FIELD_NUMBER:I = 0x5

.field public static final NAME_FIELD_NUMBER:I = 0x6

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;",
            ">;"
        }
    .end annotation
.end field

.field public static final STARTTS_FIELD_NUMBER:I = 0x3

.field public static final TEXT_FIELD_NUMBER:I = 0x2

.field public static final TYPE_FIELD_NUMBER:I = 0x1


# instance fields
.field private duration_:I

.field private icon_:Ljava/lang/String;

.field private isResult_:Z

.field private name_:Ljava/lang/String;

.field private startTs_:J

.field private text_:Ljava/lang/String;

.field private type_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->type_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->text_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->name_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->icon_:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->clearDuration()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->clearIcon()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->clearIsResult()V

    return-void
.end method

.method private clearDuration()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->duration_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearIcon()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->icon_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIsResult()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->isResult_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->name_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearStartTs()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->startTs_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearText()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->text_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->type_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->clearName()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->clearStartTs()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->clearText()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->clearType()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->setDuration(I)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->setIcon(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->setIconBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->setIsResult(Z)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->setName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->setNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->setStartTs(J)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->setText(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->setTextBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->setType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->setTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic s()Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    return-object v0
.end method

.method private setDuration(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->duration_:I

    .line 2
    .line 3
    return-void
.end method

.method private setIcon(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->icon_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->icon_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIsResult(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->isResult_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->name_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->name_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setStartTs(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->startTs_:J

    .line 2
    .line 3
    return-void
.end method

.method private setText(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->text_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->text_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->type_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->type_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->PARSER:Ll/ng60;

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
    const/16 p3, 0xa

    .line 63
    .line 64
    if-eq p1, p3, :cond_a

    .line 65
    .line 66
    const/16 p3, 0x12

    .line 67
    .line 68
    if-eq p1, p3, :cond_9

    .line 69
    .line 70
    const/16 p3, 0x18

    .line 71
    .line 72
    if-eq p1, p3, :cond_8

    .line 73
    .line 74
    const/16 p3, 0x20

    .line 75
    .line 76
    if-eq p1, p3, :cond_7

    .line 77
    .line 78
    const/16 p3, 0x28

    .line 79
    .line 80
    if-eq p1, p3, :cond_6

    .line 81
    .line 82
    const/16 p3, 0x32

    .line 83
    .line 84
    if-eq p1, p3, :cond_5

    .line 85
    .line 86
    const/16 p3, 0x3a

    .line 87
    .line 88
    if-eq p1, p3, :cond_4

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
    goto :goto_4

    .line 101
    :catch_1
    move-exception v0

    .line 102
    move-object p1, v0

    .line 103
    goto :goto_5

    .line 104
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->icon_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->name_:Ljava/lang/String;

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->isResult_:Z

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->duration_:I

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 133
    .line 134
    .line 135
    move-result-wide v3

    .line 136
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->startTs_:J

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->text_:Ljava/lang/String;

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->type_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 151
    .line 152
    goto :goto_3

    .line 153
    :catchall_1
    move-exception v0

    .line 154
    move-object p0, v0

    .line 155
    throw p0

    .line 156
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 157
    .line 158
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 170
    .line 171
    .line 172
    return-object v1

    .line 173
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 178
    .line 179
    .line 180
    return-object v1

    .line 181
    :cond_b
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 182
    .line 183
    return-object p0

    .line 184
    :pswitch_3
    move-object v3, p2

    .line 185
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 186
    .line 187
    check-cast p3, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 188
    .line 189
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->type_:Ljava/lang/String;

    .line 190
    .line 191
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    xor-int/2addr p1, v2

    .line 196
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->type_:Ljava/lang/String;

    .line 197
    .line 198
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->type_:Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    xor-int/2addr v1, v2

    .line 205
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->type_:Ljava/lang/String;

    .line 206
    .line 207
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->type_:Ljava/lang/String;

    .line 212
    .line 213
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->text_:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->text_:Ljava/lang/String;

    .line 221
    .line 222
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->text_:Ljava/lang/String;

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
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->text_:Ljava/lang/String;

    .line 230
    .line 231
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->text_:Ljava/lang/String;

    .line 236
    .line 237
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->startTs_:J

    .line 238
    .line 239
    const-wide/16 p1, 0x0

    .line 240
    .line 241
    cmp-long v1, v5, p1

    .line 242
    .line 243
    if-eqz v1, :cond_c

    .line 244
    .line 245
    move v4, v2

    .line 246
    goto :goto_6

    .line 247
    :cond_c
    move v4, v0

    .line 248
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->startTs_:J

    .line 249
    .line 250
    cmp-long p1, v8, p1

    .line 251
    .line 252
    if-eqz p1, :cond_d

    .line 253
    .line 254
    move v7, v2

    .line 255
    goto :goto_7

    .line 256
    :cond_d
    move v7, v0

    .line 257
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 258
    .line 259
    .line 260
    move-result-wide p1

    .line 261
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->startTs_:J

    .line 262
    .line 263
    iget p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->duration_:I

    .line 264
    .line 265
    if-eqz p1, :cond_e

    .line 266
    .line 267
    move p2, v2

    .line 268
    goto :goto_8

    .line 269
    :cond_e
    move p2, v0

    .line 270
    :goto_8
    iget v1, p3, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->duration_:I

    .line 271
    .line 272
    if-eqz v1, :cond_f

    .line 273
    .line 274
    move v0, v2

    .line 275
    :cond_f
    invoke-interface {v3, p2, p1, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 276
    .line 277
    .line 278
    move-result p1

    .line 279
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->duration_:I

    .line 280
    .line 281
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->isResult_:Z

    .line 282
    .line 283
    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->isResult_:Z

    .line 284
    .line 285
    invoke-interface {v3, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 286
    .line 287
    .line 288
    move-result p1

    .line 289
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->isResult_:Z

    .line 290
    .line 291
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->name_:Ljava/lang/String;

    .line 292
    .line 293
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 294
    .line 295
    .line 296
    move-result p1

    .line 297
    xor-int/2addr p1, v2

    .line 298
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->name_:Ljava/lang/String;

    .line 299
    .line 300
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->name_:Ljava/lang/String;

    .line 301
    .line 302
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 303
    .line 304
    .line 305
    move-result v0

    .line 306
    xor-int/2addr v0, v2

    .line 307
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->name_:Ljava/lang/String;

    .line 308
    .line 309
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object p1

    .line 313
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->name_:Ljava/lang/String;

    .line 314
    .line 315
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->icon_:Ljava/lang/String;

    .line 316
    .line 317
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 318
    .line 319
    .line 320
    move-result p1

    .line 321
    xor-int/2addr p1, v2

    .line 322
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->icon_:Ljava/lang/String;

    .line 323
    .line 324
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->icon_:Ljava/lang/String;

    .line 325
    .line 326
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 327
    .line 328
    .line 329
    move-result v0

    .line 330
    xor-int/2addr v0, v2

    .line 331
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->icon_:Ljava/lang/String;

    .line 332
    .line 333
    invoke-interface {v3, p1, p2, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object p1

    .line 337
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->icon_:Ljava/lang/String;

    .line 338
    .line 339
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 340
    .line 341
    return-object p0

    .line 342
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;

    .line 343
    .line 344
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard$Builder;-><init>(Ll/d3w;)V

    .line 345
    .line 346
    .line 347
    return-object p0

    .line 348
    :pswitch_5
    return-object v1

    .line 349
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 350
    .line 351
    return-object p0

    .line 352
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 353
    .line 354
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;-><init>()V

    .line 355
    .line 356
    .line 357
    return-object p0

    .line 358
    nop

    .line 359
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

.method public getDuration()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->duration_:I

    .line 2
    .line 3
    return p0
.end method

.method public getIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->icon_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->icon_:Ljava/lang/String;

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

.method public getIsResult()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->isResult_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->name_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->name_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->type_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getType()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->text_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getText()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->startTs_:J

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->duration_:I

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    const/4 v2, 0x4

    .line 63
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    add-int/2addr v0, v1

    .line 68
    :cond_4
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->isResult_:Z

    .line 69
    .line 70
    if-eqz v1, :cond_5

    .line 71
    .line 72
    const/4 v2, 0x5

    .line 73
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    add-int/2addr v0, v1

    .line 78
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->name_:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-nez v1, :cond_6

    .line 85
    .line 86
    const/4 v1, 0x6

    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getName()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    add-int/2addr v0, v1

    .line 96
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->icon_:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-nez v1, :cond_7

    .line 103
    .line 104
    const/4 v1, 0x7

    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getIcon()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    add-int/2addr v0, v1

    .line 114
    :cond_7
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 115
    .line 116
    return v0
.end method

.method public getStartTs()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->startTs_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->text_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->text_:Ljava/lang/String;

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

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->type_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->type_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->type_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getType()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->text_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getText()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->startTs_:J

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->duration_:I

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    const/4 v1, 0x4

    .line 50
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 51
    .line 52
    .line 53
    :cond_3
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->isResult_:Z

    .line 54
    .line 55
    if-eqz v0, :cond_4

    .line 56
    .line 57
    const/4 v1, 0x5

    .line 58
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 59
    .line 60
    .line 61
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->name_:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_5

    .line 68
    .line 69
    const/4 v0, 0x6

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getName()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->icon_:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_6

    .line 84
    .line 85
    const/4 v0, 0x7

    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getIcon()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_6
    return-void
.end method
