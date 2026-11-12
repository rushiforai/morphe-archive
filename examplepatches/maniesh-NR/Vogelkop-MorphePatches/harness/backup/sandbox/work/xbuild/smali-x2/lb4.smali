.class public final synthetic Llb4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Llb4;->a:B

    iput-object p1, p0, Llb4;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 16

    iget-byte v0, p0, Llb4;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    iget-object p0, p0, Llb4;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_434

    check-cast p0, Ltxi;

    invoke-virtual {p0}, Ltxi;->j()V

    return-void

    :pswitch_11
    check-cast p0, Lo16;

    new-instance v0, Lcom/opera/android/autofill/AutofillManager;

    invoke-direct {v0}, Lcom/opera/android/autofill/AutofillManager;-><init>()V

    new-instance v1, Lhu5;

    invoke-direct {v1, p0, v0, v2}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lcom/opera/android/autofill/AutofillManager;->e(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_21
    check-cast p0, La06;

    iget-boolean v0, p0, La06;->t:Z

    if-nez v0, :cond_32

    iput-boolean v4, p0, La06;->t:Z

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-virtual {p0}, Lryl;->g0()V

    :cond_32
    return-void

    :pswitch_33
    check-cast p0, Ligi;

    iget-object v0, p0, Ligi;->g:Ljava/lang/Object;

    check-cast v0, Lqb7;

    iget-object v0, v0, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Ligi;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Ligi;->c:Ljava/lang/Object;

    check-cast v1, Llh4;

    move-object v2, v0

    check-cast v2, Ljava/lang/Iterable;

    instance-of v3, v2, Ljava/util/Collection;

    if-eqz v3, :cond_5e

    move-object v3, v2

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_78

    :cond_5e
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_62
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_78

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lp58;

    iget-boolean v3, v3, Lp58;->a:Z

    if-eqz v3, :cond_62

    new-instance p0, Lrw7;

    invoke-direct {p0, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto :goto_9a

    :cond_78
    iget-object v0, p0, Ligi;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v4

    iget-object p0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p0, Lvj5;

    iget-object v3, p0, Lvj5;->p:Ljava/lang/String;

    iget-object v5, p0, Lvj5;->r:Lffb;

    iget-object v6, p0, Lvj5;->s:Lffb;

    iget-boolean v7, p0, Lvj5;->t:Z

    iget-boolean v8, p0, Lvj5;->u:Z

    new-instance v2, Lwj5;

    invoke-direct/range {v2 .. v8}, Lwj5;-><init>(Ljava/lang/String;Ljava/util/List;Lffb;Lffb;ZZ)V

    new-instance p0, Lsw7;

    invoke-direct {p0, v2}, Lsw7;-><init>(Ljava/lang/Object;)V

    :goto_9a
    invoke-virtual {v1, p0}, Llh4;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_9e
    check-cast p0, Lhk5;

    iput-object v3, p0, Lhk5;->d:Ljava/lang/Object;

    iget-object v0, p0, Lhk5;->b:Ljava/lang/Object;

    check-cast v0, Lki5;

    invoke-virtual {v0}, Lki5;->invoke()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lhk5;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_ae
    check-cast p0, Ll45;

    iget-object v0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast v0, Lwj5;

    new-instance v1, Luj5;

    iget-object v2, v0, Lwj5;->p:Ljava/lang/String;

    iget-object v3, v0, Lwj5;->q:Ljava/util/List;

    iget-object v4, v0, Lwj5;->r:Lffb;

    iget-object v5, v0, Lwj5;->s:Lffb;

    iget-boolean v6, v0, Lwj5;->t:Z

    iget-boolean v7, v0, Lwj5;->u:Z

    invoke-direct/range {v1 .. v7}, Luj5;-><init>(Ljava/lang/String;Ljava/util/List;Lffb;Lffb;ZZ)V

    new-instance v0, Lsw7;

    invoke-direct {v0, v1}, Lsw7;-><init>(Ljava/lang/Object;)V

    iget-object v1, p0, Ll45;->c:Ljava/lang/Object;

    check-cast v1, Lr9i;

    iget-object v1, v1, Lr9i;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashSet;

    invoke-interface {v1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Ll45;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_dd
    check-cast p0, Lxi5;

    iget-object p0, p0, Lxi5;->i:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_e5
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f5

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lti5;

    invoke-interface {v0}, Lti5;->n()V

    goto :goto_e5

    :cond_f5
    return-void

    :pswitch_f6
    check-cast p0, Lce5;

    invoke-static {p0}, Lce5;->c(Lce5;)V

    return-void

    :pswitch_fc
    check-cast p0, Lud5;

    iget-object v0, p0, Lud5;->b:Ljava/lang/Runnable;

    if-eqz v0, :cond_107

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    iput-object v3, p0, Lud5;->b:Ljava/lang/Runnable;

    :cond_107
    return-void

    :pswitch_108
    check-cast p0, Lqc5;

    iget-object v0, p0, Lqc5;->f:Lcom/opera/android/suggestion/CompactSuggestionView;

    iget-object v0, v0, Lcom/opera/android/suggestion/CompactSuggestionView;->c:Lhqk;

    if-eqz v0, :cond_117

    iget-object p0, p0, Lqc5;->d:Lcom/opera/android/suggestion/Suggestion;

    if-eqz p0, :cond_117

    invoke-virtual {v0, p0, v4}, Lhqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    :cond_117
    return-void

    :pswitch_118
    check-cast p0, Lx65;

    iget-boolean v0, p0, Lx65;->y:Z

    if-eqz v0, :cond_133

    iget-boolean v0, p0, Lx65;->C:Z

    if-nez v0, :cond_133

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getHost()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_133

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isStateSaved()Z

    move-result v0

    if-nez v0, :cond_133

    sget-object v0, Lyim;->c:Lyim;

    invoke-virtual {p0, v0}, Lx65;->n0(Lyim;)V

    :cond_133
    return-void

    :pswitch_134
    check-cast p0, Lj55;

    iget-object v0, p0, Lj55;->p:Li55;

    iget-object v0, v0, Li55;->a:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lj55;->h(Ljava/lang/String;)Li55;

    move-result-object v0

    invoke-virtual {p0, v0, v4}, Lj55;->j(Li55;Z)V

    return-void

    :pswitch_142
    check-cast p0, Lujp;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lt8;->a:Landroid/content/Context;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "clipboard.last.copied.image.uri"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, "clipboard.last.copied.image.uri_timestamp"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void

    :pswitch_163
    check-cast p0, La55;

    iget-object v0, p0, La55;->a:Lpjn;

    new-instance v1, Liu2;

    const/16 v2, 0x10

    invoke-direct {v1, p0, v2}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lpjn;->g(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_172
    check-cast p0, Lt35;

    invoke-virtual {p0, v4}, Lt35;->s(Z)V

    return-void

    :pswitch_178
    check-cast p0, Luz4;

    iget-object v0, p0, Luz4;->a:Lcom/opera/android/widget/ThumbScroller;

    iget v2, p0, Luz4;->g:I

    iget v5, p0, Luz4;->h:I

    iget v6, p0, Luz4;->i:I

    iget v7, p0, Luz4;->j:I

    invoke-virtual {p0}, Luz4;->a()Lhuh;

    move-result-object v8

    iget-object v9, p0, Luz4;->d:Lysl;

    invoke-interface {v9}, Lysl;->q()Z

    move-result v10

    if-eqz v10, :cond_194

    invoke-interface {v9}, Lysl;->h()I

    move-result v1

    :cond_194
    invoke-interface {v9}, Lysl;->h()I

    move-result v10

    iget v11, v8, Lhuh;->k:F

    float-to-double v11, v11

    invoke-static {v11, v12}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v11

    double-to-int v11, v11

    sub-int/2addr v10, v11

    invoke-virtual {v8}, Lhuh;->b()I

    move-result v11

    sub-int/2addr v11, v10

    invoke-interface {v9}, Lysl;->A()I

    move-result v12

    iget v13, v8, Lhuh;->d:F

    invoke-virtual {v8, v13}, Lhuh;->a(F)F

    move-result v8

    float-to-double v13, v8

    invoke-static {v13, v14}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v13

    double-to-int v8, v13

    sub-int/2addr v8, v11

    int-to-float v10, v10

    int-to-float v8, v8

    div-float/2addr v10, v8

    const/4 v8, 0x0

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-static {v10, v8, v11}, Lcs5;->s(FFF)F

    move-result v10

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v13

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v14

    sub-int/2addr v13, v14

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v14

    sub-int/2addr v13, v14

    sub-int/2addr v13, v1

    sub-int/2addr v13, v12

    iget-object v12, v0, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v12}, Landroid/view/View;->getHeight()I

    move-result v12

    sub-int/2addr v13, v12

    int-to-float v12, v13

    mul-float/2addr v10, v12

    float-to-int v10, v10

    add-int/2addr v1, v10

    iput v1, p0, Luz4;->g:I

    invoke-interface {v9}, Lysl;->A()I

    move-result v1

    iput v1, p0, Luz4;->h:I

    invoke-virtual {p0}, Luz4;->a()Lhuh;

    move-result-object v1

    iget v10, v1, Lhuh;->b:F

    invoke-virtual {v1, v10}, Lhuh;->a(F)F

    move-result v1

    float-to-double v12, v1

    invoke-static {v12, v13}, Ljava/lang/Math;->floor(D)D

    move-result-wide v12

    double-to-int v1, v12

    iput v1, p0, Luz4;->i:I

    invoke-virtual {p0}, Luz4;->a()Lhuh;

    move-result-object v1

    invoke-virtual {v1}, Lhuh;->c()I

    move-result v1

    iput v1, p0, Luz4;->j:I

    iget v10, p0, Luz4;->g:I

    if-ne v2, v10, :cond_20e

    iget v2, p0, Luz4;->h:I

    if-ne v5, v2, :cond_20e

    iget v2, p0, Luz4;->i:I

    if-ne v6, v2, :cond_20e

    if-eq v7, v1, :cond_24a

    :cond_20e
    iget v1, v0, Lcom/opera/android/widget/ThumbScroller;->g:I

    if-ne v1, v4, :cond_24a

    iget-object v1, v0, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Lcom/opera/android/widget/ThumbScroller;->b()I

    move-result v2

    iget-object v4, v0, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    iget-object v4, v4, Lzy9;->a:Ljava/lang/Object;

    check-cast v4, Luz4;

    iget v5, v4, Luz4;->h:I

    iget v6, v4, Luz4;->i:I

    iget v4, v4, Luz4;->j:I

    int-to-float v6, v6

    int-to-float v4, v4

    div-float/2addr v6, v4

    invoke-static {v6, v8, v11}, Lcs5;->s(FFF)F

    move-result v4

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v6

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v6, v7

    sub-int/2addr v6, v2

    sub-int/2addr v6, v5

    iget-object v0, v0, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    sub-int/2addr v6, v0

    int-to-float v0, v6

    mul-float/2addr v4, v0

    float-to-int v0, v4

    add-int/2addr v2, v0

    int-to-float v0, v2

    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationY(F)V

    :cond_24a
    iget-object v0, p0, Luz4;->e:Ls03;

    if-eqz v0, :cond_25b

    invoke-interface {v9}, Lysl;->n()Z

    move-result v0

    if-eqz v0, :cond_25b

    iget-object v0, p0, Luz4;->e:Ls03;

    invoke-virtual {v0}, Ls03;->run()V

    iput-object v3, p0, Luz4;->e:Ls03;

    :cond_25b
    return-void

    :pswitch_25c
    check-cast p0, Lkcf;

    invoke-virtual {p0}, Lkcf;->d()V

    return-void

    :pswitch_262
    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;

    sget v0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->i:I

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    iget-object v2, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->b:Lzy4;

    iget-object v3, v2, Lzy4;->a:Lb7f;

    iget-object v3, v3, Lb7f;->b:Ljava/lang/Object;

    check-cast v3, Ldtl;

    iget-boolean v5, v3, Ldtl;->g:Z

    if-eqz v5, :cond_27a

    iget v5, v3, Ldtl;->a:I

    iget v3, v3, Ldtl;->c:I

    :goto_278
    add-int/2addr v5, v3

    goto :goto_27f

    :cond_27a
    iget v5, v3, Ldtl;->b:I

    iget v3, v3, Ldtl;->d:I

    goto :goto_278

    :goto_27f
    iget v3, v2, Lzy4;->l:I

    if-nez v3, :cond_287

    iget v3, v2, Lzy4;->g:I

    if-gtz v3, :cond_295

    :cond_287
    iget v3, v2, Lzy4;->m:I

    if-nez v3, :cond_297

    invoke-virtual {v2}, Lzy4;->M()I

    move-result v3

    invoke-virtual {v2}, Lzy4;->N()I

    move-result v6

    if-le v3, v6, :cond_297

    :cond_295
    move v3, v4

    goto :goto_298

    :cond_297
    move v3, v1

    :goto_298
    iget v6, v0, Lckf;->m:I

    if-ne v5, v6, :cond_2ac

    iget-boolean v4, v0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->g:Z

    if-eq v3, v4, :cond_2c1

    iput-boolean v3, v0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->g:Z

    iget-object v4, v0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->d:Lorg/chromium/content_public/browser/WebContents;

    if-eqz v4, :cond_2c1

    iget-wide v5, v0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static {v5, v6, v0, v4, v3}, LJ/N;->MAYdn1NY(JLjava/lang/Object;Ljava/lang/Object;Z)V

    goto :goto_2c1

    :cond_2ac
    iput v5, v0, Lckf;->m:I

    invoke-virtual {v0}, Lckf;->g()V

    iget-boolean v1, v0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->g:Z

    if-eq v3, v1, :cond_2c0

    iput-boolean v3, v0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->g:Z

    iget-object v1, v0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->d:Lorg/chromium/content_public/browser/WebContents;

    if-eqz v1, :cond_2c0

    iget-wide v5, v0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static {v5, v6, v0, v1, v3}, LJ/N;->MAYdn1NY(JLjava/lang/Object;Ljava/lang/Object;Z)V

    :cond_2c0
    move v1, v4

    :cond_2c1
    :goto_2c1
    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v0, :cond_2e3

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_2e3

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v2}, Lzy4;->Q()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/opera/android/browser/chromium/ChromiumContent;->A(I)V

    if-nez v1, :cond_2e3

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_2e3

    invoke-static {v0, v1}, LJ/N;->MCqZ2U3N(J)V

    :cond_2e3
    return-void

    :pswitch_2e4
    check-cast p0, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;

    sget-object v0, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;->l:Lrl;

    iget-object p0, p0, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;->f:Llw4;

    iget-object p0, p0, Llw4;->f:Ljava/lang/Object;

    check-cast p0, Liw4;

    const-string v0, "stopping child connection: pid=%d"

    iget v1, p0, Liw4;->o:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lwxe;->t(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p0}, Liw4;->i()V

    iget-object v0, p0, Liw4;->g:Lk5o;

    if-eqz v0, :cond_309

    iput-object v3, p0, Liw4;->g:Lk5o;

    invoke-virtual {v0, p0}, Lk5o;->p(Liw4;)V

    :cond_309
    return-void

    :pswitch_30a
    check-cast p0, Lro9;

    iget v0, p0, Lro9;->b:I

    add-int/2addr v0, v4

    iput v0, p0, Lro9;->b:I

    const-string p0, "Android.ChildProcessConnection.OnServiceConnectedCounts"

    invoke-static {v0, p0}, Lioh;->w(ILjava/lang/String;)V

    return-void

    :pswitch_317
    check-cast p0, Lzy9;

    iget-object p0, p0, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Liw4;

    invoke-virtual {p0}, Liw4;->f()V

    return-void

    :pswitch_321
    check-cast p0, Liw4;

    const-string v0, "Android.ChildProcessConectionEventCounts"

    iget-boolean v1, p0, Liw4;->l:Z

    if-nez v1, :cond_34b

    iget-boolean v1, p0, Liw4;->n:Z

    if-nez v1, :cond_34b

    iget-object v1, p0, Liw4;->s:Lzw4;

    invoke-interface {v1}, Lzw4;->j()Z

    move-result v1

    if-nez v1, :cond_34b

    iget-boolean v1, p0, Liw4;->q:Z

    if-nez v1, :cond_33b

    sput-boolean v4, Liw4;->D:Z

    :cond_33b
    invoke-virtual {p0}, Liw4;->d()V

    iget-boolean p0, p0, Liw4;->r:Z

    const/4 v1, 0x4

    if-eqz p0, :cond_347

    invoke-static {v2, v1, v0}, Lioh;->y(IILjava/lang/String;)V

    goto :goto_34b

    :cond_347
    const/4 p0, 0x3

    invoke-static {p0, v1, v0}, Lioh;->y(IILjava/lang/String;)V

    :cond_34b
    :goto_34b
    return-void

    :pswitch_34c
    check-cast p0, Lqb7;

    iget-object p0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Lkze;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_358
    check-cast p0, Lws4;

    new-instance v0, Ljava/util/ArrayList;

    sget-object v2, Lic4;->f:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v1

    :goto_36a
    if-ge v3, v2, :cond_37a

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Ljava/lang/String;

    iget-object v5, p0, Lws4;->a:Lwub;

    invoke-virtual {v5, v4}, Lwub;->A(Ljava/lang/String;)V

    goto :goto_36a

    :cond_37a
    iput-boolean v1, p0, Lws4;->d:Z

    invoke-virtual {p0}, Lws4;->b()V

    return-void

    :pswitch_380
    check-cast p0, Lzo4;

    iget-object v0, p0, Lzo4;->h:Ljx6;

    iget-object v1, p0, Lzo4;->v:Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    if-eqz v1, :cond_3d3

    invoke-virtual {v1}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->getMediaStatus()Lcom/google/android/gms/cast/MediaStatus;

    move-result-object v1

    if-eqz v1, :cond_3d3

    invoke-virtual {v1}, Lcom/google/android/gms/cast/MediaStatus;->getMediaInfo()Lcom/google/android/gms/cast/MediaInfo;

    move-result-object v1

    if-eqz v1, :cond_3d3

    invoke-virtual {v1}, Lcom/google/android/gms/cast/MediaInfo;->getMediaTracks()Ljava/util/List;

    move-result-object v1

    iget-object v3, p0, Lzo4;->t:Lrb3;

    iget v4, p0, Lzo4;->r:I

    iget-object v5, v3, Lrb3;->f:[Lqb3;

    aget-object v4, v5, v4

    :try_start_3a0
    sget-object v5, Lzo4;->Q:[Lkuh;

    iget-object v6, p0, Lzo4;->H:Lfyl;

    new-instance v7, Ljrd;

    invoke-direct {v7, v4}, Ljrd;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v5, v6, v7, v3}, Ljx6;->i([Lkuh;Lfyl;Ljrd;Lgql;)Lpyl;

    move-result-object v3

    new-instance v4, Ljyl;

    iget-object v5, v3, Lpyl;->d:Ljava/lang/Object;

    check-cast v5, [Lbj8;

    invoke-direct {v4, v5}, Ljyl;-><init>([Lbj8;)V

    iget-object v5, p0, Lzo4;->G:Ljyl;

    invoke-virtual {v5, v4}, Ljyl;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3c1

    invoke-virtual {p0, v4, v1}, Lzo4;->J0(Ljyl;Ljava/util/List;)V

    :cond_3c1
    iput-object v4, p0, Lzo4;->G:Ljyl;

    iget-object v1, v3, Lpyl;->f:Ljava/lang/Object;

    check-cast v1, Lpr;

    iput-object v1, v0, Ljx6;->c:Lpr;

    iget-object p0, p0, Lzo4;->j:Lijc;

    new-instance v0, Ljl4;

    invoke-direct {v0, v3, v2}, Ljl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v2, v0}, Lijc;->d(ILfjc;)V
    :try_end_3d3
    .catch Lrhg; {:try_start_3a0 .. :try_end_3d3} :catch_3d3

    :catch_3d3
    :cond_3d3
    return-void

    :pswitch_3d4
    check-cast p0, Lkl4;

    iget-object v0, p0, Lkl4;->f:Lcom/opera/android/suggestion/Suggestion;

    if-eqz v0, :cond_3e4

    iget-object v1, p0, Lkl4;->e:Lnv6;

    invoke-virtual {v1, v0}, Lnv6;->C(Lcom/opera/android/suggestion/Suggestion;)V

    iget-object p0, p0, Lkl4;->d:Lil4;

    invoke-virtual {p0, v0}, Lil4;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3e4
    return-void

    :pswitch_3e5
    check-cast p0, Lcom/google/android/material/carousel/CarouselLayoutManager;

    invoke-virtual {p0}, Lcom/google/android/material/carousel/CarouselLayoutManager;->H()V

    return-void

    :pswitch_3eb
    check-cast p0, Lsb4;

    iget-object p0, p0, Lsb4;->b:Ljava/lang/Object;

    check-cast p0, Ligi;

    iget-object p0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p0, Ls1h;

    if-eqz p0, :cond_406

    iget-object p0, p0, Ls1h;->f:Lxwh;

    invoke-static {}, Lxug;->i()V

    iget-boolean v0, p0, Lxwh;->f:Z

    if-nez v0, :cond_406

    iget-boolean v0, p0, Lxwh;->g:Z

    if-nez v0, :cond_406

    iput-boolean v4, p0, Lxwh;->g:Z

    :cond_406
    return-void

    :pswitch_407
    check-cast p0, Lrn9;

    iget-object v2, p0, Lrn9;->d:Ljava/lang/Object;

    monitor-enter v2

    :try_start_40c
    iget-boolean v0, p0, Lrn9;->b:Z

    if-eqz v0, :cond_412

    monitor-exit v2

    goto :goto_421

    :cond_412
    iget-object v0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    new-instance v3, Lybl;

    invoke-direct {v3, v1}, Lybl;-><init>(I)V

    invoke-virtual {v0, v3}, Lekc;->n(Ljava/lang/Object;)V

    iput-boolean v4, p0, Lrn9;->b:Z

    monitor-exit v2

    :goto_421
    return-void

    :goto_422
    monitor-exit v2
    :try_end_423
    .catchall {:try_start_40c .. :try_end_423} :catchall_424

    throw p0

    :catchall_424
    move-exception v0

    move-object p0, v0

    goto :goto_422

    :pswitch_427
    check-cast p0, Lmb4;

    new-instance v0, Lyf;

    const/4 v1, 0x7

    invoke-direct {v0, v1, v3, p0}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v0}, Lc26;->K(Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_434
    .packed-switch 0x0
        :pswitch_427
        :pswitch_407
        :pswitch_3eb
        :pswitch_3e5
        :pswitch_3d4
        :pswitch_380
        :pswitch_358
        :pswitch_34c
        :pswitch_321
        :pswitch_317
        :pswitch_30a
        :pswitch_2e4
        :pswitch_262
        :pswitch_25c
        :pswitch_178
        :pswitch_172
        :pswitch_163
        :pswitch_142
        :pswitch_134
        :pswitch_118
        :pswitch_108
        :pswitch_fc
        :pswitch_f6
        :pswitch_dd
        :pswitch_ae
        :pswitch_9e
        :pswitch_33
        :pswitch_21
        :pswitch_11
    .end packed-switch
.end method
