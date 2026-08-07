.class public Ll/dhn0;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;",
        ">;"
    }
.end annotation


# instance fields
.field public final h:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;",
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
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/dhn0;->h:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;Ljava/lang/String;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getUserId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object v0, p0, Ll/dhn0;->h:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/dhn0;->h:Ljava/util/HashMap;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getServerTimeInSeconds()J

    .line 17
    .line 18
    .line 19
    move-result-wide p0

    .line 20
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v1, p2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    return v2

    .line 28
    :cond_0
    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ljava/lang/Long;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getServerTimeInSeconds()J

    .line 39
    .line 40
    .line 41
    move-result-wide v3

    .line 42
    cmp-long v0, v0, v3

    .line 43
    .line 44
    if-ltz v0, :cond_1

    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    return p0

    .line 48
    :cond_1
    iget-object p0, p0, Ll/dhn0;->h:Ljava/util/HashMap;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getServerTimeInSeconds()J

    .line 51
    .line 52
    .line 53
    move-result-wide v0

    .line 54
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    return v2
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;
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
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voice.live.photo.sticker"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/dhn0;->B(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/dhn0;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
