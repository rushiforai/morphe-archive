.class public Ll/brc0;
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
    const-string v0, "e_getback_match"

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/joa;->L3()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 28
    .line 29
    iget-object p0, p0, Ll/gp90;->a:Ll/zq90;

    .line 30
    .line 31
    iget-object p0, p0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->Op(Ljava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    iget-object p0, p0, Ll/gp90;->a:Ll/zq90;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "p_unmatch,getback_match"

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->recover_unmatches:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 48
    .line 49
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->n1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
