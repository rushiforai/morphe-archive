.class public final Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEventOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "QuickchatChannelEvent"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;",
        "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEventOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

.field public static final EVENTNAME_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;",
            ">;"
        }
    .end annotation
.end field

.field public static final STATUS_FIELD_NUMBER:I = 0x2

.field public static final VERSION_FIELD_NUMBER:I = 0x3


# instance fields
.field private eventName_:Ljava/lang/String;

.field private status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

.field private version_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->eventName_:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->clearEventName()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->clearStatus()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->clearVersion()V

    return-void
.end method

.method private clearEventName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->getEventName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->eventName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearStatus()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 3
    .line 4
    return-void
.end method

.method private clearVersion()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->version_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->mergeStatus(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->setEventName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->setEventNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->setStatus(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel$Builder;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->setStatus(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->setVersion(J)V

    return-void
.end method

.method public static bridge synthetic j()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    return-object v0
.end method

.method private mergeStatus(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;->newBuilder(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 33
    .line 34
    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

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

.method private setEventName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->eventName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setEventNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->eventName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setStatus(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 8
    .line 9
    return-void
.end method

.method private setStatus(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    return-void
.end method

.method private setVersion(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->version_:J

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_8

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
    if-eq p1, v3, :cond_7

    .line 65
    .line 66
    const/16 v3, 0x12

    .line 67
    .line 68
    if-eq p1, v3, :cond_5

    .line 69
    .line 70
    const/16 v3, 0x18

    .line 71
    .line 72
    if-eq p1, v3, :cond_4

    .line 73
    .line 74
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_2

    .line 79
    .line 80
    :cond_3
    move v0, v2

    .line 81
    goto :goto_3

    .line 82
    :catch_0
    move-exception v0

    .line 83
    move-object p1, v0

    .line 84
    goto :goto_5

    .line 85
    :catch_1
    move-exception v0

    .line 86
    move-object p1, v0

    .line 87
    goto :goto_6

    .line 88
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 89
    .line 90
    .line 91
    move-result-wide v3

    .line 92
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->version_:J

    .line 93
    .line 94
    goto :goto_3

    .line 95
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 96
    .line 97
    if-eqz p1, :cond_6

    .line 98
    .line 99
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    check-cast p1, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel$Builder;

    .line 104
    .line 105
    goto :goto_4

    .line 106
    :cond_6
    move-object p1, v1

    .line 107
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;->parser()Ll/ng60;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    check-cast v3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 116
    .line 117
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 118
    .line 119
    if-eqz p1, :cond_2

    .line 120
    .line 121
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    check-cast p1, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 129
    .line 130
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->eventName_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 138
    .line 139
    goto :goto_3

    .line 140
    :catchall_1
    move-exception v0

    .line 141
    move-object p0, v0

    .line 142
    throw p0

    .line 143
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 144
    .line 145
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 157
    .line 158
    .line 159
    return-object v1

    .line 160
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 165
    .line 166
    .line 167
    return-object v1

    .line 168
    :cond_8
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 169
    .line 170
    return-object p0

    .line 171
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 172
    .line 173
    check-cast p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 174
    .line 175
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->eventName_:Ljava/lang/String;

    .line 176
    .line 177
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    xor-int/2addr p1, v2

    .line 182
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->eventName_:Ljava/lang/String;

    .line 183
    .line 184
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->eventName_:Ljava/lang/String;

    .line 185
    .line 186
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    xor-int/2addr v3, v2

    .line 191
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->eventName_:Ljava/lang/String;

    .line 192
    .line 193
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->eventName_:Ljava/lang/String;

    .line 198
    .line 199
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 200
    .line 201
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 202
    .line 203
    invoke-interface {p2, p1, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    check-cast p1, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 208
    .line 209
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 210
    .line 211
    move p1, v2

    .line 212
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->version_:J

    .line 213
    .line 214
    const-wide/16 v4, 0x0

    .line 215
    .line 216
    cmp-long v1, v2, v4

    .line 217
    .line 218
    if-eqz v1, :cond_9

    .line 219
    .line 220
    move v1, p1

    .line 221
    goto :goto_7

    .line 222
    :cond_9
    move v1, v0

    .line 223
    :goto_7
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->version_:J

    .line 224
    .line 225
    cmp-long p3, v6, v4

    .line 226
    .line 227
    if-eqz p3, :cond_a

    .line 228
    .line 229
    move v4, p1

    .line 230
    move-object v0, p2

    .line 231
    move-wide v5, v6

    .line 232
    goto :goto_8

    .line 233
    :cond_a
    move v4, v0

    .line 234
    move-wide v5, v6

    .line 235
    move-object v0, p2

    .line 236
    :goto_8
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 237
    .line 238
    .line 239
    move-result-wide p1

    .line 240
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->version_:J

    .line 241
    .line 242
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 243
    .line 244
    return-object p0

    .line 245
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;

    .line 246
    .line 247
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent$Builder;-><init>(Ll/i4w;)V

    .line 248
    .line 249
    .line 250
    return-object p0

    .line 251
    :pswitch_5
    return-object v1

    .line 252
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 253
    .line 254
    return-object p0

    .line 255
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;

    .line 256
    .line 257
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;-><init>()V

    .line 258
    .line 259
    .line 260
    return-object p0

    .line 261
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

.method public getEventName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->eventName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEventNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->eventName_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->eventName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->getEventName()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->getStatus()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->version_:J

    .line 41
    .line 42
    const-wide/16 v3, 0x0

    .line 43
    .line 44
    cmp-long v3, v1, v3

    .line 45
    .line 46
    if-eqz v3, :cond_3

    .line 47
    .line 48
    const/4 v3, 0x3

    .line 49
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    add-int/2addr v0, v1

    .line 54
    :cond_3
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 55
    .line 56
    return v0
.end method

.method public getStatus()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getVersion()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->version_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hasStatus()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->eventName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->getEventName()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->status_:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->getStatus()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannel;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatChannelEvent;->version_:J

    .line 30
    .line 31
    const-wide/16 v2, 0x0

    .line 32
    .line 33
    cmp-long p0, v0, v2

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    const/4 p0, 0x3

    .line 38
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 39
    .line 40
    .line 41
    :cond_2
    return-void
.end method
