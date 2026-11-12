.class public final Luqe;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lg77;

.field public final b:Ltm5;

.field public final c:Landroid/content/Context;

.field public final d:Lumi;

.field public final e:Lqag;

.field public final f:Lx5f;

.field public final g:Ls9i;

.field public final h:Luy8;

.field public final i:Lg93;

.field public final j:Lstm;

.field public final k:Lqsh;

.field public final l:Lip4;

.field public final m:Lc15;

.field public final n:Lore;

.field private o:Lq8j;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lq8j;"
        }
    .end annotation
.end field

.field public final p:Lwu5;

.field public final q:Ljava/util/HashMap;

.field public final r:Ljava/util/Set;

.field public final s:Lru8;

.field public final t:Lbch;

.field public final u:Landroid/util/LruCache;

.field public final v:Lta7;

.field public final w:Lyhe;

.field public final x:Ly0a;

.field public final y:Lob;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Ltm5;Lp1c;Lvx;Ljtg;Lesk;Ly0a;Loue;Lx5f;Lx5f;)V
    .registers 26

    move-object v1, p1

    move-object/from16 v0, p2

    move-object/from16 v11, p8

    move-object/from16 v12, p10

    new-instance v2, Llre;

    invoke-direct {v2, v12}, Llre;-><init>(Lx5f;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v3, Lqag;

    const-string v4, "NewsFeedCookies"

    invoke-direct {v3, v0, p1, v4}, Lqag;-><init>(Lumi;Landroid/content/Context;Ljava/lang/String;)V

    iput-object v3, p0, Luqe;->e:Lqag;

    new-instance v4, Ljava/net/CookieManager;

    const/4 v13, 0x0

    invoke-direct {v4, v3, v13}, Ljava/net/CookieManager;-><init>(Ljava/net/CookieStore;Ljava/net/CookiePolicy;)V

    invoke-static {v2, v4}, Luqe;->d(Ltff;Ljava/net/CookieManager;)Lg77;

    move-result-object v2

    iput-object v2, p0, Luqe;->a:Lg77;

    move-object/from16 v2, p3

    iput-object v2, p0, Luqe;->b:Ltm5;

    iput-object v1, p0, Luqe;->c:Landroid/content/Context;

    iput-object v0, p0, Luqe;->d:Lumi;

    new-instance v2, Landroid/util/LruCache;

    const/16 v3, 0x32

    invoke-direct {v2, v3}, Landroid/util/LruCache;-><init>(I)V

    iput-object v2, p0, Luqe;->u:Landroid/util/LruCache;

    new-instance v2, Lyhe;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lyhe;-><init>(Ljava/lang/Object;B)V

    iput-object v2, p0, Luqe;->w:Lyhe;

    new-instance v2, Lob;

    const/16 v3, 0xb

    invoke-direct {v2, p0, v3}, Lob;-><init>(Ljava/lang/Object;B)V

    iput-object v2, p0, Luqe;->y:Lob;

    invoke-static {p1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    iput-object v12, p0, Luqe;->f:Lx5f;

    new-instance v4, Ls9i;

    iget-object v2, p0, Luqe;->a:Lg77;

    invoke-direct {v4, p1, v2}, Ls9i;-><init>(Landroid/content/Context;Lg77;)V

    iput-object v4, p0, Luqe;->g:Ls9i;

    new-instance v3, Lta7;

    invoke-direct {v3, p1, v0}, Lta7;-><init>(Landroid/content/Context;Lumi;)V

    iput-object v3, p0, Luqe;->v:Lta7;

    iget-object v0, p0, Luqe;->a:Lg77;

    iget-object v0, v0, Lg77;->b:Ljava/lang/Object;

    check-cast v0, Ltff;

    check-cast v0, Llre;

    iput-object v3, v0, Llre;->b:Lta7;

    new-instance v5, Lg93;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v2

    move-object v0, v5

    move-object v5, v4

    iget-object v4, p0, Luqe;->b:Ltm5;

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p9

    invoke-direct/range {v0 .. v10}, Lg93;-><init>(Landroid/content/Context;Lfue;Lta7;Ltm5;Ls9i;Lp1c;Lvx;Ljtg;Lesk;Loue;)V

    iput-object v0, p0, Luqe;->i:Lg93;

    move-object v4, v5

    move-object v5, v0

    new-instance v0, Lstm;

    move-object v2, v3

    iget-object v3, p0, Luqe;->b:Ltm5;

    move-object/from16 v7, p11

    move-object v6, v12

    invoke-direct/range {v0 .. v7}, Lstm;-><init>(Landroid/content/Context;Lta7;Ltm5;Ls9i;Lg93;Lx5f;Lx5f;)V

    move-object v3, v2

    move-object v5, v4

    iput-object v0, p0, Luqe;->j:Lstm;

    new-instance v1, Luy8;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    new-instance v4, Ly0f;

    invoke-direct {v4, v6}, Ly0f;-><init>(Lx5f;)V

    move-object/from16 p3, p1

    move-object/from16 p4, v0

    move-object/from16 p2, v1

    move-object/from16 p6, v2

    move-object/from16 p7, v4

    move-object/from16 p5, v5

    invoke-direct/range {p2 .. p7}, Luy8;-><init>(Landroid/content/Context;Lstm;Ls9i;Lcom/opera/android/settings/SettingsManager;Ly0f;)V

    iput-object v1, p0, Luqe;->h:Luy8;

    iput-object v1, v5, Ls9i;->e:Ljava/lang/Object;

    new-instance v1, Lip4;

    iget-object v2, p0, Luqe;->b:Ltm5;

    move-object/from16 p7, v0

    move-object/from16 p2, v1

    move-object/from16 p5, v2

    move-object/from16 p4, v3

    move-object/from16 p6, v5

    invoke-direct/range {p2 .. p7}, Lip4;-><init>(Landroid/content/Context;Lta7;Ltm5;Ls9i;Lstm;)V

    iput-object v1, p0, Luqe;->l:Lip4;

    new-instance v2, Lc15;

    iget-object v4, p0, Luqe;->b:Ltm5;

    invoke-direct {v2, v3, v4, v5, v1}, Lc15;-><init>(Lta7;Ltm5;Ls9i;Lip4;)V

    iput-object v2, p0, Luqe;->m:Lc15;

    new-instance v1, Lore;

    iget-object v4, p0, Luqe;->b:Ltm5;

    invoke-direct {v1, v4, v2}, Lore;-><init>(Ltm5;Lc15;)V

    iput-object v1, p0, Luqe;->n:Lore;

    new-instance v1, Lru8;

    iget-object v2, p0, Luqe;->b:Ltm5;

    invoke-direct {v1, v3, v2, v5, v0}, Lru8;-><init>(Lta7;Ltm5;Ls9i;Lstm;)V

    iput-object v1, p0, Luqe;->s:Lru8;

    new-instance v1, Lwu5;

    invoke-direct {v1}, Lwu5;-><init>()V

    iput-object v1, p0, Luqe;->p:Lwu5;

    new-instance v1, Lqsh;

    invoke-direct {v1, v0, v5}, Lqsh;-><init>(Lstm;Ls9i;)V

    iput-object v1, p0, Luqe;->k:Lqsh;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Luqe;->q:Ljava/util/HashMap;

    new-instance v1, Ljava/util/WeakHashMap;

    invoke-direct {v1}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Luqe;->r:Ljava/util/Set;

    new-instance v1, Lbch;

    new-instance v2, Lpre;

    invoke-direct {v2}, Lpre;-><init>()V

    invoke-direct {v1, v0, v5, v2}, Lbch;-><init>(Lstm;Ls9i;Lpre;)V

    iput-object v1, p0, Luqe;->t:Lbch;

    iput-object v11, p0, Luqe;->x:Ly0a;

    invoke-virtual {v3}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "user_id"

    invoke-interface {v0, v1, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Ly0a;->run(Ljava/lang/Object;)V

    new-instance v0, Lsqe;

    invoke-direct {v0, p0}, Lsqe;-><init>(Luqe;)V

    invoke-static {v0}, Lac8;->c(Ljava/lang/Object;)V

    return-void
.end method

.method public static bridge synthetic a(Luqe;)Lq8j;
    .registers 1

    iget-object p0, p0, Luqe;->o:Lq8j;

    return-object p0
.end method

.method public static bridge synthetic b(Luqe;)V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Luqe;->o:Lq8j;

    return-void
.end method

.method public static d(Ltff;Ljava/net/CookieManager;)Lg77;
    .registers 6

    sget-object v0, Lxne;->b:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    invoke-virtual {v0}, Lt9f;->b()Ls9f;

    move-result-object v0

    const-wide/16 v1, 0xf

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Ls9f;->a(JLjava/util/concurrent/TimeUnit;)V

    invoke-virtual {v0, v1, v2, v3}, Ls9f;->b(JLjava/util/concurrent/TimeUnit;)V

    if-eqz p1, :cond_1f

    new-instance v1, Leq6;

    invoke-direct {v1, p1}, Leq6;-><init>(Ljava/net/CookieManager;)V

    iput-object v1, v0, Ls9f;->k:Liv5;

    :cond_1f
    new-instance p1, Lg77;

    new-instance v1, Lt9f;

    invoke-direct {v1, v0}, Lt9f;-><init>(Ls9f;)V

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p1, Lg77;->c:Ljava/lang/Object;

    iput-object v1, p1, Lg77;->a:Ljava/lang/Object;

    iput-object p0, p1, Lg77;->b:Ljava/lang/Object;

    return-object p1
.end method


# virtual methods
.method public final c(Lnre;Ljava/lang/String;)V
    .registers 7

    iget-object v0, p1, Lnre;->d:Ljava/util/List;

    iget-object p1, p1, Lnre;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lyqe;

    iget-object v3, v2, Lyqe;->a:Ljava/lang/String;

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-interface {p1, v2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2f

    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p2, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Luqe;->l:Lip4;

    invoke-virtual {p0, v0, p2}, Lip4;->g(Ljava/util/List;Ljava/util/Set;)V

    :cond_2f
    return-void
.end method

.method public final e(Ljava/lang/String;Z)Lmsh;
    .registers 9

    iget-object v0, p0, Luqe;->r:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmsh;

    iget-object v2, v1, Lmsh;->v:Lp12;

    iget-object v2, v2, Lp12;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    return-object v1

    :cond_1f
    iget-object v0, p0, Luqe;->q:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_29
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_95

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lxqe;

    iget-object v3, v1, Lxqe;->g:Ljava/util/List;

    if-eqz v3, :cond_84

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_92

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Loqe;

    instance-of v4, v3, Lmsh;

    if-eqz v4, :cond_5e

    check-cast v3, Lmsh;

    iget-object v4, v3, Lmsh;->v:Lp12;

    iget-object v4, v4, Lp12;->b:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3e

    move-object v2, v3

    goto :goto_92

    :cond_5e
    instance-of v4, v3, Lere;

    if-eqz v4, :cond_3e

    check-cast v3, Lere;

    iget-object v3, v3, Lere;->f:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_6a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lmsh;

    iget-object v5, v4, Lmsh;->v:Lp12;

    iget-object v5, v5, Lp12;->b:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6a

    move-object v2, v4

    goto :goto_92

    :cond_84
    iget-object v2, v1, Lxqe;->d:Landroid/content/Context;

    iget-object v3, v1, Lxqe;->e:Lqre;

    iget-object v1, v1, Lxqe;->a:Li32;

    iget-object v1, v1, Li32;->k:Ljava/lang/Object;

    check-cast v1, Lkqd;

    invoke-static {v2, p1, v3, v1}, Lxqe;->c(Landroid/content/Context;Ljava/lang/String;Lqre;Lwqe;)Lmsh;

    move-result-object v2

    :cond_92
    :goto_92
    if-eqz v2, :cond_29

    return-object v2

    :cond_95
    if-eqz p2, :cond_a2

    iget-object p0, p0, Luqe;->u:Landroid/util/LruCache;

    invoke-virtual {p0, p1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmsh;

    if-eqz p0, :cond_a2

    return-object p0

    :cond_a2
    return-object v2
.end method

.method public final f(Lqre;)Lxqe;
    .registers 7

    iget-object v0, p0, Luqe;->q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lxqe;

    if-nez v1, :cond_31

    new-instance v1, Lxqe;

    iget-object v2, p0, Luqe;->v:Lta7;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lkqd;

    const/16 v4, 0x8

    invoke-direct {v3, v2, v4}, Lkqd;-><init>(Ljava/lang/Object;B)V

    iget-object v2, p0, Luqe;->c:Landroid/content/Context;

    iget-object v4, p0, Luqe;->d:Lumi;

    invoke-direct {v1, v2, v4, p1, v3}, Lxqe;-><init>(Landroid/content/Context;Lumi;Lqre;Lkqd;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Luqe;->h:Luy8;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p0, v1, Lxqe;->c:Luy8;

    new-instance p1, Lvr9;

    invoke-direct {p1, p0, v1}, Lvr9;-><init>(Luy8;Lxqe;)V

    invoke-virtual {v1, p1}, Lxqe;->n(Ljava/lang/Runnable;)V

    :cond_31
    return-object v1
.end method

.method public final g(Lq8j;)V
    .registers 2

    iget-object p0, p0, Luqe;->n:Lore;

    invoke-virtual {p0, p1}, Lt7j;->b(Lq8j;)V

    return-void
.end method

.method public final h()Lc6j;
    .registers 3

    new-instance v0, Lc6j;

    iget-object p0, p0, Luqe;->n:Lore;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lc6j;-><init>(Lt7j;Z)V

    return-object v0
.end method

.method public final i(Lmsh;Z)Lg82;
    .registers 19

    move-object/from16 v0, p1

    invoke-virtual/range {p0 .. p0}, Luqe;->h()Lc6j;

    move-result-object v1

    iget-object v1, v1, Lc6j;->b:Ljava/lang/Object;

    check-cast v1, Lnre;

    iget-object v2, v0, Lmsh;->k:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Lmsh;->f:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v4, v0, Lmsh;->e:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Llsh;

    iget-object v4, v4, Llsh;->a:Ljava/lang/String;

    iget-object v5, v0, Lmsh;->u:Ljava/util/List;

    const/4 v6, 0x0

    if-eqz v1, :cond_2c

    iget-object v1, v1, Lnre;->a:Ljava/lang/String;

    goto :goto_2d

    :cond_2c
    move-object v1, v6

    :goto_2d
    invoke-static {v2, v3, v4, v5, v1}, Ll45;->r(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v11

    iget v1, v0, Lmsh;->j:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_50

    move-object/from16 v2, p0

    iget-object v2, v2, Luqe;->c:Landroid/content/Context;

    invoke-static {v2}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v2

    invoke-virtual {v2}, Lno7;->i()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwnh;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lwnh;->a(I)Z

    move-result v2

    if-eqz v2, :cond_50

    const/4 v1, 0x1

    :cond_50
    move v8, v1

    iget-object v1, v0, Lmsh;->z:Lxlg;

    if-eqz v1, :cond_59

    iget-object v1, v1, Lxlg;->i:Ljava/lang/String;

    move-object v14, v1

    goto :goto_5a

    :cond_59
    move-object v14, v6

    :goto_5a
    new-instance v7, Lg82;

    iget-object v1, v0, Lmsh;->v:Lp12;

    iget-object v1, v1, Lp12;->b:Ljava/lang/Object;

    move-object v9, v1

    check-cast v9, Ljava/lang/String;

    iget-object v10, v0, Loqe;->b:Ljava/lang/String;

    iget-object v1, v0, Lmsh;->l:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v12

    iget-object v0, v0, Lmsh;->n:Landroid/net/Uri;

    if-eqz v0, :cond_73

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    :cond_73
    move/from16 v15, p2

    move-object v13, v6

    invoke-direct/range {v7 .. v15}, Lg82;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-object v7
.end method

.method public final j(Lmsh;Ljava/util/List;ZZ)V
    .registers 6

    invoke-virtual {p0, p1, p2, p4}, Luqe;->k(Lmsh;Ljava/util/List;Z)V

    iget-object p0, p0, Luqe;->h:Luy8;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p3, :cond_d

    const/16 p3, 0xb

    goto :goto_f

    :cond_d
    const/16 p3, 0xa

    :goto_f
    iget-object p4, p0, Luy8;->A:Ljava/util/Set;

    iget-object v0, p1, Lmsh;->v:Lp12;

    iget-object v0, v0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-interface {p4, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_3d

    instance-of p4, p1, Lure;

    invoke-static {p3}, Lo18;->g(I)Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x0

    if-eqz p4, :cond_2f

    new-instance p4, Lfy8;

    invoke-direct {p4, p1, p2, p3, v0}, Lfy8;-><init>(Lmsh;Ljava/util/List;Ljava/lang/String;B)V

    invoke-virtual {p0, p4}, Luy8;->e(Lzx8;)V

    goto :goto_37

    :cond_2f
    new-instance p4, Lfy8;

    invoke-direct {p4, p1, p2, p3, v0}, Lfy8;-><init>(Lmsh;Ljava/util/List;Ljava/lang/String;B)V

    invoke-virtual {p0, p4}, Luy8;->c(Ldy8;)V

    :goto_37
    iget-object p0, p0, Luy8;->o:Lqy8;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lqy8;->c(Z)V

    :cond_3d
    return-void
.end method

.method public final k(Lmsh;Ljava/util/List;Z)V
    .registers 12

    iget-object v0, p1, Lmsh;->e:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llsh;

    sget-object v1, Llsh;->i:Llsh;

    if-eq v0, v1, :cond_14f

    invoke-virtual {p1, v1}, Lmsh;->c(Llsh;)V

    const-string v0, ""

    if-eqz p2, :cond_34

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_17
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_34

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltx8;

    const-string v2, "domain"

    iget-object v3, v1, Ltx8;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17

    iget-object p2, v1, Ltx8;->b:Ljava/lang/String;

    sget-object v1, Laik;->a:[Ljava/lang/String;

    if-eqz p2, :cond_34

    move-object v0, p2

    :cond_34
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_bb

    const/4 p2, 0x0

    if-eqz p3, :cond_3e

    move-object p1, p2

    :cond_3e
    new-instance p3, Lww6;

    const/4 v1, 0x1

    invoke-direct {p3, p1, v0, v1}, Lww6;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v2, p0, Luqe;->r:Ljava/util/Set;

    invoke-static {v2, p3}, Lsfe;->A0(Ljava/lang/Iterable;Lsrg;)Z

    iget-object p3, p0, Luqe;->q:Ljava/util/HashMap;

    invoke-virtual {p3}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_53
    :goto_53
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8d

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lxqe;

    iget-object v3, v2, Lxqe;->g:Ljava/util/List;

    if-nez v3, :cond_68

    iget-object v3, v2, Lxqe;->a:Li32;

    invoke-virtual {v3}, Lldk;->i()V

    :cond_68
    iget-object v3, v2, Lxqe;->g:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0, v4, v3}, Lxqe;->d(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/List;)V

    if-eqz p1, :cond_7a

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_7a
    invoke-interface {v3, v4}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    move-result v5

    if-eqz v5, :cond_53

    invoke-virtual {v2, v3}, Lxqe;->o(Ljava/util/List;)V

    invoke-virtual {v2, v4}, Lxqe;->l(Ljava/util/List;)V

    invoke-interface {v3}, Ljava/util/List;->size()I

    invoke-virtual {v2, v1}, Lxqe;->k(Z)V

    goto :goto_53

    :cond_8d
    iget-object p0, p0, Luqe;->v:Lta7;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Ljava/util/HashSet;

    invoke-virtual {p0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object p3

    const-string v1, "blacklisted_news_domains"

    invoke-static {p3, v1, p2}, Lw1h;->o(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object p2

    if-nez p2, :cond_a2

    sget-object p2, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    :cond_a2
    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_14f

    invoke-virtual {p0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    :cond_bb
    if-eqz p3, :cond_14f

    iget-object p2, p1, Loqe;->d:Lqre;

    invoke-virtual {p0, p2}, Luqe;->f(Lqre;)Lxqe;

    move-result-object p0

    iget-object p2, p0, Lxqe;->g:Ljava/util/List;

    if-nez p2, :cond_cc

    iget-object p2, p0, Lxqe;->a:Li32;

    invoke-virtual {p2}, Lldk;->i()V

    :cond_cc
    iget-object p2, p0, Lxqe;->g:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p3

    const/4 v0, -0x1

    if-eq p3, v0, :cond_14f

    invoke-interface {p2, p3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0, p2}, Lxqe;->o(Ljava/util/List;)V

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-virtual {p0, p2}, Lxqe;->l(Ljava/util/List;)V

    iget-object p0, p0, Lxqe;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_e8
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_14f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, La53;

    iget-object p2, p2, La53;->a:Lwue;

    iget-object p2, p2, Lwue;->a:Lh7f;

    new-instance p3, Lg7f;

    invoke-direct {p3, p2}, Lg7f;-><init>(Lh7f;)V

    :cond_fd
    :goto_fd
    invoke-virtual {p3}, Lg7f;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_e8

    invoke-virtual {p3}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lrw8;

    iget-object p2, p2, Lrw8;->b:Low8;

    iget-object v1, p2, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_114
    if-ge v5, v2, :cond_12f

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lja2;

    instance-of v7, v6, Lj82;

    if-eqz v7, :cond_12c

    check-cast v6, Lj82;

    iget-object v6, v6, Lj82;->c:Loqe;

    invoke-virtual {v6, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_130

    :cond_12c
    add-int/lit8 v4, v4, 0x1

    goto :goto_114

    :cond_12f
    move v4, v0

    :cond_130
    if-eq v4, v0, :cond_fd

    iget-object v1, p2, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget-object v1, p2, Lcu8;->l:Ltx7;

    invoke-virtual {v1}, Ltx7;->g()V

    iget-object v1, p2, Lcu8;->l:Ltx7;

    invoke-virtual {v1}, Ltx7;->h()V

    invoke-virtual {p2, v3}, Lcu8;->Y(Z)Z

    move-result v1

    if-eqz v1, :cond_14b

    invoke-virtual {p2}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    goto :goto_fd

    :cond_14b
    invoke-virtual {p2, v4}, Landroidx/recyclerview/widget/d;->notifyItemRemoved(I)V

    goto :goto_fd

    :cond_14f
    return-void
.end method

.method public final l(Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p0}, Luqe;->h()Lc6j;

    move-result-object v0

    iget-object v0, v0, Lc6j;->b:Ljava/lang/Object;

    check-cast v0, Lnre;

    if-eqz v0, :cond_11

    const/4 v1, 0x0

    iput-object v1, p0, Luqe;->o:Lq8j;

    invoke-virtual {p0, v0, p1}, Luqe;->c(Lnre;Ljava/lang/String;)V

    return-void

    :cond_11
    new-instance v0, Lwx8;

    invoke-direct {v0, p0, p1}, Lwx8;-><init>(Luqe;Ljava/lang/String;)V

    iput-object v0, p0, Luqe;->o:Lq8j;

    invoke-virtual {p0, v0}, Luqe;->g(Lq8j;)V

    return-void
.end method

.method public final m(Landroid/net/Uri;II)Ljava/lang/String;
    .registers 30

    move/from16 v0, p2

    move-object/from16 v1, p0

    move/from16 v2, p3

    iget-object v1, v1, Luqe;->p:Lwu5;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v1

    const-string v4, "/assets/v2"

    const-string v5, "/assets/v1"

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eqz v1, :cond_3b

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1f

    move v8, v6

    goto :goto_26

    :cond_1f
    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3b

    const/4 v8, 0x2

    :goto_26
    const/16 v9, 0x2f

    invoke-virtual {v1, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    const/4 v10, -0x1

    if-eq v9, v10, :cond_3b

    new-instance v10, Lcm;

    add-int/2addr v9, v6

    invoke-virtual {v1, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/4 v9, 0x4

    invoke-direct {v10, v1, v8, v9}, Lcm;-><init>(Ljava/lang/String;IB)V

    goto :goto_3c

    :cond_3b
    move-object v10, v7

    :goto_3c
    if-eqz v10, :cond_278

    iget-object v1, v10, Lcm;->c:Ljava/lang/String;

    iget v8, v10, Lcm;->b:I

    invoke-static {v8}, Lvep;->A(I)I

    move-result v8

    const/4 v9, 0x3

    if-eqz v8, :cond_131

    if-ne v8, v6, :cond_278

    new-instance v5, Landroid/net/Uri$Builder;

    invoke-direct {v5}, Landroid/net/Uri$Builder;-><init>()V

    const-string v8, "https"

    invoke-virtual {v5, v8}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/net/Uri$Builder;->encodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V

    const-string v5, "format"

    const-string v8, "webp"

    invoke-virtual {v4, v5, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lsfh;->d()Lsfh;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    if-eq v5, v6, :cond_7e

    move v3, v9

    goto :goto_7f

    :cond_7e
    const/4 v3, 0x2

    :goto_7f
    invoke-static {v3}, Lj7c;->j(I)Ljava/lang/String;

    move-result-object v3

    const-string v5, "quality"

    invoke-virtual {v4, v5, v3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lgre;->values()[Lgre;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    new-instance v5, Lkza;

    invoke-direct {v5, v0, v2}, Lkza;-><init>(II)V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_12b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llza;

    invoke-static {v2, v5}, Lw7d;->k(Llza;Lkza;)I

    move-result v3

    :cond_a9
    :goto_a9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_be

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Llza;

    invoke-static {v6, v5}, Lw7d;->k(Llza;Lkza;)I

    move-result v7

    if-ge v7, v3, :cond_a9

    move-object v2, v6

    move v3, v7

    goto :goto_a9

    :cond_be
    invoke-interface {v2}, Llza;->getWidth()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    const-string v3, "width"

    invoke-virtual {v4, v3, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v2}, Llza;->getHeight()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    const-string v2, "height"

    invoke-virtual {v4, v2, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static/range {p1 .. p1}, Lwqm;->n(Landroid/net/Uri;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_e0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_fe

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/util/TreeMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-nez v3, :cond_fa

    move-object/from16 v8, p1

    invoke-virtual {v8, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_fa
    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_e0

    :cond_fe
    invoke-virtual {v4}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_106
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_122

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_106

    :cond_122
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_12b
    const-string v0, "Empty iterable of sizes"

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v7

    :cond_131
    move-object/from16 v8, p1

    int-to-double v10, v0

    const-wide v12, 0x3feb333333333333L    # 0.85

    mul-double v14, v10, v12

    double-to-int v0, v14

    int-to-double v14, v2

    mul-double/2addr v12, v14

    double-to-int v2, v12

    const/16 v4, 0x8

    invoke-static {v4}, Lvep;->B(I)[I

    move-result-object v12

    array-length v13, v12

    const/16 v16, 0x0

    move/from16 v3, v16

    :goto_14a
    if-ge v3, v13, :cond_19e

    aget v17, v12, v3

    const/16 v18, 0x10

    const/16 v19, 0x20

    const/16 v20, 0x30

    const/16 v21, 0x40

    const/16 v22, 0x80

    const/16 v23, 0x120

    const/16 v24, 0x184

    const/16 v25, 0x24c

    packed-switch v17, :pswitch_data_280

    throw v7

    :pswitch_162
    move/from16 v4, v25

    goto :goto_179

    :pswitch_165
    move/from16 v4, v24

    goto :goto_179

    :pswitch_168
    move/from16 v4, v23

    goto :goto_179

    :pswitch_16b
    move/from16 v4, v22

    goto :goto_179

    :pswitch_16e
    move/from16 v4, v21

    goto :goto_179

    :pswitch_171
    move/from16 v4, v20

    goto :goto_179

    :pswitch_174
    move/from16 v4, v19

    goto :goto_179

    :pswitch_177
    move/from16 v4, v18

    :goto_179
    if-lt v4, v0, :cond_19b

    packed-switch v17, :pswitch_data_294

    throw v7

    :pswitch_17f
    move/from16 v4, v25

    goto :goto_196

    :pswitch_182
    move/from16 v4, v24

    goto :goto_196

    :pswitch_185
    move/from16 v4, v23

    goto :goto_196

    :pswitch_188
    move/from16 v4, v22

    goto :goto_196

    :pswitch_18b
    move/from16 v4, v21

    goto :goto_196

    :pswitch_18e
    move/from16 v4, v20

    goto :goto_196

    :pswitch_191
    move/from16 v4, v19

    goto :goto_196

    :pswitch_194
    move/from16 v4, v18

    :goto_196
    if-lt v4, v2, :cond_19b

    move/from16 v4, v17

    goto :goto_1a0

    :cond_19b
    add-int/lit8 v3, v3, 0x1

    goto :goto_14a

    :cond_19e
    const/16 v4, 0x8

    :goto_1a0
    const-string v0, "s"

    packed-switch v4, :pswitch_data_2a8

    throw v7

    :pswitch_1a6
    const-string v2, "4xl"

    goto :goto_1bc

    :pswitch_1a9
    const-string v2, "3xl"

    goto :goto_1bc

    :pswitch_1ac
    const-string v2, "xxl"

    goto :goto_1bc

    :pswitch_1af
    const-string v2, "xl"

    goto :goto_1bc

    :pswitch_1b2
    const-string v2, "l"

    goto :goto_1bc

    :pswitch_1b5
    const-string v2, "m"

    goto :goto_1bc

    :pswitch_1b8
    move-object v2, v0

    goto :goto_1bc

    :pswitch_1ba
    const-string v2, "xs"

    :goto_1bc
    div-double/2addr v10, v14

    const/4 v3, 0x6

    invoke-static {v3}, Lvep;->B(I)[I

    move-result-object v3

    array-length v4, v3

    move/from16 v12, v16

    :goto_1c5
    if-ge v12, v4, :cond_1f8

    aget v13, v3, v12

    packed-switch v13, :pswitch_data_2bc

    throw v7

    :pswitch_1cd
    const-wide/high16 v14, 0x4008000000000000L    # 3.0

    goto :goto_1e7

    :pswitch_1d0
    const-wide v14, 0x3ffc51eb851eb852L    # 1.77

    goto :goto_1e7

    :pswitch_1d6
    const-wide v14, 0x3ffa8f5c28f5c28fL    # 1.66

    goto :goto_1e7

    :pswitch_1dc
    const-wide/high16 v14, 0x3ff8000000000000L    # 1.5

    goto :goto_1e7

    :pswitch_1df
    const-wide v14, 0x3ff547ae147ae148L    # 1.33

    goto :goto_1e7

    :pswitch_1e5
    const-wide/high16 v14, 0x3ff0000000000000L    # 1.0

    :goto_1e7
    cmpl-double v17, v14, v10

    if-ltz v17, :cond_1f5

    sub-double/2addr v14, v10

    const-wide v17, 0x3fb999999999999aL    # 0.1

    cmpg-double v14, v14, v17

    if-lez v14, :cond_1fa

    :cond_1f5
    add-int/lit8 v12, v12, 0x1

    goto :goto_1c5

    :cond_1f8
    move/from16 v13, v16

    :cond_1fa
    if-ne v13, v6, :cond_1fe

    move/from16 v16, v13

    :cond_1fe
    invoke-static {}, Lsfh;->d()Lsfh;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eq v3, v6, :cond_20a

    move v3, v9

    goto :goto_20b

    :cond_20a
    const/4 v3, 0x2

    :goto_20b
    invoke-static {v3}, Lj7c;->j(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "/"

    if-eqz v16, :cond_23b

    const-string v6, "/crop/"

    const-string v9, "/c/"

    invoke-static {v6, v2, v9, v3, v4}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    packed-switch v16, :pswitch_data_2cc

    throw v7

    :pswitch_21f
    const-string v0, "4xw"

    goto :goto_22d

    :pswitch_222
    const-string v0, "3xw"

    goto :goto_22d

    :pswitch_225
    const-string v0, "xxw"

    goto :goto_22d

    :pswitch_228
    const-string v0, "xw"

    goto :goto_22d

    :pswitch_22b
    const-string v0, "w"

    :goto_22d
    :pswitch_22d
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_248

    :cond_23b
    const-string v0, "/tn/"

    invoke-static {v0, v2, v4, v3, v4}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_248
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".webp"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_273

    const/16 v2, 0x3f

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_273
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_278
    move-object/from16 v8, p1

    invoke-virtual {v8}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_280
    .packed-switch 0x1
        :pswitch_177
        :pswitch_174
        :pswitch_171
        :pswitch_16e
        :pswitch_16b
        :pswitch_168
        :pswitch_165
        :pswitch_162
    .end packed-switch

    :pswitch_data_294
    .packed-switch 0x1
        :pswitch_194
        :pswitch_191
        :pswitch_18e
        :pswitch_18b
        :pswitch_188
        :pswitch_185
        :pswitch_182
        :pswitch_17f
    .end packed-switch

    :pswitch_data_2a8
    .packed-switch 0x1
        :pswitch_1ba
        :pswitch_1b8
        :pswitch_1b5
        :pswitch_1b2
        :pswitch_1af
        :pswitch_1ac
        :pswitch_1a9
        :pswitch_1a6
    .end packed-switch

    :pswitch_data_2bc
    .packed-switch 0x1
        :pswitch_1e5
        :pswitch_1df
        :pswitch_1dc
        :pswitch_1d6
        :pswitch_1d0
        :pswitch_1cd
    .end packed-switch

    :pswitch_data_2cc
    .packed-switch 0x1
        :pswitch_22d
        :pswitch_22b
        :pswitch_228
        :pswitch_225
        :pswitch_222
        :pswitch_21f
    .end packed-switch
.end method
