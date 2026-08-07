.class public final Ll/bpc0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

.field public static b:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

.field public static c:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

.field public static d:Lcom/p1/mobile/putong/core/data/RecentContractInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic a(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bpc0;->l(Ljava/util/List;)V

    return-void
.end method

.method public static b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/bpc0;->a:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 3
    .line 4
    sput-object v0, Ll/bpc0;->b:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 5
    .line 6
    sput-object v0, Ll/bpc0;->c:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 7
    .line 8
    sput-object v0, Ll/bpc0;->d:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 9
    .line 10
    return-void
.end method

.method public static c()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/RecentContractInfosEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->a2:Ll/kva;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/kva;->c3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/bpc0$a;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/bpc0$a;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    return-object v0
.end method

.method public static d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/data/RecentContractInfo;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    if-ne p0, v1, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/bpc0;->i()Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 15
    .line 16
    if-ne p0, v1, :cond_2

    .line 17
    .line 18
    invoke-static {}, Ll/bpc0;->f()Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 24
    .line 25
    if-ne p0, v1, :cond_3

    .line 26
    .line 27
    invoke-static {}, Ll/bpc0;->e()Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 33
    .line 34
    if-ne p0, v1, :cond_4

    .line 35
    .line 36
    invoke-static {}, Ll/bpc0;->g()Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_4
    return-object v0
.end method

.method public static e()Lcom/p1/mobile/putong/core/data/RecentContractInfo;
    .locals 1

    .line 1
    sget-object v0, Ll/bpc0;->c:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static f()Lcom/p1/mobile/putong/core/data/RecentContractInfo;
    .locals 1

    .line 1
    sget-object v0, Ll/bpc0;->b:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static g()Lcom/p1/mobile/putong/core/data/RecentContractInfo;
    .locals 1

    .line 1
    sget-object v0, Ll/bpc0;->d:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static h(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    invoke-static {p0}, Ll/bpc0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_4

    .line 11
    .line 12
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->isUpgraded:Z

    .line 13
    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_4

    .line 24
    .line 25
    const-string v1, "vip"

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    const-string p0, "vipUpgradeToPremium"

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_2
    const-string v1, "seeWhoLikedMe"

    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    const-string p0, "seeUpgradeToPremium"

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_3
    const-string v1, "svip"

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    const-string p0, "premiumUpgradeToUltra"

    .line 62
    .line 63
    return-object p0

    .line 64
    :cond_4
    :goto_0
    return-object v0
.end method

.method public static i()Lcom/p1/mobile/putong/core/data/RecentContractInfo;
    .locals 1

    .line 1
    sget-object v0, Ll/bpc0;->a:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z
    .locals 3

    const/4 v0, 0x1

    return v0

    .line 1
    invoke-static {p0}, Ll/bpc0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const-string v1, "googleplay"

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->platform:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    return v0

    .line 20
    :cond_1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->autoRenew:Z

    .line 21
    .line 22
    xor-int/lit8 p0, p0, 0x1

    .line 23
    .line 24
    return p0
.end method

.method public static k(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bpc0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->isUpgraded:Z

    .line 10
    .line 11
    return p0
.end method

.method public static l(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/RecentContractInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_6

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    sput-object v0, Ll/bpc0;->a:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 13
    .line 14
    sput-object v0, Ll/bpc0;->b:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 15
    .line 16
    sput-object v0, Ll/bpc0;->c:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 17
    .line 18
    sput-object v0, Ll/bpc0;->d:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_6

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    const-string v1, "vip"

    .line 47
    .line 48
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    sget-object v1, Ll/bpc0;->a:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 57
    .line 58
    if-nez v1, :cond_1

    .line 59
    .line 60
    sput-object v0, Ll/bpc0;->a:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    const-string v1, "seeWhoLikedMe"

    .line 64
    .line 65
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_3

    .line 72
    .line 73
    sget-object v1, Ll/bpc0;->b:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 74
    .line 75
    if-nez v1, :cond_1

    .line 76
    .line 77
    sput-object v0, Ll/bpc0;->b:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    const-string v1, "svip"

    .line 81
    .line 82
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_4

    .line 89
    .line 90
    sget-object v1, Ll/bpc0;->c:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 91
    .line 92
    if-nez v1, :cond_1

    .line 93
    .line 94
    sput-object v0, Ll/bpc0;->c:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_4
    const-string v1, "tttUltraPremium"

    .line 98
    .line 99
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-nez v1, :cond_5

    .line 106
    .line 107
    const-string v1, "ultraPremium"

    .line 108
    .line 109
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-eqz v1, :cond_1

    .line 116
    .line 117
    :cond_5
    sget-object v1, Ll/bpc0;->d:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 118
    .line 119
    if-nez v1, :cond_1

    .line 120
    .line 121
    sput-object v0, Ll/bpc0;->d:Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_6
    :goto_1
    return-void
.end method
