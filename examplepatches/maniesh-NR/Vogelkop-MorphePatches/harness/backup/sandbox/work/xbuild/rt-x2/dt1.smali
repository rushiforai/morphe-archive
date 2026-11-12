.class public Ldt1;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x3

    iput-byte v0, p0, Ldt1;->a:B

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ldt1;->b:Ljava/lang/Object;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Ldt1;->c:Ljava/lang/Object;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ldt1;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Lit1;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Ldt1;->a:B

    .line 28
    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    .line 29
    iput-object p1, p0, Ldt1;->b:Ljava/lang/Object;

    .line 30
    iput-object p2, p0, Ldt1;->c:Ljava/lang/Object;

    .line 31
    iput-object p3, p0, Ldt1;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Liq2;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Ldt1;->a:B

    .line 35
    iput-object p1, p0, Ldt1;->d:Ljava/lang/Object;

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    .line 36
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Ldt1;->c:Ljava/lang/Object;

    .line 37
    new-array p1, v0, [I

    iput-object p1, p0, Ldt1;->b:Ljava/lang/Object;

    const/4 p1, 0x1

    .line 38
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    return-void
.end method

.method public constructor <init>(Lmu1;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Ldt1;->a:B

    .line 32
    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    .line 33
    iput-object p1, p0, Ldt1;->b:Ljava/lang/Object;

    .line 34
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ldt1;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final G(Ljava/lang/Object;)Lakj;
    .registers 6

    iget-object p0, p0, Ldt1;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lckj;

    if-eqz p0, :cond_2c

    iget-object p0, p0, Lckj;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_17
    if-ge v1, v0, :cond_2c

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lbkj;

    iget-object v3, v2, Lbkj;->b:Lzjj;

    invoke-interface {v3, p1}, Lzjj;->accept(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    iget-object p0, v2, Lbkj;->a:Lakj;

    return-object p0

    :cond_2c
    const-string p0, "No matching type for item"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final H(I)Ljava/lang/Object;
    .registers 3

    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    if-ltz p1, :cond_13

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-gt p1, v0, :cond_13

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_13
    const/4 p0, 0x0

    return-object p0
.end method

.method public final I(Ljava/lang/Class;Lyjj;Lxjj;)V
    .registers 6

    new-instance v0, La3j;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, La3j;-><init>(B)V

    invoke-virtual {p0, p1, p2, p3, v0}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    return-void
.end method

.method public final J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V
    .registers 7

    iget-object v0, p0, Ldt1;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object p0, p0, Ldt1;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_16

    new-instance v1, Lckj;

    invoke-direct {v1}, Lckj;-><init>()V

    invoke-interface {p0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_16
    check-cast v1, Lckj;

    new-instance p0, Lakj;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    invoke-direct {p0, p1, p2, p3}, Lakj;-><init>(ILyjj;Lxjj;)V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p1, v1, Lckj;->a:Ljava/util/ArrayList;

    new-instance p2, Lbkj;

    invoke-direct {p2, p0, p4}, Lbkj;-><init>(Lakj;Lzjj;)V

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final K(Ljava/util/Collection;)V
    .registers 3

    iget-object v0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    return-void
.end method

.method public final L(Ljava/util/List;Lo87;)V
    .registers 4

    new-instance v0, Leme;

    invoke-direct {v0, p0}, Leme;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-interface {p2, p0, p1}, Lo87;->r(Ljava/util/List;Ljava/util/List;)Lj87;

    move-result-object p2

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    check-cast p1, Ljava/util/Collection;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p2, v0}, Lj87;->a(Lsic;)V

    return-void
.end method

.method public final M(Lg7j;Z)V
    .registers 6

    iget-object v0, p0, Ldt1;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast v1, Lg7j;

    if-eq v1, p1, :cond_21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    iput-object p1, p0, Ldt1;->d:Ljava/lang/Object;

    const/4 v2, -0x1

    if-le v1, v2, :cond_16

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_16
    if-nez p2, :cond_21

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-le p1, v2, :cond_21

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_21
    return-void
.end method

.method public final getItemCount()I
    .registers 2

    iget-byte v0, p0, Ldt1;->a:B

    packed-switch v0, :pswitch_data_2c

    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_e
    iget-object p0, p0, Ldt1;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    add-int/lit8 p0, p0, 0x3

    return p0

    :pswitch_19
    iget-object p0, p0, Ldt1;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_22
    iget-object p0, p0, Ldt1;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_22
        :pswitch_19
        :pswitch_e
    .end packed-switch
.end method

.method public getItemId(I)J
    .registers 6

    iget-byte v0, p0, Ldt1;->a:B

    packed-switch v0, :pswitch_data_30

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->getItemId(I)J

    move-result-wide p0

    return-wide p0

    :pswitch_a
    iget-object v0, p0, Ldt1;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object p0, p0, Ldt1;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    if-ge p1, v0, :cond_24

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfw;

    iget-object p0, p0, Lfw;->a:Lew;

    iget-byte p0, p0, Lew;->a:B

    int-to-long p0, p0

    goto :goto_2e

    :cond_24
    const-wide/16 v0, -0x1

    int-to-long v2, p1

    sub-long/2addr v0, v2

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    int-to-long p0, p0

    add-long/2addr p0, v0

    :goto_2e
    return-wide p0

    nop

    :pswitch_data_30
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method

.method public final getItemViewType(I)I
    .registers 6

    iget-byte v0, p0, Ldt1;->a:B

    packed-switch v0, :pswitch_data_60

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->getItemViewType(I)I

    move-result p0

    return p0

    :pswitch_a
    iget-object v0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1}, Ldt1;->G(Ljava/lang/Object;)Lakj;

    move-result-object p0

    iget p0, p0, Lakj;->a:I

    return p0

    :pswitch_19
    iget-object v0, p0, Ldt1;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Ldt1;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-ge p1, v0, :cond_4e

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lfw;

    iget-object p1, p1, Lfw;->a:Lew;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_4c

    if-ne p1, v3, :cond_5e

    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Liq2;

    iget-boolean p1, p0, Liq2;->E:Z

    if-nez p1, :cond_43

    move p0, v3

    goto :goto_4a

    :cond_43
    iget-object p0, p0, Liq2;->D:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v3

    :goto_4a
    if-eqz p0, :cond_5e

    :cond_4c
    move v2, v3

    goto :goto_5e

    :cond_4e
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p0

    sub-int/2addr p1, p0

    if-eqz p1, :cond_5d

    if-eq p1, v3, :cond_5b

    if-ne p1, v2, :cond_5e

    const/4 v2, 0x5

    goto :goto_5e

    :cond_5b
    const/4 v2, 0x4

    goto :goto_5e

    :cond_5d
    const/4 v2, 0x3

    :cond_5e
    :goto_5e
    return v2

    nop

    :pswitch_data_60
    .packed-switch 0x2
        :pswitch_19
        :pswitch_a
    .end packed-switch
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    iget-byte v3, v0, Ldt1;->a:B

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    packed-switch v3, :pswitch_data_24e

    iget-object v3, v0, Ldt1;->d:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ldt1;->G(Ljava/lang/Object;)Lakj;

    move-result-object v0

    iget-object v0, v0, Lakj;->c:Lxjj;

    invoke-interface {v0, v2, v1}, Lxjj;->i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V

    return-void

    :pswitch_20
    check-cast v1, Lhq2;

    iget-object v3, v0, Ldt1;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_3d

    check-cast v1, Ltp2;

    iget-object v0, v0, Ldt1;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfw;

    invoke-virtual {v1, v0}, Ltp2;->V(Lfw;)V

    goto/16 :goto_f5

    :cond_3d
    iget-object v0, v0, Ldt1;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    sub-int v0, v2, v0

    const/4 v2, 0x2

    const-string v3, "*"

    if-eqz v0, :cond_a6

    if-eq v0, v6, :cond_6d

    if-ne v0, v2, :cond_f5

    check-cast v1, Lcq2;

    iget-object v0, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, v1, Lcq2;->b:Liq2;

    iget-object v1, v1, Liq2;->K:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_62

    const/16 v5, 0x8

    :cond_62
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    const v1, 0x7f140cba

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto/16 :goto_f5

    :cond_6d
    check-cast v1, Lxp2;

    iget-object v0, v1, Lxp2;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, v1, Lxp2;->c:Liq2;

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f140201

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v2, Liq2;->K:Ljava/util/HashSet;

    sget-object v7, Lyp2;->b:Lyp2;

    invoke-virtual {v5, v7}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8c

    invoke-static {v4, v3}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :cond_8c
    invoke-virtual {v0, v4}, Lcom/google/android/material/textfield/TextInputLayout;->t(Ljava/lang/CharSequence;)V

    iget-object v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    const/16 v4, 0x21

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setInputType(I)V

    iget-object v2, v2, Liq2;->I:Ljava/lang/String;

    invoke-static {v0, v2}, Lq9n;->F(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    new-instance v2, Lmj2;

    invoke-direct {v2, v1, v6}, Lmj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    goto :goto_f5

    :cond_a6
    check-cast v1, Laq2;

    iget-object v0, v1, Laq2;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v4, v1, Laq2;->c:Liq2;

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f140205

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v4, Liq2;->K:Ljava/util/HashSet;

    sget-object v8, Lyp2;->d:Lyp2;

    invoke-virtual {v7, v8}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c5

    invoke-static {v6, v3}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :cond_c5
    invoke-virtual {v0, v6}, Lcom/google/android/material/textfield/TextInputLayout;->t(Ljava/lang/CharSequence;)V

    iget-object v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    const/4 v6, 0x3

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setInputType(I)V

    iget-object v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    iget-object v6, v4, Liq2;->w:Lkdg;

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    new-instance v6, Lzp2;

    invoke-direct {v6, v1, v5}, Lzp2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v6}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iget-object v3, v1, Laq2;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v5, v4, Liq2;->J:Ljava/lang/String;

    invoke-virtual {v3, v5}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    iget-object v3, v4, Liq2;->H:Ljava/lang/String;

    invoke-static {v0, v3}, Lq9n;->F(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    iget-object v0, v0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    new-instance v3, Lmj2;

    invoke-direct {v3, v1, v2}, Lmj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    :cond_f5
    :goto_f5
    return-void

    :pswitch_f6
    check-cast v1, Lzu1;

    iget-object v0, v0, Ldt1;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lg7j;

    iput-object v0, v1, Lzu1;->c:Lg7j;

    iget-object v2, v1, Lzu1;->b:Lcq3;

    iget-object v2, v2, Lcq3;->b:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/AccentSelector;

    iget-object v1, v1, Lzu1;->d:Ldt1;

    iput-object v4, v2, Lcom/opera/android/custom_views/AccentSelector;->a:Lxj;

    iget-object v3, v1, Ldt1;->d:Ljava/lang/Object;

    check-cast v3, Lg7j;

    if-ne v0, v3, :cond_115

    move v5, v6

    :cond_115
    invoke-virtual {v2, v5}, Lcom/opera/android/custom_views/AccentSelector;->setChecked(Z)V

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-static {v0, v2}, Lzu1;->U(Lg7j;Lcom/opera/android/custom_views/AccentSelector;)V

    new-instance v3, Lxj;

    const/16 v4, 0xb

    invoke-direct {v3, v1, v0, v4}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v3, v2, Lcom/opera/android/custom_views/AccentSelector;->a:Lxj;

    return-void

    :pswitch_12c
    check-cast v1, Lct1;

    iget-object v0, v0, Ldt1;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ShortcutInfo;

    iget-object v2, v1, Lct1;->b:Lbt1;

    iget-object v3, v1, Lct1;->c:Ldt1;

    iget-object v5, v3, Ldt1;->d:Ljava/lang/Object;

    check-cast v5, Lit1;

    invoke-virtual {v0}, Landroid/content/pm/ShortcutInfo;->getShortLabel()Ljava/lang/CharSequence;

    move-result-object v6

    if-eqz v6, :cond_24c

    iget-object v7, v2, Lbt1;->c:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v2, v2, Lbt1;->d:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v4}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0}, Landroid/content/pm/ShortcutInfo;->getIntent()Landroid/content/Intent;

    move-result-object v7

    if-eqz v7, :cond_15b

    invoke-virtual {v7}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    goto :goto_15c

    :cond_15b
    move-object v7, v4

    :goto_15c
    const-string v8, "android.intent.action.VIEW"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    const/high16 v9, 0x42200000    # 40.0f

    if-nez v8, :cond_22a

    const-string v8, "com.opera.android.ACTION_START_WEBAPP"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_22a

    if-eqz v7, :cond_1fb

    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_258

    goto/16 :goto_1fb

    :sswitch_179
    const-string v0, "com.opera.android.action.AI_ASSISTANT_FROM_SHORTCUT_WIDGET"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1fb

    const v0, 0x7f0803ec

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto/16 :goto_1fb

    :sswitch_18a
    const-string v0, "com.opera.android.action.SCAN_QR_CODE"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d4

    goto :goto_1fb

    :sswitch_193
    const-string v0, "com.opera.android.action.SEARCH"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a4

    goto :goto_1fb

    :sswitch_19c
    const-string v0, "com.opera.android.action.SEARCH_FROM_SHORTCUT_WIDGET"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1fb

    :cond_1a4
    const v0, 0x7f080421

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_1fb

    :sswitch_1ac
    const-string v0, "com.opera.android.action.NEW_PRIVATE_TAB"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1fb

    const v0, 0x7f08041d

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_1fb

    :sswitch_1bc
    const-string v0, "com.opera.android.action.UNINSTALL_SHORTCUT"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1fb

    const v0, 0x7f080422

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_1fb

    :sswitch_1cc
    const-string v0, "com.opera.android.action.SCAN_QR_CODE_FROM_SHORTCUT_WIDGET"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1fb

    :cond_1d4
    const v0, 0x7f080420

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_1fb

    :sswitch_1dc
    const-string v0, "com.opera.android.action.NEW_TAB"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1fb

    const v0, 0x7f08041e

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_1fb

    :sswitch_1ec
    const-string v0, "com.opera.android.action.PASSWORD_MANAGER"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1fb

    const v0, 0x7f08041f

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    :cond_1fb
    :goto_1fb
    if-eqz v4, :cond_205

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v2, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    goto :goto_24c

    :cond_205
    iget-object v0, v3, Ldt1;->b:Ljava/lang/Object;

    move-object v10, v0

    check-cast v10, Landroid/content/Context;

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    sget v0, Lvmj;->g:I

    invoke-static {v10}, Ltmj;->i(Landroid/content/Context;)I

    move-result v13

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v9, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v14

    sget-object v15, Lna5;->b:Lna5;

    const/16 v16, 0x1

    sget-object v12, Lumj;->d:Lumj;

    invoke-static/range {v10 .. v16}, Ltmj;->l(Landroid/content/Context;Ljava/lang/String;Lumj;IILna5;Z)Lvmj;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_24c

    :cond_22a
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lit1;->a(Landroid/content/pm/ShortcutInfo;)Ljava/lang/String;

    move-result-object v0

    new-instance v8, Lqb7;

    invoke-direct {v8, v1, v3, v0}, Lqb7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, v5, Lit1;->a:Landroid/content/Context;

    if-eqz v0, :cond_24c

    new-instance v3, Lghf;

    invoke-static {v1}, Lcqp;->f0(Landroid/content/Context;)Lpne;

    move-result-object v4

    invoke-static {v1, v9}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v6

    iget-object v7, v5, Lit1;->b:Lumi;

    const-wide/16 v9, 0xbb8

    move-object v5, v0

    invoke-direct/range {v3 .. v10}, Lghf;-><init>(Lpne;Ljava/lang/String;ILumi;Lbnj;J)V

    :cond_24c
    :goto_24c
    return-void

    nop

    :pswitch_data_24e
    .packed-switch 0x0
        :pswitch_12c
        :pswitch_f6
        :pswitch_20
    .end packed-switch

    :sswitch_data_258
    .sparse-switch
        -0x5f7230a6 -> :sswitch_1ec
        -0x5b4ae05b -> :sswitch_1dc
        -0x33c0a693 -> :sswitch_1cc
        -0x33676bac -> :sswitch_1bc
        -0x2c279937 -> :sswitch_1ac
        -0x1899de12 -> :sswitch_19c
        -0x133a0fa7 -> :sswitch_193
        0xfc2277a -> :sswitch_18a
        0x2d77764f -> :sswitch_179
    .end sparse-switch
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 9

    iget-byte v0, p0, Ldt1;->a:B

    const/4 v1, 0x5

    const/4 v2, 0x0

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_c8

    iget-object p0, p0, Ldt1;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lakj;

    iget-object p0, p0, Lakj;->b:Lyjj;

    invoke-interface {p0, p1}, Lyjj;->c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;

    move-result-object p0

    return-object p0

    :pswitch_19
    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Liq2;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v4, 0x1

    if-eq p2, v4, :cond_61

    const/4 v4, 0x2

    const v5, 0x7f0d0070

    if-eq p2, v4, :cond_57

    const/4 v4, 0x3

    if-eq p2, v4, :cond_4d

    const/4 v4, 0x4

    if-eq p2, v4, :cond_43

    if-ne p2, v1, :cond_6d

    new-instance v2, Lcq2;

    const p2, 0x7f0d0071

    invoke-virtual {v0, p2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {v2, p0, p1}, Lcq2;-><init>(Liq2;Landroid/view/View;)V

    goto :goto_6d

    :cond_43
    new-instance v2, Lxp2;

    invoke-virtual {v0, v5, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {v2, p0, p1}, Lxp2;-><init>(Liq2;Landroid/view/View;)V

    goto :goto_6d

    :cond_4d
    new-instance v2, Laq2;

    invoke-virtual {v0, v5, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {v2, p0, p1}, Laq2;-><init>(Liq2;Landroid/view/View;)V

    goto :goto_6d

    :cond_57
    new-instance v2, Lwp2;

    invoke-virtual {v0, v5, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {v2, p0, p1}, Lwp2;-><init>(Liq2;Landroid/view/View;)V

    goto :goto_6d

    :cond_61
    new-instance v2, Lfq2;

    const p2, 0x7f0d0072

    invoke-virtual {v0, p2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {v2, p0, p1}, Lfq2;-><init>(Liq2;Landroid/view/View;)V

    :cond_6d
    :goto_6d
    return-object v2

    :pswitch_6e
    new-instance p2, Lzu1;

    const v0, 0x7f0d040e

    invoke-static {p1, v0, p1, v3}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_85

    new-instance v0, Lcq3;

    check-cast p1, Lcom/opera/android/custom_views/AccentSelector;

    invoke-direct {v0, p1, v1}, Lcq3;-><init>(Landroid/view/View;B)V

    invoke-direct {p2, p0, v0}, Lzu1;-><init>(Ldt1;Lcq3;)V

    move-object v2, p2

    goto :goto_8a

    :cond_85
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_8a
    return-object v2

    :pswitch_8b
    const p2, 0x7f0d0057

    invoke-static {p1, p2, p1, v3}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a0a4d

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v0, :cond_b5

    const p2, 0x7f0a0a4e

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_b5

    new-instance p2, Lbt1;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-direct {p2, p1, v0, v1, v3}, Lbt1;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;B)V

    new-instance v2, Lct1;

    invoke-direct {v2, p0, p2}, Lct1;-><init>(Ldt1;Lbt1;)V

    goto :goto_c6

    :cond_b5
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_c6
    return-object v2

    nop

    :pswitch_data_c8
    .packed-switch 0x0
        :pswitch_8b
        :pswitch_6e
        :pswitch_19
    .end packed-switch
.end method

.method public onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 3

    iget-byte v0, p0, Ldt1;->a:B

    packed-switch v0, :pswitch_data_10

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewRecycled(Landroidx/recyclerview/widget/i;)V

    return-void

    :pswitch_9
    check-cast p1, Lhq2;

    invoke-virtual {p1}, Lhq2;->U()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x2
        :pswitch_9
    .end packed-switch
.end method
