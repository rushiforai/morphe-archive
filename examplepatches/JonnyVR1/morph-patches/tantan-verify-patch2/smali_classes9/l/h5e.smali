.class public Ll/h5e;
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
    iget-object p1, p0, Ll/gp90;->a:Ll/zq90;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/zq90;->E()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    const-string p1, "e_push_profile_dislike"

    .line 13
    .line 14
    const-string v0, "p_push_profile"

    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Ll/gp90;->a:Ll/zq90;

    .line 20
    .line 21
    iget-object p1, p1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 32
    .line 33
    iget-object v0, p0, Ll/gp90;->a:Ll/zq90;

    .line 34
    .line 35
    iget-object v0, v0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1}, Ll/br5;->f(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    invoke-static {p1}, Ll/br5;->d(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-nez p1, :cond_1

    .line 54
    .line 55
    iget-object p1, p0, Ll/gp90;->a:Ll/zq90;

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/zq90;->W()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {p1}, Ll/gp5;->i(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    iget-object p1, p0, Ll/gp90;->a:Ll/zq90;

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/zq90;->W()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget-object v0, p0, Ll/gp90;->a:Ll/zq90;

    .line 71
    .line 72
    iget-object v0, v0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 75
    .line 76
    const-string v1, "moments_user_id"

    .line 77
    .line 78
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    filled-new-array {v0}, [Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const-string v1, "e_dislikeButton"

    .line 87
    .line 88
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/gp90;->a:Ll/zq90;

    .line 92
    .line 93
    iget-object p0, p0, Ll/zq90;->i:Ll/hp90;

    .line 94
    .line 95
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 96
    .line 97
    invoke-interface {p0, p1}, Ll/hp90;->a(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method
