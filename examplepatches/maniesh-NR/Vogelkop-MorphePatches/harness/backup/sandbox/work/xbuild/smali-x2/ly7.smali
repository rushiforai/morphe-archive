.class public final Lly7;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final c:Landroid/content/Context;

.field public final d:Landroid/view/View;

.field public final e:Ljava/util/List;

.field public final f:Landroid/widget/LinearLayout;

.field public final g:Ljf7;

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View;Ljava/util/List;Landroid/widget/LinearLayout;Ljf7;)V
    .registers 8

    const/16 v0, 0x8

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Ln1;-><init>(BZ)V

    iput-object p1, p0, Lly7;->c:Landroid/content/Context;

    iput-object p2, p0, Lly7;->d:Landroid/view/View;

    iput-object p3, p0, Lly7;->e:Ljava/util/List;

    iput-object p4, p0, Lly7;->f:Landroid/widget/LinearLayout;

    iput-object p5, p0, Lly7;->g:Ljf7;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lly7;->h:Z

    invoke-virtual {p0}, Lly7;->H0()V

    return-void
.end method


# virtual methods
.method public final H0()V
    .registers 11

    iget-boolean v0, p0, Lly7;->h:Z

    const/16 v1, 0xa

    const/4 v2, 0x6

    const/4 v3, 0x0

    iget-object v4, p0, Lly7;->e:Ljava/util/List;

    if-eqz v0, :cond_65

    check-cast v4, Ljava/util/Collection;

    invoke-static {v4}, Lj95;->g(Ljava/util/Collection;)Lkotlin/ranges/IntRange;

    move-result-object v0

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Lkotlin/ranges/a;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_19
    :goto_19
    move-object v5, v0

    check-cast v5, Lacb;

    iget-boolean v5, v5, Lacb;->c:Z

    if-eqz v5, :cond_36

    move-object v5, v0

    check-cast v5, Lubb;

    invoke-virtual {v5}, Lubb;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    rem-int/lit8 v6, v6, 0xc

    if-ge v6, v2, :cond_19

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_19

    :cond_36
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {v4, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v5, v3

    :goto_44
    if-ge v5, v1, :cond_5c

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_44

    :cond_5c
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->j0(Ljava/util/ArrayList;)[I

    move-result-object v0

    filled-new-array {v0}, [[I

    move-result-object v0

    goto :goto_bf

    :cond_65
    check-cast v4, Ljava/util/Collection;

    invoke-static {v4}, Lj95;->g(Ljava/util/Collection;)Lkotlin/ranges/IntRange;

    move-result-object v0

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Lkotlin/ranges/a;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_74
    :goto_74
    move-object v5, v0

    check-cast v5, Lacb;

    iget-boolean v5, v5, Lacb;->c:Z

    if-eqz v5, :cond_91

    move-object v5, v0

    check-cast v5, Lubb;

    invoke-virtual {v5}, Lubb;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    rem-int/lit8 v6, v6, 0xc

    if-lt v6, v2, :cond_74

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_74

    :cond_91
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {v4, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v5, v3

    :goto_9f
    if-ge v5, v1, :cond_b7

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9f

    :cond_b7
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->j0(Ljava/util/ArrayList;)[I

    move-result-object v0

    filled-new-array {v0}, [[I

    move-result-object v0

    :goto_bf
    iput-object v0, p0, Ln1;->b:Ljava/lang/Object;

    invoke-virtual {p0}, Lly7;->n0()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    new-array v1, v0, [[I

    move v4, v3

    :goto_ca
    if-ge v4, v0, :cond_d3

    new-array v5, v2, [I

    aput-object v5, v1, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_ca

    :cond_d3
    move v4, v3

    move v5, v4

    :goto_d5
    if-ge v4, v0, :cond_fc

    move v6, v3

    :goto_d8
    if-ge v6, v2, :cond_f9

    iget-object v7, p0, Ln1;->b:Ljava/lang/Object;

    check-cast v7, [[I

    const/4 v8, 0x0

    if-eqz v7, :cond_e3

    move-object v9, v7

    goto :goto_e4

    :cond_e3
    move-object v9, v8

    :goto_e4
    aget-object v9, v9, v3

    array-length v9, v9

    if-ge v5, v9, :cond_f6

    aget-object v9, v1, v4

    if-nez v7, :cond_ee

    move-object v7, v8

    :cond_ee
    aget-object v7, v7, v3

    aget v7, v7, v5

    aput v7, v9, v6

    add-int/lit8 v5, v5, 0x1

    :cond_f6
    add-int/lit8 v6, v6, 0x1

    goto :goto_d8

    :cond_f9
    add-int/lit8 v4, v4, 0x1

    goto :goto_d5

    :cond_fc
    iput-object v1, p0, Ln1;->b:Ljava/lang/Object;

    return-void
.end method

.method public final J()V
    .registers 7

    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lly7;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0x11

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const v2, 0x7f0d011c

    invoke-static {v1, v2, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0a0370

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/appcompat/widget/AppCompatImageView;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v4, p0, Lly7;->d:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v5

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v4

    invoke-direct {v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Lly7;->f:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/AppCompatImageView;

    new-instance v1, Ljf7;

    const/4 v2, 0x7

    invoke-direct {v1, p0, v0, v2}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final i0()Landroid/content/Context;
    .registers 1

    iget-object p0, p0, Lly7;->c:Landroid/content/Context;

    return-object p0
.end method

.method public final l0()Landroid/view/View$OnClickListener;
    .registers 1

    iget-object p0, p0, Lly7;->g:Ljf7;

    return-object p0
.end method

.method public final n0()I
    .registers 1

    iget-object p0, p0, Lly7;->e:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    div-int/lit8 p0, p0, 0x2

    div-int/lit8 p0, p0, 0x6

    add-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final o0()Landroid/widget/LinearLayout;
    .registers 1

    iget-object p0, p0, Lly7;->f:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method public final p0()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lly7;->d:Landroid/view/View;

    return-object p0
.end method

.method public final q0()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lly7;->e:Ljava/util/List;

    return-object p0
.end method
