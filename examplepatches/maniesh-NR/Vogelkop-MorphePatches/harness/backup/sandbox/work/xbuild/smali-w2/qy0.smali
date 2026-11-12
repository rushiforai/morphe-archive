.class public final Lqy0;
.super Lsy0;
.source "SourceFile"


# instance fields
.field public final g:Lov0;

.field public final h:Ljy0;


# direct methods
.method public constructor <init>(Lov0;Ltzi;Ljy0;)V
    .registers 5

    iget-object v0, p1, Lov0;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/widget/SelectableRelativeLayout;

    invoke-direct {p0, v0, p2}, Lyzi;-><init>(Landroid/view/View;Ltzi;)V

    iput-object p1, p0, Lqy0;->g:Lov0;

    iput-object p3, p0, Lqy0;->h:Ljy0;

    iget-object p2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p3, Lpy0;

    const/4 v0, 0x0

    invoke-direct {p3, p0, v0}, Lpy0;-><init>(Lqy0;B)V

    invoke-static {p3}, Lt0h;->i(Landroid/view/View$OnClickListener;)Lks8;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p3, Lzt;

    const/4 v0, 0x2

    invoke-direct {p3, p0, v0}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object p1, p1, Lov0;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    new-instance p2, Lpy0;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lpy0;-><init>(Lqy0;B)V

    invoke-static {p2}, Lt0h;->i(Landroid/view/View$OnClickListener;)Lks8;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Llxh;

    const p2, 0x7f080587

    invoke-direct {p1, p2}, Llxh;-><init>(I)V

    iget-object p2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lyzi;->b0(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public final W(Z)V
    .registers 2

    invoke-virtual {p0}, Lyzi;->f0()V

    invoke-virtual {p0}, Lqy0;->h0()V

    return-void
.end method

.method public final h0()V
    .registers 9

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f1412a0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    invoke-virtual {p0}, Lyzi;->Z()Z

    move-result v1

    iget-object v2, p0, Lqy0;->g:Lov0;

    if-eqz v1, :cond_1d

    iget-object v1, v2, Lov0;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Landroid/view/View;->setImportantForAccessibility(I)V

    goto :goto_25

    :cond_1d
    iget-object v1, v2, Lov0;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/view/View;->setImportantForAccessibility(I)V

    :goto_25
    iget-object v1, p0, Lyzi;->b:Ltzi;

    iget-boolean v1, v1, Ltzi;->g:Z

    const v3, 0x7f1412bc

    const/4 v4, 0x0

    if-eqz v1, :cond_7c

    invoke-virtual {p0}, Lyzi;->Z()Z

    move-result v1

    if-eqz v1, :cond_5a

    iget-object v1, v2, Lov0;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    sget-object v2, Ls8;->g:Ls8;

    const v3, 0x7f141295

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v2, v5, v4}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v2, v5, v4}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v1, Ls8;->h:Ls8;

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v1, v0, v4}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    return-void

    :cond_5a
    iget-object v1, v2, Lov0;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    sget-object v2, Ls8;->g:Ls8;

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v2, v5, v4}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v5, Ls8;->h:Ls8;

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v5, v6, v4}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v2, v0, v4}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    return-void

    :cond_7c
    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v5, Ls8;->g:Ls8;

    iget-object v6, v2, Lov0;->d:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v6}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    const v7, 0x7f14129f

    invoke-virtual {v0, v7, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v5, v6, v4}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v1, Ls8;->h:Ls8;

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v1, v6, v4}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object p0, v2, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v5, v0, v4}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    return-void
.end method

.method public final j0(Lfy0;)V
    .registers 3

    check-cast p1, Lgy0;

    invoke-virtual {p0}, Lyzi;->U()V

    iput-object p1, p0, Lsy0;->f:Lfy0;

    iget-object v0, p0, Lqy0;->g:Lov0;

    iget-object v0, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object p1, p1, Lgy0;->c:Ljava/lang/String;

    invoke-static {p1}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lqy0;->h0()V

    return-void
.end method
