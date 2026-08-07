.class public Ll/u820;
.super Ll/u1b0;
.source "SourceFile"

# interfaces
.implements Ll/yek0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/u1b0<",
        "Ll/f920;",
        ">;",
        "Ll/yek0;"
    }
.end annotation


# instance fields
.field public a:Ll/iq40;

.field public b:Ll/ip40;

.field public c:Ll/v1b0;

.field public d:Ll/p520;

.field public e:Lcom/p1/mobile/putong/core/data/AppealInfo;

.field public f:Lcom/p1/mobile/android/app/Frag;


# direct methods
.method public static synthetic A0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic C0(Ll/u820;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u820;->r1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic D0(Ll/u820;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u820;->u1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic E0(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/android/app/c;Ljava/lang/Boolean;Ljava/lang/Boolean;Ll/uxj0;Ljava/lang/Boolean;Ll/pf60;Ll/uxj0;Ll/uxj0;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic F0(Lcom/p1/mobile/putong/newui/main/base/TabName;Ljava/util/List;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic G0(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/aw90;->S()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 18
    .line 19
    iget-object p0, p0, Ll/mk8;->R:Ll/byd0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ljava/lang/Long;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    invoke-static {}, Ll/pzi0;->o()J

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 44
    .line 45
    iget-object p0, p0, Ll/mk8;->S:Ll/byd0;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ljava/lang/Long;

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 54
    .line 55
    .line 56
    move-result-wide v2

    .line 57
    sub-long/2addr v0, v2

    .line 58
    invoke-static {}, Ll/gra;->L0()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    int-to-long v2, p0

    .line 63
    const-wide/32 v4, 0xea60

    .line 64
    .line 65
    .line 66
    mul-long/2addr v2, v4

    .line 67
    cmp-long p0, v0, v2

    .line 68
    .line 69
    if-lez p0, :cond_0

    .line 70
    .line 71
    const/4 p0, 0x1

    .line 72
    goto :goto_0

    .line 73
    :cond_0
    const/4 p0, 0x0

    .line 74
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method public static synthetic H0(Ljava/util/ArrayList;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic I0(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic J0(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic L0(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mk8;->n3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic N0(Ll/pf60;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic O0(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/data/FollowshipCounters;)Lcom/p1/mobile/putong/data/FollowshipCounters;
    .locals 0

    .line 1
    return-object p1
.end method

.method public static synthetic P0(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic Q0(Ll/u820;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u820;->t1(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic R0(Ll/bkj0;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    invoke-static {}, Ll/du80;->g()Ll/du80;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/du80;->d(Z)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-nez v2, :cond_1

    .line 15
    .line 16
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_2

    .line 21
    .line 22
    iget-object v2, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v2, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 27
    .line 28
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 29
    .line 30
    if-ne v2, v3, :cond_0

    .line 31
    .line 32
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 37
    .line 38
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 39
    .line 40
    const-string v3, "tttVip"

    .line 41
    .line 42
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-nez v2, :cond_1

    .line 47
    .line 48
    :cond_0
    iget-object p0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 53
    .line 54
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 55
    .line 56
    if-ne p0, v2, :cond_2

    .line 57
    .line 58
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 65
    .line 66
    const-string v0, "svip"

    .line 67
    .line 68
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_2

    .line 73
    .line 74
    :cond_1
    const/4 v1, 0x1

    .line 75
    :cond_2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0
.end method

.method public static synthetic S0(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic U0(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic V0(Ll/u820;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u820;->B1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic W0(Ll/u820;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/u820;->F1(IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic X0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic Y0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/FollowshipCounters;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic a1(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mk8;->q3()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b1(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->G3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic c1(Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/du80;->g()Ll/du80;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/du80;->l()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic d1(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic e1(Ljava/util/List;)Ll/pf60;
    .locals 2

    .line 1
    invoke-static {}, Ll/du80;->g()Ll/du80;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "tttVip"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/du80;->e(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {}, Ll/du80;->g()Ll/du80;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "svip"

    .line 20
    .line 21
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/du80;->e(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static synthetic f1(Ll/u820;Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u820;->s1(Lcom/p1/mobile/putong/core/data/VerificationCenter;)V

    return-void
.end method

.method public static synthetic g1(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->xa()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic h0(Ll/u820;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u820;->q1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic i0(Ljava/lang/Boolean;Ljava/lang/Boolean;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic l0(Ll/u820;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u820;->z1(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method

.method public static synthetic m0(Ll/u820;Lcom/p1/mobile/putong/data/FollowshipCounters;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u820;->C1(Lcom/p1/mobile/putong/data/FollowshipCounters;)V

    return-void
.end method

.method public static synthetic n0(Ll/u820;Lcom/p1/mobile/putong/core/data/FakeGuideData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u820;->D1(Lcom/p1/mobile/putong/core/data/FakeGuideData;)V

    return-void
.end method

.method public static synthetic o0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xzc0;->J()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private synthetic p1(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f920;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/f920;->V()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic q0(Ll/pf60;)Ljava/util/ArrayList;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/Collection;

    .line 4
    .line 5
    new-instance v0, Ll/m820;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/m820;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic r0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s0(Ll/u820;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u820;->x1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic t0(Ll/u820;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u820;->E1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic u0(Ll/u820;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/u820;->p1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic x0(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/android/app/c;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic y0(Lcom/p1/mobile/putong/core/data/NotificationCounter;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->l1:Ll/jxd0;

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->I1()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/core/data/NotificationCounter;->unread:I

    .line 14
    .line 15
    if-lez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic z0(Ll/u820;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u820;->v1(Ll/pf60;)V

    return-void
.end method


# virtual methods
.method public final synthetic B1(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 4
    .line 5
    new-instance v0, Ll/b9c$b;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, p0}, Ll/b9c$b;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/b9c$b;->c(Lcom/p1/mobile/putong/core/data/DatingGuideData;)Ll/b9c$b;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/b9c$b;->a()Ll/b9c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/b9c;->show()V

    .line 23
    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 28
    .line 29
    iget-object p0, p0, Ll/mk8;->R:Ll/byd0;

    .line 30
    .line 31
    invoke-static {}, Ll/pzi0;->o()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/mk8;->w3()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public bridge synthetic C(Ll/iam;)V
    .locals 0

    .line 1
    check-cast p1, Ll/f920;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u820;->h1(Ll/f920;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic C1(Lcom/p1/mobile/putong/data/FollowshipCounters;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/FollowshipCounters;->counters:Lcom/p1/mobile/putong/data/FollowshipCounter;

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/data/FollowshipCounter;->followers:I

    .line 4
    .line 5
    iget p1, p1, Lcom/p1/mobile/putong/data/FollowshipCounter;->followings:I

    .line 6
    .line 7
    add-int/2addr v0, p1

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    iget-object p1, p1, Ll/dkb;->y6:Ll/jxd0;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p0, Ll/f920;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/f920;->X()V

    .line 33
    .line 34
    .line 35
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 38
    .line 39
    iget-object p0, p0, Ll/dkb;->y6:Ll/jxd0;

    .line 40
    .line 41
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public final synthetic D1(Lcom/p1/mobile/putong/core/data/FakeGuideData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f920;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/f920;->T(Lcom/p1/mobile/putong/core/data/FakeGuideData;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic E1(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f920;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/f920;->a0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic F1(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    const/4 p1, -0x1

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0, p1}, Ll/qtk;->L0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 17
    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/dkb;->H7()V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public H1()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/u820;->v()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    new-array v2, v1, [Ll/sfj0$a;

    .line 7
    .line 8
    const-string v3, "e_sidebar"

    .line 9
    .line 10
    invoke-static {v3, v0, v2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Landroid/content/Intent;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const-class v3, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 20
    .line 21
    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, v1, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public I1()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/u820;->v()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Ll/yc2;->b()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const-string v3, "ban_user_appeal_state"

    .line 22
    .line 23
    invoke-static {v3, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    filled-new-array {v2}, [Ll/sfj0$a;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const-string v3, "e_my_profile_navigation_appeal_guide"

    .line 32
    .line 33
    invoke-static {v3, v1, v2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ll/u820;->e:Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 37
    .line 38
    iget-boolean v2, v1, Lcom/p1/mobile/putong/core/data/AppealInfo;->allowAppeal:Z

    .line 39
    .line 40
    if-eqz v2, :cond_3

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    const-string v2, "before"

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-nez v2, :cond_1

    .line 54
    .line 55
    const-string v0, "inProgress"

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_0

    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 81
    .line 82
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_2

    .line 87
    .line 88
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 89
    .line 90
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 91
    .line 92
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_2

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 99
    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_2
    const/4 v0, 0x0

    .line 104
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-interface {v1, v2, v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->buildBanReleaseVerifyIntent(Landroid/content/Context;Lcom/p1/mobile/putong/data/PhoneNumber;)Landroid/content/Intent;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_3
    sget p0, Lcom/p1/mobile/putong/core/R$string;->i0:I

    .line 125
    .line 126
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public J1()V
    .locals 8

    .line 1
    const-string v0, "e_picture_fake_button"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u820;->v()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/syx;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/syx;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput v1, v0, Ll/syx;->a:I

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    iput-boolean v2, v0, Ll/syx;->c:Z

    .line 20
    .line 21
    iput-boolean v2, v0, Ll/syx;->b:Z

    .line 22
    .line 23
    iput-boolean v1, v0, Ll/syx;->d:Z

    .line 24
    .line 25
    sget v3, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->D:I

    .line 26
    .line 27
    iput v3, v0, Ll/syx;->f:I

    .line 28
    .line 29
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 32
    .line 33
    invoke-virtual {v3}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 38
    .line 39
    iput-object v3, v0, Ll/syx;->i:Lcom/p1/mobile/putong/data/Gender;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-virtual {v5, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    const v6, 0x3f4ccccd    # 0.8f

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropProportion(F)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-static {}, Ll/bnl0;->y0()I

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    const/high16 v7, 0x42700000    # 60.0f

    .line 73
    .line 74
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    sub-int/2addr v6, v7

    .line 79
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropWidth(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    invoke-virtual {v5}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    invoke-virtual {v4, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    new-instance v3, Ll/n820;

    .line 104
    .line 105
    invoke-direct {v3, p0}, Ll/n820;-><init>(Ll/u820;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    sget v0, Ll/x7c0;->y:I

    .line 116
    .line 117
    invoke-virtual {p0, v0, v2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public final L1(Lcom/p1/mobile/putong/core/data/AppealInfo;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/u820;->e:Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 2
    .line 3
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/yc2;->h(Lcom/p1/mobile/putong/core/data/AppealInfo;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "appeal"

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppeal:Z

    .line 15
    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Ll/f920;

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    invoke-virtual {p0, p1, v0}, Ll/f920;->Y(ZLjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p0, Ll/f920;

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-virtual {p0, p1, v0}, Ll/f920;->Y(ZLjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public a0()V
    .locals 15

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/u820;->b:Ll/ip40;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ip40;->a0()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/u820;->d:Ll/p520;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/ar2;->a0()V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/x620;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/x620;-><init>(Ll/u820;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 v0, 0x0

    .line 38
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const-string v2, "svip"

    .line 43
    .line 44
    const/4 v3, 0x1

    .line 45
    if-eqz v1, :cond_3

    .line 46
    .line 47
    invoke-static {}, Ll/gra;->o2()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_1

    .line 52
    .line 53
    invoke-static {}, Ll/gra;->p2()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 62
    .line 63
    iget-object v1, v1, Ll/dkb;->y6:Ll/jxd0;

    .line 64
    .line 65
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Ljava/lang/Boolean;

    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-nez v1, :cond_2

    .line 76
    .line 77
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 80
    .line 81
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iget-wide v4, v1, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 86
    .line 87
    double-to-long v4, v4

    .line 88
    const/4 v1, 0x0

    .line 89
    const-wide v6, 0x1934a4d4c00L

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    invoke-static {v6, v7, v4, v5, v1}, Ll/tzi0;->h(JJI)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_2

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o7()Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    new-instance v4, Ll/y620;

    .line 109
    .line 110
    invoke-direct {v4}, Ll/y620;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 118
    .line 119
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 120
    .line 121
    invoke-virtual {v4}, Ll/dkb;->o9()Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    new-instance v5, Ll/j720;

    .line 126
    .line 127
    invoke-direct {v5}, Ll/j720;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v4, v5}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    invoke-virtual {v4}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    new-instance v5, Ll/u720;

    .line 139
    .line 140
    invoke-direct {v5}, Ll/u720;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-static {v1, v4, v5}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    new-instance v4, Ll/g820;

    .line 152
    .line 153
    invoke-direct {v4, p0}, Ll/g820;-><init>(Ll/u820;)V

    .line 154
    .line 155
    .line 156
    invoke-static {v4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    invoke-virtual {v1, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 161
    .line 162
    .line 163
    :cond_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o7()Lrx/c;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    new-instance v4, Ll/h820;

    .line 172
    .line 173
    invoke-direct {v4}, Ll/h820;-><init>()V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 181
    .line 182
    .line 183
    move-result-object v4

    .line 184
    new-instance v5, Ll/i820;

    .line 185
    .line 186
    invoke-direct {v5}, Ll/i820;-><init>()V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v4, v5}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    new-instance v5, Ll/j820;

    .line 194
    .line 195
    invoke-direct {v5}, Ll/j820;-><init>()V

    .line 196
    .line 197
    .line 198
    invoke-static {v1, v4, v5}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-virtual {v1, v3}, Lrx/c;->take(I)Lrx/c;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    new-instance v4, Ll/k820;

    .line 211
    .line 212
    invoke-direct {v4, p0}, Ll/k820;-><init>(Ll/u820;)V

    .line 213
    .line 214
    .line 215
    invoke-static {v4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    invoke-virtual {v1, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o7()Lrx/c;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    new-instance v4, Ll/l820;

    .line 231
    .line 232
    invoke-direct {v4}, Ll/l820;-><init>()V

    .line 233
    .line 234
    .line 235
    invoke-virtual {v1, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 236
    .line 237
    .line 238
    move-result-object v5

    .line 239
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    new-instance v4, Ll/i720;

    .line 244
    .line 245
    invoke-direct {v4}, Ll/i720;-><init>()V

    .line 246
    .line 247
    .line 248
    invoke-virtual {v1, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 249
    .line 250
    .line 251
    move-result-object v6

    .line 252
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 253
    .line 254
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 255
    .line 256
    invoke-virtual {v1}, Ll/dkb;->o9()Lrx/c;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    new-instance v4, Ll/uy30;

    .line 261
    .line 262
    invoke-direct {v4}, Ll/uy30;-><init>()V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v1, v4}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 270
    .line 271
    .line 272
    move-result-object v7

    .line 273
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 274
    .line 275
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 276
    .line 277
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 278
    .line 279
    .line 280
    move-result-object v4

    .line 281
    invoke-virtual {v1, v4}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    new-instance v4, Ll/t720;

    .line 286
    .line 287
    invoke-direct {v4}, Ll/t720;-><init>()V

    .line 288
    .line 289
    .line 290
    invoke-virtual {v1, v4}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 295
    .line 296
    .line 297
    move-result-object v8

    .line 298
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 299
    .line 300
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 301
    .line 302
    .line 303
    move-result-object v9

    .line 304
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 305
    .line 306
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 307
    .line 308
    const-string v10, "oDiamond"

    .line 309
    .line 310
    invoke-static {v10}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 311
    .line 312
    .line 313
    move-result-object v10

    .line 314
    invoke-virtual {v4, v10}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 315
    .line 316
    .line 317
    move-result-object v4

    .line 318
    new-instance v10, Ll/e820;

    .line 319
    .line 320
    invoke-direct {v10}, Ll/e820;-><init>()V

    .line 321
    .line 322
    .line 323
    invoke-virtual {v4, v10}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 324
    .line 325
    .line 326
    move-result-object v4

    .line 327
    invoke-virtual {v4}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 328
    .line 329
    .line 330
    move-result-object v10

    .line 331
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 332
    .line 333
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->c1:Ll/usa;

    .line 334
    .line 335
    invoke-virtual {v4}, Ll/usa;->x3()Lrx/subjects/a;

    .line 336
    .line 337
    .line 338
    move-result-object v4

    .line 339
    new-instance v11, Ll/o820;

    .line 340
    .line 341
    invoke-direct {v11}, Ll/o820;-><init>()V

    .line 342
    .line 343
    .line 344
    invoke-virtual {v4, v11}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 345
    .line 346
    .line 347
    move-result-object v4

    .line 348
    invoke-virtual {v4}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 349
    .line 350
    .line 351
    move-result-object v11

    .line 352
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 353
    .line 354
    .line 355
    move-result-object v12

    .line 356
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 357
    .line 358
    .line 359
    move-result-object v13

    .line 360
    new-instance v14, Ll/p820;

    .line 361
    .line 362
    invoke-direct {v14}, Ll/p820;-><init>()V

    .line 363
    .line 364
    .line 365
    invoke-static/range {v5 .. v14}, Ll/psd0;->x(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ycj;)Lrx/c;

    .line 366
    .line 367
    .line 368
    move-result-object v1

    .line 369
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 370
    .line 371
    .line 372
    move-result-object v1

    .line 373
    new-instance v4, Ll/q820;

    .line 374
    .line 375
    invoke-direct {v4, p0}, Ll/q820;-><init>(Ll/u820;)V

    .line 376
    .line 377
    .line 378
    invoke-static {v4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 379
    .line 380
    .line 381
    move-result-object v4

    .line 382
    invoke-virtual {v1, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 383
    .line 384
    .line 385
    invoke-static {}, Ll/fp60;->E()Lrx/c;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 390
    .line 391
    .line 392
    move-result-object v4

    .line 393
    invoke-virtual {v1, v4}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 394
    .line 395
    .line 396
    move-result-object v1

    .line 397
    sget-object v4, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 398
    .line 399
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/core/ui/purchase/e;->v(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;)Lrx/c;

    .line 400
    .line 401
    .line 402
    move-result-object v4

    .line 403
    sget-object v5, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 404
    .line 405
    invoke-static {v0, v5}, Lcom/p1/mobile/putong/core/ui/purchase/e;->v(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;)Lrx/c;

    .line 406
    .line 407
    .line 408
    move-result-object v5

    .line 409
    new-instance v6, Ll/r820;

    .line 410
    .line 411
    invoke-direct {v6}, Ll/r820;-><init>()V

    .line 412
    .line 413
    .line 414
    invoke-static {v1, v4, v5, v6}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 415
    .line 416
    .line 417
    move-result-object v1

    .line 418
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 419
    .line 420
    .line 421
    move-result-object v4

    .line 422
    invoke-virtual {v1, v4}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 423
    .line 424
    .line 425
    move-result-object v1

    .line 426
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 427
    .line 428
    .line 429
    move-result-object v1

    .line 430
    new-instance v4, Ll/s820;

    .line 431
    .line 432
    invoke-direct {v4}, Ll/s820;-><init>()V

    .line 433
    .line 434
    .line 435
    invoke-virtual {v1, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 436
    .line 437
    .line 438
    move-result-object v1

    .line 439
    invoke-virtual {v1, v3}, Lrx/c;->take(I)Lrx/c;

    .line 440
    .line 441
    .line 442
    move-result-object v1

    .line 443
    new-instance v4, Ll/t820;

    .line 444
    .line 445
    invoke-direct {v4}, Ll/t820;-><init>()V

    .line 446
    .line 447
    .line 448
    invoke-static {v4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 449
    .line 450
    .line 451
    move-result-object v4

    .line 452
    invoke-virtual {v1, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 453
    .line 454
    .line 455
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 456
    .line 457
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->M0:Ll/u7b;

    .line 458
    .line 459
    invoke-virtual {v1}, Ll/u7b;->e3()Lrx/c;

    .line 460
    .line 461
    .line 462
    move-result-object v1

    .line 463
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 464
    .line 465
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 466
    .line 467
    invoke-virtual {v4}, Ll/dkb;->o9()Lrx/c;

    .line 468
    .line 469
    .line 470
    move-result-object v4

    .line 471
    new-instance v5, Ll/z620;

    .line 472
    .line 473
    invoke-direct {v5}, Ll/z620;-><init>()V

    .line 474
    .line 475
    .line 476
    invoke-static {v1, v4, v5}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 477
    .line 478
    .line 479
    move-result-object v1

    .line 480
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 481
    .line 482
    .line 483
    move-result-object v1

    .line 484
    new-instance v4, Ll/a720;

    .line 485
    .line 486
    invoke-direct {v4, p0}, Ll/a720;-><init>(Ll/u820;)V

    .line 487
    .line 488
    .line 489
    invoke-static {v4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 490
    .line 491
    .line 492
    move-result-object v4

    .line 493
    invoke-virtual {v1, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 494
    .line 495
    .line 496
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 497
    .line 498
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 499
    .line 500
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 501
    .line 502
    .line 503
    move-result-object v1

    .line 504
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 505
    .line 506
    .line 507
    move-result-object v1

    .line 508
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 509
    .line 510
    .line 511
    move-result-object v1

    .line 512
    new-instance v4, Ll/b720;

    .line 513
    .line 514
    invoke-direct {v4, p0}, Ll/b720;-><init>(Ll/u820;)V

    .line 515
    .line 516
    .line 517
    invoke-static {v4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 518
    .line 519
    .line 520
    move-result-object v4

    .line 521
    invoke-virtual {v1, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 522
    .line 523
    .line 524
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 525
    .line 526
    .line 527
    move-result v1

    .line 528
    if-eqz v1, :cond_4

    .line 529
    .line 530
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o7()Lrx/c;

    .line 531
    .line 532
    .line 533
    move-result-object v1

    .line 534
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 535
    .line 536
    .line 537
    move-result-object v1

    .line 538
    new-instance v4, Ll/c720;

    .line 539
    .line 540
    invoke-direct {v4}, Ll/c720;-><init>()V

    .line 541
    .line 542
    .line 543
    invoke-virtual {v1, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 544
    .line 545
    .line 546
    move-result-object v1

    .line 547
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 548
    .line 549
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 550
    .line 551
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/api/CoreProduct;->E4()Lrx/subjects/a;

    .line 552
    .line 553
    .line 554
    move-result-object v4

    .line 555
    new-instance v5, Ll/d720;

    .line 556
    .line 557
    invoke-direct {v5}, Ll/d720;-><init>()V

    .line 558
    .line 559
    .line 560
    invoke-static {v1, v4, v5}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 561
    .line 562
    .line 563
    move-result-object v1

    .line 564
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 565
    .line 566
    .line 567
    move-result-object v1

    .line 568
    new-instance v4, Ll/e720;

    .line 569
    .line 570
    invoke-direct {v4}, Ll/e720;-><init>()V

    .line 571
    .line 572
    .line 573
    invoke-virtual {v1, v4}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 574
    .line 575
    .line 576
    move-result-object v1

    .line 577
    new-instance v4, Ll/f720;

    .line 578
    .line 579
    invoke-direct {v4}, Ll/f720;-><init>()V

    .line 580
    .line 581
    .line 582
    invoke-virtual {v1, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 583
    .line 584
    .line 585
    move-result-object v1

    .line 586
    invoke-virtual {v1, v3}, Lrx/c;->take(I)Lrx/c;

    .line 587
    .line 588
    .line 589
    move-result-object v1

    .line 590
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 591
    .line 592
    .line 593
    move-result-object v1

    .line 594
    new-instance v4, Ll/g720;

    .line 595
    .line 596
    invoke-direct {v4, p0}, Ll/g720;-><init>(Ll/u820;)V

    .line 597
    .line 598
    .line 599
    invoke-static {v4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 600
    .line 601
    .line 602
    move-result-object v4

    .line 603
    invoke-virtual {v1, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 604
    .line 605
    .line 606
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 607
    .line 608
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 609
    .line 610
    invoke-virtual {v1}, Ll/dkb;->o9()Lrx/c;

    .line 611
    .line 612
    .line 613
    move-result-object v1

    .line 614
    new-instance v4, Ll/uy30;

    .line 615
    .line 616
    invoke-direct {v4}, Ll/uy30;-><init>()V

    .line 617
    .line 618
    .line 619
    invoke-virtual {v1, v4}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 620
    .line 621
    .line 622
    move-result-object v1

    .line 623
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 624
    .line 625
    .line 626
    move-result-object v1

    .line 627
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 628
    .line 629
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 630
    .line 631
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 632
    .line 633
    .line 634
    move-result-object v2

    .line 635
    invoke-virtual {v4, v2}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 636
    .line 637
    .line 638
    move-result-object v2

    .line 639
    new-instance v4, Ll/h720;

    .line 640
    .line 641
    invoke-direct {v4}, Ll/h720;-><init>()V

    .line 642
    .line 643
    .line 644
    invoke-virtual {v2, v4}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 645
    .line 646
    .line 647
    move-result-object v2

    .line 648
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 649
    .line 650
    .line 651
    move-result-object v2

    .line 652
    new-instance v4, Ll/k720;

    .line 653
    .line 654
    invoke-direct {v4}, Ll/k720;-><init>()V

    .line 655
    .line 656
    .line 657
    invoke-static {v1, v2, v4}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 658
    .line 659
    .line 660
    move-result-object v1

    .line 661
    new-instance v2, Ll/l720;

    .line 662
    .line 663
    invoke-direct {v2}, Ll/l720;-><init>()V

    .line 664
    .line 665
    .line 666
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 667
    .line 668
    .line 669
    move-result-object v2

    .line 670
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 671
    .line 672
    .line 673
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 674
    .line 675
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 676
    .line 677
    iget-object v1, v1, Ll/dkb;->C0:Lrx/subjects/a;

    .line 678
    .line 679
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 680
    .line 681
    .line 682
    move-result-object v1

    .line 683
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 684
    .line 685
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 686
    .line 687
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 688
    .line 689
    .line 690
    move-result-object v2

    .line 691
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 692
    .line 693
    .line 694
    move-result-object v2

    .line 695
    new-instance v4, Ll/m720;

    .line 696
    .line 697
    invoke-direct {v4}, Ll/m720;-><init>()V

    .line 698
    .line 699
    .line 700
    invoke-static {v1, v2, v4}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 701
    .line 702
    .line 703
    move-result-object v1

    .line 704
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 705
    .line 706
    .line 707
    move-result-object v1

    .line 708
    new-instance v2, Ll/n720;

    .line 709
    .line 710
    invoke-direct {v2, p0}, Ll/n720;-><init>(Ll/u820;)V

    .line 711
    .line 712
    .line 713
    new-instance v4, Ll/o720;

    .line 714
    .line 715
    invoke-direct {v4}, Ll/o720;-><init>()V

    .line 716
    .line 717
    .line 718
    invoke-static {v2, v4}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 719
    .line 720
    .line 721
    move-result-object v2

    .line 722
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 723
    .line 724
    .line 725
    invoke-static {}, Ll/gra;->V1()Z

    .line 726
    .line 727
    .line 728
    move-result v1

    .line 729
    if-eqz v1, :cond_5

    .line 730
    .line 731
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 732
    .line 733
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 734
    .line 735
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/e;->H8()Lrx/c;

    .line 736
    .line 737
    .line 738
    move-result-object v1

    .line 739
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 740
    .line 741
    .line 742
    move-result-object v1

    .line 743
    new-instance v2, Ll/p720;

    .line 744
    .line 745
    invoke-direct {v2}, Ll/p720;-><init>()V

    .line 746
    .line 747
    .line 748
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 749
    .line 750
    .line 751
    move-result-object v2

    .line 752
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 753
    .line 754
    .line 755
    :cond_5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 756
    .line 757
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 758
    .line 759
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->k1:Ll/jxd0;

    .line 760
    .line 761
    invoke-virtual {v1}, Ll/hxd0;->obs()Lrx/c;

    .line 762
    .line 763
    .line 764
    move-result-object v1

    .line 765
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 766
    .line 767
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 768
    .line 769
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->l1:Ll/jxd0;

    .line 770
    .line 771
    invoke-virtual {v2}, Ll/hxd0;->obs()Lrx/c;

    .line 772
    .line 773
    .line 774
    move-result-object v2

    .line 775
    new-instance v4, Ll/utq;

    .line 776
    .line 777
    invoke-direct {v4}, Ll/utq;-><init>()V

    .line 778
    .line 779
    .line 780
    invoke-static {v1, v2, v4}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 781
    .line 782
    .line 783
    move-result-object v1

    .line 784
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 785
    .line 786
    .line 787
    move-result-object v1

    .line 788
    new-instance v2, Ll/q720;

    .line 789
    .line 790
    invoke-direct {v2, p0}, Ll/q720;-><init>(Ll/u820;)V

    .line 791
    .line 792
    .line 793
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 794
    .line 795
    .line 796
    move-result-object v2

    .line 797
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 798
    .line 799
    .line 800
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 801
    .line 802
    .line 803
    move-result-object v1

    .line 804
    new-instance v2, Ll/r720;

    .line 805
    .line 806
    invoke-direct {v2}, Ll/r720;-><init>()V

    .line 807
    .line 808
    .line 809
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 810
    .line 811
    .line 812
    move-result-object v1

    .line 813
    invoke-virtual {v1, v3}, Lrx/c;->skip(I)Lrx/c;

    .line 814
    .line 815
    .line 816
    move-result-object v1

    .line 817
    new-instance v2, Ll/s720;

    .line 818
    .line 819
    invoke-direct {v2, p0}, Ll/s720;-><init>(Ll/u820;)V

    .line 820
    .line 821
    .line 822
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 823
    .line 824
    .line 825
    move-result-object v2

    .line 826
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 827
    .line 828
    .line 829
    invoke-static {}, Ll/xra;->o()Z

    .line 830
    .line 831
    .line 832
    move-result v1

    .line 833
    if-nez v1, :cond_6

    .line 834
    .line 835
    invoke-static {}, Ll/gra;->e2()Z

    .line 836
    .line 837
    .line 838
    move-result v1

    .line 839
    if-eqz v1, :cond_7

    .line 840
    .line 841
    :cond_6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o7()Lrx/c;

    .line 842
    .line 843
    .line 844
    move-result-object v1

    .line 845
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 846
    .line 847
    .line 848
    move-result-object v1

    .line 849
    new-instance v2, Ll/v720;

    .line 850
    .line 851
    invoke-direct {v2}, Ll/v720;-><init>()V

    .line 852
    .line 853
    .line 854
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 855
    .line 856
    .line 857
    move-result-object v1

    .line 858
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 859
    .line 860
    .line 861
    move-result-object v1

    .line 862
    new-instance v2, Ll/w720;

    .line 863
    .line 864
    invoke-direct {v2, p0}, Ll/w720;-><init>(Ll/u820;)V

    .line 865
    .line 866
    .line 867
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 868
    .line 869
    .line 870
    move-result-object v2

    .line 871
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 872
    .line 873
    .line 874
    :cond_7
    invoke-static {}, Ll/gra;->L3()Z

    .line 875
    .line 876
    .line 877
    move-result v1

    .line 878
    if-eqz v1, :cond_8

    .line 879
    .line 880
    invoke-static {}, Ll/gra;->o2()Z

    .line 881
    .line 882
    .line 883
    move-result v1

    .line 884
    if-nez v1, :cond_8

    .line 885
    .line 886
    invoke-static {}, Ll/gra;->p2()Z

    .line 887
    .line 888
    .line 889
    move-result v1

    .line 890
    if-nez v1, :cond_8

    .line 891
    .line 892
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o7()Lrx/c;

    .line 893
    .line 894
    .line 895
    move-result-object v0

    .line 896
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 897
    .line 898
    .line 899
    move-result-object v0

    .line 900
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 901
    .line 902
    .line 903
    move-result-object v0

    .line 904
    new-instance v1, Ll/x720;

    .line 905
    .line 906
    invoke-direct {v1}, Ll/x720;-><init>()V

    .line 907
    .line 908
    .line 909
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 910
    .line 911
    .line 912
    move-result-object v0

    .line 913
    new-instance v1, Ll/y720;

    .line 914
    .line 915
    invoke-direct {v1}, Ll/y720;-><init>()V

    .line 916
    .line 917
    .line 918
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 919
    .line 920
    .line 921
    move-result-object v1

    .line 922
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 923
    .line 924
    .line 925
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 926
    .line 927
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 928
    .line 929
    invoke-virtual {v0}, Ll/mk8;->y3()Lrx/c;

    .line 930
    .line 931
    .line 932
    move-result-object v0

    .line 933
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 934
    .line 935
    .line 936
    move-result-object v0

    .line 937
    new-instance v1, Ll/z720;

    .line 938
    .line 939
    invoke-direct {v1}, Ll/z720;-><init>()V

    .line 940
    .line 941
    .line 942
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 943
    .line 944
    .line 945
    move-result-object v0

    .line 946
    new-instance v1, Ll/a820;

    .line 947
    .line 948
    invoke-direct {v1, p0}, Ll/a820;-><init>(Ll/u820;)V

    .line 949
    .line 950
    .line 951
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 952
    .line 953
    .line 954
    move-result-object v1

    .line 955
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 956
    .line 957
    .line 958
    :cond_8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 959
    .line 960
    check-cast v0, Ll/f920;

    .line 961
    .line 962
    invoke-virtual {v0}, Ll/ag40;->f()V

    .line 963
    .line 964
    .line 965
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 966
    .line 967
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 968
    .line 969
    invoke-virtual {v0}, Ll/dkb;->i8()Z

    .line 970
    .line 971
    .line 972
    move-result v0

    .line 973
    if-eqz v0, :cond_9

    .line 974
    .line 975
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 976
    .line 977
    .line 978
    move-result-object v0

    .line 979
    new-instance v1, Ll/b820;

    .line 980
    .line 981
    invoke-direct {v1}, Ll/b820;-><init>()V

    .line 982
    .line 983
    .line 984
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 985
    .line 986
    .line 987
    move-result-object v0

    .line 988
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 989
    .line 990
    .line 991
    move-result-object v0

    .line 992
    new-instance v1, Ll/c820;

    .line 993
    .line 994
    invoke-direct {v1}, Ll/c820;-><init>()V

    .line 995
    .line 996
    .line 997
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 998
    .line 999
    .line 1000
    move-result-object v1

    .line 1001
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 1002
    .line 1003
    .line 1004
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1005
    .line 1006
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 1007
    .line 1008
    iget-object v0, v0, Ll/dkb;->V6:Lrx/subjects/a;

    .line 1009
    .line 1010
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 1011
    .line 1012
    .line 1013
    move-result-object v0

    .line 1014
    new-instance v1, Ll/d820;

    .line 1015
    .line 1016
    invoke-direct {v1, p0}, Ll/d820;-><init>(Ll/u820;)V

    .line 1017
    .line 1018
    .line 1019
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 1020
    .line 1021
    .line 1022
    move-result-object v1

    .line 1023
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 1024
    .line 1025
    .line 1026
    :cond_9
    invoke-static {}, Ll/gra;->z2()Z

    .line 1027
    .line 1028
    .line 1029
    move-result v0

    .line 1030
    if-nez v0, :cond_b

    .line 1031
    .line 1032
    invoke-static {}, Ll/gra;->A2()Z

    .line 1033
    .line 1034
    .line 1035
    move-result v0

    .line 1036
    if-eqz v0, :cond_a

    .line 1037
    .line 1038
    goto :goto_1

    .line 1039
    :cond_a
    return-void

    .line 1040
    :cond_b
    :goto_1
    new-instance v0, Ll/f820;

    .line 1041
    .line 1042
    invoke-direct {v0}, Ll/f820;-><init>()V

    .line 1043
    .line 1044
    .line 1045
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 1046
    .line 1047
    .line 1048
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u820;->b:Ll/ip40;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ip40;->destroy()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/u820;->d:Ll/p520;

    .line 7
    .line 8
    invoke-interface {p0}, Ll/k3m;->destroy()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e0(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/u1b0;->e0(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/u820;->d:Ll/p520;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/u820;->d:Ll/p520;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2, p3}, Ll/p520;->f0(IILandroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public g0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u820;->b:Ll/ip40;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ip40;->f1(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/u820;->d:Ll/p520;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/p520;->g0(Z)V

    .line 9
    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->q0:Ll/byd0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ljava/lang/Long;

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->s7(J)Lrx/c;

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public h1(Ll/f920;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/u820;->n1()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->p2()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/u820;->m1()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/u820;->l1()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public i1()Ll/p520;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u820;->d:Ll/p520;

    .line 2
    .line 3
    return-object p0
.end method

.method public j1()Ll/v1b0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u820;->c:Ll/v1b0;

    .line 2
    .line 3
    return-object p0
.end method

.method public k1()Ll/iq40;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u820;->a:Ll/iq40;

    .line 2
    .line 3
    return-object p0
.end method

.method public final l1()V
    .locals 2

    .line 1
    new-instance v0, Ll/p620;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/p620;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/u820;->c:Ll/v1b0;

    .line 11
    .line 12
    new-instance v0, Ll/m620;

    .line 13
    .line 14
    iget-object v1, p0, Ll/u820;->f:Lcom/p1/mobile/android/app/Frag;

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ll/m620;-><init>(Ll/ner;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/u820;->d:Ll/p520;

    .line 20
    .line 21
    iget-object p0, p0, Ll/u820;->c:Ll/v1b0;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final m1()V
    .locals 2

    .line 1
    new-instance v0, Ll/w620;

    .line 2
    .line 3
    iget-object v1, p0, Ll/u820;->f:Lcom/p1/mobile/android/app/Frag;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/w620;-><init>(Lcom/p1/mobile/android/app/Frag;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/u820;->c:Ll/v1b0;

    .line 9
    .line 10
    new-instance v0, Ll/v620;

    .line 11
    .line 12
    iget-object v1, p0, Ll/u820;->f:Lcom/p1/mobile/android/app/Frag;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/v620;-><init>(Ll/ner;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/u820;->d:Ll/p520;

    .line 18
    .line 19
    iget-object p0, p0, Ll/u820;->c:Ll/v1b0;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final n1()V
    .locals 2

    .line 1
    new-instance v0, Ll/iq40;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/iq40;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/u820;->a:Ll/iq40;

    .line 11
    .line 12
    new-instance v0, Ll/ip40;

    .line 13
    .line 14
    iget-object v1, p0, Ll/u820;->f:Lcom/p1/mobile/android/app/Frag;

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ll/ip40;-><init>(Ll/ner;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/u820;->b:Ll/ip40;

    .line 20
    .line 21
    iget-object v1, p0, Ll/u820;->a:Ll/iq40;

    .line 22
    .line 23
    invoke-virtual {v0, v1, p0}, Ll/ip40;->N0(Ll/xek0;Ll/yek0;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public o1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f920;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ag40;->i()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_navigation_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic q1(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f920;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/f920;->a0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic r1(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f920;

    .line 4
    .line 5
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isIdCardVerified()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    move p1, v1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p1, 0x0

    .line 29
    :goto_0
    invoke-virtual {p0, v1, p1}, Ll/f920;->W(IZ)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic s1(Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f920;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ag40;->k()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic t1(Ljava/util/ArrayList;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 15
    .line 16
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 17
    .line 18
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    invoke-static {}, Ll/tqi;->a()Ll/tqi;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1, v0, v1}, Ll/tqi;->d(J)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/tqi;->a()Ll/tqi;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1, v0, v1}, Ll/tqi;->f(J)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    invoke-static {}, Ll/tqi;->a()Ll/tqi;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ll/tqi;->e()V

    .line 44
    .line 45
    .line 46
    :cond_0
    invoke-static {}, Ll/tqi;->a()Ll/tqi;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const/4 v0, 0x1

    .line 51
    iput-boolean v0, p1, Ll/tqi;->h:Z

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->t7()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final synthetic u1(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/f920;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/f920;->Z(Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/u820;->L1(Lcom/p1/mobile/putong/core/data/AppealInfo;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public v()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u820;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic v1(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f920;

    .line 4
    .line 5
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p1, 0x0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 29
    :goto_1
    const/4 v0, 0x6

    .line 30
    invoke-virtual {p0, v0, p1}, Ll/f920;->W(IZ)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic x1(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f920;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/f920;->U()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic z1(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f920;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/f920;->S()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
