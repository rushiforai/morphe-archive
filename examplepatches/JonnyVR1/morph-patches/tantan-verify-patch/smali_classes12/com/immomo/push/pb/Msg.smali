.class public final Lcom/immomo/push/pb/Msg;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/push/pb/Msg$b;,
        Lcom/immomo/push/pb/Msg$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/immomo/push/pb/Msg;",
        "Lcom/immomo/push/pb/Msg$b;",
        ">;",
        "Ll/lfz;"
    }
.end annotation


# static fields
.field public static final DATA_FIELD_NUMBER:I = 0x8

.field private static final DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final LT_FIELD_NUMBER:I = 0x3

.field public static final LV_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/immomo/push/pb/Msg;",
            ">;"
        }
    .end annotation
.end field

.field public static final TEXT_FIELD_NUMBER:I = 0x6

.field public static final TIME_FIELD_NUMBER:I = 0x5

.field public static final TOPKG_FIELD_NUMBER:I = 0x2

.field public static final TYPE_FIELD_NUMBER:I = 0x7


# instance fields
.field private bitField0_:I

.field private data_:Lcom/google/protobuf/MapFieldLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/MapFieldLite<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private id_:Ljava/lang/String;

.field private lt_:Ljava/lang/String;

.field private lv_:I

.field private text_:Ljava/lang/String;

.field private time_:J

.field private toPkg_:Ljava/lang/String;

.field private type_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/push/pb/Msg;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/push/pb/Msg;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

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
    invoke-static {}, Lcom/google/protobuf/MapFieldLite;->emptyMapField()Lcom/google/protobuf/MapFieldLite;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/immomo/push/pb/Msg;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Lcom/immomo/push/pb/Msg;->id_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/immomo/push/pb/Msg;->toPkg_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/immomo/push/pb/Msg;->lt_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/immomo/push/pb/Msg;->text_:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic access$000()Lcom/immomo/push/pb/Msg;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$100(Lcom/immomo/push/pb/Msg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Msg;->setId(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1000(Lcom/immomo/push/pb/Msg;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Msg;->setLv(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1100(Lcom/immomo/push/pb/Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->clearLv()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1200(Lcom/immomo/push/pb/Msg;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/push/pb/Msg;->setTime(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1300(Lcom/immomo/push/pb/Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->clearTime()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1400(Lcom/immomo/push/pb/Msg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Msg;->setText(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1500(Lcom/immomo/push/pb/Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->clearText()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1600(Lcom/immomo/push/pb/Msg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Msg;->setTextBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1700(Lcom/immomo/push/pb/Msg;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Msg;->setType(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1800(Lcom/immomo/push/pb/Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->clearType()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1900(Lcom/immomo/push/pb/Msg;)Ljava/util/Map;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->getMutableDataMap()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$200(Lcom/immomo/push/pb/Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->clearId()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lcom/immomo/push/pb/Msg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Msg;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/immomo/push/pb/Msg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Msg;->setToPkg(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/immomo/push/pb/Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->clearToPkg()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Lcom/immomo/push/pb/Msg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Msg;->setToPkgBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$700(Lcom/immomo/push/pb/Msg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Msg;->setLt(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$800(Lcom/immomo/push/pb/Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->clearLt()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$900(Lcom/immomo/push/pb/Msg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/push/pb/Msg;->setLtBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/push/pb/Msg;->getDefaultInstance()Lcom/immomo/push/pb/Msg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/immomo/push/pb/Msg;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/immomo/push/pb/Msg;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLt()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/push/pb/Msg;->getDefaultInstance()Lcom/immomo/push/pb/Msg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/immomo/push/pb/Msg;->getLt()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/immomo/push/pb/Msg;->lt_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLv()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/immomo/push/pb/Msg;->lv_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearText()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/push/pb/Msg;->getDefaultInstance()Lcom/immomo/push/pb/Msg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/immomo/push/pb/Msg;->getText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/immomo/push/pb/Msg;->text_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/immomo/push/pb/Msg;->time_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearToPkg()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/push/pb/Msg;->getDefaultInstance()Lcom/immomo/push/pb/Msg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/immomo/push/pb/Msg;->getToPkg()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/immomo/push/pb/Msg;->toPkg_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/immomo/push/pb/Msg;->type_:I

    .line 3
    .line 4
    return-void
.end method

.method public static getDefaultInstance()Lcom/immomo/push/pb/Msg;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    .line 2
    .line 3
    return-object v0
.end method

.method private getMutableDataMap()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->internalGetMutableData()Lcom/google/protobuf/MapFieldLite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private internalGetData()Lcom/google/protobuf/MapFieldLite;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapFieldLite<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Msg;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 2
    .line 3
    return-object p0
.end method

.method private internalGetMutableData()Lcom/google/protobuf/MapFieldLite;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapFieldLite<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/push/pb/Msg;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/MapFieldLite;->isMutable()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/push/pb/Msg;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/google/protobuf/MapFieldLite;->mutableCopy()Lcom/google/protobuf/MapFieldLite;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/immomo/push/pb/Msg;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/immomo/push/pb/Msg;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 18
    .line 19
    return-object p0
.end method

.method public static newBuilder()Lcom/immomo/push/pb/Msg$b;
    .locals 1

    .line 16
    sget-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/immomo/push/pb/Msg$b;

    return-object v0
.end method

.method public static newBuilder(Lcom/immomo/push/pb/Msg;)Lcom/immomo/push/pb/Msg$b;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/immomo/push/pb/Msg$b;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/immomo/push/pb/Msg$b;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/immomo/push/pb/Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/push/pb/Msg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Msg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/immomo/push/pb/Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/push/pb/Msg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Msg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/immomo/push/pb/Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Msg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Msg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/immomo/push/pb/Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Msg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/immomo/push/pb/Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Msg;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/immomo/push/pb/Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Msg;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/immomo/push/pb/Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/immomo/push/pb/Msg;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/immomo/push/pb/Msg;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

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
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLt(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->lt_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->lt_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLv(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/push/pb/Msg;->lv_:I

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
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->text_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->text_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/push/pb/Msg;->time_:J

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
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->toPkg_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->toPkg_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/push/pb/Msg;->type_:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public containsData(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/immomo/push/pb/Msg$a;->a:[I

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
    sget-object p0, Lcom/immomo/push/pb/Msg;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/immomo/push/pb/Msg;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/immomo/push/pb/Msg;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/immomo/push/pb/Msg;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/immomo/push/pb/Msg;->PARSER:Ll/ng60;

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
    if-eq p1, v3, :cond_c

    .line 65
    .line 66
    const/16 v3, 0x12

    .line 67
    .line 68
    if-eq p1, v3, :cond_b

    .line 69
    .line 70
    const/16 v3, 0x1a

    .line 71
    .line 72
    if-eq p1, v3, :cond_a

    .line 73
    .line 74
    const/16 v3, 0x20

    .line 75
    .line 76
    if-eq p1, v3, :cond_9

    .line 77
    .line 78
    const/16 v3, 0x28

    .line 79
    .line 80
    if-eq p1, v3, :cond_8

    .line 81
    .line 82
    const/16 v3, 0x32

    .line 83
    .line 84
    if-eq p1, v3, :cond_7

    .line 85
    .line 86
    const/16 v3, 0x38

    .line 87
    .line 88
    if-eq p1, v3, :cond_6

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
    goto :goto_4

    .line 105
    :catch_1
    move-exception v0

    .line 106
    move-object p1, v0

    .line 107
    goto :goto_5

    .line 108
    :cond_4
    iget-object p1, p0, Lcom/immomo/push/pb/Msg;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/google/protobuf/MapFieldLite;->isMutable()Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-nez p1, :cond_5

    .line 115
    .line 116
    iget-object p1, p0, Lcom/immomo/push/pb/Msg;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/google/protobuf/MapFieldLite;->mutableCopy()Lcom/google/protobuf/MapFieldLite;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 123
    .line 124
    :cond_5
    sget-object p1, Lcom/immomo/push/pb/Msg$c;->a:Lcom/google/protobuf/p;

    .line 125
    .line 126
    iget-object v3, p0, Lcom/immomo/push/pb/Msg;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 127
    .line 128
    invoke-virtual {p1, v3, p2, p3}, Lcom/google/protobuf/p;->e(Lcom/google/protobuf/MapFieldLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)V

    .line 129
    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    iput p1, p0, Lcom/immomo/push/pb/Msg;->type_:I

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->text_:Ljava/lang/String;

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 147
    .line 148
    .line 149
    move-result-wide v3

    .line 150
    iput-wide v3, p0, Lcom/immomo/push/pb/Msg;->time_:J

    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    iput p1, p0, Lcom/immomo/push/pb/Msg;->lv_:I

    .line 158
    .line 159
    goto :goto_3

    .line 160
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->lt_:Ljava/lang/String;

    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->toPkg_:Ljava/lang/String;

    .line 172
    .line 173
    goto :goto_3

    .line 174
    :cond_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->id_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 179
    .line 180
    goto :goto_3

    .line 181
    :catchall_1
    move-exception v0

    .line 182
    move-object p0, v0

    .line 183
    throw p0

    .line 184
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 185
    .line 186
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

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
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 206
    .line 207
    .line 208
    return-object v1

    .line 209
    :cond_d
    :pswitch_2
    sget-object p0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    .line 210
    .line 211
    return-object p0

    .line 212
    :pswitch_3
    move-object v3, p2

    .line 213
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 214
    .line 215
    check-cast p3, Lcom/immomo/push/pb/Msg;

    .line 216
    .line 217
    iget-object p1, p0, Lcom/immomo/push/pb/Msg;->id_:Ljava/lang/String;

    .line 218
    .line 219
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 220
    .line 221
    .line 222
    move-result p1

    .line 223
    xor-int/2addr p1, v2

    .line 224
    iget-object p2, p0, Lcom/immomo/push/pb/Msg;->id_:Ljava/lang/String;

    .line 225
    .line 226
    iget-object v1, p3, Lcom/immomo/push/pb/Msg;->id_:Ljava/lang/String;

    .line 227
    .line 228
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    xor-int/2addr v1, v2

    .line 233
    iget-object v4, p3, Lcom/immomo/push/pb/Msg;->id_:Ljava/lang/String;

    .line 234
    .line 235
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->id_:Ljava/lang/String;

    .line 240
    .line 241
    iget-object p1, p0, Lcom/immomo/push/pb/Msg;->toPkg_:Ljava/lang/String;

    .line 242
    .line 243
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 244
    .line 245
    .line 246
    move-result p1

    .line 247
    xor-int/2addr p1, v2

    .line 248
    iget-object p2, p0, Lcom/immomo/push/pb/Msg;->toPkg_:Ljava/lang/String;

    .line 249
    .line 250
    iget-object v1, p3, Lcom/immomo/push/pb/Msg;->toPkg_:Ljava/lang/String;

    .line 251
    .line 252
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    xor-int/2addr v1, v2

    .line 257
    iget-object v4, p3, Lcom/immomo/push/pb/Msg;->toPkg_:Ljava/lang/String;

    .line 258
    .line 259
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->toPkg_:Ljava/lang/String;

    .line 264
    .line 265
    iget-object p1, p0, Lcom/immomo/push/pb/Msg;->lt_:Ljava/lang/String;

    .line 266
    .line 267
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 268
    .line 269
    .line 270
    move-result p1

    .line 271
    xor-int/2addr p1, v2

    .line 272
    iget-object p2, p0, Lcom/immomo/push/pb/Msg;->lt_:Ljava/lang/String;

    .line 273
    .line 274
    iget-object v1, p3, Lcom/immomo/push/pb/Msg;->lt_:Ljava/lang/String;

    .line 275
    .line 276
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    xor-int/2addr v1, v2

    .line 281
    iget-object v4, p3, Lcom/immomo/push/pb/Msg;->lt_:Ljava/lang/String;

    .line 282
    .line 283
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->lt_:Ljava/lang/String;

    .line 288
    .line 289
    iget p1, p0, Lcom/immomo/push/pb/Msg;->lv_:I

    .line 290
    .line 291
    if-eqz p1, :cond_e

    .line 292
    .line 293
    move p2, v2

    .line 294
    goto :goto_6

    .line 295
    :cond_e
    move p2, v0

    .line 296
    :goto_6
    iget v1, p3, Lcom/immomo/push/pb/Msg;->lv_:I

    .line 297
    .line 298
    if-eqz v1, :cond_f

    .line 299
    .line 300
    move v4, v2

    .line 301
    goto :goto_7

    .line 302
    :cond_f
    move v4, v0

    .line 303
    :goto_7
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 304
    .line 305
    .line 306
    move-result p1

    .line 307
    iput p1, p0, Lcom/immomo/push/pb/Msg;->lv_:I

    .line 308
    .line 309
    iget-wide v5, p0, Lcom/immomo/push/pb/Msg;->time_:J

    .line 310
    .line 311
    const-wide/16 p1, 0x0

    .line 312
    .line 313
    cmp-long v1, v5, p1

    .line 314
    .line 315
    if-eqz v1, :cond_10

    .line 316
    .line 317
    move v4, v2

    .line 318
    goto :goto_8

    .line 319
    :cond_10
    move v4, v0

    .line 320
    :goto_8
    iget-wide v8, p3, Lcom/immomo/push/pb/Msg;->time_:J

    .line 321
    .line 322
    cmp-long p1, v8, p1

    .line 323
    .line 324
    if-eqz p1, :cond_11

    .line 325
    .line 326
    move v7, v2

    .line 327
    goto :goto_9

    .line 328
    :cond_11
    move v7, v0

    .line 329
    :goto_9
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 330
    .line 331
    .line 332
    move-result-wide p1

    .line 333
    iput-wide p1, p0, Lcom/immomo/push/pb/Msg;->time_:J

    .line 334
    .line 335
    iget-object p1, p0, Lcom/immomo/push/pb/Msg;->text_:Ljava/lang/String;

    .line 336
    .line 337
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 338
    .line 339
    .line 340
    move-result p1

    .line 341
    xor-int/2addr p1, v2

    .line 342
    iget-object p2, p0, Lcom/immomo/push/pb/Msg;->text_:Ljava/lang/String;

    .line 343
    .line 344
    iget-object v1, p3, Lcom/immomo/push/pb/Msg;->text_:Ljava/lang/String;

    .line 345
    .line 346
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 347
    .line 348
    .line 349
    move-result v1

    .line 350
    xor-int/2addr v1, v2

    .line 351
    iget-object v4, p3, Lcom/immomo/push/pb/Msg;->text_:Ljava/lang/String;

    .line 352
    .line 353
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object p1

    .line 357
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->text_:Ljava/lang/String;

    .line 358
    .line 359
    iget p1, p0, Lcom/immomo/push/pb/Msg;->type_:I

    .line 360
    .line 361
    if-eqz p1, :cond_12

    .line 362
    .line 363
    move p2, v2

    .line 364
    goto :goto_a

    .line 365
    :cond_12
    move p2, v0

    .line 366
    :goto_a
    iget v1, p3, Lcom/immomo/push/pb/Msg;->type_:I

    .line 367
    .line 368
    if-eqz v1, :cond_13

    .line 369
    .line 370
    move v0, v2

    .line 371
    :cond_13
    invoke-interface {v3, p2, p1, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 372
    .line 373
    .line 374
    move-result p1

    .line 375
    iput p1, p0, Lcom/immomo/push/pb/Msg;->type_:I

    .line 376
    .line 377
    iget-object p1, p0, Lcom/immomo/push/pb/Msg;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 378
    .line 379
    invoke-direct {p3}, Lcom/immomo/push/pb/Msg;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 380
    .line 381
    .line 382
    move-result-object p2

    .line 383
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->l(Lcom/google/protobuf/MapFieldLite;Lcom/google/protobuf/MapFieldLite;)Lcom/google/protobuf/MapFieldLite;

    .line 384
    .line 385
    .line 386
    move-result-object p1

    .line 387
    iput-object p1, p0, Lcom/immomo/push/pb/Msg;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 388
    .line 389
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 390
    .line 391
    if-ne v3, p1, :cond_14

    .line 392
    .line 393
    iget p1, p0, Lcom/immomo/push/pb/Msg;->bitField0_:I

    .line 394
    .line 395
    iget p2, p3, Lcom/immomo/push/pb/Msg;->bitField0_:I

    .line 396
    .line 397
    or-int/2addr p1, p2

    .line 398
    iput p1, p0, Lcom/immomo/push/pb/Msg;->bitField0_:I

    .line 399
    .line 400
    :cond_14
    return-object p0

    .line 401
    :pswitch_4
    new-instance p0, Lcom/immomo/push/pb/Msg$b;

    .line 402
    .line 403
    invoke-direct {p0, v1}, Lcom/immomo/push/pb/Msg$b;-><init>(Lcom/immomo/push/pb/Msg$a;)V

    .line 404
    .line 405
    .line 406
    return-object p0

    .line 407
    :pswitch_5
    iget-object p0, p0, Lcom/immomo/push/pb/Msg;->data_:Lcom/google/protobuf/MapFieldLite;

    .line 408
    .line 409
    invoke-virtual {p0}, Lcom/google/protobuf/MapFieldLite;->makeImmutable()V

    .line 410
    .line 411
    .line 412
    return-object v1

    .line 413
    :pswitch_6
    sget-object p0, Lcom/immomo/push/pb/Msg;->DEFAULT_INSTANCE:Lcom/immomo/push/pb/Msg;

    .line 414
    .line 415
    return-object p0

    .line 416
    :pswitch_7
    new-instance p0, Lcom/immomo/push/pb/Msg;

    .line 417
    .line 418
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;-><init>()V

    .line 419
    .line 420
    .line 421
    return-object p0

    .line 422
    nop

    .line 423
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

.method public getData()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getDataMap()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getDataCount()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/AbstractMap;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getDataMap()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getDataOrDefault(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/String;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    return-object p2
.end method

.method public getDataOrThrow(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/String;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Msg;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Msg;->id_:Ljava/lang/String;

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

.method public getLt()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Msg;->lt_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLtBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Msg;->lt_:Ljava/lang/String;

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
    iget p0, p0, Lcom/immomo/push/pb/Msg;->lv_:I

    .line 2
    .line 3
    return p0
.end method

.method public getSerializedSize()I
    .locals 6

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
    iget-object v0, p0, Lcom/immomo/push/pb/Msg;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/immomo/push/pb/Msg;->toPkg_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getToPkg()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/immomo/push/pb/Msg;->lt_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getLt()Ljava/lang/String;

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
    iget v1, p0, Lcom/immomo/push/pb/Msg;->lv_:I

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
    iget-wide v1, p0, Lcom/immomo/push/pb/Msg;->time_:J

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
    iget-object v1, p0, Lcom/immomo/push/pb/Msg;->text_:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-nez v1, :cond_6

    .line 93
    .line 94
    const/4 v1, 0x6

    .line 95
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getText()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    add-int/2addr v0, v1

    .line 104
    :cond_6
    iget v1, p0, Lcom/immomo/push/pb/Msg;->type_:I

    .line 105
    .line 106
    if-eqz v1, :cond_7

    .line 107
    .line 108
    const/4 v2, 0x7

    .line 109
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    add-int/2addr v0, v1

    .line 114
    :cond_7
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v1}, Lcom/google/protobuf/MapFieldLite;->entrySet()Ljava/util/Set;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    if-eqz v2, :cond_8

    .line 131
    .line 132
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    check-cast v2, Ljava/util/Map$Entry;

    .line 137
    .line 138
    sget-object v3, Lcom/immomo/push/pb/Msg$c;->a:Lcom/google/protobuf/p;

    .line 139
    .line 140
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    const/16 v5, 0x8

    .line 149
    .line 150
    invoke-virtual {v3, v5, v4, v2}, Lcom/google/protobuf/p;->a(ILjava/lang/Object;Ljava/lang/Object;)I

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    add-int/2addr v0, v2

    .line 155
    goto :goto_1

    .line 156
    :cond_8
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 157
    .line 158
    return v0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Msg;->text_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Msg;->text_:Ljava/lang/String;

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

.method public getTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/push/pb/Msg;->time_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getToPkg()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Msg;->toPkg_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToPkgBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/push/pb/Msg;->toPkg_:Ljava/lang/String;

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

.method public getType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/push/pb/Msg;->type_:I

    .line 2
    .line 3
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
    iget-object v0, p0, Lcom/immomo/push/pb/Msg;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/immomo/push/pb/Msg;->toPkg_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getToPkg()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/immomo/push/pb/Msg;->lt_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getLt()Ljava/lang/String;

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
    iget v0, p0, Lcom/immomo/push/pb/Msg;->lv_:I

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
    iget-wide v0, p0, Lcom/immomo/push/pb/Msg;->time_:J

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
    iget-object v0, p0, Lcom/immomo/push/pb/Msg;->text_:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_5

    .line 76
    .line 77
    const/4 v0, 0x6

    .line 78
    invoke-virtual {p0}, Lcom/immomo/push/pb/Msg;->getText()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :cond_5
    iget v0, p0, Lcom/immomo/push/pb/Msg;->type_:I

    .line 86
    .line 87
    if-eqz v0, :cond_6

    .line 88
    .line 89
    const/4 v1, 0x7

    .line 90
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 91
    .line 92
    .line 93
    :cond_6
    invoke-direct {p0}, Lcom/immomo/push/pb/Msg;->internalGetData()Lcom/google/protobuf/MapFieldLite;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p0}, Lcom/google/protobuf/MapFieldLite;->entrySet()Ljava/util/Set;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_7

    .line 110
    .line 111
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Ljava/util/Map$Entry;

    .line 116
    .line 117
    sget-object v1, Lcom/immomo/push/pb/Msg$c;->a:Lcom/google/protobuf/p;

    .line 118
    .line 119
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const/16 v3, 0x8

    .line 128
    .line 129
    invoke-virtual {v1, p1, v3, v2, v0}, Lcom/google/protobuf/p;->f(Lcom/google/protobuf/CodedOutputStream;ILjava/lang/Object;Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_7
    return-void
.end method
