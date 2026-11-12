.class public Lou8;
.super Llx8;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Ly9n;


# instance fields
.field public final d:Lr9i;

.field public final e:Lcom/opera/android/custom_views/StylingImageView;

.field public final f:Landroid/widget/TextView;

.field public final g:Landroid/widget/TextView;

.field public final h:Lcom/opera/android/custom_views/StylingTextView;

.field public final i:Lov0;

.field public final j:Lga6;


# direct methods
.method public constructor <init>(Lr9i;Landroid/view/View;)V
    .registers 4

    invoke-direct {p0, p2}, Lab2;-><init>(Landroid/view/View;)V

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object p1, p0, Lou8;->d:Lr9i;

    const p1, 0x7f0a0469

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    iput-object p1, p0, Lou8;->e:Lcom/opera/android/custom_views/StylingImageView;

    const v0, 0x7f0a046e

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/CardView;

    const v0, 0x7f0a0468

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lou8;->f:Landroid/widget/TextView;

    const v0, 0x7f0a046d

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lou8;->g:Landroid/widget/TextView;

    const v0, 0x7f0a046b

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iput-object v0, p0, Lou8;->h:Lcom/opera/android/custom_views/StylingTextView;

    const v0, 0x7f0a046a

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_4b

    invoke-static {v0}, Lov0;->d(Landroid/view/View;)Lov0;

    move-result-object v0

    goto :goto_4c

    :cond_4b
    const/4 v0, 0x0

    :goto_4c
    iput-object v0, p0, Lou8;->i:Lov0;

    invoke-static {p1, p2}, Lgu8;->i0(Landroid/view/View;Landroid/view/View;)Lga6;

    move-result-object p1

    iput-object p1, p0, Lou8;->j:Lga6;

    return-void
.end method


# virtual methods
.method public T(Landroid/view/View;II)V
    .registers 10

    iget-object p1, p0, Lab2;->b:Lja2;

    move-object v1, p1

    check-cast v1, Lj82;

    if-eqz v1, :cond_31

    iget-object v0, p0, Lou8;->d:Lr9i;

    iget-object v2, p0, Lou8;->i:Lov0;

    if-eqz v2, :cond_17

    invoke-virtual {p0}, Llx8;->c0()Lcmg;

    move-result-object v3

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lr9i;->c(Lj82;Lov0;Lcmg;II)V

    goto :goto_19

    :cond_17
    move v4, p2

    move v5, p3

    :goto_19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, v5}, Lr9i;->K(II)Z

    move-result p0

    if-eqz p0, :cond_27

    const/4 p0, 0x1

    invoke-virtual {v0, v1, p0}, Lr9i;->O(Lj82;Z)V

    return-void

    :cond_27
    const/16 p0, 0x21

    if-le v5, p0, :cond_31

    if-gt v4, p0, :cond_31

    const/4 p0, 0x0

    invoke-virtual {v0, v1, p0}, Lr9i;->O(Lj82;Z)V

    :cond_31
    return-void
.end method

.method public V(Lja2;Z)V
    .registers 5

    if-eqz p2, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p1

    check-cast p1, Lj82;

    check-cast p1, Lpue;

    iget-object p1, p1, Lj82;->c:Loqe;

    iget-object p2, p0, Lou8;->g:Landroid/widget/TextView;

    iget-object v0, p0, Lou8;->d:Lr9i;

    invoke-virtual {v0, p1}, Lr9i;->J(Loqe;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lou8;->h:Lcom/opera/android/custom_views/StylingTextView;

    if-eqz p2, :cond_23

    invoke-virtual {v0, p1}, Lr9i;->H(Loqe;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_23
    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p2

    check-cast p2, Lj82;

    iget-object v1, p0, Lou8;->f:Landroid/widget/TextView;

    invoke-static {v1, p2, v0}, Lgu8;->k0(Landroid/widget/TextView;Lj82;Lr9i;)V

    iget-object p2, p0, Lou8;->i:Lov0;

    invoke-static {p2, p1, v0, p0}, Lgu8;->l0(Lov0;Loqe;Lr9i;Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Lou8;->j:Lga6;

    invoke-virtual {v0, p1, p2}, Lr9i;->F(Loqe;Lga6;)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lou8;->e:Lcom/opera/android/custom_views/StylingImageView;

    invoke-static {p1, p0, p2}, Lgu8;->g0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;)V

    return-void
.end method

.method public final Y()V
    .registers 2

    iget-object p0, p0, Lou8;->e:Lcom/opera/android/custom_views/StylingImageView;

    sget-object v0, Lyne;->b:Ldeg;

    invoke-virtual {v0, p0}, Ldeg;->c(Landroid/widget/ImageView;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5

    iget-object v0, p0, Lab2;->b:Lja2;

    check-cast v0, Lj82;

    if-eqz v0, :cond_1d

    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object v2, p0, Lou8;->d:Lr9i;

    if-ne p1, v1, :cond_10

    invoke-virtual {v2, p0, v0}, Lr9i;->r(Llx8;Lj82;)V

    return-void

    :cond_10
    iget-object v1, p0, Lou8;->i:Lov0;

    if-eqz v1, :cond_1d

    iget-object v1, v1, Lov0;->b:Landroid/view/View;

    check-cast v1, Landroid/widget/LinearLayout;

    if-ne p1, v1, :cond_1d

    invoke-virtual {v2, p0, v0}, Lr9i;->N(Llx8;Lj82;)V

    :cond_1d
    return-void
.end method
