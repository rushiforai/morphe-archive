.class public final Lcl3;
.super Ly5m;
.source "SourceFile"

# interfaces
.implements Lmya;


# instance fields
.field public g:I

.field public h:Lnya;

.field public final i:Leme;

.field public j:Z


# direct methods
.method public constructor <init>(Lfl3;Landroid/view/View;Leme;)V
    .registers 4

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, p1, p2}, Ly5m;-><init>(Lfl3;Landroid/view/View;)V

    iput-object p3, p0, Lcl3;->i:Leme;

    return-void
.end method


# virtual methods
.method public final U(Lll3;)V
    .registers 6

    invoke-super {p0, p1}, Ly5m;->U(Lll3;)V

    instance-of v0, p1, Ljl3;

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget v0, p0, Lcl3;->g:I

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    new-instance v2, Lbl3;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v1, v0, v3}, Lbl3;-><init>(Ljava/lang/Object;Ljava/lang/Object;IB)V

    check-cast p1, Lil3;

    iget-object p1, p1, Lll3;->a:Lal3;

    check-cast p1, Lpl3;

    iget-object v0, p0, Lcl3;->i:Leme;

    iget-object v0, v0, Leme;->a:Ljava/lang/Object;

    check-cast v0, Lvnj;

    invoke-static {p1}, Leme;->q0(Lpl3;)Lknj;

    move-result-object p1

    invoke-virtual {v0, p1, v2}, Lvnj;->f(Lknj;Lkotlin/jvm/functions/Function1;)Lifd;

    move-result-object p1

    instance-of v0, p1, Ltnj;

    if-eqz v0, :cond_31

    invoke-virtual {p0, p1}, Lcl3;->Z(Lifd;)V

    return-void

    :cond_31
    iput-boolean v3, p0, Lcl3;->j:Z

    return-void
.end method

.method public final V()V
    .registers 3

    const/4 v0, 0x0

    iput-object v0, p0, Lz5m;->b:Lll3;

    iget v1, p0, Lcl3;->g:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcl3;->g:I

    iget-object v1, p0, Lcl3;->h:Lnya;

    if-eqz v1, :cond_12

    invoke-static {v1}, Loya;->a(Lnya;)V

    iput-object v0, p0, Lcl3;->h:Lnya;

    :cond_12
    return-void
.end method

.method public final X()V
    .registers 2

    iget-boolean v0, p0, Lcl3;->j:Z

    if-nez v0, :cond_7

    invoke-super {p0}, Ly5m;->X()V

    :cond_7
    return-void
.end method

.method public final Z(Lifd;)V
    .registers 10

    instance-of v0, p1, Ltnj;

    if-eqz v0, :cond_22

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x42200000    # 40.0f

    invoke-static {v1, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v3

    check-cast p1, Ltnj;

    iget-object p1, p1, Ltnj;->a:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    move v4, v3

    move-object v7, p0

    invoke-static/range {v2 .. v7}, Loya;->b(Ljava/lang/String;IIIILmya;)Lnya;

    move-result-object p0

    iput-object p0, v7, Lcl3;->h:Lnya;

    :cond_22
    return-void
.end method

.method public final m(Landroid/graphics/Bitmap;Z)V
    .registers 7

    if-nez p2, :cond_5

    const/4 p2, 0x0

    iput-object p2, p0, Lcl3;->h:Lnya;

    :cond_5
    iget-object p2, p0, Ly5m;->c:Lcom/opera/android/custom_views/StylingImageView;

    if-nez p2, :cond_a

    return-void

    :cond_a
    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x42200000    # 40.0f

    invoke-static {v1, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-static {v2, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    iget-object v2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Ls8i;->d:Landroid/view/animation/PathInterpolator;

    new-instance v3, Lp8i;

    invoke-direct {v3, v0, v1, v2, p1}, Lp8i;-><init>(IILandroid/content/Context;Landroid/graphics/Bitmap;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->s(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {v3, p1}, Lp8i;->a(I)V

    invoke-virtual {p2, v3}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcl3;->j:Z

    return-void
.end method

.method public final u(I)V
    .registers 2

    const/4 p1, 0x0

    iput-object p1, p0, Lcl3;->h:Lnya;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcl3;->j:Z

    return-void
.end method
