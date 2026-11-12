.class public final Lilj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Le7l;


# instance fields
.field public final a:Lh7f;

.field public final b:Lvzk;

.field public final c:Ljke;

.field public final d:Z

.field public final e:I

.field public f:Lcom/opera/android/browser/TabInfo;

.field public g:Z

.field public h:Z

.field public i:Ljava/lang/String;

.field public j:I


# direct methods
.method public constructor <init>(Lvzk;ILcom/opera/android/browser/TabInfo;Liuh;Z)V
    .registers 7

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Lh7f;

    .line 49
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object v0, p0, Lilj;->a:Lh7f;

    const/high16 v0, -0x80000000

    .line 51
    iput v0, p0, Lilj;->j:I

    .line 52
    iput-object p1, p0, Lilj;->b:Lvzk;

    .line 53
    new-instance p1, Like;

    invoke-direct {p1, p4}, Like;-><init>(Liuh;)V

    iput-object p1, p0, Lilj;->c:Ljke;

    .line 54
    iput-boolean p5, p0, Lilj;->d:Z

    .line 55
    iput p2, p0, Lilj;->e:I

    .line 56
    iput-object p3, p0, Lilj;->f:Lcom/opera/android/browser/TabInfo;

    return-void
.end method

.method public constructor <init>(Lvzk;ILcom/opera/android/browser/TabInfo;ZLlsc;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lilj;->a:Lh7f;

    const/high16 v0, -0x80000000

    iput v0, p0, Lilj;->j:I

    iput-object p1, p0, Lilj;->b:Lvzk;

    new-instance p1, Like;

    const/4 v0, -0x1

    invoke-direct {p1, v0}, Like;-><init>(I)V

    iput-object p1, p0, Lilj;->c:Ljke;

    iput-boolean p4, p0, Lilj;->d:Z

    iput p2, p0, Lilj;->e:I

    iput-object p3, p0, Lilj;->f:Lcom/opera/android/browser/TabInfo;

    if-eqz p5, :cond_23

    invoke-virtual {p0, p5}, Lilj;->F(Llsc;)V

    :cond_23
    return-void
.end method

.method public constructor <init>(Lvzk;Ljke;ILcom/opera/android/browser/TabInfo;)V
    .registers 6

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Lh7f;

    .line 59
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object v0, p0, Lilj;->a:Lh7f;

    const/high16 v0, -0x80000000

    .line 61
    iput v0, p0, Lilj;->j:I

    .line 62
    iput-object p1, p0, Lilj;->b:Lvzk;

    .line 63
    iput-object p2, p0, Lilj;->c:Ljke;

    const/4 p1, 0x0

    .line 64
    iput-boolean p1, p0, Lilj;->d:Z

    .line 65
    iput p3, p0, Lilj;->e:I

    .line 66
    iput-object p4, p0, Lilj;->f:Lcom/opera/android/browser/TabInfo;

    return-void
.end method

.method public constructor <init>(Lvzk;Ljke;ZILcom/opera/android/browser/TabInfo;Llsc;)V
    .registers 8

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Lh7f;

    .line 38
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object v0, p0, Lilj;->a:Lh7f;

    const/high16 v0, -0x80000000

    .line 40
    iput v0, p0, Lilj;->j:I

    .line 41
    iput-object p1, p0, Lilj;->b:Lvzk;

    .line 42
    iput-object p2, p0, Lilj;->c:Ljke;

    .line 43
    iput-boolean p3, p0, Lilj;->d:Z

    .line 44
    iput p4, p0, Lilj;->e:I

    .line 45
    iput-object p5, p0, Lilj;->f:Lcom/opera/android/browser/TabInfo;

    if-eqz p6, :cond_1d

    .line 46
    invoke-virtual {p0, p6}, Lilj;->F(Llsc;)V

    :cond_1d
    return-void
.end method


# virtual methods
.method public final A()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final B()I
    .registers 1

    const/16 p0, 0x8

    return p0
.end method

.method public final C(ZZLcom/opera/api/Callback;)V
    .registers 4

    const/4 p0, 0x0

    invoke-interface {p3, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final D(Ljava/lang/Runnable;)Lhh4;
    .registers 2

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final E(IZLcom/opera/api/Callback;)V
    .registers 4

    const-string p0, ""

    invoke-interface {p3, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final F(Llsc;)V
    .registers 5

    iget-object v0, p0, Lilj;->c:Ljke;

    invoke-interface {v0}, Ljke;->u()V

    iget v1, p0, Lilj;->j:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Lilj;->j:I

    new-instance p0, Lhlj;

    invoke-direct {p0, v1, p1}, Lhlj;-><init>(ILlsc;)V

    invoke-interface {v0, p0, v2}, Ljke;->X(Lcom/opera/android/browser/NavigationEntry;Z)V

    return-void
.end method

.method public final G()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

.method public final I()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lilj;->i:Ljava/lang/String;

    return-object p0
.end method

.method public final J()Z
    .registers 1

    iget-boolean p0, p0, Lilj;->d:Z

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final K()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final M(Z)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final N()V
    .registers 1

    return-void
.end method

.method public final O()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final P()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final Q(Lcom/opera/api/Callback;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final R()Lzg;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final S()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final U()Lvz5;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final V()V
    .registers 1

    return-void
.end method

.method public final W(Z)V
    .registers 2

    iput-boolean p1, p0, Lilj;->g:Z

    if-eqz p1, :cond_8

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lilj;->h(I)V

    :cond_8
    return-void
.end method

.method public final X()V
    .registers 1

    return-void
.end method

.method public final Y()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final Z(Llsc;)V
    .registers 26

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    iget-object v2, v0, Lksc;->a:Ljava/lang/String;

    const/4 v3, 0x1

    iput-boolean v3, v1, Lilj;->h:Z

    iput-object v2, v1, Lilj;->i:Ljava/lang/String;

    iget-object v3, v1, Lilj;->a:Lh7f;

    invoke-static {v3, v3}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v4

    :goto_11
    invoke-virtual {v4}, Lg7f;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_21

    invoke-virtual {v4}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb7l;

    invoke-virtual {v5}, Lb7l;->b()V

    goto :goto_11

    :cond_21
    const/4 v4, 0x0

    const/4 v5, 0x0

    :try_start_23
    new-instance v7, Lorg/chromium/url/GURL;

    invoke-direct {v7, v2}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Lilj;->w(Lorg/chromium/url/GURL;)Lorg/chromium/content_public/browser/NavigationHandle;

    move-result-object v6

    invoke-virtual/range {p0 .. p1}, Lilj;->F(Llsc;)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lg7f;

    invoke-direct {v0, v3}, Lg7f;-><init>(Lh7f;)V

    :cond_37
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7b

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb7l;

    iget-object v8, v2, Lb7l;->a:Ld7l;

    iget-object v9, v8, Ld7l;->g:Lh7f;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v10, Lg7f;

    invoke-direct {v10, v9}, Lg7f;-><init>(Lh7f;)V

    :goto_4f
    invoke-virtual {v10}, Lg7f;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5f

    invoke-virtual {v10}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, La2l;

    invoke-interface {v9, v8}, La2l;->p(Lb2l;)V

    goto :goto_4f

    :cond_5f
    iget-object v2, v2, Lb7l;->a:Ld7l;

    iget-object v8, v2, Ld7l;->g:Lh7f;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v9, Lg7f;

    invoke-direct {v9, v8}, Lg7f;-><init>(Lh7f;)V

    :goto_6b
    invoke-virtual {v9}, Lg7f;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_37

    invoke-virtual {v9}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, La2l;

    invoke-interface {v8, v2}, La2l;->x(Lb2l;)V

    goto :goto_6b

    :cond_7b
    const-string v15, ""

    const-string v19, ""

    sget-object v22, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    const/16 v23, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-virtual/range {v6 .. v23}, Lorg/chromium/content_public/browser/NavigationHandle;->didFinish(Lorg/chromium/url/GURL;ZZZZZIILjava/lang/String;IZZLjava/lang/String;Lorg/chromium/content_public/browser/Page;ZLjava/util/Map;I)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lg7f;

    invoke-direct {v0, v3}, Lg7f;-><init>(Lh7f;)V

    :goto_9f
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_af

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb7l;

    invoke-virtual {v2, v6}, Lb7l;->a(Lorg/chromium/content_public/browser/NavigationHandle;)V
    :try_end_ae
    .catchall {:try_start_23 .. :try_end_ae} :catchall_cb

    goto :goto_9f

    :cond_af
    iput-boolean v5, v1, Lilj;->h:Z

    iput-object v4, v1, Lilj;->i:Ljava/lang/String;

    new-instance v0, Lg7f;

    invoke-direct {v0, v3}, Lg7f;-><init>(Lh7f;)V

    :goto_b8
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_c8

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb7l;

    invoke-virtual {v1}, Lb7l;->d()V

    goto :goto_b8

    :cond_c8
    return-void

    :goto_c9
    move-object v2, v0

    goto :goto_cd

    :catchall_cb
    move-exception v0

    goto :goto_c9

    :goto_cd
    :try_start_cd
    iput-boolean v5, v1, Lilj;->h:Z

    iput-object v4, v1, Lilj;->i:Ljava/lang/String;

    new-instance v0, Lg7f;

    invoke-direct {v0, v3}, Lg7f;-><init>(Lh7f;)V

    :goto_d6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_ea

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb7l;

    invoke-virtual {v1}, Lb7l;->d()V
    :try_end_e5
    .catchall {:try_start_cd .. :try_end_e5} :catchall_e6

    goto :goto_d6

    :catchall_e6
    move-exception v0

    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_ea
    throw v2
.end method

.method public final a()Lcom/opera/android/browser/TabInfo;
    .registers 1

    iget-object p0, p0, Lilj;->f:Lcom/opera/android/browser/TabInfo;

    return-object p0
.end method

.method public final a0()Lorg/chromium/ui/base/WindowAndroid;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final b()V
    .registers 1

    return-void
.end method

.method public final b0()Lqwi;
    .registers 1

    invoke-static {}, Lqwi;->a()Lqwi;

    move-result-object p0

    return-object p0
.end method

.method public final c()V
    .registers 1

    iget-object p0, p0, Lilj;->c:Ljke;

    invoke-interface {p0}, Ljke;->c()V

    return-void
.end method

.method public final c0()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final d()V
    .registers 1

    return-void
.end method

.method public final d0(Ljava/lang/String;ZLcom/opera/api/Callback;)V
    .registers 4

    const/4 p0, 0x0

    invoke-interface {p3, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final dispose()V
    .registers 1

    return-void
.end method

.method public final e()V
    .registers 2

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lilj;->h(I)V

    return-void
.end method

.method public final f()Z
    .registers 2

    iget-object p0, p0, Lilj;->c:Ljke;

    invoke-interface {p0}, Ljke;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_10

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result p0

    if-lez p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final g()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final getId()I
    .registers 1

    iget p0, p0, Lilj;->e:I

    return p0
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lilj;->c:Ljke;

    invoke-interface {p0}, Ljke;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_b

    sget-object p0, Lcom/opera/android/browser/SessionStore;->h:Li4j;

    goto :goto_13

    :cond_b
    invoke-interface {p0}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result v0

    invoke-interface {p0, v0}, Lcom/opera/android/browser/NavigationHistory;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object p0

    :goto_13
    invoke-interface {p0}, Lcom/opera/android/browser/NavigationEntry;->d()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final h(I)V
    .registers 26

    move-object/from16 v1, p0

    iget-object v0, v1, Lilj;->c:Ljke;

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result v2

    add-int v2, v2, p1

    invoke-interface {v0, v2}, Lcom/opera/android/browser/NavigationHistory;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object v2

    invoke-interface {v2}, Lcom/opera/android/browser/NavigationEntry;->getUrl()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    iput-boolean v3, v1, Lilj;->h:Z

    iput-object v2, v1, Lilj;->i:Ljava/lang/String;

    iget-object v3, v1, Lilj;->a:Lh7f;

    invoke-static {v3, v3}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v4

    :goto_1d
    invoke-virtual {v4}, Lg7f;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2d

    invoke-virtual {v4}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb7l;

    invoke-virtual {v5}, Lb7l;->b()V

    goto :goto_1d

    :cond_2d
    const/4 v4, 0x0

    const/4 v5, 0x0

    :try_start_2f
    new-instance v7, Lorg/chromium/url/GURL;

    invoke-direct {v7, v2}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Lilj;->w(Lorg/chromium/url/GURL;)Lorg/chromium/content_public/browser/NavigationHandle;

    move-result-object v6

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result v2

    add-int v2, v2, p1

    invoke-interface {v0, v2}, Ljke;->l(I)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lg7f;

    invoke-direct {v0, v3}, Lg7f;-><init>(Lh7f;)V

    :cond_49
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8d

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb7l;

    iget-object v8, v2, Lb7l;->a:Ld7l;

    iget-object v9, v8, Ld7l;->g:Lh7f;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v10, Lg7f;

    invoke-direct {v10, v9}, Lg7f;-><init>(Lh7f;)V

    :goto_61
    invoke-virtual {v10}, Lg7f;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_71

    invoke-virtual {v10}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, La2l;

    invoke-interface {v9, v8}, La2l;->p(Lb2l;)V

    goto :goto_61

    :cond_71
    iget-object v2, v2, Lb7l;->a:Ld7l;

    iget-object v8, v2, Ld7l;->g:Lh7f;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v9, Lg7f;

    invoke-direct {v9, v8}, Lg7f;-><init>(Lh7f;)V

    :goto_7d
    invoke-virtual {v9}, Lg7f;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_49

    invoke-virtual {v9}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, La2l;

    invoke-interface {v8, v2}, La2l;->x(Lb2l;)V

    goto :goto_7d

    :cond_8d
    const-string v15, ""

    const-string v19, ""

    sget-object v22, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    const/16 v23, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-virtual/range {v6 .. v23}, Lorg/chromium/content_public/browser/NavigationHandle;->didFinish(Lorg/chromium/url/GURL;ZZZZZIILjava/lang/String;IZZLjava/lang/String;Lorg/chromium/content_public/browser/Page;ZLjava/util/Map;I)V

    invoke-static {v3, v3}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_ad
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_bd

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb7l;

    invoke-virtual {v2, v6}, Lb7l;->a(Lorg/chromium/content_public/browser/NavigationHandle;)V
    :try_end_bc
    .catchall {:try_start_2f .. :try_end_bc} :catchall_d9

    goto :goto_ad

    :cond_bd
    iput-boolean v5, v1, Lilj;->h:Z

    iput-object v4, v1, Lilj;->i:Ljava/lang/String;

    new-instance v0, Lg7f;

    invoke-direct {v0, v3}, Lg7f;-><init>(Lh7f;)V

    :goto_c6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d6

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb7l;

    invoke-virtual {v1}, Lb7l;->d()V

    goto :goto_c6

    :cond_d6
    return-void

    :goto_d7
    move-object v2, v0

    goto :goto_db

    :catchall_d9
    move-exception v0

    goto :goto_d7

    :goto_db
    :try_start_db
    iput-boolean v5, v1, Lilj;->h:Z

    iput-object v4, v1, Lilj;->i:Ljava/lang/String;

    new-instance v0, Lg7f;

    invoke-direct {v0, v3}, Lg7f;-><init>(Lh7f;)V

    :goto_e4
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_f8

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb7l;

    invoke-virtual {v1}, Lb7l;->d()V
    :try_end_f3
    .catchall {:try_start_db .. :try_end_f3} :catchall_f4

    goto :goto_e4

    :catchall_f4
    move-exception v0

    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_f8
    throw v2
.end method

.method public final i()Lcom/opera/android/browser/NavigationHistory;
    .registers 5

    new-instance v0, Like;

    iget-object p0, p0, Lilj;->c:Ljke;

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result v1

    invoke-direct {v0, v1}, Like;-><init>(I)V

    const/4 v1, 0x0

    move v2, v1

    :goto_d
    invoke-interface {p0}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result v3

    if-ge v2, v3, :cond_1d

    invoke-interface {p0, v2}, Lcom/opera/android/browser/NavigationHistory;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object v3

    invoke-virtual {v0, v3, v1}, Like;->X(Lcom/opera/android/browser/NavigationEntry;Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    :cond_1d
    return-object v0
.end method

.method public final isActive()Z
    .registers 1

    iget-boolean p0, p0, Lilj;->g:Z

    return p0
.end method

.method public final isAudioMuted()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final isLoading()Z
    .registers 1

    iget-boolean p0, p0, Lilj;->h:Z

    return p0
.end method

.method public final j(II)Z
    .registers 3

    const/4 p0, 0x0

    return p0
.end method

.method public final k(Z)V
    .registers 2

    return-void
.end method

.method public final l()V
    .registers 2

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lilj;->h(I)V

    return-void
.end method

.method public final m()Z
    .registers 1

    iget-boolean p0, p0, Lilj;->d:Z

    return p0
.end method

.method public final n()Z
    .registers 3

    iget-object p0, p0, Lilj;->c:Ljke;

    invoke-interface {p0}, Ljke;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_15

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result p0

    if-ge v0, p0, :cond_15

    return v1

    :cond_15
    const/4 p0, 0x0

    return p0
.end method

.method public final o()V
    .registers 1

    return-void
.end method

.method public final p()V
    .registers 1

    return-void
.end method

.method public final q()V
    .registers 1

    return-void
.end method

.method public final r()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final s(Lcom/opera/android/browser/TabInfo;)Z
    .registers 5

    iget-object v0, p0, Lilj;->f:Lcom/opera/android/browser/TabInfo;

    invoke-virtual {v0, p1}, Lcom/opera/android/browser/TabInfo;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    iget-object v0, p0, Lilj;->f:Lcom/opera/android/browser/TabInfo;

    iput-object p1, p0, Lilj;->f:Lcom/opera/android/browser/TabInfo;

    iget-object p0, p0, Lilj;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_14
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_38

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb7l;

    iget-object p1, p1, Lb7l;->a:Ld7l;

    iget-object v1, p1, Ld7l;->g:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_28
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La2l;

    invoke-interface {v2, p1, v0}, La2l;->T(Lb2l;Lcom/opera/android/browser/TabInfo;)V

    goto :goto_28

    :cond_38
    const/4 p0, 0x1

    return p0
.end method

.method public final setAudioMuted(Z)V
    .registers 2

    return-void
.end method

.method public final show()V
    .registers 1

    return-void
.end method

.method public final t()Lesk;
    .registers 3

    iget-object v0, p0, Lilj;->c:Ljke;

    invoke-interface {v0}, Ljke;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_b

    sget-object v0, Lcom/opera/android/browser/SessionStore;->h:Li4j;

    goto :goto_13

    :cond_b
    invoke-interface {v0}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/opera/android/browser/NavigationHistory;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object v0

    :goto_13
    invoke-interface {v0}, Lcom/opera/android/browser/NavigationEntry;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_24

    new-instance p0, Lsy3;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lsy3;-><init>(Ljava/lang/String;B)V

    return-object p0

    :cond_24
    invoke-virtual {p0}, Lilj;->getUrl()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lsy3;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lsy3;-><init>(Ljava/lang/String;B)V

    return-object v0
.end method

.method public final u()V
    .registers 1

    return-void
.end method

.method public final v()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final w(Lorg/chromium/url/GURL;)Lorg/chromium/content_public/browser/NavigationHandle;
    .registers 22

    new-instance v0, Lorg/chromium/content_public/browser/NavigationHandle;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-wide/16 v1, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v3, p1

    invoke-direct/range {v0 .. v9}, Lorg/chromium/content_public/browser/NavigationHandle;-><init>(JLorg/chromium/url/GURL;ZZZZZZ)V

    sget-object v1, Lzs9;->a:Lorg/chromium/url/GURL;

    const-wide/16 v17, 0x0

    const/16 v19, 0x0

    const/4 v2, 0x1

    const/4 v4, 0x1

    const/4 v6, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-wide/16 v12, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const-string v16, ""

    move-object v3, v1

    invoke-virtual/range {v0 .. v19}, Lorg/chromium/content_public/browser/NavigationHandle;->didStart(Lorg/chromium/url/GURL;ILorg/chromium/url/GURL;ZZLorg/chromium/url/Origin;IZZZZJZZLjava/lang/String;JLorg/chromium/content_public/browser/WebContents;)V

    move-object v1, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lilj;->a:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_2d
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3d

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb7l;

    invoke-virtual {v2, v1}, Lb7l;->c(Lorg/chromium/content_public/browser/NavigationHandle;)V

    goto :goto_2d

    :cond_3d
    return-object v1
.end method

.method public final x(Landroid/net/Uri;Lcom/opera/api/Callback;)Z
    .registers 3

    const/4 p0, 0x0

    return p0
.end method

.method public final y()Lt59;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final z()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
