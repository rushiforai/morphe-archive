.class public abstract Li83;
.super Lltl;
.source "SourceFile"

# interfaces
.implements Lsni;
.implements Ljbl;
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final r:I

.field public final s:I

.field public final t:I

.field public final u:I

.field public v:Lei;

.field public w:Ljp1;

.field public x:Ljp1;

.field public y:Ltni;


# direct methods
.method public constructor <init>(IIII)V
    .registers 6

    const v0, 0x7f0d0090

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    iput p1, p0, Li83;->r:I

    iput p2, p0, Li83;->s:I

    iput p3, p0, Li83;->t:I

    iput p4, p0, Li83;->u:I

    return-void
.end method


# virtual methods
.method public G0(Landroid/view/View;)Landroid/util/Pair;
    .registers 4

    const p0, 0x7f0a086c

    invoke-static {p0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v0, :cond_1e

    const p0, 0x7f0a0953

    invoke-static {p0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v1, :cond_1e

    check-cast p1, Landroid/widget/LinearLayout;

    new-instance p0, Landroid/util/Pair;

    invoke-direct {p0, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0

    :cond_1e
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public H0(Lei;)V
    .registers 5

    iget-object p0, p1, Lei;->h:Landroid/view/View;

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070053

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    const v2, 0x7f070052

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-static {p0, v1, v0}, Lq9n;->E(Landroid/view/View;II)V

    iget-object p0, p1, Lei;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f070051

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-static {p1, p0}, Lq9n;->C(ILandroid/view/View;)V

    return-void
.end method

.method public abstract I0()V
.end method

.method public final Y(Z)V
    .registers 4

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Landroidx/fragment/app/a;

    invoke-direct {v0, p1}, Landroidx/fragment/app/a;-><init>(Landroidx/fragment/app/w;)V

    invoke-virtual {v0, p0}, Landroidx/fragment/app/a;->j(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/a;

    new-instance p1, Lxm9;

    const/4 v1, 0x7

    invoke-direct {p1, p0, v1}, Lxm9;-><init>(Landroidx/fragment/app/Fragment;I)V

    invoke-virtual {v0, p1}, Lym9;->b(Lxm9;)V

    invoke-virtual {v0}, Landroidx/fragment/app/a;->h()I

    return-void
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 3

    invoke-super {p0, p1}, Lk24;->onAttach(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p1

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    check-cast p1, Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Ldx3;->l:Ltni;

    iput-object p1, p0, Li83;->y:Ltni;

    invoke-virtual {p1, p0}, Ltni;->a(Lsni;)V

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Li83;->w:Ljp1;

    if-ne p1, v0, :cond_7

    invoke-virtual {p0}, Li83;->I0()V

    :cond_7
    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Li83;->v:Lei;

    iput-object v0, p0, Li83;->w:Ljp1;

    iput-object v0, p0, Li83;->x:Ljp1;

    return-void
.end method

.method public final onDetach()V
    .registers 2

    invoke-super {p0}, Lk24;->onDetach()V

    iget-object v0, p0, Li83;->y:Ltni;

    invoke-virtual {v0, p0}, Ltni;->c(Lsni;)V

    const/4 v0, 0x0

    iput-object v0, p0, Li83;->y:Ltni;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Li83;->v:Lei;

    iget-object p1, p1, Lei;->h:Landroid/view/View;

    check-cast p1, Landroid/widget/TextView;

    iget p2, p0, Li83;->r:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Li83;->v:Lei;

    iget-object p1, p1, Lei;->i:Landroid/view/View;

    check-cast p1, Landroid/widget/TextView;

    iget p2, p0, Li83;->s:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Li83;->w:Ljp1;

    iget p2, p0, Li83;->u:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Li83;->w:Ljp1;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Li83;->x:Ljp1;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Li83;->v:Lei;

    iget-object p1, p1, Lei;->g:Landroid/view/View;

    if-eqz p1, :cond_35

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    :cond_35
    iget-object p1, p0, Li83;->v:Lei;

    invoke-virtual {p0, p1}, Li83;->H0(Lei;)V

    return-void
.end method

.method public final s0()I
    .registers 1

    const p0, 0x7f14044d

    return p0
.end method

.method public final t0(Landroid/content/Context;)I
    .registers 2

    const p0, 0x7f080522

    return p0
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 13

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a0269

    invoke-static {p2, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/view/ViewGroup;

    const v0, 0x7f0d008f

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a0108

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/view/ViewStub;

    if-eqz v3, :cond_99

    const p2, 0x7f0a01f5

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/constraintlayout/widget/Guideline;

    const p2, 0x7f0a026e

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/widget/FrameLayout;

    if-eqz v4, :cond_99

    const p2, 0x7f0a0571

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v5, :cond_99

    const p2, 0x7f0a06b5

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_99

    const p2, 0x7f0a086d

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    const p2, 0x7f0a0954

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    const p2, 0x7f0a06c5

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Landroid/widget/TextView;

    if-eqz v9, :cond_99

    new-instance v1, Lei;

    move-object v2, p1

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v1 .. v9}, Lei;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/view/ViewStub;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/TextView;Landroid/view/View;Landroid/view/View;Landroid/widget/TextView;)V

    iput-object v1, p0, Li83;->v:Lei;

    iget p1, p0, Li83;->t:I

    invoke-virtual {v3, p1}, Landroid/view/ViewStub;->setLayoutResource(I)V

    iget-object p1, p0, Li83;->v:Lei;

    iget-object p1, p1, Lei;->c:Landroid/view/View;

    check-cast p1, Landroid/view/ViewStub;

    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Li83;->G0(Landroid/view/View;)Landroid/util/Pair;

    move-result-object p1

    iget-object p2, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast p2, Ljp1;

    iput-object p2, p0, Li83;->w:Ljp1;

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Ljp1;

    iput-object p1, p0, Li83;->x:Ljp1;

    iget-object p0, p0, Li83;->v:Lei;

    iget-object p0, p0, Lei;->d:Landroid/view/View;

    return-void

    :cond_99
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
