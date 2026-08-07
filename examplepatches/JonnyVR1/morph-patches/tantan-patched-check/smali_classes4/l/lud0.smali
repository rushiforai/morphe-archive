.class public Ll/lud0;
.super Ll/gp60;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/gp60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ljava/util/List;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    const-string v0, "vip"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MembershipType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MembershipType;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {p0, v1}, Ll/hp60;->b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/MembershipType;)D

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MembershipType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MembershipType;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p1, p0}, Ll/hp60;->b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/MembershipType;)D

    .line 16
    .line 17
    .line 18
    move-result-wide p0

    .line 19
    cmpl-double p0, v1, p0

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/data/Counter;Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/LikersLimit;->expiresTime:D

    .line 4
    .line 5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 6
    .line 7
    iget-wide p0, p0, Lcom/p1/mobile/putong/data/LikersLimit;->expiresTime:D

    .line 8
    .line 9
    cmpl-double p0, v0, p0

    .line 10
    .line 11
    if-nez p0, :cond_0

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

.method public static synthetic i(Ljava/util/List;Ljava/util/List;)Ljava/lang/Boolean;
    .locals 5

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x1

    .line 6
    move v1, v0

    .line 7
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_2

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 18
    .line 19
    new-instance v2, Ll/kud0;

    .line 20
    .line 21
    invoke-direct {v2, v1}, Ll/kud0;-><init>(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 31
    .line 32
    iget-wide v3, v1, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

    .line 33
    .line 34
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 35
    .line 36
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

    .line 37
    .line 38
    cmp-long v1, v3, v1

    .line 39
    .line 40
    if-nez v1, :cond_1

    .line 41
    .line 42
    move v1, v0

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const/4 v1, 0x0

    .line 45
    :goto_0
    if-nez v1, :cond_0

    .line 46
    .line 47
    :cond_2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/data/UserPrivilege;Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Counter;Ll/uxj0;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public b()Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/fud0;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/fud0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->distinctUntilChanged(Ll/rcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    new-instance v2, Ll/gud0;

    .line 30
    .line 31
    invoke-direct {v2}, Ll/gud0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v2}, Lrx/c;->distinctUntilChanged(Ll/rcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 45
    .line 46
    invoke-virtual {v2}, Ll/joa;->y3()Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    new-instance v3, Ll/hud0;

    .line 51
    .line 52
    invoke-direct {v3}, Ll/hud0;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2, v3}, Lrx/c;->distinctUntilChanged(Ll/rcj;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v2, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v2, Ll/iud0;

    .line 64
    .line 65
    invoke-direct {v2}, Ll/iud0;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v2, Ll/jud0;

    .line 73
    .line 74
    invoke-direct {v2}, Ll/jud0;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {p0, v1, v0, v2}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0
.end method

.method public c()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gp60;->c()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->s3()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->K5()Lrx/c;

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gp60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/ela;->H3()Lrx/c;

    .line 14
    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/ela;->A3()Lrx/c;

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->h5()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Hg()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 54
    .line 55
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 56
    .line 57
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 58
    .line 59
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 64
    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/dkb;->H9()Lrx/c;

    .line 71
    .line 72
    .line 73
    :cond_2
    invoke-static {}, Ll/s7a;->f()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->c1:Ll/usa;

    .line 82
    .line 83
    invoke-virtual {v0}, Ll/usa;->N3()Lrx/c;

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    iget-object v0, p0, Ll/gp60;->b:Ll/mdf0;

    .line 88
    .line 89
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_4

    .line 94
    .line 95
    iget-object v0, p0, Ll/gp60;->b:Ll/mdf0;

    .line 96
    .line 97
    iget-object v0, v0, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 98
    .line 99
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_4

    .line 104
    .line 105
    iget-object v0, p0, Ll/gp60;->b:Ll/mdf0;

    .line 106
    .line 107
    iget-object v0, v0, Ll/mdf0;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_4

    .line 116
    .line 117
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 118
    .line 119
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->c1:Ll/usa;

    .line 120
    .line 121
    invoke-virtual {v0}, Ll/usa;->N3()Lrx/c;

    .line 122
    .line 123
    .line 124
    :cond_4
    :goto_0
    iget-object p0, p0, Ll/gp60;->b:Ll/mdf0;

    .line 125
    .line 126
    iget-object p0, p0, Ll/mdf0;->d:Lcom/p1/mobile/putong/data/PayMethod;

    .line 127
    .line 128
    const-string v0, "alipay"

    .line 129
    .line 130
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    if-eqz p0, :cond_5

    .line 135
    .line 136
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 137
    .line 138
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->C3()Lrx/c;

    .line 141
    .line 142
    .line 143
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 144
    .line 145
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->B3()V

    .line 148
    .line 149
    .line 150
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 151
    .line 152
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 153
    .line 154
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gp60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ll/gp60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    invoke-static {p0}, Ll/wib0;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method
