.class public final synthetic Leek;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 12
    iput-byte p3, p0, Leek;->a:B

    iput-object p1, p0, Leek;->b:Ljava/lang/Object;

    iput-object p2, p0, Leek;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lsjl;Lrf1;Ltb1;)V
    .registers 4

    const/16 p1, 0x10

    iput-byte p1, p0, Leek;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Leek;->b:Ljava/lang/Object;

    iput-object p3, p0, Leek;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 25

    move-object/from16 v0, p0

    iget-byte v1, v0, Leek;->a:B

    const/16 v2, 0x8

    const/16 v3, 0x1b

    const/4 v4, 0x4

    const/4 v5, -0x1

    const/16 v6, 0x16

    const/4 v7, 0x3

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x2

    const/4 v11, 0x0

    packed-switch v1, :pswitch_data_554

    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lh6o;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    move-object v15, v0

    check-cast v15, Ltsd;

    iget-object v0, v1, Lh6o;->k:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0d0499

    invoke-virtual {v2, v3, v0, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_62

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-static {v0}, Lkf;->b(Landroid/widget/FrameLayout;)Lkf;

    move-result-object v13

    new-instance v12, Ll6o;

    iget-object v14, v1, Lh6o;->l:Ltsd;

    new-instance v16, Llrk;

    iget-object v0, v1, Lh6o;->j:Lw6o;

    const-class v19, Lw6o;

    const-string v20, "onCardItemFullyVisible"

    const-string v21, "onCardItemFullyVisible$app(Lcom/opera/android/startpage/livescore/worldcup/WorldCupPromoCardAspectItem;)V"

    const/16 v22, 0x0

    const/16 v23, 0x1a

    const/16 v17, 0x1

    move-object/from16 v18, v0

    invoke-direct/range {v16 .. v23}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    sget-object v17, Lk6o;->a:Lk6o;

    new-instance v0, Lq0n;

    invoke-direct {v0, v6}, Lq0n;-><init>(B)V

    move-object/from16 v19, v16

    const v16, 0x7f0d049a

    move-object/from16 v18, v0

    invoke-direct/range {v12 .. v19}, Ld7o;-><init>(Lkf;Ltsd;Ltsd;ILkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    move-object v11, v12

    goto :goto_67

    :cond_62
    const-string v0, "rootView"

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_67
    return-object v11

    :pswitch_68
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lh6o;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Lpk4;

    iget-object v1, v1, Lh6o;->j:Lw6o;

    invoke-virtual {v1, v0}, Lw6o;->d(Lsk4;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_78
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lh6o;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Ltsd;

    iget-object v2, v1, Lh6o;->k:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f0d0496

    invoke-virtual {v3, v4, v2, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_b3

    check-cast v2, Landroid/widget/FrameLayout;

    invoke-static {v2}, Lkf;->b(Landroid/widget/FrameLayout;)Lkf;

    move-result-object v2

    new-instance v11, Le6o;

    iget-object v3, v1, Lh6o;->l:Ltsd;

    new-instance v12, Llrk;

    iget-object v14, v1, Lh6o;->j:Lw6o;

    const-class v15, Lw6o;

    const-string v16, "onCardItemFullyVisible"

    const-string v17, "onCardItemFullyVisible$app(Lcom/opera/android/startpage/livescore/worldcup/WorldCupPromoCardAspectItem;)V"

    const/16 v18, 0x0

    const/16 v19, 0x19

    const/4 v13, 0x1

    invoke-direct/range {v12 .. v19}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {v11, v2, v3, v0, v12}, Le6o;-><init>(Lkf;Ltsd;Ltsd;Llrk;)V

    goto :goto_b8

    :cond_b3
    const-string v0, "rootView"

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_b8
    return-object v11

    :pswitch_b9
    iget-object v0, v0, Leek;->b:Ljava/lang/Object;

    check-cast v0, Lrii;

    iget-object v0, v0, Lrii;->b:Ljava/lang/Object;

    check-cast v0, Lvij;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lvij;->b:Ljava/util/concurrent/locks/ReentrantLock;

    monitor-enter v0

    monitor-exit v0

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_cb
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lmyn;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Landroid/os/Bundle;

    const-string v2, ", "

    iget-object v3, v1, Lmyn;->d:Lt0g;

    invoke-virtual {v3}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iget-object v4, v1, Lmyn;->a:Lt0g;

    invoke-virtual {v4}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v1, v1, Lmyn;->g:Lt0g;

    invoke-virtual {v1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwc1;

    if-eqz v1, :cond_106

    new-instance v11, Lkotlin/Pair;

    iget-object v1, v1, Lwc1;->a:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/view/View;->getScrollX()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1}, Landroid/view/View;->getScrollY()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v11, v5, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_106
    const-string v1, "WebViewStateSaver Save: "

    invoke-static {v1, v3, v2, v4, v2}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_11a
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lqln;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v2, v1, Lqln;->f:Lami;

    invoke-static {v0}, Lam2;->a(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Lvep;->A(I)I

    move-result v3

    if-eqz v3, :cond_16a

    const/16 v4, 0x15

    if-eq v3, v4, :cond_165

    if-eq v3, v6, :cond_15a

    iget-object v2, v2, Lami;->g:Ljava/lang/Object;

    check-cast v2, Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v2

    new-instance v3, Ln0h;

    invoke-direct {v3, v0, v10}, Ln0h;-><init>(Ljava/lang/String;B)V

    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v0

    invoke-virtual {v1, v0}, Lqln;->c(Ljava/util/stream/Stream;)Ljava/util/stream/Stream;

    move-result-object v0

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    goto :goto_178

    :cond_15a
    iget-object v0, v2, Lami;->h:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    goto :goto_178

    :cond_165
    invoke-virtual {v1}, Lqln;->e()Ljava/util/List;

    move-result-object v0

    goto :goto_178

    :cond_16a
    iget-object v0, v2, Lami;->d:Ljava/lang/Object;

    check-cast v0, Ls14;

    iget-object v0, v0, Ls14;->f:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    :goto_178
    return-object v0

    :pswitch_179
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Ltcc;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Lh9;

    invoke-virtual {v1, v0}, Ltcc;->b(Lmdc;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_187
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Ld4;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Ltu4;

    invoke-virtual {v1, v0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_195
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Ld4;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Ls5n;

    invoke-virtual {v1, v0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1a3
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Lgpm;

    iget-object v2, v0, Lgpm;->g:Ljava/lang/String;

    const-string v3, ""

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1da

    iget-object v0, v0, Lgpm;->i:Lvgm;

    iget-object v0, v0, Lvgm;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v0, v7

    const/16 v1, 0x2f

    invoke-static {v2, v1, v0, v4}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v0

    if-eq v0, v5, :cond_1da

    new-array v1, v10, [C

    fill-array-data v1, :array_592

    invoke-static {v2, v1, v0}, Lkotlin/text/StringsKt;->M(Ljava/lang/CharSequence;[CI)I

    move-result v1

    if-ne v1, v5, :cond_1d6

    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_1da

    :cond_1d6
    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    :cond_1da
    :goto_1da
    return-object v3

    :pswitch_1db
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lrlm;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iput-boolean v8, v1, Lrlm;->g:Z

    iget-object v2, v1, Lrlm;->c:Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lnlm;

    iget-object v5, v5, Lnlm;->b:Lr22;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lnlm;

    iget-object v6, v6, Lnlm;->c:Ljava/util/Set;

    invoke-virtual {v1, v5, v6}, Lrlm;->f(Lr22;Ljava/util/Set;)Lnlm;

    move-result-object v5

    invoke-virtual {v2, v5}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v2, v1, Lrlm;->b:Lw6j;

    new-instance v5, Lelm;

    iget-object v6, v1, Lrlm;->d:Ljava/util/ArrayList;

    iget-object v7, v1, Lrlm;->e:Ljava/util/LinkedHashMap;

    invoke-direct {v5, v0, v6, v7}, Lelm;-><init>(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/LinkedHashMap;)V

    new-instance v0, Lp7l;

    invoke-direct {v0, v1, v3}, Lp7l;-><init>(Ljava/lang/Object;B)V

    iget-object v1, v2, Lw6j;->b:Ljava/lang/Object;

    check-cast v1, Lumi;

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v6, Lgil;

    const/16 v7, 0xf

    invoke-direct {v6, v2, v5, v7}, Lgil;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lo62;

    invoke-direct {v2, v6, v4}, Lo62;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, v2}, Lumi;->g(Ln5o;)Lnml;

    move-result-object v2

    new-instance v4, Lplk;

    new-instance v5, Leyi;

    invoke-direct {v5, v3, v2}, Leyi;-><init>(Ljava/lang/Object;Lnml;)V

    invoke-direct {v4, v1, v2, v5, v11}, Lplk;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Lqfl;

    invoke-direct {v1, v0, v7}, Lqfl;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v1}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    invoke-virtual {v0}, Lplk;->l()Loml;

    return-object v3

    :pswitch_23b
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lplk;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    iget-object v1, v1, Lplk;->a:Ljava/lang/Object;

    check-cast v1, Ltcl;

    new-instance v2, Lo62;

    invoke-direct {v2, v0, v10}, Lo62;-><init>(Lkotlin/jvm/functions/Function1;B)V

    check-cast v1, Lumi;

    invoke-virtual {v1, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v0

    return-object v0

    :pswitch_253
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lmhk;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Lve4;

    iget-object v1, v1, Lmhk;->c:Ljava/lang/Object;

    check-cast v1, Loe4;

    iget-object v1, v1, Loe4;->a:Ljava/util/concurrent/Executor;

    if-nez v1, :cond_284

    sget-object v1, Lmb1;->b:Ljava/util/concurrent/ThreadFactory;

    const-string v3, "CXCP-Camera-E"

    invoke-static {v9}, Lc26;->j(I)Lbf2;

    move-result-object v4

    new-instance v5, Llb1;

    invoke-direct {v5, v1, v3, v4}, Llb1;-><init>(Ljava/util/concurrent/ThreadFactory;Ljava/lang/String;Lbf2;)V

    new-instance v1, Lkb1;

    const/4 v3, -0x3

    invoke-direct {v1, v3, v5}, Lkb1;-><init>(ILlb1;)V

    invoke-static {v8, v1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    sget-object v3, Lte4;->c:Lte4;

    new-instance v4, Lcbl;

    invoke-direct {v4, v1, v2}, Lcbl;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v3, v4}, Lve4;->a(Lte4;Ljava/lang/Runnable;)V

    :cond_284
    return-object v1

    :pswitch_285
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lrf1;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Ltb1;

    iget-object v1, v1, Lrf1;->a:Ljava/lang/Object;

    check-cast v1, Lpfc;

    instance-of v2, v1, Lofc;

    if-eqz v2, :cond_2a8

    move-object v2, v1

    check-cast v2, Lofc;

    iget-object v2, v2, Lofc;->c:Ltfc;

    if-eqz v2, :cond_2a0

    invoke-interface {v2}, Ltfc;->a()V

    goto :goto_2b5

    :cond_2a0
    :try_start_2a0
    check-cast v1, Lofc;

    iget-object v1, v1, Lofc;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ltb1;->a(Ljava/lang/String;)V
    :try_end_2a7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2a0 .. :try_end_2a7} :catch_2b5

    goto :goto_2b5

    :cond_2a8
    instance-of v0, v1, Lnfc;

    if-eqz v0, :cond_2b5

    check-cast v1, Lnfc;

    iget-object v0, v1, Lnfc;->c:Lz8k;

    if-eqz v0, :cond_2b5

    invoke-virtual {v0}, Lz8k;->a()V

    :catch_2b5
    :cond_2b5
    :goto_2b5
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2b8
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Ldil;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Lafe;

    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgcb;

    iget-wide v2, v0, Lgcb;->a:J

    invoke-virtual {v1}, Ldil;->g()Ly8f;

    move-result-object v0

    const-wide v12, 0x7fc000007fc00000L    # 2.247117487993712E307

    if-eqz v0, :cond_39c

    iget-wide v14, v0, Ly8f;->a:J

    invoke-virtual {v1}, Ldil;->k()Lsf1;

    move-result-object v0

    if-eqz v0, :cond_39c

    iget-object v0, v0, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_39c

    iget-object v0, v1, Ldil;->q:Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lx6a;

    if-nez v0, :cond_2ef

    move v0, v5

    goto :goto_2f7

    :cond_2ef
    sget-object v4, Lfil;->a:[I

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v4, v0

    :goto_2f7
    if-eq v0, v5, :cond_39c

    const-wide v4, 0xffffffffL

    const/16 v6, 0x20

    if-eq v0, v8, :cond_316

    if-eq v0, v10, :cond_316

    if-ne v0, v7, :cond_311

    invoke-virtual {v1}, Ldil;->l()Lmil;

    move-result-object v0

    iget-wide v7, v0, Lmil;->b:J

    sget v0, Lxjl;->c:I

    and-long/2addr v7, v4

    :goto_30f
    long-to-int v0, v7

    goto :goto_320

    :cond_311
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_3a1

    :cond_316
    invoke-virtual {v1}, Ldil;->l()Lmil;

    move-result-object v0

    iget-wide v7, v0, Lmil;->b:J

    sget v0, Lxjl;->c:I

    shr-long/2addr v7, v6

    goto :goto_30f

    :goto_320
    iget-object v7, v1, Ldil;->d:Lgbc;

    if-eqz v7, :cond_39c

    invoke-virtual {v7}, Lgbc;->d()Lojl;

    move-result-object v7

    if-eqz v7, :cond_39c

    iget-object v8, v1, Ldil;->d:Lgbc;

    if-eqz v8, :cond_39c

    iget-object v8, v8, Lgbc;->a:Lcy;

    iget-object v8, v8, Lcy;->b:Ljava/lang/Object;

    check-cast v8, Lsf1;

    if-eqz v8, :cond_39c

    iget-object v1, v1, Ldil;->b:Li9f;

    invoke-interface {v1, v0}, Li9f;->i(I)I

    move-result v0

    iget-object v1, v8, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {v0, v9, v1}, Ldjh;->c(III)I

    move-result v0

    invoke-virtual {v7, v14, v15}, Lojl;->d(J)J

    move-result-wide v8

    shr-long/2addr v8, v6

    long-to-int v1, v8

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    iget-object v7, v7, Lojl;->a:Lnjl;

    iget-object v8, v7, Lnjl;->b:Lxbe;

    invoke-virtual {v8, v0}, Lxbe;->d(I)I

    move-result v0

    invoke-virtual {v7, v0}, Lnjl;->e(I)F

    move-result v9

    invoke-virtual {v7, v0}, Lnjl;->f(I)F

    move-result v7

    invoke-static {v9, v7}, Ljava/lang/Math;->min(FF)F

    move-result v11

    invoke-static {v9, v7}, Ljava/lang/Math;->max(FF)F

    move-result v7

    invoke-static {v1, v11, v7}, Ldjh;->b(FFF)F

    move-result v7

    const-wide/16 v14, 0x0

    invoke-static {v2, v3, v14, v15}, Lgcb;->a(JJ)Z

    move-result v9

    if-nez v9, :cond_381

    sub-float/2addr v1, v7

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    shr-long/2addr v2, v6

    long-to-int v2, v2

    div-int/2addr v2, v10

    int-to-float v2, v2

    cmpl-float v1, v1, v2

    if-gtz v1, :cond_39c

    :cond_381
    invoke-virtual {v8, v0}, Lxbe;->f(I)F

    move-result v1

    invoke-virtual {v8, v0}, Lxbe;->b(I)F

    move-result v0

    sub-float/2addr v0, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    add-float/2addr v0, v1

    invoke-static {v7}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    int-to-long v1, v1

    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    int-to-long v7, v0

    shl-long/2addr v1, v6

    and-long/2addr v7, v4

    or-long v12, v1, v7

    :cond_39c
    new-instance v11, Ly8f;

    invoke-direct {v11, v12, v13}, Ly8f;-><init>(J)V

    :goto_3a1
    return-object v11

    :pswitch_3a2
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lnx5;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    sget-object v2, Lrx5;->d:Lrx5;

    new-instance v3, Lwc2;

    invoke-direct {v3, v0, v11, v10}, Lwc2;-><init>(Lkotlin/jvm/functions/Function1;Lmt5;B)V

    invoke-static {v1, v11, v2, v3, v8}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3b7
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/textclassifier/TextClassification;

    invoke-virtual {v0}, Landroid/view/textclassifier/TextClassification;->getText()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3c9

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v9

    :cond_3c9
    invoke-virtual {v0}, Landroid/view/textclassifier/TextClassification;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const/high16 v2, 0xc000000

    invoke-static {v1, v9, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x22

    if-lt v1, v2, :cond_3dd

    invoke-static {v0}, Lg8;->K(Landroid/app/PendingIntent;)V

    goto :goto_3e0

    :cond_3dd
    invoke-virtual {v0}, Landroid/app/PendingIntent;->send()V

    :goto_3e0
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3e3
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, La21;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v1, v0}, La21;->L(Ljava/lang/Long;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3f1
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lv9l;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Lp6l;

    invoke-virtual {v1, v0}, Lv9l;->a(Lp6l;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3ff
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lr9l;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Lb3c;

    iget-object v1, v1, Lr9l;->y:Lz9j;

    invoke-static {v1, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_40f
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Leme;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Lr9l;

    new-instance v2, Lvvb;

    new-instance v3, Luvb;

    new-instance v4, Lh9l;

    invoke-direct {v4, v1, v0, v9}, Lh9l;-><init>(Leme;Lr9l;B)V

    const v5, 0x7f0a05da

    const/16 v6, 0x30

    invoke-direct {v3, v5, v10, v6, v4}, Luvb;-><init>(IIILtvb;)V

    new-instance v4, Luvb;

    new-instance v5, Lh9l;

    invoke-direct {v5, v1, v0, v8}, Lh9l;-><init>(Leme;Lr9l;B)V

    const v0, 0x7f0a05db

    const/4 v1, 0x6

    const/16 v6, 0x2a

    invoke-direct {v4, v0, v1, v6, v5}, Luvb;-><init>(IIILtvb;)V

    filled-new-array {v3, v4}, [Luvb;

    move-result-object v0

    invoke-direct {v2, v0}, Lvvb;-><init>([Luvb;)V

    return-object v2

    :pswitch_440
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, La5l;

    const-class v2, Lcom/opera/android/tabui2/siteimages/ImageUrlRepDatabase;

    const-string v3, "tab_image_urls"

    invoke-static {v1, v2, v3}, Lxih;->f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;

    move-result-object v1

    new-instance v2, Lt5i;

    invoke-direct {v2, v0, v8}, Lt5i;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v1, Lu5i;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Lu5i;->b()Ly5i;

    move-result-object v0

    check-cast v0, Lcom/opera/android/tabui2/siteimages/ImageUrlRepDatabase;

    return-object v0

    :pswitch_461
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lg4l;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Luz3;

    iget-object v2, v1, Lg4l;->j:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_476

    iget-object v1, v1, Lg4l;->g:Lbp3;

    invoke-virtual {v1, v0}, Lbp3;->h(Luz3;)V

    :cond_476
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_479
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lqwk;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Ltsd;

    iget-object v2, v1, Lqwk;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f0d03be

    invoke-virtual {v3, v4, v2, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_4a2

    check-cast v2, Landroid/widget/FrameLayout;

    invoke-static {v2}, Lkf;->b(Landroid/widget/FrameLayout;)Lkf;

    move-result-object v2

    new-instance v11, Luwk;

    iget-object v1, v1, Lqwk;->h:Ltsd;

    invoke-direct {v11, v2, v1, v0}, Luwk;-><init>(Lkf;Ltsd;Ltsd;)V

    goto :goto_4a7

    :cond_4a2
    const-string v0, "rootView"

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_4a7
    return-object v11

    :pswitch_4a8
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Ldtk;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    sget-object v2, Ljgk;->a:Lan2;

    iget-object v1, v1, Ldtk;->a:Lge4;

    invoke-static {v1, v0}, Ljgk;->a(Lge4;Ljava/util/List;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_4bd
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lmrk;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Ldbf;

    new-instance v2, Loqk;

    iget-object v3, v1, Lmrk;->l:Lx5f;

    new-instance v4, Lbrk;

    invoke-direct {v4, v1, v10}, Lbrk;-><init>(Lmrk;B)V

    invoke-direct {v2, v3, v4, v0}, Loqk;-><init>(Lx5f;Lbrk;Ldbf;)V

    return-object v2

    :pswitch_4d2
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lmrk;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Lgjm;

    iget-object v2, v1, Lmrk;->c:Lfbf;

    iget-object v3, v2, Lfbf;->a:Lgbf;

    iget-object v3, v3, Lgbf;->t:Lbpd;

    invoke-virtual {v3}, Lbpd;->y()Lupm;

    move-result-object v3

    invoke-interface {v3}, Lupm;->h()V

    iget-object v2, v2, Lfbf;->a:Lgbf;

    iget-object v2, v2, Lgbf;->m:Ldbf;

    iput-boolean v8, v2, Ldbf;->p:Z

    new-instance v2, Ltca;

    sget-object v3, Lsca;->b:Lsca;

    invoke-direct {v2, v3}, Ltca;-><init>(Lsca;)V

    iget-object v3, v1, Lmrk;->u:Lfe5;

    new-instance v4, Lzqk;

    invoke-direct {v4, v1, v7}, Lzqk;-><init>(Lmrk;B)V

    new-instance v1, Lt7d;

    const/16 v5, 0x17

    invoke-direct {v1, v4, v5}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v2, v3, v1}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_508
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lhfk;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_519
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Lhfk;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Lafe;

    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmfk;

    if-eqz v0, :cond_52b

    iget-object v11, v0, Lmfk;->a:Llfk;

    :cond_52b
    invoke-interface {v1, v11}, Lhfk;->b(Llfk;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_531
    iget-object v1, v0, Leek;->b:Ljava/lang/Object;

    check-cast v1, Ljek;

    iget-object v0, v0, Leek;->c:Ljava/lang/Object;

    check-cast v0, Lv1e;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lk54;

    invoke-direct {v4, v1, v0, v11, v2}, Lk54;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    new-instance v0, Lxd6;

    const/16 v2, 0xb

    invoke-direct {v0, v4, v2}, Lxd6;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lagb;

    invoke-direct {v2, v3, v11, v1}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    new-instance v1, Lz99;

    invoke-direct {v1, v0, v2, v10}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    return-object v1

    nop

    :pswitch_data_554
    .packed-switch 0x0
        :pswitch_531
        :pswitch_519
        :pswitch_508
        :pswitch_4d2
        :pswitch_4bd
        :pswitch_4a8
        :pswitch_479
        :pswitch_461
        :pswitch_440
        :pswitch_40f
        :pswitch_3ff
        :pswitch_3f1
        :pswitch_3e3
        :pswitch_3b7
        :pswitch_3a2
        :pswitch_2b8
        :pswitch_285
        :pswitch_253
        :pswitch_23b
        :pswitch_1db
        :pswitch_1a3
        :pswitch_195
        :pswitch_187
        :pswitch_179
        :pswitch_11a
        :pswitch_cb
        :pswitch_b9
        :pswitch_78
        :pswitch_68
    .end packed-switch

    :array_592
    .array-data 2
        0x3fs
        0x23s
    .end array-data
.end method
