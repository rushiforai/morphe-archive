.class public Ll/sgo0;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;",
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
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;",
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
.method public B(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;
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
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voicelive.pk.point"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/sgo0;->B(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/sgo0;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$VoiceLivePkPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
