.class public final Lwpp;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/HashMap;

.field public final b:Ljava/util/HashSet;

.field public final c:Ljava/util/HashMap;

.field public final d:Ljava/util/HashMap;

.field public final e:Ljava/util/HashMap;

.field public final f:Ljava/util/HashMap;

.field public final g:Lmbi;

.field public final h:Ljava/lang/String;

.field public final i:Lplk;

.field public final j:Ljava/util/concurrent/ConcurrentLinkedQueue;

.field public final k:F

.field public final l:Ljava/util/concurrent/ExecutorService;

.field public final m:Lcom/google/ads/interactivemedia/v3/impl/data/TestingConfiguration;

.field public final n:Lcom/google/android/gms/tasks/TaskCompletionSource;

.field public final o:Lcom/google/android/gms/tasks/TaskCompletionSource;

.field public p:Loam;

.field public q:Lrqp;

.field public r:J

.field public s:Z


# direct methods
.method public constructor <init>(Lplk;Lmbi;Landroid/net/Uri;Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;Ljava/util/concurrent/ExecutorService;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lwpp;->a:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lwpp;->b:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lwpp;->c:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lwpp;->d:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lwpp;->e:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lwpp;->f:Ljava/util/HashMap;

    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lwpp;->j:Ljava/util/concurrent/ConcurrentLinkedQueue;

    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    iput-object v0, p0, Lwpp;->n:Lcom/google/android/gms/tasks/TaskCompletionSource;

    new-instance v1, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v1}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    iput-object v1, p0, Lwpp;->o:Lcom/google/android/gms/tasks/TaskCompletionSource;

    const/4 v2, 0x0

    iput-boolean v2, p0, Lwpp;->s:Z

    iput-object p2, p0, Lwpp;->g:Lmbi;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    iput v2, p0, Lwpp;->k:F

    const-string v2, "WEB_MESSAGE_LISTENER"

    invoke-static {v2}, Laxn;->b(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {p3}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p3

    const-string v3, "sdk_version"

    const-string v4, "a.3.31.0"

    invoke-virtual {p3, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p3

    const-string v3, "hl"

    invoke-interface {p4}, Lhva;->getLanguage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p3, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p3

    const-string v3, "omv"

    const-string v4, "1.4.8-google_20230803"

    invoke-virtual {p3, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p3

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p2

    const-string v3, "app"

    invoke-virtual {p3, v3, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    const/4 p3, 0x1

    if-eq p3, v2, :cond_8b

    const-string p3, "0"

    goto :goto_8d

    :cond_8b
    const-string p3, "4"

    :goto_8d
    const-string v2, "mt"

    invoke-virtual {p2, v2, p3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-interface {p4}, Lhva;->getTestingConfig()Lcom/google/ads/interactivemedia/v3/impl/data/TestingConfiguration;

    move-result-object p3

    if-eqz p3, :cond_d1

    new-instance p3, Lcom/google/ads/interactivemedia/v3/internal/zztt;

    invoke-direct {p3}, Lcom/google/ads/interactivemedia/v3/internal/zztt;-><init>()V

    new-instance v2, Lcom/google/ads/interactivemedia/v3/internal/zzoh;

    invoke-direct {v2}, Lcom/google/ads/interactivemedia/v3/internal/zzoh;-><init>()V

    iget-object v3, p3, Lcom/google/ads/interactivemedia/v3/internal/zztt;->d:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Lcom/google/ads/interactivemedia/v3/internal/zzog;

    invoke-direct {v2}, Lcom/google/ads/interactivemedia/v3/internal/zzog;-><init>()V

    iget-object v3, p3, Lcom/google/ads/interactivemedia/v3/internal/zztt;->a:Lcom/google/ads/interactivemedia/v3/internal/zzvt;

    invoke-virtual {v3}, Lcom/google/ads/interactivemedia/v3/internal/zzvt;->c()Lcom/google/ads/interactivemedia/v3/internal/zzvt;

    move-result-object v4

    new-instance v5, Ljava/util/ArrayList;

    iget-object v3, v3, Lcom/google/ads/interactivemedia/v3/internal/zzvt;->a:Ljava/util/List;

    invoke-direct {v5, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v5, v4, Lcom/google/ads/interactivemedia/v3/internal/zzvt;->a:Ljava/util/List;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-object v4, p3, Lcom/google/ads/interactivemedia/v3/internal/zztt;->a:Lcom/google/ads/interactivemedia/v3/internal/zzvt;

    invoke-virtual {p3}, Lcom/google/ads/interactivemedia/v3/internal/zztt;->a()Lcom/google/ads/interactivemedia/v3/internal/zzts;

    move-result-object p3

    invoke-interface {p4}, Lhva;->getTestingConfig()Lcom/google/ads/interactivemedia/v3/impl/data/TestingConfiguration;

    move-result-object v2

    invoke-virtual {p3, v2}, Lcom/google/ads/interactivemedia/v3/internal/zzts;->d(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    const-string v2, "tcnfp"

    invoke-virtual {p2, v2, p3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_d1
    invoke-virtual {p2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lwpp;->h:Ljava/lang/String;

    invoke-interface {p4}, Lhva;->getTestingConfig()Lcom/google/ads/interactivemedia/v3/impl/data/TestingConfiguration;

    move-result-object p2

    iput-object p2, p0, Lwpp;->m:Lcom/google/ads/interactivemedia/v3/impl/data/TestingConfiguration;

    iput-object p1, p0, Lwpp;->i:Lplk;

    iput-object p0, p1, Lplk;->c:Ljava/lang/Object;

    iput-object p5, p0, Lwpp;->l:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {v1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p2

    filled-new-array {p1, p2}, [Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->whenAllComplete([Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lppp;

    invoke-direct {p2, p0}, Lppp;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method


# virtual methods
.method public final a(Lwmb;)V
    .registers 6

    iget-object v0, p1, Lwmb;->a:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;

    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    iget-object v0, p1, Lwmb;->d:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    iget-object v0, p0, Lwpp;->j:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    iget-boolean p1, p0, Lwpp;->s:Z

    if-eqz p1, :cond_35

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwmb;

    :goto_19
    if-eqz p1, :cond_35

    iget-object v1, p0, Lwpp;->i:Lplk;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lwr9;

    const/16 v3, 0x1d

    invoke-direct {v2, v1, p1, v3}, Lwr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, v1, Lplk;->b:Ljava/lang/Object;

    check-cast p1, Landroid/os/Handler;

    invoke-virtual {p1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwmb;

    goto :goto_19

    :cond_35
    return-void
.end method

.method public final b(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;Ljava/lang/String;Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;)V
    .registers 33

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p4

    iget-object v1, v1, Lwpp;->f:Ljava/util/HashMap;

    move-object/from16 v3, p3

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkqp;

    if-nez v1, :cond_19

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    return-void

    :cond_19
    iget-object v3, v1, Lkqp;->e:Lvsp;

    iget-object v4, v1, Lkqp;->a:Lt9l;

    iget-object v5, v1, Lkqp;->f:Lcom/google/ads/interactivemedia/v3/internal/zzpn;

    invoke-virtual {v5, v0}, Lcom/google/ads/interactivemedia/v3/internal/zzpn;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljn;

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    const/16 v8, 0x22

    const/4 v9, 0x0

    const/4 v10, 0x1

    if-eq v7, v8, :cond_1ea

    const/16 v8, 0x2b

    const/16 v11, 0x11

    const/4 v12, 0x0

    if-eq v7, v8, :cond_147

    const/16 v1, 0x49

    if-eq v7, v1, :cond_1ea

    const/16 v0, 0x35

    if-eq v7, v0, :cond_e0

    const/16 v0, 0x36

    if-ne v7, v0, :cond_146

    iget-object v0, v4, Lt9l;->a:Ljava/lang/Object;

    check-cast v0, Ljn;

    if-ne v0, v6, :cond_dd

    iget-object v0, v4, Lt9l;->b:Ljava/lang/Object;

    check-cast v0, Lujo;

    iget-short v1, v0, Lujo;->c:S

    and-int/2addr v1, v10

    if-eqz v1, :cond_ac

    iget-object v1, v0, Lujo;->a:Lqi8;

    invoke-interface {v1, v10}, Lgig;->setPlayWhenReady(Z)V

    iget-wide v1, v0, Lujo;->g:J

    const-wide/16 v5, 0x0

    cmp-long v1, v1, v5

    if-gtz v1, :cond_7e

    iget-object v1, v0, Lujo;->d:Ln9h;

    if-eqz v1, :cond_aa

    iget-object v2, v1, Ln9h;->c:Ljava/lang/Object;

    check-cast v2, Ljn;

    if-eqz v2, :cond_aa

    iget-object v1, v1, Ln9h;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_70
    if-ge v12, v2, :cond_aa

    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v12, v12, 0x1

    check-cast v5, Lvsp;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_70

    :cond_7e
    iput-wide v5, v0, Lujo;->g:J

    iget-object v1, v0, Lujo;->d:Ln9h;

    if-eqz v1, :cond_aa

    iget-object v2, v1, Ln9h;->c:Ljava/lang/Object;

    check-cast v2, Ljn;

    if-eqz v2, :cond_aa

    iget-object v2, v1, Ln9h;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    :cond_92
    :goto_92
    if-ge v12, v5, :cond_aa

    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v12, v12, 0x1

    check-cast v6, Lvsp;

    iget-object v7, v1, Ln9h;->c:Ljava/lang/Object;

    check-cast v7, Ljn;

    iget-boolean v8, v6, Lvsp;->c:Z

    if-eqz v8, :cond_92

    sget-object v8, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->play:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    invoke-virtual {v6, v8, v7, v9}, Lvsp;->a(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;Ljn;Ljava/lang/Object;)V

    goto :goto_92

    :cond_aa
    iput-short v11, v0, Lujo;->c:S

    :cond_ac
    iget-object v0, v4, Lt9l;->c:Ljava/lang/Object;

    check-cast v0, Ld7h;

    if-nez v0, :cond_bf

    new-instance v0, Ld7h;

    new-instance v1, Ldgo;

    const/4 v2, 0x2

    invoke-direct {v1, v4, v2}, Ldgo;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Ld7h;-><init>(Ldgo;)V

    iput-object v0, v4, Lt9l;->c:Ljava/lang/Object;

    :cond_bf
    iget-object v1, v0, Ld7h;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/Timer;

    if-nez v1, :cond_dd

    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    iput-object v1, v0, Ld7h;->b:Ljava/lang/Object;

    new-instance v5, Lu71;

    invoke-direct {v5, v0, v10}, Lu71;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v0, Ld7h;->b:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Ljava/util/Timer;

    const-wide/16 v6, 0xfa

    const-wide/16 v8, 0xfa

    invoke-virtual/range {v4 .. v9}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    :cond_dd
    iput-boolean v10, v3, Lvsp;->c:Z

    return-void

    :cond_e0
    iget-object v0, v4, Lt9l;->a:Ljava/lang/Object;

    check-cast v0, Ljn;

    if-ne v0, v6, :cond_146

    iget-object v0, v4, Lt9l;->b:Ljava/lang/Object;

    check-cast v0, Lujo;

    iget-object v1, v0, Lujo;->a:Lqi8;

    iget-short v2, v0, Lujo;->c:S

    and-int/2addr v2, v10

    if-eqz v2, :cond_12e

    invoke-virtual {v1}, Lg83;->e0()Z

    move-result v2

    if-eqz v2, :cond_12e

    invoke-interface {v1, v12}, Lgig;->setPlayWhenReady(Z)V

    invoke-virtual {v1}, Lqi8;->getCurrentPosition()J

    move-result-wide v1

    iput-wide v1, v0, Lujo;->g:J

    iget-object v1, v0, Lujo;->d:Ln9h;

    if-eqz v1, :cond_12a

    iget-object v2, v1, Ln9h;->c:Ljava/lang/Object;

    check-cast v2, Ljn;

    if-eqz v2, :cond_12a

    iget-object v2, v1, Ln9h;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    :cond_112
    :goto_112
    if-ge v12, v3, :cond_12a

    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v12, v12, 0x1

    check-cast v5, Lvsp;

    iget-object v6, v1, Ln9h;->c:Ljava/lang/Object;

    check-cast v6, Ljn;

    iget-boolean v7, v5, Lvsp;->c:Z

    if-eqz v7, :cond_112

    sget-object v7, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->pause:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    invoke-virtual {v5, v7, v6, v9}, Lvsp;->a(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;Ljn;Ljava/lang/Object;)V

    goto :goto_112

    :cond_12a
    const/16 v1, 0x21

    iput-short v1, v0, Lujo;->c:S

    :cond_12e
    iget-object v0, v4, Lt9l;->c:Ljava/lang/Object;

    check-cast v0, Ld7h;

    if-eqz v0, :cond_146

    iget-object v1, v0, Ld7h;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/Timer;

    if-eqz v1, :cond_146

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    iget-object v1, v0, Ld7h;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->purge()I

    iput-object v9, v0, Ld7h;->b:Ljava/lang/Object;

    :cond_146
    return-void

    :cond_147
    if-eqz v2, :cond_1d8

    iget-object v2, v2, Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;->videoUrl:Ljava/lang/String;

    if-eqz v2, :cond_1d8

    iput-boolean v10, v3, Lvsp;->c:Z

    new-instance v1, Ljn;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v5, v0, v1}, Lcom/google/ads/interactivemedia/v3/internal/zzpn;->j(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v1, v4, Lt9l;->a:Ljava/lang/Object;

    iget-object v0, v4, Lt9l;->b:Ljava/lang/Object;

    check-cast v0, Lujo;

    sget-object v3, Lqjd;->h:Lqjd;

    new-instance v3, Lfjd;

    invoke-direct {v3}, Lfjd;-><init>()V

    new-instance v5, Lijd;

    invoke-direct {v5}, Lijd;-><init>()V

    sget-object v18, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    sget-object v6, Lh1b;->b:La1b;

    sget-object v20, Lcsh;->e:Lcsh;

    new-instance v6, Lkjd;

    invoke-direct {v6}, Lkjd;-><init>()V

    sget-object v27, Lnjd;->d:Lnjd;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v14

    iget-object v2, v5, Lijd;->e:Ljava/lang/Object;

    check-cast v2, Landroid/net/Uri;

    if-eqz v2, :cond_187

    iget-object v2, v5, Lijd;->d:Ljava/lang/Object;

    check-cast v2, Ljava/util/UUID;

    if-nez v2, :cond_187

    move v10, v12

    :cond_187
    invoke-static {v10}, Lz4o;->H(Z)V

    if-eqz v14, :cond_1ab

    new-instance v13, Lmjd;

    iget-object v2, v5, Lijd;->d:Ljava/lang/Object;

    check-cast v2, Ljava/util/UUID;

    if-eqz v2, :cond_199

    new-instance v9, Ljjd;

    invoke-direct {v9, v5}, Ljjd;-><init>(Lijd;)V

    :cond_199
    move-object/from16 v16, v9

    const/4 v15, 0x0

    const/16 v17, 0x0

    const/16 v19, 0x0

    const-wide v21, -0x7fffffffffffffffL    # -4.9E-324

    invoke-direct/range {v13 .. v22}, Lmjd;-><init>(Landroid/net/Uri;Ljava/lang/String;Ljjd;Ldjd;Ljava/util/List;Ljava/lang/String;Lh1b;J)V

    move-object/from16 v24, v13

    goto :goto_1ad

    :cond_1ab
    move-object/from16 v24, v9

    :goto_1ad
    new-instance v21, Lqjd;

    new-instance v2, Lhjd;

    invoke-direct {v2, v3}, Lgjd;-><init>(Lfjd;)V

    new-instance v3, Lljd;

    invoke-direct {v3, v6}, Lljd;-><init>(Lkjd;)V

    sget-object v26, Lvjd;->K:Lvjd;

    const-string v22, ""

    move-object/from16 v23, v2

    move-object/from16 v25, v3

    invoke-direct/range {v21 .. v27}, Lqjd;-><init>(Ljava/lang/String;Lhjd;Lmjd;Lljd;Lvjd;Lnjd;)V

    move-object/from16 v2, v21

    iget-object v3, v0, Lujo;->a:Lqi8;

    invoke-virtual {v3, v2}, Lg83;->E(Lqjd;)V

    invoke-virtual {v3}, Lqi8;->a()V

    const/4 v2, 0x4

    iput-short v2, v0, Lujo;->c:S

    iget-object v0, v4, Lt9l;->d:Ljava/lang/Object;

    check-cast v0, Ln9h;

    iput-object v1, v0, Ln9h;->c:Ljava/lang/Object;

    return-void

    :cond_1d8
    iget-object v0, v1, Lkqp;->b:Ln9h;

    new-instance v1, Ljvg;

    new-instance v2, Ldm;

    const-string v3, "Load message must contain video url."

    invoke-direct {v2, v10, v10, v3}, Ldm;-><init>(IILjava/lang/String;)V

    invoke-direct {v1, v2, v11}, Ljvg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Ln9h;->p(Ljvg;)V

    return-void

    :cond_1ea
    iget-object v1, v4, Lt9l;->a:Ljava/lang/Object;

    check-cast v1, Ljn;

    if-ne v1, v6, :cond_21a

    iget-object v1, v4, Lt9l;->c:Ljava/lang/Object;

    check-cast v1, Ld7h;

    if-eqz v1, :cond_208

    iget-object v2, v1, Ld7h;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/Timer;

    if-eqz v2, :cond_208

    invoke-virtual {v2}, Ljava/util/Timer;->cancel()V

    iget-object v2, v1, Ld7h;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/Timer;

    invoke-virtual {v2}, Ljava/util/Timer;->purge()I

    iput-object v9, v1, Ld7h;->b:Ljava/lang/Object;

    :cond_208
    iget-object v1, v4, Lt9l;->b:Ljava/lang/Object;

    check-cast v1, Lujo;

    iget-short v2, v1, Lujo;->c:S

    and-int/2addr v2, v10

    if-eqz v2, :cond_21a

    iget-object v2, v1, Lujo;->a:Lqi8;

    invoke-virtual {v2}, Lqi8;->stop()V

    const/16 v2, 0x80

    iput-short v2, v1, Lujo;->c:S

    :cond_21a
    invoke-virtual {v5, v0}, Lcom/google/ads/interactivemedia/v3/internal/zzpn;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
