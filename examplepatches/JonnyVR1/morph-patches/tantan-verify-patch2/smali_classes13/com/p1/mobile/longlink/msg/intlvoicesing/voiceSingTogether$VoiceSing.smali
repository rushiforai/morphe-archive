.class public final Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSingOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceSing"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;",
        "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSingOrBuilder;"
    }
.end annotation


# static fields
.field public static final CURRENTSING_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final NEXTSING_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;",
            ">;"
        }
    .end annotation
.end field

.field public static final STATUS_FIELD_NUMBER:I = 0x2

.field public static final TOAST_FIELD_NUMBER:I = 0x5


# instance fields
.field private currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

.field private id_:Ljava/lang/String;

.field private nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

.field private status_:Ljava/lang/String;

.field private toast_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->status_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->toast_:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->clearCurrentSing()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->clearId()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->clearNextSing()V

    return-void
.end method

.method private clearCurrentSing()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 3
    .line 4
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearNextSing()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 3
    .line 4
    return-void
.end method

.method private clearStatus()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getStatus()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->status_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearToast()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getToast()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->toast_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->clearStatus()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->clearToast()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->mergeCurrentSing(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->mergeNextSing(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->setCurrentSing(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing$Builder;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->setCurrentSing(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->setNextSing(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing$Builder;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->setNextSing(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V

    return-void
.end method

.method private mergeCurrentSing(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->newBuilder(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 33
    .line 34
    return-void
.end method

.method private mergeNextSing(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->newBuilder(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->setStatus(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->setStatusBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->setToast(Ljava/lang/String;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->setToastBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic r()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    return-object v0
.end method

.method private setCurrentSing(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 8
    .line 9
    return-void
.end method

.method private setCurrentSing(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    return-void
.end method

.method private setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setNextSing(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 8
    .line 9
    return-void
.end method

.method private setNextSing(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    return-void
.end method

.method private setStatus(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->status_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->status_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->toast_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->toast_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->PARSER:Ll/ng60;

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
    if-nez p1, :cond_b

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
    if-eq v2, v3, :cond_a

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq v2, v3, :cond_9

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq v2, v3, :cond_7

    .line 72
    .line 73
    const/16 v3, 0x22

    .line 74
    .line 75
    if-eq v2, v3, :cond_5

    .line 76
    .line 77
    const/16 v3, 0x2a

    .line 78
    .line 79
    if-eq v2, v3, :cond_4

    .line 80
    .line 81
    invoke-virtual {p2, v2}, Lcom/google/protobuf/e;->R(I)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-nez v2, :cond_2

    .line 86
    .line 87
    :cond_3
    move p1, v1

    .line 88
    goto :goto_3

    .line 89
    :catch_0
    move-exception p1

    .line 90
    goto/16 :goto_6

    .line 91
    .line 92
    :catch_1
    move-exception p1

    .line 93
    goto/16 :goto_7

    .line 94
    .line 95
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->toast_:Ljava/lang/String;

    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 103
    .line 104
    if-eqz v2, :cond_6

    .line 105
    .line 106
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    check-cast v2, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing$Builder;

    .line 111
    .line 112
    goto :goto_4

    .line 113
    :cond_6
    move-object v2, v0

    .line 114
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->parser()Ll/ng60;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    check-cast v3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 123
    .line 124
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 125
    .line 126
    if-eqz v2, :cond_2

    .line 127
    .line 128
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    check-cast v2, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 136
    .line 137
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_7
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 141
    .line 142
    if-eqz v2, :cond_8

    .line 143
    .line 144
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    check-cast v2, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing$Builder;

    .line 149
    .line 150
    goto :goto_5

    .line 151
    :cond_8
    move-object v2, v0

    .line 152
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->parser()Ll/ng60;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    check-cast v3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 161
    .line 162
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 163
    .line 164
    if-eqz v2, :cond_2

    .line 165
    .line 166
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    check-cast v2, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 174
    .line 175
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 176
    .line 177
    goto :goto_3

    .line 178
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->status_:Ljava/lang/String;

    .line 183
    .line 184
    goto/16 :goto_3

    .line 185
    .line 186
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->id_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 191
    .line 192
    goto/16 :goto_3

    .line 193
    .line 194
    :catchall_1
    move-exception p0

    .line 195
    throw p0

    .line 196
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 197
    .line 198
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 210
    .line 211
    .line 212
    return-object v0

    .line 213
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 218
    .line 219
    .line 220
    return-object v0

    .line 221
    :cond_b
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 222
    .line 223
    return-object p0

    .line 224
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 225
    .line 226
    check-cast p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 227
    .line 228
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->id_:Ljava/lang/String;

    .line 229
    .line 230
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 231
    .line 232
    .line 233
    move-result p1

    .line 234
    xor-int/2addr p1, v1

    .line 235
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->id_:Ljava/lang/String;

    .line 236
    .line 237
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->id_:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 240
    .line 241
    .line 242
    move-result v2

    .line 243
    xor-int/2addr v2, v1

    .line 244
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->id_:Ljava/lang/String;

    .line 245
    .line 246
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->id_:Ljava/lang/String;

    .line 251
    .line 252
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->status_:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 255
    .line 256
    .line 257
    move-result p1

    .line 258
    xor-int/2addr p1, v1

    .line 259
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->status_:Ljava/lang/String;

    .line 260
    .line 261
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->status_:Ljava/lang/String;

    .line 262
    .line 263
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 264
    .line 265
    .line 266
    move-result v2

    .line 267
    xor-int/2addr v2, v1

    .line 268
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->status_:Ljava/lang/String;

    .line 269
    .line 270
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->status_:Ljava/lang/String;

    .line 275
    .line 276
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 277
    .line 278
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 279
    .line 280
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    check-cast p1, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 285
    .line 286
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 287
    .line 288
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 289
    .line 290
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 291
    .line 292
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 293
    .line 294
    .line 295
    move-result-object p1

    .line 296
    check-cast p1, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 297
    .line 298
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 299
    .line 300
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->toast_:Ljava/lang/String;

    .line 301
    .line 302
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 303
    .line 304
    .line 305
    move-result p1

    .line 306
    xor-int/2addr p1, v1

    .line 307
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->toast_:Ljava/lang/String;

    .line 308
    .line 309
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->toast_:Ljava/lang/String;

    .line 310
    .line 311
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 312
    .line 313
    .line 314
    move-result v2

    .line 315
    xor-int/2addr v1, v2

    .line 316
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->toast_:Ljava/lang/String;

    .line 317
    .line 318
    invoke-interface {p2, p1, v0, v1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->toast_:Ljava/lang/String;

    .line 323
    .line 324
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 325
    .line 326
    return-object p0

    .line 327
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing$Builder;

    .line 328
    .line 329
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing$Builder;-><init>(Ll/h6r0;)V

    .line 330
    .line 331
    .line 332
    return-object p0

    .line 333
    :pswitch_5
    return-object v0

    .line 334
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 335
    .line 336
    return-object p0

    .line 337
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 338
    .line 339
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;-><init>()V

    .line 340
    .line 341
    .line 342
    return-object p0

    .line 343
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

.method public getCurrentSing()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->id_:Ljava/lang/String;

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

.method public getNextSing()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->status_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getStatus()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getCurrentSing()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x4

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getNextSing()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->toast_:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_5

    .line 79
    .line 80
    const/4 v1, 0x5

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getToast()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    add-int/2addr v0, v1

    .line 90
    :cond_5
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 91
    .line 92
    return v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->status_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStatusBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->status_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->toast_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToastBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->toast_:Ljava/lang/String;

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

.method public hasCurrentSing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

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

.method public hasNextSing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->status_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getStatus()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->currentSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getCurrentSing()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->nextSing_:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    const/4 v0, 0x4

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getNextSing()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->toast_:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_4

    .line 64
    .line 65
    const/4 v0, 0x5

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getToast()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_4
    return-void
.end method
