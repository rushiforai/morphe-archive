.class final enum Lcom/p1/mobile/putong/core/data/PurchaseType$2;
.super Lcom/p1/mobile/putong/core/data/PurchaseType;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/PurchaseType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4011
    name = null
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;-><init>(Ljava/lang/String;ILl/vib0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILl/vib0;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/PurchaseType$2;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Gender;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->h5()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Pc()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 30
    .line 31
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 32
    .line 33
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 34
    .line 35
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 36
    .line 37
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 38
    .line 39
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 40
    .line 41
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->recover_unmatches:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 42
    .line 43
    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 44
    .line 45
    filled-new-array/range {v0 .. v7}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 55
    .line 56
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 57
    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 59
    .line 60
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 61
    .line 62
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 63
    .line 64
    filled-new-array {p0, p1, v0, v1, v2}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    goto :goto_0

    .line 73
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 74
    .line 75
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 76
    .line 77
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 78
    .line 79
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 80
    .line 81
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 82
    .line 83
    filled-new-array {p0, p1, v0, v1, v2}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    :goto_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->t9()Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_2

    .line 104
    .line 105
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    :cond_2
    return-object p0
.end method

.method public getPrivilegeDataForGP(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Gender;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Df(Lcom/p1/mobile/putong/data/User;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 26
    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 28
    .line 29
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_active_time_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 30
    .line 31
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_remark_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 32
    .line 33
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_search_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 34
    .line 35
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 36
    .line 37
    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 38
    .line 39
    sget-object v8, Lcom/p1/mobile/putong/core/data/Privilege;->vip_message_block_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 40
    .line 41
    filled-new-array/range {v0 .. v8}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 51
    .line 52
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 53
    .line 54
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 55
    .line 56
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_active_time_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 57
    .line 58
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_remark_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 59
    .line 60
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_search_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 61
    .line 62
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 63
    .line 64
    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 65
    .line 66
    filled-new-array/range {v0 .. v7}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_1

    .line 79
    .line 80
    const/4 p1, 0x4

    .line 81
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->intl_no_ad:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 82
    .line 83
    invoke-virtual {p0, p1, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oi()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_2

    .line 99
    .line 100
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    :cond_2
    return-object p0
.end method

.method public productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;
    .locals 0

    .line 1
    const-string p0, "tttVip"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
