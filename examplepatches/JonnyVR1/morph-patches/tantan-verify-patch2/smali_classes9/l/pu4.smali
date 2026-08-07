.class public Ll/pu4;
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
    .locals 5

    .line 1
    invoke-super {p0, p1}, Ll/gp90;->a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "is_reply"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-string v3, "is_match"

    .line 21
    .line 22
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v3, p0, Ll/gp90;->a:Ll/zq90;

    .line 27
    .line 28
    iget-object v3, v3, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    const-string v4, "owner_id"

    .line 33
    .line 34
    invoke-static {v4, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    filled-new-array {v0, v2, v3}, [Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v2, "e_send_message"

    .line 43
    .line 44
    const-string v3, "p_suggest_user_profile_info_view"

    .line 45
    .line 46
    invoke-static {v2, v3, v0}, Ll/sfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/gp90;->a:Ll/zq90;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v2, p0, Ll/gp90;->a:Ll/zq90;

    .line 56
    .line 57
    invoke-virtual {v2}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    iget-object p0, p0, Ll/gp90;->a:Ll/zq90;

    .line 62
    .line 63
    iget-object p0, p0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v2, p0, v1, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method
