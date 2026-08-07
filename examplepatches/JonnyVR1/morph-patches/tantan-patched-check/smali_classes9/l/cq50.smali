.class public Ll/cq50;
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

.method public static synthetic e(Ll/cq50;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cq50;->f()V

    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/gp90;->a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "e_intl_instantmatch_btn"

    .line 5
    .line 6
    const-string v0, "p_suggest_user_profile_info_view"

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/gp90;->a:Ll/zq90;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Ll/gp90;->a:Ll/zq90;

    .line 22
    .line 23
    iget-object v1, v1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    new-instance v2, Ll/bq50;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/bq50;-><init>(Ll/cq50;)V

    .line 28
    .line 29
    .line 30
    const-string p0, "p_suggest_user_profile_info_view,e_intl_instantmatch_btn,click"

    .line 31
    .line 32
    invoke-virtual {p1, v0, v1, p0, v2}, Lcom/p1/mobile/putong/core/ui/match/a;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gp90;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f()V
    .locals 2

    .line 1
    invoke-static {}, Ll/d79;->V()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/gp90;->a:Ll/zq90;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/zq90;->r()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/gp90;->a:Ll/zq90;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->REMOVE:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/app/Activity;->setResult(I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Ll/gp90;->a:Ll/zq90;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method
