.class public Ly5m;
.super Lz5m;
.source "SourceFile"


# instance fields
.field public final c:Lcom/opera/android/custom_views/StylingImageView;

.field public final d:Landroid/widget/TextView;

.field public final e:Lcom/opera/android/custom_views/StylingTextView;

.field public final synthetic f:Lfl3;


# direct methods
.method public constructor <init>(Lfl3;Landroid/view/View;)V
    .registers 6

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ly5m;->f:Lfl3;

    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    const v0, 0x7f0a05b8

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    iput-object v0, p0, Ly5m;->c:Lcom/opera/android/custom_views/StylingImageView;

    const v1, 0x7f0a05bf

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    iput-object v1, p0, Ly5m;->e:Lcom/opera/android/custom_views/StylingTextView;

    const v1, 0x7f0a05b3

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Ly5m;->d:Landroid/widget/TextView;

    new-instance v1, Lj5g;

    const/16 v2, 0x19

    invoke-direct {v1, p0, p1, v2}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Lks8;

    const/4 v2, 0x2

    invoke-direct {p1, v1, v2}, Lks8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lsvk;

    const/16 p2, 0xc

    invoke-direct {p1, p0, p2}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, p1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public U(Lll3;)V
    .registers 8

    iput-object p1, p0, Lz5m;->b:Lll3;

    iget-object v0, p0, Ly5m;->f:Lfl3;

    invoke-virtual {v0, p1}, Lfl3;->I0(Lll3;)Z

    move-result v0

    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p0, p1}, Ly5m;->Y(Lll3;)V

    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1, v1}, Lll3;->c(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/16 v3, 0x8

    iget-object v4, p0, Ly5m;->e:Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v4, :cond_31

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2b

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_31

    :cond_2b
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_31
    :goto_31
    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1, v1}, Lll3;->a(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Ly5m;->d:Landroid/widget/TextView;

    if-eqz v1, :cond_4f

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_49

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_4f

    :cond_49
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_4f
    :goto_4f
    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-eqz v0, :cond_56

    sget-object p1, Lq9n;->c:Ll5b;

    goto :goto_58

    :cond_56
    sget-object p1, Lq9n;->d:Ll5b;

    :goto_58
    invoke-static {p0, p1}, Lq9n;->I(Landroid/view/View;Lp9n;)V

    return-void
.end method

.method public X()V
    .registers 2

    iget-object v0, p0, Lz5m;->b:Lll3;

    if-eqz v0, :cond_7

    invoke-virtual {p0, v0}, Ly5m;->Y(Lll3;)V

    :cond_7
    return-void
.end method

.method public final Y(Lll3;)V
    .registers 4

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lll3;->b(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Ly5m;->c:Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v1, :cond_26

    invoke-virtual {v1, v0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p0, p0, Ly5m;->f:Lfl3;

    invoke-virtual {p0, p1}, Lfl3;->I0(Lll3;)Z

    move-result p0

    if-nez p0, :cond_20

    const p0, 0x3e3851ec    # 0.18f

    invoke-virtual {v1, p0}, Landroid/view/View;->setAlpha(F)V

    return-void

    :cond_20
    const/high16 p0, 0x3f800000    # 1.0f

    invoke-virtual {v1, p0}, Landroid/view/View;->setAlpha(F)V

    return-void

    :cond_26
    if-eqz v0, :cond_30

    iget-object p0, p0, Ly5m;->e:Lcom/opera/android/custom_views/StylingTextView;

    if-eqz p0, :cond_30

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/opera/android/custom_views/StylingTextView;->s(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_30
    return-void
.end method
