.class public final Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceGrabHat"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;,
        Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfoOrBuilder;,
        Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;",
        "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatOrBuilder;"
    }
.end annotation


# static fields
.field public static final CALLHATINFOS_FIELD_NUMBER:I = 0x4

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final LIVEID_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;",
            ">;"
        }
    .end annotation
.end field

.field public static final STATUS_FIELD_NUMBER:I = 0x3

.field public static final TOAST_FIELD_NUMBER:I = 0x6

.field public static final UPDATEDTIME_FIELD_NUMBER:I = 0x5


# instance fields
.field private bitField0_:I

.field private callHatInfos_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;",
            ">;"
        }
    .end annotation
.end field

.field private id_:Ljava/lang/String;

.field private liveId_:Ljava/lang/String;

.field private status_:Ljava/lang/String;

.field private toast_:Ljava/lang/String;

.field private updatedTime_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->makeImmutable()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->liveId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->status_:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->toast_:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->addAllCallHatInfos(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllCallHatInfos(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->ensureCallHatInfosIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addCallHatInfos(ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->ensureCallHatInfosIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addCallHatInfos(ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->ensureCallHatInfosIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addCallHatInfos(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->ensureCallHatInfosIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addCallHatInfos(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->ensureCallHatInfosIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->addCallHatInfos(ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo$Builder;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->addCallHatInfos(ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)V

    return-void
.end method

.method private clearCallHatInfos()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->liveId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearStatus()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getStatus()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->status_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearToast()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getToast()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->toast_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUpdatedTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->updatedTime_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->addCallHatInfos(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo$Builder;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->addCallHatInfos(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)V

    return-void
.end method

.method private ensureCallHatInfosIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->clearCallHatInfos()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->clearId()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->clearLiveId()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->clearStatus()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->clearToast()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->clearUpdatedTime()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->removeCallHatInfos(I)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->setCallHatInfos(ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo$Builder;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->setCallHatInfos(ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->setLiveId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->setLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private removeCallHatInfos(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->ensureCallHatInfosIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->setStatus(Ljava/lang/String;)V

    return-void
.end method

.method private setCallHatInfos(ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->ensureCallHatInfosIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setCallHatInfos(ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->ensureCallHatInfosIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLiveId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->liveId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->liveId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setStatus(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->status_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setStatusBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->status_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setToast(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->toast_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->toast_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUpdatedTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->updatedTime_:J

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->setStatusBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->setToast(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->setToastBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->setUpdatedTime(J)V

    return-void
.end method

.method public static bridge synthetic x()Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->PARSER:Ll/ng60;

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
    const/16 v3, 0x22

    .line 75
    .line 76
    if-eq p1, v3, :cond_6

    .line 77
    .line 78
    const/16 v3, 0x28

    .line 79
    .line 80
    if-eq p1, v3, :cond_5

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
    goto :goto_4

    .line 97
    :catch_1
    move-exception v0

    .line 98
    move-object p1, v0

    .line 99
    goto :goto_5

    .line 100
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->toast_:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 108
    .line 109
    .line 110
    move-result-wide v3

    .line 111
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->updatedTime_:J

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 115
    .line 116
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->q()Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-nez p1, :cond_7

    .line 121
    .line 122
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 123
    .line 124
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 129
    .line 130
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 131
    .line 132
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;->parser()Ll/ng60;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;

    .line 141
    .line 142
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->status_:Ljava/lang/String;

    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->liveId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->id_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 165
    .line 166
    goto :goto_3

    .line 167
    :catchall_1
    move-exception v0

    .line 168
    move-object p0, v0

    .line 169
    throw p0

    .line 170
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 171
    .line 172
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 184
    .line 185
    .line 186
    return-object v1

    .line 187
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 192
    .line 193
    .line 194
    return-object v1

    .line 195
    :cond_b
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 196
    .line 197
    return-object p0

    .line 198
    :pswitch_3
    move-object v3, p2

    .line 199
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 200
    .line 201
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 202
    .line 203
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->id_:Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    xor-int/2addr p1, v2

    .line 210
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->id_:Ljava/lang/String;

    .line 211
    .line 212
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->id_:Ljava/lang/String;

    .line 213
    .line 214
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    xor-int/2addr v1, v2

    .line 219
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->id_:Ljava/lang/String;

    .line 220
    .line 221
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->id_:Ljava/lang/String;

    .line 226
    .line 227
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->liveId_:Ljava/lang/String;

    .line 228
    .line 229
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 230
    .line 231
    .line 232
    move-result p1

    .line 233
    xor-int/2addr p1, v2

    .line 234
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->liveId_:Ljava/lang/String;

    .line 235
    .line 236
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->liveId_:Ljava/lang/String;

    .line 237
    .line 238
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 239
    .line 240
    .line 241
    move-result v1

    .line 242
    xor-int/2addr v1, v2

    .line 243
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->liveId_:Ljava/lang/String;

    .line 244
    .line 245
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->liveId_:Ljava/lang/String;

    .line 250
    .line 251
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->status_:Ljava/lang/String;

    .line 252
    .line 253
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 254
    .line 255
    .line 256
    move-result p1

    .line 257
    xor-int/2addr p1, v2

    .line 258
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->status_:Ljava/lang/String;

    .line 259
    .line 260
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->status_:Ljava/lang/String;

    .line 261
    .line 262
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 263
    .line 264
    .line 265
    move-result v1

    .line 266
    xor-int/2addr v1, v2

    .line 267
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->status_:Ljava/lang/String;

    .line 268
    .line 269
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->status_:Ljava/lang/String;

    .line 274
    .line 275
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 276
    .line 277
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 278
    .line 279
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 284
    .line 285
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->updatedTime_:J

    .line 286
    .line 287
    const-wide/16 p1, 0x0

    .line 288
    .line 289
    cmp-long v1, v5, p1

    .line 290
    .line 291
    if-eqz v1, :cond_c

    .line 292
    .line 293
    move v4, v2

    .line 294
    goto :goto_6

    .line 295
    :cond_c
    move v4, v0

    .line 296
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->updatedTime_:J

    .line 297
    .line 298
    cmp-long p1, v8, p1

    .line 299
    .line 300
    if-eqz p1, :cond_d

    .line 301
    .line 302
    move v7, v2

    .line 303
    goto :goto_7

    .line 304
    :cond_d
    move v7, v0

    .line 305
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 306
    .line 307
    .line 308
    move-result-wide p1

    .line 309
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->updatedTime_:J

    .line 310
    .line 311
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->toast_:Ljava/lang/String;

    .line 312
    .line 313
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 314
    .line 315
    .line 316
    move-result p1

    .line 317
    xor-int/2addr p1, v2

    .line 318
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->toast_:Ljava/lang/String;

    .line 319
    .line 320
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->toast_:Ljava/lang/String;

    .line 321
    .line 322
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    xor-int/2addr v0, v2

    .line 327
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->toast_:Ljava/lang/String;

    .line 328
    .line 329
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object p1

    .line 333
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->toast_:Ljava/lang/String;

    .line 334
    .line 335
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 336
    .line 337
    if-ne v3, p1, :cond_e

    .line 338
    .line 339
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->bitField0_:I

    .line 340
    .line 341
    iget p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->bitField0_:I

    .line 342
    .line 343
    or-int/2addr p1, p2

    .line 344
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->bitField0_:I

    .line 345
    .line 346
    :cond_e
    return-object p0

    .line 347
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;

    .line 348
    .line 349
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;-><init>(Ll/g6r0;)V

    .line 350
    .line 351
    .line 352
    return-object p0

    .line 353
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 354
    .line 355
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 356
    .line 357
    .line 358
    return-object v1

    .line 359
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 360
    .line 361
    return-object p0

    .line 362
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 363
    .line 364
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;-><init>()V

    .line 365
    .line 366
    .line 367
    return-object p0

    .line 368
    nop

    .line 369
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

.method public getCallHatInfos(I)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public getCallHatInfosCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

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

.method public getCallHatInfosList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCallHatInfosOrBuilder(I)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfoOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfoOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getCallHatInfosOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfoOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->id_:Ljava/lang/String;

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

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->liveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->liveId_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getId()Ljava/lang/String;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->liveId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getLiveId()Ljava/lang/String;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->status_:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-nez v2, :cond_3

    .line 52
    .line 53
    const/4 v2, 0x3

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getStatus()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    add-int/2addr v0, v2

    .line 63
    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 64
    .line 65
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-ge v1, v2, :cond_4

    .line 70
    .line 71
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 72
    .line 73
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    check-cast v2, Lcom/google/protobuf/q;

    .line 78
    .line 79
    const/4 v3, 0x4

    .line 80
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    add-int/2addr v0, v2

    .line 85
    add-int/lit8 v1, v1, 0x1

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->updatedTime_:J

    .line 89
    .line 90
    const-wide/16 v3, 0x0

    .line 91
    .line 92
    cmp-long v3, v1, v3

    .line 93
    .line 94
    if-eqz v3, :cond_5

    .line 95
    .line 96
    const/4 v3, 0x5

    .line 97
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    add-int/2addr v0, v1

    .line 102
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->toast_:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-nez v1, :cond_6

    .line 109
    .line 110
    const/4 v1, 0x6

    .line 111
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getToast()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    add-int/2addr v0, v1

    .line 120
    :cond_6
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 121
    .line 122
    return v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->status_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStatusBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->status_:Ljava/lang/String;

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

.method public getToast()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->toast_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToastBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->toast_:Ljava/lang/String;

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

.method public getUpdatedTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->updatedTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->liveId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getLiveId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->status_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getStatus()Ljava/lang/String;

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
    const/4 v0, 0x0

    .line 50
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 51
    .line 52
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-ge v0, v1, :cond_3

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->callHatInfos_:Lcom/google/protobuf/l$h;

    .line 59
    .line 60
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Lcom/google/protobuf/q;

    .line 65
    .line 66
    const/4 v2, 0x4

    .line 67
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 68
    .line 69
    .line 70
    add-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->updatedTime_:J

    .line 74
    .line 75
    const-wide/16 v2, 0x0

    .line 76
    .line 77
    cmp-long v2, v0, v2

    .line 78
    .line 79
    if-eqz v2, :cond_4

    .line 80
    .line 81
    const/4 v2, 0x5

    .line 82
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 83
    .line 84
    .line 85
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->toast_:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_5

    .line 92
    .line 93
    const/4 v0, 0x6

    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getToast()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_5
    return-void
.end method
