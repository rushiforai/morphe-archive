.class public Lcom/p1/mobile/putong/core/pay/module/CorePayServiceImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "CorePayInnerService"
    path = "/pay_service/service"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic F(Ll/lib0;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 8

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v4

    .line 5
    invoke-virtual {p0}, Ll/lib0;->e()Lorg/json/JSONObject;

    .line 6
    .line 7
    .line 8
    move-result-object v5

    .line 9
    const/4 v7, 0x0

    .line 10
    const/4 v3, 0x0

    .line 11
    move-object v0, p0

    .line 12
    move-object v1, p1

    .line 13
    move-object v2, p2

    .line 14
    move-object v6, p4

    .line 15
    invoke-virtual/range {v0 .. v7}, Ll/lib0;->r(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;ZZLorg/json/JSONObject;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic H(Ll/lib0;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;)V
    .locals 8

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v4

    .line 5
    invoke-virtual {p0}, Ll/lib0;->e()Lorg/json/JSONObject;

    .line 6
    .line 7
    .line 8
    move-result-object v5

    .line 9
    const/4 v7, 0x1

    .line 10
    const/4 v3, 0x0

    .line 11
    move-object v0, p0

    .line 12
    move-object v1, p1

    .line 13
    move-object v2, p2

    .line 14
    move-object v6, p4

    .line 15
    invoke-virtual/range {v0 .. v7}, Ll/lib0;->r(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;ZZLorg/json/JSONObject;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 16
    .line 17
    .line 18
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-interface {p5}, Ll/x20;->call()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method


# virtual methods
.method public A6(Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Wh()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/16 p0, 0x1b

    .line 20
    .line 21
    return p0

    .line 22
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->tj()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    const/16 p0, 0x1c

    .line 41
    .line 42
    return p0

    .line 43
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->ra()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_2

    .line 60
    .line 61
    const/16 p0, 0x1d

    .line 62
    .line 63
    return p0

    .line 64
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Zq()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-eqz p0, :cond_3

    .line 81
    .line 82
    const/16 p0, 0x1e

    .line 83
    .line 84
    return p0

    .line 85
    :cond_3
    const/4 p0, 0x0

    .line 86
    return p0
.end method

.method public Ag()J
    .locals 2

    .line 1
    invoke-static {}, Ll/br60;->m()Ll/br60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/br60;->p()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public Am(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Ll/a5i0;->t1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Bk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/purchase/c;->d1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Bl(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/gul0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Cd(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/du80;->g()Ll/du80;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/du80;->e(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public Cg(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static/range {p1 .. p7}, Ll/p6b0;->T0(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Ci(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/br60;->m()Ll/br60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual/range {p0 .. p9}, Ll/br60;->E(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;Ll/y20;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Cl()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->I1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Cp(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p3}, Ll/tab0;->x(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p3, Ll/bo60;

    .line 10
    .line 11
    invoke-direct {p3, p1, p2}, Ll/bo60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3, p4}, Ll/bo60;->r(Lcom/p1/mobile/putong/data/PayMethod;)Ll/bo60;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1, p0}, Ll/bo60;->t(Ljava/util/List;)Ll/bo60;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, p5}, Ll/bo60;->q(Ll/y20;)Ll/bo60;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/bo60;->s()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public D7(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/br60;->m()Ll/br60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/br60;->v(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public D9()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Dq()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/j690;->y()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Ds(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    move-object v0, p1

    .line 4
    move-object v1, p2

    .line 5
    move-object v2, p3

    .line 6
    move-object v3, p4

    .line 7
    move-object v6, p5

    .line 8
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->o0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public Ed()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Fd()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/dk90;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Fh()I
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->m0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Fn(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    new-instance p0, Ll/maf0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/maf0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/maf0;->b()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Fs()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/dk90;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Gs(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ljava/util/List;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/bo60;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Ll/bo60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p3}, Ll/bo60;->r(Lcom/p1/mobile/putong/data/PayMethod;)Ll/bo60;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p5}, Ll/bo60;->t(Ljava/util/List;)Ll/bo60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p6}, Ll/bo60;->q(Ll/y20;)Ll/bo60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {}, Ll/br60;->m()Ll/br60;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1, p4}, Ll/br60;->v(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    xor-int/lit8 p1, p1, 0x1

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/bo60;->n(Z)Ll/bo60;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/bo60;->s()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public Hm(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public I8(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/a5i0;->M1(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Jf(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/br60;->m()Ll/br60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/br60;->n(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public Kd(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/a30;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/o8n;->A(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/a30;Ll/x20;)Ll/o8n;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Ki()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Ko()V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/a5i0;->V0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Le(Lcom/p1/mobile/putong/core/data/Merchandise;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/v5b0;->y(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Of(Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/br60;->m()Ll/br60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/br60;->u(Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public Og(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ll/x20;",
            "Ll/x20;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static/range {p1 .. p6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->a0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public On()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/fp60;->E()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Pc()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Pk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Ll/a5i0;->v1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Pr(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/gul0;->h(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Qk()I
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->X()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Qs(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static/range {p1 .. p7}, Lcom/p1/mobile/putong/core/ui/purchase/c;->R0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public S7(Z)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/du80;->g()Ll/du80;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/du80;->d(Z)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public S9()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->G()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Sb(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;ZZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance p0, Ll/beb0;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;->none:Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;

    .line 6
    .line 7
    invoke-direct {p0, v0, v1, p5}, Ll/beb0;-><init>(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p6}, Ll/lib0;->p(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/lib0;->w(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;ZZ)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/lib0;->n()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public Sj()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/s7a;->p()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public To(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;Ll/y20;)V
    .locals 1
    .param p8    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "ZZ",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/wn60;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, p3, v0}, Ll/wn60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/pzi0;->o()J

    .line 25
    .line 26
    .line 27
    move-result-wide p2

    .line 28
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {p1}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Ll/wn60;->C(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    invoke-virtual {p0, p7}, Ll/wn60;->r(Ljava/lang/String;)Ll/wn60;

    .line 49
    .line 50
    .line 51
    :cond_0
    if-eqz p4, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0, p5, p6, p8}, Ll/wn60;->I(ZLjava/lang/String;Ll/y20;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    invoke-virtual {p0, p6, p5, p8}, Ll/wn60;->o(Ljava/lang/String;ZLl/y20;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public Uk(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/br60;->m()Ll/br60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, v0}, Ll/br60;->t(Ljava/lang/String;Z)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public Va()V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/a5i0;->Q()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Wa()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/s7a;->z()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Wi()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/a5i0;->h1()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public Xa()I
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->W()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Xe()V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/a5i0;->X0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Y4()I
    .locals 0

    .line 1
    invoke-static {}, Ll/rbb0;->l()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ya()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/a5i0;->u()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public Yi()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/rbb0;->k()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Yl()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/a5i0;->c1()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public Z7(Lcom/p1/mobile/putong/core/data/Coupon;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/g2f;->d(Lcom/p1/mobile/putong/core/data/Coupon;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Zn(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinAct;

    .line 2
    .line 3
    return p0
.end method

.method public Zs(Lcom/p1/mobile/putong/core/data/Merchandise;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/v5b0;->w(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public ae(Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/v5b0;->j(Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public at()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->y()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b8()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public bf(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bg()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public cf()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public d4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public d6(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/mib0;->k(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d9()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public dh()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/s7a;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public e2()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/rbb0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public e8(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static/range {p1 .. p7}, Lcom/p1/mobile/putong/core/ui/purchase/c;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public ej(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/j690;->o(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public fj(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/br60;->m()Ll/br60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/br60;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public fk(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/v5b0;->f(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public gr()V
    .locals 0

    .line 1
    invoke-static {}, Ll/br60;->m()Ll/br60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/br60;->A()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public je(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Ll/bn60;->l(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public kr()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public lf(J)V
    .locals 0

    .line 1
    invoke-static {}, Ll/br60;->m()Ll/br60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/br60;->G(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public na(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    new-instance p0, Ll/fe5$e;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/fe5$e;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_TTT_COIN:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    invoke-static {p1}, Ll/wci0;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/fe5$e;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/fe5$e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p2}, Ll/fe5$e;->d(Ljava/lang/String;)Ll/fe5$e;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-virtual {p0, p1}, Ll/fe5$e;->c(I)Ll/fe5$e;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/fe5$e;->l()Ll/fe5;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public nb()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/a5i0;->f1()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public ng(Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/br60;->m()Ll/br60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/br60;->H(Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public ok(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/l4g0;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/a5i0;->N1(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/l4g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public om(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/br60;->m()Ll/br60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/br60;->r(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public ot(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/a5i0;->s1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public pj(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;)Z
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/v5b0;->v(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public pk(Lcom/p1/mobile/putong/core/data/Coupon;)Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ")",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/g2f;->c(Lcom/p1/mobile/putong/core/data/Coupon;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public sb(Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a5i0;->J0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public sm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILl/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "I",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/a5i0;->n1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILl/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public td(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 2

    .line 1
    move-object p0, p7

    .line 2
    move-object p7, p5

    .line 3
    move-object p5, p3

    .line 4
    new-instance p3, Ll/beb0;

    .line 5
    .line 6
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;->none:Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;

    .line 9
    .line 10
    invoke-direct {p3, v0, v1, p0}, Ll/beb0;-><init>(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p3, p6}, Ll/lib0;->p(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 17
    .line 18
    invoke-virtual {p3, p0}, Ll/lib0;->o(Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p3, p8}, Ll/lib0;->q(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p3}, Ll/lib0;->e()Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    move-object p6, p4

    .line 29
    move-object p4, p2

    .line 30
    new-instance p2, Ll/v7a;

    .line 31
    .line 32
    move-object p8, p9

    .line 33
    invoke-direct/range {p2 .. p8}, Ll/v7a;-><init>(Ll/lib0;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;)V

    .line 34
    .line 35
    .line 36
    move-object p8, p2

    .line 37
    new-instance p2, Ll/w7a;

    .line 38
    .line 39
    invoke-direct/range {p2 .. p7}, Ll/w7a;-><init>(Ll/lib0;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, p0, p8, p2}, Ll/pta;->C(Lcom/p1/mobile/android/app/Act;Lorg/json/JSONObject;Ll/x20;Ll/x20;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public to()V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/a5i0;->S0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public v9()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/s7a;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public vt(J)Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/br60;->m()Ll/br60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/br60;->l(J)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public wg()Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/g2f;->a()Ll/g2f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/g2f;->b()Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public wm(Lcom/p1/mobile/android/app/Act;Ll/y20;Ljava/util/List;Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4, p6}, Ll/ou80;->h0(Lcom/p1/mobile/android/app/Act;Ll/y20;Ljava/util/List;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public wn(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/gul0;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public x7(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static/range {p1 .. p7}, Lcom/p1/mobile/putong/core/ui/purchase/c;->d0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public xj()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/s7a;->m()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public xn()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/s7a;->s()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public ya(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static/range {p1 .. p7}, Lcom/p1/mobile/putong/core/ui/purchase/c;->W(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public yc()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/s7a;->k()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public zl()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->I()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public zr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p2, p0, p0, p0}, Ll/kyo;->l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
