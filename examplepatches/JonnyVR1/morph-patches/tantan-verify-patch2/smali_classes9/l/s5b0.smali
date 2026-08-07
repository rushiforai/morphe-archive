.class public Ll/s5b0;
.super Ll/g1e;
.source "SourceFile"


# instance fields
.field public A:Landroid/widget/LinearLayout;

.field public B:Lv/VText;

.field public C:Lv/VText;

.field public D:Lcom/p1/mobile/android/app/Act;

.field public E:Ll/x20;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public F:Ljava/lang/String;

.field public G:Ll/l4g0;

.field public H:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public I:Lcom/p1/mobile/putong/core/data/Coupon;

.field public J:Lcom/p1/mobile/putong/data/PayMethod;

.field public K:Ljava/text/DecimalFormat;

.field public L:D

.field public M:D

.field public N:Ll/lib0;

.field public j:Lv/VImage;

.field public k:Landroidx/constraintlayout/widget/Guideline;

.field public l:Lv/VImage;

.field public m:Landroidx/constraintlayout/widget/Guideline;

.field public n:Lv/VImage;

.field public o:Lv/VImage;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VText;

.field public s:Lv/VText;

.field public t:Landroid/widget/LinearLayout;

.field public u:Lv/VImage;

.field public v:Lv/VText;

.field public w:Landroid/widget/RelativeLayout;

.field public x:Landroid/widget/TextView;

.field public y:Lv/VText;

.field public z:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;)V
    .locals 2
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
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    sget v1, Ll/dgc0;->b:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ljava/text/DecimalFormat;

    .line 8
    .line 9
    const-string v1, "#.#"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/s5b0;->K:Ljava/text/DecimalFormat;

    .line 15
    .line 16
    iput-object p1, p0, Ll/s5b0;->D:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    new-instance p1, Ll/k5b0;

    .line 19
    .line 20
    invoke-direct {p1, p0, p2}, Ll/k5b0;-><init>(Ll/s5b0;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/s5b0;->E:Ll/x20;

    .line 24
    .line 25
    iput-object p3, p0, Ll/s5b0;->H:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 26
    .line 27
    iput-object p4, p0, Ll/s5b0;->I:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 28
    .line 29
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 32
    .line 33
    iget-wide p1, p1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 34
    .line 35
    iput-wide p1, p0, Ll/s5b0;->M:D

    .line 36
    .line 37
    iget-object p1, p4, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->giftBenefit:Lcom/p1/mobile/putong/core/data/GiftBenefit;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftBenefit;->discount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 44
    .line 45
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Discount;->value:I

    .line 46
    .line 47
    int-to-double p1, p1

    .line 48
    const-wide/high16 p3, 0x4059000000000000L    # 100.0

    .line 49
    .line 50
    div-double/2addr p1, p3

    .line 51
    iput-wide p1, p0, Ll/s5b0;->L:D

    .line 52
    .line 53
    iput-object p5, p0, Ll/s5b0;->F:Ljava/lang/String;

    .line 54
    .line 55
    return-void
.end method

.method public static synthetic E(Ll/s5b0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/s5b0;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/s5b0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/s5b0;->V(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic G(Ll/s5b0;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/s5b0;->U(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic H(Ll/s5b0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s5b0;->b0(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic I(Ll/s5b0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/s5b0;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Ll/s5b0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s5b0;->c0()V

    return-void
.end method

.method public static synthetic K(Ll/s5b0;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/s5b0;->Z(Ll/y20;)V

    return-void
.end method

.method public static synthetic L(Ll/s5b0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/s5b0;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M(Ll/s5b0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/s5b0;->d0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic N(Ll/s5b0;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s5b0;->a0(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private T()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s5b0;->u:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/s5b0;->o:Lv/VImage;

    .line 8
    .line 9
    invoke-static {}, Ll/bnl0;->F0()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    sget v2, Ll/qa00;->g:I

    .line 14
    .line 15
    add-int/2addr v1, v2

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/l5b0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/l5b0;-><init>(Ll/s5b0;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/g1e;->x()V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/m5b0;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/m5b0;-><init>(Ll/s5b0;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/s5b0;->o:Lv/VImage;

    .line 39
    .line 40
    new-instance v1, Ll/n5b0;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/n5b0;-><init>(Ll/s5b0;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/s5b0;->A:Landroid/widget/LinearLayout;

    .line 49
    .line 50
    new-instance v1, Ll/o5b0;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/o5b0;-><init>(Ll/s5b0;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/s5b0;->u:Lv/VImage;

    .line 59
    .line 60
    new-instance v1, Ll/p5b0;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/p5b0;-><init>(Ll/s5b0;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 66
    .line 67
    .line 68
    invoke-direct {p0}, Ll/s5b0;->f0()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ll/s5b0;->R()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/s5b0;->S()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/s5b0;->Q()V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method private synthetic V(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s5b0;->G:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s5b0;->E:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic X(Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object p1, p0, Ll/s5b0;->N:Ll/lib0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/s5b0;->H:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 4
    .line 5
    iget-object v1, p0, Ll/s5b0;->J:Lcom/p1/mobile/putong/data/PayMethod;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x1

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->n3()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iget-object v2, p0, Ll/s5b0;->J:Lcom/p1/mobile/putong/data/PayMethod;

    .line 33
    .line 34
    const-string v4, "alipay"

    .line 35
    .line 36
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    move v2, v3

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/4 v2, 0x0

    .line 45
    :goto_0
    invoke-virtual {p1, v0, v1, v3, v2}, Ll/lib0;->w(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;ZZ)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/s5b0;->I:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 49
    .line 50
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 51
    .line 52
    invoke-static {}, Ll/pzi0;->o()J

    .line 53
    .line 54
    .line 55
    move-result-wide v2

    .line 56
    long-to-double v2, v2

    .line 57
    sub-double/2addr v0, v2

    .line 58
    const-wide/16 v2, 0x0

    .line 59
    .line 60
    cmpg-double p1, v0, v2

    .line 61
    .line 62
    if-gtz p1, :cond_1

    .line 63
    .line 64
    const-string p1, "\u4f18\u60e0\u5238\u5df2\u5931\u6548"

    .line 65
    .line 66
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sget-object p1, Ll/lib0;->Companion:Ll/lib0$a;

    .line 70
    .line 71
    iget-object v0, p0, Ll/s5b0;->N:Ll/lib0;

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/lib0;->n()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget-object p0, p0, Ll/s5b0;->H:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 82
    .line 83
    const-string v1, "coupon expired"

    .line 84
    .line 85
    invoke-virtual {p1, v0, p0, v1}, Ll/lib0$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    invoke-direct {p0}, Ll/s5b0;->e0()V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method private synthetic Y(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s5b0;->u:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic Z(Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s5b0;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method private synthetic d0(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s5b0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e0()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->j3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/xl60;->k()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 22
    .line 23
    iget-object v1, p0, Ll/s5b0;->N:Ll/lib0;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/lib0;->n()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object p0, p0, Ll/s5b0;->H:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 34
    .line 35
    const-string v2, "alipay not install"

    .line 36
    .line 37
    invoke-virtual {v0, v1, p0, v2}, Ll/lib0$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-object v0, p0, Ll/s5b0;->u:Lv/VImage;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/view/View;->isSelected()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Ll/s5b0;->D:Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    iget-object v1, p0, Ll/s5b0;->N:Ll/lib0;

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/lib0;->e()Lorg/json/JSONObject;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Ll/q5b0;

    .line 58
    .line 59
    invoke-direct {v2, p0}, Ll/q5b0;-><init>(Ll/s5b0;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, v1, v2}, Ll/pta;->B(Lcom/p1/mobile/android/app/Act;Lorg/json/JSONObject;Ll/x20;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    new-instance v0, Ll/wn60;

    .line 67
    .line 68
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 69
    .line 70
    iget-object v2, p0, Ll/s5b0;->D:Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    const-string v3, ""

    .line 73
    .line 74
    invoke-direct {v0, v1, v2, v3, v3}, Ll/wn60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Ll/s5b0;->N:Ll/lib0;

    .line 78
    .line 79
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    iget-object v1, p0, Ll/s5b0;->N:Ll/lib0;

    .line 86
    .line 87
    invoke-virtual {v1}, Ll/lib0;->n()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v1}, Ll/wn60;->C(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_2
    iget-object v1, p0, Ll/s5b0;->I:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 95
    .line 96
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ll/wn60;->r(Ljava/lang/String;)Ll/wn60;

    .line 99
    .line 100
    .line 101
    iget-object v1, p0, Ll/s5b0;->H:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_3

    .line 108
    .line 109
    iget-object v1, p0, Ll/s5b0;->H:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 110
    .line 111
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 112
    .line 113
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 114
    .line 115
    new-instance v2, Ll/r5b0;

    .line 116
    .line 117
    invoke-direct {v2, p0}, Ll/r5b0;-><init>(Ll/s5b0;)V

    .line 118
    .line 119
    .line 120
    const/4 p0, 0x0

    .line 121
    invoke-virtual {v0, p0, v1, v2}, Ll/wn60;->I(ZLjava/lang/String;Ll/y20;)V

    .line 122
    .line 123
    .line 124
    :cond_3
    return-void
.end method

.method private f0()V
    .locals 8

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Ll/s5b0;->I:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 6
    .line 7
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 8
    .line 9
    long-to-double v0, v0

    .line 10
    sub-double/2addr v2, v0

    .line 11
    double-to-long v0, v2

    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    cmp-long v2, v0, v2

    .line 15
    .line 16
    const-string v3, "\u4f18\u60e0 %s \u540e\u5230\u671f"

    .line 17
    .line 18
    if-gtz v2, :cond_0

    .line 19
    .line 20
    const-string v0, "00:00:00"

    .line 21
    .line 22
    invoke-virtual {p0, v3, v0}, Ll/s5b0;->P(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p0, p0, Ll/s5b0;->C:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const-wide/32 v4, 0x5265c00

    .line 33
    .line 34
    .line 35
    cmp-long v2, v0, v4

    .line 36
    .line 37
    if-lez v2, :cond_1

    .line 38
    .line 39
    div-long/2addr v0, v4

    .line 40
    long-to-int v0, v0

    .line 41
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 42
    .line 43
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v2, "%d\u5929"

    .line 52
    .line 53
    invoke-static {v1, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v3, v0}, Ll/s5b0;->P(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object p0, p0, Ll/s5b0;->C:Lv/VText;

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    const-wide/32 v4, 0x36ee80

    .line 68
    .line 69
    .line 70
    div-long v6, v0, v4

    .line 71
    .line 72
    long-to-int v2, v6

    .line 73
    rem-long v4, v0, v4

    .line 74
    .line 75
    const-wide/32 v6, 0xea60

    .line 76
    .line 77
    .line 78
    div-long/2addr v4, v6

    .line 79
    long-to-int v4, v4

    .line 80
    rem-long/2addr v0, v6

    .line 81
    long-to-int v0, v0

    .line 82
    div-int/lit16 v0, v0, 0x3e8

    .line 83
    .line 84
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 85
    .line 86
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    filled-new-array {v2, v4, v0}, [Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    const-string v2, "%02d:%02d:%02d"

    .line 103
    .line 104
    invoke-static {v1, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p0, v3, v0}, Ll/s5b0;->P(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget-object p0, p0, Ll/s5b0;->C:Lv/VText;

    .line 113
    .line 114
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method private h0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0x4000000

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/high16 v1, -0x80000000

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/16 v0, 0x500

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static i0(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->P1:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->C(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string v0, "giftDurationSVIP"

    .line 14
    .line 15
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->getCouponForPromotion(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Coupon;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    new-instance v1, Ll/s5b0;

    .line 20
    .line 21
    move-object v2, p0

    .line 22
    move-object v3, p1

    .line 23
    move-object v4, p2

    .line 24
    move-object v6, p3

    .line 25
    invoke-direct/range {v1 .. v6}, Ll/s5b0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ll/s5b0;->show()V

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public O(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/t5b0;->b(Ll/s5b0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final P(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 5

    .line 1
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Lv/text/CustomTypefaceSpan;

    .line 19
    .line 20
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 21
    .line 22
    const-string v2, "#FFFAE9"

    .line 23
    .line 24
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const/16 v3, 0x12

    .line 29
    .line 30
    invoke-static {v3}, Ll/qa00;->f(I)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    const-string v4, "sans-serif"

    .line 35
    .line 36
    invoke-direct {p0, v4, v1, v2, v3}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    add-int/2addr p2, p1

    .line 44
    const/16 v1, 0x21

    .line 45
    .line 46
    invoke-virtual {v0, p0, p1, p2, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 47
    .line 48
    .line 49
    return-object v0
.end method

.method public final Q()V
    .locals 4

    .line 1
    const-string v0, "alipay"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/s5b0;->J:Lcom/p1/mobile/putong/data/PayMethod;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->n3()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Ll/s5b0;->B:Lv/VText;

    .line 34
    .line 35
    iget-object v1, p0, Ll/s5b0;->K:Ljava/text/DecimalFormat;

    .line 36
    .line 37
    iget-wide v2, p0, Ll/s5b0;->L:D

    .line 38
    .line 39
    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "\u786e\u8ba4\u534f\u8bae\u514d\u5bc6\u4ed8\u00a5%s"

    .line 48
    .line 49
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    iget-object v0, p0, Ll/s5b0;->B:Lv/VText;

    .line 58
    .line 59
    iget-object v1, p0, Ll/s5b0;->K:Ljava/text/DecimalFormat;

    .line 60
    .line 61
    iget-wide v2, p0, Ll/s5b0;->L:D

    .line 62
    .line 63
    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    const-string v2, "\u786e\u8ba4\u534f\u8bae\u5e76\u652f\u4ed8\u00a5%s"

    .line 72
    .line 73
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    :goto_0
    invoke-virtual {p0}, Ll/s5b0;->g0()V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final R()V
    .locals 8

    .line 1
    new-instance v0, Ljava/text/DecimalFormat;

    .line 2
    .line 3
    const-string v1, "#.##"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v1, p0, Ll/s5b0;->M:D

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 15
    .line 16
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->G0:I

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, ""

    .line 23
    .line 24
    const-string v3, "\u534a\u5e74"

    .line 25
    .line 26
    const-string v4, "\u4f1a\u5458\u53ca\u81ea\u52a8\u7eed\u8d39\u534f\u8bae"

    .line 27
    .line 28
    filled-new-array {v4, v2, v0, v3}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "\uff1b\u8d60\u9001\u76843\u4e2a\u6708\u4f1a\u5458\u7acb\u523b\u53d1\u653e\uff0c\u5f53\u81ea\u52a8\u7eed\u8d39\u5408\u7ea6\u53d6\u6d88\u65f6\uff0c\u8d60\u9001\u76843\u4e2a\u6708\u5c06\u5931\u6548"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 43
    .line 44
    invoke-direct {v1, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    const-string v3, "\u8d60\u9001\u76843\u4e2a\u6708\u5c06\u5931\u6548"

    .line 52
    .line 53
    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    new-instance v3, Ll/da5;

    .line 58
    .line 59
    sget-object v4, Ll/bn60;->b:Ljava/lang/String;

    .line 60
    .line 61
    invoke-direct {v3, v4}, Ll/da5;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const-string v4, "#99FFECAF"

    .line 65
    .line 66
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    invoke-virtual {v3, v5}, Ll/da5;->b(I)Ll/da5;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 75
    .line 76
    sget v6, Lcom/p1/mobile/putong/core/pay/R$string;->D6:I

    .line 77
    .line 78
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    invoke-virtual {v3, v5}, Ll/da5;->c(Ljava/lang/String;)Ll/da5;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    const/4 v5, 0x1

    .line 87
    invoke-virtual {v3, v5}, Ll/da5;->d(Z)Ll/da5;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    add-int/lit8 v6, v2, 0x9

    .line 92
    .line 93
    const/16 v7, 0x12

    .line 94
    .line 95
    invoke-virtual {v1, v3, v2, v6, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 96
    .line 97
    .line 98
    new-instance v3, Landroid/text/style/StyleSpan;

    .line 99
    .line 100
    invoke-direct {v3, v5}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1, v3, v2, v6, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 104
    .line 105
    .line 106
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    .line 107
    .line 108
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 113
    .line 114
    .line 115
    add-int/lit8 v3, v0, 0x9

    .line 116
    .line 117
    invoke-virtual {v1, v2, v0, v3, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 118
    .line 119
    .line 120
    new-instance v2, Landroid/text/style/StyleSpan;

    .line 121
    .line 122
    invoke-direct {v2, v5}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1, v2, v0, v3, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Ll/s5b0;->v:Lv/VText;

    .line 129
    .line 130
    new-instance v2, Ll/od0;

    .line 131
    .line 132
    invoke-direct {v2, v1}, Ll/od0;-><init>(Landroid/text/Spannable;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Ll/s5b0;->v:Lv/VText;

    .line 139
    .line 140
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public final S()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/s5b0;->q:Lv/VText;

    .line 2
    .line 3
    const-string v1, "\u67e5\u770b\u8c01\u559c\u6b22\u4e86\u6211"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/s5b0;->r:Lv/VText;

    .line 9
    .line 10
    const-string v1, "\u6bcf\u59293\u6b21\u95ea\u804a\u673a\u4f1a"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object p0, p0, Ll/s5b0;->s:Lv/VText;

    .line 27
    .line 28
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "\u6bcf\u67083\u6b21\u4f18\u5148\u63a8\u8350\u7b49\u603b\u8ba1%s\u9879\u7279\u6743"

    .line 37
    .line 38
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    filled-new-array {v0}, [Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v2, "#FFE350"

    .line 55
    .line 56
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 61
    .line 62
    invoke-static {v1, v0, v2, v3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic U(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x4

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getRepeatCount()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/s5b0;->E:Ll/x20;

    .line 17
    .line 18
    invoke-interface {p0}, Ll/x20;->call()V

    .line 19
    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x1

    .line 22
    return p0
.end method

.method public final synthetic a0(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/s5b0;->I:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 4
    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    long-to-double v0, v0

    .line 10
    sub-double/2addr p0, v0

    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    cmpg-double p0, p0, v0

    .line 14
    .line 15
    if-gtz p0, :cond_0

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
    return-object p0
.end method

.method public final synthetic b0(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/s5b0;->f0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic c0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s5b0;->u:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/s5b0;->A:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public dismiss()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-static {p0}, Ll/v5b0;->z(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final g0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jh()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/s5b0;->J:Lcom/p1/mobile/putong/data/PayMethod;

    .line 16
    .line 17
    const-string v1, "alipay"

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->D6()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Ll/s5b0;->y:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/s5b0;->y:Lv/VText;

    .line 43
    .line 44
    const/4 v0, 0x1

    .line 45
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    iget-object p0, p0, Ll/s5b0;->y:Lv/VText;

    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/g1e;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x1

    .line 5
    .line 6
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 7
    .line 8
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lrx/c;->onBackpressureDrop()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Ll/psd0;->y()Lrx/c$d;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Ll/g1e;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/i5b0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/i5b0;-><init>(Ll/s5b0;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->takeUntil(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/j5b0;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/j5b0;-><init>(Ll/s5b0;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/s5b0;->D:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Ll/s5b0;->O(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Ll/s5b0;->h0()V

    .line 19
    .line 20
    .line 21
    new-instance p1, Ll/beb0;

    .line 22
    .line 23
    iget-object v0, p0, Ll/s5b0;->H:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 26
    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;->page_discount_6m:Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;

    .line 28
    .line 29
    iget-object v2, p0, Ll/s5b0;->F:Ljava/lang/String;

    .line 30
    .line 31
    invoke-direct {p1, v0, v1, v2}, Ll/beb0;-><init>(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Ll/s5b0;->N:Ll/lib0;

    .line 35
    .line 36
    iget-object v0, p0, Ll/s5b0;->H:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ll/lib0;->v(Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0}, Ll/s5b0;->T()V

    .line 44
    .line 45
    .line 46
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->C3()Lrx/c;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/g1e;->onDismiss(Landroid/content/DialogInterface;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public show()V
    .locals 7

    .line 1
    invoke-super {p0}, Ll/g1e;->show()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "p_purchase_page"

    .line 13
    .line 14
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/s5b0;->G:Ll/l4g0;

    .line 19
    .line 20
    iget-object v1, p0, Ll/s5b0;->F:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v2, "purchaseShowFrom"

    .line 27
    .line 28
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, p0, Ll/s5b0;->H:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 35
    .line 36
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const-string v3, "productType"

    .line 41
    .line 42
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    new-instance v3, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    iget-object v4, p0, Ll/s5b0;->H:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 52
    .line 53
    iget v4, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v4, "m"

    .line 59
    .line 60
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    const-string v4, "default_duration"

    .line 68
    .line 69
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    iget-object v4, p0, Ll/s5b0;->I:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 74
    .line 75
    invoke-static {v4}, Ll/g2f;->d(Lcom/p1/mobile/putong/core/data/Coupon;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    const-string v5, "promotion_type"

    .line 80
    .line 81
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    const-string v5, "page_style"

    .line 86
    .line 87
    const-string v6, "promotion"

    .line 88
    .line 89
    invoke-static {v5, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    filled-new-array {v1, v2, v3, v4, v5}, [Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Ll/s5b0;->G:Ll/l4g0;

    .line 101
    .line 102
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 103
    .line 104
    .line 105
    const/4 p0, 0x1

    .line 106
    invoke-static {p0}, Ll/v5b0;->z(Z)V

    .line 107
    .line 108
    .line 109
    return-void
.end method
