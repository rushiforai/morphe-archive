.class public Ll/yfl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/api/c0$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/yfl0$b;
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VButton;

.field public f:Lv/VButton;

.field public g:Lv/VButton;

.field public h:Landroid/widget/ImageView;

.field public i:Landroid/app/Dialog;

.field public final j:Lcom/p1/mobile/android/app/Act;

.field public final k:Ll/b240;

.field public l:Ll/kcg0;

.field public final m:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public n:Ljava/lang/String;

.field public o:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

.field public p:Ll/kcg0;

.field public q:Ll/kcg0;

.field public r:Ll/l4g0;

.field public final s:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/b240;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 5
    .line 6
    iput-object v0, p0, Ll/yfl0;->m:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    const-string v0, "video_purchase_dlg_timer"

    .line 9
    .line 10
    iput-object v0, p0, Ll/yfl0;->s:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p1, p0, Ll/yfl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    iput-object p2, p0, Ll/yfl0;->k:Ll/b240;

    .line 15
    .line 16
    return-void
.end method

.method private F()V
    .locals 5

    .line 1
    const-wide/16 v0, 0x3e7f

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Ll/yfl0;->C(J)V

    .line 4
    .line 5
    .line 6
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 9
    .line 10
    const-string v3, "video_purchase_dlg_timer"

    .line 11
    .line 12
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    new-instance v2, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 16
    .line 17
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const/4 v3, 0x1

    .line 25
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {}, Ll/pzi0;->o()J

    .line 30
    .line 31
    .line 32
    move-result-wide v3

    .line 33
    add-long/2addr v3, v0

    .line 34
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 45
    .line 46
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/yfl0;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yfl0;->q(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic d(Ll/yfl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yfl0;->t(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/yfl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yfl0;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/yfl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yfl0;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Ll/yfl0;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yfl0;->r(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic h(Ll/yfl0;ZLandroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yfl0;->x(ZLandroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic i(Ll/yfl0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yfl0;->y(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic j(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

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

.method public static synthetic k(Ll/yfl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yfl0;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/yfl0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yfl0;->z(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method


# virtual methods
.method public final A(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/zry;->z(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ll/jzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/yfl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v2, p0, Ll/yfl0;->m:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    invoke-interface {v0, v1, v2, p1, p2}, Ll/jzl;->a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/4 v1, 0x1

    .line 38
    if-ne v0, v1, :cond_0

    .line 39
    .line 40
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->getProductId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Ll/yfl0;->n:Ljava/lang/String;

    .line 53
    .line 54
    iput-object p2, p0, Ll/yfl0;->o:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public final B()V
    .locals 1

    .line 1
    invoke-static {}, Ll/otm;->o()Ll/otm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/otm;->G()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/yfl0;->n()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/otm;->o()Ll/otm;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/otm;->w()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final C(J)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->pc:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    cmp-long v1, p1, v1

    .line 10
    .line 11
    iget-object p0, p0, Ll/yfl0;->e:Lv/VButton;

    .line 12
    .line 13
    if-lez v1, :cond_0

    .line 14
    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v0, " ("

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-wide/16 v2, 0x3e8

    .line 29
    .line 30
    div-long/2addr p1, v2

    .line 31
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p1, "s)"

    .line 35
    .line 36
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final D(Z)V
    .locals 3

    .line 1
    invoke-static {}, Ll/pgj;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/nmp;->b()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v1

    .line 17
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->g()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    move v1, v0

    .line 25
    :goto_1
    if-eqz v1, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Ll/yfl0;->f:Lv/VButton;

    .line 28
    .line 29
    const/16 v1, 0x8

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Ll/yfl0;->f:Lv/VButton;

    .line 35
    .line 36
    xor-int/lit8 v1, p1, 0x1

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/yfl0;->g:Lv/VButton;

    .line 42
    .line 43
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/yfl0;->f:Lv/VButton;

    .line 47
    .line 48
    new-instance v0, Ll/sfl0;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/sfl0;-><init>(Ll/yfl0;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/yfl0;->h:Landroid/widget/ImageView;

    .line 57
    .line 58
    new-instance v0, Ll/tfl0;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/tfl0;-><init>(Ll/yfl0;)V

    .line 61
    .line 62
    .line 63
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/yfl0;->g:Lv/VButton;

    .line 67
    .line 68
    new-instance v0, Ll/ufl0;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/ufl0;-><init>(Ll/yfl0;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/yfl0;->e:Lv/VButton;

    .line 77
    .line 78
    new-instance v0, Ll/vfl0;

    .line 79
    .line 80
    invoke-direct {v0, p0}, Ll/vfl0;-><init>(Ll/yfl0;)V

    .line 81
    .line 82
    .line 83
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public E()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/yfl0;->G()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/agc0;->m:I

    .line 5
    .line 6
    sget v1, Ll/kec0;->m2:I

    .line 7
    .line 8
    iget-object v2, p0, Ll/yfl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2, v1}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget-object v1, Ll/g6e;->a:Lcom/p1/mobile/android/app/Dialog$f;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->y0(Lcom/p1/mobile/android/app/Dialog$f;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Ll/yfl0;->i:Landroid/app/Dialog;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ll/yfl0;->m(Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Ll/d79;->Z()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_0

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/yfl0;->p()V

    .line 57
    .line 58
    .line 59
    :cond_0
    invoke-virtual {p0, v0}, Ll/yfl0;->D(Z)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Ll/yfl0;->i:Landroid/app/Dialog;

    .line 63
    .line 64
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Ll/yfl0;->i:Landroid/app/Dialog;

    .line 68
    .line 69
    new-instance v3, Ll/mfl0;

    .line 70
    .line 71
    invoke-direct {v3, p0, v0}, Ll/mfl0;-><init>(Ll/yfl0;Z)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1, v3}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Ll/yfl0;->i:Landroid/app/Dialog;

    .line 78
    .line 79
    new-instance v3, Ll/pfl0;

    .line 80
    .line 81
    invoke-direct {v3, p0}, Ll/pfl0;-><init>(Ll/yfl0;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, v3}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 85
    .line 86
    .line 87
    invoke-static {}, Ll/otm;->o()Ll/otm;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v1}, Ll/otm;->l()Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-nez v1, :cond_1

    .line 96
    .line 97
    invoke-static {}, Ll/otm;->o()Ll/otm;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v1, v2}, Ll/otm;->v(Z)V

    .line 102
    .line 103
    .line 104
    :cond_1
    if-eqz v0, :cond_2

    .line 105
    .line 106
    invoke-static {}, Ll/otm;->o()Ll/otm;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Ll/otm;->z()V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/yfl0;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 114
    .line 115
    invoke-static {v0, v2}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/yfl0;->c:Landroid/widget/ImageView;

    .line 119
    .line 120
    sget v1, Ll/qa00;->x:I

    .line 121
    .line 122
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/yfl0;->d:Landroid/widget/TextView;

    .line 126
    .line 127
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Ll/yfl0;->e:Lv/VButton;

    .line 131
    .line 132
    sget v1, Ll/qa00;->v:I

    .line 133
    .line 134
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Ll/yfl0;->h:Landroid/widget/ImageView;

    .line 138
    .line 139
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Ll/yfl0;->b:Landroid/view/View;

    .line 143
    .line 144
    const/4 v1, 0x1

    .line 145
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Ll/yfl0;->e:Lv/VButton;

    .line 149
    .line 150
    sget v2, Ll/dbc0;->u:I

    .line 151
    .line 152
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Ll/yfl0;->c:Landroid/widget/ImageView;

    .line 156
    .line 157
    sget v2, Ll/dbc0;->f9:I

    .line 158
    .line 159
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Ll/yfl0;->d:Landroid/widget/TextView;

    .line 163
    .line 164
    sget v2, Lcom/p1/mobile/putong/core/R$string;->oc:I

    .line 165
    .line 166
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Ll/yfl0;->e:Lv/VButton;

    .line 170
    .line 171
    sget v2, Ll/c9c0;->E0:I

    .line 172
    .line 173
    invoke-static {v2}, Ll/k3d0;->a(I)I

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Ll/yfl0;->g:Lv/VButton;

    .line 181
    .line 182
    sget v2, Ll/c9c0;->g0:I

    .line 183
    .line 184
    invoke-static {v2}, Ll/k3d0;->a(I)I

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Ll/yfl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 192
    .line 193
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    new-instance v1, Ll/qfl0;

    .line 202
    .line 203
    invoke-direct {v1, p0}, Ll/qfl0;-><init>(Ll/yfl0;)V

    .line 204
    .line 205
    .line 206
    new-instance v2, Ll/rfl0;

    .line 207
    .line 208
    invoke-direct {v2}, Ll/rfl0;-><init>()V

    .line 209
    .line 210
    .line 211
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    iput-object v0, p0, Ll/yfl0;->q:Ll/kcg0;

    .line 220
    .line 221
    :cond_2
    return-void
.end method

.method public G()V
    .locals 3

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    new-instance v1, Ll/yfl0$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/yfl0$a;-><init>(Ll/yfl0;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/l4g0;-><init>(Ll/e6m;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/yfl0;->r:Ll/l4g0;

    .line 12
    .line 13
    new-instance v0, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 16
    .line 17
    .line 18
    :try_start_0
    const-string v1, "tooltips_trigger_mode"

    .line 19
    .line 20
    const-string v2, "active"

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    :catch_0
    iget-object v1, p0, Ll/yfl0;->r:Ll/l4g0;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/yfl0;->r:Ll/l4g0;

    .line 31
    .line 32
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zfl0;->a(Ll/yfl0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/yfl0;->o()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/yfl0;->i:Landroid/app/Dialog;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/yfl0;->r:Ll/l4g0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/yfl0;->l:Ll/kcg0;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/yfl0;->l:Ll/kcg0;

    .line 24
    .line 25
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Ll/yfl0;->l:Ll/kcg0;

    .line 32
    .line 33
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Ll/yfl0;->l:Ll/kcg0;

    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Ll/yfl0;->p:Ll/kcg0;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Ll/yfl0;->p:Ll/kcg0;

    .line 47
    .line 48
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_1

    .line 53
    .line 54
    iget-object v0, p0, Ll/yfl0;->p:Ll/kcg0;

    .line 55
    .line 56
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Ll/yfl0;->p:Ll/kcg0;

    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method public final o()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yfl0;->q:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/yfl0;->q:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 17
    .line 18
    const-string v0, "video_purchase_dlg_timer"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final p()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yfl0;->m:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, Ll/wfl0;

    .line 12
    .line 13
    invoke-direct {v2}, Ll/wfl0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    new-instance v2, Ll/xfl0;

    .line 21
    .line 22
    invoke-direct {v2}, Ll/xfl0;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    new-instance v2, Ll/nfl0;

    .line 30
    .line 31
    invoke-direct {v2, p0}, Ll/nfl0;-><init>(Ll/yfl0;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Ll/ofl0;

    .line 47
    .line 48
    invoke-direct {v2, p0, v0}, Ll/ofl0;-><init>(Ll/yfl0;Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Ll/yfl0;->l:Ll/kcg0;

    .line 60
    .line 61
    return-void
.end method

.method public final synthetic q(Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yfl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yfl0;->A(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 8

    .line 1
    invoke-static {}, Ll/otm;->o()Ll/otm;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/otm;->F()V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/hso;

    .line 9
    .line 10
    iget-object v0, p0, Ll/yfl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iget-object v1, p0, Ll/yfl0;->m:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    invoke-direct {p1, v0, v1}, Ll/hso;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 15
    .line 16
    .line 17
    new-instance v2, Ll/yfl0$b;

    .line 18
    .line 19
    iget-object v4, p0, Ll/yfl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    iget-object v5, p0, Ll/yfl0;->m:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 22
    .line 23
    iget-object v6, p0, Ll/yfl0;->o:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 24
    .line 25
    iget-object v7, p0, Ll/yfl0;->n:Ljava/lang/String;

    .line 26
    .line 27
    move-object v3, p0

    .line 28
    invoke-direct/range {v2 .. v7}, Ll/yfl0$b;-><init>(Ll/yfl0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v2}, Ll/hso;->t(Ll/bn50;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, v3, Ll/yfl0;->j:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    instance-of v0, p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    move-object v0, p0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->iap()Ll/bbm;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/bbm;->i()Lcom/android/billingclient/api/a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 v0, 0x0

    .line 53
    :goto_0
    invoke-static {p0, v0}, Ll/aso;->h(Lcom/p1/mobile/android/app/Act;Lcom/android/billingclient/api/a;)Ll/aso;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const/4 v0, 0x1

    .line 58
    iget-object v1, v3, Ll/yfl0;->n:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p1, p0, v0, v1}, Ll/hso;->p(Ll/aso;ZLjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final synthetic t(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yfl0;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u(Ljava/lang/String;JJJJ)V
    .locals 0

    .line 1
    sub-long/2addr p6, p2

    .line 2
    invoke-virtual {p0, p6, p7}, Ll/yfl0;->C(J)V

    .line 3
    .line 4
    .line 5
    const-wide/16 p1, 0x0

    .line 6
    .line 7
    cmp-long p1, p6, p1

    .line 8
    .line 9
    if-gtz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/yfl0;->B()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/otm;->o()Ll/otm;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/otm;->y()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/yfl0;->n()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yfl0;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic x(ZLandroid/content/DialogInterface;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, Ll/yfl0;->F()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public final synthetic y(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yfl0;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ll/yfl0;->F()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object p0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p1, p0, :cond_1

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 16
    .line 17
    const-string p1, "video_purchase_dlg_timer"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method
