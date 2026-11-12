.class public final synthetic Lqlk;
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

    iput-byte p2, p0, Lqlk;->a:B

    iput-object p1, p0, Lqlk;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 19

    move-object/from16 v0, p0

    iget-byte v1, v0, Lqlk;->a:B

    const/16 v2, 0xc

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-object v0, v0, Lqlk;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_470

    check-cast v0, Lgal;

    invoke-virtual {v0}, Lgal;->c()V

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Lgal;->a(J)V

    return-void

    :pswitch_19
    check-cast v0, Lr9l;

    iget-object v0, v0, Lr9l;->D:Lg4l;

    invoke-static {v0}, Lg4l;->e(Lg4l;)V

    return-void

    :pswitch_21
    check-cast v0, Le8l;

    invoke-virtual {v0}, Le8l;->c()V

    return-void

    :pswitch_27
    check-cast v0, Lc5l;

    iput-boolean v5, v0, Lc5l;->v:Z

    iput-boolean v5, v0, Lc5l;->u:Z

    return-void

    :pswitch_2e
    check-cast v0, Lb5l;

    iget-object v1, v0, Lb5l;->b:Lk6l;

    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    iget-object v3, v0, Lb5l;->e:Ljava/util/LinkedHashSet;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_3d
    :goto_3d
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7e

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    iget-object v7, v0, Lb5l;->d:Ls4k;

    invoke-virtual {v7}, Ls4k;->invoke()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lu4l;

    invoke-virtual {v7, v6}, Lu4l;->a(I)Lm4l;

    move-result-object v7

    iget-object v7, v7, Lm4l;->b:Ljava/lang/String;

    if-eqz v7, :cond_63

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_3d

    :cond_63
    sget-object v7, Lu3l;->a:Ls3l;

    new-instance v7, Lr3l;

    invoke-direct {v7, v6}, Lr3l;-><init>(I)V

    sget-object v6, Ly6l;->a:Ly6l;

    invoke-static {v1, v7, v6}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ne v7, v4, :cond_3d

    invoke-static {v6}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_3d

    :cond_7e
    invoke-interface {v3}, Ljava/util/Set;->clear()V

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_bd

    sget-object v3, Lh6l;->d:Lh6l;

    invoke-virtual {v1, v3}, Lk6l;->h(Lh6l;)V

    :try_start_8c
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_90
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb2l;

    move-object v4, v2

    check-cast v4, Ld7l;

    iget-object v4, v4, Ld7l;->j:Le7l;

    invoke-interface {v4}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v5

    const/4 v9, 0x0

    const/4 v10, 0x7

    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    invoke-static/range {v5 .. v10}, Lcom/opera/android/browser/TabInfo;->a(Lcom/opera/android/browser/TabInfo;JIII)Lcom/opera/android/browser/TabInfo;

    move-result-object v4

    check-cast v2, Ld7l;

    invoke-virtual {v2, v4}, Ld7l;->s(Lcom/opera/android/browser/TabInfo;)Z
    :try_end_b3
    .catchall {:try_start_8c .. :try_end_b3} :catchall_b8

    goto :goto_90

    :cond_b4
    invoke-virtual {v1, v3}, Lk6l;->n(Lh6l;)V

    goto :goto_bd

    :catchall_b8
    move-exception v0

    invoke-virtual {v1, v3}, Lk6l;->n(Lh6l;)V

    throw v0

    :cond_bd
    :goto_bd
    return-void

    :pswitch_be
    check-cast v0, Lxz2;

    iget-object v1, v0, Lxz2;->d:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/ViewTreeObserver;->removeOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    iget-object v0, v0, Lxz2;->c:Ljava/lang/Object;

    check-cast v0, Lh3l;

    invoke-virtual {v0}, Lh3l;->run()V

    return-void

    :pswitch_d3
    check-cast v0, Lc0l;

    sget-object v1, Ls9g;->h:Ls9g;

    iget-object v1, v1, Ls9g;->c:Lvzk;

    invoke-virtual {v1}, Lvzk;->D()Ljava/util/HashMap;

    move-result-object v1

    :try_start_dd
    sget-object v2, Lrmj;->a:Ln9h;

    iget-object v6, v2, Ln9h;->c:Ljava/lang/Object;

    monitor-enter v6
    :try_end_e2
    .catch Ljava/lang/Exception; {:try_start_dd .. :try_end_e2} :catch_198

    :try_start_e2
    invoke-virtual {v2}, Ln9h;->m()[Lsmj;

    move-result-object v2

    monitor-exit v6
    :try_end_e7
    .catchall {:try_start_e2 .. :try_end_e7} :catchall_196

    :try_start_e7
    array-length v6, v2

    invoke-static {v6}, Lqbd;->a(I)I

    move-result v6

    const/16 v7, 0x10

    if-ge v6, v7, :cond_f1

    move v6, v7

    :cond_f1
    new-instance v7, Ljava/util/LinkedHashMap;

    invoke-direct {v7, v6}, Ljava/util/LinkedHashMap;-><init>(I)V

    array-length v6, v2

    :goto_f7
    if-ge v5, v6, :cond_107

    aget-object v8, v2, v5

    iget-object v9, v8, Lsmj;->b:Ljava/lang/String;

    invoke-static {v9}, Lcom/opera/android/browser/BrowserUtils;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_104
    .catch Ljava/lang/Exception; {:try_start_e7 .. :try_end_104} :catch_198

    add-int/lit8 v5, v5, 0x1

    goto :goto_f7

    :cond_107
    sget-object v2, Lkag;->d:Lkag;

    iget-object v5, v0, Lc0l;->b:Lydj;

    iget-object v6, v5, Lydj;->a:Lru9;

    iget-object v6, v6, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v8, "notification_permision_storage.version"

    const/4 v9, -0x1

    invoke-interface {v6, v8, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    if-eq v6, v4, :cond_190

    invoke-virtual {v7}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_120
    :goto_120
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_17c

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lsmj;

    invoke-virtual {v1, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljag;

    if-eqz v10, :cond_147

    sget-object v11, Llag;->b:Llag;

    invoke-virtual {v10, v11, v2}, Ljag;->a(Llag;Lkag;)Lkag;

    move-result-object v10

    goto :goto_148

    :cond_147
    move-object v10, v3

    :goto_148
    if-eqz v10, :cond_168

    if-eq v10, v2, :cond_168

    iget-boolean v11, v9, Lsmj;->c:Z

    if-eqz v11, :cond_120

    sget-object v11, Lkag;->c:Lkag;

    if-ne v10, v11, :cond_120

    sget-object v10, Lrmj;->a:Ln9h;

    iget-object v9, v9, Lsmj;->a:Ljava/lang/String;

    iget-object v11, v10, Ln9h;->c:Ljava/lang/Object;

    monitor-enter v11

    :try_start_15b
    iget-object v10, v10, Ln9h;->b:Ljava/lang/Object;

    check-cast v10, Lwub;

    invoke-virtual {v10, v9}, Lwub;->A(Ljava/lang/String;)V

    monitor-exit v11

    goto :goto_120

    :goto_164
    monitor-exit v11
    :try_end_165
    .catchall {:try_start_15b .. :try_end_165} :catchall_166

    throw v0

    :catchall_166
    move-exception v0

    goto :goto_164

    :cond_168
    sget-object v10, Lrmj;->a:Ln9h;

    iget-object v9, v9, Lsmj;->a:Ljava/lang/String;

    iget-object v11, v10, Ln9h;->c:Ljava/lang/Object;

    monitor-enter v11

    :try_start_16f
    iget-object v10, v10, Ln9h;->b:Ljava/lang/Object;

    check-cast v10, Lwub;

    invoke-virtual {v10, v9}, Lwub;->A(Ljava/lang/String;)V

    monitor-exit v11

    goto :goto_120

    :goto_178
    monitor-exit v11
    :try_end_179
    .catchall {:try_start_16f .. :try_end_179} :catchall_17a

    throw v0

    :catchall_17a
    move-exception v0

    goto :goto_178

    :cond_17c
    invoke-virtual {v0, v1, v7}, Lc0l;->b(Ljava/util/HashMap;Ljava/util/LinkedHashMap;)V

    iget-object v0, v5, Lydj;->a:Lru9;

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1, v8, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    goto :goto_19c

    :cond_190
    invoke-virtual {v0, v1, v7}, Lc0l;->b(Ljava/util/HashMap;Ljava/util/LinkedHashMap;)V

    goto :goto_19c

    :goto_194
    :try_start_194
    monitor-exit v6
    :try_end_195
    .catchall {:try_start_194 .. :try_end_195} :catchall_196

    :try_start_195
    throw v0
    :try_end_196
    .catch Ljava/lang/Exception; {:try_start_195 .. :try_end_196} :catch_198

    :catchall_196
    move-exception v0

    goto :goto_194

    :catch_198
    move-exception v0

    invoke-static {v0}, Lks3;->D(Ljava/lang/Throwable;)V

    :goto_19c
    return-void

    :pswitch_19d
    check-cast v0, Lizk;

    iget-object v0, v0, Lizk;->a:Lgzk;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1ae

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_1ae
    return-void

    :pswitch_1af
    check-cast v0, Ljyk;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lzz2;->c(Ljava/lang/Boolean;)V

    return-void

    :pswitch_1b7
    check-cast v0, Ljyk;

    iget-boolean v1, v0, Lzz2;->a:Z

    if-nez v1, :cond_1c2

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lzz2;->c(Ljava/lang/Boolean;)V

    :cond_1c2
    return-void

    :pswitch_1c3
    check-cast v0, Lr72;

    iget-object v1, v0, Lr72;->d:Ljava/lang/Object;

    check-cast v1, Lmyk;

    iget-object v1, v1, Lmyk;->a:Lbf9;

    new-instance v2, Lzzh;

    const/16 v3, 0x17

    invoke-direct {v2, v0, v3}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lbf9;->o(Lzzh;)Lih4;

    move-result-object v1

    iput-object v1, v0, Lr72;->c:Ljava/lang/Object;

    return-void

    :pswitch_1d9
    check-cast v0, Ljyk;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lzz2;->c(Ljava/lang/Boolean;)V

    return-void

    :pswitch_1e1
    check-cast v0, Lfyk;

    iget-object v0, v0, Lfyk;->c:Ljava/lang/Object;

    check-cast v0, Lwv1;

    iget-object v1, v0, Lwv1;->b:Lb6h;

    invoke-interface {v1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnr8;

    sget-object v2, Lgyk;->e:Lhk6;

    iget-object v2, v2, Lhk6;->d:Ljava/lang/String;

    sget-object v3, Lp6l;->a:Lp6l;

    invoke-virtual {v1, v2, v3}, Lnr8;->c(Ljava/lang/String;Lp6l;)Lhq8;

    move-result-object v1

    if-eqz v1, :cond_211

    iget-object v0, v0, Lwv1;->b:Lb6h;

    invoke-interface {v0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnr8;

    check-cast v0, Lcom/opera/android/favorites/e;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Lhq8;->e()J

    move-result-wide v0

    sget-object v2, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {v0, v1}, LJ/N;->Mw8yLl_M(J)V

    :cond_211
    return-void

    :pswitch_212
    check-cast v0, Lgyk;

    iget-object v1, v0, Lgyk;->b:Lnr8;

    sget-object v2, Lgyk;->e:Lhk6;

    iget-object v4, v2, Lhk6;->d:Ljava/lang/String;

    sget-object v5, Lp6l;->a:Lp6l;

    invoke-virtual {v1, v4, v5}, Lnr8;->c(Ljava/lang/String;Lp6l;)Lhq8;

    move-result-object v4

    if-nez v4, :cond_235

    new-instance v4, Lmzj;

    iget-object v0, v0, Lgyk;->a:Lxd5;

    iget v5, v2, Lhk6;->a:I

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, v2, Lhk6;->d:Ljava/lang/String;

    const/4 v5, 0x4

    invoke-direct {v4, v0, v2, v3, v5}, Lmzj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;I)V

    invoke-virtual {v1, v4}, Lnr8;->a(Lmzj;)J

    :cond_235
    return-void

    :pswitch_236
    check-cast v0, Lzxk;

    iput-object v3, v0, Lzxk;->j:Landroid/os/CancellationSignal;

    iput-boolean v4, v0, Lzxk;->h:Z

    invoke-virtual {v0}, Lzxk;->b()V

    return-void

    :pswitch_240
    check-cast v0, Lmxk;

    iget-object v1, v0, Lmxk;->a:Ldxk;

    iget-object v4, v1, Ldxk;->h:Lumi;

    new-instance v6, Lqlk;

    invoke-direct {v6, v1, v2}, Lqlk;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v4, v6}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v1

    invoke-virtual {v1, v3}, Lnml;->a(Ljava/lang/Object;)Loml;

    invoke-virtual {v0, v5}, Lmxk;->R(Z)V

    return-void

    :pswitch_256
    check-cast v0, Laxk;

    iget-object v1, v0, Laxk;->c:Lzwk;

    invoke-virtual {v1, v0}, Lzwk;->j(Lywk;)V

    iget-object v0, v0, Laxk;->a:Lqlk;

    invoke-virtual {v0}, Lqlk;->run()V

    return-void

    :pswitch_263
    check-cast v0, Ldxk;

    invoke-virtual {v0}, Ldxk;->R()V

    return-void

    :pswitch_269
    check-cast v0, Lhu5;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lhu5;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_271
    check-cast v0, Ln9k;

    iput-boolean v4, v0, Ln9k;->a:Z

    return-void

    :pswitch_276
    check-cast v0, La32;

    invoke-virtual {v0}, La32;->k()V

    return-void

    :pswitch_27c
    check-cast v0, Lghf;

    iget-object v0, v0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Lfn7;

    if-eqz v0, :cond_29c

    invoke-virtual {v0}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_28c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_29c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lntk;

    invoke-virtual {v1}, Lntk;->c()V

    goto :goto_28c

    :cond_29c
    return-void

    :pswitch_29d
    check-cast v0, Ls0b;

    invoke-virtual {v0}, Lg07;->a()V

    return-void

    :pswitch_2a3
    check-cast v0, Leyi;

    iput-boolean v5, v0, Leyi;->b:Z

    iget-object v1, v0, Leyi;->d:Ljava/lang/Object;

    check-cast v1, Lmrk;

    iget-object v2, v1, Lmrk;->b:Landroid/view/ViewGroup;

    iget-object v0, v0, Leyi;->c:Ljava/lang/Object;

    check-cast v0, Lqlk;

    invoke-virtual {v2, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, v1, Lmrk;->b:Landroid/view/ViewGroup;

    iget-object v1, v1, Lmrk;->y:Lw6j;

    iget-object v1, v1, Lw6j;->a:Ljava/lang/Object;

    check-cast v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    return-void

    :pswitch_2c0
    check-cast v0, Lipk;

    iget-object v1, v0, Lipk;->a:Lxbf;

    iget-object v3, v1, Lxbf;->e:Ljava/lang/Object;

    check-cast v3, Lw6j;

    new-instance v6, Ljpk;

    invoke-direct {v6, v1, v5}, Ljpk;-><init>(Lxbf;B)V

    new-instance v1, Lxbf;

    invoke-direct {v1, v6}, Lxbf;-><init>(Ljpk;)V

    iget-object v6, v3, Lw6j;->a:Ljava/lang/Object;

    check-cast v6, Lqfb;

    new-instance v7, Luok;

    invoke-direct {v7, v1, v5}, Luok;-><init>(Lxbf;B)V

    new-instance v8, Ld1h;

    new-instance v9, Ljava/util/Date;

    invoke-direct {v9}, Ljava/util/Date;-><init>()V

    invoke-virtual {v9}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    invoke-direct {v8, v9, v10, v7, v5}, Ld1h;-><init>(JLcom/opera/api/Callback;B)V

    iget-object v6, v6, Lqfb;->b:Ljava/lang/Object;

    check-cast v6, Lkw3;

    invoke-virtual {v6}, Lkw3;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Date;

    new-instance v7, Lc1h;

    invoke-direct {v7, v8, v5}, Lc1h;-><init>(Ld1h;B)V

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    const/16 v11, 0x3e8

    invoke-static {v11, v9, v10, v7}, LJ/N;->MmbDGwJs(IJLjava/lang/Object;)V

    new-instance v7, Lc1h;

    invoke-direct {v7, v8, v4}, Lc1h;-><init>(Ld1h;B)V

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    invoke-static {v11, v8, v9, v7}, LJ/N;->MSaDng7I(IJLjava/lang/Object;)V

    iget-object v6, v3, Lw6j;->b:Ljava/lang/Object;

    check-cast v6, Ldcl;

    new-instance v7, Luok;

    invoke-direct {v7, v1, v4}, Luok;-><init>(Lxbf;B)V

    new-instance v8, Ld1h;

    new-instance v9, Ljava/util/Date;

    invoke-direct {v9}, Ljava/util/Date;-><init>()V

    invoke-virtual {v9}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    invoke-direct {v8, v9, v10, v7, v4}, Ld1h;-><init>(JLcom/opera/api/Callback;B)V

    iget-object v6, v6, Ldcl;->a:Ljava/lang/Object;

    check-cast v6, Lkw3;

    invoke-virtual {v6}, Lkw3;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Date;

    new-instance v7, Lfam;

    invoke-direct {v7, v8, v5}, Lfam;-><init>(Ld1h;B)V

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    invoke-static {v11, v9, v10, v7}, LJ/N;->MmbDGwJs(IJLjava/lang/Object;)V

    new-instance v7, Lfam;

    invoke-direct {v7, v8, v4}, Lfam;-><init>(Ld1h;B)V

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    invoke-static {v11, v8, v9, v7}, LJ/N;->MSaDng7I(IJLjava/lang/Object;)V

    iget-object v6, v3, Lw6j;->c:Ljava/lang/Object;

    check-cast v6, Lvi5;

    new-instance v7, Luok;

    const/4 v8, 0x2

    invoke-direct {v7, v1, v8}, Luok;-><init>(Lxbf;B)V

    new-instance v8, Ljava/util/Date;

    invoke-direct {v8}, Ljava/util/Date;-><init>()V

    invoke-virtual {v8}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    new-instance v10, Lp8f;

    new-instance v12, Lqhd;

    invoke-direct {v12, v8, v9, v6}, Lqhd;-><init>(JLjava/lang/Object;)V

    iget-object v8, v6, Lvi5;->e:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    invoke-direct {v10, v12, v7, v8, v5}, Lp8f;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v6, v6, Lvi5;->d:Ljava/lang/Object;

    check-cast v6, Ltw2;

    new-instance v7, Lo8f;

    invoke-direct {v7, v10, v5}, Lo8f;-><init>(Ljava/lang/Object;B)V

    iget-object v6, v6, Ltw2;->b:Ljava/lang/Object;

    check-cast v6, Lglh;

    new-instance v8, Liu2;

    invoke-direct {v8, v7, v2}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v6, v8}, Lglh;->f(Lcom/opera/api/Callback;)V

    iget-object v6, v3, Lw6j;->d:Ljava/lang/Object;

    check-cast v6, Ld7h;

    new-instance v7, Luok;

    const/4 v8, 0x3

    invoke-direct {v7, v1, v8}, Luok;-><init>(Lxbf;B)V

    iget-object v8, v6, Ld7h;->c:Ljava/lang/Object;

    check-cast v8, Ljjg;

    invoke-virtual {v8}, Ljjg;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    new-instance v9, Lnn;

    invoke-direct {v9, v2}, Lnn;-><init>(B)V

    invoke-interface {v8, v9}, Ljava/util/Collection;->removeIf(Ljava/util/function/Predicate;)Z

    new-instance v2, Lb10;

    const/16 v9, 0x1b

    invoke-direct {v2, v9}, Lb10;-><init>(B)V

    new-instance v9, Lzlb;

    invoke-direct {v9, v8, v2, v4}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    invoke-static {v9}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v16

    iget-object v2, v6, Ld7h;->b:Ljava/lang/Object;

    check-cast v2, Ltxi;

    new-instance v15, Lrzj;

    invoke-direct {v15, v6, v7, v8}, Lrzj;-><init>(Ld7h;Lcom/opera/api/Callback;Ljava/util/List;)V

    iget-object v2, v2, Ltxi;->b:Ljava/lang/Object;

    check-cast v2, Lu7k;

    new-instance v12, Lvan;

    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v13

    iget-object v2, v2, Lu7k;->a:Ljava/lang/Object;

    move-object/from16 v17, v2

    check-cast v17, Ltxi;

    invoke-direct/range {v12 .. v17}, Lvan;-><init>(JLrzj;Ljava/util/ArrayList;Ltxi;)V

    invoke-static {}, Lipk;->S()Ljava/util/Date;

    move-result-object v2

    new-instance v6, Luan;

    invoke-direct {v6, v12, v5}, Luan;-><init>(Lvan;B)V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    invoke-static {v11, v7, v8, v6}, LJ/N;->MmbDGwJs(IJLjava/lang/Object;)V

    new-instance v6, Luan;

    invoke-direct {v6, v12, v4}, Luan;-><init>(Lvan;B)V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    invoke-static {v11, v7, v8, v6}, LJ/N;->MSaDng7I(IJLjava/lang/Object;)V

    iget-object v2, v3, Lw6j;->e:Ljava/lang/Object;

    check-cast v2, Lvk;

    invoke-static {}, LJ/N;->MphJ2uhp()Z

    move-result v3

    if-nez v3, :cond_3f9

    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    check-cast v2, Ljava/util/List;

    iput-object v2, v1, Lxbf;->g:Ljava/lang/Object;

    invoke-virtual {v1}, Lxbf;->B()V

    goto :goto_400

    :cond_3f9
    iget-object v2, v2, Lvk;->a:Ljava/util/ArrayList;

    iput-object v2, v1, Lxbf;->g:Ljava/lang/Object;

    invoke-virtual {v1}, Lxbf;->B()V

    :goto_400
    iget-boolean v1, v0, Lipk;->l:Z

    if-eqz v1, :cond_420

    iget-object v1, v0, Lipk;->k:Lxbf;

    iget-object v2, v1, Lxbf;->d:Ljava/lang/Object;

    check-cast v2, Ljjg;

    invoke-virtual {v2}, Ljjg;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_41e

    new-instance v3, Lw8d;

    invoke-direct {v3, v4, v1, v2}, Lw8d;-><init>(BLjava/lang/Object;Z)V

    invoke-virtual {v1, v3}, Lxbf;->i(Lcom/opera/api/Callback;)V

    :cond_41e
    iput-boolean v5, v0, Lipk;->l:Z

    :cond_420
    return-void

    :pswitch_421
    check-cast v0, Lkok;

    iput-boolean v4, v0, Lkok;->r:Z

    iget-boolean v1, v0, Lkok;->q:Z

    if-eqz v1, :cond_430

    iget-object v1, v0, Lkok;->a:Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v0, v0, Lkok;->m:Lkr8;

    invoke-virtual {v1, v0}, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->B0(Landroidx/recyclerview/widget/e;)V

    :cond_430
    return-void

    :pswitch_431
    check-cast v0, Lwmk;

    iget-object v7, v0, Lwmk;->e:Ljava/lang/String;

    if-eqz v7, :cond_455

    iget-object v1, v0, Lwmk;->d:Lck8;

    if-eqz v1, :cond_455

    iget-boolean v3, v1, Lck8;->e:Z

    if-eqz v3, :cond_455

    iget-object v6, v0, Lwmk;->b:Lslk;

    iget-wide v8, v1, Lck8;->c:J

    new-instance v10, Lzzh;

    invoke-direct {v10, v0, v2}, Lzzh;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lr62;

    iget-object v1, v6, Lslk;->h:Lode;

    new-instance v5, Lmmk;

    const/4 v11, 0x2

    invoke-direct/range {v5 .. v11}, Lmmk;-><init>(Ljava/lang/Object;Ljava/lang/String;JLcom/opera/api/Callback;B)V

    invoke-direct {v0, v1, v5, v4}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    :cond_455
    return-void

    :pswitch_456
    check-cast v0, Ltmk;

    invoke-virtual {v0}, Ltmk;->l()V

    return-void

    :pswitch_45c
    check-cast v0, Lhz;

    new-instance v1, Lfx1;

    const-string v2, "Timeout"

    invoke-direct {v1, v2}, Lfx1;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lhz;->a(Ln1;)V

    return-void

    :pswitch_469
    check-cast v0, Lslk;

    invoke-virtual {v0, v3}, Lslk;->b(Ljava/lang/Runnable;)V

    return-void

    nop

    :pswitch_data_470
    .packed-switch 0x0
        :pswitch_469
        :pswitch_45c
        :pswitch_456
        :pswitch_431
        :pswitch_421
        :pswitch_2c0
        :pswitch_2a3
        :pswitch_29d
        :pswitch_27c
        :pswitch_276
        :pswitch_271
        :pswitch_269
        :pswitch_263
        :pswitch_256
        :pswitch_240
        :pswitch_236
        :pswitch_212
        :pswitch_1e1
        :pswitch_1d9
        :pswitch_1c3
        :pswitch_1b7
        :pswitch_1af
        :pswitch_19d
        :pswitch_d3
        :pswitch_be
        :pswitch_2e
        :pswitch_27
        :pswitch_21
        :pswitch_19
    .end packed-switch
.end method
