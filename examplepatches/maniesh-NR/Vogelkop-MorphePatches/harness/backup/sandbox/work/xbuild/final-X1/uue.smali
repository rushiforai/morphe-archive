.class public Luue;
.super Lgu8;
.source "SourceFile"


# instance fields
.field public final synthetic m:B

.field public final n:Ljava/lang/Object;

.field public final o:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/view/View;Lr9i;Lp0c;Lumi;)V
    .registers 13

    const/4 v0, 0x1

    iput-byte v0, p0, Luue;->m:B

    invoke-direct {p0, p1, p2, p3}, Lgu8;-><init>(Landroid/view/View;Lr9i;Lp0c;)V

    const p3, 0x7f0a0463

    invoke-static {p3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_b5

    invoke-static {v1}, Lov0;->d(Landroid/view/View;)Lov0;

    move-result-object v4

    const p3, 0x7f0a0466

    invoke-static {p3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v5, :cond_b5

    const p3, 0x7f0a0c93

    invoke-static {p3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lcom/opera/android/view/TouchIgnoringViewPager;

    if-eqz v6, :cond_b5

    const p3, 0x7f0a0cd7

    invoke-static {p3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v7, :cond_b5

    new-instance v2, Lvs;

    move-object v3, p1

    check-cast v3, Lcom/opera/android/custom_views/CardView;

    invoke-direct/range {v2 .. v7}, Lvs;-><init>(Lcom/opera/android/custom_views/CardView;Lov0;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/view/TouchIgnoringViewPager;Lcom/opera/android/custom_views/StylingImageView;)V

    iput-object v2, p0, Luue;->n:Ljava/lang/Object;

    new-instance p1, Ll8i;

    iget-object p2, p2, Lr9i;->b:Ljava/lang/Object;

    check-cast p2, Luqe;

    invoke-direct {p1, p4, v6, p2}, Ll8i;-><init>(Lumi;Lcom/opera/android/view/TouchIgnoringViewPager;Luqe;)V

    iput-object p1, p0, Luue;->o:Ljava/lang/Object;

    new-instance p2, Lm8i;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lm8i;-><init>(Luue;B)V

    invoke-static {v3}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p3

    if-eqz p3, :cond_5b

    invoke-static {p3, v3, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_5b
    new-instance p2, Lm8i;

    invoke-direct {p2, p0, v0}, Lm8i;-><init>(Luue;B)V

    invoke-static {v7}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p3

    if-eqz p3, :cond_69

    invoke-static {p3, v7, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_69
    new-instance p2, Lm8i;

    const/4 p3, 0x2

    invoke-direct {p2, p0, p3}, Lm8i;-><init>(Luue;B)V

    invoke-static {v5}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p3

    if-eqz p3, :cond_78

    invoke-static {p3, v5, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_78
    iget-object p2, v4, Lov0;->b:Landroid/view/View;

    check-cast p2, Landroid/widget/LinearLayout;

    new-instance p3, Lm8i;

    const/4 p4, 0x3

    invoke-direct {p3, p0, p4}, Lm8i;-><init>(Luue;B)V

    invoke-static {p2}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p4

    if-eqz p4, :cond_8b

    invoke-static {p4, p2, p3}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_8b
    iget-object p2, v4, Lov0;->d:Ljava/lang/Object;

    check-cast p2, Landroid/widget/ImageView;

    new-instance p3, Lm8i;

    const/4 p4, 0x4

    invoke-direct {p3, p0, p4}, Lm8i;-><init>(Luue;B)V

    invoke-static {p2}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p4

    if-eqz p4, :cond_9e

    invoke-static {p4, p2, p3}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_9e
    iget-object p2, v4, Lov0;->c:Ljava/lang/Object;

    check-cast p2, Landroid/widget/TextView;

    new-instance p3, Lm8i;

    const/4 p4, 0x5

    invoke-direct {p3, p0, p4}, Lm8i;-><init>(Luue;B)V

    invoke-static {p2}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-eqz p0, :cond_b1

    invoke-static {p0, p2, p3}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_b1
    invoke-virtual {v6, p1}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    return-void

    :cond_b5
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Landroid/view/View;Lr9i;Lrl3;Lp0c;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Luue;->m:B

    .line 200
    invoke-direct {p0, p1, p2, p4}, Lgu8;-><init>(Landroid/view/View;Lr9i;Lp0c;)V

    const p2, 0x7f0a0462

    .line 201
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Luue;->n:Ljava/lang/Object;

    .line 202
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 203
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    const p2, 0x7f0a0464

    .line 204
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 205
    iput-object p3, p0, Luue;->o:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final U()I
    .registers 2

    iget-byte v0, p0, Luue;->m:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0}, Lab2;->U()I

    move-result p0

    return p0

    :pswitch_a
    const/4 p0, -0x1

    return p0

    :pswitch_data_c
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public V(Lja2;Z)V
    .registers 11

    iget-byte v0, p0, Luue;->m:B

    packed-switch v0, :pswitch_data_130

    invoke-super {p0, p1, p2}, Lgu8;->V(Lja2;Z)V

    return-void

    :pswitch_9
    invoke-super {p0, p1, p2}, Lgu8;->V(Lja2;Z)V

    if-nez p2, :cond_12e

    const/4 p1, 0x0

    const/4 p2, 0x0

    iget-object v0, p0, Lgu8;->i:Lov0;

    if-eqz v0, :cond_24

    iget-object v0, v0, Lov0;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, p2}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setFocusable(Z)V

    :cond_24
    iget-object v0, p0, Luue;->n:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lgu8;->e0()Loqe;

    move-result-object v2

    check-cast v2, Ld9i;

    iget-object v3, v2, Lmsh;->z:Lxlg;

    iget-object v4, p0, Lgu8;->d:Lr9i;

    if-eqz v3, :cond_75

    iget-object v3, v3, Lxlg;->k:Ljava/lang/Long;

    if-eqz v3, :cond_75

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    sget-object v3, Lpn7;->b:Lon7;

    sget-object v3, Lun7;->e:Lun7;

    invoke-static {v5, v6, v3}, Lcs5;->y0(JLun7;)J

    move-result-wide v5

    invoke-static {v5, v6}, Lpn7;->f(J)J

    move-result-wide v5

    const/16 v3, 0x18

    invoke-static {v1, v5, v6, v3}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v2}, Lr9i;->J(Loqe;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "\n"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    filled-new-array {v3, v5}, [Ljava/lang/Object;

    move-result-object v3

    const v5, 0x7f140b2d

    invoke-virtual {v1, v5, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_79

    :cond_75
    invoke-virtual {v4, v2}, Lr9i;->J(Loqe;)Ljava/lang/String;

    move-result-object v1

    :cond_79
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Luue;->o0()V

    invoke-virtual {p0}, Luue;->p0()V

    invoke-virtual {p0}, Luue;->t0()V

    invoke-virtual {p0}, Luue;->q0()V

    invoke-virtual {p0}, Luue;->s0()V

    invoke-virtual {p0}, Luue;->r0()V

    iget-object v0, p0, Luue;->o:Ljava/lang/Object;

    check-cast v0, Ll8i;

    invoke-virtual {p0}, Luue;->n0()Lxlg;

    move-result-object p0

    if-eqz p0, :cond_9c

    iget-object p0, p0, Lxlg;->c:Ljava/util/List;

    if-nez p0, :cond_9e

    :cond_9c
    sget-object p0, Ll08;->a:Ll08;

    :cond_9e
    iget-object v1, v0, Ll8i;->f:Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x3

    const/4 v4, 0x1

    if-lt v2, v3, :cond_aa

    move v2, v4

    goto :goto_ab

    :cond_aa
    move v2, p1

    :goto_ab
    iput-boolean v2, v0, Ll8i;->g:Z

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-boolean v2, v0, Ll8i;->g:Z

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    if-eqz v2, :cond_111

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    new-instance v5, Lk8i;

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->Q(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-direct {v5, p1, v6}, Lk8i;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v5, p0

    check-cast v5, Ljava/lang/Iterable;

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_d2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_f0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v7, p1, 0x1

    if-ltz p1, :cond_ec

    check-cast v6, Ljava/lang/String;

    new-instance p1, Lk8i;

    invoke-direct {p1, v7, v6}, Lk8i;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move p1, v7

    goto :goto_d2

    :cond_ec
    invoke-static {}, Lj95;->n()V

    throw p2

    :cond_f0
    new-instance p1, Lk8i;

    add-int/lit8 p2, v2, 0x1

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {p1, p2, v5}, Lk8i;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Lk8i;

    add-int/lit8 v2, v2, 0x2

    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-direct {p1, v2, p0}, Lk8i;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_128

    :cond_111
    move-object p2, p0

    check-cast p2, Ljava/util/Collection;

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_128

    new-instance p2, Lk8i;

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-direct {p2, p1, p0}, Lk8i;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_128
    :goto_128
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->notifyDataSetChanged()V

    :cond_12e
    return-void

    nop

    :pswitch_data_130
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public Y()V
    .registers 2

    iget-byte v0, p0, Luue;->m:B

    packed-switch v0, :pswitch_data_22

    invoke-super {p0}, Lgu8;->Y()V

    return-void

    :pswitch_9
    iget-object p0, p0, Luue;->o:Ljava/lang/Object;

    check-cast p0, Ll8i;

    iget-object v0, p0, Ll8i;->e:Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    iget-object v0, p0, Ll8i;->d:Lghf;

    iget-object v0, v0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_1d

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_1d
    const/4 v0, 0x0

    iput-boolean v0, p0, Ll8i;->g:Z

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final c0()Lcmg;
    .registers 2

    iget-byte v0, p0, Luue;->m:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0}, Llx8;->c0()Lcmg;

    move-result-object p0

    return-object p0

    :pswitch_a
    sget-object p0, Lcmg;->b:Lcmg;

    return-object p0

    nop

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public bridge synthetic e0()Loqe;
    .registers 2

    iget-byte v0, p0, Luue;->m:B

    packed-switch v0, :pswitch_data_10

    invoke-super {p0}, Lgu8;->e0()Loqe;

    move-result-object p0

    return-object p0

    :pswitch_a
    invoke-virtual {p0}, Luue;->m0()Lmsh;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public m0()Lmsh;
    .registers 1

    invoke-super {p0}, Lgu8;->e0()Loqe;

    move-result-object p0

    check-cast p0, Lmsh;

    return-object p0
.end method

.method public final n0()Lxlg;
    .registers 3

    iget-object p0, p0, Lab2;->b:Lja2;

    check-cast p0, Lj82;

    const/4 v0, 0x0

    if-eqz p0, :cond_c

    check-cast p0, Lpue;

    iget-object p0, p0, Lj82;->c:Loqe;

    goto :goto_d

    :cond_c
    move-object p0, v0

    :goto_d
    instance-of v1, p0, Ld9i;

    if-eqz v1, :cond_14

    check-cast p0, Ld9i;

    goto :goto_15

    :cond_14
    move-object p0, v0

    :goto_15
    if-eqz p0, :cond_1a

    iget-object p0, p0, Lmsh;->z:Lxlg;

    return-object p0

    :cond_1a
    return-object v0
.end method

.method public final o0()V
    .registers 4

    iget-object v0, p0, Luue;->n:Ljava/lang/Object;

    check-cast v0, Lvs;

    invoke-virtual {p0}, Luue;->n0()Lxlg;

    move-result-object p0

    if-eqz p0, :cond_2a

    iget-object v1, v0, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v1, Lcom/opera/android/custom_views/CardView;

    sget-object v2, Le9i;->f:Lwu5;

    iget-object p0, p0, Lxlg;->m:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lwu5;->h(Ljava/lang/String;)Le9i;

    move-result-object p0

    iget-object p0, p0, Le9i;->c:Ldxh;

    iget-object v0, v0, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v0, Lcom/opera/android/custom_views/CardView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {v1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_2a
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 7

    iget-byte v0, p0, Luue;->m:B

    packed-switch v0, :pswitch_data_3c

    invoke-super {p0, p1}, Lgu8;->onClick(Landroid/view/View;)V

    return-void

    :pswitch_9
    invoke-super {p0, p1}, Lgu8;->onClick(Landroid/view/View;)V

    iget-object v0, p0, Lab2;->b:Lja2;

    check-cast v0, Lj82;

    if-eqz v0, :cond_3a

    iget-object v0, p0, Luue;->n:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    if-ne p1, v0, :cond_3a

    invoke-virtual {p0}, Luue;->m0()Lmsh;

    move-result-object v0

    new-instance v1, Lvy8;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, v2}, Lvy8;-><init>(Luue;Lmsh;B)V

    new-instance v2, Lvy8;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v0, v3}, Lvy8;-><init>(Luue;Lmsh;B)V

    new-instance v3, Lvy8;

    const/4 v4, 0x2

    invoke-direct {v3, p0, v0, v4}, Lvy8;-><init>(Luue;Lmsh;B)V

    invoke-static {v0, v1, v2, v3}, Lk1g;->y(Lmsh;Lox8;Lox8;Lox8;)Ljava/util/ArrayList;

    move-result-object p0

    new-instance v0, Lcij;

    invoke-direct {v0, p1, p0}, Lcij;-><init>(Landroid/view/View;Ljava/util/ArrayList;)V

    invoke-static {v0}, Lac8;->a(Ljava/lang/Object;)V

    :cond_3a
    return-void

    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final p0()V
    .registers 5

    iget-object v0, p0, Luue;->n:Ljava/lang/Object;

    check-cast v0, Lvs;

    invoke-virtual {p0}, Luue;->n0()Lxlg;

    move-result-object p0

    if-eqz p0, :cond_34

    iget-object v1, v0, Lvs;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v0, v0, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    const v2, 0x7f0807c4

    invoke-static {v2, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    sget-object v3, Le9i;->f:Lwu5;

    iget-object p0, p0, Lxlg;->m:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lwu5;->h(Ljava/lang/String;)Le9i;

    move-result-object p0

    iget-object p0, p0, Le9i;->d:Ldxh;

    invoke-virtual {p0, v1}, Lcxh;->a(Landroid/content/Context;)I

    move-result p0

    invoke-static {v2, p0}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v0, v2}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_34
    return-void
.end method

.method public final q0()V
    .registers 4

    iget-object v0, p0, Luue;->n:Ljava/lang/Object;

    check-cast v0, Lvs;

    invoke-virtual {p0}, Luue;->n0()Lxlg;

    move-result-object p0

    if-eqz p0, :cond_36

    iget-object v1, v0, Lvs;->c:Ljava/lang/Object;

    check-cast v1, Lov0;

    iget-object v1, v1, Lov0;->b:Landroid/view/View;

    check-cast v1, Landroid/widget/LinearLayout;

    sget-object v2, Le9i;->f:Lwu5;

    iget-object p0, p0, Lxlg;->m:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lwu5;->h(Ljava/lang/String;)Le9i;

    move-result-object p0

    iget-object p0, p0, Le9i;->d:Ldxh;

    iget-object v0, v0, Lvs;->c:Ljava/lang/Object;

    check-cast v0, Lov0;

    iget-object v0, v0, Lov0;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    :cond_36
    return-void
.end method

.method public final r0()V
    .registers 4

    iget-object v0, p0, Luue;->n:Ljava/lang/Object;

    check-cast v0, Lvs;

    invoke-virtual {p0}, Luue;->n0()Lxlg;

    move-result-object p0

    if-eqz p0, :cond_32

    iget-object v1, v0, Lvs;->c:Ljava/lang/Object;

    check-cast v1, Lov0;

    iget-object v1, v1, Lov0;->c:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    sget-object v2, Le9i;->f:Lwu5;

    iget-object p0, p0, Lxlg;->m:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lwu5;->h(Ljava/lang/String;)Le9i;

    move-result-object p0

    iget-object p0, p0, Le9i;->e:Ldxh;

    iget-object v0, v0, Lvs;->c:Ljava/lang/Object;

    check-cast v0, Lov0;

    iget-object v0, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_32
    return-void
.end method

.method public final s0()V
    .registers 4

    iget-object v0, p0, Luue;->n:Ljava/lang/Object;

    check-cast v0, Lvs;

    invoke-virtual {p0}, Luue;->n0()Lxlg;

    move-result-object p0

    if-eqz p0, :cond_3c

    sget-object v1, Le9i;->f:Lwu5;

    iget-object p0, p0, Lxlg;->m:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lwu5;->h(Ljava/lang/String;)Le9i;

    move-result-object p0

    iget-object v1, v0, Lvs;->c:Ljava/lang/Object;

    check-cast v1, Lov0;

    iget-object v1, v1, Lov0;->d:Ljava/lang/Object;

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object p0, p0, Le9i;->e:Ldxh;

    invoke-virtual {p0, v1}, Lcxh;->a(Landroid/content/Context;)I

    move-result p0

    iget-object v0, v0, Lvs;->c:Ljava/lang/Object;

    check-cast v0, Lov0;

    iget-object v0, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    const v2, 0x7f0805b8

    invoke-static {v2, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v1, p0}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_3c
    return-void
.end method

.method public final t0()V
    .registers 4

    iget-object v0, p0, Luue;->n:Ljava/lang/Object;

    check-cast v0, Lvs;

    invoke-virtual {p0}, Luue;->n0()Lxlg;

    move-result-object p0

    if-eqz p0, :cond_2a

    iget-object v1, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    sget-object v2, Le9i;->f:Lwu5;

    iget-object p0, p0, Lxlg;->m:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lwu5;->h(Ljava/lang/String;)Le9i;

    move-result-object p0

    iget-object p0, p0, Le9i;->b:Ldxh;

    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_2a
    return-void
.end method

.method public u0()Lr9i;
    .registers 1

    iget-object p0, p0, Lgu8;->d:Lr9i;

    return-object p0
.end method
