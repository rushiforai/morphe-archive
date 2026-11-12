.class public final Lz5l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final A:Lv8a;

.field public final B:Lev7;

.field public final a:Lk6l;

.field public final b:Lu4l;

.field public final c:Lpde;

.field public final d:Lpde;

.field public final e:Ls9i;

.field public final f:Landroidx/recyclerview/widget/RecyclerView;

.field public final g:Likc;

.field public final h:Landroid/content/res/Resources;

.field public final i:Lyhe;

.field public final j:Lp77;

.field public final k:Lr5l;

.field public final l:Lzyk;

.field public m:Lkotlin/jvm/functions/Function0;

.field public final n:Ltsd;

.field public final o:Lc5l;

.field public final p:Lzg;

.field public final q:Lilb;

.field public final r:Lllb;

.field public final s:Lpde;

.field public final t:Lpde;

.field public final u:Lypd;

.field public final v:Lx2l;

.field public final w:Lqsh;

.field public x:Liv;

.field public final y:Lpde;

.field public final z:Lzc3;


# direct methods
.method public constructor <init>(Lpde;Lk6l;Lu4l;Lpde;Lpde;Lpde;Ls9i;Lpde;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/FrameLayout;Likc;La21;Lyqa;Ljava/util/List;Landroid/content/res/Resources;)V
    .registers 43

    move-object/from16 v2, p0

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p6

    move-object/from16 v12, p8

    move-object/from16 v13, p9

    move-object/from16 v14, p11

    move-object/from16 v15, p12

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v8, v2, Lz5l;->a:Lk6l;

    iput-object v9, v2, Lz5l;->b:Lu4l;

    iput-object v10, v2, Lz5l;->c:Lpde;

    iput-object v11, v2, Lz5l;->d:Lpde;

    move-object/from16 v0, p7

    iput-object v0, v2, Lz5l;->e:Ls9i;

    iput-object v13, v2, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    iput-object v14, v2, Lz5l;->g:Likc;

    move-object/from16 v1, p15

    iput-object v1, v2, Lz5l;->h:Landroid/content/res/Resources;

    new-instance v1, Lyhe;

    const/16 v3, 0x1d

    invoke-direct {v1, v2, v3}, Lyhe;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v2, Lz5l;->i:Lyhe;

    new-instance v1, Lr5l;

    invoke-direct {v1}, Lr5l;-><init>()V

    iput-object v1, v2, Lz5l;->k:Lr5l;

    new-instance v3, Ls5l;

    const/4 v4, 0x0

    invoke-direct {v3, v2, v4}, Ls5l;-><init>(Lz5l;B)V

    invoke-static {v3}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v3

    iput-object v3, v2, Lz5l;->l:Lzyk;

    new-instance v3, Lthk;

    const/16 v5, 0x9

    invoke-direct {v3, v5}, Lthk;-><init>(B)V

    iput-object v3, v2, Lz5l;->m:Lkotlin/jvm/functions/Function0;

    new-instance v3, Ly5l;

    invoke-virtual {v10}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Leyj;

    invoke-virtual {v12}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lb3c;

    invoke-virtual/range {p5 .. p5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/util/Size;

    invoke-direct {v3, v5, v6, v7}, Ly5l;-><init>(Leyj;Lb3c;Landroid/util/Size;)V

    new-instance v5, Llf5;

    const/16 v6, 0x18

    invoke-direct {v5, v6}, Llf5;-><init>(B)V

    move-object/from16 v6, p5

    invoke-static {v3, v10, v12, v6, v5}, Lxf8;->X(Ljava/lang/Object;Lekc;Lekc;Lekc;Lcr9;)Lwnm;

    move-result-object v3

    invoke-static {v3}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v3

    iput-object v3, v2, Lz5l;->n:Ltsd;

    new-instance v5, Lc5l;

    invoke-direct {v5, v13}, Lc5l;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    const/4 v6, 0x1

    iput-boolean v6, v5, Lc5l;->u:Z

    iput-object v5, v2, Lz5l;->o:Lc5l;

    new-instance v7, Lzg;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    iput-object v13, v7, Lzg;->b:Ljava/lang/Object;

    move-object/from16 v4, p14

    iput-object v4, v7, Lzg;->c:Ljava/lang/Object;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, v7, Lzg;->d:Ljava/lang/Object;

    iput-object v7, v2, Lz5l;->p:Lzg;

    new-instance v4, Lilb;

    new-instance v0, Lj1k;

    move v7, v6

    const/4 v6, 0x0

    move/from16 v16, v7

    const/16 v7, 0x11

    move-object/from16 v17, v1

    const/4 v1, 0x0

    move-object/from16 v18, v3

    const-class v3, Lz5l;

    move-object/from16 v19, v4

    const-string v4, "onDraggingStopped"

    move-object/from16 v20, v5

    const-string v5, "onDraggingStopped()V"

    move/from16 v13, v16

    move-object/from16 v21, v17

    move-object/from16 v11, v19

    move-object/from16 v14, v20

    invoke-direct/range {v0 .. v7}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v7, v2

    invoke-direct {v11, v10, v0}, Lilb;-><init>(Lpde;Lj1k;)V

    iput-object v11, v7, Lz5l;->q:Lilb;

    new-instance v0, Lllb;

    invoke-direct {v0, v11}, Lllb;-><init>(Lilb;)V

    iput-object v0, v7, Lz5l;->r:Lllb;

    new-instance v1, Lpde;

    invoke-virtual {v7, v13}, Lz5l;->c(Z)Lu3l;

    move-result-object v2

    invoke-direct {v1, v2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, v7, Lz5l;->s:Lpde;

    new-instance v4, Lpde;

    const/4 v2, 0x0

    invoke-virtual {v7, v2}, Lz5l;->c(Z)Lu3l;

    move-result-object v3

    invoke-direct {v4, v3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v4, v7, Lz5l;->t:Lpde;

    new-instance v2, Lypd;

    invoke-direct {v2, v15, v7, v12}, Lypd;-><init>(La21;Lz5l;Lpde;)V

    iput-object v2, v7, Lz5l;->u:Lypd;

    new-instance v3, Lpde;

    new-instance v5, La3c;

    invoke-direct {v5, v13}, La3c;-><init>(B)V

    invoke-direct {v3, v5}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v3, v7, Lz5l;->y:Lpde;

    new-instance v5, Lzc3;

    invoke-direct {v5}, Lzc3;-><init>()V

    sget-object v6, Lpn7;->b:Lon7;

    move-object/from16 p5, v0

    move-object/from16 p14, v1

    iget-wide v0, v14, Landroidx/recyclerview/widget/e;->e:J

    sget-object v6, Lun7;->d:Lun7;

    invoke-static {v0, v1, v6}, Lcs5;->y0(JLun7;)J

    move-result-wide v0

    new-instance v6, Lpn7;

    invoke-direct {v6, v0, v1}, Lpn7;-><init>(J)V

    iput-object v6, v5, Lzc3;->e:Lpn7;

    new-instance v0, Lbxk;

    const/4 v1, 0x2

    invoke-direct {v0, v7, v1}, Lbxk;-><init>(Ljava/lang/Object;B)V

    iput-object v0, v5, Lzc3;->f:Lvc3;

    iput-object v5, v7, Lz5l;->z:Lzc3;

    new-instance v0, Lv8a;

    move-object v6, v5

    new-instance v5, Lt5l;

    const/4 v1, 0x3

    invoke-direct {v5, v7, v1}, Lt5l;-><init>(Lz5l;B)V

    move-object v1, v6

    new-instance v6, Lt5l;

    const/4 v13, 0x4

    invoke-direct {v6, v7, v13}, Lt5l;-><init>(Lz5l;B)V

    move-object/from16 v13, p5

    move-object/from16 v16, p14

    move-object/from16 v19, v3

    move-object v3, v9

    const/4 v10, 0x2

    move-object v9, v2

    move-object v2, v8

    move-object v8, v1

    move-object/from16 v1, p1

    invoke-direct/range {v0 .. v6}, Lv8a;-><init>(Lpde;Lk6l;Lu4l;Lpde;Lt5l;Lt5l;)V

    iput-object v0, v7, Lz5l;->A:Lv8a;

    new-instance v6, Loji;

    invoke-direct {v6, v14}, Loji;-><init>(Ljava/lang/Object;)V

    move-object v2, v0

    new-instance v0, Lev7;

    iget-object v5, v11, Lilb;->i:Lxh7;

    move-object v1, v12

    move-object v12, v7

    move-object v7, v1

    move-object/from16 v1, p1

    move-object/from16 v4, p9

    move-object/from16 v22, v8

    move-object v3, v9

    move-object v8, v5

    move-object v9, v6

    move-object/from16 v6, p4

    move-object/from16 v5, p10

    invoke-direct/range {v0 .. v9}, Lev7;-><init>(Lpde;Lv8a;Lypd;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/FrameLayout;Lpde;Lpde;Lxh7;Loji;)V

    move-object/from16 v20, v2

    move-object v2, v0

    move-object/from16 v0, v20

    move-object/from16 v23, v8

    move-object/from16 v20, v9

    move-object v9, v3

    iput-object v2, v12, Lz5l;->B:Lev7;

    new-instance v2, Lw5l;

    const/4 v3, 0x0

    invoke-direct {v2, v12, v3}, Lw5l;-><init>(Lz5l;B)V

    move-object/from16 v3, v18

    invoke-static {v3, v1, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v2, Lw5l;

    const/4 v7, 0x1

    invoke-direct {v2, v12, v7}, Lw5l;-><init>(Lz5l;B)V

    move-object/from16 v3, p6

    invoke-static {v3, v1, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v2, Lw5l;

    invoke-direct {v2, v12, v10}, Lw5l;-><init>(Lz5l;B)V

    move-object/from16 v3, p11

    invoke-static {v3, v1, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v2, Ls8a;

    invoke-direct {v2, v12, v7}, Ls8a;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v4, p3

    invoke-static {v4, v1, v2}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    iget-object v2, v15, La21;->m:Ljava/lang/Object;

    move-object v10, v2

    check-cast v10, Lpde;

    move-object v2, v0

    new-instance v0, Lx2l;

    new-instance v5, Lt5l;

    const/4 v6, 0x5

    invoke-direct {v5, v12, v6}, Lt5l;-><init>(Lz5l;B)V

    move-object v6, v13

    new-instance v13, Ls5l;

    const/4 v8, 0x6

    invoke-direct {v13, v12, v8}, Ls5l;-><init>(Lz5l;B)V

    move-object v15, v6

    iget-object v6, v11, Lilb;->l:Lpde;

    move-object/from16 v7, p4

    move-object/from16 v8, p8

    move-object v12, v5

    move-object/from16 v25, v11

    move-object/from16 v24, v14

    move-object/from16 v26, v15

    move-object/from16 v5, p7

    move-object/from16 v15, p13

    move-object v14, v2

    move-object v11, v3

    move-object v3, v4

    move-object/from16 v4, v16

    move-object/from16 v2, p2

    invoke-direct/range {v0 .. v15}, Lx2l;-><init>(Lpde;Lk6l;Lu4l;Lpde;Ls9i;Lpde;Lpde;Lpde;Lypd;Likc;Likc;Lt5l;Ls5l;Lv8a;Lyqa;)V

    move-object v8, v2

    move-object v9, v6

    move-object v3, v7

    move-object v7, v0

    move-object/from16 v0, v21

    invoke-virtual {v7, v0}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    move-object/from16 v12, p0

    iput-object v7, v12, Lz5l;->v:Lx2l;

    new-instance v0, Lqsh;

    const/4 v1, 0x6

    invoke-direct {v0, v3, v7, v1}, Lqsh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, v12, Lz5l;->w:Lqsh;

    move-object/from16 v1, v22

    iput-object v0, v1, Lzc3;->c:Lqsh;

    move-object/from16 v2, p9

    const/4 v13, 0x1

    iput-boolean v13, v2, Landroidx/recyclerview/widget/RecyclerView;->t:Z

    move-object/from16 v14, v24

    invoke-virtual {v2, v14}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    move-object/from16 v6, v26

    invoke-virtual {v6, v2}, Lglb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    new-instance v0, Lrkb;

    move-object/from16 v1, p1

    move-object/from16 v4, v19

    move-object/from16 v6, v20

    move-object/from16 v5, v23

    invoke-direct/range {v0 .. v6}, Lrkb;-><init>(Lpde;Landroidx/recyclerview/widget/RecyclerView;Lpde;Lpde;Lxh7;Loji;)V

    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    invoke-virtual {v2, v7}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    new-instance v0, Lx5l;

    invoke-direct {v0, v12}, Lx5l;-><init>(Lz5l;)V

    invoke-static {v8, v1, v0}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    new-instance v0, La83;

    const/16 v3, 0x12

    invoke-direct {v0, v12, v3}, La83;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Llqh;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    new-instance v4, Lyo7;

    const/16 v5, 0x1c

    invoke-direct {v4, v3, v7, v0, v5}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lt7d;

    const/4 v3, 0x7

    invoke-direct {v0, v4, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, v0}, Lekc;->k(Lf7f;)V

    new-instance v0, Lp77;

    iget-object v3, v14, Lc5l;->x:Lpde;

    move-object/from16 v11, v25

    iget-object v4, v11, Lilb;->k:Lpde;

    move-object/from16 p2, v0

    move-object/from16 p4, v1

    move-object/from16 p3, v2

    move-object/from16 p5, v3

    move-object/from16 p6, v4

    move-object/from16 p7, v9

    invoke-direct/range {p2 .. p7}, Lp77;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lpde;Lpde;Lpde;Lpde;)V

    iput-object v0, v12, Lz5l;->j:Lp77;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lz5l;->c(Z)Lu3l;

    move-result-object v1

    iget-object v2, p0, Lz5l;->t:Lpde;

    invoke-static {v2, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lz5l;->c(Z)Lu3l;

    move-result-object v2

    iget-object v3, p0, Lz5l;->s:Lpde;

    invoke-static {v3, v2}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3c

    iget-object v2, p0, Lz5l;->d:Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    iget-object v3, p0, Lz5l;->v:Lx2l;

    if-eqz v2, :cond_26

    sget-object p0, Lp2l;->b:Lp2l;

    iput-object p0, v3, Lx2l;->l:Lp2l;

    return-void

    :cond_26
    new-instance v2, Ls5l;

    const/4 v4, 0x5

    invoke-direct {v2, p0, v4}, Ls5l;-><init>(Lz5l;B)V

    new-instance v4, Lt5l;

    invoke-direct {v4, p0, v1}, Lt5l;-><init>(Lz5l;B)V

    invoke-virtual {p0, v2, v4}, Lz5l;->e(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    new-instance v1, Lu5l;

    invoke-direct {v1, p0, v0}, Lu5l;-><init>(Lz5l;B)V

    invoke-virtual {v3, v1}, Lx2l;->P(Ljava/lang/Runnable;)V

    :cond_3c
    return-void
.end method

.method public final b()V
    .registers 3

    iget-object v0, p0, Lz5l;->x:Liv;

    if-eqz v0, :cond_18

    iget-object v1, p0, Lz5l;->v:Lx2l;

    iget-object v1, v1, Lx2l;->m:Lh5k;

    iget-object v1, v1, Lh5k;->c:Ljava/lang/Object;

    check-cast v1, Lvl9;

    iget-object v1, v1, Lvl9;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    if-eqz v1, :cond_15

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_15
    const/4 v0, 0x0

    iput-object v0, p0, Lz5l;->x:Liv;

    :cond_18
    return-void
.end method

.method public final c(Z)Lu3l;
    .registers 5

    sget-object v0, Lu3l;->a:Ls3l;

    iget-object v0, p0, Lz5l;->g:Likc;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lp6l;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_1b

    const/4 v1, 0x1

    if-ne v0, v1, :cond_16

    sget-object v0, Lu3l;->b:Ls3l;

    goto :goto_1d

    :cond_16
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_1b
    sget-object v0, Lu3l;->a:Ls3l;

    :goto_1d
    iget-object v1, p0, Lz5l;->d:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lesi;

    if-eqz p1, :cond_45

    if-eqz v1, :cond_45

    new-instance p1, Lgsi;

    iget-object v2, p0, Lz5l;->b:Lu4l;

    iget-object p0, p0, Lz5l;->h:Landroid/content/res/Resources;

    invoke-direct {p1, v1, v2, p0}, Lgsi;-><init>(Lesi;Lu4l;Landroid/content/res/Resources;)V

    new-instance p0, Lfsi;

    invoke-direct {p0, v1}, Lfsi;-><init>(Lesi;)V

    new-instance v1, Lt3l;

    invoke-direct {v1, p1, p0}, Lt3l;-><init>(Lgsi;Lfsi;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lp3l;

    invoke-direct {p0, v0, v1}, Lp3l;-><init>(Lu3l;Lu3l;)V

    return-object p0

    :cond_45
    return-object v0
.end method

.method public final d(Lb2l;)Lzwg;
    .registers 10

    iget-object v0, p0, Lz5l;->v:Lx2l;

    iget-object v1, v0, Lx2l;->m:Lh5k;

    iget-boolean v1, v1, Lh5k;->a:Z

    if-nez v1, :cond_8d

    iget-object v0, v0, Lx2l;->e:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lng;->a:Lng;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8d

    new-instance v0, Lg6n;

    iget-object p0, p0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {v0, p0}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v0}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_21
    move-object v1, v0

    check-cast v1, Lh6n;

    invoke-virtual {v1}, Lh6n;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8a

    invoke-virtual {v1}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v1

    instance-of v2, v1, Lh5l;

    if-eqz v2, :cond_21

    check-cast v1, Lh5l;

    invoke-virtual {v1}, Lh5l;->X()Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    iget-object p0, v1, Lh5l;->b:Ld5l;

    iget-object v5, p0, Ld5l;->i:Landroid/view/View;

    iget-object p0, v1, Lh5l;->k:Landroid/graphics/drawable/Drawable;

    instance-of p1, p0, Lir;

    if-eqz p1, :cond_8d

    move-object v3, p0

    check-cast v3, Lir;

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_8d

    new-instance v4, Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p0

    invoke-direct {v4, p0}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-static {v5}, Lq9n;->t(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p0

    iget p1, p0, Landroid/graphics/Rect;->left:I

    iget p0, p0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v4, p1, p0}, Landroid/graphics/Rect;->offset(II)V

    iget-object v6, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object p0, v1, Lh5l;->l:Lkol;

    const/4 p1, 0x0

    if-eqz p0, :cond_83

    iget-boolean v0, p0, Lkol;->g:Z

    if-eqz v0, :cond_83

    iget-object p0, p0, Lkol;->i:Lne5;

    if-eqz p0, :cond_83

    const/4 p1, 0x1

    :cond_83
    move v7, p1

    new-instance v2, La3l;

    invoke-direct/range {v2 .. v7}, La3l;-><init>(Lir;Landroid/graphics/Rect;Landroid/view/View;Landroid/view/View;Z)V

    return-object v2

    :cond_8a
    sget-object p0, Ly2l;->a:Ly2l;

    return-object p0

    :cond_8d
    sget-object p0, Lz2l;->a:Lz2l;

    return-object p0
.end method

.method public final e(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V
    .registers 5

    invoke-virtual {p0}, Lz5l;->b()V

    new-instance v0, Liv;

    const/16 v1, 0xd

    invoke-direct {v0, p0, p1, p2, v1}, Liv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Lz5l;->x:Liv;

    iget-object p0, p0, Lz5l;->v:Lx2l;

    invoke-virtual {p0, v0}, Lx2l;->P(Ljava/lang/Runnable;)V

    return-void
.end method
