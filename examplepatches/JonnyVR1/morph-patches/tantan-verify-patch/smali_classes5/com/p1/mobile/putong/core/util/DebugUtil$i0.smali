.class public Lcom/p1/mobile/putong/core/util/DebugUtil$i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->wj(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 3

    .line 1
    new-instance v0, Ll/hso;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Ll/hso;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->iap()Ll/bbm;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/bbm;->i()Lcom/android/billingclient/api/a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    :goto_0
    invoke-static {v1, p0}, Ll/aso;->h(Lcom/p1/mobile/android/app/Act;Lcom/android/billingclient/api/a;)Ll/aso;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const/4 v1, 0x0

    .line 41
    const-string v2, "test_high_vip_upgrade_to_premium_1mo"

    .line 42
    .line 43
    invoke-virtual {v0, p0, v1, v2}, Ll/hso;->p(Ll/aso;ZLjava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    new-instance v0, Ll/bmp$f;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/bmp$f;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "p_knowmyself_purchase,e_knowmyself_test,click"

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/bmp$f;->c(Ljava/lang/String;)Ll/bmp$f;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/bmp$f;->f(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/bmp$f;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p0, v0}, Ll/bmp$f;->d(Z)Ll/bmp$f;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/bmp$f;->g()Ll/bmp;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    new-instance v0, Ll/bmp$f;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/bmp$f;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "p_knowmyself_purchase,e_knowmyself_test,click"

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/bmp$f;->c(Ljava/lang/String;)Ll/bmp$f;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/bmp$f;->f(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/bmp$f;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/bmp$f;->g()Ll/bmp;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    new-instance v0, Ll/bmp$f;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/bmp$f;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "p_knowmyself_purchase,e_knowmyself_test,click"

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/bmp$f;->c(Ljava/lang/String;)Ll/bmp$f;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/bmp$f;->f(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/bmp$f;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/bmp$f;->g()Ll/bmp;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1

    .line 1
    new-instance v0, Ll/bmp$f;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ll/bmp$f;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "p_knowmyself_purchase,e_knowmyself_test,click"

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/bmp$f;->c(Ljava/lang/String;)Ll/bmp$f;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/bmp$f;->f(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/bmp$f;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p0, v0}, Ll/bmp$f;->d(Z)Ll/bmp$f;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/bmp$f;->g()Ll/bmp;

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i0;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 9
    .line 10
    new-instance v2, Ll/odd;

    .line 11
    .line 12
    invoke-direct {v2, v1}, Ll/odd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 13
    .line 14
    .line 15
    const-string v1, "\u652f\u4ed8 vip \u5347\u7ea7 svip"

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i0;->a:Ljava/util/ArrayList;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 27
    .line 28
    new-instance v2, Ll/pdd;

    .line 29
    .line 30
    invoke-direct {v2, v1}, Ll/pdd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 31
    .line 32
    .line 33
    const-string v1, "svip \u5347\u7ea7\u8d2d\u4e70\u65f6\u957f\u9009\u62e9\u5f39\u7a97"

    .line 34
    .line 35
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i0;->a:Ljava/util/ArrayList;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 45
    .line 46
    new-instance v2, Ll/qdd;

    .line 47
    .line 48
    invoke-direct {v2, v1}, Ll/qdd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 49
    .line 50
    .line 51
    const-string v1, "svip \u8ba2\u9605\u9875\u5347\u7ea7\u8d2d\u4e70\u65f6\u957f\u9009\u62e9\u5f39\u7a97"

    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i0;->a:Ljava/util/ArrayList;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 63
    .line 64
    new-instance v2, Ll/rdd;

    .line 65
    .line 66
    invoke-direct {v2, v1}, Ll/rdd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 67
    .line 68
    .line 69
    const-string v1, "ultra \u5347\u7ea7\u8d2d\u4e70\u65f6\u957f\u9009\u62e9\u5f39\u7a97"

    .line 70
    .line 71
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i0;->a:Ljava/util/ArrayList;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 81
    .line 82
    new-instance v2, Ll/sdd;

    .line 83
    .line 84
    invoke-direct {v2, v1}, Ll/sdd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 85
    .line 86
    .line 87
    const-string v1, "ultra \u8ba2\u9605\u9875\u5347\u7ea7\u8d2d\u4e70\u65f6\u957f\u9009\u62e9\u5f39\u7a97"

    .line 88
    .line 89
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$i0;->a:Ljava/util/ArrayList;

    .line 103
    .line 104
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method
