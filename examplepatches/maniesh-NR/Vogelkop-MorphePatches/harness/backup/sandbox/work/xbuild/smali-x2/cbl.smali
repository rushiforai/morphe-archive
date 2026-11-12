.class public final synthetic Lcbl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lbp2;Lqya;)V
    .registers 3

    const/4 p1, 0x1

    iput-byte p1, p0, Lcbl;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcbl;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lcbl;->a:B

    iput-object p1, p0, Lcbl;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 14

    iget-byte v0, p0, Lcbl;->a:B

    const/4 v1, 0x3

    const/4 v2, 0x4

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    iget-object p0, p0, Lcbl;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_330

    check-cast p0, Lnmm;

    iget-object p0, p0, Lnmm;->s:Lua7;

    sget-object v0, Llmm;->a:Llmm;

    invoke-static {p0, v0}, Lcqp;->r0(Lua7;Ljava/lang/Object;)V

    return-void

    :pswitch_17
    check-cast p0, Ll46;

    iget-object p0, p0, Ll46;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/undo/UndoBar;

    iput-boolean v4, p0, Lcom/opera/android/undo/UndoBar;->k:Z

    invoke-virtual {p0, v4}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    return-void

    :pswitch_23
    check-cast p0, Lcom/usercentrics/sdk/ui/components/UCToggle;

    sget v0, Lcom/usercentrics/sdk/ui/components/UCToggle;->V:I

    invoke-static {v2, p0}, Lj14;->l(ILandroid/view/View;)V

    return-void

    :pswitch_2b
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    return-void

    :pswitch_31
    check-cast p0, Lafc;

    invoke-static {p0}, Lj14;->m(Landroid/view/View;)V

    return-void

    :pswitch_37
    check-cast p0, Lcdm;

    iget-object v0, p0, Lcdm;->r:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/usercentrics/sdk/ui/components/UCImageView;

    invoke-virtual {v0, v5}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Lcdm;->s:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-static {v0}, Lj14;->i(Landroid/view/View;)V

    return-void

    :pswitch_53
    check-cast p0, Lcom/usercentrics/sdk/ui/components/UCButton;

    invoke-static {p0}, Lj14;->m(Landroid/view/View;)V

    return-void

    :pswitch_59
    check-cast p0, Lrbm;

    sget-object v0, Lx23;->d:Lx23;

    invoke-virtual {p0, v0, v6}, Lrbm;->a(Lx23;Lm53;)V

    return-void

    :pswitch_61
    check-cast p0, Lcom/opera/android/browser/chromium/TurboDelegate;

    const-string v0, "install_referrer"

    iget-object p0, p0, Lcom/opera/android/browser/chromium/TurboDelegate;->a:Landroid/content/Context;

    invoke-static {v3, p0}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_70

    invoke-static {v0, p0}, LJ/N;->M4C08WKl(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_70
    invoke-static {}, LJ/N;->MdrkO_AS()V

    return-void

    :pswitch_74
    check-cast p0, Lc8m;

    const-string v0, "TtsEngine:initialize_default"

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    int-to-long v1, v1

    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->b()Z

    move-result v3

    if-eqz v3, :cond_99

    new-instance v3, Ltq7;

    invoke-direct {v3, v0, v1, v2, v5}, Ltq7;-><init>(Ljava/lang/String;JZ)V

    sget-object v4, Lorg/chromium/base/EarlyTraceEvent;->c:Ljava/lang/Object;

    monitor-enter v4

    :try_start_8b
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->b()Z

    move-result v6

    if-nez v6, :cond_93

    monitor-exit v4

    goto :goto_99

    :cond_93
    sget-object v6, Lorg/chromium/base/EarlyTraceEvent;->e:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v4
    :try_end_99
    .catchall {:try_start_8b .. :try_end_99} :catchall_ad

    :cond_99
    :goto_99
    sget-boolean v3, Lorg/chromium/base/TraceEvent;->b:Z

    if-eqz v3, :cond_a0

    invoke-static {v0, v1, v2}, LJ/N;->MHopMqLX(Ljava/lang/Object;J)V

    :cond_a0
    new-instance v0, Lzab;

    invoke-direct {v0, p0, v5}, Lzab;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lfe2;->e:Lde2;

    invoke-virtual {v0, p0}, Lfe2;->b(Loxc;)V

    return-void

    :goto_ab
    :try_start_ab
    monitor-exit v4
    :try_end_ac
    .catchall {:try_start_ab .. :try_end_ac} :catchall_ad

    throw p0

    :catchall_ad
    move-exception p0

    goto :goto_ab

    :pswitch_af
    check-cast p0, Ln9h;

    iget-object p0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p0, Lm6m;

    iput-object v6, p0, Lm6m;->e:Lk6m;

    return-void

    :pswitch_b8
    check-cast p0, Lp8f;

    invoke-virtual {p0}, Lp8f;->E()V

    return-void

    :pswitch_be
    check-cast p0, Lyg;

    iget-object v0, p0, Lyg;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;

    iget-object p0, p0, Lyg;->c:Ljava/lang/Object;

    check-cast p0, Lv3m;

    iget-object p0, p0, Lv3m;->a:Landroid/content/Context;

    invoke-static {p0}, Lv3m;->f(Landroid/content/Context;)Z

    move-result p0

    iget-boolean v1, v0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->h:Z

    if-eq v1, p0, :cond_d9

    iput-boolean p0, v0, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->h:Z

    if-eqz p0, :cond_d9

    invoke-virtual {v0}, Lcom/opera/android/translate_web_pages/NavEntryTranslationDataHelper;->b()V

    :cond_d9
    return-void

    :pswitch_da
    check-cast p0, Lcom/opera/android/widget/GraphView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lxi5;->a(Landroid/content/Context;)Lxi5;

    move-result-object v0

    iget-object v0, v0, Lxi5;->f:Lqy4;

    invoke-virtual {v0}, Lqy4;->b()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    const/high16 v5, 0x41c00000    # 24.0f

    invoke-static {v5, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    div-int/2addr v3, v2

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v3

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    :goto_102
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_11f

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lwi5;

    iget-wide v5, v5, Lwi5;->d:J

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-eqz v5, :cond_11c

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v2

    goto :goto_11f

    :cond_11c
    add-int/lit8 v2, v2, 0x1

    goto :goto_102

    :cond_11f
    :goto_11f
    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    new-instance v2, Lo28;

    invoke-direct {v2, v0}, Lo28;-><init>(Ljava/util/ArrayList;)V

    new-instance v0, Lt59;

    invoke-direct {v0, v2, v1}, Lt59;-><init>(Lp3a;I)V

    invoke-virtual {v0, p0}, Lt59;->d(Lcom/opera/android/widget/GraphView;)V

    return-void

    :pswitch_135
    check-cast p0, Lc5o;

    iget-object p0, p0, Lc5o;->a:Ljava/lang/Object;

    check-cast p0, Lode;

    invoke-virtual {p0, v6}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_13f
    check-cast p0, Lcom/opera/android/bar/TopToolbarContainer;

    sget v0, Lcom/opera/android/bar/TopToolbarContainer;->j:I

    iput-boolean v4, p0, Lcom/opera/android/bar/TopToolbarContainer;->d:Z

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_15b

    iget-object p0, p0, Lcom/opera/android/bar/TopToolbarContainer;->h:Lxy4;

    if-eqz p0, :cond_15b

    iget-object p0, p0, Lxy4;->d:Landroid/widget/FrameLayout;

    check-cast p0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;

    const v0, 0x7f0a0bcb

    iget-wide v1, p0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static {v1, v2, v0}, LJ/N;->M_RC1fyW(JI)V

    :cond_15b
    return-void

    :pswitch_15c
    check-cast p0, Lltl;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1b3

    iget-boolean v0, p0, Lltl;->o:Z

    if-eqz v0, :cond_1b3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_1b3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    iget-object v0, v0, Landroidx/fragment/app/w;->c:Landroidx/fragment/app/a0;

    invoke-virtual {v0}, Landroidx/fragment/app/a0;->f()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1b3

    invoke-static {v5, v0}, Lam2;->l(ILjava/util/List;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_1b3

    iput-boolean v4, p0, Lltl;->o:Z

    iput-boolean v5, p0, Lltl;->p:Z

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Landroidx/fragment/app/a;

    invoke-direct {v1, v0}, Landroidx/fragment/app/a;-><init>(Landroidx/fragment/app/w;)V

    invoke-virtual {v1, p0}, Landroidx/fragment/app/a;->j(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/a;

    invoke-virtual {v1}, Landroidx/fragment/app/a;->h()I

    invoke-virtual {v0}, Landroidx/fragment/app/w;->D()V

    new-instance v1, Landroidx/fragment/app/a;

    invoke-direct {v1, v0}, Landroidx/fragment/app/a;-><init>(Landroidx/fragment/app/w;)V

    new-instance v2, Lxm9;

    const/4 v3, 0x7

    invoke-direct {v2, p0, v3}, Lxm9;-><init>(Landroidx/fragment/app/Fragment;I)V

    invoke-virtual {v1, v2}, Lym9;->b(Lxm9;)V

    invoke-virtual {v1}, Landroidx/fragment/app/a;->h()I

    invoke-virtual {v0}, Landroidx/fragment/app/w;->D()V

    iput-boolean v4, p0, Lltl;->p:Z

    :cond_1b3
    return-void

    :pswitch_1b4
    check-cast p0, Loql;

    invoke-virtual {p0}, Loql;->a()V

    return-void

    :pswitch_1ba
    check-cast p0, Ln1;

    iput-object v6, p0, Ln1;->b:Ljava/lang/Object;

    invoke-virtual {p0}, Ln1;->run()V

    return-void

    :pswitch_1c2
    check-cast p0, Lcom/opera/android/widget/ThumbScroller;

    sget v0, Lcom/opera/android/widget/ThumbScroller;->q:I

    iget v0, p0, Lcom/opera/android/widget/ThumbScroller;->g:I

    if-ne v0, v3, :cond_1cd

    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_1cd
    return-void

    :pswitch_1ce
    check-cast p0, Ljava/util/function/IntConsumer;

    invoke-interface {p0, v3}, Ljava/util/function/IntConsumer;->accept(I)V

    return-void

    :pswitch_1d4
    check-cast p0, Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    const-wide/16 v0, 0x1

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p0, v0, v1, v2}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    return-void

    :pswitch_1e1
    check-cast p0, Landroid/os/HandlerThread;

    invoke-virtual {p0}, Landroid/os/HandlerThread;->quit()Z

    const-wide/16 v0, 0x3e8

    invoke-virtual {p0, v0, v1}, Ljava/lang/Thread;->join(J)V

    return-void

    :pswitch_1ec
    check-cast p0, Lorg/chromium/content/browser/input/TextSuggestionPopupController;

    iput-object v6, p0, Lorg/chromium/content/browser/input/TextSuggestionPopupController;->h:Le0k;

    iput-object v6, p0, Lorg/chromium/content/browser/input/TextSuggestionPopupController;->i:Lkkl;

    return-void

    :pswitch_1f3
    check-cast p0, Lcjl;

    iget-object v0, p0, Lcjl;->b:Lua7;

    iput-object v6, p0, Lcjl;->n:Lcbl;

    iget-object v2, p0, Lcjl;->m:Ldfe;

    iget-object p0, p0, Lcjl;->a:Lv31;

    invoke-virtual {p0}, Landroid/view/View;->isFocused()Z

    move-result v6

    if-nez v6, :cond_218

    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->findFocus()Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_218

    invoke-virtual {p0}, Landroid/view/View;->onCheckIsTextEditor()Z

    move-result p0

    if-ne p0, v5, :cond_218

    invoke-virtual {v2}, Ldfe;->h()V

    goto/16 :goto_2c2

    :cond_218
    new-instance p0, Lpqh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v6, Lpqh;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    iget-object v7, v2, Ldfe;->a:[Ljava/lang/Object;

    iget v8, v2, Ldfe;->c:I

    move v9, v4

    :goto_227
    if-ge v9, v8, :cond_266

    aget-object v10, v7, v9

    check-cast v10, Lbjl;

    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    move-result v11

    if-eqz v11, :cond_25d

    if-eq v11, v5, :cond_256

    if-eq v11, v3, :cond_23e

    if-eq v11, v1, :cond_23e

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_2c2

    :cond_23e
    iget-object v11, p0, Lpqh;->a:Ljava/lang/Object;

    sget-object v12, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v11, v12}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_263

    sget-object v11, Lbjl;->c:Lbjl;

    if-ne v10, v11, :cond_24e

    move v10, v5

    goto :goto_24f

    :cond_24e
    move v10, v4

    :goto_24f
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    iput-object v10, v6, Lpqh;->a:Ljava/lang/Object;

    goto :goto_263

    :cond_256
    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v10, p0, Lpqh;->a:Ljava/lang/Object;

    iput-object v10, v6, Lpqh;->a:Ljava/lang/Object;

    goto :goto_263

    :cond_25d
    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v10, p0, Lpqh;->a:Ljava/lang/Object;

    iput-object v10, v6, Lpqh;->a:Ljava/lang/Object;

    :cond_263
    :goto_263
    add-int/lit8 v9, v9, 0x1

    goto :goto_227

    :cond_266
    invoke-virtual {v2}, Ldfe;->h()V

    iget-object v1, p0, Lpqh;->a:Ljava/lang/Object;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_284

    iget-object v1, v0, Lua7;->c:Ljava/lang/Object;

    check-cast v1, Ll4c;

    invoke-interface {v1}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    iget-object v2, v0, Lua7;->b:Ljava/lang/Object;

    check-cast v2, Lv31;

    invoke-virtual {v1, v2}, Landroid/view/inputmethod/InputMethodManager;->restartInput(Landroid/view/View;)V

    :cond_284
    iget-object v1, v6, Lpqh;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Boolean;

    if-eqz v1, :cond_2a7

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_29c

    iget-object v1, v0, Lua7;->d:Ljava/lang/Object;

    check-cast v1, Loji;

    iget-object v1, v1, Loji;->a:Ljava/lang/Object;

    check-cast v1, Lrii;

    invoke-virtual {v1}, Lrii;->y()V

    goto :goto_2a7

    :cond_29c
    iget-object v1, v0, Lua7;->d:Ljava/lang/Object;

    check-cast v1, Loji;

    iget-object v1, v1, Loji;->a:Ljava/lang/Object;

    check-cast v1, Lrii;

    invoke-virtual {v1}, Lrii;->i()V

    :cond_2a7
    :goto_2a7
    iget-object p0, p0, Lpqh;->a:Ljava/lang/Object;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2c2

    iget-object p0, v0, Lua7;->c:Ljava/lang/Object;

    check-cast p0, Ll4c;

    invoke-interface {p0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    iget-object v0, v0, Lua7;->b:Ljava/lang/Object;

    check-cast v0, Lv31;

    invoke-virtual {p0, v0}, Landroid/view/inputmethod/InputMethodManager;->restartInput(Landroid/view/View;)V

    :cond_2c2
    :goto_2c2
    return-void

    :pswitch_2c3
    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    sget-object v0, Lcom/google/android/material/textfield/TextInputLayout;->C0:[[I

    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void

    :pswitch_2cd
    check-cast p0, Lgel;

    iget-object v0, p0, Lgel;->d:Landroid/view/View;

    iget v1, p0, Lgel;->h:I

    iget-object v2, p0, Lgel;->b:Ls9i;

    invoke-virtual {v2}, Ls9i;->Y()Z

    move-result v3

    if-eqz v3, :cond_31d

    iget-object v3, p0, Lgel;->c:Lpde;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    iget-object v4, p0, Lgel;->a:Landroidx/recyclerview/widget/i;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_31d

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    move-result v4

    add-float/2addr v4, v3

    iget v3, p0, Lgel;->f:F

    sub-float/2addr v4, v3

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v3

    int-to-float v1, v1

    cmpl-float v3, v3, v1

    if-gtz v3, :cond_31a

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v4

    add-float/2addr v4, v3

    iget v3, p0, Lgel;->g:F

    sub-float/2addr v4, v3

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v1, v3, v1

    if-gtz v1, :cond_31a

    iget-object p0, p0, Lgel;->e:Lcbl;

    invoke-virtual {v0, p0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    goto :goto_31d

    :cond_31a
    invoke-virtual {v2}, Ls9i;->h0()V

    :cond_31d
    :goto_31d
    return-void

    :pswitch_31e
    check-cast p0, Lorg/chromium/base/task/TaskRunnerImpl;

    invoke-virtual {p0}, Lorg/chromium/base/task/TaskRunnerImpl;->f()V

    return-void

    :pswitch_324
    check-cast p0, Lqya;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    throw v6

    :pswitch_32a
    check-cast p0, Ldbl;

    invoke-virtual {p0}, Lo73;->b()Z

    return-void

    :pswitch_data_330
    .packed-switch 0x0
        :pswitch_32a
        :pswitch_324
        :pswitch_31e
        :pswitch_2cd
        :pswitch_2c3
        :pswitch_1f3
        :pswitch_1ec
        :pswitch_1e1
        :pswitch_1d4
        :pswitch_1ce
        :pswitch_1c2
        :pswitch_1ba
        :pswitch_1b4
        :pswitch_15c
        :pswitch_13f
        :pswitch_135
        :pswitch_da
        :pswitch_be
        :pswitch_b8
        :pswitch_af
        :pswitch_74
        :pswitch_61
        :pswitch_59
        :pswitch_53
        :pswitch_37
        :pswitch_31
        :pswitch_2b
        :pswitch_23
        :pswitch_17
    .end packed-switch
.end method
