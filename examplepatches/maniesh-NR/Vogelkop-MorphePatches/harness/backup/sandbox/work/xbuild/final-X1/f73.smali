.class public abstract Lf73;
.super Lab2;
.source "SourceFile"


# instance fields
.field public final d:Lowc;

.field public final e:Ltah;

.field public f:Lr8n;

.field public g:Le73;


# direct methods
.method public constructor <init>(Lowc;Ltah;)V
    .registers 5

    iget-object v0, p1, Lowc;->b:Landroid/widget/LinearLayout;

    invoke-direct {p0, v0}, Lab2;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lf73;->d:Lowc;

    iput-object p2, p0, Lf73;->e:Ltah;

    iget-object p2, p1, Lowc;->f:Lcom/opera/android/custom_views/StylingImageView;

    new-instance v0, Ld73;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ld73;-><init>(Lf73;B)V

    invoke-static {p2}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v1

    if-eqz v1, :cond_1a

    invoke-static {v1, p2, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_1a
    iget-object p1, p1, Lowc;->c:Lcom/opera/android/custom_views/StylingImageView;

    new-instance p2, Ld73;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Ld73;-><init>(Lf73;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_29

    return-void

    :cond_29
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final X(Z)V
    .registers 15

    invoke-virtual {p0}, Lf73;->c0()Lfdn;

    move-result-object p1

    invoke-virtual {p0}, Lf73;->b0()Lac1;

    move-result-object v0

    iget-object v1, p0, Lf73;->d:Lowc;

    iget-object v2, v1, Lowc;->e:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v3, v1, Lowc;->f:Lcom/opera/android/custom_views/StylingImageView;

    iget-object v4, v1, Lowc;->d:Landroid/widget/LinearLayout;

    iget-object v5, v1, Lowc;->i:Landroid/view/View;

    iget-object v6, v1, Lowc;->g:Landroid/widget/FrameLayout;

    iget-object v7, v0, Lac1;->c:Ljava/lang/Object;

    check-cast v7, Ljava/lang/CharSequence;

    iget v8, v0, Lac1;->a:I

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, v0, Lac1;->d:Ljava/lang/Object;

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    iget-object v9, v1, Lowc;->h:Lcom/opera/android/custom_views/StylingTextView;

    const/16 v10, 0x8

    const/4 v11, 0x0

    if-nez v7, :cond_33

    invoke-virtual {v9, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v9, v11}, Landroid/view/View;->setVisibility(I)V

    goto :goto_36

    :cond_33
    invoke-virtual {v9, v10}, Landroid/view/View;->setVisibility(I)V

    :goto_36
    new-instance v2, Le73;

    invoke-direct {v2, p0, p1, v11}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v2, p0, Lf73;->g:Le73;

    iget-object v2, p0, Lf73;->e:Ltah;

    iget-object v7, v2, Ltah;->d:Ljava/lang/Object;

    check-cast v7, Lydn;

    iget-object v7, v7, Lydn;->c:Lgfn;

    invoke-interface {v7}, Lgfn;->isEnabled()Z

    move-result v7

    const/4 v9, 0x1

    if-nez v7, :cond_62

    iget-boolean v7, p1, Lfdn;->e:Z

    if-nez v7, :cond_62

    iget-object v2, v2, Ltah;->j:Ljava/lang/Object;

    check-cast v2, Ljjg;

    invoke-virtual {v2}, Ljjg;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_62

    move v2, v9

    goto :goto_63

    :cond_62
    move v2, v11

    :goto_63
    if-nez v2, :cond_69

    if-eqz v8, :cond_69

    move v7, v9

    goto :goto_6a

    :cond_69
    move v7, v11

    :goto_6a
    if-eqz v2, :cond_8c

    new-instance v8, Ld73;

    const/4 v12, 0x2

    invoke-direct {v8, p0, v12}, Ld73;-><init>(Lf73;B)V

    iput-object v8, p0, Lf73;->f:Lr8n;

    invoke-virtual {v6, v11}, Landroid/view/View;->setVisibility(I)V

    iget-object v8, v1, Lowc;->b:Landroid/widget/LinearLayout;

    new-instance v11, Lgf;

    invoke-direct {v11, p0, p1}, Lgf;-><init>(Lf73;Lfdn;)V

    invoke-virtual {v8, v11}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v5, v10}, Landroid/view/View;->setVisibility(I)V

    const/4 v5, 0x0

    invoke-virtual {v6, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9e

    :cond_8c
    if-eqz v8, :cond_98

    invoke-virtual {v3, v8}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    invoke-virtual {v6, v11}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v5, v11}, Landroid/view/View;->setVisibility(I)V

    goto :goto_9e

    :cond_98
    invoke-virtual {v6, v10}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v5, v10}, Landroid/view/View;->setVisibility(I)V

    :goto_9e
    if-nez v2, :cond_aa

    new-instance v2, Lnf;

    const/16 v5, 0xc

    invoke-direct {v2, p0, p1, v5}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_aa
    if-eqz v7, :cond_b5

    iget-object p1, v0, Lac1;->e:Ljava/lang/Object;

    check-cast p1, Landroid/view/View$OnClickListener;

    if-eqz p1, :cond_b5

    invoke-virtual {v6, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_b5
    if-eqz v7, :cond_c2

    iget p1, v0, Lac1;->b:I

    if-eqz p1, :cond_c2

    new-instance p1, Le73;

    invoke-direct {p1, p0, v0, v9}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p1, p0, Lf73;->f:Lr8n;

    :cond_c2
    iget-object p1, p0, Lf73;->f:Lr8n;

    if-eqz p1, :cond_c9

    invoke-interface {p1, v3}, Lr8n;->a(Landroid/view/View;)V

    :cond_c9
    iget-object p0, p0, Lf73;->g:Le73;

    if-eqz p0, :cond_d2

    iget-object p1, v1, Lowc;->c:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, p1}, Le73;->a(Landroid/view/View;)V

    :cond_d2
    return-void
.end method

.method public final Y()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lf73;->f:Lr8n;

    iput-object v0, p0, Lf73;->g:Le73;

    return-void
.end method

.method public abstract b0()Lac1;
.end method

.method public abstract c0()Lfdn;
.end method
