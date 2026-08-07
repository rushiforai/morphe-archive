.class public final Lcom/immomo/push/pb/Notify;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/push/pb/Notify$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/immomo/push/pb/Notify;",
        "Lcom/immomo/push/pb/Notify$b;",
        ">;",
        "Ll/lfz;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final INFO_FIELD_NUMBER:I = 0x6

.field public static final LT_FIELD_NUMBER:I = 0x3

.field public static final LV_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/immomo/push/pb/Notify;",
            ">;"
        }
    .end annotation
.end field

.field public static final TIME_FIELD_NUMBER:I = 0x5

.field public static final TOPKG_FIELD_NUMBER:I = 0x2


# instance fields
.field private id_:Ljava/lang/String;

.field private info_:Lcom/immomo/push/pb/NotifyInfo;

.field private lt_:Ljava/lang/String;

.field private lv_:I

.field private time_:J

.field private toPkg_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/push/pb/Notify;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/push/pb/Notify;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

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
    iput-object v0, p0, Lcom/immomo/push/pb/Notify;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/immomo/push/pb/Notify;->toPkg_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/immomo/push/pb/Notify;->lt_:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic access$000()Lcom/immomo/push/pb/Notify;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$100(Lcom/immomo/push/pb/Notify;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Notify;->setId(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1000(Lcom/immomo/push/pb/Notify;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Notify;->setLv(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1100(Lcom/immomo/push/pb/Notify;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Notify;->clearLv()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1200(Lcom/immomo/push/pb/Notify;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/push/pb/Notify;->setTime(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1300(Lcom/immomo/push/pb/Notify;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Notify;->clearTime()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1400(Lcom/immomo/push/pb/Notify;Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Notify;->setInfo(Lcom/immomo/push/pb/NotifyInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1500(Lcom/immomo/push/pb/Notify;Lcom/immomo/push/pb/NotifyInfo$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Notify;->setInfo(Lcom/immomo/push/pb/NotifyInfo$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1600(Lcom/immomo/push/pb/Notify;Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Notify;->mergeInfo(Lcom/immomo/push/pb/NotifyInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1700(Lcom/immomo/push/pb/Notify;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Notify;->clearInfo()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/immomo/push/pb/Notify;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Notify;->clearId()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lcom/immomo/push/pb/Notify;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Notify;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/immomo/push/pb/Notify;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Notify;->setToPkg(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/immomo/push/pb/Notify;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Notify;->clearToPkg()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Lcom/immomo/push/pb/Notify;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Notify;->setToPkgBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$700(Lcom/immomo/push/pb/Notify;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Notify;->setLt(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$800(Lcom/immomo/push/pb/Notify;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Notify;->clearLt()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$900(Lcom/immomo/push/pb/Notify;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Notify;->setLtBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/push/pb/Notify;->getDefaultInstance()Lcom/immomo/push/pb/Notify;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/immomo/push/pb/Notify;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/immomo/push/pb/Notify;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearInfo()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    .line 3
    .line 4
    return-void
.end method

.method private clearLt()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/push/pb/Notify;->getDefaultInstance()Lcom/immomo/push/pb/Notify;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/immomo/push/pb/Notify;->getLt()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/immomo/push/pb/Notify;->lt_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLv()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/immomo/push/pb/Notify;->lv_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/immomo/push/pb/Notify;->time_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearToPkg()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/push/pb/Notify;->getDefaultInstance()Lcom/immomo/push/pb/Notify;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/immomo/push/pb/Notify;->getToPkg()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/immomo/push/pb/Notify;->toPkg_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static getDefaultInstance()Lcom/immomo/push/pb/Notify;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    .line 2
    .line 3
    return-object v0
.end method

.method private mergeInfo(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/immomo/push/pb/NotifyInfo;->getDefaultInstance()Lcom/immomo/push/pb/NotifyInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/immomo/push/pb/NotifyInfo;->newBuilder(Lcom/immomo/push/pb/NotifyInfo;)Lcom/immomo/push/pb/NotifyInfo$b;

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
    check-cast p1, Lcom/immomo/push/pb/NotifyInfo$b;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/immomo/push/pb/NotifyInfo;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    .line 33
    .line 34
    return-void
.end method

.method public static newBuilder()Lcom/immomo/push/pb/Notify$b;
    .locals 1

    .line 16
    sget-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/immomo/push/pb/Notify$b;

    return-object v0
.end method

.method public static newBuilder(Lcom/immomo/push/pb/Notify;)Lcom/immomo/push/pb/Notify$b;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/immomo/push/pb/Notify$b;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/immomo/push/pb/Notify$b;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/immomo/push/pb/Notify;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/push/pb/Notify;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/Notify;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Notify;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/immomo/push/pb/Notify;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/push/pb/Notify;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/Notify;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Notify;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/immomo/push/pb/Notify;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Notify;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/Notify;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Notify;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/immomo/push/pb/Notify;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Notify;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/Notify;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Notify;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/immomo/push/pb/Notify;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Notify;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/immomo/push/pb/Notify;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Notify;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/immomo/push/pb/Notify;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

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

.method private setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setInfo(Lcom/immomo/push/pb/NotifyInfo$b;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/immomo/push/pb/NotifyInfo;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    .line 8
    .line 9
    return-void
.end method

.method private setInfo(Lcom/immomo/push/pb/NotifyInfo;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    return-void
.end method

.method private setLt(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->lt_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLtBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->lt_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLv(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/push/pb/Notify;->lv_:I

    .line 2
    .line 3
    return-void
.end method

.method private setTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/push/pb/Notify;->time_:J

    .line 2
    .line 3
    return-void
.end method

.method private setToPkg(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->toPkg_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setToPkgBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->toPkg_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    .line 1
    sget-object v0, Lcom/immomo/push/pb/Notify$a;->a:[I

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
    sget-object p0, Lcom/immomo/push/pb/Notify;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/immomo/push/pb/Notify;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/immomo/push/pb/Notify;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/immomo/push/pb/Notify;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/immomo/push/pb/Notify;->PARSER:Ll/ng60;

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
    if-eq p1, v3, :cond_9

    .line 69
    .line 70
    const/16 v3, 0x1a

    .line 71
    .line 72
    if-eq p1, v3, :cond_8

    .line 73
    .line 74
    const/16 v3, 0x20

    .line 75
    .line 76
    if-eq p1, v3, :cond_7

    .line 77
    .line 78
    const/16 v3, 0x28

    .line 79
    .line 80
    if-eq p1, v3, :cond_6

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
    iget-object p1, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    .line 101
    .line 102
    if-eqz p1, :cond_5

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    check-cast p1, Lcom/immomo/push/pb/NotifyInfo$b;

    .line 109
    .line 110
    goto :goto_4

    .line 111
    :cond_5
    move-object p1, v1

    .line 112
    :goto_4
    invoke-static {}, Lcom/immomo/push/pb/NotifyInfo;->parser()Ll/ng60;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    check-cast v3, Lcom/immomo/push/pb/NotifyInfo;

    .line 121
    .line 122
    iput-object v3, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    .line 123
    .line 124
    if-eqz p1, :cond_2

    .line 125
    .line 126
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    check-cast p1, Lcom/immomo/push/pb/NotifyInfo;

    .line 134
    .line 135
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 139
    .line 140
    .line 141
    move-result-wide v3

    .line 142
    iput-wide v3, p0, Lcom/immomo/push/pb/Notify;->time_:J

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    iput p1, p0, Lcom/immomo/push/pb/Notify;->lv_:I

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->lt_:Ljava/lang/String;

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->toPkg_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->id_:Ljava/lang/String;
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
    sget-object p0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    .line 202
    .line 203
    return-object p0

    .line 204
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 205
    .line 206
    check-cast p3, Lcom/immomo/push/pb/Notify;

    .line 207
    .line 208
    iget-object p1, p0, Lcom/immomo/push/pb/Notify;->id_:Ljava/lang/String;

    .line 209
    .line 210
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    xor-int/2addr p1, v2

    .line 215
    iget-object v1, p0, Lcom/immomo/push/pb/Notify;->id_:Ljava/lang/String;

    .line 216
    .line 217
    iget-object v3, p3, Lcom/immomo/push/pb/Notify;->id_:Ljava/lang/String;

    .line 218
    .line 219
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 220
    .line 221
    .line 222
    move-result v3

    .line 223
    xor-int/2addr v3, v2

    .line 224
    iget-object v4, p3, Lcom/immomo/push/pb/Notify;->id_:Ljava/lang/String;

    .line 225
    .line 226
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->id_:Ljava/lang/String;

    .line 231
    .line 232
    iget-object p1, p0, Lcom/immomo/push/pb/Notify;->toPkg_:Ljava/lang/String;

    .line 233
    .line 234
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 235
    .line 236
    .line 237
    move-result p1

    .line 238
    xor-int/2addr p1, v2

    .line 239
    iget-object v1, p0, Lcom/immomo/push/pb/Notify;->toPkg_:Ljava/lang/String;

    .line 240
    .line 241
    iget-object v3, p3, Lcom/immomo/push/pb/Notify;->toPkg_:Ljava/lang/String;

    .line 242
    .line 243
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 244
    .line 245
    .line 246
    move-result v3

    .line 247
    xor-int/2addr v3, v2

    .line 248
    iget-object v4, p3, Lcom/immomo/push/pb/Notify;->toPkg_:Ljava/lang/String;

    .line 249
    .line 250
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->toPkg_:Ljava/lang/String;

    .line 255
    .line 256
    iget-object p1, p0, Lcom/immomo/push/pb/Notify;->lt_:Ljava/lang/String;

    .line 257
    .line 258
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 259
    .line 260
    .line 261
    move-result p1

    .line 262
    xor-int/2addr p1, v2

    .line 263
    iget-object v1, p0, Lcom/immomo/push/pb/Notify;->lt_:Ljava/lang/String;

    .line 264
    .line 265
    iget-object v3, p3, Lcom/immomo/push/pb/Notify;->lt_:Ljava/lang/String;

    .line 266
    .line 267
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 268
    .line 269
    .line 270
    move-result v3

    .line 271
    xor-int/2addr v3, v2

    .line 272
    iget-object v4, p3, Lcom/immomo/push/pb/Notify;->lt_:Ljava/lang/String;

    .line 273
    .line 274
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->lt_:Ljava/lang/String;

    .line 279
    .line 280
    iget p1, p0, Lcom/immomo/push/pb/Notify;->lv_:I

    .line 281
    .line 282
    if-eqz p1, :cond_c

    .line 283
    .line 284
    move v1, v2

    .line 285
    goto :goto_7

    .line 286
    :cond_c
    move v1, v0

    .line 287
    :goto_7
    iget v3, p3, Lcom/immomo/push/pb/Notify;->lv_:I

    .line 288
    .line 289
    if-eqz v3, :cond_d

    .line 290
    .line 291
    move v4, v2

    .line 292
    goto :goto_8

    .line 293
    :cond_d
    move v4, v0

    .line 294
    :goto_8
    invoke-interface {p2, v1, p1, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 295
    .line 296
    .line 297
    move-result p1

    .line 298
    iput p1, p0, Lcom/immomo/push/pb/Notify;->lv_:I

    .line 299
    .line 300
    move p1, v2

    .line 301
    iget-wide v2, p0, Lcom/immomo/push/pb/Notify;->time_:J

    .line 302
    .line 303
    const-wide/16 v4, 0x0

    .line 304
    .line 305
    cmp-long v1, v2, v4

    .line 306
    .line 307
    if-eqz v1, :cond_e

    .line 308
    .line 309
    move v1, p1

    .line 310
    :goto_9
    move-wide v7, v4

    .line 311
    goto :goto_a

    .line 312
    :cond_e
    move v1, v0

    .line 313
    goto :goto_9

    .line 314
    :goto_a
    iget-wide v5, p3, Lcom/immomo/push/pb/Notify;->time_:J

    .line 315
    .line 316
    cmp-long v4, v5, v7

    .line 317
    .line 318
    if-eqz v4, :cond_f

    .line 319
    .line 320
    move v4, p1

    .line 321
    :goto_b
    move-object v0, p2

    .line 322
    goto :goto_c

    .line 323
    :cond_f
    move v4, v0

    .line 324
    goto :goto_b

    .line 325
    :goto_c
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 326
    .line 327
    .line 328
    move-result-wide p1

    .line 329
    iput-wide p1, p0, Lcom/immomo/push/pb/Notify;->time_:J

    .line 330
    .line 331
    iget-object p1, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    .line 332
    .line 333
    iget-object p2, p3, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    .line 334
    .line 335
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 336
    .line 337
    .line 338
    move-result-object p1

    .line 339
    check-cast p1, Lcom/immomo/push/pb/NotifyInfo;

    .line 340
    .line 341
    iput-object p1, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    .line 342
    .line 343
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 344
    .line 345
    return-object p0

    .line 346
    :pswitch_4
    new-instance p0, Lcom/immomo/push/pb/Notify$b;

    .line 347
    .line 348
    invoke-direct {p0, v1}, Lcom/immomo/push/pb/Notify$b;-><init>(Lcom/immomo/push/pb/Notify$a;)V

    .line 349
    .line 350
    .line 351
    return-object p0

    .line 352
    :pswitch_5
    return-object v1

    .line 353
    :pswitch_6
    sget-object p0, Lcom/immomo/push/pb/Notify;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Notify;

    .line 354
    .line 355
    return-object p0

    .line 356
    :pswitch_7
    new-instance p0, Lcom/immomo/push/pb/Notify;

    .line 357
    .line 358
    invoke-direct {p0}, Lcom/immomo/push/pb/Notify;-><init>()V

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

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Notify;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Notify;->id_:Ljava/lang/String;

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

.method public getInfo()Lcom/immomo/push/pb/NotifyInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/immomo/push/pb/NotifyInfo;->getDefaultInstance()Lcom/immomo/push/pb/NotifyInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getLt()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Notify;->lt_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLtBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Notify;->lt_:Ljava/lang/String;

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

.method public getLv()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/push/pb/Notify;->lv_:I

    .line 2
    .line 3
    return p0
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
    iget-object v0, p0, Lcom/immomo/push/pb/Notify;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/Notify;->getId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/immomo/push/pb/Notify;->toPkg_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/Notify;->getToPkg()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/immomo/push/pb/Notify;->lt_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/Notify;->getLt()Ljava/lang/String;

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
    iget v1, p0, Lcom/immomo/push/pb/Notify;->lv_:I

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    const/4 v2, 0x4

    .line 67
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    add-int/2addr v0, v1

    .line 72
    :cond_4
    iget-wide v1, p0, Lcom/immomo/push/pb/Notify;->time_:J

    .line 73
    .line 74
    const-wide/16 v3, 0x0

    .line 75
    .line 76
    cmp-long v3, v1, v3

    .line 77
    .line 78
    if-eqz v3, :cond_5

    .line 79
    .line 80
    const/4 v3, 0x5

    .line 81
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    add-int/2addr v0, v1

    .line 86
    :cond_5
    iget-object v1, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    const/4 v1, 0x6

    .line 91
    invoke-virtual {p0}, Lcom/immomo/push/pb/Notify;->getInfo()Lcom/immomo/push/pb/NotifyInfo;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    add-int/2addr v0, v1

    .line 100
    :cond_6
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 101
    .line 102
    return v0
.end method

.method public getTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/push/pb/Notify;->time_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getToPkg()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Notify;->toPkg_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToPkgBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Notify;->toPkg_:Ljava/lang/String;

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

.method public hasInfo()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

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
    iget-object v0, p0, Lcom/immomo/push/pb/Notify;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/Notify;->getId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/immomo/push/pb/Notify;->toPkg_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/Notify;->getToPkg()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/immomo/push/pb/Notify;->lt_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/Notify;->getLt()Ljava/lang/String;

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
    iget v0, p0, Lcom/immomo/push/pb/Notify;->lv_:I

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    const/4 v1, 0x4

    .line 54
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-wide v0, p0, Lcom/immomo/push/pb/Notify;->time_:J

    .line 58
    .line 59
    const-wide/16 v2, 0x0

    .line 60
    .line 61
    cmp-long v2, v0, v2

    .line 62
    .line 63
    if-eqz v2, :cond_4

    .line 64
    .line 65
    const/4 v2, 0x5

    .line 66
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 67
    .line 68
    .line 69
    :cond_4
    iget-object v0, p0, Lcom/immomo/push/pb/Notify;->info_:Lcom/immomo/push/pb/NotifyInfo;

    .line 70
    .line 71
    if-eqz v0, :cond_5

    .line 72
    .line 73
    const/4 v0, 0x6

    .line 74
    invoke-virtual {p0}, Lcom/immomo/push/pb/Notify;->getInfo()Lcom/immomo/push/pb/NotifyInfo;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 79
    .line 80
    .line 81
    :cond_5
    return-void
.end method
