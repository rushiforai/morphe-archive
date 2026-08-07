.class public Ll/pvn;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pvn$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()V
    .locals 2

    .line 1
    const-string v0, "IntlLiveAudioPermissionUtil"

    .line 2
    .line 3
    const-string v1, "releaseAudioInLiveWindow:"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "international_living_window_business_key"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static b()V
    .locals 2

    .line 1
    const-string v0, "IntlLiveAudioPermissionUtil"

    .line 2
    .line 3
    const-string v1, "releaseAudioInLivingRoom"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "international_living_room_business_key"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static c(Ljava/lang/String;Ll/ga1;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->CHAT_ROOM_WINDOW:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 2
    .line 3
    const-string v1, "voice"

    .line 4
    .line 5
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->j:I

    .line 12
    .line 13
    invoke-static {p0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->i:I

    .line 19
    .line 20
    invoke-static {p0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->setBusinessMsg(Ljava/lang/String;)Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 25
    .line 26
    .line 27
    const-string p0, "IntlLiveAudioPermissionUtil"

    .line 28
    .line 29
    const-string v1, "requestAudioInLivingRoom"

    .line 30
    .line 31
    invoke-static {p0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v1, "international_living_room_business_key"

    .line 39
    .line 40
    invoke-virtual {p0, v1, v0, p1}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static d(ZLl/ga1;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "updateLiveWindowAudioType:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "IntlLiveAudioPermissionUtil"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    sget-object p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->CHAT_ROOM_WINDOW:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 26
    .line 27
    :goto_0
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "international_living_window_business_key"

    .line 32
    .line 33
    invoke-virtual {v0, v1, p0, p1}, Ll/pb1;->g(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static e(Ll/ga1;)V
    .locals 3

    .line 1
    const-string v0, "IntlLiveAudioPermissionUtil"

    .line 2
    .line 3
    const-string v1, "updateLivingRoomAudioType"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->CHAT_ROOM_WINDOW:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 9
    .line 10
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "international_living_room_business_key"

    .line 15
    .line 16
    invoke-virtual {v1, v2, v0, p0}, Ll/pb1;->g(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
