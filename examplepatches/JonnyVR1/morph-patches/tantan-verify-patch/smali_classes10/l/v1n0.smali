.class public Ll/v1n0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String; = "[voice][call]"


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

.method public static a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const-string v1, "anchor_id"

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ll/pf60;

    .line 9
    .line 10
    const-string v1, "live_id"

    .line 11
    .line 12
    invoke-direct {p0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p1, "e_audio_accept_anchor_call"

    .line 20
    .line 21
    const-string v0, "p_user_audio_room"

    .line 22
    .line 23
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static b(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string v0, "p_anchor_audio_room"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "p_user_audio_room"

    .line 7
    .line 8
    :goto_0
    new-instance v1, Ll/pf60;

    .line 9
    .line 10
    const-string v2, "anchor_id"

    .line 11
    .line 12
    invoke-direct {v1, v2, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Ll/pf60;

    .line 16
    .line 17
    const-string v2, "live_id"

    .line 18
    .line 19
    invoke-direct {p1, v2, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    new-instance p2, Ll/pf60;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    const-string p0, "anchor"

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    const-string p0, "manager"

    .line 30
    .line 31
    :goto_1
    const-string v2, "user_type"

    .line 32
    .line 33
    invoke-direct {p2, v2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    new-instance p0, Ll/pf60;

    .line 37
    .line 38
    const-string v2, "scene"

    .line 39
    .line 40
    const-string v3, "message"

    .line 41
    .line 42
    invoke-direct {p0, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    filled-new-array {v1, p1, p2, p0}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "e_audio_apply_anchor_approve"

    .line 50
    .line 51
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static c()V
    .locals 2

    .line 1
    const-string v0, "e_audio_blank"

    .line 2
    .line 3
    const-string v1, "p_anchor_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static d()V
    .locals 2

    .line 1
    const-string v0, "e_audio_blank"

    .line 2
    .line 3
    const-string v1, "p_user_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static e(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ll/v1n0;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static f(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    const/4 p2, -0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 6
    .line 7
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "playTelepathicAnim userId:"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p0, ",call position:"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, ",url:"

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Ll/v1n0;->e(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static g(Ll/x8p0;Ll/nsv;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x8p0;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "-1"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p1, Ll/h64;

    .line 9
    .line 10
    iget-object p1, p1, Ll/h64;->a:Ljava/lang/String;

    .line 11
    .line 12
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v1, "updateAvatarFrame avatarFrame:"

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/x8p0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/google/protobuf/nano/MessageNano;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p0, ",userId:"

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Ll/v1n0;->e(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static h(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const-string v1, "anchor_id"

    .line 4
    .line 5
    invoke-direct {v0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/pf60;

    .line 9
    .line 10
    const-string v1, "live_id"

    .line 11
    .line 12
    invoke-direct {p1, v1, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    new-instance p2, Ll/pf60;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p0, "anchor"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p0, "manager"

    .line 23
    .line 24
    :goto_0
    const-string v1, "user_type"

    .line 25
    .line 26
    invoke-direct {p2, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/pf60;

    .line 30
    .line 31
    const-string v1, "scene"

    .line 32
    .line 33
    const-string v2, "management_host"

    .line 34
    .line 35
    invoke-direct {p0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    filled-new-array {v0, p1, p2, p0}, [Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p1, "e_audio_apply_anchor_approve"

    .line 43
    .line 44
    const-string p2, "p_audio_management_panel"

    .line 45
    .line 46
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static i(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const-string v1, "anchorId"

    .line 4
    .line 5
    invoke-direct {v0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/pf60;

    .line 9
    .line 10
    const-string v1, "liveId"

    .line 11
    .line 12
    invoke-direct {p1, v1, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    new-instance p2, Ll/pf60;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p0, "anchor"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p0, "manager"

    .line 23
    .line 24
    :goto_0
    const-string v1, "user_type"

    .line 25
    .line 26
    invoke-direct {p2, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/pf60;

    .line 30
    .line 31
    const-string v1, "scene"

    .line 32
    .line 33
    const-string v2, "management_host"

    .line 34
    .line 35
    invoke-direct {p0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    filled-new-array {v0, p1, p2, p0}, [Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p1, "e_audio_voice_apply_refuse"

    .line 43
    .line 44
    const-string p2, "p_audio_management_panel"

    .line 45
    .line 46
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static j()V
    .locals 2

    .line 1
    const-string v0, "e_audio_user_application"

    .line 2
    .line 3
    const-string v1, "p_user_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static k()V
    .locals 2

    .line 1
    const-string v0, "e_audio_hour_rank"

    .line 2
    .line 3
    const-string v1, "p_anchor_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static l()V
    .locals 2

    .line 1
    const-string v0, "e_audio_hour_rank"

    .line 2
    .line 3
    const-string v1, "p_user_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static m()V
    .locals 2

    .line 1
    const-string v0, "e_audio_top1_notice"

    .line 2
    .line 3
    const-string v1, "p_user_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static n()V
    .locals 2

    .line 1
    const-string v0, "e_audio_contribution"

    .line 2
    .line 3
    const-string v1, "p_anchor_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static o()V
    .locals 2

    .line 1
    const-string v0, "e_audio_image"

    .line 2
    .line 3
    const-string v1, "p_anchor_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static p()V
    .locals 2

    .line 1
    const-string v0, "e_audio_image"

    .line 2
    .line 3
    const-string v1, "p_user_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static q()V
    .locals 2

    .line 1
    const-string v0, "e_audio_contribution"

    .line 2
    .line 3
    const-string v1, "p_user_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static r()V
    .locals 2

    .line 1
    const-string v0, "e_audio_management_entr"

    .line 2
    .line 3
    const-string v1, "p_anchor_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static s()V
    .locals 2

    .line 1
    const-string v0, "e_audio_management_entr"

    .line 2
    .line 3
    const-string v1, "p_user_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static t()V
    .locals 2

    .line 1
    const-string v0, "e_audio_remove"

    .line 2
    .line 3
    const-string v1, "p_anchor_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static u()V
    .locals 2

    .line 1
    const-string v0, "e_audio_remove"

    .line 2
    .line 3
    const-string v1, "p_user_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static v()V
    .locals 2

    .line 1
    const-string v0, "e_audio_management_host"

    .line 2
    .line 3
    const-string v1, "p_anchor_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static w()V
    .locals 2

    .line 1
    const-string v0, "e_audio_management_host"

    .line 2
    .line 3
    const-string v1, "p_user_audio_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
