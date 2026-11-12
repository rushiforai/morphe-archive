.class public final Lh5k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln8k;
.implements Len8;
.implements Lmmn;
.implements Lm1p;


# instance fields
.field public a:Z

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;Landroid/view/View;)V
    .registers 4

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lh5k;->b:Ljava/lang/Object;

    .line 46
    iput-object p2, p0, Lh5k;->c:Ljava/lang/Object;

    .line 47
    new-instance p2, Lml2;

    const/4 v0, 0x4

    invoke-direct {p2, p0, v0}, Lml2;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lh5k;->d:Ljava/lang/Object;

    .line 48
    new-instance p2, Lz61;

    const/16 v0, 0x18

    invoke-direct {p2, p0, v0}, Lz61;-><init>(Ljava/lang/Object;B)V

    .line 49
    invoke-static {p1, p2}, Lq9n;->g(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method

.method public constructor <init>(Len8;Ltnk;)V
    .registers 3

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lh5k;->b:Ljava/lang/Object;

    .line 52
    iput-object p2, p0, Lh5k;->c:Ljava/lang/Object;

    .line 53
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lh5k;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltsd;Lpde;Lre5;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lh5k;->b:Ljava/lang/Object;

    iput-object p3, p0, Lh5k;->c:Ljava/lang/Object;

    new-instance v0, Landroid/util/Size;

    invoke-interface {p3}, Lre5;->getRoot()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-interface {p3}, Lre5;->getRoot()Landroid/view/View;

    move-result-object p3

    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    iget p3, p3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-direct {v0, v1, p3}, Landroid/util/Size;-><init>(II)V

    iput-object v0, p0, Lh5k;->d:Ljava/lang/Object;

    new-instance p3, Lg9l;

    const/4 v0, 0x4

    invoke-direct {p3, p0, v0}, Lg9l;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p1, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lyul;Lq8l;Z)V
    .registers 4

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-boolean p3, p0, Lh5k;->a:Z

    .line 56
    iput-object p1, p0, Lh5k;->c:Ljava/lang/Object;

    .line 57
    iput-object p2, p0, Lh5k;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final b(Lq8l;)V
    .registers 3

    iget-boolean v0, p0, Lh5k;->a:Z

    if-eqz v0, :cond_e

    iget-object v0, p0, Lh5k;->d:Ljava/lang/Object;

    check-cast v0, Lq8l;

    invoke-virtual {v0, p1}, Lq8l;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    :cond_e
    iput-object p1, p0, Lh5k;->d:Ljava/lang/Object;

    iget-object p0, p0, Lh5k;->b:Ljava/lang/Object;

    check-cast p0, Ln8k;

    if-eqz p0, :cond_19

    invoke-interface {p0, p1}, Ln8k;->b(Lq8l;)V

    :cond_19
    return-void
.end method

.method public final c(Lyul;)V
    .registers 3

    iget-boolean v0, p0, Lh5k;->a:Z

    if-eqz v0, :cond_e

    iget-object v0, p0, Lh5k;->c:Ljava/lang/Object;

    check-cast v0, Lyul;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    :cond_e
    iput-object p1, p0, Lh5k;->c:Ljava/lang/Object;

    iget-object p0, p0, Lh5k;->b:Ljava/lang/Object;

    check-cast p0, Ln8k;

    if-eqz p0, :cond_19

    invoke-interface {p0, p1}, Ln8k;->c(Lyul;)V

    :cond_19
    return-void
.end method

.method public final d(Lilm;)V
    .registers 10

    iget-object v0, p0, Lh5k;->d:Ljava/lang/Object;

    check-cast v0, Lqln;

    iget-object v0, v0, Lqln;->f:Lami;

    iget-object v1, p0, Lh5k;->c:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Landroid/content/ContentResolver;

    iget-object v1, p0, Lh5k;->b:Ljava/lang/Object;

    move-object v5, v1

    check-cast v5, Landroid/net/Uri;

    iget-boolean v6, p0, Lh5k;->a:Z

    new-instance p0, Lj12;

    const/16 v1, 0xd

    invoke-direct {p0, p1, v1}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    iget-object p1, v0, Lami;->d:Ljava/lang/Object;

    move-object v3, p1

    check-cast v3, Ls14;

    iget-object p1, v3, Ls14;->d:Ljava/lang/Object;

    check-cast p1, Lumi;

    new-instance v2, Lis6;

    const/4 v7, 0x5

    invoke-direct/range {v2 .. v7}, Lis6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    invoke-virtual {p1, v2}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    new-instance v1, Lroj;

    const/16 v2, 0xf

    invoke-direct {v1, v3, p0, v2}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {v0, p0}, Lnml;->b(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final e()V
    .registers 9

    iget-object v0, p0, Lh5k;->c:Ljava/lang/Object;

    check-cast v0, Lre5;

    iget-object v1, p0, Lh5k;->b:Ljava/lang/Object;

    check-cast v1, Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Leyj;

    iget-object v2, v2, Leyj;->a:Ln6h;

    instance-of v3, v0, Ld5l;

    if-eqz v3, :cond_87

    if-eqz v2, :cond_83

    instance-of v3, v2, Lnxj;

    if-eqz v3, :cond_55

    move-object v3, v0

    check-cast v3, Ld5l;

    check-cast v2, Lnxj;

    iget-object v4, v3, Ld5l;->b:Lk1g;

    instance-of v5, v4, Lqe5;

    if-eqz v5, :cond_fa

    check-cast v4, Lqe5;

    iget-object v4, v4, Lqe5;->i:Landroidx/constraintlayout/widget/Guideline;

    iget v5, v2, Lnxj;->c:I

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Ljo5;

    iget-boolean v7, v4, Landroidx/constraintlayout/widget/Guideline;->a:Z

    if-eqz v7, :cond_39

    iget v7, v6, Ljo5;->a:I

    if-eq v7, v5, :cond_3e

    :cond_39
    iput v5, v6, Ljo5;->a:I

    invoke-virtual {v4, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_3e
    iget-object v4, v3, Ld5l;->j:Landroid/view/View;

    if-eqz v4, :cond_47

    iget v5, v2, Lnxj;->b:I

    invoke-static {v4, v5, v5}, Lp37;->s0(Landroid/view/View;II)V

    :cond_47
    iget-object v4, v2, Lnxj;->a:Lkxj;

    invoke-static {v3, v4}, Lu0h;->d(Ld5l;Lkxj;)V

    iget-object v3, v3, Ld5l;->g:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget v2, v2, Lnxj;->d:I

    invoke-static {v3, v2}, Lxf8;->r0(Landroid/widget/TextView;I)V

    goto/16 :goto_fa

    :cond_55
    instance-of v3, v2, Llxj;

    if-eqz v3, :cond_7f

    move-object v3, v0

    check-cast v3, Ld5l;

    iget-object v4, v3, Ld5l;->b:Lk1g;

    check-cast v2, Llxj;

    instance-of v5, v4, Loe5;

    if-eqz v5, :cond_fa

    check-cast v4, Loe5;

    iget-object v5, v4, Loe5;->i:Landroid/view/View;

    iget v6, v2, Llxj;->b:I

    iget v7, v2, Llxj;->c:I

    invoke-static {v5, v6, v7}, Lp37;->s0(Landroid/view/View;II)V

    iget-object v4, v4, Loe5;->j:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v4, :cond_78

    iget v5, v2, Llxj;->e:I

    invoke-static {v5, v4}, Lp37;->l0(ILandroid/view/View;)V

    :cond_78
    iget-object v2, v2, Llxj;->a:Lkxj;

    invoke-static {v3, v2}, Lu0h;->d(Ld5l;Lkxj;)V

    goto/16 :goto_fa

    :cond_7f
    instance-of v2, v2, Lmxj;

    if-nez v2, :cond_fa

    :cond_83
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_87
    instance-of v3, v0, Li85;

    if-eqz v3, :cond_fa

    if-eqz v2, :cond_f6

    instance-of v3, v2, Lnxj;

    if-eqz v3, :cond_c9

    move-object v3, v0

    check-cast v3, Li85;

    iget-object v4, v3, Li85;->b:Lk1g;

    check-cast v2, Lnxj;

    instance-of v5, v4, Lqe5;

    if-eqz v5, :cond_fa

    iget-object v5, v3, Li85;->d:Landroid/widget/TextView;

    iget v6, v2, Lnxj;->b:I

    invoke-static {v5, v6, v6}, Lp37;->s0(Landroid/view/View;II)V

    check-cast v4, Lqe5;

    iget-object v4, v4, Lqe5;->i:Landroidx/constraintlayout/widget/Guideline;

    iget v5, v2, Lnxj;->c:I

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Ljo5;

    iget-boolean v7, v4, Landroidx/constraintlayout/widget/Guideline;->a:Z

    if-eqz v7, :cond_b7

    iget v7, v6, Ljo5;->a:I

    if-eq v7, v5, :cond_bc

    :cond_b7
    iput v5, v6, Ljo5;->a:I

    invoke-virtual {v4, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_bc
    iget-object v4, v2, Lnxj;->a:Lkxj;

    invoke-static {v3, v4}, Lu0h;->c(Li85;Lkxj;)V

    iget-object v3, v3, Li85;->f:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget v2, v2, Lnxj;->d:I

    invoke-static {v3, v2}, Lxf8;->r0(Landroid/widget/TextView;I)V

    goto :goto_fa

    :cond_c9
    instance-of v3, v2, Llxj;

    if-eqz v3, :cond_f2

    move-object v3, v0

    check-cast v3, Li85;

    iget-object v4, v3, Li85;->b:Lk1g;

    check-cast v2, Llxj;

    instance-of v5, v4, Loe5;

    if-eqz v5, :cond_fa

    check-cast v4, Loe5;

    iget-object v5, v4, Loe5;->i:Landroid/view/View;

    iget v6, v2, Llxj;->b:I

    iget v7, v2, Llxj;->c:I

    invoke-static {v5, v6, v7}, Lp37;->s0(Landroid/view/View;II)V

    iget-object v4, v4, Loe5;->j:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v4, :cond_ec

    iget v5, v2, Llxj;->e:I

    invoke-static {v5, v4}, Lp37;->l0(ILandroid/view/View;)V

    :cond_ec
    iget-object v2, v2, Llxj;->a:Lkxj;

    invoke-static {v3, v2}, Lu0h;->c(Li85;Lkxj;)V

    goto :goto_fa

    :cond_f2
    instance-of v2, v2, Lmxj;

    if-nez v2, :cond_fa

    :cond_f6
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_fa
    :goto_fa
    iget-object v2, p0, Lh5k;->d:Ljava/lang/Object;

    check-cast v2, Landroid/util/Size;

    iget-boolean v3, p0, Lh5k;->a:Z

    instance-of v4, v0, Li85;

    if-eqz v4, :cond_10d

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Leyj;

    iget-object v3, v3, Leyj;->g:Landroid/util/Size;

    goto :goto_12d

    :cond_10d
    instance-of v4, v0, Llj8;

    if-eqz v4, :cond_11a

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Leyj;

    iget-object v3, v3, Leyj;->h:Landroid/util/Size;

    goto :goto_12d

    :cond_11a
    if-eqz v3, :cond_125

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Leyj;

    iget-object v3, v3, Leyj;->f:Landroid/util/Size;

    goto :goto_12d

    :cond_125
    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Leyj;

    iget-object v3, v3, Leyj;->e:Landroid/util/Size;

    :goto_12d
    if-nez v3, :cond_13b

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lh5k;->k(II)V

    return-void

    :cond_13b
    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v3

    instance-of v0, v0, Llj8;

    if-eqz v0, :cond_15d

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leyj;

    iget-object v0, v0, Leyj;->j:Loxj;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leyj;

    iget-object v0, v0, Leyj;->j:Loxj;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_15d
    invoke-virtual {p0, v2, v3}, Lh5k;->k(II)V

    return-void
.end method

.method public final endTracks()V
    .registers 4

    iget-object v0, p0, Lh5k;->d:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseArray;

    iget-object v1, p0, Lh5k;->b:Ljava/lang/Object;

    check-cast v1, Len8;

    invoke-interface {v1}, Len8;->endTracks()V

    iget-boolean p0, p0, Lh5k;->a:Z

    if-eqz p0, :cond_22

    const/4 p0, 0x0

    :goto_10
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge p0, v1, :cond_22

    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwnk;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lwnk;->i:Z

    add-int/lit8 p0, p0, 0x1

    goto :goto_10

    :cond_22
    return-void
.end method

.method public final f()V
    .registers 2

    iget-boolean v0, p0, Lh5k;->a:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lh5k;->a:Z

    iget-object v0, p0, Lh5k;->d:Ljava/lang/Object;

    check-cast v0, Lx2l;

    iget-object v0, v0, Lx2l;->k:Lt5l;

    iget-object p0, p0, Lh5k;->b:Ljava/lang/Object;

    check-cast p0, Ljri;

    invoke-virtual {v0, p0}, Lt5l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final g(Landroid/webkit/WebView;)V
    .registers 5

    iget-object v0, p0, Lh5k;->d:Ljava/lang/Object;

    check-cast v0, Lguo;

    iget-object v1, p0, Lh5k;->c:Ljava/lang/Object;

    check-cast v1, Lylp;

    iget-boolean v2, p0, Lh5k;->a:Z

    if-nez v2, :cond_16

    const/4 v2, 0x1

    iput-boolean v2, p0, Lh5k;->a:Z

    iget-object p0, p0, Lh5k;->b:Ljava/lang/Object;

    check-cast p0, Lz23;

    invoke-virtual {p0}, Lz23;->invoke()Ljava/lang/Object;

    :cond_16
    iget-object p0, v1, Lvoo;->q:Lmzo;

    if-eqz p0, :cond_44

    iget-object p0, v0, Lpxo;->g:Lsxo;

    if-nez p0, :cond_44

    iget-object p0, v0, Lpxo;->a:Landroid/content/Context;

    sget-object v2, Lc26;->q:Ll5b;

    iget-boolean v2, v2, Ll5b;->b:Z

    if-nez v2, :cond_29

    invoke-static {p0}, Lc26;->f(Landroid/content/Context;)V

    :cond_29
    iget-object p0, v1, Lvoo;->o:Ljava/lang/String;

    iget-object v2, v1, Lvoo;->p:Ljava/lang/String;

    filled-new-array {p0, v2}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le82;->p([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    new-instance v2, Ldpo;

    iget-object v1, v1, Lvoo;->q:Lmzo;

    invoke-direct {v2, p1, p0, v1}, Ldpo;-><init>(Landroid/webkit/WebView;Ljava/lang/String;Lmzo;)V

    iput-object v2, v0, Lpxo;->g:Lsxo;

    :cond_44
    return-void
.end method

.method public final h(Ltwi;)V
    .registers 2

    iget-object p0, p0, Lh5k;->b:Ljava/lang/Object;

    check-cast p0, Len8;

    invoke-interface {p0, p1}, Len8;->h(Ltwi;)V

    return-void
.end method

.method public final i(Li5k;)V
    .registers 10

    new-instance v0, Leof;

    const/16 v1, 0x14

    invoke-direct {v0, p0, p1, v1}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p1, Li5k;->d:Lj5k;

    iget-object v1, p1, Li5k;->b:Ljava/util/List;

    iget-object v2, p1, Li5k;->d:Lj5k;

    iget-object v3, p0, Lj5k;->d:Lbz;

    invoke-interface {v3}, Lbz;->a()Z

    move-result v4

    if-nez v4, :cond_1b

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Leof;->run(Ljava/lang/Object;)V

    return-void

    :cond_1b
    iget-object v4, v2, Lj5k;->c:Ldl;

    iget-object v5, v4, Ldl;->c:Ljava/lang/String;

    new-instance v6, Lm43;

    const/4 v7, 0x0

    invoke-direct {v6, v4, v5, v7, v1}, Lm43;-><init>(Ldl;Ljava/lang/String;ILjava/util/List;)V

    invoke-interface {v3, v6}, Lbz;->d(Laz;)Lyz;

    move-result-object v4

    if-eqz v4, :cond_51

    new-instance v1, Ltxi;

    const/16 v2, 0x10

    invoke-direct {v1, p1, v2}, Ltxi;-><init>(Ljava/lang/Object;B)V

    iget-object p1, p0, Lj5k;->b:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->pollFirst()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmq;

    if-eqz p1, :cond_40

    invoke-virtual {p0, v4, p1, v1}, Lj5k;->a(Lyz;Lmq;Ltxi;)Z

    move-result v7

    :cond_40
    if-eqz v7, :cond_48

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Leof;->run(Ljava/lang/Object;)V

    return-void

    :cond_48
    invoke-virtual {v4}, Lyz;->b()V

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Leof;->run(Ljava/lang/Object;)V

    return-void

    :cond_51
    new-instance p0, Lzxe;

    invoke-direct {p0, p1, v0}, Lzxe;-><init>(Li5k;Leof;)V

    iget-object p1, v2, Lj5k;->c:Ldl;

    iget-object v0, p1, Ldl;->c:Ljava/lang/String;

    new-instance v2, Lm43;

    invoke-direct {v2, p1, v0, v7, v1}, Lm43;-><init>(Ldl;Ljava/lang/String;ILjava/util/List;)V

    invoke-interface {v3, p0, v2}, Lbz;->e(Lzy;Laz;)V

    return-void
.end method

.method public final j(Z)V
    .registers 7

    iget-boolean v0, p0, Lh5k;->a:Z

    if-eq v0, p1, :cond_93

    iput-boolean p1, p0, Lh5k;->a:Z

    const/4 v0, 0x0

    if-nez p1, :cond_5f

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lh5k;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1a
    :goto_1a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1a

    iget-object v4, p0, Lh5k;->c:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashSet;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Li5k;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    :cond_4c
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v2, v0

    :goto_51
    if-ge v2, v1, :cond_5f

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Li5k;

    invoke-virtual {p0, v3}, Lh5k;->i(Li5k;)V

    goto :goto_51

    :cond_5f
    iget-object p1, p0, Lh5k;->d:Ljava/lang/Object;

    check-cast p1, Lbi;

    iget-boolean p0, p0, Lh5k;->a:Z

    iget-object p1, p1, Lbi;->b:Ljava/lang/Object;

    check-cast p1, Lwy;

    iget-object v1, p1, Lwy;->c:Luwh;

    iget v2, v1, Luwh;->e:I

    const/4 v3, 0x1

    if-eqz p0, :cond_74

    add-int/2addr v2, v3

    iput v2, v1, Luwh;->e:I

    goto :goto_77

    :cond_74
    sub-int/2addr v2, v3

    iput v2, v1, Luwh;->e:I

    :goto_77
    if-gez v2, :cond_7b

    iput v0, v1, Luwh;->e:I

    :cond_7b
    invoke-virtual {v1}, Luwh;->c()V

    if-eqz p0, :cond_93

    iget-object p0, p1, Lwy;->g:Lux;

    iget-boolean p1, p0, Lux;->i:Z

    if-nez p1, :cond_93

    iput-boolean v3, p0, Lux;->i:Z

    iget-object p1, p0, Lux;->f:Li3j;

    if-eqz p1, :cond_93

    invoke-virtual {p1}, Li3j;->z()I

    move-result p1

    invoke-virtual {p0, p1}, Lux;->a(I)V

    :cond_93
    return-void
.end method

.method public final k(II)V
    .registers 5

    iget-object p0, p0, Lh5k;->c:Ljava/lang/Object;

    check-cast p0, Lre5;

    invoke-interface {p0}, Lre5;->getRoot()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-interface {p0}, Lre5;->getRoot()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne p1, v1, :cond_25

    invoke-interface {p0}, Lre5;->getRoot()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne p2, v1, :cond_25

    return-void

    :cond_25
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-interface {p0}, Lre5;->getRoot()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final l(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V
    .registers 5

    iget-object v0, p0, Lh5k;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-boolean v1, p0, Lh5k;->a:Z

    if-eqz v1, :cond_15

    iget-object p0, p0, Lh5k;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayDeque;

    new-instance v1, Lwup;

    invoke-direct {v1, p1, p2}, Lwup;-><init>(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    invoke-virtual {p0, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :cond_15
    const/4 v1, 0x1

    iput-boolean v1, p0, Lh5k;->a:Z

    monitor-exit v0
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_1f

    invoke-virtual {p0, p1, p2}, Lh5k;->n(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-void

    :goto_1d
    :try_start_1d
    monitor-exit v0
    :try_end_1e
    .catchall {:try_start_1d .. :try_end_1e} :catchall_1f

    throw p0

    :catchall_1f
    move-exception p0

    goto :goto_1d
.end method

.method public final m()V
    .registers 3

    iget-object v0, p0, Lh5k;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lh5k;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_12

    const/4 v1, 0x0

    iput-boolean v1, p0, Lh5k;->a:Z

    monitor-exit v0

    return-void

    :cond_12
    iget-object v1, p0, Lh5k;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->remove()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwup;

    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_27

    iget-object v0, v1, Lwup;->a:Ljava/util/concurrent/Executor;

    iget-object v1, v1, Lwup;->b:Ljava/lang/Runnable;

    invoke-virtual {p0, v1, v0}, Lh5k;->n(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-void

    :goto_25
    :try_start_25
    monitor-exit v0
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_27

    throw p0

    :catchall_27
    move-exception p0

    goto :goto_25
.end method

.method public final n(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V
    .registers 5

    new-instance v0, Lypp;

    const/4 v1, 0x7

    invoke-direct {v0, p0, p1, v1}, Lypp;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    :try_start_6
    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_9
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_6 .. :try_end_9} :catch_a

    return-void

    :catch_a
    invoke-virtual {p0}, Lh5k;->m()V

    return-void
.end method

.method public final track(II)Lhyl;
    .registers 6

    iget-object v0, p0, Lh5k;->d:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseArray;

    iget-object v1, p0, Lh5k;->b:Ljava/lang/Object;

    check-cast v1, Len8;

    const/4 v2, 0x3

    if-eq p2, v2, :cond_13

    const/4 v0, 0x1

    iput-boolean v0, p0, Lh5k;->a:Z

    invoke-interface {v1, p1, p2}, Len8;->track(II)Lhyl;

    move-result-object p0

    return-object p0

    :cond_13
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwnk;

    if-eqz v2, :cond_1c

    return-object v2

    :cond_1c
    new-instance v2, Lwnk;

    invoke-interface {v1, p1, p2}, Len8;->track(II)Lhyl;

    move-result-object p2

    iget-object p0, p0, Lh5k;->c:Ljava/lang/Object;

    check-cast p0, Ltnk;

    invoke-direct {v2, p2, p0}, Lwnk;-><init>(Lhyl;Ltnk;)V

    invoke-virtual {v0, p1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-object v2
.end method
