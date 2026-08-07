.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPointsOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PkPoints"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPointsOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

.field public static final EXECUTEINFO_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;",
            ">;"
        }
    .end annotation
.end field

.field public static final PKID_FIELD_NUMBER:I = 0x1

.field public static final POINTS_FIELD_NUMBER:I = 0x2

.field public static final SERVERTIMETS_FIELD_NUMBER:I = 0xa


# instance fields
.field private bitField0_:I

.field private executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

.field private pkId_:Ljava/lang/String;

.field private points_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;",
            ">;"
        }
    .end annotation
.end field

.field private serverTimeTs_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->pkId_:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->addAllPoints(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllPoints(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->ensurePointsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->ensurePointsIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->ensurePointsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addPoints(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->ensurePointsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addPoints(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->ensurePointsIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->addPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints$Builder;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->addPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;)V

    return-void
.end method

.method private clearExecuteInfo()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 3
    .line 4
    return-void
.end method

.method private clearPkId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->getPkId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->pkId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPoints()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearServerTimeTs()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->serverTimeTs_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->addPoints(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints$Builder;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->addPoints(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;)V

    return-void
.end method

.method private ensurePointsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->clearExecuteInfo()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->clearPkId()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->clearPoints()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->clearServerTimeTs()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->mergeExecuteInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->removePoints(I)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->setExecuteInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo$Builder;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->setExecuteInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;)V

    return-void
.end method

.method private mergeExecuteInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;->newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->setPkId(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->setPkIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->setPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints$Builder;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->setPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->setServerTimeTs(J)V

    return-void
.end method

.method private removePoints(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->ensurePointsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    return-object v0
.end method

.method private setExecuteInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 8
    .line 9
    return-void
.end method

.method private setExecuteInfo(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    return-void
.end method

.method private setPkId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->pkId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setPkIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->pkId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->ensurePointsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setPoints(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->ensurePointsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setServerTimeTs(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->serverTimeTs_:J

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_a

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
    if-eq p1, v3, :cond_9

    .line 65
    .line 66
    const/16 v3, 0x12

    .line 67
    .line 68
    if-eq p1, v3, :cond_7

    .line 69
    .line 70
    const/16 v3, 0x1a

    .line 71
    .line 72
    if-eq p1, v3, :cond_5

    .line 73
    .line 74
    const/16 v3, 0x50

    .line 75
    .line 76
    if-eq p1, v3, :cond_4

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
    goto :goto_6

    .line 92
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 93
    .line 94
    .line 95
    move-result-wide v3

    .line 96
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->serverTimeTs_:J

    .line 97
    .line 98
    goto :goto_3

    .line 99
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 100
    .line 101
    if-eqz p1, :cond_6

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo$Builder;

    .line 108
    .line 109
    goto :goto_4

    .line 110
    :cond_6
    move-object p1, v1

    .line 111
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;->parser()Ll/ng60;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 120
    .line 121
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 122
    .line 123
    if-eqz p1, :cond_2

    .line 124
    .line 125
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 133
    .line 134
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 138
    .line 139
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->q()Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-nez p1, :cond_8

    .line 144
    .line 145
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 146
    .line 147
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 152
    .line 153
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 154
    .line 155
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;->parser()Ll/ng60;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;

    .line 164
    .line 165
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    goto :goto_3

    .line 169
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->pkId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 174
    .line 175
    goto :goto_3

    .line 176
    :catchall_1
    move-exception v0

    .line 177
    move-object p0, v0

    .line 178
    throw p0

    .line 179
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 180
    .line 181
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 193
    .line 194
    .line 195
    return-object v1

    .line 196
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

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
    :cond_a
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    .line 205
    .line 206
    return-object p0

    .line 207
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 208
    .line 209
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    .line 210
    .line 211
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->pkId_:Ljava/lang/String;

    .line 212
    .line 213
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    xor-int/2addr p1, v2

    .line 218
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->pkId_:Ljava/lang/String;

    .line 219
    .line 220
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->pkId_:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    xor-int/2addr v3, v2

    .line 227
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->pkId_:Ljava/lang/String;

    .line 228
    .line 229
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->pkId_:Ljava/lang/String;

    .line 234
    .line 235
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 236
    .line 237
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 238
    .line 239
    invoke-interface {p2, p1, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 244
    .line 245
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 246
    .line 247
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 248
    .line 249
    invoke-interface {p2, p1, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 254
    .line 255
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 256
    .line 257
    move p1, v2

    .line 258
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->serverTimeTs_:J

    .line 259
    .line 260
    const-wide/16 v4, 0x0

    .line 261
    .line 262
    cmp-long v1, v2, v4

    .line 263
    .line 264
    if-eqz v1, :cond_b

    .line 265
    .line 266
    move v1, p1

    .line 267
    :goto_7
    move-wide v7, v4

    .line 268
    goto :goto_8

    .line 269
    :cond_b
    move v1, v0

    .line 270
    goto :goto_7

    .line 271
    :goto_8
    iget-wide v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->serverTimeTs_:J

    .line 272
    .line 273
    cmp-long v4, v5, v7

    .line 274
    .line 275
    if-eqz v4, :cond_c

    .line 276
    .line 277
    move v4, p1

    .line 278
    :goto_9
    move-object v0, p2

    .line 279
    goto :goto_a

    .line 280
    :cond_c
    move v4, v0

    .line 281
    goto :goto_9

    .line 282
    :goto_a
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 283
    .line 284
    .line 285
    move-result-wide p1

    .line 286
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->serverTimeTs_:J

    .line 287
    .line 288
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 289
    .line 290
    if-ne v0, p1, :cond_d

    .line 291
    .line 292
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->bitField0_:I

    .line 293
    .line 294
    iget p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->bitField0_:I

    .line 295
    .line 296
    or-int/2addr p1, p2

    .line 297
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->bitField0_:I

    .line 298
    .line 299
    :cond_d
    return-object p0

    .line 300
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints$Builder;

    .line 301
    .line 302
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints$Builder;-><init>(Ll/c3w;)V

    .line 303
    .line 304
    .line 305
    return-object p0

    .line 306
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 307
    .line 308
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 309
    .line 310
    .line 311
    return-object v1

    .line 312
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    .line 313
    .line 314
    return-object p0

    .line 315
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;

    .line 316
    .line 317
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;-><init>()V

    .line 318
    .line 319
    .line 320
    return-object p0

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

.method public getExecuteInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getPkId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->pkId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPkIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->pkId_:Ljava/lang/String;

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

.method public getPoints(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;

    .line 8
    .line 9
    return-object p0
.end method

.method public getPointsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

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

.method public getPointsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPointsOrBuilder(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPointsOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPointsOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getPointsOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPointsOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->pkId_:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->getPkId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-static {v2, v0}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v0, v1

    .line 27
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 28
    .line 29
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-ge v1, v2, :cond_2

    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 36
    .line 37
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lcom/google/protobuf/q;

    .line 42
    .line 43
    const/4 v3, 0x2

    .line 44
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    add-int/2addr v0, v2

    .line 49
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    const/4 v1, 0x3

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->getExecuteInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    add-int/2addr v0, v1

    .line 66
    :cond_3
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->serverTimeTs_:J

    .line 67
    .line 68
    const-wide/16 v3, 0x0

    .line 69
    .line 70
    cmp-long v3, v1, v3

    .line 71
    .line 72
    if-eqz v3, :cond_4

    .line 73
    .line 74
    const/16 v3, 0xa

    .line 75
    .line 76
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    add-int/2addr v0, v1

    .line 81
    :cond_4
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 82
    .line 83
    return v0
.end method

.method public getServerTimeTs()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->serverTimeTs_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hasExecuteInfo()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->pkId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->getPkId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 19
    .line 20
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-ge v0, v1, :cond_1

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->points_:Lcom/google/protobuf/l$h;

    .line 27
    .line 28
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/google/protobuf/q;

    .line 33
    .line 34
    const/4 v2, 0x2

    .line 35
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 36
    .line 37
    .line 38
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->executeInfo_:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    const/4 v0, 0x3

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->getExecuteInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPoints;->serverTimeTs_:J

    .line 54
    .line 55
    const-wide/16 v2, 0x0

    .line 56
    .line 57
    cmp-long p0, v0, v2

    .line 58
    .line 59
    if-eqz p0, :cond_3

    .line 60
    .line 61
    const/16 p0, 0xa

    .line 62
    .line 63
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 64
    .line 65
    .line 66
    :cond_3
    return-void
.end method
