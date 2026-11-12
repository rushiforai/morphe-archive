.class public final Lasi;
.super Lie;
.source "SourceFile"


# instance fields
.field public final synthetic k:B

.field public final l:Lu3l;


# direct methods
.method public constructor <init>(Lge;Lk6l;Lu4l;Ls9i;Lp9l;)V
    .registers 14

    const/4 v0, 0x1

    iput-byte v0, p0, Lasi;->k:B

    .line 70
    iget-object v0, p4, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lpde;

    .line 71
    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Ljava/util/LinkedHashSet;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    .line 72
    invoke-direct/range {v1 .. v7}, Lie;-><init>(Lge;Lk6l;Lu4l;Ls9i;Lx9l;Ljava/util/LinkedHashSet;)V

    .line 73
    iget-object p0, v5, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lpde;

    .line 74
    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqyi;

    .line 75
    sget-object p1, Loyi;->a:Loyi;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2c

    .line 76
    sget-object p0, Lu3l;->c:Lo3l;

    goto :goto_34

    .line 77
    :cond_2c
    instance-of p1, p0, Lpyi;

    if-eqz p1, :cond_37

    .line 78
    check-cast p0, Lpyi;

    .line 79
    iget-object p0, p0, Lpyi;->b:Lu3l;

    .line 80
    :goto_34
    iput-object p0, v1, Lasi;->l:Lu3l;

    return-void

    :cond_37
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Lge;Lk6l;Lu4l;Ls9i;Lp9l;Lu3l;)V
    .registers 16

    const/4 v0, 0x0

    iput-byte v0, p0, Lasi;->k:B

    iget-object v0, p4, Ls9i;->d:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqyi;

    sget-object v1, Loyi;->a:Loyi;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2b

    sget-object v0, Ly6l;->a:Ly6l;

    invoke-static {p2, p6, v0}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-static {v0, v1}, Lo95;->t(Ljava/lang/Iterable;Ljava/util/Collection;)V

    :goto_23
    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move-object v8, v1

    goto :goto_3b

    :cond_2b
    instance-of v0, v0, Lpyi;

    if-eqz v0, :cond_41

    iget-object v0, p4, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/util/LinkedHashSet;

    goto :goto_23

    :goto_3b
    invoke-direct/range {v2 .. v8}, Lie;-><init>(Lge;Lk6l;Lu4l;Ls9i;Lx9l;Ljava/util/LinkedHashSet;)V

    iput-object p6, v2, Lasi;->l:Lu3l;

    return-void

    :cond_41
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final e(Landroid/view/Menu;)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lasi;->k:B

    iget-object v3, v0, Lie;->f:Ljava/util/LinkedHashSet;

    iget-object v4, v0, Lasi;->l:Lu3l;

    const/4 v5, 0x1

    sget-object v6, Lxd;->a:Lxd;

    sget-object v7, Lee;->a:Lee;

    packed-switch v2, :pswitch_data_284

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-super/range {p0 .. p1}, Lie;->e(Landroid/view/Menu;)V

    new-instance v9, Ljava/util/LinkedHashSet;

    invoke-direct {v9}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_23
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_41

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lb2l;

    check-cast v11, Ld7l;

    iget-object v11, v11, Ld7l;->j:Le7l;

    invoke-interface {v11}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v11

    iget v11, v11, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v9, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_23

    :cond_41
    invoke-interface {v9}, Ljava/util/Set;->size()I

    move-result v10

    if-ne v10, v5, :cond_4f

    invoke-interface {v9, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4f

    move v10, v5

    goto :goto_50

    :cond_4f
    move v10, v2

    :goto_50
    invoke-interface {v9}, Ljava/util/Set;->size()I

    move-result v11

    if-ne v11, v5, :cond_5e

    invoke-interface {v9, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5e

    move v8, v5

    goto :goto_5f

    :cond_5e
    move v8, v2

    :goto_5f
    if-eqz v8, :cond_63

    move-object v11, v9

    goto :goto_65

    :cond_63
    sget-object v11, Lv08;->a:Lv08;

    :goto_65
    invoke-virtual {v3}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_75

    new-instance v2, Lae;

    invoke-direct {v2, v4}, Lae;-><init>(Lu3l;)V

    invoke-virtual {v0, v1, v2}, Lie;->a(Landroid/view/Menu;Lfe;)V

    goto/16 :goto_254

    :cond_75
    iget-object v12, v0, Lie;->d:Ls9i;

    invoke-virtual {v12}, Ls9i;->W()Z

    move-result v12

    sget-object v13, Lld;->a:Lld;

    sget-object v14, Lkd;->a:Lkd;

    sget-object v15, Lqd;->a:Lqd;

    sget-object v5, Ltd;->a:Ltd;

    sget-object v2, Ljd;->a:Ljd;

    move-object/from16 v17, v3

    sget-object v3, Lud;->a:Lud;

    move/from16 v18, v8

    sget-object v8, Lzd;->a:Lzd;

    move-object/from16 v19, v9

    sget-object v9, Lce;->a:Lce;

    if-eqz v12, :cond_130

    if-eqz v10, :cond_99

    invoke-virtual {v0, v1, v5}, Lie;->a(Landroid/view/Menu;Lfe;)V

    goto :goto_d7

    :cond_99
    if-eqz v18, :cond_d2

    invoke-static/range {v19 .. v19}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    invoke-virtual {v0, v5}, Lasi;->g(I)Z

    move-result v5

    if-nez v5, :cond_d2

    invoke-static/range {v19 .. v19}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    invoke-virtual {v0, v5}, Lasi;->f(I)Z

    move-result v5

    if-eqz v5, :cond_d2

    new-instance v5, Lrd;

    invoke-static/range {v19 .. v19}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    move-result v8

    const/4 v10, 0x0

    invoke-direct {v5, v8, v10}, Lrd;-><init>(IZ)V

    invoke-virtual {v0, v1, v5}, Lie;->a(Landroid/view/Menu;Lfe;)V

    invoke-virtual {v0, v1, v9}, Lie;->a(Landroid/view/Menu;Lfe;)V

    goto :goto_d7

    :cond_d2
    if-eqz v18, :cond_d7

    invoke-virtual {v0, v1, v8}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_d7
    :goto_d7
    invoke-virtual {v0, v1, v3}, Lie;->d(Landroid/view/Menu;Lfe;)Landroid/view/SubMenu;

    move-result-object v3

    invoke-virtual {v0, v3, v4, v11}, Lie;->b(Landroid/view/SubMenu;Lu3l;Ljava/util/Set;)V

    invoke-virtual {v0, v1, v2}, Lie;->d(Landroid/view/Menu;Lfe;)Landroid/view/SubMenu;

    move-result-object v2

    invoke-virtual {v0, v2, v14}, Lie;->a(Landroid/view/Menu;Lfe;)V

    invoke-virtual {v0, v2, v13}, Lie;->a(Landroid/view/Menu;Lfe;)V

    invoke-virtual/range {v17 .. v17}, Ljava/util/AbstractCollection;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_106

    invoke-static/range {v17 .. v17}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb2l;

    check-cast v2, Ld7l;

    iget-object v2, v2, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_106

    invoke-virtual {v0, v1, v15}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_106
    invoke-static {v1}, Lie;->c(Landroid/view/Menu;)V

    new-instance v2, Lpd;

    invoke-direct {v2, v4}, Lpd;-><init>(Lu3l;)V

    invoke-virtual {v0, v1, v2}, Lie;->a(Landroid/view/Menu;Lfe;)V

    invoke-static/range {v17 .. v17}, Lexg;->g(Ljava/lang/Iterable;)Z

    move-result v2

    if-eqz v2, :cond_11a

    invoke-virtual {v0, v1, v6}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_11a
    invoke-static/range {v17 .. v17}, Lexg;->i(Ljava/lang/Iterable;)Z

    move-result v2

    if-eqz v2, :cond_123

    invoke-virtual {v0, v1, v7}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_123
    new-instance v2, Lmd;

    sget-object v3, Lvr0;->k:Lvr0;

    const/4 v12, 0x1

    invoke-direct {v2, v12, v3}, Lmd;-><init>(ZLvr0;)V

    invoke-virtual {v0, v1, v2}, Lie;->a(Landroid/view/Menu;Lfe;)V

    goto/16 :goto_254

    :cond_130
    move/from16 v16, v10

    const/4 v12, 0x1

    invoke-virtual/range {v17 .. v17}, Ljava/util/AbstractCollection;->size()I

    move-result v10

    if-ne v10, v12, :cond_1d2

    if-eqz v18, :cond_172

    invoke-static/range {v19 .. v19}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    invoke-virtual {v0, v5}, Lasi;->g(I)Z

    move-result v5

    if-nez v5, :cond_172

    invoke-static/range {v19 .. v19}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    invoke-virtual {v0, v5}, Lasi;->f(I)Z

    move-result v5

    if-eqz v5, :cond_172

    new-instance v5, Lrd;

    invoke-static/range {v19 .. v19}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    const/4 v10, 0x0

    invoke-direct {v5, v6, v10}, Lrd;-><init>(IZ)V

    invoke-virtual {v0, v1, v5}, Lie;->a(Landroid/view/Menu;Lfe;)V

    invoke-virtual {v0, v1, v9}, Lie;->a(Landroid/view/Menu;Lfe;)V

    goto :goto_177

    :cond_172
    if-eqz v18, :cond_177

    invoke-virtual {v0, v1, v8}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_177
    :goto_177
    invoke-virtual {v0, v1, v3}, Lie;->d(Landroid/view/Menu;Lfe;)Landroid/view/SubMenu;

    move-result-object v3

    invoke-virtual {v0, v3, v4, v11}, Lie;->b(Landroid/view/SubMenu;Lu3l;Ljava/util/Set;)V

    invoke-virtual {v0, v1, v2}, Lie;->d(Landroid/view/Menu;Lfe;)Landroid/view/SubMenu;

    move-result-object v2

    invoke-virtual {v0, v2, v14}, Lie;->a(Landroid/view/Menu;Lfe;)V

    invoke-virtual {v0, v2, v13}, Lie;->a(Landroid/view/Menu;Lfe;)V

    invoke-static/range {v17 .. v17}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb2l;

    check-cast v2, Ld7l;

    iget-object v2, v2, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_19f

    invoke-virtual {v0, v1, v15}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_19f
    invoke-static {v1}, Lie;->c(Landroid/view/Menu;)V

    new-instance v2, Lpd;

    invoke-direct {v2, v4}, Lpd;-><init>(Lu3l;)V

    invoke-virtual {v0, v1, v2}, Lie;->a(Landroid/view/Menu;Lfe;)V

    new-instance v2, Lae;

    invoke-direct {v2, v4}, Lae;-><init>(Lu3l;)V

    invoke-virtual {v0, v1, v2}, Lie;->a(Landroid/view/Menu;Lfe;)V

    invoke-static/range {v17 .. v17}, Lexg;->g(Ljava/lang/Iterable;)Z

    move-result v2

    if-eqz v2, :cond_1bd

    sget-object v2, Lwd;->a:Lwd;

    invoke-virtual {v0, v1, v2}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_1bd
    invoke-static/range {v17 .. v17}, Lexg;->i(Ljava/lang/Iterable;)Z

    move-result v2

    if-eqz v2, :cond_1c8

    sget-object v2, Lde;->a:Lde;

    invoke-virtual {v0, v1, v2}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_1c8
    new-instance v2, Lnd;

    invoke-direct {v2}, Lnd;-><init>()V

    invoke-virtual {v0, v1, v2}, Lie;->a(Landroid/view/Menu;Lfe;)V

    goto/16 :goto_254

    :cond_1d2
    if-eqz v16, :cond_1d8

    invoke-virtual {v0, v1, v5}, Lie;->a(Landroid/view/Menu;Lfe;)V

    goto :goto_216

    :cond_1d8
    if-eqz v18, :cond_211

    invoke-static/range {v19 .. v19}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    invoke-virtual {v0, v5}, Lasi;->g(I)Z

    move-result v5

    if-nez v5, :cond_211

    invoke-static/range {v19 .. v19}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    invoke-virtual {v0, v5}, Lasi;->f(I)Z

    move-result v5

    if-eqz v5, :cond_211

    new-instance v5, Lrd;

    invoke-static/range {v19 .. v19}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    move-result v8

    const/4 v10, 0x0

    invoke-direct {v5, v8, v10}, Lrd;-><init>(IZ)V

    invoke-virtual {v0, v1, v5}, Lie;->a(Landroid/view/Menu;Lfe;)V

    invoke-virtual {v0, v1, v9}, Lie;->a(Landroid/view/Menu;Lfe;)V

    goto :goto_216

    :cond_211
    if-eqz v18, :cond_216

    invoke-virtual {v0, v1, v8}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_216
    :goto_216
    invoke-virtual {v0, v1, v3}, Lie;->d(Landroid/view/Menu;Lfe;)Landroid/view/SubMenu;

    move-result-object v3

    invoke-virtual {v0, v3, v4, v11}, Lie;->b(Landroid/view/SubMenu;Lu3l;Ljava/util/Set;)V

    invoke-virtual {v0, v1, v2}, Lie;->d(Landroid/view/Menu;Lfe;)Landroid/view/SubMenu;

    move-result-object v2

    invoke-virtual {v0, v2, v14}, Lie;->a(Landroid/view/Menu;Lfe;)V

    invoke-virtual {v0, v2, v13}, Lie;->a(Landroid/view/Menu;Lfe;)V

    invoke-static {v1}, Lie;->c(Landroid/view/Menu;)V

    new-instance v2, Lpd;

    invoke-direct {v2, v4}, Lpd;-><init>(Lu3l;)V

    invoke-virtual {v0, v1, v2}, Lie;->a(Landroid/view/Menu;Lfe;)V

    new-instance v2, Lae;

    invoke-direct {v2, v4}, Lae;-><init>(Lu3l;)V

    invoke-virtual {v0, v1, v2}, Lie;->a(Landroid/view/Menu;Lfe;)V

    invoke-static/range {v17 .. v17}, Lexg;->g(Ljava/lang/Iterable;)Z

    move-result v2

    if-eqz v2, :cond_243

    invoke-virtual {v0, v1, v6}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_243
    invoke-static/range {v17 .. v17}, Lexg;->i(Ljava/lang/Iterable;)Z

    move-result v2

    if-eqz v2, :cond_24c

    invoke-virtual {v0, v1, v7}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_24c
    new-instance v2, Lod;

    invoke-direct {v2}, Lod;-><init>()V

    invoke-virtual {v0, v1, v2}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :goto_254
    return-void

    :pswitch_255
    move-object/from16 v17, v3

    invoke-super/range {p0 .. p1}, Lie;->e(Landroid/view/Menu;)V

    new-instance v2, Lbe;

    invoke-direct {v2, v4}, Lbe;-><init>(Lu3l;)V

    invoke-virtual {v0, v1, v2}, Lie;->a(Landroid/view/Menu;Lfe;)V

    invoke-static/range {v17 .. v17}, Lexg;->g(Ljava/lang/Iterable;)Z

    move-result v2

    if-eqz v2, :cond_26b

    invoke-virtual {v0, v1, v6}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_26b
    invoke-static/range {v17 .. v17}, Lexg;->i(Ljava/lang/Iterable;)Z

    move-result v2

    if-eqz v2, :cond_274

    invoke-virtual {v0, v1, v7}, Lie;->a(Landroid/view/Menu;Lfe;)V

    :cond_274
    invoke-static {v1}, Lie;->c(Landroid/view/Menu;)V

    new-instance v2, Lmd;

    sget-object v3, Lvr0;->f:Lvr0;

    const/4 v12, 0x1

    invoke-direct {v2, v12, v3}, Lmd;-><init>(ZLvr0;)V

    invoke-virtual {v0, v1, v2}, Lie;->a(Landroid/view/Menu;Lfe;)V

    return-void

    nop

    :pswitch_data_284
    .packed-switch 0x0
        :pswitch_255
    .end packed-switch
.end method

.method public final f(I)Z
    .registers 4

    sget-object v0, Lu3l;->a:Ls3l;

    new-instance v0, Lr3l;

    invoke-direct {v0, p1}, Lr3l;-><init>(I)V

    sget-object p1, Ly6l;->a:Ly6l;

    iget-object v1, p0, Lie;->b:Lk6l;

    invoke-static {v1, v0, p1}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object p1

    iget-object p0, p0, Lie;->d:Ls9i;

    invoke-virtual {p0, p1}, Ls9i;->X(Ljava/util/Collection;)Z

    move-result p0

    return p0
.end method

.method public final g(I)Z
    .registers 2

    iget-object p0, p0, Lie;->e:Lx9l;

    invoke-interface {p0}, Lx9l;->C()Likc;

    move-result-object p0

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method
