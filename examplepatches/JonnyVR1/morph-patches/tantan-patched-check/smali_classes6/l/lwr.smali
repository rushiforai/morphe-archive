.class public Ll/lwr;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String; = "LiveAudioPermissionUtil"

.field public static b:Ljava/lang/String; = "living_room_business_key"

.field public static c:Ljava/lang/String; = "living_window_business_key"

.field public static d:Ljava/lang/String; = "living_square_business_key"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

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
    sget-object v0, Ll/lwr;->a:Ljava/lang/String;

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
    sget-object v1, Ll/lwr;->c:Ljava/lang/String;

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
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Ll/lwr;->a:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "releaseAudioInLivingRoom"

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Ll/lwr;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static c(ZLl/ga1;)V
    .locals 3

    .line 1
    sget-object v0, Ll/lwr;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "requestAudioInLiveWindow:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

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
    sget-object v1, Ll/lwr;->c:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1, p0, p1}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static d()V
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Ll/lwr;->a:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "requestAudioInLivingRoom"

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Ll/lwr;->b:Ljava/lang/String;

    .line 20
    .line 21
    sget-object v2, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->LIVE_IN_ROOM:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 22
    .line 23
    new-instance v3, Ll/lwr$a;

    .line 24
    .line 25
    invoke-direct {v3}, Ll/lwr$a;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1, v2, v3}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public static e(Ll/ga1;)V
    .locals 3

    .line 1
    sget-object v0, Ll/lwr;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "requestAudioInNormalLiveSquare:"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 9
    .line 10
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget-object v2, Ll/lwr;->d:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v1, v2, v0, p0}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static f(Ll/ga1;)V
    .locals 3

    .line 1
    sget-object v0, Ll/lwr;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "requestAudioInNormalLiveWindow:"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 9
    .line 10
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget-object v2, Ll/lwr;->c:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v1, v2, v0, p0}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static g(ZLl/ga1;)V
    .locals 3

    .line 1
    sget-object v0, Ll/lwr;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "updateLiveWindowAudioType:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

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
    sget-object v1, Ll/lwr;->c:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1, p0, p1}, Ll/pb1;->g(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static h(Ll/ga1;)V
    .locals 3

    .line 1
    sget-object v0, Ll/lwr;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "updateNormalLivingWindowAudioType:"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 9
    .line 10
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget-object v2, Ll/lwr;->c:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v1, v2, v0, p0}, Ll/pb1;->g(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
