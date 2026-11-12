.class public final Lj4g;
.super Lb23;
.source "SourceFile"


# instance fields
.field public final b:Ljava/util/ArrayList;

.field public final c:Lo8f;

.field public final d:Lvdf;

.field public final e:Lorm;

.field public f:Lkf;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Lo8f;Lvdf;Lorm;)V
    .registers 6

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lb23;-><init>(B)V

    iput-object p1, p0, Lj4g;->b:Ljava/util/ArrayList;

    iput-object p2, p0, Lj4g;->c:Lo8f;

    iput-object p3, p0, Lj4g;->d:Lvdf;

    iput-object p4, p0, Lj4g;->e:Lorm;

    return-void
.end method


# virtual methods
.method public final f(Landroid/content/Context;)Landroid/view/View;
    .registers 5

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d0325

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a05dc

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v1, :cond_2f

    const v0, 0x7f0a08d3

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v1, :cond_2f

    new-instance v0, Lkf;

    check-cast p1, Lcom/opera/android/custom_views/OperaRadioGroup;

    const/16 v2, 0x17

    invoke-direct {v0, v2, p1, v1}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    iput-object v0, p0, Lj4g;->f:Lkf;

    return-object p1

    :cond_2f
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v2
.end method

.method public final g(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 4

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget-object p0, p0, Lj4g;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const v1, 0x7f120058

    invoke-virtual {p1, v1, v0, p0}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f1403bf

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f1404ca

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final i(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    const p0, 0x7f140c6b

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final j(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 2

    const p0, 0x7f080637

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public final k(Landroid/content/Context;)I
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final m(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 3

    const p0, 0x7f0402c4

    const v0, 0x7f06063b

    invoke-static {p0, p1, v0}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0
.end method

.method public final o()Ljava/lang/Integer;
    .registers 1

    const p0, 0x7f07006f

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 2

    invoke-super {p0, p1}, Lb23;->onCreateDialog(Laz0;)V

    const/4 p0, 0x0

    iget-object p1, p1, Laz0;->a:Lwy0;

    iput-boolean p0, p1, Lwy0;->k:Z

    return-void
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 2

    iget-object p0, p0, Lj4g;->d:Lvdf;

    invoke-virtual {p0}, Lvdf;->run()V

    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 4

    iget-object p1, p0, Lj4g;->f:Lkf;

    if-nez p1, :cond_5

    const/4 p1, 0x0

    :cond_5
    iget-object p1, p1, Lkf;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_14

    iget-object p1, p0, Lj4g;->b:Ljava/util/ArrayList;

    sget-object v0, Lgm0;->h:Lgm0;

    goto :goto_1b

    :cond_14
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    sget-object v0, Lgm0;->g:Lgm0;

    :goto_1b
    iget-object v1, p0, Lj4g;->c:Lo8f;

    invoke-virtual {v1, p1}, Lo8f;->run(Ljava/lang/Object;)V

    iget-object p0, p0, Lj4g;->e:Lorm;

    check-cast p0, Lx5f;

    invoke-virtual {p0, v0}, Lx5f;->l0(Lgm0;)V

    return-void
.end method
