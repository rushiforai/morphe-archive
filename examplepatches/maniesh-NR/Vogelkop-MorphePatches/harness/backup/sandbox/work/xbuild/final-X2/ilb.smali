.class public final Lilb;
.super Lclb;
.source "SourceFile"


# static fields
.field public static final m:J

.field public static final n:J


# instance fields
.field public d:Ljlb;

.field public e:Landroidx/recyclerview/widget/i;

.field public f:B

.field public final g:Lpde;

.field public final h:Lj1k;

.field public final i:Lxh7;

.field public final j:Ljava/util/LinkedHashSet;

.field public final k:Lpde;

.field public final l:Lpde;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->d:Lun7;

    const/16 v1, 0x78

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v2

    sput-wide v2, Lilb;->m:J

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lilb;->n:J

    return-void
.end method

.method public constructor <init>(Lpde;Lj1k;)V
    .registers 3

    invoke-direct {p0}, Lclb;-><init>()V

    iput-object p1, p0, Lilb;->g:Lpde;

    iput-object p2, p0, Lilb;->h:Lj1k;

    new-instance p1, Lxh7;

    invoke-direct {p1}, Lxh7;-><init>()V

    iput-object p1, p0, Lilb;->i:Lxh7;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lilb;->j:Ljava/util/LinkedHashSet;

    new-instance p1, Lpde;

    new-instance p2, Ljava/util/LinkedHashSet;

    invoke-direct {p2}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lilb;->k:Lpde;

    new-instance p1, Lpde;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lilb;->l:Lpde;

    return-void
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    instance-of p0, p1, Lhlb;

    return p0
.end method

.method public final b(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)V
    .registers 4

    invoke-super {p0, p1, p2}, Lclb;->b(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)V

    iget-object p1, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p1}, La26;->r(Landroid/view/View;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationZ(F)V

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    iget-object p1, p0, Lilb;->j:Ljava/util/LinkedHashSet;

    invoke-interface {p1, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    iget-object v0, p0, Lilb;->k:Lpde;

    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_24
    iget-object p1, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object p0, p0, Lilb;->i:Lxh7;

    iget-object p2, p0, Lxh7;->c:Ljava/lang/Object;

    check-cast p2, Ljava/util/LinkedHashMap;

    invoke-virtual {p2, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_37

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_37
    iget-object p2, p0, Lxh7;->d:Ljava/lang/Object;

    check-cast p2, Ljava/util/LinkedHashMap;

    invoke-virtual {p2, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_46

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_46
    iget-object p0, p0, Lxh7;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final e(Landroidx/recyclerview/widget/RecyclerView;I)J
    .registers 3

    const/16 p0, 0x8

    if-ne p2, p0, :cond_b

    sget-wide p0, Lilb;->m:J

    invoke-static {p0, p1}, Lpn7;->f(J)J

    move-result-wide p0

    return-wide p0

    :cond_b
    sget-wide p0, Lilb;->n:J

    invoke-static {p0, p1}, Lpn7;->f(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public final f(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;)I
    .registers 8

    instance-of v0, p2, Lhlb;

    const/4 v1, 0x0

    if-eqz v0, :cond_4c

    check-cast p2, Lhlb;

    invoke-interface {p2}, Lhlb;->o()Z

    move-result v0

    if-eqz v0, :cond_34

    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    if-eqz v0, :cond_2f

    instance-of v2, v0, Landroidx/recyclerview/widget/GridLayoutManager;

    const/4 v3, 0x1

    const/4 v4, 0x3

    if-eqz v2, :cond_20

    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;

    iget v0, v0, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    if-le v0, v3, :cond_30

    const/16 v4, 0xf

    goto :goto_30

    :cond_20
    instance-of v2, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v2, :cond_2f

    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I

    move-result v0

    if-eq v0, v3, :cond_30

    const/16 v4, 0xc

    goto :goto_30

    :cond_2f
    move v4, v1

    :cond_30
    :goto_30
    invoke-static {v4, v1}, Lclb;->j(II)I

    move-result v1

    :cond_34
    invoke-interface {p2}, Lhlb;->y()Z

    move-result p2

    if-eqz p2, :cond_4b

    iget-object p0, p0, Lilb;->g:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget-boolean p0, p0, Leyj;->w:Z

    if-eqz p0, :cond_4b

    invoke-static {p1}, Lx7d;->m(Landroidx/recyclerview/widget/RecyclerView;)I

    move-result p0

    or-int/2addr v1, p0

    :cond_4b
    return v1

    :cond_4c
    invoke-static {v1, v1}, Lclb;->j(II)I

    move-result p0

    return p0
.end method

.method public final g(Landroidx/recyclerview/widget/i;)F
    .registers 5

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of v0, p0, Landroidx/recyclerview/widget/RecyclerView;

    const/high16 v1, 0x3f000000    # 0.5f

    if-eqz v0, :cond_41

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-eqz v0, :cond_41

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-eqz v0, :cond_41

    invoke-static {p0}, Lx7d;->m(Landroidx/recyclerview/widget/RecyclerView;)I

    move-result v0

    and-int/lit8 v2, v0, 0xc

    if-eqz v2, :cond_31

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    :goto_2d
    int-to-float p0, p0

    div-float/2addr p1, p0

    mul-float/2addr p1, v1

    return p1

    :cond_31
    and-int/lit8 v0, v0, 0x3

    if-eqz v0, :cond_41

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    goto :goto_2d

    :cond_41
    return v1
.end method

.method public final h(F)F
    .registers 2

    const p0, 0x7f7fffff    # Float.MAX_VALUE

    return p0
.end method

.method public final k(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V
    .registers 8

    invoke-super/range {p0 .. p7}, Lclb;->k(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/i;FFIZ)V

    iget-object p1, p0, Lilb;->k:Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Set;

    invoke-interface {p1, p3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_89

    const/4 p1, 0x0

    cmpg-float p6, p4, p1

    const/high16 p7, 0x3f800000    # 1.0f

    if-eqz p6, :cond_34

    invoke-static {p2}, Lx7d;->m(Landroidx/recyclerview/widget/RecyclerView;)I

    move-result p6

    and-int/lit8 p6, p6, 0xc

    if-eqz p6, :cond_34

    invoke-virtual {p0, p3}, Lilb;->g(Landroidx/recyclerview/widget/i;)F

    move-result p5

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result p2

    int-to-float p2, p2

    mul-float/2addr p5, p2

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result p2

    div-float/2addr p2, p5

    invoke-static {p2, p1, p7}, Ldjh;->b(FFF)F

    move-result p2

    goto :goto_55

    :cond_34
    cmpg-float p4, p5, p1

    if-eqz p4, :cond_54

    invoke-static {p2}, Lx7d;->m(Landroidx/recyclerview/widget/RecyclerView;)I

    move-result p4

    and-int/lit8 p4, p4, 0x3

    if-eqz p4, :cond_54

    invoke-virtual {p0, p3}, Lilb;->g(Landroidx/recyclerview/widget/i;)F

    move-result p4

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    int-to-float p2, p2

    mul-float/2addr p4, p2

    invoke-static {p5}, Ljava/lang/Math;->abs(F)F

    move-result p2

    div-float/2addr p2, p4

    invoke-static {p2, p1, p7}, Ldjh;->b(FFF)F

    move-result p2

    goto :goto_55

    :cond_54
    move p2, p1

    :goto_55
    iget-object p4, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object p5, p0, Lilb;->g:Lpde;

    invoke-virtual {p5}, Lekc;->g()Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Leyj;

    iget p5, p5, Leyj;->x:F

    sub-float/2addr p5, p7

    mul-float/2addr p5, p2

    add-float/2addr p5, p7

    invoke-virtual {p4, p5}, Landroid/view/View;->setAlpha(F)V

    iget-object p0, p0, Lilb;->i:Lxh7;

    iget-object p4, p0, Lxh7;->e:Ljava/lang/Object;

    check-cast p4, Ljava/util/LinkedHashMap;

    iget-object p3, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p4, p3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/Float;

    if-eqz p5, :cond_7b

    invoke-virtual {p5}, Ljava/lang/Float;->floatValue()F

    move-result p1

    :cond_7b
    cmpg-float p1, p1, p2

    if-eqz p1, :cond_89

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-interface {p4, p3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lxh7;->c()V

    :cond_89
    return-void
.end method

.method public final m(Landroidx/recyclerview/widget/i;I)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    iput-byte v2, v0, Lilb;->f:B

    iput-object v1, v0, Lilb;->e:Landroidx/recyclerview/widget/i;

    const/4 v3, 0x0

    if-nez v1, :cond_26

    iget-object v4, v0, Lilb;->d:Ljlb;

    if-eqz v4, :cond_23

    iget-object v5, v4, Ljlb;->d:Landroidx/recyclerview/widget/i;

    instance-of v6, v5, Ljal;

    if-eqz v6, :cond_1c

    check-cast v5, Ljal;

    invoke-virtual {v5}, Ljal;->Y()V

    :cond_1c
    iget-object v5, v4, Ljlb;->b:Lklb;

    iget-object v4, v4, Ljlb;->a:Lial;

    invoke-interface {v5, v4}, Lklb;->M(Lial;)V

    :cond_23
    invoke-virtual {v0, v3}, Lilb;->o(Ljlb;)V

    :cond_26
    const/4 v4, 0x1

    if-eqz v1, :cond_38

    if-ne v2, v4, :cond_38

    iget-object v5, v0, Lilb;->j:Ljava/util/LinkedHashSet;

    invoke-interface {v5, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_38

    iget-object v6, v0, Lilb;->k:Lpde;

    invoke-virtual {v6, v5}, Lekc;->r(Ljava/lang/Object;)V

    :cond_38
    const/4 v5, 0x2

    if-eqz v1, :cond_3d

    if-eq v2, v5, :cond_3e

    :cond_3d
    move-object v1, v3

    :cond_3e
    iget-object v2, v0, Lilb;->i:Lxh7;

    iget-object v3, v2, Lxh7;->d:Ljava/lang/Object;

    check-cast v3, Ljava/util/LinkedHashMap;

    iget-object v6, v0, Lilb;->l:Lpde;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/recyclerview/widget/i;

    invoke-static {v1, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_111

    sget-wide v8, Lilb;->m:J

    const-wide/16 v10, 0xc8

    if-eqz v7, :cond_af

    iget-object v12, v7, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v3, v12}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/animation/ValueAnimator;

    if-eqz v13, :cond_65

    invoke-virtual {v13}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_65
    new-array v13, v5, [F

    fill-array-data v13, :array_112

    invoke-static {v13}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v13

    invoke-virtual {v13, v10, v11}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v14, Lvh7;

    invoke-direct {v14, v2, v4}, Lvh7;-><init>(Lxh7;B)V

    invoke-virtual {v13, v14}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v4, Lwh7;

    const/4 v14, 0x0

    invoke-direct {v4, v2, v12, v14}, Lwh7;-><init>(Lxh7;Landroid/view/View;B)V

    invoke-virtual {v13, v4}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v13}, Landroid/animation/ValueAnimator;->start()V

    invoke-interface {v3, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v15, v7, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {v8, v9}, Lpn7;->f(J)J

    move-result-wide v16

    invoke-static {v15}, La26;->A(Landroid/view/View;)Luh7;

    move-result-object v18

    new-instance v4, Luh7;

    const/high16 v12, 0x3f800000    # 1.0f

    const/4 v13, 0x0

    invoke-direct {v4, v12, v12, v13}, Luh7;-><init>(FFF)V

    const/16 v20, 0x1

    move-object/from16 v19, v4

    invoke-static/range {v15 .. v20}, La26;->g(Landroid/view/View;JLuh7;Luh7;Z)V

    instance-of v4, v7, Lhlb;

    if-eqz v4, :cond_aa

    check-cast v7, Lhlb;

    invoke-interface {v7}, Lhlb;->c()V

    :cond_aa
    iget-object v4, v0, Lilb;->h:Lj1k;

    invoke-virtual {v4}, Lj1k;->invoke()Ljava/lang/Object;

    :cond_af
    invoke-virtual {v6, v1}, Lekc;->r(Ljava/lang/Object;)V

    if-eqz v1, :cond_111

    iget-object v4, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v3, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/animation/ValueAnimator;

    if-eqz v6, :cond_c1

    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_c1
    new-array v6, v5, [F

    fill-array-data v6, :array_11a

    invoke-static {v6}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v6

    invoke-virtual {v6, v10, v11}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v7, Lvh7;

    invoke-direct {v7, v2, v5}, Lvh7;-><init>(Lxh7;B)V

    invoke-virtual {v6, v7}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->start()V

    invoke-interface {v3, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v10, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {v8, v9}, Lpn7;->f(J)J

    move-result-wide v11

    new-instance v14, Luh7;

    iget-object v0, v0, Lilb;->g:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Leyj;

    iget v2, v2, Leyj;->z:F

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Leyj;

    iget v3, v3, Leyj;->A:F

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leyj;

    iget v0, v0, Leyj;->y:F

    invoke-direct {v14, v2, v3, v0}, Luh7;-><init>(FFF)V

    invoke-static {v10}, La26;->A(Landroid/view/View;)Luh7;

    move-result-object v13

    const/4 v15, 0x0

    invoke-static/range {v10 .. v15}, La26;->g(Landroid/view/View;JLuh7;Luh7;Z)V

    instance-of v0, v1, Lhlb;

    if-eqz v0, :cond_111

    check-cast v1, Lhlb;

    invoke-interface {v1}, Lhlb;->D()V

    :cond_111
    return-void

    :array_112
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_11a
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final o(Ljlb;)V
    .registers 12

    iget-object v0, p0, Lilb;->d:Ljlb;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_82

    iget-object v0, p0, Lilb;->d:Ljlb;

    const/4 v1, 0x2

    const-wide/16 v2, 0xc8

    if-eqz v0, :cond_4b

    iget-object v4, v0, Ljlb;->c:Landroid/view/View;

    iget-object v5, p0, Lilb;->i:Lxh7;

    iget-object v6, v5, Lxh7;->c:Ljava/lang/Object;

    check-cast v6, Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/animation/ValueAnimator;

    if-eqz v7, :cond_22

    invoke-virtual {v7}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_22
    new-array v7, v1, [F

    fill-array-data v7, :array_84

    invoke-static {v7}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v8, Lvh7;

    const/4 v9, 0x3

    invoke-direct {v8, v5, v9}, Lvh7;-><init>(Lxh7;B)V

    invoke-virtual {v7, v8}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v8, Lwh7;

    const/4 v9, 0x1

    invoke-direct {v8, v5, v4, v9}, Lwh7;-><init>(Lxh7;Landroid/view/View;B)V

    invoke-virtual {v7, v8}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v7}, Landroid/animation/ValueAnimator;->start()V

    invoke-interface {v6, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Ljlb;->b:Lklb;

    invoke-interface {v0}, Lklb;->F()V

    :cond_4b
    iput-object p1, p0, Lilb;->d:Ljlb;

    if-eqz p1, :cond_82

    iget-object v0, p1, Ljlb;->c:Landroid/view/View;

    iget-object p0, p0, Lilb;->i:Lxh7;

    iget-object v4, p0, Lxh7;->c:Ljava/lang/Object;

    check-cast v4, Ljava/util/LinkedHashMap;

    invoke-virtual {v4, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/animation/ValueAnimator;

    if-eqz v5, :cond_62

    invoke-virtual {v5}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_62
    new-array v1, v1, [F

    fill-array-data v1, :array_8c

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v2, Lvh7;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lvh7;-><init>(Lxh7;B)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p1, Ljlb;->b:Lklb;

    invoke-interface {p0}, Lklb;->L()V

    :cond_82
    return-void

    nop

    :array_84
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_8c
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
