.class public Ll/rbl0;
.super Ll/gp90;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/zq90;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gp90;-><init>(Ll/zq90;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/gp90;->a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 5
    .line 6
    iget-object p1, p1, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/gp90;->a:Ll/zq90;

    .line 11
    .line 12
    iget-object p1, p1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "anchorId"

    .line 17
    .line 18
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "index"

    .line 23
    .line 24
    const-string v1, "NA"

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v0, "e_live_video_quickchat_room_enter"

    .line 35
    .line 36
    const-string v1, "p_suggest_user_profile_info_view"

    .line 37
    .line 38
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/gp90;->a:Ll/zq90;

    .line 42
    .line 43
    iget-object p1, p1, Ll/zq90;->i:Ll/hp90;

    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    invoke-interface {p1, v0}, Ll/hp90;->d(Z)V

    .line 47
    .line 48
    .line 49
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 50
    .line 51
    iget-object p1, p1, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 52
    .line 53
    iget-object v0, p0, Ll/gp90;->a:Ll/zq90;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object p0, p0, Ll/gp90;->a:Ll/zq90;

    .line 60
    .line 61
    iget-object p0, p0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 64
    .line 65
    const-string v1, "profile"

    .line 66
    .line 67
    invoke-interface {p1, v0, p0, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->uq(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/gp90;->d()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/gp90;->a:Ll/zq90;

    .line 5
    .line 6
    iget-object p0, p0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    const-string v0, "anchorId"

    .line 11
    .line 12
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "index"

    .line 17
    .line 18
    const-string v1, "NA"

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "e_live_video_quickchat_room_enter"

    .line 29
    .line 30
    const-string v1, "p_suggest_user_profile_info_view"

    .line 31
    .line 32
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
