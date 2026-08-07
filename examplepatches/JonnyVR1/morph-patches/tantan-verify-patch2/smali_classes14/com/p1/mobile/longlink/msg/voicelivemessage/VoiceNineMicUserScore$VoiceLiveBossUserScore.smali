.class public final Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScoreOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceLiveBossUserScore"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;,
        Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScoreOrBuilder;,
        Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScoreOrBuilder;"
    }
.end annotation


# static fields
.field public static final BOSSUSERSCORE_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

.field public static final LIVEID_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;",
            ">;"
        }
    .end annotation
.end field

.field public static final ROOMID_FIELD_NUMBER:I = 0x1


# instance fields
.field private bitField0_:I

.field private bossUserScore_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;",
            ">;"
        }
    .end annotation
.end field

.field private liveId_:Ljava/lang/String;

.field private roomId_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->roomId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->liveId_:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->addAllBossUserScore(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllBossUserScore(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->ensureBossUserScoreIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addBossUserScore(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->ensureBossUserScoreIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addBossUserScore(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->ensureBossUserScoreIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addBossUserScore(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->ensureBossUserScoreIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addBossUserScore(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->ensureBossUserScoreIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->addBossUserScore(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore$Builder;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->addBossUserScore(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)V

    return-void
.end method

.method private clearBossUserScore()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->liveId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->addBossUserScore(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore$Builder;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->addBossUserScore(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)V

    return-void
.end method

.method private ensureBossUserScoreIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->clearBossUserScore()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->clearLiveId()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->clearRoomId()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->removeBossUserScore(I)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->setBossUserScore(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore$Builder;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->setBossUserScore(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->setLiveId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->setLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

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

.method private removeBossUserScore(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->ensureBossUserScoreIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private setBossUserScore(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->ensureBossUserScoreIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setBossUserScore(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->ensureBossUserScoreIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setLiveId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->liveId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLiveIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->liveId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setRoomId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->PARSER:Ll/ng60;

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
    if-nez p1, :cond_8

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
    if-eq v2, v3, :cond_7

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq v2, v3, :cond_6

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq v2, v3, :cond_4

    .line 72
    .line 73
    invoke-virtual {p2, v2}, Lcom/google/protobuf/e;->R(I)Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-nez v2, :cond_2

    .line 78
    .line 79
    :cond_3
    move p1, v1

    .line 80
    goto :goto_3

    .line 81
    :catch_0
    move-exception p1

    .line 82
    goto :goto_4

    .line 83
    :catch_1
    move-exception p1

    .line 84
    goto :goto_5

    .line 85
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 86
    .line 87
    invoke-interface {v2}, Lcom/google/protobuf/l$h;->q()Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-nez v2, :cond_5

    .line 92
    .line 93
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 94
    .line 95
    invoke-static {v2}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 100
    .line 101
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 102
    .line 103
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;->parser()Ll/ng60;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    check-cast v3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;

    .line 112
    .line 113
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->liveId_:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->roomId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :catchall_1
    move-exception p0

    .line 132
    throw p0

    .line 133
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 134
    .line 135
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 147
    .line 148
    .line 149
    return-object v0

    .line 150
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 155
    .line 156
    .line 157
    return-object v0

    .line 158
    :cond_8
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 159
    .line 160
    return-object p0

    .line 161
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 162
    .line 163
    check-cast p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 164
    .line 165
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->roomId_:Ljava/lang/String;

    .line 166
    .line 167
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    xor-int/2addr p1, v1

    .line 172
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->roomId_:Ljava/lang/String;

    .line 173
    .line 174
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->roomId_:Ljava/lang/String;

    .line 175
    .line 176
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    xor-int/2addr v2, v1

    .line 181
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->roomId_:Ljava/lang/String;

    .line 182
    .line 183
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->roomId_:Ljava/lang/String;

    .line 188
    .line 189
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->liveId_:Ljava/lang/String;

    .line 190
    .line 191
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    xor-int/2addr p1, v1

    .line 196
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->liveId_:Ljava/lang/String;

    .line 197
    .line 198
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->liveId_:Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 201
    .line 202
    .line 203
    move-result v2

    .line 204
    xor-int/2addr v1, v2

    .line 205
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->liveId_:Ljava/lang/String;

    .line 206
    .line 207
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->liveId_:Ljava/lang/String;

    .line 212
    .line 213
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 214
    .line 215
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 216
    .line 217
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 222
    .line 223
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 224
    .line 225
    if-ne p2, p1, :cond_9

    .line 226
    .line 227
    iget p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bitField0_:I

    .line 228
    .line 229
    iget p2, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bitField0_:I

    .line 230
    .line 231
    or-int/2addr p1, p2

    .line 232
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bitField0_:I

    .line 233
    .line 234
    :cond_9
    return-object p0

    .line 235
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;

    .line 236
    .line 237
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$Builder;-><init>(Ll/eeo0;)V

    .line 238
    .line 239
    .line 240
    return-object p0

    .line 241
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 242
    .line 243
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 244
    .line 245
    .line 246
    return-object v0

    .line 247
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 248
    .line 249
    return-object p0

    .line 250
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 251
    .line 252
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;-><init>()V

    .line 253
    .line 254
    .line 255
    return-object p0

    .line 256
    nop

    .line 257
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

.method public getBossUserScore(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;

    .line 8
    .line 9
    return-object p0
.end method

.method public getBossUserScoreCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

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

.method public getBossUserScoreList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBossUserScoreOrBuilder(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScoreOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScoreOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getBossUserScoreOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScoreOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->liveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->liveId_:Ljava/lang/String;

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

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->roomId_:Ljava/lang/String;

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
    .locals 4

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getRoomId()Ljava/lang/String;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->liveId_:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_2

    .line 34
    .line 35
    const/4 v2, 0x2

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getLiveId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    add-int/2addr v0, v2

    .line 45
    :cond_2
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 46
    .line 47
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-ge v1, v2, :cond_3

    .line 52
    .line 53
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 54
    .line 55
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Lcom/google/protobuf/q;

    .line 60
    .line 61
    const/4 v3, 0x3

    .line 62
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    add-int/2addr v0, v2

    .line 67
    add-int/lit8 v1, v1, 0x1

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_3
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 71
    .line 72
    return v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getRoomId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->liveId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getLiveId()Ljava/lang/String;

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
    const/4 v0, 0x0

    .line 34
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-ge v0, v1, :cond_2

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->bossUserScore_:Lcom/google/protobuf/l$h;

    .line 43
    .line 44
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Lcom/google/protobuf/q;

    .line 49
    .line 50
    const/4 v2, 0x3

    .line 51
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 52
    .line 53
    .line 54
    add-int/lit8 v0, v0, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    return-void
.end method
