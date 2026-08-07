.class public Ll/ks40;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;",
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
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;",
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
.method public B(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getRoomId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const-string v0, "no_care"

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getLiveId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p2, v0, p1}, Ll/mq2;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;
    .locals 0

    .line 1
    return-object p2
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voicelive.bossMode.userScore"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ks40;->B(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ks40;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
