.class public final Lydn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final A:Lxdn;

.field public B:Z

.field public final C:Lj25;

.field public final D:Lx53;

.field public final E:Ljava/util/EnumSet;

.field public F:Lren;

.field public G:I

.field public H:B

.field public I:Lefn;

.field public J:I

.field public K:Z

.field public L:Lpt3;

.field public M:Lcom/opera/api/Callback;

.field public N:Lfdn;

.field public final O:Lktf;

.field public P:Lw7j;

.field public Q:B

.field public R:Lrle;

.field public S:I

.field public T:Z

.field public a:Lwdn;

.field public final b:Lw7j;

.field public final c:Lgfn;

.field public d:Lvdn;

.field public final e:Lsgi;

.field public final f:Lqq8;

.field public final g:Li9c;

.field public h:Z

.field public i:Lcom/opera/android/BrowserActivity;

.field public j:J

.field public final k:Lrdn;

.field public final l:Landroid/content/Context;

.field public final m:Lcom/opera/android/settings/SettingsManager;

.field public final n:Lumi;

.field public final o:Lufn;

.field public final p:Ltvg;

.field public final q:Ljtg;

.field public final r:Lwv1;

.field public final s:Lcnk;

.field public final t:Lh7f;

.field public final u:Lh7f;

.field public final v:Ljava/util/HashSet;

.field public final w:Ljava/util/HashSet;

.field public final x:Ljava/util/HashSet;

.field public final y:Lkv1;

.field public final z:Lvy;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/opera/android/settings/SettingsManager;Lumi;Lmgh;Ldb;Lzv9;Lufn;Ltvg;Ljtg;Lwv1;Ljg8;)V
    .registers 28

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lvdn;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {v2, v4, v4, v3, v3}, Lvdn;-><init>(ZZLefn;Lhfn;)V

    iput-object v2, v0, Lydn;->d:Lvdn;

    new-instance v2, Lrdn;

    const/4 v3, 0x6

    invoke-direct {v2, v0, v3}, Lrdn;-><init>(Lydn;B)V

    iput-object v2, v0, Lydn;->k:Lrdn;

    new-instance v3, Lh7f;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v3, v0, Lydn;->t:Lh7f;

    new-instance v3, Lh7f;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v3, v0, Lydn;->u:Lh7f;

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, v0, Lydn;->v:Ljava/util/HashSet;

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, v0, Lydn;->w:Ljava/util/HashSet;

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, v0, Lydn;->x:Ljava/util/HashSet;

    new-instance v3, Lkv1;

    const/4 v5, 0x5

    invoke-direct {v3, v0, v5}, Lkv1;-><init>(Ljava/lang/Object;B)V

    iput-object v3, v0, Lydn;->y:Lkv1;

    new-instance v3, Lvy;

    const/16 v6, 0x9

    invoke-direct {v3, v0, v6}, Lvy;-><init>(Ljava/lang/Object;B)V

    iput-object v3, v0, Lydn;->z:Lvy;

    new-instance v3, Lxdn;

    invoke-direct {v3, v0}, Lxdn;-><init>(Lydn;)V

    iput-object v3, v0, Lydn;->A:Lxdn;

    new-instance v3, Lj25;

    const/16 v6, 0x8

    invoke-direct {v3, v0, v6}, Lj25;-><init>(Ljava/lang/Object;B)V

    iput-object v3, v0, Lydn;->C:Lj25;

    new-instance v3, Lx53;

    invoke-direct {v3, v0}, Lx53;-><init>(Lydn;)V

    iput-object v3, v0, Lydn;->D:Lx53;

    const-class v3, Lhfn;

    invoke-static {v3}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v3

    iput-object v3, v0, Lydn;->E:Ljava/util/EnumSet;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v3, 0x4

    iput v3, v0, Lydn;->G:I

    iput-byte v4, v0, Lydn;->Q:B

    iput v4, v0, Lydn;->S:I

    invoke-static/range {p1 .. p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v3

    iget-object v5, v3, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v6, "vpn.enabled"

    invoke-interface {v5, v6, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    const/4 v7, 0x1

    if-eqz v5, :cond_9e

    invoke-virtual {v3}, Lru9;->b()Lnv6;

    move-result-object v8

    iget-object v9, v8, Lnv6;->a:Ljava/lang/Object;

    check-cast v9, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v9, v6, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    const-string v6, "vpn.auto_enable_on_start"

    invoke-interface {v9, v6, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v8}, Lnv6;->w()V

    const-wide/16 v8, 0xbb8

    invoke-static {v2, v8, v9}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_9e
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v12

    iput-object v12, v0, Lydn;->l:Landroid/content/Context;

    new-instance v2, Lktf;

    invoke-direct {v2, v1}, Lktf;-><init>(Lumi;)V

    iput-object v2, v0, Lydn;->O:Lktf;

    move-object/from16 v2, p2

    iput-object v2, v0, Lydn;->m:Lcom/opera/android/settings/SettingsManager;

    iput-object v1, v0, Lydn;->n:Lumi;

    move-object/from16 v2, p7

    iput-object v2, v0, Lydn;->o:Lufn;

    move-object/from16 v2, p8

    iput-object v2, v0, Lydn;->p:Ltvg;

    move-object/from16 v2, p9

    iput-object v2, v0, Lydn;->q:Ljtg;

    move-object/from16 v2, p10

    iput-object v2, v0, Lydn;->r:Lwv1;

    new-instance v2, Lqq8;

    invoke-direct {v2, v12, v0}, Lqq8;-><init>(Landroid/content/Context;Lydn;)V

    iput-object v2, v0, Lydn;->f:Lqq8;

    new-instance v2, Lcnk;

    move-object/from16 v6, p1

    move-object/from16 v8, p4

    invoke-direct {v2, v6, v1, v8}, Lcnk;-><init>(Landroid/content/Context;Lumi;Lmgh;)V

    iput-object v2, v0, Lydn;->s:Lcnk;

    new-instance v11, Lw7j;

    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lnrl;

    const/16 v2, 0x1a

    invoke-direct {v1, v2}, Lnrl;-><init>(B)V

    iput-object v1, v11, Lw7j;->d:Ljava/lang/Object;

    iput-object v11, v0, Lydn;->b:Lw7j;

    new-instance v13, Lz4k;

    const/16 v1, 0xc

    invoke-direct {v13, v0, v1}, Lz4k;-><init>(Ljava/lang/Object;B)V

    iget-object v1, v11, Lw7j;->b:Ljava/lang/Object;

    if-nez v1, :cond_100

    invoke-virtual {v11, v12}, Lw7j;->h(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_100

    new-instance v10, Laco;

    move-object/from16 v14, p6

    move-object/from16 v15, p11

    invoke-direct/range {v10 .. v15}, Laco;-><init>(Lw7j;Landroid/content/Context;Lz4k;Lzv9;Ljg8;)V

    iput-object v10, v11, Lw7j;->a:Ljava/lang/Object;

    goto :goto_11f

    :cond_100
    iget-object v1, v11, Lw7j;->b:Ljava/lang/Object;

    const-class v2, Lzv9;

    const-class v6, Ldx5;

    const-class v8, Landroid/content/Context;

    const-class v9, Lffn;

    filled-new-array {v8, v9, v2, v6}, [Ljava/lang/Class;

    move-result-object v2

    move-object/from16 v14, p6

    move-object/from16 v15, p11

    filled-new-array {v12, v13, v14, v15}, [Ljava/lang/Object;

    move-result-object v6

    const-string v8, "createStateBuilder"

    invoke-static {v1, v8, v2, v6}, Lmzg;->j(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Lgfn;

    :goto_11f
    iput-object v10, v0, Lydn;->c:Lgfn;

    new-instance v1, Lvdn;

    invoke-interface {v10}, Lgfn;->e()Lefn;

    move-result-object v2

    invoke-direct {v1, v12, v2}, Lvdn;-><init>(Landroid/content/Context;Lefn;)V

    new-instance v2, Lsgi;

    new-instance v6, Lrdn;

    invoke-direct {v6, v0, v4}, Lrdn;-><init>(Lydn;B)V

    new-instance v8, Lrdn;

    invoke-direct {v8, v0, v7}, Lrdn;-><init>(Lydn;B)V

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput v4, v2, Lsgi;->b:I

    new-instance v4, Lssi;

    const/16 v9, 0x17

    invoke-direct {v4, v2, v9}, Lssi;-><init>(Ljava/lang/Object;B)V

    iput-object v4, v2, Lsgi;->f:Ljava/lang/Object;

    new-instance v4, Lngn;

    invoke-direct {v4, v2}, Lngn;-><init>(Lsgi;)V

    iput-object v4, v2, Lsgi;->g:Ljava/lang/Object;

    new-instance v4, Lse3;

    invoke-direct {v4, v2}, Lse3;-><init>(Lsgi;)V

    iput-object v4, v2, Lsgi;->i:Ljava/lang/Object;

    iput-object v6, v2, Lsgi;->e:Ljava/lang/Object;

    iput-object v8, v2, Lsgi;->h:Ljava/lang/Object;

    iput-object v2, v0, Lydn;->e:Lsgi;

    invoke-virtual {v0, v1}, Lydn;->c(Lvdn;)V

    if-eqz v5, :cond_16f

    invoke-interface {v10}, Lgfn;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_16f

    invoke-interface {v10}, Lgfn;->l()Z

    move-result v1

    if-eqz v1, :cond_16f

    invoke-virtual {v0}, Lydn;->a()V

    invoke-virtual {v0}, Lydn;->f()V

    :cond_16f
    new-instance v1, Li9c;

    move-object/from16 v2, p5

    invoke-direct {v1, v3, v2, v0}, Li9c;-><init>(Lru9;Ldb;Lydn;)V

    iput-object v1, v0, Lydn;->g:Li9c;

    invoke-static {v12}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v1

    iget-object v1, v1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "vpn.bypass_for_search"

    invoke-interface {v1, v2, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, v0, Lydn;->B:Z

    return-void
.end method


# virtual methods
.method public final A(Ltdn;)V
    .registers 2

    iget-object p0, p0, Lydn;->t:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final B()V
    .registers 4

    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-object v1, v0, Lvdn;->b:Lefn;

    if-eqz v1, :cond_a

    invoke-virtual {p0}, Lydn;->e()V

    goto :goto_11

    :cond_a
    iget-boolean v0, v0, Lvdn;->a:Z

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Lydn;->f()V

    :cond_11
    :goto_11
    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    invoke-virtual {p0}, Lydn;->m()I

    move-result v1

    iget-object v2, p0, Lydn;->e:Lsgi;

    invoke-virtual {v2, v1, v0}, Lsgi;->I(IZ)V

    invoke-virtual {p0}, Lydn;->v()V

    return-void
.end method

.method public final C(Z)V
    .registers 8

    iget-object v0, p0, Lydn;->f:Lqq8;

    invoke-virtual {v0}, Lqq8;->g()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_12

    iget-object v1, p0, Lydn;->d:Lvdn;

    iget-boolean v1, v1, Lvdn;->a:Z

    if-ne v1, p1, :cond_12

    move v1, v3

    goto :goto_13

    :cond_12
    move v1, v2

    :goto_13
    const-wide/16 v4, 0x0

    invoke-virtual {v0, v4, v5}, Lqq8;->n(J)V

    iget-object v0, p0, Lydn;->d:Lvdn;

    if-eqz v1, :cond_20

    invoke-virtual {p0, v0}, Lydn;->c(Lvdn;)V

    return-void

    :cond_20
    iget-boolean v1, v0, Lvdn;->a:Z

    if-eq p1, v1, :cond_6b

    const/4 v1, 0x4

    iput v1, p0, Lydn;->G:I

    invoke-virtual {v0}, Lvdn;->b()Z

    move-result v0

    invoke-virtual {p0}, Lydn;->p()Lwdn;

    move-result-object v1

    iget-boolean v1, v1, Lwdn;->a:Z

    if-eqz v1, :cond_35

    if-nez p1, :cond_36

    :cond_35
    move v3, v2

    :cond_36
    iget-object p1, p0, Lydn;->c:Lgfn;

    invoke-interface {p1}, Lgfn;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_3f

    move v2, v0

    :cond_3f
    new-instance v0, Lvdn;

    const/4 v1, 0x0

    invoke-direct {v0, v3, v2, v1, v1}, Lvdn;-><init>(ZZLefn;Lhfn;)V

    invoke-virtual {p0, v0}, Lydn;->I(Lvdn;)V

    invoke-interface {p1}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_6b

    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    if-eqz v0, :cond_58

    invoke-virtual {p0}, Lydn;->f()V

    return-void

    :cond_58
    new-instance v0, Lkoj;

    const/16 v2, 0x8

    invoke-direct {v0, v2}, Lkoj;-><init>(B)V

    iget-object p0, p0, Lydn;->n:Lumi;

    invoke-interface {p0, v0}, Ltcl;->a(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    invoke-interface {p1}, Lgfn;->i()V

    :cond_6b
    return-void
.end method

.method public final D(Z)V
    .registers 7

    iget-object v0, p0, Lydn;->d:Lvdn;

    invoke-virtual {v0}, Lvdn;->b()Z

    move-result v0

    iget-object v1, p0, Lydn;->d:Lvdn;

    iget-object v2, v1, Lvdn;->b:Lefn;

    iget-object v1, v1, Lvdn;->c:Lhfn;

    invoke-virtual {p0}, Lydn;->p()Lwdn;

    move-result-object v3

    iget-boolean v3, v3, Lwdn;->a:Z

    const/4 v4, 0x0

    if-eqz v3, :cond_19

    if-eqz p1, :cond_19

    const/4 p1, 0x1

    goto :goto_1a

    :cond_19
    move p1, v4

    :goto_1a
    iget-object v3, p0, Lydn;->c:Lgfn;

    invoke-interface {v3}, Lgfn;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_23

    move v0, v4

    :cond_23
    new-instance v3, Lvdn;

    invoke-direct {v3, p1, v0, v2, v1}, Lvdn;-><init>(ZZLefn;Lhfn;)V

    invoke-virtual {p0, v3}, Lydn;->I(Lvdn;)V

    return-void
.end method

.method public final E(Z)V
    .registers 4

    iput-boolean p1, p0, Lydn;->T:Z

    invoke-virtual {p0}, Lydn;->p()Lwdn;

    move-result-object v0

    invoke-virtual {v0}, Lwdn;->a()Z

    move-result v0

    and-int/2addr p1, v0

    iget-object v0, p0, Lydn;->c:Lgfn;

    if-eqz p1, :cond_17

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_17

    const/4 v1, 0x1

    goto :goto_18

    :cond_17
    const/4 v1, 0x0

    :goto_18
    invoke-interface {v0, p1}, Lgfn;->setEnabled(Z)Lgfn;

    move-result-object v0

    invoke-interface {v0}, Lgfn;->d()V

    if-eqz v1, :cond_27

    iget-object p1, p0, Lydn;->d:Lvdn;

    invoke-virtual {p0, p1}, Lydn;->c(Lvdn;)V

    goto :goto_35

    :cond_27
    if-nez p1, :cond_35

    iget-object p1, p0, Lydn;->R:Lrle;

    if-eqz p1, :cond_35

    iget-object p1, p1, Lrle;->a:Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;

    invoke-static {p1}, Lorg/chromium/net/NetworkChangeNotifier;->removeConnectionTypeObserver(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lydn;->R:Lrle;

    :cond_35
    :goto_35
    iget-object p1, p0, Lydn;->d:Lvdn;

    iget-boolean p1, p1, Lvdn;->a:Z

    if-eqz p1, :cond_3e

    invoke-virtual {p0}, Lydn;->f()V

    :cond_3e
    return-void
.end method

.method public final bridge synthetic F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ltdn;

    invoke-virtual {p0, p1}, Lydn;->b(Ltdn;)V

    return-void
.end method

.method public final G(Ljava/util/List;)V
    .registers 7

    iget-object v0, p0, Lydn;->v:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_9
    :goto_9
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leri;

    invoke-interface {v1}, Leri;->d()Z

    move-result v2

    if-nez v2, :cond_9

    const/4 v2, 0x2

    sget-object v3, Lp6l;->a:Lp6l;

    const-string v4, ""

    invoke-interface {v1, v2, v3, v4}, Leri;->a(ILp6l;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/chromium/net/GURLUtils;->getOrigin(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "google"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_38

    const-string v2, "yandex"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_9

    :cond_38
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_9

    :cond_3c
    const-string p1, "https://www.google.com/"

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string p1, "https://yandex.ru/"

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string p1, "https://yandex.com/"

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string p1, "https://yandex.com.tr/"

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lydn;->N()V

    return-void
.end method

.method public final bridge synthetic H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ltdn;

    invoke-virtual {p0, p1}, Lydn;->A(Ltdn;)V

    return-void
.end method

.method public final I(Lvdn;)V
    .registers 12

    iget-object v0, p0, Lydn;->d:Lvdn;

    invoke-virtual {p1, v0}, Lvdn;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-boolean v1, p1, Lvdn;->a:Z

    if-eqz v0, :cond_b

    return-void

    :cond_b
    iget-object v0, p0, Lydn;->c:Lgfn;

    const/4 v2, 0x0

    if-eqz v1, :cond_20

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v3

    if-nez v3, :cond_20

    iget-object v3, p0, Lydn;->m:Lcom/opera/android/settings/SettingsManager;

    const-string v4, "compression"

    invoke-virtual {v3, v2, v4}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {p0}, Lydn;->s()V

    :cond_20
    invoke-virtual {p1}, Lvdn;->a()Z

    move-result v3

    iget-object v4, p0, Lydn;->l:Landroid/content/Context;

    if-eqz v3, :cond_40

    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v3

    invoke-virtual {v3}, Lru9;->b()Lnv6;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget-object v7, v3, Lnv6;->a:Ljava/lang/Object;

    check-cast v7, Landroid/content/SharedPreferences$Editor;

    const-string v8, "vpn.enabled.timestamp.normal"

    invoke-interface {v7, v8, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v3}, Lnv6;->w()V

    :cond_40
    if-eqz v1, :cond_a4

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_a4

    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v3, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v5, "vpn.vpnpro_first_enable_timestamp"

    const-wide/16 v6, 0x0

    invoke-interface {v3, v5, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    cmp-long v3, v8, v6

    if-nez v3, :cond_6c

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-object v3, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v3, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v3, v5, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    :cond_6c
    iget-byte v0, p0, Lydn;->Q:B

    const/4 v3, 0x1

    if-eqz v0, :cond_74

    if-eq v0, v3, :cond_a4

    goto :goto_a0

    :cond_74
    iget-object v0, p0, Lydn;->b:Lw7j;

    iget-object v5, v0, Lw7j;->b:Ljava/lang/Object;

    if-eqz v5, :cond_97

    const-class v6, Landroid/content/Context;

    filled-new-array {v6}, [Ljava/lang/Class;

    move-result-object v6

    iget-object v0, v0, Lw7j;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v7, "init"

    invoke-static {v5, v7, v6, v0}, Lmzg;->j(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v0, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    goto :goto_98

    :cond_97
    move v0, v2

    :goto_98
    if-eqz v0, :cond_9d

    iput-byte v3, p0, Lydn;->Q:B

    goto :goto_a4

    :cond_9d
    const/4 p1, 0x3

    iput-byte p1, p0, Lydn;->Q:B

    :goto_a0
    invoke-virtual {p0, v2}, Lydn;->C(Z)V

    return-void

    :cond_a4
    :goto_a4
    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v2, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    const-string v3, "vpn.enabled"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    iget-object v1, p1, Lvdn;->d:Lesk;

    invoke-interface {v1}, Lesk;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const-string v3, "vpn.enable_only_in_incognito"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    invoke-virtual {p0, p1}, Lydn;->c(Lvdn;)V

    return-void
.end method

.method public final J(Lwdn;)V
    .registers 9

    iget-object v0, p0, Lydn;->a:Lwdn;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_e

    iget-boolean v0, v0, Lwdn;->b:Z

    iget-boolean v3, p1, Lwdn;->b:Z

    if-eq v0, v3, :cond_e

    move v0, v1

    goto :goto_f

    :cond_e
    move v0, v2

    :goto_f
    iput-object p1, p0, Lydn;->a:Lwdn;

    iget-boolean v3, p0, Lydn;->h:Z

    if-eqz v3, :cond_1c

    iget-object p1, p1, Lwdn;->f:[Ljava/lang/String;

    if-eqz p1, :cond_1c

    invoke-static {p1}, LJ/N;->M0qbH6jH(Ljava/lang/Object;)V

    :cond_1c
    iget-object p1, p0, Lydn;->a:Lwdn;

    invoke-virtual {p1}, Lwdn;->a()Z

    move-result p1

    iget-object v3, p0, Lydn;->c:Lgfn;

    if-nez p1, :cond_33

    invoke-interface {v3}, Lgfn;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_33

    invoke-interface {v3, v2}, Lgfn;->setEnabled(Z)Lgfn;

    move-result-object p1

    invoke-interface {p1}, Lgfn;->d()V

    :cond_33
    new-instance p1, Lvdn;

    iget-object v4, p0, Lydn;->l:Landroid/content/Context;

    const/4 v5, 0x0

    invoke-direct {p1, v4, v5}, Lvdn;-><init>(Landroid/content/Context;Lefn;)V

    invoke-virtual {p0}, Lydn;->p()Lwdn;

    move-result-object v4

    iget-boolean v4, v4, Lwdn;->a:Z

    if-eqz v4, :cond_47

    iget-boolean v4, p1, Lvdn;->a:Z

    if-nez v4, :cond_48

    :cond_47
    move v1, v2

    :cond_48
    invoke-virtual {p1}, Lvdn;->b()Z

    move-result v4

    invoke-interface {v3}, Lgfn;->isEnabled()Z

    move-result v6

    if-nez v6, :cond_53

    move v2, v4

    :cond_53
    new-instance v4, Lvdn;

    iget-object p1, p1, Lvdn;->b:Lefn;

    invoke-direct {v4, v1, v2, p1, v5}, Lvdn;-><init>(ZZLefn;Lhfn;)V

    if-eqz v1, :cond_66

    new-instance p1, Liyk;

    const/4 v1, 0x7

    invoke-direct {p1, p0, v4, v1}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v3, p1}, Lgfn;->g(Lcom/opera/api/Callback;)V

    goto :goto_69

    :cond_66
    invoke-virtual {p0, v4}, Lydn;->I(Lvdn;)V

    :goto_69
    if-eqz v0, :cond_81

    iget-object p1, p0, Lydn;->t:Lh7f;

    invoke-static {p1, p1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_71
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_81

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltdn;

    invoke-interface {v0}, Ltdn;->C()V

    goto :goto_71

    :cond_81
    iget-object p0, p0, Lydn;->u:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_87
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_99

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgen;

    iget-object p1, p1, Lgen;->a:Lyi2;

    invoke-virtual {p1}, Lyi2;->p()V

    goto :goto_87

    :cond_99
    return-void
.end method

.method public final K(JJLjava/lang/String;Ljava/lang/String;)V
    .registers 13

    iget-object v0, p0, Lydn;->A:Lxdn;

    iget-object v1, v0, Lxdn;->a:Ljava/lang/String;

    invoke-static {p5, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1e

    iget-object v1, v0, Lxdn;->b:Ljava/lang/String;

    invoke-static {p6, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1e

    iget-wide v1, v0, Lxdn;->c:J

    cmp-long v1, p1, v1

    if-nez v1, :cond_1e

    iget-wide v1, v0, Lxdn;->e:J

    cmp-long v1, p3, v1

    if-eqz v1, :cond_45

    :cond_1e
    iput-object p5, v0, Lxdn;->a:Ljava/lang/String;

    iput-object p6, v0, Lxdn;->b:Ljava/lang/String;

    iput-wide p1, v0, Lxdn;->c:J

    iget-wide v1, v0, Lxdn;->e:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_34

    cmp-long v1, p3, v1

    if-lez v1, :cond_34

    iput-wide v3, v0, Lxdn;->d:J

    move-wide p1, v3

    goto :goto_36

    :cond_34
    iput-wide p1, v0, Lxdn;->d:J

    :goto_36
    iput-wide p3, v0, Lxdn;->e:J

    iget-object p3, v0, Lxdn;->f:Lydn;

    iget-object p3, p3, Lydn;->c:Lgfn;

    sget-object p4, Laik;->a:[Ljava/lang/String;

    invoke-interface {p3, p1, p2, p5, p6}, Lgfn;->a(JLjava/lang/String;Ljava/lang/String;)Lgfn;

    move-result-object p1

    invoke-interface {p1}, Lgfn;->d()V

    :cond_45
    iget-object p1, p0, Lydn;->d:Lvdn;

    iget-boolean p1, p1, Lvdn;->a:Z

    if-eqz p1, :cond_4e

    invoke-virtual {p0}, Lydn;->f()V

    :cond_4e
    return-void
.end method

.method public final M()Z
    .registers 6

    iget-object v0, p0, Lydn;->l:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "vpn.enabled.timestamp.normal"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iget-object v4, p0, Lydn;->d:Lvdn;

    invoke-virtual {v4}, Lvdn;->a()Z

    move-result v4

    if-eqz v4, :cond_42

    iget-object v4, p0, Lydn;->c:Lgfn;

    invoke-interface {v4}, Lgfn;->isEnabled()Z

    move-result v4

    if-nez v4, :cond_42

    cmp-long v2, v0, v2

    if-eqz v2, :cond_42

    invoke-virtual {p0}, Lydn;->p()Lwdn;

    move-result-object v2

    iget v2, v2, Lwdn;->d:I

    if-eqz v2, :cond_42

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    const-wide/32 v0, 0xea60

    div-long/2addr v2, v0

    invoke-virtual {p0}, Lydn;->p()Lwdn;

    move-result-object p0

    iget p0, p0, Lwdn;->d:I

    int-to-long v0, p0

    cmp-long p0, v2, v0

    if-lez p0, :cond_42

    const/4 p0, 0x1

    return p0

    :cond_42
    const/4 p0, 0x0

    return p0
.end method

.method public final N()V
    .registers 3

    iget-object v0, p0, Lydn;->x:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    iget-boolean v1, p0, Lydn;->B:Z

    if-eqz v1, :cond_e

    iget-object v1, p0, Lydn;->v:Ljava/util/HashSet;

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    :cond_e
    iget-object v1, p0, Lydn;->w:Ljava/util/HashSet;

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget-boolean p0, p0, Lydn;->h:Z

    if-nez p0, :cond_18

    return-void

    :cond_18
    const/4 p0, 0x0

    new-array v1, p0, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const/4 v1, 0x1

    invoke-static {v1, v0}, LJ/N;->Mdwnoz2p(ZLjava/lang/Object;)V

    invoke-static {p0, v0}, LJ/N;->Mdwnoz2p(ZLjava/lang/Object;)V

    return-void
.end method

.method public final O()V
    .registers 3

    iget-boolean v0, p0, Lydn;->h:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    if-eqz v0, :cond_2f

    iget-object v0, p0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_2f

    iget v0, p0, Lydn;->S:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1c

    invoke-static {}, LJ/N;->MWux_skv()V

    return-void

    :cond_1c
    iget v0, p0, Lydn;->G:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2b

    iget-object p0, p0, Lydn;->d:Lvdn;

    iget-object p0, p0, Lvdn;->b:Lefn;

    if-eqz p0, :cond_2b

    invoke-static {}, LJ/N;->M3qiiNOP()V

    return-void

    :cond_2b
    invoke-static {}, LJ/N;->MVR91nie()V

    return-void

    :cond_2f
    invoke-static {}, LJ/N;->MUrl7l94()V

    return-void
.end method

.method public final a()V
    .registers 3

    iget-object v0, p0, Lydn;->R:Lrle;

    if-nez v0, :cond_16

    invoke-static {}, Lsle;->c()I

    move-result v0

    iput v0, p0, Lydn;->S:I

    new-instance v0, Lfpk;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lfpk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lsle;->a(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)Lrle;

    move-result-object v0

    iput-object v0, p0, Lydn;->R:Lrle;

    :cond_16
    return-void
.end method

.method public final b(Ltdn;)V
    .registers 2

    iget-object p0, p0, Lydn;->t:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c(Lvdn;)V
    .registers 4

    iput-object p1, p0, Lydn;->d:Lvdn;

    invoke-virtual {p0}, Lydn;->e()V

    iget-object p1, p0, Lydn;->d:Lvdn;

    iget-boolean p1, p1, Lvdn;->a:Z

    invoke-virtual {p0}, Lydn;->m()I

    move-result v0

    iget-object v1, p0, Lydn;->e:Lsgi;

    invoke-virtual {v1, v0, p1}, Lsgi;->I(IZ)V

    invoke-virtual {p0}, Lydn;->v()V

    return-void
.end method

.method public final e()V
    .registers 13

    iget-boolean v0, p0, Lydn;->h:Z

    iget-object v1, p0, Lydn;->c:Lgfn;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_31

    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    if-eqz v0, :cond_16

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_16

    move v0, v2

    goto :goto_17

    :cond_16
    move v0, v3

    :goto_17
    invoke-static {v2, v0}, LJ/N;->MHNaH9Gd(ZZ)V

    iget-object v0, p0, Lydn;->d:Lvdn;

    invoke-virtual {v0}, Lvdn;->a()Z

    move-result v0

    if-eqz v0, :cond_2a

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_2a

    move v0, v2

    goto :goto_2b

    :cond_2a
    move v0, v3

    :goto_2b
    invoke-static {v3, v0}, LJ/N;->MHNaH9Gd(ZZ)V

    invoke-virtual {p0}, Lydn;->O()V

    :cond_31
    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    const/4 v4, 0x0

    if-eqz v0, :cond_42

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_42

    invoke-virtual {p0}, Lydn;->a()V

    goto :goto_4d

    :cond_42
    iget-object v0, p0, Lydn;->R:Lrle;

    if-eqz v0, :cond_4d

    iget-object v0, v0, Lrle;->a:Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifier;->removeConnectionTypeObserver(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    iput-object v4, p0, Lydn;->R:Lrle;

    :cond_4d
    :goto_4d
    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-object v5, v0, Lvdn;->b:Lefn;

    const/4 v6, 0x4

    iget-object v7, p0, Lydn;->l:Landroid/content/Context;

    iget-object v8, p0, Lydn;->b:Lw7j;

    if-eqz v5, :cond_ea

    iget-boolean v0, v0, Lvdn;->a:Z

    if-eqz v0, :cond_ea

    iget-object v0, p0, Lydn;->I:Lefn;

    invoke-virtual {v5, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_79

    iget-object v0, p0, Lydn;->F:Lren;

    if-eqz v0, :cond_79

    invoke-interface {v0}, Lren;->c()I

    move-result v0

    if-ne v0, v1, :cond_79

    iget v0, p0, Lydn;->G:I

    if-eq v0, v1, :cond_129

    iget-object v0, p0, Lydn;->F:Lren;

    invoke-virtual {p0, v0}, Lydn;->y(Lren;)V

    return-void

    :cond_79
    iget-object v0, p0, Lydn;->F:Lren;

    if-nez v0, :cond_b3

    new-instance v0, Lu7k;

    invoke-direct {v0, p0}, Lu7k;-><init>(Ljava/lang/Object;)V

    new-instance v5, Lsdn;

    invoke-direct {v5, p0, v1}, Lsdn;-><init>(Lydn;B)V

    iget-object v9, v8, Lw7j;->b:Ljava/lang/Object;

    if-eqz v9, :cond_a2

    const-class v4, Lqen;

    const-class v10, Lcom/opera/api/Callback;

    const-class v11, Landroid/content/Context;

    filled-new-array {v11, v4, v10}, [Ljava/lang/Class;

    move-result-object v4

    filled-new-array {v7, v0, v5}, [Ljava/lang/Object;

    move-result-object v0

    const-string v5, "createManager"

    invoke-static {v9, v5, v4, v0}, Lmzg;->j(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lren;

    :cond_a2
    iput-object v4, p0, Lydn;->F:Lren;

    if-nez v4, :cond_b3

    new-instance v0, Lrdn;

    invoke-direct {v0, p0, v6}, Lrdn;-><init>(Lydn;B)V

    iget-object p0, v8, Lw7j;->d:Ljava/lang/Object;

    check-cast p0, Lnrl;

    invoke-virtual {p0, v0}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void

    :cond_b3
    iget-object v0, p0, Lydn;->P:Lw7j;

    if-eqz v0, :cond_cc

    iget-object v0, v0, Lw7j;->b:Ljava/lang/Object;

    check-cast v0, Lsz4;

    invoke-static {v0}, Lyi4;->T(Lsz4;)Z

    move-result v0

    if-eqz v0, :cond_cc

    iget-object v0, p0, Lydn;->P:Lw7j;

    new-instance v1, Lsdn;

    invoke-direct {v1, p0, v3}, Lsdn;-><init>(Lydn;B)V

    invoke-virtual {v0, v1}, Lw7j;->n(Lsdn;)V

    return-void

    :cond_cc
    iput v3, p0, Lydn;->J:I

    iget-object v0, p0, Lydn;->F:Lren;

    new-instance v3, Lsdn;

    invoke-direct {v3, p0, v1}, Lsdn;-><init>(Lydn;B)V

    invoke-interface {v0, v3}, Lren;->d(Lsdn;)V

    iput v2, p0, Lydn;->G:I

    iget-object v0, p0, Lydn;->F:Lren;

    iget-object v1, p0, Lydn;->d:Lvdn;

    iget-object v1, v1, Lvdn;->b:Lefn;

    invoke-interface {v0, v1}, Lren;->f(Lefn;)V

    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-object v0, v0, Lvdn;->b:Lefn;

    iput-object v0, p0, Lydn;->I:Lefn;

    return-void

    :cond_ea
    iput-object v4, p0, Lydn;->I:Lefn;

    iget-object v0, p0, Lydn;->F:Lren;

    const/4 v2, 0x3

    if-eqz v0, :cond_fe

    new-instance v3, Lrdn;

    invoke-direct {v3, p0, v2}, Lrdn;-><init>(Lydn;B)V

    invoke-interface {v0, v3}, Lren;->a(Lrdn;)V

    iget-object v0, p0, Lydn;->F:Lren;

    invoke-interface {v0, v4}, Lren;->d(Lsdn;)V

    :cond_fe
    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_10c

    iget-object v0, p0, Lydn;->f:Lqq8;

    invoke-virtual {v0}, Lqq8;->g()Z

    move-result v0

    if-nez v0, :cond_121

    :cond_10c
    const-string v0, "notification"

    invoke-virtual {v7, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v1, 0x1a4

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    sget-object v0, Lcom/opera/android/vpn/VpnFailedToConnectService;->c:Lbp;

    invoke-virtual {v0, v7}, Lbp;->c0(Landroid/content/Context;)V

    :cond_121
    iget v0, p0, Lydn;->G:I

    if-eqz v0, :cond_129

    if-eq v0, v2, :cond_129

    iput v6, p0, Lydn;->G:I

    :cond_129
    return-void
.end method

.method public final f()V
    .registers 5

    iget-object v0, p0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_19

    iget v1, p0, Lydn;->S:I

    const/4 v3, 0x6

    if-ne v1, v3, :cond_12

    const/4 v0, 0x3

    iput v0, p0, Lydn;->G:I

    return-void

    :cond_12
    iget v1, p0, Lydn;->G:I

    const/4 v3, 0x2

    if-eq v1, v3, :cond_19

    iput v2, p0, Lydn;->G:I

    :cond_19
    new-instance v1, Lsdn;

    invoke-direct {v1, p0, v2}, Lsdn;-><init>(Lydn;B)V

    invoke-interface {v0, v1}, Lgfn;->g(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final g()V
    .registers 5

    iget-object v0, p0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-object v0, v0, Lvdn;->b:Lefn;

    if-eqz v0, :cond_26

    iget v1, p0, Lydn;->G:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_26

    iget-object v1, p0, Lydn;->O:Lktf;

    iget-object v2, v1, Lktf;->d:Lefn;

    if-eq v0, v2, :cond_26

    iget-object v2, v1, Lktf;->c:Lefn;

    if-eq v0, v2, :cond_26

    new-instance v2, Lrdn;

    const/4 v3, 0x5

    invoke-direct {v2, p0, v3}, Lrdn;-><init>(Lydn;B)V

    invoke-virtual {v1, v0, v2}, Lktf;->a(Lefn;Ljava/lang/Runnable;)V

    :cond_26
    return-void
.end method

.method public final h(Ljava/lang/String;)Lfdn;
    .registers 6

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lydn;->l:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/16 v3, 0xc2c

    if-eq v2, v3, :cond_71

    const/16 v3, 0xc32

    if-eq v2, v3, :cond_58

    const/16 v3, 0xcb0

    if-eq v2, v3, :cond_3f

    const/16 p1, 0xd83

    if-eq v2, p1, :cond_3c

    const/16 p1, 0xe7f

    if-eq v2, p1, :cond_36

    const p1, 0x5c13d641

    if-ne v2, p1, :cond_8a

    const-string p1, "default"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8a

    invoke-virtual {p0}, Lydn;->n()Lfdn;

    move-result-object p0

    return-object p0

    :cond_36
    const-string p0, "ts"

    :goto_38
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    goto :goto_8a

    :cond_3c
    const-string p0, "lo"

    goto :goto_38

    :cond_3f
    const-string p0, "eu"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8a

    const p0, 0x7f14139a

    invoke-virtual {v1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    const v1, 0x7f080749

    sget-object v2, Lpt0;->e:Lpt0;

    invoke-static {v0, p1, p0, v1, v2}, Lfdn;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILpt0;)Lfdn;

    move-result-object p0

    return-object p0

    :cond_58
    const-string p0, "as"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8a

    const p0, 0x7f141399

    invoke-virtual {v1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    const v1, 0x7f080748

    sget-object v2, Lpt0;->d:Lpt0;

    invoke-static {v0, p1, p0, v1, v2}, Lfdn;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILpt0;)Lfdn;

    move-result-object p0

    return-object p0

    :cond_71
    const-string p0, "am"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8a

    const p0, 0x7f141398

    invoke-virtual {v1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    const v1, 0x7f080747

    sget-object v2, Lpt0;->c:Lpt0;

    invoke-static {v0, p1, p0, v1, v2}, Lfdn;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILpt0;)Lfdn;

    move-result-object p0

    return-object p0

    :cond_8a
    :goto_8a
    const/4 p0, 0x0

    return-object p0
.end method

.method public final i()Lfdn;
    .registers 6

    iget-object v0, p0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_5e

    iget-object v1, p0, Lydn;->a:Lwdn;

    if-eqz v1, :cond_10

    iget-boolean v1, v1, Lwdn;->c:Z

    if-nez v1, :cond_5e

    :cond_10
    iget-object v1, p0, Lydn;->N:Lfdn;

    if-nez v1, :cond_5b

    iget-object v1, p0, Lydn;->s:Lcnk;

    invoke-interface {v0}, Lgfn;->k()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcnk;->a(Ljava/util/Map;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Lgfn;->h(Ljava/util/List;)Landroid/util/Pair;

    move-result-object v0

    if-nez v0, :cond_2b

    invoke-virtual {p0}, Lydn;->o()Lfdn;

    move-result-object v0

    iput-object v0, p0, Lydn;->N:Lfdn;

    goto :goto_5b

    :cond_2b
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Lbnk;

    invoke-virtual {v1}, Lbnk;->a()Lfdn;

    move-result-object v1

    iput-object v1, p0, Lydn;->N:Lfdn;

    iget-object v2, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    if-eqz v2, :cond_5b

    iget-object v1, v1, Lfdn;->g:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_43
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfdn;

    iget-object v3, v2, Lfdn;->c:Ljava/lang/String;

    iget-object v4, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_43

    iput-object v2, p0, Lydn;->N:Lfdn;

    :cond_5b
    :goto_5b
    iget-object p0, p0, Lydn;->N:Lfdn;

    return-object p0

    :cond_5e
    invoke-static {}, LJ/N;->MncQv8HY()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lydn;->h(Ljava/lang/String;)Lfdn;

    move-result-object v0

    if-nez v0, :cond_6f

    invoke-virtual {p0}, Lydn;->n()Lfdn;

    move-result-object p0

    return-object p0

    :cond_6f
    return-object v0
.end method

.method public final j()I
    .registers 2

    iget-object v0, p0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-object v0, v0, Lvdn;->b:Lefn;

    if-eqz v0, :cond_1e

    invoke-interface {v0}, Lefn;->a()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {v0, p0}, Lvtp;->K(ILjava/lang/String;)I

    move-result p0

    return p0

    :cond_1e
    invoke-virtual {p0}, Lydn;->i()Lfdn;

    move-result-object p0

    iget p0, p0, Lfdn;->i:I

    return p0
.end method

.method public final k()Ljava/lang/String;
    .registers 5

    iget-object v0, p0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_24

    iget-object v1, p0, Lydn;->d:Lvdn;

    iget-boolean v1, v1, Lvdn;->a:Z

    if-eqz v1, :cond_24

    iget-object v1, p0, Lydn;->s:Lcnk;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcnk;->a(Ljava/util/Map;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v3}, Lgfn;->f(Ljava/util/List;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_24

    invoke-virtual {v1, v2}, Lcnk;->a(Ljava/util/Map;)Ljava/util/List;

    move-result-object p0

    invoke-interface {v0, p0}, Lgfn;->f(Ljava/util/List;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_24
    invoke-virtual {p0}, Lydn;->i()Lfdn;

    move-result-object p0

    iget-object p0, p0, Lfdn;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final l()Ljava/lang/String;
    .registers 4

    invoke-virtual {p0}, Lydn;->i()Lfdn;

    move-result-object v0

    iget-boolean v0, v0, Lfdn;->j:Z

    iget-object v1, p0, Lydn;->l:Landroid/content/Context;

    if-eqz v0, :cond_12

    const v0, 0x7f141381

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_19

    :cond_12
    const v0, 0x7f14139b

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_19
    iget-object v2, p0, Lydn;->c:Lgfn;

    invoke-interface {v2}, Lgfn;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_41

    iget-object v2, p0, Lydn;->d:Lvdn;

    iget-boolean v2, v2, Lvdn;->a:Z

    if-eqz v2, :cond_41

    invoke-virtual {p0}, Lydn;->g()V

    iget-object v0, p0, Lydn;->O:Lktf;

    iget-object v2, v0, Lktf;->d:Lefn;

    iget-object p0, p0, Lydn;->d:Lvdn;

    iget-object p0, p0, Lvdn;->b:Lefn;

    if-ne v2, p0, :cond_39

    iget-object p0, v0, Lktf;->e:Ljava/lang/String;

    if-eqz p0, :cond_39

    return-object p0

    :cond_39
    const p0, 0x7f14140c

    invoke-virtual {v1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_41
    return-object v0
.end method

.method public final m()I
    .registers 3

    iget-object v0, p0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_b

    iget p0, p0, Lydn;->G:I

    return p0

    :cond_b
    iget-boolean p0, p0, Lydn;->h:Z

    const/4 v0, 0x4

    if-eqz p0, :cond_21

    invoke-static {}, LJ/N;->MD91vZjl()I

    move-result p0

    const/4 v1, 0x1

    if-eq p0, v1, :cond_22

    const/4 v1, 0x2

    if-eq p0, v1, :cond_22

    const/4 v1, 0x3

    if-eq p0, v1, :cond_22

    if-eq p0, v0, :cond_21

    const/4 p0, 0x0

    return p0

    :cond_21
    return v0

    :cond_22
    return v1
.end method

.method public final n()Lfdn;
    .registers 5

    iget-object p0, p0, Lydn;->l:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f14112f

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    const v0, 0x7f08074a

    sget-object v1, Lpt0;->b:Lpt0;

    const/4 v2, 0x0

    const-string v3, "DEFAULT"

    invoke-static {v2, v3, p0, v0, v1}, Lfdn;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILpt0;)Lfdn;

    move-result-object p0

    return-object p0
.end method

.method public final o()Lfdn;
    .registers 12

    iget-object p0, p0, Lydn;->l:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f14112f

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-instance v1, Lfdn;

    sget-object v5, Lpt0;->f:Lpt0;

    const/4 v6, 0x0

    const/4 v2, 0x0

    const-string v3, "DEFAULT"

    const v7, 0x7f08056b

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    invoke-direct/range {v1 .. v10}, Lfdn;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lpt0;ZIILfdn;Z)V

    return-object v1
.end method

.method public final p()Lwdn;
    .registers 2

    iget-object v0, p0, Lydn;->a:Lwdn;

    if-nez v0, :cond_b

    new-instance v0, Lwdn;

    invoke-direct {v0, p0}, Lwdn;-><init>(Lydn;)V

    iput-object v0, p0, Lydn;->a:Lwdn;

    :cond_b
    return-object v0
.end method

.method public final q()I
    .registers 2

    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    iget-object p0, p0, Lydn;->e:Lsgi;

    invoke-virtual {p0, v0}, Lsgi;->d(Z)I

    move-result p0

    return p0
.end method

.method public final r()I
    .registers 2

    iget-object v0, p0, Lydn;->d:Lvdn;

    invoke-virtual {v0}, Lvdn;->a()Z

    move-result v0

    iget-object p0, p0, Lydn;->e:Lsgi;

    invoke-virtual {p0, v0}, Lsgi;->d(Z)I

    move-result p0

    return p0
.end method

.method public final s()V
    .registers 2

    iget-object p0, p0, Lydn;->b:Lw7j;

    iget-object v0, p0, Lw7j;->b:Ljava/lang/Object;

    if-nez v0, :cond_17

    iget-object p0, p0, Lw7j;->a:Ljava/lang/Object;

    check-cast p0, Laco;

    if-eqz p0, :cond_17

    iget-object v0, p0, Laco;->e:Lgfn;

    if-nez v0, :cond_17

    iget-boolean v0, p0, Laco;->i:Z

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Laco;->n()V

    :cond_17
    return-void
.end method

.method public final t(Ljava/lang/String;)Z
    .registers 3

    iget-object p0, p0, Lydn;->c:Lgfn;

    invoke-interface {p0}, Lgfn;->isEnabled()Z

    move-result p0

    if-nez p0, :cond_4f

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p0

    const-string v0, "file"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4f

    const-string v0, "data"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4f

    const-string v0, "content"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4f

    invoke-static {p1}, Lwqm;->A(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_4f

    invoke-static {p1}, Lwqm;->w(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_4f

    const-string p0, "market://"

    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_4f

    invoke-static {p1}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_4f

    invoke-static {p1}, LJ/N;->MpNM_Rhp(Ljava/lang/Object;)Z

    move-result p0

    const/4 v0, 0x1

    if-nez p0, :cond_4a

    return v0

    :cond_4a
    invoke-static {v0, p1}, LJ/N;->Mv_y608q(ZLjava/lang/Object;)Z

    move-result p0

    return p0

    :cond_4f
    const/4 p0, 0x0

    return p0
.end method

.method public final u()V
    .registers 5

    iget-object v0, p0, Lydn;->l:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v1, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "vpn.auto_enable_on_start"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_23

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lydn;->C(Z)V

    :cond_23
    return-void
.end method

.method public final v()V
    .registers 2

    iget-object p0, p0, Lydn;->t:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltdn;

    invoke-interface {v0}, Ltdn;->s()V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final x(Lpt3;Lqim;Lw7j;Lcom/opera/android/BrowserActivity;)V
    .registers 8

    iput-object p4, p0, Lydn;->i:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lydn;->s:Lcnk;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lxmk;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Lxmk;-><init>(Lcnk;B)V

    sget-object v0, Lcak;->d:Lavj;

    const/4 v0, 0x4

    invoke-static {v0, v1}, Lavj;->g(ILjava/lang/Runnable;)V

    iget-object v0, p0, Lydn;->g:Li9c;

    iput-object p2, v0, Li9c;->f:Ljava/lang/Object;

    invoke-virtual {v0}, Li9c;->c()V

    iput-object p1, p0, Lydn;->L:Lpt3;

    iput-object p3, p0, Lydn;->P:Lw7j;

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p1, p0, Lydn;->l:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object p2

    iget-object p3, p0, Lydn;->y:Lkv1;

    invoke-virtual {p2, p3}, Lq6e;->a(Lkri;)V

    iget-object p2, p2, Lq6e;->a:Ljava/util/ArrayList;

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    invoke-virtual {p0, p2}, Lydn;->G(Ljava/util/List;)V

    iget-object p2, p0, Lydn;->o:Lufn;

    iget-object p3, p0, Lydn;->z:Lvy;

    invoke-virtual {p2, p3}, Lno7;->g(Lmo7;)V

    iget-object p2, p0, Lydn;->p:Ltvg;

    invoke-virtual {p2, p3}, Lno7;->g(Lmo7;)V

    iget-object p2, p0, Lydn;->m:Lcom/opera/android/settings/SettingsManager;

    iget-object p3, p0, Lydn;->C:Lj25;

    invoke-virtual {p2, p3}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    iget-object p2, p0, Lydn;->D:Lx53;

    invoke-virtual {p1, p2}, Lru9;->a(Ln1;)V

    invoke-virtual {p0}, Lydn;->z()V

    invoke-virtual {p4}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    iget-object p2, p0, Lydn;->b:Lw7j;

    iget-object p3, p2, Lw7j;->b:Ljava/lang/Object;

    if-nez p3, :cond_6c

    iget-object p2, p2, Lw7j;->a:Ljava/lang/Object;

    check-cast p2, Laco;

    if-eqz p2, :cond_6c

    invoke-virtual {p2, p1}, Laco;->o(Ltcc;)V

    :cond_6c
    invoke-virtual {p0}, Lydn;->s()V

    iget-object p1, p0, Lydn;->c:Lgfn;

    invoke-interface {p1}, Lgfn;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_9c

    iget-object p1, p0, Lydn;->I:Lefn;

    if-eqz p1, :cond_95

    iget-object p1, p0, Lydn;->P:Lw7j;

    if-eqz p1, :cond_9c

    iget-object p1, p1, Lw7j;->b:Ljava/lang/Object;

    check-cast p1, Lsz4;

    invoke-static {p1}, Lyi4;->T(Lsz4;)Z

    move-result p1

    if-eqz p1, :cond_9c

    iget-object p1, p0, Lydn;->P:Lw7j;

    new-instance p2, Lsdn;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lsdn;-><init>(Lydn;B)V

    invoke-virtual {p1, p2}, Lw7j;->n(Lsdn;)V

    goto :goto_9c

    :cond_95
    iget-byte p1, p0, Lydn;->H:B

    if-ne p1, v2, :cond_9c

    invoke-virtual {p0}, Lydn;->e()V

    :cond_9c
    :goto_9c
    invoke-virtual {p0}, Lydn;->u()V

    return-void
.end method

.method public final y(Lren;)V
    .registers 10

    iget-object v0, p0, Lydn;->F:Lren;

    invoke-interface {v0}, Lren;->c()I

    move-result v0

    iput v0, p0, Lydn;->G:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_30

    iget-object v0, p0, Lydn;->A:Lxdn;

    iget-wide v2, v0, Lxdn;->d:J

    iget-wide v4, v0, Lxdn;->c:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_30

    iput-wide v4, v0, Lxdn;->d:J

    iget-object v2, v0, Lxdn;->f:Lydn;

    iget-object v2, v2, Lydn;->c:Lgfn;

    iget-object v3, v0, Lxdn;->a:Ljava/lang/String;

    sget-object v6, Laik;->a:[Ljava/lang/String;

    const-string v6, ""

    if-nez v3, :cond_24

    move-object v3, v6

    :cond_24
    iget-object v0, v0, Lxdn;->b:Ljava/lang/String;

    if-eqz v0, :cond_29

    move-object v6, v0

    :cond_29
    invoke-interface {v2, v4, v5, v3, v6}, Lgfn;->a(JLjava/lang/String;Ljava/lang/String;)Lgfn;

    move-result-object v0

    invoke-interface {v0}, Lgfn;->d()V

    :cond_30
    iget-boolean v0, p0, Lydn;->K:Z

    const/4 v2, 0x3

    const/4 v3, 0x0

    if-eqz v0, :cond_3e

    iput-boolean v3, p0, Lydn;->K:Z

    iget v0, p0, Lydn;->G:I

    if-ne v0, v2, :cond_3e

    iput v3, p0, Lydn;->J:I

    :cond_3e
    invoke-virtual {p0}, Lydn;->O()V

    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-object v0, v0, Lvdn;->b:Lefn;

    const/4 v4, 0x1

    iget-object v5, p0, Lydn;->l:Landroid/content/Context;

    if-eqz v0, :cond_58

    iget v0, p0, Lydn;->G:I

    if-eqz v0, :cond_50

    if-ne v0, v1, :cond_58

    :cond_50
    invoke-static {v5}, Landroid/net/VpnService;->prepare(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    if-nez v0, :cond_58

    move v0, v4

    goto :goto_59

    :cond_58
    move v0, v3

    :goto_59
    sget-object v6, Lcom/opera/android/vpn/VpnFailedToConnectService;->c:Lbp;

    if-eqz v0, :cond_61

    invoke-virtual {v6, v5}, Lbp;->b0(Landroid/content/Context;)Z

    goto :goto_64

    :cond_61
    invoke-virtual {v6, v5}, Lbp;->c0(Landroid/content/Context;)V

    :goto_64
    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-object v0, v0, Lvdn;->b:Lefn;

    const/16 v5, 0x8

    const/4 v6, 0x0

    iget-object v7, p0, Lydn;->n:Lumi;

    if-eqz v0, :cond_98

    iget v0, p0, Lydn;->G:I

    if-eqz v0, :cond_75

    if-ne v0, v2, :cond_98

    :cond_75
    iget v0, p0, Lydn;->S:I

    if-eq v0, v1, :cond_c7

    new-instance v0, Lkoj;

    invoke-direct {v0, v5}, Lkoj;-><init>(B)V

    invoke-interface {v7, v0}, Ltcl;->a(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    invoke-virtual {v0, v6}, Lnml;->a(Ljava/lang/Object;)Loml;

    iget-object v0, p0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->j()Z

    move-result v5

    if-eqz v5, :cond_c7

    iput v2, p0, Lydn;->G:I

    new-instance p1, Lsdn;

    invoke-direct {p1, p0, v4}, Lsdn;-><init>(Lydn;B)V

    invoke-interface {v0, p1}, Lgfn;->g(Lcom/opera/api/Callback;)V

    return-void

    :cond_98
    iget v0, p0, Lydn;->G:I

    const/4 v2, 0x2

    const/4 v4, 0x5

    if-ne v0, v2, :cond_bd

    new-instance v0, Lkoj;

    invoke-direct {v0, v5}, Lkoj;-><init>(B)V

    invoke-interface {v7, v0}, Ltcl;->a(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    invoke-virtual {v0, v6}, Lnml;->a(Ljava/lang/Object;)Loml;

    iget-object v0, p0, Lydn;->O:Lktf;

    iget-object v2, v0, Lktf;->f:Loml;

    if-eqz v2, :cond_c7

    iget-object v2, p0, Lydn;->d:Lvdn;

    iget-object v2, v2, Lvdn;->b:Lefn;

    new-instance v5, Lrdn;

    invoke-direct {v5, p0, v4}, Lrdn;-><init>(Lydn;B)V

    invoke-virtual {v0, v2, v5}, Lktf;->a(Lefn;Ljava/lang/Runnable;)V

    goto :goto_c7

    :cond_bd
    if-ne v0, v4, :cond_c7

    iget v0, p0, Lydn;->S:I

    if-eq v0, v1, :cond_c7

    invoke-virtual {p0, v3}, Lydn;->C(Z)V

    return-void

    :cond_c7
    :goto_c7
    iget v0, p0, Lydn;->G:I

    if-eqz v0, :cond_cd

    if-ne v0, v1, :cond_e7

    :cond_cd
    iget v0, p0, Lydn;->S:I

    if-ne v0, v1, :cond_d6

    const/16 p1, -0x49

    iput p1, p0, Lydn;->J:I

    goto :goto_e7

    :cond_d6
    invoke-interface {p1}, Lren;->e()Lsen;

    move-result-object p1

    if-eqz p1, :cond_e5

    iget v0, p1, Lsen;->a:I

    iput v0, p0, Lydn;->J:I

    iget-boolean p1, p1, Lsen;->b:Z

    iput-boolean p1, p0, Lydn;->K:Z

    goto :goto_e7

    :cond_e5
    iput v3, p0, Lydn;->J:I

    :cond_e7
    :goto_e7
    iget-object p1, p0, Lydn;->d:Lvdn;

    iget-boolean p1, p1, Lvdn;->a:Z

    iget v0, p0, Lydn;->G:I

    iget-object v1, p0, Lydn;->e:Lsgi;

    invoke-virtual {v1, v0, p1}, Lsgi;->I(IZ)V

    invoke-virtual {p0}, Lydn;->v()V

    return-void
.end method

.method public final z()V
    .registers 5

    iget-boolean v0, p0, Lydn;->h:Z

    if-eqz v0, :cond_25

    iget-wide v0, p0, Lydn;->j:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_25

    iget-object v0, p0, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    invoke-virtual {p0}, Lydn;->m()I

    move-result v1

    iget-object v2, p0, Lydn;->e:Lsgi;

    invoke-virtual {v2, v1, v0}, Lsgi;->I(IZ)V

    new-instance v0, Lrdn;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lrdn;-><init>(Lydn;B)V

    invoke-static {v0}, LJ/N;->MIX3UmS0(Ljava/lang/Object;)J

    move-result-wide v0

    iput-wide v0, p0, Lydn;->j:J

    :cond_25
    return-void
.end method
