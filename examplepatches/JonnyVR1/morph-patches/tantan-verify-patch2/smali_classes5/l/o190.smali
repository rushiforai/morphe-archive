.class public final Ll/o190;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/o190;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/o190;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/o190;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method


# virtual methods
.method public final b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 9
    .line 10
    if-ne p2, p0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeDataForGP(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_1
    return v0
.end method

.method public final c(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/ArrayList;)Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;"
        }
    .end annotation

    .line 1
    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-gez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 10
    .line 11
    if-ne p1, v2, :cond_1

    .line 12
    .line 13
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 14
    .line 15
    if-ne p2, v2, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, p3, v0, p1}, Ll/o190;->d(Ljava/util/ArrayList;ILcom/p1/mobile/putong/core/data/Privilege;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->premium_compliment:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 23
    .line 24
    if-ne p1, v2, :cond_2

    .line 25
    .line 26
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 27
    .line 28
    if-ne p2, v2, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0, p3, v0, p1}, Ll/o190;->d(Ljava/util/ArrayList;ILcom/p1/mobile/putong/core/data/Privilege;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-ge v0, p2, :cond_3

    .line 42
    .line 43
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    check-cast p2, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 48
    .line 49
    invoke-virtual {p0, p2, p1}, Ll/o190;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    return-object p2

    .line 56
    :cond_3
    return-object v1
.end method

.method public final d(Ljava/util/ArrayList;ILcom/p1/mobile/putong/core/data/Privilege;)Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;I",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ")",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;"
        }
    .end annotation

    .line 1
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p2, v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 14
    .line 15
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, v0, p3}, Ll/o190;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o190;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/o190;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/yj90;->b(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/d79;->a0()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, p2, p1}, Ll/o190;->h(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o190;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/o190;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/yj90;->b(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/gnp;->q0()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-virtual {p0, p1, p2, v0}, Ll/o190;->c(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/ArrayList;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-nez v0, :cond_3

    .line 33
    .line 34
    invoke-static {}, Ll/d79;->a0()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    invoke-virtual {p0, p2, p1}, Ll/o190;->h(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_3
    new-instance p2, Ll/j0p;

    .line 46
    .line 47
    invoke-direct {p2}, Ll/j0p;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v0, p2}, Ll/ge90;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/xib0;)I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-ltz p2, :cond_6

    .line 55
    .line 56
    iget-object v1, p0, Ll/o190;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 57
    .line 58
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;->S4(I)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ll/d79;->a0()Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-nez p2, :cond_4

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    iget-object p2, p0, Ll/o190;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 69
    .line 70
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    if-eqz p2, :cond_5

    .line 75
    .line 76
    new-instance v1, Ll/n190;

    .line 77
    .line 78
    invoke-direct {v1, p0, v0, p1}, Ll/n190;-><init>(Ll/o190;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 79
    .line 80
    .line 81
    const-wide/16 p0, 0x12c

    .line 82
    .line 83
    invoke-virtual {p2, v1, p0, p1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_5
    invoke-virtual {p0, v0, p1}, Ll/o190;->h(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 88
    .line 89
    .line 90
    :cond_6
    :goto_0
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/o190;->h(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/o190;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->premium_compliment:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 13
    .line 14
    if-ne p2, v0, :cond_1

    .line 15
    .line 16
    const-string v0, "p_privileges_view,e_whisper_unlock_btn_click,click"

    .line 17
    .line 18
    :goto_0
    move-object v2, v0

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    const-string v0, "p_privileges_view,e_ttc_subcription_privilege_description,click"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :goto_1
    invoke-static {p1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iget-object p0, p0, Ll/o190;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0, v2, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    invoke-static {p1}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    iget-object p0, p0, Ll/o190;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const/4 v4, 0x0

    .line 52
    const/4 v5, 0x0

    .line 53
    const/4 v3, 0x0

    .line 54
    move-object v6, p2

    .line 55
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->L0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_3
    move-object v6, p2

    .line 60
    invoke-static {p1}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    if-eqz p2, :cond_4

    .line 65
    .line 66
    iget-object p0, p0, Ll/o190;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const/4 p1, 0x0

    .line 73
    invoke-static {p0, v2, v6, p1, p1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->K1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_4
    invoke-static {p1}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_5

    .line 82
    .line 83
    iget-object p0, p0, Ll/o190;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->A1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_5
    :goto_2
    return-void
.end method
