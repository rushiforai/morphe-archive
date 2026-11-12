.class public final synthetic Lbn7;
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

    .line 10
    iput-byte p2, p0, Lbn7;->a:B

    iput-object p1, p0, Lbn7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;IB)V
    .registers 4

    .line 11
    iput-byte p3, p0, Lbn7;->a:B

    iput-object p1, p0, Lbn7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lzi8;Lckg;)V
    .registers 3

    const/16 p1, 0x10

    iput-byte p1, p0, Lbn7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lbn7;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-byte v0, p0, Lbn7;->a:B

    const/16 v1, 0x80

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    iget-object p0, p0, Lbn7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_282

    check-cast p0, Lcd9;

    iget-object p0, p0, Lcd9;->p:Lrma;

    if-eqz p0, :cond_15

    invoke-virtual {p0}, Lrma;->l()V

    :cond_15
    return-void

    :pswitch_16
    check-cast p0, Lg89;

    iget-object v0, p0, Lg89;->b:Lesg;

    iget-object v0, v0, Lesg;->c:Ljava/lang/Object;

    check-cast v0, Lhom;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfom;

    iget v0, v0, Lfom;->a:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_2b

    move v3, v4

    :cond_2b
    iget-boolean v0, p0, Lg89;->i:Z

    if-eq v3, v0, :cond_34

    iput-boolean v3, p0, Lg89;->i:Z

    invoke-virtual {p0}, Lg89;->c()V

    :cond_34
    return-void

    :pswitch_35
    check-cast p0, Ls9i;

    iput-object v2, p0, Ls9i;->e:Ljava/lang/Object;

    iget-object v0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast v0, Li32;

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Landroid/util/SparseArray;

    invoke-virtual {p0}, Landroid/util/SparseArray;->clone()Landroid/util/SparseArray;

    move-result-object p0

    invoke-virtual {v0, p0}, Lldk;->g(Ljava/lang/Object;)V

    return-void

    :pswitch_49
    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    return-void

    :pswitch_4f
    check-cast p0, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;

    sget v0, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->W:I

    invoke-virtual {p0}, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->N0()V

    return-void

    :pswitch_57
    check-cast p0, Ltw8;

    iput-object v2, p0, Ltw8;->d:Lbn7;

    iput-boolean v4, p0, Ltw8;->c:Z

    iget-object v0, p0, Ltw8;->a:Low8;

    invoke-virtual {v0, v4}, Lcu8;->Y(Z)Z

    move-result v0

    iput-boolean v3, p0, Ltw8;->c:Z

    if-eqz v0, :cond_6c

    iget-object p0, p0, Ltw8;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    :cond_6c
    return-void

    :pswitch_6d
    check-cast p0, Ldw8;

    invoke-virtual {p0}, Ldw8;->e0()V

    return-void

    :pswitch_73
    check-cast p0, Lcv8;

    iget-object p0, p0, Lcv8;->w:Lijc;

    invoke-virtual {p0}, Lijc;->h()V

    return-void

    :pswitch_7b
    check-cast p0, Lns8;

    iput-object v2, p0, Lns8;->r:Lbn7;

    iget-object v0, p0, Lns8;->q:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_89
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_89

    goto :goto_c6

    :cond_a2
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_aa
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_ba

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Les8;

    invoke-virtual {v3}, Les8;->V()V

    goto :goto_aa

    :cond_ba
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Lns8;->s:Lqlk;

    if-eqz v0, :cond_c6

    invoke-virtual {v0}, Lqlk;->run()V

    iput-object v2, p0, Lns8;->s:Lqlk;

    :cond_c6
    :goto_c6
    return-void

    :pswitch_c7
    check-cast p0, Lar8;

    iput-boolean v3, p0, Lar8;->B:Z

    iget-boolean v0, p0, Lar8;->m:Z

    if-eqz v0, :cond_d6

    iget-object v0, p0, Lar8;->i:Lo63;

    iget-object p0, p0, Lar8;->v:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p0}, Lh6e;->d(Landroidx/recyclerview/widget/RecyclerView;)V

    :cond_d6
    return-void

    :pswitch_d7
    check-cast p0, Lqq8;

    iget-object v0, p0, Lqq8;->b:Ljava/lang/Object;

    check-cast v0, Lrq8;

    iget-object p0, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast p0, Lnq8;

    invoke-virtual {v0, p0, v4}, Lrq8;->a(Lnq8;Z)V

    return-void

    :pswitch_e5
    check-cast p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    sget v0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->i:I

    invoke-virtual {p0}, Lcom/opera/android/webcore/FastResizeWebViewContainer;->b()V

    return-void

    :pswitch_ed
    check-cast p0, Lcom/opera/android/browser/external/ExternalAppService;

    sget-boolean v0, Lcom/opera/android/browser/external/ExternalAppService;->b:Z

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    return-void

    :pswitch_f5
    check-cast p0, Lckg;

    :try_start_f7
    monitor-enter p0

    monitor-exit p0
    :try_end_f9
    .catch Lzh8; {:try_start_f7 .. :try_end_f9} :catch_10b

    :try_start_f9
    iget-object v0, p0, Lckg;->a:Lbkg;

    iget-short v1, p0, Lckg;->c:S

    iget-object v2, p0, Lckg;->d:Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lbkg;->handleMessage(ILjava/lang/Object;)V
    :try_end_102
    .catchall {:try_start_f9 .. :try_end_102} :catchall_106

    :try_start_102
    invoke-virtual {p0, v4}, Lckg;->a(Z)V

    goto :goto_114

    :catchall_106
    move-exception v0

    invoke-virtual {p0, v4}, Lckg;->a(Z)V

    throw v0
    :try_end_10b
    .catch Lzh8; {:try_start_102 .. :try_end_10b} :catch_10b

    :catch_10b
    move-exception p0

    const-string v0, "Unexpected error delivering message on external thread."

    invoke-static {v0, p0}, Lw7d;->r(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {p0}, Lrqd;->p(Ljava/lang/Throwable;)V

    :goto_114
    return-void

    :pswitch_115
    check-cast p0, Lzi8;

    iget-object p0, p0, Lzi8;->u:Lel6;

    invoke-virtual {p0}, Lel6;->Q()Ld11;

    move-result-object v0

    new-instance v1, Lzk6;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Lzk6;-><init>(B)V

    const/16 v2, 0x40a

    invoke-virtual {p0, v0, v2, v1}, Lel6;->V(Ld11;ILfjc;)V

    return-void

    :pswitch_129
    check-cast p0, Lqi8;

    iget-object v0, p0, Lqi8;->D:Lpr;

    iget-object p0, p0, Lqi8;->f:Landroid/content/Context;

    sget-object v1, Ltym;->a:Ljava/lang/String;

    invoke-static {p0}, Lscd;->E(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object p0

    invoke-virtual {p0}, Landroid/media/AudioManager;->generateAudioSessionId()I

    move-result p0

    const/4 v1, -0x1

    if-ne p0, v1, :cond_13d

    move p0, v3

    :cond_13d
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    iput-object p0, v0, Lpr;->f:Ljava/lang/Object;

    new-instance v1, Lw03;

    invoke-direct {v1, v0, p0, v3}, Lw03;-><init>(Lpr;Ljava/lang/Object;B)V

    iget-object p0, v0, Lpr;->c:Ljava/lang/Object;

    check-cast p0, Lszk;

    iget-object v0, p0, Lszk;->a:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_15f

    invoke-virtual {p0, v1}, Lszk;->c(Ljava/lang/Runnable;)V

    :cond_15f
    return-void

    :pswitch_160
    check-cast p0, Lkm5;

    iput-boolean v4, p0, Lkm5;->a:Z

    iget-object v0, p0, Lkm5;->d:Ljava/lang/Object;

    check-cast v0, Loml;

    if-eqz v0, :cond_177

    iget-boolean v0, p0, Lkm5;->b:Z

    if-eqz v0, :cond_177

    iput-object v2, p0, Lkm5;->d:Ljava/lang/Object;

    iget-object p0, p0, Lkm5;->c:Ljava/lang/Object;

    check-cast p0, Lbn7;

    invoke-virtual {p0}, Lbn7;->run()V

    :cond_177
    return-void

    :pswitch_178
    check-cast p0, Lk68;

    iget-object p0, p0, Lk68;->a:Lorg/chromium/content_public/browser/WebContents;

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->q()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object p0

    if-eqz p0, :cond_185

    invoke-interface {p0}, Lorg/chromium/content_public/browser/NavigationController;->b()V

    :cond_185
    return-void

    :pswitch_186
    check-cast p0, Ld28;

    invoke-virtual {p0}, Ld28;->a()V

    return-void

    :pswitch_18c
    check-cast p0, Lgb3;

    invoke-virtual {p0}, Lgb3;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_192
    check-cast p0, Landroidx/emoji2/emojipicker/EmojiView;

    invoke-virtual {p0, v1}, Landroid/view/View;->sendAccessibilityEvent(I)V

    return-void

    :pswitch_198
    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {p0, v1}, Landroid/view/View;->sendAccessibilityEvent(I)V

    return-void

    :pswitch_19e
    check-cast p0, Lew7;

    iget-object p0, p0, Lew7;->c:Lfz2;

    sget-object v0, Lew7;->f:[Lxtb;

    aget-object v0, v0, v3

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0, v1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    return-void

    :pswitch_1ac
    check-cast p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;

    sget v0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->V:I

    iget-boolean v0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->R:Z

    if-eqz v0, :cond_1e0

    iget-boolean v0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->U:Z

    if-nez v0, :cond_1e0

    invoke-virtual {p0}, Lcom/opera/android/FullscreenWebActivity;->n0()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    if-eqz v0, :cond_1e0

    invoke-interface {v0}, Lorg/chromium/content_public/browser/WebContents;->stop()V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v0

    invoke-virtual {v0, v4}, Ldb;->j(Z)V

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v0

    invoke-virtual {v0}, Lbf9;->h()V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_1e0
    return-void

    :pswitch_1e1
    check-cast p0, Lyv7;

    iput-object v2, p0, Lyv7;->q:Lbn7;

    iget-object v0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z

    move-result v0

    if-eqz v0, :cond_1f2

    iget-object p0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-static {p0}, Lq9n;->H(Landroid/view/View;)Z

    :cond_1f2
    return-void

    :pswitch_1f3
    check-cast p0, Lss7;

    iget-object p0, p0, Lss7;->t:Lcr2;

    iget-object p0, p0, Lcr2;->d:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lq9n;->G(Landroid/content/Context;Landroid/view/View;)Z

    return-void

    :pswitch_205
    check-cast p0, Lua7;

    iget-object v0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast v0, Lzo7;

    iget-object v1, p0, Lua7;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    const-string v4, "com.opera.android.live_score.LivescoreDynamicFeatureInstanceImpl"

    const v5, 0x7f140a54

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1, v5, v4, v3}, Lw8h;->q(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Lqsh;

    move-result-object v1

    if-eqz v1, :cond_225

    iget-object v1, v1, Lqsh;->c:Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Lcp7;

    :cond_225
    if-eqz v2, :cond_244

    sget-object v1, Lap7;->c:Lap7;

    iput-object v1, p0, Lua7;->c:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v2}, Lcp7;->getState()Lekc;

    move-result-object p0

    new-instance v1, Lwg5;

    const/16 v2, 0x1b

    invoke-direct {v1, v0, v2}, Lwg5;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lcl4;

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lekc;->k(Lf7f;)V

    goto :goto_24f

    :cond_244
    sget-object v1, Lap7;->a:Lap7;

    iput-object v1, p0, Lua7;->c:Ljava/lang/Object;

    iget-object p0, v0, Lzo7;->a:Lode;

    sget-object v0, Lbp7;->b:Lbp7;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    :goto_24f
    return-void

    :pswitch_250
    check-cast p0, Lnn7;

    iput-object v2, p0, Lnn7;->o:Lbn7;

    invoke-virtual {p0}, Lnn7;->q()V

    return-void

    :pswitch_258
    check-cast p0, Lwjh;

    iget-object p0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast p0, Lfn7;

    if-eqz p0, :cond_278

    invoke-virtual {p0}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_268
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_278

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lntk;

    invoke-virtual {v0}, Lntk;->c()V

    goto :goto_268

    :cond_278
    return-void

    :pswitch_279
    check-cast p0, Len7;

    iput-boolean v4, p0, Len7;->f:Z

    invoke-virtual {p0}, Len7;->d()V

    return-void

    nop

    :pswitch_data_282
    .packed-switch 0x0
        :pswitch_279
        :pswitch_258
        :pswitch_250
        :pswitch_205
        :pswitch_1f3
        :pswitch_1e1
        :pswitch_1ac
        :pswitch_19e
        :pswitch_198
        :pswitch_192
        :pswitch_18c
        :pswitch_186
        :pswitch_178
        :pswitch_160
        :pswitch_129
        :pswitch_115
        :pswitch_f5
        :pswitch_ed
        :pswitch_e5
        :pswitch_d7
        :pswitch_c7
        :pswitch_7b
        :pswitch_73
        :pswitch_6d
        :pswitch_57
        :pswitch_4f
        :pswitch_49
        :pswitch_35
        :pswitch_16
    .end packed-switch
.end method
