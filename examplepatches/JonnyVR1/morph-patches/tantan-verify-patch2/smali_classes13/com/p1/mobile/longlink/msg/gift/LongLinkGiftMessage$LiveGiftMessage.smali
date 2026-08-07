.class public final Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LiveGiftMessage"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessageOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static final ROOMID_FIELD_NUMBER:I = 0x2

.field public static final TEMPDATA_FIELD_NUMBER:I = 0x1


# instance fields
.field private roomId_:Ljava/lang/String;

.field private tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->roomId_:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->clearRoomId()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->clearTempdata()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->mergeTempdata(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)V

    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTempdata()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->setTempdata(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->setTempdata(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    return-object v0
.end method

.method private mergeTempdata(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 33
    .line 34
    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

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

.method private setRoomId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTempdata(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 8
    .line 9
    return-void
.end method

.method private setTempdata(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->PARSER:Ll/ng60;

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
    if-nez p1, :cond_7

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
    if-eq v2, v3, :cond_5

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq v2, v3, :cond_4

    .line 68
    .line 69
    invoke-virtual {p2, v2}, Lcom/google/protobuf/e;->R(I)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-nez v2, :cond_2

    .line 74
    .line 75
    :cond_3
    move p1, v1

    .line 76
    goto :goto_3

    .line 77
    :catch_0
    move-exception p1

    .line 78
    goto :goto_5

    .line 79
    :catch_1
    move-exception p1

    .line 80
    goto :goto_6

    .line 81
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->roomId_:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_3

    .line 88
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 89
    .line 90
    if-eqz v2, :cond_6

    .line 91
    .line 92
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;

    .line 97
    .line 98
    goto :goto_4

    .line 99
    :cond_6
    move-object v2, v0

    .line 100
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->parser()Ll/ng60;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 109
    .line 110
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 111
    .line 112
    if-eqz v2, :cond_2

    .line 113
    .line 114
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 122
    .line 123
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :catchall_1
    move-exception p0

    .line 127
    throw p0

    .line 128
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 129
    .line 130
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 142
    .line 143
    .line 144
    return-object v0

    .line 145
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 150
    .line 151
    .line 152
    return-object v0

    .line 153
    :cond_7
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    .line 154
    .line 155
    return-object p0

    .line 156
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 157
    .line 158
    check-cast p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    .line 159
    .line 160
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 161
    .line 162
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 163
    .line 164
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 169
    .line 170
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 171
    .line 172
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->roomId_:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    xor-int/2addr p1, v1

    .line 179
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->roomId_:Ljava/lang/String;

    .line 180
    .line 181
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->roomId_:Ljava/lang/String;

    .line 182
    .line 183
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    xor-int/2addr v1, v2

    .line 188
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->roomId_:Ljava/lang/String;

    .line 189
    .line 190
    invoke-interface {p2, p1, v0, v1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->roomId_:Ljava/lang/String;

    .line 195
    .line 196
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 197
    .line 198
    return-object p0

    .line 199
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage$Builder;

    .line 200
    .line 201
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage$Builder;-><init>(Ll/o2w;)V

    .line 202
    .line 203
    .line 204
    return-object p0

    .line 205
    :pswitch_5
    return-object v0

    .line 206
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    .line 207
    .line 208
    return-object p0

    .line 209
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;

    .line 210
    .line 211
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;-><init>()V

    .line 212
    .line 213
    .line 214
    return-object p0

    .line 215
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

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->roomId_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->getTempdata()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->getRoomId()Ljava/lang/String;

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
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 41
    .line 42
    return v0
.end method

.method public getTempdata()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public hasTempdata()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->getTempdata()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftMessage;->getRoomId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method
