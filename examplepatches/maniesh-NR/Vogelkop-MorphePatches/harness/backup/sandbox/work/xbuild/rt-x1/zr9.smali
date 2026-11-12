.class public final synthetic Lzr9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 12
    iput-byte p3, p0, Lzr9;->a:B

    iput-object p1, p0, Lzr9;->b:Ljava/lang/Object;

    iput-object p2, p0, Lzr9;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnpd;Lnod;Ljava/lang/Runnable;)V
    .registers 4

    const/16 p2, 0x1c

    iput-byte p2, p0, Lzr9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzr9;->b:Ljava/lang/Object;

    iput-object p3, p0, Lzr9;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 16

    iget-byte v0, p0, Lzr9;->a:B

    const/16 v1, 0x11

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-object v6, p0, Lzr9;->c:Ljava/lang/Object;

    iget-object p0, p0, Lzr9;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_392

    check-cast p0, Lnpd;

    check-cast v6, Lxkg;

    invoke-virtual {p0, v5, v6}, Lnpd;->t(Lxkg;Lxkg;)V

    return-void

    :pswitch_17
    check-cast p0, Lnpd;

    check-cast v6, Ljava/lang/Runnable;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v6}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_22
    check-cast p0, Luld;

    check-cast v6, Lsjg;

    iget-object p0, p0, Luld;->a:Lp12;

    iget-object v0, p0, Lp12;->d:Ljava/lang/Object;

    check-cast v0, Lsjg;

    if-ne v6, v0, :cond_41

    iget-object p0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast p0, Lxbf;

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Ltjg;

    iget-object v1, p0, Ltjg;->t:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Ltjg;->n()V

    :cond_41
    return-void

    :pswitch_42
    check-cast p0, Lgid;

    check-cast v6, Lkid;

    iget-boolean v0, p0, Lgid;->o:Z

    if-nez v0, :cond_4d

    invoke-interface {v6, p0}, Lkid;->f(Lgid;)V

    :cond_4d
    return-void

    :pswitch_4e
    check-cast p0, Lrgd;

    check-cast v6, Li16;

    iget-object v0, p0, Lrgd;->B:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v1, p0, Lrgd;->v:Lqj6;

    invoke-virtual {p0, v6, v1, v3}, Lq83;->x(Li16;Lqj6;I)I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void

    :pswitch_5e
    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    check-cast v6, Ljava/lang/Runnable;

    sget-object v0, Lcom/google/android/material/button/MaterialButton;->O:[I

    invoke-interface {v6}, Ljava/lang/Runnable;->run()V

    iget-object v0, p0, Lcom/google/android/material/button/MaterialButton;->D:Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v0, :cond_74

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iput-object v5, p0, Lcom/google/android/material/button/MaterialButton;->D:Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v0, -0x31000000

    iput v0, p0, Lcom/google/android/material/button/MaterialButton;->A:F

    :cond_74
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void

    :pswitch_78
    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    check-cast v6, Landroid/graphics/drawable/Drawable;

    sget-object v0, Lcom/google/android/material/button/MaterialButton;->O:[I

    invoke-virtual {p0, v6}, Lcom/google/android/material/button/MaterialButton;->D(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_82
    check-cast p0, Li7d;

    check-cast v6, Lcom/opera/api/Callback;

    iget-object v0, p0, Li7d;->l:Lpt1;

    if-eqz v0, :cond_14f

    iget-boolean v0, p0, Li7d;->i:Z

    if-nez v0, :cond_14f

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Li7d;->l:Lpt1;

    iget-object v1, p0, Lpt1;->d:Ljava/lang/Object;

    check-cast v1, Lor2;

    iget-object v4, p0, Lpt1;->b:Landroid/view/View;

    check-cast v4, Landroid/widget/FrameLayout;

    iget-object v1, v1, Lor2;->c:Landroid/view/View;

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-static {v1}, Lq9n;->r(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v1

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iget-object v8, p0, Lpt1;->d:Ljava/lang/Object;

    check-cast v8, Lor2;

    iget-object v8, v8, Lor2;->f:Ljava/lang/Object;

    check-cast v8, Lkf;

    iget-object v9, v8, Lkf;->b:Landroid/view/View;

    check-cast v9, Landroid/widget/RelativeLayout;

    new-instance v10, Lyzb;

    const/16 v11, 0xe

    invoke-direct {v10, v7, v11}, Lyzb;-><init>(Ljava/lang/Object;B)V

    const-class v11, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;

    invoke-static {v9, v11, v10}, Lq9n;->J(Landroid/view/View;Ljava/lang/Class;Lp9n;)V

    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_f3

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    invoke-static {v9}, Lq9n;->r(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v9

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v10

    move v11, v3

    move v12, v11

    :goto_d7
    if-ge v12, v10, :cond_f3

    invoke-virtual {v7, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    add-int/lit8 v12, v12, 0x1

    check-cast v13, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;

    invoke-static {v13}, Lq9n;->r(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v13

    iget v14, v13, Landroid/graphics/Rect;->top:I

    iget v9, v9, Landroid/graphics/Rect;->top:I

    if-le v14, v9, :cond_ed

    add-int/lit8 v11, v11, 0x1

    :cond_ed
    if-ne v11, v2, :cond_f1

    move-object v5, v13

    goto :goto_f3

    :cond_f1
    move-object v9, v13

    goto :goto_d7

    :cond_f3
    :goto_f3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0709dd

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    if-eqz v5, :cond_107

    iget v2, v5, Landroid/graphics/Rect;->top:I

    iget v1, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v2, v1

    add-int/2addr v2, v0

    goto :goto_115

    :cond_107
    iget-object v0, v8, Lkf;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/RelativeLayout;

    invoke-static {v0}, Lq9n;->r(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v0

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    iget v1, v1, Landroid/graphics/Rect;->top:I

    sub-int v2, v0, v1

    :goto_115
    invoke-virtual {v4}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v4}, Li5n;->a(Landroid/view/View;)Lg3o;

    move-result-object v1

    if-eqz v1, :cond_133

    const/16 v4, 0x82

    iget-object v1, v1, Lg3o;->a:Ld3o;

    invoke-virtual {v1, v4}, Ld3o;->j(I)Lr9b;

    move-result-object v1

    iget v4, v1, Lr9b;->b:I

    iget v1, v1, Lr9b;->d:I

    add-int/2addr v4, v1

    sub-int/2addr v0, v4

    :cond_133
    iget-object p0, p0, Lpt1;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/StatusBarDrawingFrameLayout;

    iget-object p0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->i:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    add-int/2addr p0, v2

    invoke-static {p0, v3, v0}, Lcs5;->t(III)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v6, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_14f
    return-void

    :pswitch_150
    check-cast p0, Ls14;

    check-cast v6, Lmoc;

    iget-object v0, p0, Ls14;->f:Ljava/lang/Object;

    check-cast v0, Ly0a;

    iget-object p0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast p0, Lbml;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Laml;

    iget-boolean v13, p0, Laml;->a:Z

    iget-boolean p0, v6, Lmoc;->f:Z

    if-eq p0, v13, :cond_178

    new-instance v7, Lmoc;

    iget-object v8, v6, Lmoc;->a:Ltpc;

    iget-object v9, v6, Lmoc;->b:Ljava/lang/String;

    iget-boolean v10, v6, Lmoc;->c:Z

    iget-boolean v11, v6, Lmoc;->d:Z

    iget-boolean v12, v6, Lmoc;->e:Z

    invoke-direct/range {v7 .. v13}, Lmoc;-><init>(Ltpc;Ljava/lang/String;ZZZZ)V

    move-object v6, v7

    :cond_178
    invoke-virtual {v0, v6}, Ly0a;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_17c
    check-cast p0, Ljava/util/Map$Entry;

    check-cast v6, Lgkc;

    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lv6f;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v6, Lgkc;->a:Lyd4;

    invoke-interface {p0, v0}, Lv6f;->a(Ljava/lang/Object;)V

    return-void

    :pswitch_18f
    check-cast p0, Lua7;

    check-cast v6, Ll94;

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgkc;

    if-nez p0, :cond_1aa

    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Observable has not yet been initialized with a value."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p0}, Ll94;->d(Ljava/lang/Throwable;)Z

    goto :goto_1af

    :cond_1aa
    iget-object p0, p0, Lgkc;->a:Lyd4;

    invoke-virtual {v6, p0}, Ll94;->b(Ljava/lang/Object;)Z

    :goto_1af
    return-void

    :pswitch_1b0
    check-cast p0, Lua7;

    check-cast v6, Lv6f;

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgkc;

    if-eqz p0, :cond_1c5

    iget-object p0, p0, Lgkc;->a:Lyd4;

    invoke-interface {v6, p0}, Lv6f;->a(Ljava/lang/Object;)V

    :cond_1c5
    return-void

    :pswitch_1c6
    check-cast p0, Lwth;

    check-cast v6, Lbp3;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    if-eqz p0, :cond_1d8

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashSet;

    invoke-interface {v0, p0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    :cond_1d8
    iget-object p0, v6, Lbp3;->i:Ljava/lang/Object;

    check-cast p0, Lz67;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_1e0
    check-cast p0, Lzzb;

    check-cast v6, Ltzb;

    invoke-virtual {p0}, Lzzb;->H()V

    iget-object v0, v6, Ltzb;->a:Ljava/lang/String;

    iget-object p0, p0, Lzzb;->e:La0c;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lwwc;->i(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0}, La0c;->g0()V

    return-void

    :pswitch_1fa
    check-cast p0, Lqq6;

    check-cast v6, Ljava/lang/String;

    iget-object v0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v0

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const/high16 v3, 0x42800000    # 64.0f

    invoke-static {v2, v3}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v3

    sub-int/2addr v3, v2

    int-to-float v2, v3

    cmpl-float v0, v0, v2

    if-lez v0, :cond_229

    const v0, 0x800015

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setGravity(I)V

    goto :goto_22c

    :cond_229
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setGravity(I)V

    :goto_22c
    return-void

    :pswitch_22d
    check-cast p0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/JobInfoSchedulerService;

    check-cast v6, Landroid/app/job/JobParameters;

    sget v0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/JobInfoSchedulerService;->a:I

    invoke-virtual {p0, v6, v3}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    return-void

    :pswitch_237
    check-cast p0, Lpnb;

    check-cast v6, Lge5;

    new-instance v0, Lgnb;

    invoke-direct {v0, p0, v6, v2}, Lgnb;-><init>(Lpnb;Lqnb;B)V

    const-string v1, "read"

    invoke-virtual {p0, v1, v0}, Lpnb;->c(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void

    :pswitch_246
    check-cast p0, Lpnb;

    check-cast v6, Lqqm;

    iget-object v0, p0, Lpnb;->a:Lmnb;

    iget-object p0, p0, Lpnb;->p:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, La32;

    invoke-direct {v2, v0, v6, p0, v1}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const-string p0, "onRedirectReceived"

    invoke-virtual {v0, v2, p0}, Lmnb;->b(Lqnb;Ljava/lang/String;)V

    return-void

    :pswitch_25c
    check-cast p0, Ljava/lang/String;

    check-cast v6, Lgnb;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "JavaUploadDataSinkBase#executeOnExecutor "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " running callback"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Llni;->h(Ljava/lang/String;)V

    :try_start_276
    invoke-virtual {v6}, Lgnb;->run()V
    :try_end_279
    .catchall {:try_start_276 .. :try_end_279} :catchall_27d

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_27d
    move-exception v0

    move-object p0, v0

    :try_start_27f
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_282
    .catchall {:try_start_27f .. :try_end_282} :catchall_283

    goto :goto_287

    :catchall_283
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_287
    throw p0

    :pswitch_288
    check-cast p0, Lzdb;

    check-cast v6, Lig;

    iget-object v0, p0, Lzdb;->h:Lig;

    if-ne v6, v0, :cond_2a4

    iput-boolean v4, p0, Lzdb;->k:Z

    :goto_292
    iget-object v0, p0, Lzdb;->h:Lig;

    if-eqz v0, :cond_2a4

    iput-object v5, v0, Lig;->b:Ljava/lang/Object;

    iput-object v5, p0, Lzdb;->h:Lig;

    iget-object v0, p0, Lzdb;->i:Ld23;

    iput-object v5, p0, Lzdb;->i:Ld23;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ld23;->onResult(Ljava/lang/Object;)V

    goto :goto_292

    :cond_2a4
    return-void

    :pswitch_2a5
    check-cast p0, Laeb;

    check-cast v6, Llsc;

    iget-object p0, p0, Laeb;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0, v6}, Lcom/opera/android/browser/chromium/ChromiumContent;->v(Llsc;)V

    return-void

    :pswitch_2af
    check-cast p0, Lcom/opera/api/Callback;

    check-cast v6, Ls75;

    iget-object v0, v6, Ls75;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget v1, v6, Ls75;->b:I

    invoke-static {v4, v0}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_2c5
    check-cast p0, Lcom/opera/android/import_data/ImportChromeDataActivity;

    check-cast v6, Ljava/io/File;

    sget v0, Lcom/opera/android/import_data/ImportChromeDataActivity;->d0:I

    invoke-static {p0}, Ls29;->e(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-static {v6, v0}, Lcgh;->p(Ljava/io/File;Ljava/io/File;)V

    invoke-static {v0}, Lq3b;->a(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_2e3

    new-instance v0, Lld9;

    const/16 v1, 0x1a

    invoke-direct {v0, p0, v1}, Lld9;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_2f4

    :cond_2e3
    new-instance v1, Lcom/opera/android/bookmarks/BookmarksImporterBridge;

    new-instance v2, Lxm5;

    invoke-direct {v2, p0}, Lxm5;-><init>(Ljava/lang/Object;)V

    invoke-direct {v1, v2}, Lcom/opera/android/bookmarks/BookmarksImporterBridge;-><init>(Lkm3;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, LJ/N;->Mb0tu6VP(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_2f4
    return-void

    :pswitch_2f5
    check-cast p0, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;

    check-cast v6, Ljava/io/File;

    sget v0, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;->b0:I

    invoke-static {p0}, Ls29;->e(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-static {v6, v0}, Lcgh;->p(Ljava/io/File;Ljava/io/File;)V

    invoke-static {v0}, Lq3b;->a(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_313

    new-instance v0, Lld9;

    const/16 v1, 0x19

    invoke-direct {v0, p0, v1}, Lld9;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_326

    :cond_313
    new-instance v1, Lcom/opera/android/bookmarks/BookmarksImporterBridge;

    new-instance v2, Lqq6;

    const/16 v3, 0x14

    invoke-direct {v2, p0, v3}, Lqq6;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v1, v2}, Lcom/opera/android/bookmarks/BookmarksImporterBridge;-><init>(Lkm3;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, LJ/N;->Mb0tu6VP(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_326
    return-void

    :pswitch_327
    check-cast p0, Llwa;

    check-cast v6, Lcom/google/android/gms/tasks/TaskCompletionSource;

    :try_start_32b
    invoke-virtual {p0}, Llwa;->h()Landroid/graphics/Bitmap;

    move-result-object p0

    invoke-virtual {v6, p0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V
    :try_end_332
    .catch Ljava/lang/Exception; {:try_start_32b .. :try_end_332} :catch_333

    goto :goto_338

    :catch_333
    move-exception v0

    move-object p0, v0

    invoke-virtual {v6, p0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    :goto_338
    return-void

    :pswitch_339
    check-cast p0, Lbl9;

    check-cast v6, Lbl9;

    invoke-virtual {p0}, Lbl9;->d()V

    if-eqz v6, :cond_345

    invoke-virtual {v6}, Lbl9;->d()V

    :cond_345
    return-void

    :pswitch_346
    check-cast p0, Lsfa;

    check-cast v6, Luea;

    iget-object p0, p0, Lsfa;->c:Lxm5;

    iget-object v0, v6, Luea;->m:Landroid/net/Uri;

    iget-object p0, p0, Lxm5;->a:Ljava/lang/Object;

    check-cast p0, Lvea;

    iget-object p0, p0, Lvea;->b:Luq6;

    iget-object p0, p0, Luq6;->d:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltq6;

    invoke-virtual {p0, v4}, Ltq6;->c(Z)V

    return-void

    :pswitch_360
    check-cast p0, Lnh4;

    check-cast v6, Ld7a;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, v6, v0}, Lnh4;->F(Ldx5;Lkotlin/Unit;)V

    return-void

    :pswitch_36a
    check-cast p0, Lv1a;

    check-cast v6, Lcom/opera/api/Callback;

    invoke-virtual {p0, v6}, Lv1a;->a(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_372
    check-cast p0, Lcom/opera/android/pushmessaging/GCMBackgroundService;

    check-cast v6, Les9;

    sget v0, Lcom/opera/android/pushmessaging/GCMBackgroundService;->a:I

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    if-eqz v0, :cond_385

    move-object v5, v0

    :cond_385
    invoke-static {p0, v5}, Lfsp;->g(Landroid/content/Context;Lorg/chromium/base/CommandLine;)V

    new-instance v0, Lwt2;

    const/4 v1, 0x5

    invoke-direct {v0, v6, v1}, Lwt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, v0}, Le7d;->a(Landroid/content/Context;Lc7d;)V

    return-void

    :pswitch_data_392
    .packed-switch 0x0
        :pswitch_372
        :pswitch_36a
        :pswitch_360
        :pswitch_346
        :pswitch_339
        :pswitch_327
        :pswitch_2f5
        :pswitch_2c5
        :pswitch_2af
        :pswitch_2a5
        :pswitch_288
        :pswitch_25c
        :pswitch_246
        :pswitch_237
        :pswitch_22d
        :pswitch_1fa
        :pswitch_1e0
        :pswitch_1c6
        :pswitch_1b0
        :pswitch_18f
        :pswitch_17c
        :pswitch_150
        :pswitch_82
        :pswitch_78
        :pswitch_5e
        :pswitch_4e
        :pswitch_42
        :pswitch_22
        :pswitch_17
    .end packed-switch
.end method
