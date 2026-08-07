.class public Ll/mcv;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;",
            ">;",
            "Ll/zod;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/jk2;-><init>(Ll/wbg0;Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final B(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v0, "userId :"

    .line 6
    .line 7
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getUserId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p1, "\n"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    const-string p0, ""

    .line 28
    .line 29
    return-object p0
.end method

.method public C(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final D(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v0, "userId :"

    .line 6
    .line 7
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getUserId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p1, "\n"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    const-string p0, ""

    .line 28
    .line 29
    return-object p0
.end method

.method public E(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;
    .locals 0

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getStatus()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getId()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getCurrentSing()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ll/mcv;->B(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getNextSing()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ll/mcv;->D(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    invoke-static {p2}, Ll/f7t;->n(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "intl.voice.sing"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/mcv;->C(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic z(Ljava/lang/String;Lcom/google/protobuf/q;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/mcv;->E(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
