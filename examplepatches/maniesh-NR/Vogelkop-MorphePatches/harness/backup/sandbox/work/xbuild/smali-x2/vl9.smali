.class public final Lvl9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 15
    const/16 v0, 0x1b

    iput-byte v0, p0, Lvl9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lj9i;)V
    .registers 3

    const/16 v0, 0x1a

    iput-byte v0, p0, Lvl9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lvl9;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 13
    iput-byte p2, p0, Lvl9;->a:B

    iput-object p1, p0, Lvl9;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 14
    iput-byte p3, p0, Lvl9;->a:B

    iput-object p2, p0, Lvl9;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Runnable;)V
    .registers 3

    iget-object v0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_d

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lvl9;->b:Ljava/lang/Object;

    :cond_d
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final run()V
    .registers 16

    iget-byte v0, p0, Lvl9;->a:B

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_34e

    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Liji;

    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_11
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    :pswitch_19
    iget-object v0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_33

    iput-object v2, p0, Lvl9;->b:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    :goto_25
    if-ge v3, p0, :cond_33

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v3, v3, 0x1

    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_25

    :cond_33
    return-void

    :pswitch_34
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lj9i;

    invoke-virtual {p0}, Lj9i;->close()V

    return-void

    :pswitch_3c
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lkwh;

    iget-object v0, p0, Lkwh;->c:Lscc;

    invoke-interface {v0, p0}, Lscc;->d(Lkdc;)V

    return-void

    :pswitch_46
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lfwh;

    const-wide/16 v0, 0x3

    iget-wide v2, p0, Lfwh;->f:J

    mul-long/2addr v2, v0

    const-wide/32 v0, 0x927c0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lfwh;->f:J

    iput-boolean v4, p0, Lfwh;->h:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    add-long/2addr v2, v0

    iput-wide v2, p0, Lfwh;->g:J

    iget-object v2, p0, Lfwh;->c:Lvl9;

    invoke-static {v2, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    invoke-virtual {p0}, Lfwh;->c()V

    return-void

    :pswitch_6a
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/media/PlayerControlView;

    iget-object p0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object p0, p0, Lwkd;->q:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, v4}, Landroid/view/View;->setSelected(Z)V

    return-void

    :pswitch_76
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content_public/browser/WebContents;

    invoke-interface {p0, v3}, Lorg/chromium/content_public/browser/WebContents;->E1(Z)V

    return-void

    :pswitch_7e
    new-instance v0, Ljava/lang/RuntimeException;

    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Exception;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :pswitch_88
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    invoke-static {}, LJ/N;->MGjyv7Lz()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {}, LJ/N;->MwhpQ0I9()Z

    move-result v1

    iget-object v2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    invoke-virtual {v5, v2}, Lx56;->y(Lzpa;)Lra0;

    move-result-object v6

    invoke-virtual {v6, v2}, Lra0;->x(Lzpa;)Lqb0;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v0, :cond_b0

    move v3, v4

    :cond_b0
    invoke-virtual {v2, v4, v3, v0}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v0, 0x3

    invoke-virtual {v2, v0, v4, v1}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v5}, Lx5f;->U0(Lx56;)V

    return-void

    :pswitch_bb
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-static {p0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->c(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)Z

    move-result v0

    if-eqz v0, :cond_c9

    invoke-static {p0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->f(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)V

    goto :goto_cc

    :cond_c9
    invoke-static {p0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->g(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)V

    :goto_cc
    return-void

    :pswitch_cd
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lbie;

    invoke-virtual {p0}, Lbie;->d()V

    return-void

    :pswitch_d5
    iget-object v0, p0, Lvl9;->b:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lorg/chromium/midi/MidiManagerAndroid;

    monitor-enter v1

    :try_start_db
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/midi/MidiManagerAndroid;

    iget-boolean v0, p0, Lorg/chromium/midi/MidiManagerAndroid;->g:Z

    if-eqz v0, :cond_e5

    monitor-exit v1

    goto :goto_eb

    :cond_e5
    iget-wide v2, p0, Lorg/chromium/midi/MidiManagerAndroid;->f:J

    invoke-static {v2, v3}, LJ/N;->MfmZ2$zu(J)V

    monitor-exit v1

    :goto_eb
    return-void

    :goto_ec
    monitor-exit v1
    :try_end_ed
    .catchall {:try_start_db .. :try_end_ed} :catchall_ee

    throw p0

    :catchall_ee
    move-exception v0

    move-object p0, v0

    goto :goto_ec

    :pswitch_f1
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lzmd;

    invoke-virtual {p0}, Landroidx/fragment/app/i;->dismiss()V

    return-void

    :pswitch_f9
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lxmd;

    iget-object p0, p0, Lxmd;->b:Landroidx/mediarouter/app/d;

    iget-object v0, p0, Landroidx/mediarouter/app/d;->N:Lcod;

    if-eqz v0, :cond_10e

    iput-object v2, p0, Landroidx/mediarouter/app/d;->N:Lcod;

    iget-boolean v0, p0, Landroidx/mediarouter/app/d;->d0:Z

    if-eqz v0, :cond_10e

    iget-boolean v0, p0, Landroidx/mediarouter/app/d;->e0:Z

    invoke-virtual {p0, v0}, Landroidx/mediarouter/app/d;->r(Z)V

    :cond_10e
    return-void

    :pswitch_10f
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/mediarouter/app/d;

    invoke-virtual {p0, v4}, Landroidx/mediarouter/app/d;->k(Z)V

    iget-object v0, p0, Landroidx/mediarouter/app/d;->F:Landroidx/mediarouter/app/OverlayListView;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    iget-object v0, p0, Landroidx/mediarouter/app/d;->F:Landroidx/mediarouter/app/OverlayListView;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v2, Ldh;

    invoke-direct {v2, p0, v1}, Ldh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void

    :pswitch_12a
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lco4;

    const v0, 0x7f0a06f5

    invoke-virtual {p0, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ListView;

    if-eqz p0, :cond_142

    invoke-virtual {p0}, Landroid/widget/AdapterView;->getCount()I

    move-result p0

    const-string v0, "MediaRouter.Ui.Device.Count"

    invoke-static {p0, v0}, Lioh;->w(ILjava/lang/String;)V

    :cond_142
    return-void

    :pswitch_143
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lpmd;

    invoke-virtual {p0}, Landroidx/fragment/app/i;->dismiss()V

    return-void

    :pswitch_14b
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lusc;

    invoke-interface {p0}, Lusc;->onLoaderReleased()V

    return-void

    :pswitch_153
    iget-object v0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast v0, Lekc;

    iget-object v1, v0, Lekc;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_15a
    iget-object v0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast v0, Lekc;

    iget-object v0, v0, Lekc;->f:Ljava/lang/Object;

    iget-object v2, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast v2, Lekc;

    sget-object v3, Lekc;->k:Ljava/lang/Object;

    iput-object v3, v2, Lekc;->f:Ljava/lang/Object;

    monitor-exit v1
    :try_end_169
    .catchall {:try_start_15a .. :try_end_169} :catchall_173

    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lekc;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :goto_171
    :try_start_171
    monitor-exit v1
    :try_end_172
    .catchall {:try_start_171 .. :try_end_172} :catchall_173

    throw p0

    :catchall_173
    move-exception v0

    move-object p0, v0

    goto :goto_171

    :pswitch_176
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lohc;

    iput-object v2, p0, Lohc;->b:Ljava/util/ArrayList;

    iput-object v2, p0, Lohc;->a:Ljava/util/ArrayList;

    return-void

    :pswitch_17f
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lb1c;

    iget-object v0, p0, Lb1c;->e:Lf1c;

    iget-object v1, v0, Lf1c;->B:Lcr2;

    iget-object v1, v1, Lcr2;->h:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    iget-object p0, p0, Lygc;->a:Lxd2;

    iget-object p0, p0, Lxd2;->f:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lv3m;->c(Landroid/content/Context;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-ge p0, v0, :cond_1a2

    move v3, v4

    :cond_1a2
    invoke-virtual {v1, v3}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :pswitch_1a6
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lpnb;

    iget-object v0, p0, Lpnb;->p:Ljava/lang/String;

    iput-object v0, p0, Lpnb;->m:Ljava/lang/String;

    iput-object v2, p0, Lpnb;->p:Ljava/lang/String;

    new-instance v0, Lhnb;

    invoke-direct {v0, p0, v4}, Lhnb;-><init>(Lpnb;B)V

    new-instance v1, Lgnb;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v0, v2}, Lgnb;-><init>(Lpnb;Lqnb;B)V

    const-string v0, "fireOpenConnection"

    invoke-virtual {p0, v0, v1}, Lpnb;->c(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void

    :pswitch_1c1
    iget-object v0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast v0, Lglb;

    iget-object v4, v0, Lglb;->m:Lclb;

    iget-object v1, v0, Lglb;->c:Landroidx/recyclerview/widget/i;

    if-eqz v1, :cond_2d2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v5, v0, Lglb;->B:J

    const-wide/high16 v10, -0x8000000000000000L

    cmp-long v7, v5, v10

    if-nez v7, :cond_1db

    const-wide/16 v5, 0x0

    :goto_1d9
    move-wide v8, v5

    goto :goto_1de

    :cond_1db
    sub-long v5, v1, v5

    goto :goto_1d9

    :goto_1de
    iget-object v5, v0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v5, v5, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    iget-object v6, v0, Lglb;->A:Landroid/graphics/Rect;

    if-nez v6, :cond_1ed

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    iput-object v6, v0, Lglb;->A:Landroid/graphics/Rect;

    :cond_1ed
    iget-object v7, v0, Lglb;->c:Landroidx/recyclerview/widget/i;

    iget-object v7, v7, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v5, v7, v6}, Landroidx/recyclerview/widget/f;->calculateItemDecorationsForChild(Landroid/view/View;Landroid/graphics/Rect;)V

    invoke-virtual {v5}, Landroidx/recyclerview/widget/f;->canScrollHorizontally()Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_238

    iget v6, v0, Lglb;->j:F

    iget v12, v0, Lglb;->h:F

    add-float/2addr v6, v12

    float-to-int v6, v6

    iget-object v12, v0, Lglb;->A:Landroid/graphics/Rect;

    iget v12, v12, Landroid/graphics/Rect;->left:I

    sub-int v12, v6, v12

    iget-object v13, v0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v13}, Landroid/view/View;->getPaddingLeft()I

    move-result v13

    sub-int/2addr v12, v13

    iget v13, v0, Lglb;->h:F

    cmpg-float v14, v13, v7

    if-gez v14, :cond_216

    if-ltz v12, :cond_239

    :cond_216
    cmpl-float v12, v13, v7

    if-lez v12, :cond_238

    iget-object v12, v0, Lglb;->c:Landroidx/recyclerview/widget/i;

    iget-object v12, v12, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getWidth()I

    move-result v12

    add-int/2addr v12, v6

    iget-object v6, v0, Lglb;->A:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->right:I

    add-int/2addr v12, v6

    iget-object v6, v0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v6

    iget-object v13, v0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v13}, Landroid/view/View;->getPaddingRight()I

    move-result v13

    sub-int/2addr v6, v13

    sub-int/2addr v12, v6

    if-gtz v12, :cond_239

    :cond_238
    move v12, v3

    :cond_239
    invoke-virtual {v5}, Landroidx/recyclerview/widget/f;->canScrollVertically()Z

    move-result v5

    if-eqz v5, :cond_27d

    iget v5, v0, Lglb;->k:F

    iget v6, v0, Lglb;->i:F

    add-float/2addr v5, v6

    float-to-int v5, v5

    iget-object v6, v0, Lglb;->A:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    sub-int v6, v5, v6

    iget-object v13, v0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v13}, Landroid/view/View;->getPaddingTop()I

    move-result v13

    sub-int/2addr v6, v13

    iget v13, v0, Lglb;->i:F

    cmpg-float v14, v13, v7

    if-gez v14, :cond_25a

    if-ltz v6, :cond_27c

    :cond_25a
    cmpl-float v6, v13, v7

    if-lez v6, :cond_27d

    iget-object v6, v0, Lglb;->c:Landroidx/recyclerview/widget/i;

    iget-object v6, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v6

    add-int/2addr v6, v5

    iget-object v5, v0, Lglb;->A:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v6, v5

    iget-object v5, v0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    iget-object v7, v0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v7}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v5, v7

    sub-int/2addr v6, v5

    if-lez v6, :cond_27d

    :cond_27c
    move v3, v6

    :cond_27d
    if-eqz v12, :cond_293

    iget-object v5, v0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v6, v0, Lglb;->c:Landroidx/recyclerview/widget/i;

    iget-object v6, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v6

    iget-object v7, v0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move v7, v12

    invoke-virtual/range {v4 .. v9}, Lclb;->i(Landroidx/recyclerview/widget/RecyclerView;IIJ)I

    move-result v12

    :cond_293
    if-eqz v3, :cond_2a9

    iget-object v5, v0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v6, v0, Lglb;->c:Landroidx/recyclerview/widget/i;

    iget-object v6, v6, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v6

    iget-object v7, v0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    move v7, v3

    invoke-virtual/range {v4 .. v9}, Lclb;->i(Landroidx/recyclerview/widget/RecyclerView;IIJ)I

    move-result v3

    :cond_2a9
    if-nez v12, :cond_2b0

    if-nez v3, :cond_2b0

    iput-wide v10, v0, Lglb;->B:J

    goto :goto_2d2

    :cond_2b0
    iget-wide v4, v0, Lglb;->B:J

    cmp-long v4, v4, v10

    if-nez v4, :cond_2b8

    iput-wide v1, v0, Lglb;->B:J

    :cond_2b8
    iget-object v1, v0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v12, v3}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    iget-object v1, v0, Lglb;->c:Landroidx/recyclerview/widget/i;

    if-eqz v1, :cond_2c4

    invoke-virtual {v0, v1}, Lglb;->m(Landroidx/recyclerview/widget/i;)V

    :cond_2c4
    iget-object v1, v0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v0, Lglb;->s:Lvl9;

    invoke-virtual {v1, v2}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, v0, Lglb;->r:Landroidx/recyclerview/widget/RecyclerView;

    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :cond_2d2
    :goto_2d2
    return-void

    :pswitch_2d3
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lzdb;

    iget-object p0, p0, Lzdb;->b:Laeb;

    iget-object v0, p0, Laeb;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Laeb;->b()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    if-eqz v1, :cond_314

    invoke-virtual {p0}, Laeb;->d()Z

    move-result v1

    if-eqz v1, :cond_2fd

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v1

    if-eqz v1, :cond_2f5

    iget-object p0, p0, Laeb;->f:Lbp;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v3}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    :cond_2f5
    iget-object p0, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->x:Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;

    if-eqz p0, :cond_314

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->closeContents()V

    goto :goto_314

    :cond_2fd
    iget-object p0, p0, Laeb;->b:Lu59;

    invoke-virtual {p0}, Lu59;->F()Lb2l;

    move-result-object p0

    if-eqz p0, :cond_30d

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->o0()Z

    move-result p0

    if-nez p0, :cond_314

    :cond_30d
    iget-object p0, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->x:Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;

    if-eqz p0, :cond_314

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->closeContents()V

    :cond_314
    :goto_314
    return-void

    :pswitch_315
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lg77;

    iget-object v0, p0, Lg77;->c:Ljava/lang/Object;

    check-cast v0, Lf7a;

    iget-object v1, v0, Lf7a;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_32c

    iget-object p0, p0, Lg77;->a:Ljava/lang/Object;

    check-cast p0, Landroid/os/Handler;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_32c
    return-void

    :pswitch_32d
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-interface {p0, v4}, Ljava/util/concurrent/Future;->cancel(Z)Z

    return-void

    :pswitch_335
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lk8;

    invoke-virtual {p0}, Lk8;->P()V

    return-void

    :pswitch_33d
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Lzm9;

    invoke-virtual {p0, v3}, Lzm9;->b(Z)V

    return-void

    :pswitch_345
    iget-object p0, p0, Lvl9;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/fragment/app/w;

    invoke-virtual {p0, v4}, Landroidx/fragment/app/w;->A(Z)Z

    return-void

    nop

    :pswitch_data_34e
    .packed-switch 0x0
        :pswitch_345
        :pswitch_33d
        :pswitch_335
        :pswitch_32d
        :pswitch_315
        :pswitch_2d3
        :pswitch_1c1
        :pswitch_1a6
        :pswitch_17f
        :pswitch_176
        :pswitch_153
        :pswitch_14b
        :pswitch_143
        :pswitch_12a
        :pswitch_10f
        :pswitch_f9
        :pswitch_f1
        :pswitch_d5
        :pswitch_cd
        :pswitch_bb
        :pswitch_88
        :pswitch_7e
        :pswitch_76
        :pswitch_6a
        :pswitch_46
        :pswitch_3c
        :pswitch_34
        :pswitch_19
        :pswitch_11
    .end packed-switch
.end method
