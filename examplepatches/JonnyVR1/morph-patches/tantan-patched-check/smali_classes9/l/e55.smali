.class public Ll/e55;
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
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/gp90;->a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/gp90;->a:Ll/zq90;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/zq90;->W()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string v0, "e_user_info_greet_to_city_cover"

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/gp90;->a:Ll/zq90;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p0, p0, Ll/gp90;->a:Ll/zq90;

    .line 22
    .line 23
    iget-object p0, p0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/d;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
