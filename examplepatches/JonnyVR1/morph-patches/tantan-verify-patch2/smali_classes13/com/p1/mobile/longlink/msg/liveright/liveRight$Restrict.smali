.class public final Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveright/liveRight$RestrictOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveright/liveRight;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Restrict"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$RestrictOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

.field public static final GIFTIDS_FIELD_NUMBER:I = 0x2

.field public static final GRADE_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;",
            ">;"
        }
    .end annotation
.end field

.field public static final RECEIVETYPE_FIELD_NUMBER:I = 0x3


# instance fields
.field private bitField0_:I

.field private giftIds_:Lcom/google/protobuf/l$g;

.field private grade_:J

.field private receiveType_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

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
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyLongList()Lcom/google/protobuf/l$g;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->addAllGiftIds(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllGiftIds(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->ensureGiftIdsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addGiftIds(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->ensureGiftIdsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 5
    .line 6
    invoke-interface {p0, p1, p2}, Lcom/google/protobuf/l$g;->u(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->addGiftIds(J)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->clearGiftIds()V

    return-void
.end method

.method private clearGiftIds()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyLongList()Lcom/google/protobuf/l$g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 6
    .line 7
    return-void
.end method

.method private clearGrade()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->grade_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearReceiveType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->receiveType_:I

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->clearGrade()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->clearReceiveType()V

    return-void
.end method

.method private ensureGiftIdsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/l$h;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$g;)Lcom/google/protobuf/l$g;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;IJ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->setGiftIds(IJ)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->setGrade(J)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ReceiveType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->setReceiveType(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ReceiveType;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->setReceiveTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic j()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

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

.method private setGiftIds(IJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->ensureGiftIdsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 5
    .line 6
    invoke-interface {p0, p1, p2, p3}, Lcom/google/protobuf/l$g;->setLong(IJ)J

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private setGrade(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->grade_:J

    .line 2
    .line 3
    return-void
.end method

.method private setReceiveType(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ReceiveType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ReceiveType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->receiveType_:I

    .line 9
    .line 10
    return-void
.end method

.method private setReceiveTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->receiveType_:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->PARSER:Ll/ng60;

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
    const/16 p3, 0x8

    .line 63
    .line 64
    if-eq p1, p3, :cond_a

    .line 65
    .line 66
    const/16 p3, 0x10

    .line 67
    .line 68
    if-eq p1, p3, :cond_8

    .line 69
    .line 70
    const/16 p3, 0x12

    .line 71
    .line 72
    if-eq p1, p3, :cond_5

    .line 73
    .line 74
    const/16 p3, 0x18

    .line 75
    .line 76
    if-eq p1, p3, :cond_4

    .line 77
    .line 78
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-nez p1, :cond_2

    .line 83
    .line 84
    :cond_3
    move v0, v2

    .line 85
    goto :goto_3

    .line 86
    :catch_0
    move-exception v0

    .line 87
    move-object p1, v0

    .line 88
    goto :goto_5

    .line 89
    :catch_1
    move-exception v0

    .line 90
    move-object p1, v0

    .line 91
    goto/16 :goto_6

    .line 92
    .line 93
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->receiveType_:I

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->C()I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->l(I)I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 109
    .line 110
    invoke-interface {p3}, Lcom/google/protobuf/l$h;->q()Z

    .line 111
    .line 112
    .line 113
    move-result p3

    .line 114
    if-nez p3, :cond_6

    .line 115
    .line 116
    invoke-virtual {p2}, Lcom/google/protobuf/e;->d()I

    .line 117
    .line 118
    .line 119
    move-result p3

    .line 120
    if-lez p3, :cond_6

    .line 121
    .line 122
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 123
    .line 124
    invoke-static {p3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$g;)Lcom/google/protobuf/l$g;

    .line 125
    .line 126
    .line 127
    move-result-object p3

    .line 128
    iput-object p3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 129
    .line 130
    :cond_6
    :goto_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->d()I

    .line 131
    .line 132
    .line 133
    move-result p3

    .line 134
    if-lez p3, :cond_7

    .line 135
    .line 136
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 137
    .line 138
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 139
    .line 140
    .line 141
    move-result-wide v3

    .line 142
    invoke-interface {p3, v3, v4}, Lcom/google/protobuf/l$g;->u(J)V

    .line 143
    .line 144
    .line 145
    goto :goto_4

    .line 146
    :cond_7
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->k(I)V

    .line 147
    .line 148
    .line 149
    goto :goto_3

    .line 150
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 151
    .line 152
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->q()Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    if-nez p1, :cond_9

    .line 157
    .line 158
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 159
    .line 160
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$g;)Lcom/google/protobuf/l$g;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 165
    .line 166
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 167
    .line 168
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 169
    .line 170
    .line 171
    move-result-wide v3

    .line 172
    invoke-interface {p1, v3, v4}, Lcom/google/protobuf/l$g;->u(J)V

    .line 173
    .line 174
    .line 175
    goto :goto_3

    .line 176
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 177
    .line 178
    .line 179
    move-result-wide v3

    .line 180
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->grade_:J
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 181
    .line 182
    goto/16 :goto_3

    .line 183
    .line 184
    :catchall_1
    move-exception v0

    .line 185
    move-object p0, v0

    .line 186
    throw p0

    .line 187
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 188
    .line 189
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 201
    .line 202
    .line 203
    return-object v1

    .line 204
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 209
    .line 210
    .line 211
    return-object v1

    .line 212
    :cond_b
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 213
    .line 214
    return-object p0

    .line 215
    :pswitch_3
    move-object v3, p2

    .line 216
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 217
    .line 218
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 219
    .line 220
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->grade_:J

    .line 221
    .line 222
    const-wide/16 p1, 0x0

    .line 223
    .line 224
    cmp-long v1, v5, p1

    .line 225
    .line 226
    if-eqz v1, :cond_c

    .line 227
    .line 228
    move v4, v2

    .line 229
    goto :goto_7

    .line 230
    :cond_c
    move v4, v0

    .line 231
    :goto_7
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->grade_:J

    .line 232
    .line 233
    cmp-long p1, v8, p1

    .line 234
    .line 235
    if-eqz p1, :cond_d

    .line 236
    .line 237
    move v7, v2

    .line 238
    goto :goto_8

    .line 239
    :cond_d
    move v7, v0

    .line 240
    :goto_8
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 241
    .line 242
    .line 243
    move-result-wide p1

    .line 244
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->grade_:J

    .line 245
    .line 246
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 247
    .line 248
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 249
    .line 250
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->q(Lcom/google/protobuf/l$g;Lcom/google/protobuf/l$g;)Lcom/google/protobuf/l$g;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 255
    .line 256
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->receiveType_:I

    .line 257
    .line 258
    if-eqz p1, :cond_e

    .line 259
    .line 260
    move p2, v2

    .line 261
    goto :goto_9

    .line 262
    :cond_e
    move p2, v0

    .line 263
    :goto_9
    iget v1, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->receiveType_:I

    .line 264
    .line 265
    if-eqz v1, :cond_f

    .line 266
    .line 267
    move v0, v2

    .line 268
    :cond_f
    invoke-interface {v3, p2, p1, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 269
    .line 270
    .line 271
    move-result p1

    .line 272
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->receiveType_:I

    .line 273
    .line 274
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 275
    .line 276
    if-ne v3, p1, :cond_10

    .line 277
    .line 278
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->bitField0_:I

    .line 279
    .line 280
    iget p2, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->bitField0_:I

    .line 281
    .line 282
    or-int/2addr p1, p2

    .line 283
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->bitField0_:I

    .line 284
    .line 285
    :cond_10
    return-object p0

    .line 286
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict$Builder;

    .line 287
    .line 288
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict$Builder;-><init>(Ll/x4r0;)V

    .line 289
    .line 290
    .line 291
    return-object p0

    .line 292
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 293
    .line 294
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 295
    .line 296
    .line 297
    return-object v1

    .line 298
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 299
    .line 300
    return-object p0

    .line 301
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 302
    .line 303
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;-><init>()V

    .line 304
    .line 305
    .line 306
    return-object p0

    .line 307
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

.method public getGiftIds(I)J
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/google/protobuf/l$g;->getLong(I)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public getGiftIdsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getGiftIdsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGrade()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->grade_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getReceiveType()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ReceiveType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->receiveType_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ReceiveType;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ReceiveType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ReceiveType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ReceiveType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getReceiveTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->receiveType_:I

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->grade_:J

    .line 8
    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long v2, v0, v2

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    if-eqz v2, :cond_1

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move v0, v3

    .line 23
    :goto_0
    move v1, v3

    .line 24
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 25
    .line 26
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-ge v3, v2, :cond_2

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 33
    .line 34
    invoke-interface {v2, v3}, Lcom/google/protobuf/l$g;->getLong(I)J

    .line 35
    .line 36
    .line 37
    move-result-wide v4

    .line 38
    invoke-static {v4, v5}, Lcom/google/protobuf/CodedOutputStream;->w(J)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    add-int/2addr v1, v2

    .line 43
    add-int/lit8 v3, v3, 0x1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    add-int/2addr v0, v1

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->getGiftIdsList()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    add-int/2addr v0, v1

    .line 56
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->receiveType_:I

    .line 57
    .line 58
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ReceiveType;->forReceiver:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ReceiveType;

    .line 59
    .line 60
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ReceiveType;->getNumber()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eq v1, v2, :cond_3

    .line 65
    .line 66
    const/4 v1, 0x3

    .line 67
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->receiveType_:I

    .line 68
    .line 69
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    add-int/2addr v0, v1

    .line 74
    :cond_3
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 75
    .line 76
    return v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->getSerializedSize()I

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->grade_:J

    .line 5
    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    cmp-long v2, v0, v2

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-ge v0, v1, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->giftIds_:Lcom/google/protobuf/l$g;

    .line 26
    .line 27
    invoke-interface {v1, v0}, Lcom/google/protobuf/l$g;->getLong(I)J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    const/4 v3, 0x2

    .line 32
    invoke-virtual {p1, v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 33
    .line 34
    .line 35
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->receiveType_:I

    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ReceiveType;->forReceiver:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ReceiveType;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ReceiveType;->getNumber()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eq v0, v1, :cond_2

    .line 47
    .line 48
    const/4 v0, 0x3

    .line 49
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->receiveType_:I

    .line 50
    .line 51
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void
.end method
