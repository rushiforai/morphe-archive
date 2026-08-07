.class public Ll/w7p0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Ljava/lang/String;Ljava/lang/String;Ll/oo2;Ljava/lang/String;)V
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

.method public static b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
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

.method public static c()V
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

.method public static d(Ll/oo2;Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;)V
    .locals 3

    .line 1
    sget-object v0, Ll/zeu;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vp20;->p()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "p_anchor_audio_room"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p0, "p_user_audio_room"

    .line 13
    .line 14
    :goto_0
    const-string v1, "equipment_type"

    .line 15
    .line 16
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;->type:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "equipment_id"

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    filled-new-array {v1, p1}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {v0, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static e(Ll/oo2;)V
    .locals 1

    .line 1
    sget-object v0, Ll/zeu;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vp20;->p()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "p_anchor_audio_room"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p0, "p_user_audio_room"

    .line 13
    .line 14
    :goto_0
    invoke-static {v0, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static f()V
    .locals 2

    .line 1
    sget-object v0, Ll/zeu;->d:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "p_audio_profile"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static g()V
    .locals 2

    .line 1
    sget-object v0, Ll/zeu;->d:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "p_audio_profile"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
