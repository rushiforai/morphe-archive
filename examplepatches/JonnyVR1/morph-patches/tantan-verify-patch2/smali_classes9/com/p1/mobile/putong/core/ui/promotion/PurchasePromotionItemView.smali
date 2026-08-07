.class public Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->l0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;Lcom/p1/mobile/putong/data/Data;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->k0(Lcom/p1/mobile/putong/data/Data;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;Lcom/p1/mobile/putong/core/ui/promotion/a$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->m0(Lcom/p1/mobile/putong/core/ui/promotion/a$a;Landroid/view/View;)V

    return-void
.end method

.method private synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    const-string p0, "\u6dfb\u52a0\u5931\u8d25"

    .line 9
    .line 10
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final synthetic k0(Lcom/p1/mobile/putong/data/Data;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    const-string p0, "\u6dfb\u52a0\u6210\u529f"

    .line 9
    .line 10
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->c1:Ll/usa;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/usa;->N3()Lrx/c;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic m0(Lcom/p1/mobile/putong/core/ui/promotion/a$a;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/zwk;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    const-string p0, "\u8be5\u529f\u80fd\u4ec5\u4f9b\u6d4b\u8bd5\u73af\u5883\u4f7f\u7528\uff01"

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->T1:I

    .line 18
    .line 19
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->c1:Ll/usa;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/promotion/a$a;->c:Ljava/lang/String;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/promotion/a$a;->d:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v1, p1}, Ll/usa;->u3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance p2, Ll/ogb0;

    .line 43
    .line 44
    invoke-direct {p2, p0}, Ll/ogb0;-><init>(Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Ll/pgb0;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/pgb0;-><init>(Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public n0(Lcom/p1/mobile/putong/core/ui/promotion/a$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/promotion/a$a;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/promotion/a$a;->e:Z

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->d:Landroid/widget/TextView;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/16 v1, 0x10

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFlags(I)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaintFlags()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    and-int/lit8 v0, v0, -0x11

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->d:Landroid/widget/TextView;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setFlags(I)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->d:Landroid/widget/TextView;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const/4 v1, 0x1

    .line 46
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->e:Landroid/widget/TextView;

    .line 50
    .line 51
    new-instance v1, Ll/ngb0;

    .line 52
    .line 53
    invoke-direct {v1, p0, p1}, Ll/ngb0;-><init>(Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;Lcom/p1/mobile/putong/core/ui/promotion/a$a;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/fdc0;->a:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/TextView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->e:Landroid/widget/TextView;

    .line 13
    .line 14
    sget v0, Ll/fdc0;->t0:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/TextView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->d:Landroid/widget/TextView;

    .line 23
    .line 24
    sget v0, Ll/fdc0;->M:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/promotion/PurchasePromotionItemView;->f:Landroid/view/View;

    .line 31
    .line 32
    return-void
.end method
