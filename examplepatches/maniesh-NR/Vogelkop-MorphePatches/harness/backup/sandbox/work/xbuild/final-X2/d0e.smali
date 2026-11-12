.class public final Ld0e;
.super Lf0e;
.source "SourceFile"


# instance fields
.field public final i:Lu4l;

.field public final j:Lv8a;

.field public final k:Ls9i;

.field public l:Lyzd;

.field public m:I


# direct methods
.method public constructor <init>(Lsf2;Lpde;Lu4l;Lpde;Lv8a;Lyhe;Lpde;Ls9i;Ls2;)V
    .registers 16

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p4

    move-object v4, p6

    move-object v5, p7

    invoke-direct/range {v0 .. v5}, Lf0e;-><init>(Lsf2;Lpde;Lpde;Lyhe;Lpde;)V

    iput-object p3, v0, Ld0e;->i:Lu4l;

    iput-object p5, v0, Ld0e;->j:Lv8a;

    iput-object p8, v0, Ld0e;->k:Ls9i;

    iget-object p0, v1, Lsf2;->b:Landroid/widget/ImageView;

    new-instance p1, Llzb;

    const/16 p2, 0xe

    invoke-direct {p1, v0, p2}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_21

    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_21
    new-instance p1, Ljf7;

    const/16 p2, 0x17

    invoke-direct {p1, v0, p9, p2}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, v0, Lf0e;->f:Ltsd;

    new-instance p1, Lf85;

    const/4 p2, 0x2

    invoke-direct {p1, v0, p2}, Lf85;-><init>(Ljava/lang/Object;B)V

    new-instance p2, Lq4b;

    const/16 p3, 0x18

    invoke-direct {p2, v0, p3}, Lq4b;-><init>(Ljava/lang/Object;B)V

    invoke-static {p5, p0, p1, p2}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    iget-object p0, v0, Lf0e;->f:Ltsd;

    new-instance p1, Lc0e;

    const/4 p2, 0x0

    invoke-direct {p1, v0, p2}, Lc0e;-><init>(Ld0e;B)V

    invoke-static {v3, p0, p1}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object p0, p8, Ls9i;->c:Ljava/lang/Object;

    check-cast p0, Lpde;

    iget-object p1, v0, Lf0e;->f:Ltsd;

    new-instance p2, Lc0e;

    const/4 p3, 0x1

    invoke-direct {p2, v0, p3}, Lc0e;-><init>(Ld0e;B)V

    invoke-static {p0, p1, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final V()Landroid/view/View;
    .registers 6

    iget-object v0, p0, Ld0e;->l:Lyzd;

    if-eqz v0, :cond_37

    iget v0, v0, Lyzd;->a:I

    iget-object p0, p0, Lf0e;->d:Lyhe;

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lz5l;

    iget-object p0, p0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lg6n;

    invoke-direct {v1, p0}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v1}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_17
    move-object v2, v1

    check-cast v2, Lh6n;

    invoke-virtual {v2}, Lh6n;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_37

    invoke-virtual {v2}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v3

    instance-of v4, v3, Lh85;

    if-eqz v4, :cond_17

    check-cast v3, Lh85;

    iget-object v3, v3, Lh85;->i:Lg2l;

    iget v3, v3, Lg2l;->b:I

    if-ne v0, v3, :cond_17

    return-object v2

    :cond_37
    const/4 p0, 0x0

    return-object p0
.end method

.method public final X()V
    .registers 21

    move-object/from16 v0, p0

    iget-object v1, v0, Ld0e;->l:Lyzd;

    if-eqz v1, :cond_1a

    iget-object v2, v0, Lf0e;->b:Lsf2;

    iget-object v3, v2, Lsf2;->b:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, v0, Lf0e;->c:Lpde;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Leyj;

    iget-object v4, v4, Leyj;->l:Ltxj;

    if-nez v4, :cond_1b

    :cond_1a
    return-void

    :cond_1b
    iget-object v5, v4, Ltxj;->g:Lcyj;

    iget-object v6, v0, Ld0e;->l:Lyzd;

    const/4 v7, 0x0

    if-nez v6, :cond_27

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    goto :goto_41

    :cond_27
    iget v6, v6, Lyzd;->a:I

    iget-object v8, v0, Ld0e;->j:Lv8a;

    iget-object v8, v8, Lv8a;->g:Ljava/util/Map;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v8, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lu8a;

    if-eqz v6, :cond_40

    iget v6, v6, Lu8a;->b:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    goto :goto_41

    :cond_40
    const/4 v6, 0x0

    :goto_41
    if-eqz v6, :cond_49

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    iput v6, v0, Ld0e;->m:I

    :cond_49
    new-instance v6, Lc9i;

    iget-object v8, v5, Lcyj;->b:Ly7h;

    iget-object v9, v5, Lcyj;->h:Lpxj;

    invoke-virtual {v8, v3}, Ly7h;->l(Landroid/content/Context;)F

    move-result v8

    iget-object v10, v4, Ltxj;->h:Ldxh;

    invoke-virtual {v10, v3}, Lcxh;->a(Landroid/content/Context;)I

    move-result v10

    invoke-direct {v6, v8, v10}, Lc9i;-><init>(FI)V

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iget v10, v9, Lpxj;->a:I

    move v11, v7

    :goto_64
    if-ge v11, v10, :cond_7d

    new-instance v12, Lc9i;

    iget-object v13, v5, Lcyj;->c:Ly7h;

    invoke-virtual {v13, v3}, Ly7h;->l(Landroid/content/Context;)F

    move-result v13

    iget-object v14, v4, Ltxj;->i:Ldxh;

    invoke-virtual {v14, v3}, Lcxh;->a(Landroid/content/Context;)I

    move-result v14

    invoke-direct {v12, v13, v14}, Lc9i;-><init>(FI)V

    invoke-virtual {v8, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v11, v11, 0x1

    goto :goto_64

    :cond_7d
    new-instance v5, Lk4a;

    invoke-direct {v5}, Lk4a;-><init>()V

    iget-object v9, v9, Lpxj;->b:Ly7h;

    invoke-virtual {v9, v3}, Ly7h;->k(Landroid/content/Context;)I

    move-result v9

    iget v10, v5, Lk4a;->a:I

    if-eq v9, v10, :cond_91

    iput v9, v5, Lk4a;->a:I

    invoke-virtual {v5}, Lk4a;->a()V

    :cond_91
    invoke-virtual {v5, v8}, Lk4a;->d(Ljava/util/ArrayList;)V

    iget-object v8, v0, Ld0e;->i:Lu4l;

    iget v1, v1, Lyzd;->a:I

    invoke-virtual {v8, v1}, Lu4l;->a(I)Lm4l;

    move-result-object v1

    invoke-virtual {v1}, Lm4l;->b()Lk4l;

    move-result-object v1

    new-instance v8, Landroid/graphics/drawable/LayerDrawable;

    new-instance v9, Lw3a;

    iget-object v10, v4, Ltxj;->k:Lixh;

    invoke-virtual {v10, v3}, Ly7h;->k(Landroid/content/Context;)I

    move-result v10

    iget-object v11, v1, Lk4l;->a:Ldxh;

    invoke-virtual {v11, v3}, Lcxh;->a(Landroid/content/Context;)I

    move-result v11

    invoke-static {v10, v11}, Lj14;->D(II)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v10

    const/16 v11, 0x11

    invoke-direct {v9, v10, v11, v7}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    new-instance v10, Lngl;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v11

    iget v0, v0, Ld0e;->m:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const/4 v12, 0x1

    invoke-static {v0, v12}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const-string v13, "%d"

    invoke-static {v11, v13, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v11

    const/4 v13, 0x2

    if-le v11, v13, :cond_dd

    const-string v0, "\u2026"

    :cond_dd
    sget-object v11, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iget-object v14, v4, Ltxj;->l:Lixh;

    invoke-virtual {v14, v3}, Ly7h;->k(Landroid/content/Context;)I

    move-result v14

    iget-object v1, v1, Lk4l;->b:Ldxh;

    invoke-virtual {v1, v3}, Lcxh;->a(Landroid/content/Context;)I

    move-result v1

    invoke-direct {v10, v0, v11, v14, v1}, Lngl;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    new-array v0, v13, [Landroid/graphics/drawable/Drawable;

    aput-object v9, v0, v7

    aput-object v10, v0, v12

    invoke-direct {v8, v0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iget-object v0, v2, Lsf2;->b:Landroid/widget/ImageView;

    new-instance v14, Landroid/graphics/drawable/LayerDrawable;

    const/4 v1, 0x3

    new-array v1, v1, [Landroid/graphics/drawable/Drawable;

    aput-object v6, v1, v7

    aput-object v5, v1, v12

    aput-object v8, v1, v13

    invoke-direct {v14, v1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iget-object v1, v4, Ltxj;->j:Lixh;

    invoke-virtual {v1, v3}, Ly7h;->k(Landroid/content/Context;)I

    move-result v16

    const/4 v15, 0x1

    move/from16 v17, v16

    move/from16 v18, v16

    move/from16 v19, v16

    invoke-virtual/range {v14 .. v19}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    invoke-virtual {v0, v14}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final Y()V
    .registers 4

    iget-object v0, p0, Ld0e;->l:Lyzd;

    if-eqz v0, :cond_1e

    iget-object v0, v0, Lyzd;->b:Ljava/util/ArrayList;

    iget-object v1, p0, Lf0e;->b:Lsf2;

    iget-object v1, v1, Lsf2;->b:Landroid/widget/ImageView;

    iget-object p0, p0, Ld0e;->k:Ls9i;

    invoke-virtual {p0}, Ls9i;->Y()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-virtual {p0, v0}, Ls9i;->X(Ljava/util/Collection;)Z

    move-result p0

    if-eqz p0, :cond_1a

    const/4 p0, 0x1

    goto :goto_1b

    :cond_1a
    const/4 p0, 0x0

    :goto_1b
    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setSelected(Z)V

    :cond_1e
    return-void
.end method
