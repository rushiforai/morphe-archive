.class public final Lbv1;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final c:Ljava/lang/Object;

.field public d:Ljava/util/List;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lmu1;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lbv1;->a:B

    .line 26
    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    .line 27
    iput-object p1, p0, Lbv1;->c:Ljava/lang/Object;

    .line 28
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lbv1;->d:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lwr2;Z)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lbv1;->a:B

    iput-object p1, p0, Lbv1;->f:Ljava/lang/Object;

    iput-byte v0, p0, Lbv1;->a:B

    iput-object p1, p0, Lbv1;->e:Ljava/lang/Object;

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lbv1;->c:Ljava/lang/Object;

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object p1, p0, Lbv1;->d:Ljava/util/List;

    iput-boolean p2, p0, Lbv1;->b:Z

    return-void
.end method


# virtual methods
.method public final G(Ljava/lang/String;)I
    .registers 4

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1d

    iget-object v1, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/autofill/AutofillItem;

    iget-object v1, v1, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    return v0

    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1d
    const/4 p0, -0x1

    return p0
.end method

.method public final H(Ljava/lang/String;)V
    .registers 5

    invoke-virtual {p0, p1}, Lbv1;->G(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_7

    return-void

    :cond_7
    iget-object v1, p0, Lbv1;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    iget-object v2, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/autofill/AutofillItem;

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lbv1;->e:Ljava/lang/Object;

    check-cast v1, Lwr2;

    iget-object v1, v1, Lwr2;->u:Lcom/opera/android/undo/UndoBar;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/opera/android/undo/UndoBar;->c(Ljava/util/List;)V

    iget-object p1, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    iget-object p1, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_36

    const/4 p1, 0x0

    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/d;->notifyItemRangeRemoved(II)V

    return-void

    :cond_36
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/d;->notifyItemRemoved(I)V

    return-void
.end method

.method public final getItemCount()I
    .registers 2

    iget-byte v0, p0, Lbv1;->a:B

    packed-switch v0, :pswitch_data_22

    iget-object v0, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object p0, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_15

    const/4 p0, 0x1

    goto :goto_16

    :cond_15
    const/4 p0, 0x2

    :goto_16
    add-int/2addr v0, p0

    return v0

    :pswitch_18
    iget-object p0, p0, Lbv1;->d:Ljava/util/List;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method

.method public final getItemViewType(I)I
    .registers 3

    iget-byte v0, p0, Lbv1;->a:B

    packed-switch v0, :pswitch_data_2e

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->getItemViewType(I)I

    move-result p0

    return p0

    :pswitch_a
    if-gez p1, :cond_10

    if-nez p1, :cond_2a

    const/4 p0, -0x1

    goto :goto_2d

    :cond_10
    iget-object v0, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2c

    iget-object v0, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_22

    const/4 p0, 0x1

    goto :goto_2d

    :cond_22
    iget-object p0, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-ne p1, p0, :cond_2c

    :cond_2a
    const/4 p0, 0x2

    goto :goto_2d

    :cond_2c
    const/4 p0, 0x3

    :goto_2d
    return p0

    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 9

    iget-byte v0, p0, Lbv1;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_c2

    check-cast p1, Lct2;

    if-ltz p2, :cond_83

    iget-object v0, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p2, v0, :cond_67

    check-cast p1, Lvr2;

    iget-object p0, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/autofill/AutofillItem;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p0, Lcom/opera/android/autofill/Address;

    iget-object p2, p1, Lvr2;->b:Lvs;

    iget-object v0, p0, Lcom/opera/android/autofill/Address;->b:Ljava/lang/String;

    iget-object v3, p0, Lcom/opera/android/autofill/Address;->l:Ljava/lang/String;

    iget-object v4, p0, Lcom/opera/android/autofill/Address;->k:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_40

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3c

    const-string v5, ", "

    invoke-static {v3, v5}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_3c
    invoke-static {v3, v4}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_40
    iget-object v4, p2, Lvs;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p2, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p2, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    new-instance v3, Lur2;

    invoke-direct {v3, p1, p0, v2}, Lur2;-><init>(Lvr2;Lcom/opera/android/autofill/Address;B)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p2, Lvs;->d:Ljava/lang/Object;

    check-cast p2, Landroid/widget/ImageView;

    new-instance v0, Lur2;

    invoke-direct {v0, p1, p0, v1}, Lur2;-><init>(Lvr2;Lcom/opera/android/autofill/Address;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_83

    :cond_67
    iget-object v0, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_77

    iget-object v0, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-le p2, v0, :cond_83

    :cond_77
    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Lgf;

    const/16 v0, 0x11

    invoke-direct {p2, p0, v0}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_83
    :goto_83
    return-void

    :pswitch_84
    check-cast p1, Lav1;

    iget-object p0, p0, Lbv1;->d:Ljava/util/List;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf7j;

    iput-object p0, p1, Lav1;->c:Lf7j;

    iget-object p2, p1, Lav1;->b:Lcq3;

    iget-object p2, p2, Lcq3;->b:Landroid/view/View;

    check-cast p2, Lcom/opera/android/custom_views/ThemeSelector;

    iget-object v0, p1, Lav1;->d:Lbv1;

    const/4 v3, 0x0

    iput-object v3, p2, Lcom/opera/android/custom_views/ThemeSelector;->a:Lxj;

    iget-object v3, v0, Lbv1;->e:Ljava/lang/Object;

    check-cast v3, Lf7j;

    if-eq p0, v3, :cond_a4

    move v1, v2

    :cond_a4
    invoke-virtual {p2, v1}, Lcom/opera/android/custom_views/ThemeSelector;->setChecked(Z)V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    iget v1, p0, Lf7j;->a:I

    iget-object v2, p2, Lcom/opera/android/custom_views/ThemeSelector;->c:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p1, p0, p2}, Lav1;->U(Lf7j;Lcom/opera/android/custom_views/ThemeSelector;)V

    new-instance p1, Lxj;

    const/16 v1, 0xc

    invoke-direct {p1, v0, p0, v1}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p1, p2, Lcom/opera/android/custom_views/ThemeSelector;->a:Lxj;

    return-void

    :pswitch_data_c2
    .packed-switch 0x0
        :pswitch_84
    .end packed-switch
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 7

    iget-byte v0, p0, Lbv1;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_64

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v3, 0x1

    if-eq p2, v3, :cond_36

    const/4 p0, 0x2

    if-eq p2, p0, :cond_29

    const/4 p0, 0x3

    if-ne p2, p0, :cond_25

    new-instance v1, Lct2;

    const p0, 0x7f0d007e

    invoke-virtual {v0, p0, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-direct {v1, p0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    goto :goto_45

    :cond_25
    invoke-static {}, Lhai;->d()V

    goto :goto_45

    :cond_29
    new-instance v1, Lct2;

    const p0, 0x7f0d038d

    invoke-virtual {v0, p0, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-direct {v1, p0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    goto :goto_45

    :cond_36
    new-instance v1, Lvr2;

    iget-object p2, p0, Lbv1;->f:Ljava/lang/Object;

    check-cast p2, Lwr2;

    invoke-static {v0, p1}, Lvs;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lvs;

    move-result-object p1

    iget-boolean p0, p0, Lbv1;->b:Z

    invoke-direct {v1, p2, p1, p0}, Lvr2;-><init>(Lwr2;Lvs;Z)V

    :goto_45
    return-object v1

    :pswitch_46
    new-instance p2, Lav1;

    const v0, 0x7f0d0410

    invoke-static {p1, v0, p1, v2}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_5e

    new-instance v0, Lcq3;

    check-cast p1, Lcom/opera/android/custom_views/ThemeSelector;

    const/4 v1, 0x6

    invoke-direct {v0, p1, v1}, Lcq3;-><init>(Landroid/view/View;B)V

    invoke-direct {p2, p0, v0}, Lav1;-><init>(Lbv1;Lcq3;)V

    move-object v1, p2

    goto :goto_63

    :cond_5e
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_63
    return-object v1

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_46
    .end packed-switch
.end method

.method public final onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 3

    iget-byte v0, p0, Lbv1;->a:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewRecycled(Landroidx/recyclerview/widget/i;)V

    return-void

    :pswitch_9
    check-cast p1, Lav1;

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewRecycled(Landroidx/recyclerview/widget/i;)V

    const/4 p0, 0x0

    iput-object p0, p1, Lav1;->c:Lf7j;

    return-void

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
