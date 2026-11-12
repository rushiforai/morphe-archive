.class public final Lalh;
.super Lak7;
.source "SourceFile"


# static fields
.field public static final synthetic m:I


# instance fields
.field public final i:Lpt1;

.field public j:Lwkh;

.field public k:Lp8i;

.field public final synthetic l:Lblh;


# direct methods
.method public constructor <init>(Lblh;Lpt1;Ltzi;)V
    .registers 7

    iput-object p1, p0, Lalh;->l:Lblh;

    iget-object v0, p2, Lpt1;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/SelectableRelativeLayout;

    invoke-direct {p0, v0, p3}, Lak7;-><init>(Landroid/view/View;Ltzi;)V

    iput-object p2, p0, Lalh;->i:Lpt1;

    iget-object p3, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/4 v0, 0x1

    invoke-virtual {p3, v0}, Landroid/view/View;->setLongClickable(Z)V

    iget-object p3, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance v1, Lykh;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lykh;-><init>(Lalh;Lblh;B)V

    invoke-static {v1}, Lt0h;->i(Landroid/view/View$OnClickListener;)Lks8;

    move-result-object v1

    invoke-virtual {p3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p3, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance v1, Lzkh;

    invoke-direct {v1, p0, v2}, Lzkh;-><init>(Landroidx/recyclerview/widget/i;B)V

    invoke-virtual {p3, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object p2, p2, Lpt1;->g:Landroid/view/View;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance p3, Lykh;

    invoke-direct {p3, p0, p1, v0}, Lykh;-><init>(Lalh;Lblh;B)V

    new-instance p1, Lohi;

    invoke-direct {p1, p3, v2}, Lohi;-><init>(Landroid/view/View$OnClickListener;B)V

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Lkkf;

    const/16 p3, 0x8

    invoke-direct {p2, p0, p3}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final K(Landroidx/recyclerview/widget/i;)V
    .registers 8

    iget-object v0, p0, Lalh;->j:Lwkh;

    if-eqz v0, :cond_5e

    iget v0, v0, Lwkh;->b:I

    check-cast p1, Lalh;

    iget-object p1, p1, Lalh;->j:Lwkh;

    iget p1, p1, Lwkh;->b:I

    iget-object v1, p0, Lalh;->l:Lblh;

    iget-object v2, v1, Lblh;->h:Ljava/util/ArrayList;

    iget-object v3, v1, Lblh;->h:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget-object v2, p0, Lalh;->j:Lwkh;

    iget-object v2, v2, Lwkh;->a:Lilh;

    iget-wide v4, v2, Lilh;->a:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v3, p1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-object v2, v1, Lblh;->j:Lnlh;

    invoke-virtual {v2, v3}, Lnlh;->L0(Ljava/util/ArrayList;)V

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    :goto_2f
    if-gt v2, p1, :cond_42

    iget-object v0, v1, Lblh;->f:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwkh;

    iput v2, v0, Lwkh;->b:I

    add-int/lit8 v2, v2, 0x1

    goto :goto_2f

    :cond_42
    iget-object p1, v1, Lblh;->e:Lxvj;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result p0

    invoke-virtual {p1}, Lxvj;->i()V

    invoke-virtual {p1, p0}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, p0, v1}, Lxvj;->h(IZ)V

    invoke-virtual {p1, v0, v1}, Lxvj;->b(Ljava/lang/Object;Z)I

    move-result v0

    if-eq p0, v0, :cond_5e

    iget-object p1, p1, Lxvj;->f:Lqw4;

    invoke-interface {p1, p0, v0}, Lsic;->S(II)V

    :cond_5e
    return-void
.end method

.method public final W(Z)V
    .registers 2

    invoke-virtual {p0}, Lyzi;->f0()V

    invoke-virtual {p0}, Lalh;->h0()V

    return-void
.end method

.method public final e0()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lalh;->j:Lwkh;

    iput-object v0, p0, Lalh;->k:Lp8i;

    invoke-super {p0}, Lyzi;->e0()V

    return-void
.end method

.method public final g0(Z)V
    .registers 2

    iget-object p0, p0, Lalh;->i:Lpt1;

    iget-object p0, p0, Lpt1;->g:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p1, :cond_a

    const/4 p1, 0x0

    goto :goto_b

    :cond_a
    const/4 p1, 0x4

    :goto_b
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final h0()V
    .registers 9

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lalh;->i:Lpt1;

    iget-object v2, v1, Lpt1;->c:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    iget-object v3, p0, Lyzi;->d:Landroid/widget/ImageView;

    invoke-virtual {v3, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v2, v1, Lpt1;->g:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v4, v1, Lpt1;->b:Landroid/view/View;

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v4}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const v5, 0x7f1412a6

    invoke-virtual {v0, v5, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lyzi;->Z()Z

    move-result v2

    if-eqz v2, :cond_3a

    const/4 v2, 0x2

    invoke-virtual {v3, v2}, Landroid/view/View;->setImportantForAccessibility(I)V

    goto :goto_3e

    :cond_3a
    const/4 v2, 0x1

    invoke-virtual {v3, v2}, Landroid/view/View;->setImportantForAccessibility(I)V

    :goto_3e
    iget-object v2, p0, Lyzi;->b:Ltzi;

    iget-boolean v2, v2, Ltzi;->g:Z

    const v4, 0x7f1412bc

    const/4 v5, 0x0

    if-eqz v2, :cond_8d

    invoke-virtual {p0}, Lyzi;->Z()Z

    move-result v1

    if-eqz v1, :cond_6f

    sget-object v1, Ls8;->g:Ls8;

    const v2, 0x7f141295

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v1, v4, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object v3, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v1, v4, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v1, Ls8;->h:Ls8;

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v1, v0, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    return-void

    :cond_6f
    sget-object v1, Ls8;->g:Ls8;

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v1, v2, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object v2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v3, Ls8;->h:Ls8;

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v3, v6, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v1, v0, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    return-void

    :cond_8d
    iget-object v2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v6, Ls8;->g:Ls8;

    iget-object v1, v1, Lpt1;->c:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v7, 0x7f14129f

    invoke-virtual {v0, v7, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v6, v1, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v1, Ls8;->h:Ls8;

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v1, v2, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, v6, p0, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    return-void
.end method
