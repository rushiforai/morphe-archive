.class public final Llx;
.super Lbu8;
.source "SourceFile"


# static fields
.field public static final synthetic n:I


# instance fields
.field public final i:Lkze;

.field public final j:Landroid/view/View;

.field public final k:Lcom/opera/android/favorites/FavoriteGridLinearLayout;

.field public final l:Lizj;

.field public final m:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Landroid/view/View;Lkze;Lizj;)V
    .registers 6

    invoke-direct {p0, p1}, Lbu8;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Llx;->i:Lkze;

    iput-object p1, p0, Llx;->j:Landroid/view/View;

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a0433

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Lcom/opera/android/favorites/FavoriteGridLinearLayout;

    iput-object v0, p0, Llx;->k:Lcom/opera/android/favorites/FavoriteGridLinearLayout;

    new-instance v0, Lcl4;

    const/16 v1, 0x13

    invoke-direct {v0, p0, v1}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p1, v0}, Lxf8;->j0(Likc;Landroid/view/View;Lf7f;)V

    new-instance p2, Lpc5;

    const/16 v0, 0x11

    invoke-direct {p2, p0, v0}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p2, p1}, Lpc5;->a(Landroid/view/View;)V

    iput-object p3, p0, Llx;->l:Lizj;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Llx;->m:Ljava/util/ArrayList;

    iget-object p2, p3, Lizj;->d:Lpde;

    new-instance p3, Lk9;

    const/4 v0, 0x6

    invoke-direct {p3, p0, v0}, Lk9;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p1, p3}, Lxf8;->j0(Likc;Landroid/view/View;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 16

    invoke-super {p0, p1, p2}, Lo43;->V(Lja2;Z)V

    if-nez p2, :cond_9a

    invoke-virtual {p0}, Llx;->Y()V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iget-object p2, p0, Llx;->l:Lizj;

    iget-object p2, p2, Lizj;->d:Lpde;

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ltta;

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object v0

    check-cast v0, Lmq;

    iget-object v0, v0, Lmq;->d:Lyz;

    check-cast v0, Leo;

    iget-object v0, v0, Leo;->w:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_2e
    if-ge v3, v1, :cond_9a

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lads_mobile_sdk/l31;

    const v5, 0x7f0d0149

    iget-object v6, p0, Llx;->k:Lcom/opera/android/favorites/FavoriteGridLinearLayout;

    invoke-virtual {p1, v5, v6, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_95

    check-cast v5, Lcom/google/android/libraries/ads/mobile/sdk/iconad/IconAdView;

    iget-object v7, v5, Lf43;->a:Lads_mobile_sdk/ew1;

    new-instance v8, Ljx;

    iget-object v9, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    iget-object v10, v4, Lads_mobile_sdk/l31;->c:Lyqa;

    iget-object v10, v10, Lyqa;->b:Ljava/lang/Object;

    check-cast v10, Landroid/graphics/drawable/Drawable;

    iget-object v11, v4, Lads_mobile_sdk/l31;->d:Ljava/lang/String;

    sget-object v12, Lvr8;->l:Lvr8;

    invoke-direct {v8, v9, v10, v11, p2}, Ljx;-><init>(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ltta;)V

    iget v9, p2, Ltta;->c:I

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    if-eqz v10, :cond_6d

    iget v11, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-eq v11, v9, :cond_6d

    iput v9, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v5, v10}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_6d
    invoke-virtual {v5, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const-string v9, "3003"

    invoke-virtual {v7, v8, v9}, Lads_mobile_sdk/ew1;->a(Landroid/view/View;Ljava/lang/String;)V

    const-string v9, "3001"

    invoke-virtual {v7, v8, v9}, Lads_mobile_sdk/ew1;->a(Landroid/view/View;Ljava/lang/String;)V

    instance-of v8, v4, Lads_mobile_sdk/l31;

    if-nez v8, :cond_85

    const-string v4, "Internal Error: Cannot display Icon Ad"

    const/4 v7, 0x0

    invoke-static {v4, v7}, Lads_mobile_sdk/xu0;->c(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_8c

    :cond_85
    iget-object v4, v4, Lads_mobile_sdk/l31;->b:Lads_mobile_sdk/bu1;

    iget-object v4, v4, Lads_mobile_sdk/bu1;->b:Lcom/google/android/libraries/ads/mobile/sdk/internal/nativead/InternalNativeAd;

    invoke-virtual {v7, v4}, Lads_mobile_sdk/ew1;->a(Lcom/google/android/libraries/ads/mobile/sdk/internal/nativead/InternalNativeAd;)V

    :goto_8c
    iget-object v4, p0, Llx;->m:Ljava/util/ArrayList;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v6, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_2e

    :cond_95
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :cond_9a
    return-void
.end method

.method public final Y()V
    .registers 8

    iget-object v0, p0, Llx;->k:Lcom/opera/android/favorites/FavoriteGridLinearLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v0, p0, Llx;->m:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_c
    if-ge v2, v1, :cond_61

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lcom/google/android/libraries/ads/mobile/sdk/iconad/IconAdView;

    iget-object v3, v3, Lf43;->a:Lads_mobile_sdk/ew1;

    monitor-enter v3

    :try_start_19
    iget-object v4, v3, Lads_mobile_sdk/ew1;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4
    :try_end_1f
    .catchall {:try_start_19 .. :try_end_1f} :catchall_5e

    if-eqz v4, :cond_23

    monitor-exit v3

    goto :goto_c

    :cond_23
    :try_start_23
    iget-object v4, v3, Lads_mobile_sdk/ew1;->i:Lcom/google/android/libraries/ads/mobile/sdk/internal/nativead/InternalNativeAd;

    if-eqz v4, :cond_2a

    invoke-virtual {v3, v4}, Lads_mobile_sdk/ew1;->c(Lcom/google/android/libraries/ads/mobile/sdk/internal/nativead/InternalNativeAd;)V

    :cond_2a
    const/4 v4, 0x0

    iput-object v4, v3, Lads_mobile_sdk/ew1;->i:Lcom/google/android/libraries/ads/mobile/sdk/internal/nativead/InternalNativeAd;

    iget-object v5, v3, Lads_mobile_sdk/ew1;->b:Lf43;

    if-eqz v5, :cond_34

    invoke-virtual {v5, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_34
    iget-object v5, v3, Lads_mobile_sdk/ew1;->b:Lf43;

    if-eqz v5, :cond_3b

    invoke-virtual {v5, v4}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :cond_3b
    iget-object v5, v3, Lads_mobile_sdk/ew1;->h:Ljava/util/LinkedHashMap;

    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->clear()V

    iget-object v5, v3, Lads_mobile_sdk/ew1;->b:Lf43;

    if-eqz v5, :cond_47

    invoke-virtual {v5}, Lf43;->removeAllViews()V

    :cond_47
    iget-object v5, v3, Lads_mobile_sdk/ew1;->c:Landroid/widget/FrameLayout;

    if-eqz v5, :cond_4e

    invoke-virtual {v5}, Landroid/view/ViewGroup;->removeAllViews()V

    :cond_4e
    iput-object v4, v3, Lads_mobile_sdk/ew1;->e:Landroid/view/View;

    iput-object v4, v3, Lads_mobile_sdk/ew1;->b:Lf43;

    iput-object v4, v3, Lads_mobile_sdk/ew1;->c:Landroid/widget/FrameLayout;

    iget-object v5, v3, Lads_mobile_sdk/ew1;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iput-object v4, v3, Lads_mobile_sdk/ew1;->g:Landroid/view/GestureDetector;
    :try_end_5c
    .catchall {:try_start_23 .. :try_end_5c} :catchall_5e

    monitor-exit v3

    goto :goto_c

    :catchall_5e
    move-exception p0

    monitor-exit v3

    throw p0

    :cond_61
    iget-object p0, p0, Llx;->m:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method
