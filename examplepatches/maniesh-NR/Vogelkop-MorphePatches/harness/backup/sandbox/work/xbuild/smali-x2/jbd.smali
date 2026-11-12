.class public final synthetic Ljbd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 13
    iput-byte p4, p0, Ljbd;->a:B

    iput-object p1, p0, Ljbd;->b:Ljava/lang/Object;

    iput-object p2, p0, Ljbd;->c:Ljava/lang/Object;

    iput-object p3, p0, Ljbd;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lode;Lkbd;Lode;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Ljbd;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljbd;->b:Ljava/lang/Object;

    iput-object p2, p0, Ljbd;->d:Ljava/lang/Object;

    iput-object p3, p0, Ljbd;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 16

    iget-byte v0, p0, Ljbd;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x3

    const/16 v3, 0x10

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    packed-switch v0, :pswitch_data_7fa

    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lxl;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Ld4m;

    new-instance v2, Lg4m;

    iget-object v3, v0, Lxl;->k:Ljava/lang/Object;

    check-cast v3, Lg4m;

    iget-object v3, v3, Lg4m;->a:Ljava/util/List;

    invoke-direct {v2, v3, v1}, Lg4m;-><init>(Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {v0, v2}, Lldk;->g(Ljava/lang/Object;)V

    new-instance v2, Lg4m;

    iget-object v3, v0, Lxl;->k:Ljava/lang/Object;

    check-cast v3, Lg4m;

    iget-object v3, v3, Lg4m;->a:Ljava/util/List;

    invoke-direct {v2, v3, v1}, Lg4m;-><init>(Ljava/util/List;Ljava/util/List;)V

    iput-object v2, v0, Lxl;->k:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Ld4m;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_37
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lc5o;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Ls14;

    invoke-virtual {v0, v1, p0}, Lc5o;->p(Ljava/lang/String;Ls14;)V

    return-void

    :pswitch_47
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lj4c;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Lorb;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbf9;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "newDataSent"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8f

    const-string v2, "connected"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_72

    const-string v0, "device_id"

    invoke-virtual {p0, v0, v4}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_8f

    :cond_72
    iget-object v1, v0, Lbf9;->j:Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_75
    new-instance p0, Ljava/util/ArrayList;

    iget-object v0, v0, Lbf9;->j:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v1
    :try_end_7d
    .catchall {:try_start_75 .. :try_end_7d} :catchall_92

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :catch_81
    :goto_81
    if-ge v6, v0, :cond_8f

    invoke-virtual {p0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v6, v6, 0x1

    check-cast v1, Lvwl;

    :try_start_8b
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_8e
    .catch Lorg/json/JSONException; {:try_start_8b .. :try_end_8e} :catch_81

    goto :goto_81

    :cond_8f
    :goto_8f
    return-void

    :goto_90
    :try_start_90
    monitor-exit v1
    :try_end_91
    .catchall {:try_start_90 .. :try_end_91} :catchall_92

    throw p0

    :catchall_92
    move-exception v0

    move-object p0, v0

    goto :goto_90

    :pswitch_95
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Ldnl;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Lyih;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Lyih;

    iget-object v0, v0, Ldnl;->d:Lorg/chromium/content/browser/input/ImeAdapterImpl;

    iget v4, v1, Lyih;->a:I

    iget v5, v1, Lyih;->b:I

    iget v6, p0, Lyih;->a:I

    iget v7, p0, Lyih;->b:I

    iget-object p0, v0, Lorg/chromium/content/browser/input/ImeAdapterImpl;->b:Lvzk;

    invoke-virtual {v0}, Lorg/chromium/content/browser/input/ImeAdapterImpl;->h()Landroid/view/ViewGroup;

    move-result-object v3

    invoke-virtual {p0}, Lvzk;->K()Landroid/view/inputmethod/InputMethodManager;

    move-result-object v2

    if-eqz v2, :cond_ba

    invoke-virtual/range {v2 .. v7}, Landroid/view/inputmethod/InputMethodManager;->updateSelection(Landroid/view/View;IIII)V

    :cond_ba
    return-void

    :pswitch_bb
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Loml;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    move-object v7, p0

    check-cast v7, Ljri;

    invoke-virtual {v0}, Loml;->isCancelled()Z

    move-result p0

    if-nez p0, :cond_f7

    iget-object p0, v0, Loml;->a:Ln5o;

    invoke-interface {p0, v1}, Ln5o;->g(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iget-object p0, v0, Loml;->c:Loml;

    if-eqz p0, :cond_ec

    invoke-virtual {p0}, Loml;->isCancelled()Z

    move-result p0

    if-nez p0, :cond_ec

    invoke-virtual {v0}, Loml;->isCancelled()Z

    move-result p0

    if-nez p0, :cond_ec

    iget-object v2, v0, Loml;->c:Loml;

    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v2 .. v7}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    goto :goto_f7

    :cond_ec
    if-eqz v7, :cond_f7

    invoke-virtual {v0}, Loml;->isCancelled()Z

    move-result p0

    if-nez p0, :cond_f7

    invoke-virtual {v7}, Ljri;->run()V

    :cond_f7
    :goto_f7
    return-void

    :pswitch_f8
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lu4l;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Llt;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    iget-object v2, v0, Lu4l;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_115
    :goto_115
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_12f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v1, v5}, Llt;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_115

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_115

    :cond_12f
    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_16f

    move-object v3, v1

    check-cast v3, Ljava/lang/Iterable;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_143
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_159

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lm4l;

    iget v4, v4, Lm4l;->a:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_143

    :cond_159
    iget-object v3, v0, Lu4l;->d:Lt4l;

    new-instance v4, Ls4l;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    iget v0, v0, Lu4l;->c:I

    invoke-direct {v4, v2, v0}, Ls4l;-><init>(Ljava/util/List;I)V

    invoke-virtual {v3, v4}, Lldk;->g(Ljava/lang/Object;)V

    :cond_16f
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_17b
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lxbf;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashSet;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {v0, p0, v1}, Lxbf;->e(Ljava/util/ArrayList;Ljava/util/HashSet;)V

    return-void

    :pswitch_18b
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lxbf;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1a3
    :goto_1a3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_204

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lilh;

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/Uri;

    const-string v3, "file"

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1cf

    new-instance v3, Ljava/io/File;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v2

    goto :goto_1fe

    :cond_1cf
    invoke-static {v0, v2}, Ldd7;->e(Landroid/content/Context;Landroid/net/Uri;)Lrlj;

    move-result-object v3

    invoke-virtual {v3}, Lrlj;->d()Z

    move-result v7

    if-eqz v7, :cond_1fd

    :try_start_1d9
    invoke-static {v0, v2}, Ldd7;->f(Landroid/content/Context;Landroid/net/Uri;)Lrlj;

    move-result-object v2

    invoke-virtual {v3}, Lrlj;->g()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lrlj;->l()[Ldd7;

    move-result-object v2

    array-length v7, v2

    move v8, v6

    :goto_1e7
    if-ge v8, v7, :cond_1f8

    aget-object v9, v2, v8

    invoke-virtual {v9}, Ldd7;->g()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10
    :try_end_1f3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1d9 .. :try_end_1f3} :catch_1fb

    if-nez v10, :cond_1f9

    add-int/lit8 v8, v8, 0x1

    goto :goto_1e7

    :cond_1f8
    move-object v9, v4

    :cond_1f9
    if-eqz v9, :cond_1fd

    :catch_1fb
    move v2, v5

    goto :goto_1fe

    :cond_1fd
    move v2, v6

    :goto_1fe
    if-eqz v2, :cond_1a3

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_1a3

    :cond_204
    return-void

    :pswitch_205
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lzwk;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Ldb;

    const-string v3, "enable_sync"

    invoke-virtual {v1, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_266

    invoke-virtual {p0}, Ldb;->f()Z

    move-result p0

    if-eqz p0, :cond_266

    invoke-static {}, Lzwk;->b()Lwyk;

    move-result-object p0

    iget-object v3, p0, Lwyk;->a:Ljava/util/Set;

    new-instance v5, Lne6;

    const-string v6, ""

    invoke-direct {v5, v2, v6}, Lne6;-><init>(ILjava/lang/String;)V

    invoke-interface {v3, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_266

    iget-object p0, p0, Lwyk;->b:Ljava/util/Set;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_23b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_24d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Lne6;

    iget v6, v6, Lne6;->a:I

    if-ne v6, v2, :cond_23b

    move-object v4, v5

    :cond_24d
    check-cast v4, Lne6;

    if-eqz v4, :cond_266

    invoke-static {v4}, Lcom/opera/android/settings/SettingsManager;->B(Lne6;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_266

    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, p0}, Lzwk;->k(Ljava/util/Set;)V

    :cond_266
    return-void

    :pswitch_267
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Leuk;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Lbuk;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, La32;

    iget-object v0, v0, Leuk;->f:Lduk;

    iget-object v2, v0, Lduk;->b:Lbuk;

    if-eqz v2, :cond_28b

    invoke-static {v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    iget-object v2, v0, Lduk;->b:Lbuk;

    invoke-virtual {v2}, Lbuk;->c()Z

    move-result v2

    if-eqz v2, :cond_28b

    iget-object v2, v0, Lduk;->d:La32;

    if-eqz v2, :cond_28b

    invoke-virtual {v2}, La32;->k()V

    :cond_28b
    iget-boolean v2, v0, Lduk;->g:Z

    if-eqz v2, :cond_29a

    iput-boolean v6, v0, Lduk;->g:Z

    invoke-virtual {v1}, Lbuk;->c()Z

    iget-object p0, v1, Lbuk;->k:Ll94;

    invoke-virtual {p0, v4}, Ll94;->b(Ljava/lang/Object;)Z

    goto :goto_2bd

    :cond_29a
    iput-object v1, v0, Lduk;->b:Lbuk;

    iput-object p0, v0, Lduk;->d:La32;

    iget-object p0, v1, Lbuk;->b:Landroid/util/Size;

    iput-object p0, v0, Lduk;->a:Landroid/util/Size;

    iput-boolean v6, v0, Lduk;->f:Z

    invoke-virtual {v0}, Lduk;->a()Z

    move-result v1

    if-nez v1, :cond_2bd

    iget-object v0, v0, Lduk;->h:Leuk;

    iget-object v0, v0, Leuk;->e:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result p0

    invoke-interface {v0, v1, p0}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    :cond_2bd
    :goto_2bd
    return-void

    :pswitch_2be
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lghf;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Lntk;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/Map$Entry;

    invoke-virtual {v0, v1, p0}, Lghf;->p(Lntk;Ljava/util/Map$Entry;)V

    return-void

    :pswitch_2ce
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lp8f;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Lvvf;

    iget-object v0, v0, Lp8f;->d:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    new-instance v2, Lfvh;

    invoke-direct {v2}, Lfvh;-><init>()V

    invoke-virtual {v2, v1}, Lfvh;->h(Ljava/lang/String;)V

    invoke-static {v2, v0}, Lj7c;->q(Lfvh;Lt9f;)Lokhttp3/internal/connection/RealCall;

    move-result-object v0

    :try_start_2f0
    invoke-interface {v0}, Lv84;->execute()Lpzh;

    move-result-object v1
    :try_end_2f4
    .catch Ljava/io/IOException; {:try_start_2f0 .. :try_end_2f4} :catch_31f

    :try_start_2f4
    iget-boolean v0, v1, Lpzh;->q:Z
    :try_end_2f6
    .catchall {:try_start_2f4 .. :try_end_2f6} :catchall_317

    if-eqz v0, :cond_309

    :try_start_2f8
    new-instance v0, Linj;

    iget-object v2, v1, Lpzh;->g:Lvzh;

    invoke-virtual {v2}, Lvzh;->byteStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v0, v2}, Linj;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {p0, v0}, Lvvf;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_306
    .catchall {:try_start_2f8 .. :try_end_306} :catchall_307

    goto :goto_328

    :catchall_307
    move-exception v0

    goto :goto_319

    :cond_309
    :try_start_309
    new-instance v0, Lgnj;

    iget v2, v1, Lpzh;->d:I

    invoke-direct {v0, v2}, Lgnj;-><init>(I)V

    invoke-virtual {p0, v0}, Lvvf;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_313
    .catchall {:try_start_309 .. :try_end_313} :catchall_317

    :try_start_313
    invoke-virtual {v1}, Lpzh;->close()V

    goto :goto_328

    :catchall_317
    move-exception v0

    move v5, v6

    :goto_319
    if-nez v5, :cond_31e

    invoke-virtual {v1}, Lpzh;->close()V

    :cond_31e
    throw v0
    :try_end_31f
    .catch Ljava/io/IOException; {:try_start_313 .. :try_end_31f} :catch_31f

    :catch_31f
    move-exception v0

    new-instance v1, Lhnj;

    invoke-direct {v1, v0}, Lhnj;-><init>(Ljava/io/IOException;)V

    invoke-virtual {p0, v1}, Lvvf;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_328
    return-void

    :pswitch_329
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lvnj;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashSet;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashSet;

    invoke-virtual {v0, v1, p0}, Lvnj;->n(Ljava/util/Set;Ljava/util/Set;)V

    return-void

    :pswitch_339
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lf1j;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Landroid/net/Uri;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0}, Lf1j;->a()Z

    move-result v2

    if-nez v2, :cond_354

    new-instance v2, Ljbd;

    invoke-direct {v2, v0, v1, p0, v3}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Lf1j;->h(Ljava/lang/Runnable;)V

    goto :goto_35f

    :cond_354
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lf1j;->g(Ljava/lang/String;Ljava/lang/String;)V

    :goto_35f
    return-void

    :pswitch_360
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lkoh;

    iget-object v0, p0, Ljbd;->c:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lbuk;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    move-object v9, p0

    check-cast v9, Lzpl;

    iget-object p0, v4, Lbuk;->h:Lo94;

    iget-object p0, p0, Lo94;->b:Ln94;

    invoke-virtual {p0}, Lx6;->isDone()Z

    move-result p0

    if-nez p0, :cond_50e

    iget-object p0, v3, Lkoh;->g:Lmoh;

    iget-object p0, p0, Lmoh;->w:Lcyd;

    iget v0, p0, Lcyd;->b:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    if-eqz v0, :cond_3a3

    if-eq v0, v5, :cond_39d

    if-eq v0, v1, :cond_3a3

    if-eq v0, v2, :cond_39d

    const/4 v2, 0x4

    if-eq v0, v2, :cond_3a3

    const-string v0, "State "

    iget p0, p0, Lcyd;->b:I

    invoke-static {p0}, Lz1m;->y(I)Ljava/lang/String;

    move-result-object p0

    const-string v1, " is not handled"

    invoke-static {p0, v1, v0}, Lqp2;->j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_51c

    :cond_39d
    iget-object p0, p0, Lcyd;->h:Ljava/lang/Object;

    check-cast p0, Lbuk;

    if-eq p0, v4, :cond_50e

    :cond_3a3
    new-instance p0, Lcyd;

    iget-object v0, v3, Lkoh;->g:Lmoh;

    iget-object v2, v0, Lmoh;->e:Lj9h;

    iget-object v7, v0, Lmoh;->d:Lb2j;

    iget-object v0, v0, Lmoh;->c:Ljava/util/concurrent/Executor;

    invoke-direct {p0, v2, v7, v0}, Lcyd;-><init>(Lj9h;Lb2j;Ljava/util/concurrent/Executor;)V

    iget-object v0, v3, Lkoh;->g:Lmoh;

    iget-object v0, v0, Lmoh;->r:Lm59;

    invoke-static {v0}, Lmoh;->l(Lm59;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzrd;

    iget-object v12, v4, Lbuk;->c:Lip7;

    iget-object v2, v3, Lkoh;->g:Lmoh;

    iget-object v2, v2, Lmoh;->l:Lgp2;

    invoke-static {v2, v12, v0}, Lk3n;->b(Lgp2;Lip7;Lzrd;)Li4n;

    move-result-object v2

    iget-object v10, v0, Lzrd;->a:Ls4n;

    iget-object v11, v4, Lbuk;->b:Landroid/util/Size;

    iget-object v13, v4, Lbuk;->d:Landroid/util/Range;

    move-object v14, v13

    move-object v13, v12

    iget-object v12, v2, Li4n;->b:Lhn2;

    if-eqz v12, :cond_3d8

    new-instance v7, Lt3n;

    iget-object v8, v2, Li4n;->a:Ljava/lang/String;

    invoke-direct/range {v7 .. v14}, Lt3n;-><init>(Ljava/lang/String;Lzpl;Ls4n;Landroid/util/Size;Lhn2;Lip7;Landroid/util/Range;)V

    goto :goto_3e1

    :cond_3d8
    new-instance v7, Ls3n;

    iget-object v8, v2, Li4n;->a:Ljava/lang/String;

    move-object v12, v13

    move-object v13, v14

    invoke-direct/range {v7 .. v13}, Ls3n;-><init>(Ljava/lang/String;Lzpl;Ls4n;Landroid/util/Size;Lip7;Landroid/util/Range;)V

    :goto_3e1
    invoke-interface {v7}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lep2;

    iget-object v2, v3, Lkoh;->g:Lmoh;

    iget-boolean v2, v2, Lmoh;->z:Z

    iget-object v7, v0, Lep2;->f:Lfp2;

    sget-object v8, Lfp2;->d:Lfp2;

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_450

    const-class v7, Landroidx/camera/video/internal/compat/quirk/MediaCodecDefaultDataSpaceQuirk;

    sget-object v8, Lb77;->a:Lygh;

    invoke-virtual {v8, v7}, Lygh;->b(Ljava/lang/Class;)Ltgh;

    move-result-object v7

    check-cast v7, Landroidx/camera/video/internal/compat/quirk/MediaCodecDefaultDataSpaceQuirk;

    if-eqz v2, :cond_450

    if-eqz v7, :cond_450

    sget-object v2, Lfp2;->f:Lfp2;

    new-instance v7, Ltah;

    invoke-direct {v7, v5}, Ltah;-><init>(B)V

    iget-object v8, v0, Lep2;->a:Ljava/lang/String;

    iput-object v8, v7, Ltah;->b:Ljava/lang/Object;

    iget v8, v0, Lep2;->b:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    iput-object v8, v7, Ltah;->c:Ljava/lang/Object;

    iget-object v8, v0, Lep2;->c:Lzpl;

    iput-object v8, v7, Ltah;->d:Ljava/lang/Object;

    iget-object v8, v0, Lep2;->d:Landroid/util/Size;

    iput-object v8, v7, Ltah;->e:Ljava/lang/Object;

    iget v8, v0, Lep2;->e:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    iput-object v8, v7, Ltah;->f:Ljava/lang/Object;

    iget-object v8, v0, Lep2;->f:Lfp2;

    iput-object v8, v7, Ltah;->g:Ljava/lang/Object;

    iget v8, v0, Lep2;->g:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    iput-object v8, v7, Ltah;->h:Ljava/lang/Object;

    iget v8, v0, Lep2;->h:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    iput-object v8, v7, Ltah;->i:Ljava/lang/Object;

    iget v8, v0, Lep2;->i:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    iput-object v8, v7, Ltah;->j:Ljava/lang/Object;

    iget v0, v0, Lep2;->j:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, v7, Ltah;->k:Ljava/lang/Object;

    iput-object v2, v7, Ltah;->g:Ljava/lang/Object;

    invoke-virtual {v7}, Ltah;->i()Lep2;

    move-result-object v0

    :cond_450
    move-object v2, v0

    iget v0, p0, Lcyd;->b:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    if-eqz v0, :cond_471

    new-instance v0, Ljava/lang/IllegalStateException;

    iget v1, p0, Lcyd;->b:I

    invoke-static {v1}, Lz1m;->y(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "configure() shouldn\'t be called in "

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    new-instance v1, Lq0b;

    invoke-direct {v1, v0, v5}, Lq0b;-><init>(Ljava/lang/Object;B)V

    goto/16 :goto_4fa

    :cond_471
    iput v1, p0, Lcyd;->b:I

    iput-object v4, p0, Lcyd;->h:Ljava/lang/Object;

    invoke-virtual {p0}, Lcyd;->toString()Ljava/lang/String;

    new-instance v0, Ll94;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lbyh;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, v0, Ll94;->c:Lbyh;

    new-instance v1, Lo94;

    invoke-direct {v1, v0}, Lo94;-><init>(Ll94;)V

    iput-object v1, v0, Ll94;->b:Lo94;

    const-class v7, Lvep;

    iput-object v7, v0, Ll94;->a:Ljava/lang/Object;

    :try_start_48f
    iput-object v0, p0, Lcyd;->j:Ljava/lang/Object;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "ReleasedFuture "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v0, Ll94;->a:Ljava/lang/Object;
    :try_end_4a1
    .catch Ljava/lang/Exception; {:try_start_48f .. :try_end_4a1} :catch_4a2

    goto :goto_4a6

    :catch_4a2
    move-exception v0

    invoke-virtual {v1, v0}, Lo94;->a(Ljava/lang/Throwable;)Z

    :goto_4a6
    iput-object v1, p0, Lcyd;->i:Ljava/lang/Object;

    new-instance v0, Ll94;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lbyh;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, v0, Ll94;->c:Lbyh;

    new-instance v1, Lo94;

    invoke-direct {v1, v0}, Lo94;-><init>(Ll94;)V

    iput-object v1, v0, Ll94;->b:Lo94;

    const-class v7, Lvep;

    iput-object v7, v0, Ll94;->a:Ljava/lang/Object;

    :try_start_4bf
    iput-object v0, p0, Lcyd;->l:Ljava/lang/Object;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "ReadyToReleaseFuture "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v0, Ll94;->a:Ljava/lang/Object;
    :try_end_4d1
    .catch Ljava/lang/Exception; {:try_start_4bf .. :try_end_4d1} :catch_4d2

    goto :goto_4d6

    :catch_4d2
    move-exception v0

    invoke-virtual {v1, v0}, Lo94;->a(Ljava/lang/Throwable;)Z

    :goto_4d6
    iput-object v1, p0, Lcyd;->k:Ljava/lang/Object;

    new-instance v0, Lvdi;

    const/16 v1, 0xc

    invoke-direct {v0, p0, v4, v2, v1}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lk1g;->z(Lm94;)Lo94;

    move-result-object v0

    new-instance v1, Lrii;

    const/16 v2, 0x11

    invoke-direct {v1, p0, v2}, Lrii;-><init>(Ljava/lang/Object;B)V

    iget-object v2, p0, Lcyd;->d:Ljava/lang/Object;

    check-cast v2, Lb2j;

    new-instance v4, Lwr9;

    invoke-direct {v4, v0, v1, v6}, Lwr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v4, v2}, Lo94;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    invoke-static {v0}, Lk1g;->O(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    :goto_4fa
    iget-object v0, v3, Lkoh;->g:Lmoh;

    iput-object p0, v0, Lmoh;->w:Lcyd;

    new-instance v2, Ln9h;

    invoke-direct {v2, v3, p0, v5}, Ln9h;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v0, Lmoh;->d:Lb2j;

    new-instance v0, Lwr9;

    invoke-direct {v0, v1, v2, v6}, Lwr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v1, v0, p0}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    goto :goto_51c

    :cond_50e
    iget-object p0, v4, Lbuk;->h:Lo94;

    iget-object p0, p0, Lo94;->b:Ln94;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, v3, Lkoh;->g:Lmoh;

    iget-object p0, p0, Lmoh;->w:Lcyd;

    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    :goto_51c
    return-void

    :pswitch_51d
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lglh;

    iget-object v2, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Ljava/io/File;

    iget-object v6, v0, Lglh;->h:Ljava/io/File;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_53b
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_540
    .catch Ljava/io/IOException; {:try_start_53b .. :try_end_540} :catch_552
    .catchall {:try_start_53b .. :try_end_540} :catchall_54c

    :try_start_540
    sget-object v7, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v8, 0x64

    invoke-virtual {p0, v7, v8, v6}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_547
    .catch Ljava/io/IOException; {:try_start_540 .. :try_end_547} :catch_553
    .catchall {:try_start_540 .. :try_end_547} :catchall_548

    goto :goto_553

    :catchall_548
    move-exception v0

    move-object p0, v0

    move-object v4, v6

    goto :goto_54e

    :catchall_54c
    move-exception v0

    move-object p0, v0

    :goto_54e
    invoke-static {v4}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_552
    move-object v6, v4

    :catch_553
    :goto_553
    invoke-static {v6}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    iget-object v5, v0, Lglh;->d:Lqie;

    iget-object v6, v0, Lglh;->c:Lumi;

    new-instance v7, Lz82;

    invoke-direct {v7, v1, v0, p0, v2}, Lz82;-><init>(BLjava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v6, v7}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p0

    new-instance v1, Lr9g;

    invoke-direct {v1, v0, v3}, Lr9g;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v6, v1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnml;->b(Lnml;)V

    new-instance v0, Loml;

    invoke-direct {v0, p0}, Loml;-><init>(Lnml;)V

    invoke-virtual {v5, v0, v4}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void

    :pswitch_57c
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lt1h;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Lo94;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Lz5o;

    :try_start_588
    iget-object v1, v1, Lo94;->b:Ln94;

    invoke-virtual {v1}, Lx6;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5
    :try_end_594
    .catch Ljava/lang/InterruptedException; {:try_start_588 .. :try_end_594} :catch_594
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_588 .. :try_end_594} :catch_594

    :catch_594
    iget-object v1, v0, Lt1h;->k:Ljava/lang/Object;

    monitor-enter v1

    :try_start_597
    iget-object v2, p0, Lz5o;->a:Lh5o;

    new-instance v3, Lw4o;

    iget-object v4, v2, Lh5o;->a:Ljava/lang/String;

    iget v2, v2, Lh5o;->t:I

    invoke-direct {v3, v4, v2}, Lw4o;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v4}, Lt1h;->c(Ljava/lang/String;)Lz5o;

    move-result-object v2

    if-ne v2, p0, :cond_5ab

    invoke-virtual {v0, v4}, Lt1h;->b(Ljava/lang/String;)Lz5o;

    :cond_5ab
    invoke-static {}, Lqs7;->x()Lqs7;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, v0, Lt1h;->j:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_5b8
    if-ge v6, v0, :cond_5c6

    invoke-virtual {p0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v6, v6, 0x1

    check-cast v2, Ldg8;

    invoke-interface {v2, v3, v5}, Ldg8;->a(Lw4o;Z)V

    goto :goto_5b8

    :cond_5c6
    monitor-exit v1

    return-void

    :goto_5c8
    monitor-exit v1
    :try_end_5c9
    .catchall {:try_start_597 .. :try_end_5c9} :catchall_5ca

    throw p0

    :catchall_5ca
    move-exception v0

    move-object p0, v0

    goto :goto_5c8

    :pswitch_5cd
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Li32;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Lc3g;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lp2g;

    invoke-direct {v2, v1, p0}, Lp2g;-><init>(Ljava/util/List;Lc3g;)V

    iput-object v2, v0, Li32;->l:Ljava/lang/Object;

    new-instance v2, Lp2g;

    invoke-direct {v2, v1, p0}, Lp2g;-><init>(Ljava/util/List;Lc3g;)V

    invoke-virtual {v0, v2}, Lldk;->g(Ljava/lang/Object;)V

    return-void

    :pswitch_5ec
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lcom/leanplum/ActionContext;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Ltcl;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Lorm;

    invoke-static {v0, v1, p0}, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$register$1$onResponse$1;->a(Lcom/leanplum/ActionContext;Ltcl;Lorm;)V

    return-void

    :pswitch_5fc
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Lt3g;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Ls3g;

    sget v2, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    new-instance v2, Lve9;

    invoke-direct {v2, v0, v1, p0, v5}, Lve9;-><init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;Lt3g;Ls3g;Z)V

    invoke-interface {v1, p0, v2}, Lt3g;->b(Ls3g;Lve9;)V

    return-void

    :pswitch_613
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Lypi;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Lzcf;

    sget-object v2, Lcbp;->b:Landroid/app/Application;

    new-instance v2, Lr2p;

    invoke-direct {v2}, Lejo;-><init>()V

    iget-object v4, v2, Lejo;->a:Ljava/lang/Object;

    check-cast v4, Lw9p;

    invoke-virtual {v4}, Lw9p;->C()V

    invoke-static {v0}, Lcbp;->b(Landroid/content/Context;)V

    sget-object v0, Lcbp;->c:Lt0i;

    if-eqz v0, :cond_64b

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    sget-object v1, Lcbp;->d:Ljava/util/ArrayList;

    if-nez v1, :cond_645

    new-instance v1, Lwr9;

    const/16 v2, 0x1a

    invoke-direct {v1, v0, p0, v2}, Lwr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1}, Lpfp;->a(Ljava/lang/Runnable;)V

    goto :goto_66c

    :cond_645
    const-string p0, "Check failed."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_66c

    :cond_64b
    sget-object v0, Lcbp;->d:Ljava/util/ArrayList;

    if-nez v0, :cond_656

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcbp;->d:Ljava/util/ArrayList;

    :cond_656
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p0

    if-gt p0, v5, :cond_66c

    new-instance p0, Ljava/lang/Thread;

    new-instance v4, Lh4m;

    invoke-direct {v4, v1, v0, v2, v3}, Lh4m;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p0, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    :cond_66c
    :goto_66c
    return-void

    :pswitch_66d
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lmdf;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Lp65;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Lpdf;

    sget-object v2, Lkl0;->g:Lkl0;

    sget-object v3, Lgl0;->d:Lgl0;

    invoke-virtual {v0, v2, v3}, Lmdf;->a(Lkl0;Lgl0;)V

    iget-object v0, v1, Lp65;->a:Ljh;

    iget-object v1, v0, Ljh;->c:Ljava/lang/Object;

    check-cast v1, Lwv1;

    iget-object v1, v1, Lwv1;->b:Lb6h;

    invoke-interface {v1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorm;

    sget-object v2, Lvb0;->c:Lvb0;

    iget-boolean v3, v0, Ljh;->a:Z

    check-cast v1, Lx5f;

    invoke-virtual {v1, v2, v3}, Lx5f;->E(Lvb0;Z)V

    iput-boolean v6, v0, Ljh;->b:Z

    iget-object p0, p0, Lpdf;->k:Lr65;

    sget-object v0, Lyim;->d:Lyim;

    iput-object v0, p0, Lr65;->t:Lyim;

    sget-wide v0, Lr65;->x:J

    iget-object v2, p0, Lr65;->h:Lru9;

    invoke-virtual {v2}, Lru9;->b()Lnv6;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    add-long/2addr v3, v0

    iget-object v0, v2, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "cmp_consent_may_show_after_timestamp"

    invoke-interface {v0, v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v2}, Lnv6;->w()V

    invoke-virtual {p0}, Lr65;->f()V

    return-void

    :pswitch_6bc
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lb7f;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/base/Callback;

    iget-object v2, v0, Lb7f;->b:Ljava/lang/Object;

    if-ne v2, v1, :cond_6db

    iget-object v0, v0, Lb7f;->a:Lh7f;

    if-eqz v0, :cond_6db

    iget-object v0, v0, Lh7f;->a:Ljava/util/ArrayList;

    if-eqz v0, :cond_6db

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6db

    invoke-interface {p0, v1}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V

    :cond_6db
    return-void

    :pswitch_6dc
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lvrd;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Landroid/util/Pair;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Exception;

    iget-object v0, v0, Lvrd;->b:Lvq8;

    iget-object v0, v0, Lvq8;->i:Ljava/lang/Object;

    check-cast v0, Lel6;

    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljrd;

    invoke-virtual {v0, v2, v1, p0}, Lel6;->d(ILjrd;Ljava/lang/Exception;)V

    return-void

    :pswitch_6fe
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lvrd;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Landroid/util/Pair;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Lix5;

    iget-object v0, v0, Lvrd;->b:Lvq8;

    iget-object v0, v0, Lvq8;->i:Ljava/lang/Object;

    check-cast v0, Lel6;

    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljrd;

    invoke-virtual {v0, v2, v1, p0}, Lel6;->j(ILjrd;Lix5;)V

    return-void

    :pswitch_720
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lnpd;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Lood;

    invoke-virtual {v0}, Lnpd;->i()Z

    move-result v1

    if-nez v1, :cond_733

    iget-object v0, v0, Lnpd;->t:Lxkg;

    invoke-static {v0, p0}, Lz5i;->n0(Lgig;Lood;)V

    :cond_733
    return-void

    :pswitch_734
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lipd;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Lnod;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Landroid/view/KeyEvent;

    iget-object v2, v0, Lipd;->b:Lnpd;

    invoke-virtual {v2, v1}, Lnpd;->h(Lnod;)Z

    move-result v3

    if-eqz v3, :cond_74c

    invoke-virtual {v2, p0, v6, v6}, Lnpd;->a(Landroid/view/KeyEvent;ZZ)Z

    goto :goto_75d

    :cond_74c
    iget-object p0, v2, Lnpd;->h:Laqd;

    iget-object v1, v1, Lnod;->a:Lbqd;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lopd;

    const/16 v3, 0x9

    invoke-direct {v2, p0, v3}, Lopd;-><init>(Laqd;B)V

    invoke-virtual {p0, v5, v2, v1, v5}, Laqd;->S(ILzpd;Lbqd;Z)V

    :goto_75d
    iput-object v4, v0, Lipd;->a:Ljbd;

    return-void

    :pswitch_760
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lqkd;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Lz0b;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, Ljrd;

    iget-object v0, v0, Lqkd;->c:Lel6;

    invoke-virtual {v1}, Lz0b;->g()Lcsh;

    move-result-object v1

    iget-object v2, v0, Lel6;->d:Ligi;

    iget-object v0, v0, Lel6;->g:Lqi8;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object v3

    iput-object v3, v2, Ligi;->c:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_792

    invoke-virtual {v1, v6}, Lcsh;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljrd;

    iput-object v1, v2, Ligi;->f:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p0, v2, Ligi;->g:Ljava/lang/Object;

    :cond_792
    iget-object p0, v2, Ligi;->e:Ljava/lang/Object;

    check-cast p0, Ljrd;

    if-nez p0, :cond_7aa

    iget-object p0, v2, Ligi;->c:Ljava/lang/Object;

    check-cast p0, Lh1b;

    iget-object v1, v2, Ligi;->f:Ljava/lang/Object;

    check-cast v1, Ljrd;

    iget-object v3, v2, Ligi;->b:Ljava/lang/Object;

    check-cast v3, Ldql;

    invoke-static {v0, p0, v1, v3}, Ligi;->H(Lqi8;Lh1b;Ljrd;Ldql;)Ljrd;

    move-result-object p0

    iput-object p0, v2, Ligi;->e:Ljava/lang/Object;

    :cond_7aa
    invoke-virtual {v0}, Lqi8;->getCurrentTimeline()Lgql;

    move-result-object p0

    invoke-virtual {v2, p0}, Ligi;->D0(Lgql;)V

    return-void

    :pswitch_7b2
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lwid;

    iget-object v1, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast v1, Lzid;

    iget-object p0, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast p0, [B

    iget-object v0, v0, Lwid;->a:Lorg/chromium/media/MediaDrmBridge;

    if-nez v1, :cond_7c8

    invoke-static {p0}, Lzid;->a([B)Ljava/lang/String;

    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    goto :goto_7e8

    :cond_7c8
    const-string p0, "SessionLost: %s"

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {p0, v2}, Lwxe;->t(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object p0, v0, Lorg/chromium/media/MediaDrmBridge;->a:Landroid/media/MediaDrm;

    if-eqz p0, :cond_7d8

    invoke-virtual {v0, v1}, Lorg/chromium/media/MediaDrmBridge;->a(Lzid;)V

    :cond_7d8
    iget-object p0, v0, Lorg/chromium/media/MediaDrmBridge;->j:Lx77;

    invoke-virtual {p0, v1}, Lx77;->l(Lzid;)V

    iget-object p0, v1, Lzid;->a:[B

    new-instance v1, Lvw;

    const/4 v2, 0x7

    invoke-direct {v1, p0, v6, v2}, Lvw;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {v0, v1}, Lorg/chromium/media/MediaDrmBridge;->m(Lvid;)V

    :goto_7e8
    return-void

    :pswitch_7e9
    iget-object v0, p0, Ljbd;->b:Ljava/lang/Object;

    check-cast v0, Lode;

    iget-object v1, p0, Ljbd;->d:Ljava/lang/Object;

    check-cast v1, Lkbd;

    iget-object p0, p0, Ljbd;->c:Ljava/lang/Object;

    check-cast p0, Lode;

    invoke-static {v0, v1, p0}, Lkbd;->u(Lode;Lkbd;Lode;)V

    return-void

    nop

    :pswitch_data_7fa
    .packed-switch 0x0
        :pswitch_7e9
        :pswitch_7b2
        :pswitch_760
        :pswitch_734
        :pswitch_720
        :pswitch_6fe
        :pswitch_6dc
        :pswitch_6bc
        :pswitch_66d
        :pswitch_613
        :pswitch_5fc
        :pswitch_5ec
        :pswitch_5cd
        :pswitch_57c
        :pswitch_51d
        :pswitch_360
        :pswitch_339
        :pswitch_329
        :pswitch_2ce
        :pswitch_2be
        :pswitch_267
        :pswitch_205
        :pswitch_18b
        :pswitch_17b
        :pswitch_f8
        :pswitch_bb
        :pswitch_95
        :pswitch_47
        :pswitch_37
    .end packed-switch
.end method
