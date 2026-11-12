.class public final Lc7n;
.super Ld7n;
.source "SourceFile"

# interfaces
.implements Lmya;


# instance fields
.field public final p:Leme;

.field public q:Lnya;

.field public r:I

.field public s:Lp8i;


# direct methods
.method public constructor <init>(Landroid/view/View;Leme;Ltzi;Li53;)V
    .registers 5

    invoke-direct {p0, p1, p3, p4}, Ld7n;-><init>(Landroid/view/View;Ltzi;Li53;)V

    iput-object p2, p0, Lc7n;->p:Leme;

    new-instance p2, Lsvk;

    const/16 p3, 0x13

    invoke-direct {p2, p0, p3}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final k0(Lqhc;)V
    .registers 6

    invoke-super {p0, p1}, Ld7n;->k0(Lqhc;)V

    iget v0, p0, Lc7n;->r:I

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    new-instance v2, Lgv;

    const/4 v3, 0x7

    invoke-direct {v2, v1, v0, v3}, Lgv;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {p1}, Lqhc;->e()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v0

    iget-object v1, p0, Ld7n;->l:Landroid/widget/TextView;

    if-eqz v0, :cond_32

    invoke-virtual {p0}, Lc7n;->m0()Lvmj;

    move-result-object p1

    iget v0, p1, Lvmj;->a:I

    iget v2, p1, Lvmj;->b:I

    invoke-static {p1, v0, v2}, Lscd;->l0(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc7n;->n0(Landroid/graphics/Bitmap;)V

    const p0, 0x7f14017c

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(I)V

    return-void

    :cond_32
    iget-object v0, p1, Lqhc;->a:Lal3;

    check-cast v0, Lpl3;

    iget-object v3, p0, Lc7n;->p:Leme;

    iget-object v3, v3, Leme;->a:Ljava/lang/Object;

    check-cast v3, Lvnj;

    invoke-static {v0}, Leme;->q0(Lpl3;)Lknj;

    move-result-object v0

    invoke-virtual {v3, v0, v2}, Lvnj;->f(Lknj;Lkotlin/jvm/functions/Function1;)Lifd;

    move-result-object v0

    if-nez v0, :cond_4e

    invoke-virtual {p0}, Lc7n;->m0()Lvmj;

    move-result-object v0

    invoke-virtual {p0, v0}, Lyzi;->b0(Landroid/graphics/drawable/Drawable;)V

    goto :goto_51

    :cond_4e
    invoke-virtual {p0, v0}, Lc7n;->o0(Lifd;)V

    :goto_51
    iget-object p0, p0, Ld7n;->o:Li53;

    check-cast p0, Lcom/opera/android/bookmarks/h;

    iget-object p0, p0, Lcom/opera/android/bookmarks/h;->j:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "show_full_address"

    const/4 v2, 0x0

    invoke-interface {p0, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_6b

    invoke-virtual {p1}, Lqhc;->e()Ljava/lang/String;

    move-result-object p0

    goto :goto_75

    :cond_6b
    invoke-virtual {p1}, Lqhc;->e()Ljava/lang/String;

    move-result-object p0

    sget-object p1, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p0}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_75
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final l0()V
    .registers 3

    iget-object v0, p0, Lc7n;->q:Lnya;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    invoke-static {v0}, Loya;->a(Lnya;)V

    iput-object v1, p0, Lc7n;->q:Lnya;

    :cond_a
    iget v0, p0, Lc7n;->r:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lc7n;->r:I

    iput-object v1, p0, Lc7n;->s:Lp8i;

    return-void
.end method

.method public final m(Landroid/graphics/Bitmap;Z)V
    .registers 3

    if-nez p2, :cond_5

    const/4 p2, 0x0

    iput-object p2, p0, Lc7n;->q:Lnya;

    :cond_5
    invoke-virtual {p0, p1}, Lc7n;->n0(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public final m0()Lvmj;
    .registers 8

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object p0, p0, Le7n;->i:Lqhc;

    invoke-virtual {p0}, Lqhc;->e()Ljava/lang/String;

    move-result-object v2

    sget p0, Lvmj;->g:I

    invoke-static {v1}, Ltmj;->i(Landroid/content/Context;)I

    move-result v3

    sget-object v5, Lna5;->b:Lna5;

    const/16 v6, 0x20

    move v4, v3

    invoke-static/range {v1 .. v6}, Ltmj;->m(Landroid/content/Context;Ljava/lang/String;IILna5;I)Lvmj;

    move-result-object p0

    return-object p0
.end method

.method public final n0(Landroid/graphics/Bitmap;)V
    .registers 6

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

    iput-object v3, p0, Lc7n;->s:Lp8i;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->s(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {v3, p1}, Lp8i;->a(I)V

    iget-object p1, p0, Lc7n;->s:Lp8i;

    invoke-virtual {p0, p1}, Lyzi;->b0(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final o0(Lifd;)V
    .registers 10

    instance-of v0, p1, Lnnj;

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Lc7n;->m0()Lvmj;

    move-result-object p1

    invoke-virtual {p0, p1}, Lyzi;->b0(Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_c
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

    iput-object p0, v7, Lc7n;->q:Lnya;

    return-void
.end method

.method public final u(I)V
    .registers 2

    const/4 p1, 0x0

    iput-object p1, p0, Lc7n;->q:Lnya;

    invoke-virtual {p0}, Lc7n;->m0()Lvmj;

    move-result-object p1

    invoke-virtual {p0, p1}, Lyzi;->b0(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
