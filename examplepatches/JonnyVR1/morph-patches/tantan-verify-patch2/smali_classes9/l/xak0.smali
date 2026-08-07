.class public Ll/xak0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/l4g0;


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
    const-string p1, "e_audio_anchor_invite_call"

    .line 20
    .line 21
    const-string v0, "p_anchor_audio_room"

    .line 22
    .line 23
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ll/oo2;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p2, v1}, Ll/tfs$a;->b(Ll/oo2;Z)Ll/tfs$a;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p2, p3}, Ll/tfs$a;->h(Ljava/lang/String;)Ll/tfs$a;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    invoke-virtual {p3, p1}, Ll/tfs$a;->e(Ljava/lang/String;)Ll/tfs$a;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2}, Ll/tfs$a;->a()Ll/tfs;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p0, p1}, Ll/afu;->c(Ljava/lang/String;Ll/tfs;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "e_pk_gotoliveroom_button"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getLiveId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/kfd0$a;->r(Ljava/lang/String;)Ll/kfd0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/kfd0$a;->g(Ljava/lang/String;)Ll/kfd0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "onlive"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/kfd0$a;->u(Ljava/lang/String;)Ll/kfd0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getMultiCall()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    const-string p0, "video_live"

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ll/kfd0$a;->t(Ljava/lang/String;)Ll/kfd0$a;

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const-string p0, "common_live"

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Ll/kfd0$a;->t(Ljava/lang/String;)Ll/kfd0$a;

    .line 52
    .line 53
    .line 54
    :goto_0
    invoke-virtual {v0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {p0, p1}, Ll/afu;->j(Ll/kfd0;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "live_id"

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "to_user_id"

    .line 8
    .line 9
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string p2, "e_audio_profile_send_message"

    .line 18
    .line 19
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static h()V
    .locals 2

    .line 1
    const-string v0, "e_livecall_user_gift"

    .line 2
    .line 3
    const-string v1, "p_live_profile"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static i()V
    .locals 2

    .line 1
    const-string v0, "e_livecall_user_gift"

    .line 2
    .line 3
    const-string v1, "p_live_profile"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static j(ZLjava/lang/String;Ljava/lang/String;)V
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
    const-string v1, "scene"

    .line 18
    .line 19
    const-string v2, "audio_profile"

    .line 20
    .line 21
    invoke-direct {p2, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ll/pf60;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    const-string p0, "anchor"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const-string p0, "manager"

    .line 32
    .line 33
    :goto_0
    const-string v2, "user_type"

    .line 34
    .line 35
    invoke-direct {v1, v2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    filled-new-array {v0, p1, p2, v1}, [Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p1, "e_audio_anchor_invite_call"

    .line 43
    .line 44
    const-string p2, "p_audio_profile"

    .line 45
    .line 46
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static k(ZLl/oo2;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "p_anchor_audio_room"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "p_user_audio_room"

    .line 7
    .line 8
    :goto_0
    new-instance v0, Ll/pf60;

    .line 9
    .line 10
    const-string v1, "anchor_id"

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/pf60;

    .line 20
    .line 21
    const-string v2, "live_id"

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/pf60;

    .line 31
    .line 32
    const-string v3, "anchorInviteCall"

    .line 33
    .line 34
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_1

    .line 39
    .line 40
    const-string p2, "message"

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    const-string p2, "welcome_message"

    .line 44
    .line 45
    :goto_1
    const-string v3, "scene"

    .line 46
    .line 47
    invoke-direct {v2, v3, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    new-instance p2, Ll/pf60;

    .line 51
    .line 52
    const-string v3, "roomId"

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-direct {p2, v3, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    new-instance p1, Ll/pf60;

    .line 62
    .line 63
    const-string v3, "user_type"

    .line 64
    .line 65
    invoke-direct {p1, v3, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    filled-new-array {v0, v1, v2, p2, p1}, [Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const-string p2, "e_audio_anchor_invite_call"

    .line 73
    .line 74
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xak0;->a:Ll/l4g0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/xak0;->a:Ll/l4g0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Ll/xak0;->a:Ll/l4g0;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V
    .locals 7

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    invoke-virtual/range {v0 .. v6}, Ll/xak0;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Z)V
    .locals 7

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    const-class v1, Ll/tak0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, p1, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/xak0;->a:Ll/l4g0;

    .line 13
    .line 14
    const-string p1, "liveId"

    .line 15
    .line 16
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string p1, "anchorId"

    .line 21
    .line 22
    invoke-static {p1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const-string p1, "liveroom_type"

    .line 27
    .line 28
    invoke-static {p4}, Ll/jlk0;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    const-string p1, "tooltips_trigger_mode"

    .line 37
    .line 38
    const-string p2, "active"

    .line 39
    .line 40
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    if-eqz p6, :cond_0

    .line 45
    .line 46
    const-string p1, "perform_anchor"

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-static {p5}, Ll/jlk0;->c(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    :goto_0
    const-string p2, "audio_user_type"

    .line 54
    .line 55
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    const-string p1, "card_user_id"

    .line 60
    .line 61
    invoke-virtual {p5}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    filled-new-array/range {v1 .. v6}, [Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/xak0;->a:Ll/l4g0;

    .line 77
    .line 78
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/xak0;->a:Ll/l4g0;

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 84
    .line 85
    .line 86
    return-void
.end method
