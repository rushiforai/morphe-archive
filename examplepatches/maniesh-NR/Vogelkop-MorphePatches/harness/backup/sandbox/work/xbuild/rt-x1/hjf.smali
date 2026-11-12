.class public abstract Lhjf;
.super Lfp1;
.source "SourceFile"

# interfaces
.implements Loi;


# instance fields
.field public final a:Ldll;

.field public b:Lsof;

.field public final c:Ljava/util/HashMap;

.field public final d:Llh;

.field public final e:Lxbf;

.field public f:Landroid/content/Context;

.field public g:Lcom/google/firebase/analytics/FirebaseAnalytics;

.field public h:Lsz4;

.field public i:Lgjf;


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Lfp1;-><init>()V

    new-instance v0, Ldll;

    invoke-direct {v0}, Ldll;-><init>()V

    iput-object v0, p0, Lhjf;->a:Ldll;

    new-instance v0, Lmi;

    sget-object v1, Lvml;->d:Lumi;

    invoke-direct {v0, p0, v1}, Lmi;-><init>(Lhjf;Lumi;)V

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lhjf;->c:Ljava/util/HashMap;

    new-instance v2, Llh;

    invoke-direct {v2}, Llh;-><init>()V

    iput-object v2, p0, Lhjf;->d:Llh;

    new-instance v2, Lxbf;

    invoke-direct {v2, p0, v1, v0}, Lxbf;-><init>(Lhjf;Lumi;Lmi;)V

    iput-object v2, p0, Lhjf;->e:Lxbf;

    return-void
.end method

.method public static v(Landroid/content/Context;)Ldll;
    .registers 2

    :goto_0
    instance-of v0, p0, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_14

    instance-of v0, p0, Lhjf;

    if-eqz v0, :cond_d

    check-cast p0, Lhjf;

    iget-object p0, p0, Lhjf;->a:Ldll;

    return-object p0

    :cond_d
    check-cast p0, Landroid/content/ContextWrapper;

    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    goto :goto_0

    :cond_14
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final A(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-virtual {p0}, Lhjf;->u()Lnzk;

    move-result-object v0

    invoke-virtual {v0, p1}, Lnzk;->a(Landroid/content/res/Configuration;)V

    invoke-super {p0, p1}, Lfp1;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Lhjf;->C()V

    return-void
.end method

.method public final B(Landroid/os/Bundle;)V
    .registers 8

    invoke-static {p0}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-super {p0, p1}, Landroidx/fragment/app/r;->onCreate(Landroid/os/Bundle;)V

    return-void

    :cond_a
    new-instance v0, Lsof;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    invoke-virtual {p0}, Lhjf;->u()Lnzk;

    move-result-object v2

    new-instance v3, Ljll;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Ljll;-><init>(Lhjf;B)V

    new-instance v4, Ljll;

    const/4 v5, 0x1

    invoke-direct {v4, p0, v5}, Ljll;-><init>(Lhjf;B)V

    invoke-direct {v0, v1, v2, v3, v4}, Lsof;-><init>(Lcom/opera/android/settings/SettingsManager;Lnzk;Ljll;Ljll;)V

    iput-object v0, p0, Lhjf;->b:Lsof;

    invoke-virtual {p0}, Lhjf;->u()Lnzk;

    move-result-object v0

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnzk;->a(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Lhjf;->w()I

    move-result v0

    invoke-virtual {p0, v0}, Lhjf;->setTheme(I)V

    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    new-instance v1, Ltll;

    invoke-virtual {p0}, Lfp1;->getDelegate()Lpp1;

    move-result-object v2

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    invoke-virtual {p0}, Lhjf;->y()Lqp2;

    move-result-object v3

    iget-object v4, p0, Lhjf;->a:Ldll;

    invoke-direct {v1, v2, v4, v3}, Ltll;-><init>(Lpp1;Ldll;Lqp2;)V

    invoke-virtual {v0, v1}, Landroid/view/LayoutInflater;->setFactory2(Landroid/view/LayoutInflater$Factory2;)V

    invoke-super {p0, p1}, Landroidx/fragment/app/r;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public C()V
    .registers 7

    invoke-virtual {p0}, Lhjf;->w()I

    move-result v0

    iget-object v1, p0, Lhjf;->a:Ldll;

    iget v1, v1, Ldll;->a:I

    if-eq v0, v1, :cond_9f

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    invoke-virtual {p0, v0}, Lhjf;->setTheme(I)V

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "androidx.appcompat.app.ResourcesFlusher"

    const-string v2, "flush"

    const-class v3, Landroid/content/res/Resources;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v1, v2, v3, v0}, Lmzg;->k(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Landroidx/appcompat/widget/AppCompatDrawableManager;->a()Landroidx/appcompat/widget/AppCompatDrawableManager;

    move-result-object v0

    const-string v1, "mResourceManager"

    invoke-static {v0, v1}, Lmzg;->h(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/ResourceManagerInternal;

    monitor-enter v0

    :try_start_3e
    const-string v1, "mTintLists"

    invoke-static {v0, v1}, Lmzg;->h(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "clear"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v1, v2, v4, v5}, Lmzg;->j(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "mDrawableCaches"

    invoke-static {v0, v1}, Lmzg;->h(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "clear"

    new-array v4, v3, [Ljava/lang/Class;

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v1, v2, v4, v5}, Lmzg;->j(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0
    :try_end_5e
    .catchall {:try_start_3e .. :try_end_5e} :catchall_a6

    const-string v0, "sColorStateCacheLock"

    const/4 v1, 0x0

    :try_start_61
    const-class v2, Landroidx/core/content/res/ResourcesCompat;

    sget-object v4, Landroidx/core/content/res/ResourcesCompat;->a:Ljava/lang/ThreadLocal;

    invoke-static {v2, v0}, Lmzg;->h(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0
    :try_end_69
    .catch Ljava/lang/ClassNotFoundException; {:try_start_61 .. :try_end_69} :catch_6b

    move-object v2, v0

    goto :goto_6c

    :catch_6b
    move-object v2, v1

    :goto_6c
    const-string v0, "sColorStateCaches"

    :try_start_6e
    const-class v4, Landroidx/core/content/res/ResourcesCompat;

    sget-object v5, Landroidx/core/content/res/ResourcesCompat;->a:Ljava/lang/ThreadLocal;

    invoke-static {v4, v0}, Lmzg;->h(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1
    :try_end_76
    .catch Ljava/lang/ClassNotFoundException; {:try_start_6e .. :try_end_76} :catch_76

    :catch_76
    monitor-enter v2

    :try_start_77
    const-string v0, "clear"

    new-array v4, v3, [Ljava/lang/Class;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1, v0, v4, v3}, Lmzg;->j(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v2
    :try_end_81
    .catchall {:try_start_77 .. :try_end_81} :catchall_a2

    iget-object v0, p0, Lhjf;->b:Lsof;

    invoke-virtual {v0}, Lsof;->a()V

    iget-object p0, p0, Lhjf;->a:Ldll;

    iget-object p0, p0, Ldll;->b:Li7f;

    new-instance v0, Lg7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    :goto_8f
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_9f

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcll;

    invoke-interface {p0}, Lcll;->K()V

    goto :goto_8f

    :cond_9f
    return-void

    :goto_a0
    :try_start_a0
    monitor-exit v2
    :try_end_a1
    .catchall {:try_start_a0 .. :try_end_a1} :catchall_a2

    throw p0

    :catchall_a2
    move-exception p0

    goto :goto_a0

    :goto_a4
    :try_start_a4
    monitor-exit v0
    :try_end_a5
    .catchall {:try_start_a4 .. :try_end_a5} :catchall_a6

    throw p0

    :catchall_a6
    move-exception p0

    goto :goto_a4
.end method

.method public final D(Landroid/content/Intent;Lni;)V
    .registers 6

    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const v1, 0xffff

    and-int/2addr v1, v0

    ushr-int/lit8 v0, v0, 0x10

    xor-int/2addr v1, v0

    iget-object v0, p0, Lhjf;->c:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, p1, v1}, Lxd5;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public E()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final attachBaseContext(Landroid/content/Context;)V
    .registers 3

    iput-object p1, p0, Lhjf;->f:Landroid/content/Context;

    invoke-static {p1}, Lwwc;->g(Landroid/content/Context;)Ljava/util/Locale;

    move-result-object v0

    invoke-static {p1, v0}, Lwwc;->h(Landroid/content/Context;Ljava/util/Locale;)Landroid/content/Context;

    move-result-object p1

    invoke-super {p0, p1}, Lfp1;->attachBaseContext(Landroid/content/Context;)V

    invoke-static {p0}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_16

    invoke-static {p0}, Ln0k;->a(Landroid/content/Context;)V

    :cond_16
    return-void
.end method

.method public getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    const-string v0, "com.opera.android.ui.ACTIVITY_STARTER_SERVICE"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-object p0

    :cond_9
    const-string v0, "clipboard"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_1a
    const-string v0, "com.opera.android.permissions.PermissionHandlerService"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    iget-object p0, p0, Lhjf;->h:Lsz4;

    return-object p0

    :cond_25
    iget-object v0, p0, Lhjf;->f:Landroid/content/Context;

    if-eqz v0, :cond_38

    const-string v0, "print"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object p0, p0, Lhjf;->f:Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_38
    const-string v0, "com.opera.android.graphics.MASK_PROVIDER_SERVICE"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_56

    iget-object p1, p0, Lhjf;->i:Lgjf;

    if-nez p1, :cond_55

    new-instance p1, Lgjf;

    iget-object v0, p0, Lhjf;->e:Lxbf;

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Lmi;

    invoke-virtual {v0}, Lmi;->a()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lgjf;-><init>(Lhjf;Lcom/opera/android/settings/SettingsManager;)V

    iput-object p1, p0, Lhjf;->i:Lgjf;

    :cond_55
    return-object p1

    :cond_56
    invoke-super {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 5

    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/r;->onActivityResult(IILandroid/content/Intent;)V

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object p0, p0, Lhjf;->c:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lni;

    if-eqz v0, :cond_1b

    invoke-interface {v0, p2, p3}, Lni;->a(ILandroid/content/Intent;)V

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1b
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-virtual {p0, p1}, Lhjf;->A(Landroid/content/res/Configuration;)V

    invoke-static {p0}, Lwwc;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object p1

    invoke-static {p0, p1}, Lwwc;->a(Landroid/content/ContextWrapper;Ljava/util/Locale;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 20

    move-object/from16 v1, p0

    invoke-virtual/range {p0 .. p1}, Lhjf;->B(Landroid/os/Bundle;)V

    invoke-static {v1}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_c

    return-void

    :cond_c
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v6, 0x0

    invoke-static {v0, v6}, Locp;->p(Landroid/view/Window;Z)V

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lmdb;->f(Landroid/content/Intent;)V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const-string v3, "eula_accepted.gdpr"

    invoke-virtual {v0, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->h()Lr65;

    move-result-object v4

    iget-object v5, v2, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Llpe;

    if-eqz v0, :cond_bd

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v7

    const-string v0, "ga_usage_statistics"

    invoke-virtual {v7, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b6

    invoke-static {v1}, Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;

    move-result-object v0

    iput-object v0, v1, Lhjf;->g:Lcom/google/firebase/analytics/FirebaseAnalytics;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v8, v0, Ld6j;->d:Lx5f;

    iget-object v9, v1, Lhjf;->g:Lcom/google/firebase/analytics/FirebaseAnalytics;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_69
    const-class v10, Lcom/google/firebase/analytics/FirebaseAnalytics;

    monitor-enter v10
    :try_end_6c
    .catch Ljava/lang/RuntimeException; {:try_start_69 .. :try_end_6c} :catch_96

    :try_start_6c
    iget-object v0, v9, Lcom/google/firebase/analytics/FirebaseAnalytics;->b:Llop;

    if-nez v0, :cond_87

    new-instance v11, Llop;

    sget-object v16, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v12, 0x64

    invoke-direct {v0, v12}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    const/4 v13, 0x1

    const-wide/16 v14, 0x1e

    const/4 v12, 0x0

    move-object/from16 v17, v0

    invoke-direct/range {v11 .. v17}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v11, v9, Lcom/google/firebase/analytics/FirebaseAnalytics;->b:Llop;

    move-object v0, v11

    :cond_87
    monitor-exit v10
    :try_end_88
    .catchall {:try_start_6c .. :try_end_88} :catchall_94

    :try_start_88
    new-instance v10, Ly97;

    invoke-direct {v10, v9}, Ly97;-><init>(Lcom/google/firebase/analytics/FirebaseAnalytics;)V

    invoke-static {v0, v10}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0
    :try_end_91
    .catch Ljava/lang/RuntimeException; {:try_start_88 .. :try_end_91} :catch_96

    goto :goto_a6

    :goto_92
    :try_start_92
    monitor-exit v10
    :try_end_93
    .catchall {:try_start_92 .. :try_end_93} :catchall_94

    :try_start_93
    throw v0
    :try_end_94
    .catch Ljava/lang/RuntimeException; {:try_start_93 .. :try_end_94} :catch_96

    :catchall_94
    move-exception v0

    goto :goto_92

    :catch_96
    move-exception v0

    iget-object v10, v9, Lcom/google/firebase/analytics/FirebaseAnalytics;->a:Lcom/google/android/gms/internal/measurement/zzez;

    const-string v12, "Failed to schedule task for getAppInstanceId"

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/4 v11, 0x5

    const/4 v13, 0x0

    invoke-virtual/range {v10 .. v15}, Lcom/google/android/gms/internal/measurement/zzez;->zzD(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    :goto_a6
    new-instance v9, Lxl6;

    const/4 v10, 0x3

    invoke-direct {v9, v8, v10}, Lxl6;-><init>(Lx5f;B)V

    invoke-virtual {v0, v9}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    new-instance v0, Ln49;

    iget-object v8, v1, Lhjf;->g:Lcom/google/firebase/analytics/FirebaseAnalytics;

    invoke-direct {v0, v8, v7, v1}, Ln49;-><init>(Lcom/google/firebase/analytics/FirebaseAnalytics;Lcom/opera/android/settings/SettingsManager;Lhjf;)V

    :cond_b6
    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v0

    invoke-virtual {v4, v0}, Lr65;->b(Z)V

    :cond_bd
    iget-object v0, v5, Llpe;->c:Lcq5;

    iget-object v2, v2, Lcom/opera/android/OperaApplication;->t:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lnx5;

    sget-boolean v2, Lxw1;->a:Z

    if-nez v2, :cond_dc

    const-string v2, "ga_usage_statistics"

    invoke-virtual {v3, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_dc

    move-object v2, v3

    move-object v3, v4

    move-object v4, v0

    new-instance v0, Lzw1;

    invoke-direct/range {v0 .. v5}, Lzw1;-><init>(Lhjf;Lcom/opera/android/settings/SettingsManager;Lr65;Lcq5;Lnx5;)V

    :cond_dc
    invoke-virtual {v1}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    const-string v2, "stats-lifecycle-tracker"

    invoke-virtual {v0, v2}, Landroidx/fragment/app/w;->F(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-nez v0, :cond_fb

    invoke-virtual {v1}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    invoke-static {v0, v0}, Lu35;->f(Landroidx/fragment/app/w;Landroidx/fragment/app/w;)Landroidx/fragment/app/a;

    move-result-object v0

    iget-object v2, v1, Lhjf;->d:Llh;

    const-string v3, "stats-lifecycle-tracker"

    const/4 v4, 0x1

    invoke-virtual {v0, v6, v2, v3, v4}, Landroidx/fragment/app/a;->e(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    invoke-virtual {v0}, Landroidx/fragment/app/a;->h()I

    :cond_fb
    invoke-static {v1}, Lwwc;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v0

    invoke-static {v1, v0}, Lwwc;->a(Landroid/content/ContextWrapper;Ljava/util/Locale;)V

    return-void
.end method

.method public onDestroy()V
    .registers 1

    invoke-super {p0}, Lfp1;->onDestroy()V

    invoke-virtual {p0}, Lxd5;->getViewModelStore()Lv7n;

    move-result-object p0

    invoke-virtual {p0}, Lv7n;->a()V

    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .registers 2

    invoke-super {p0, p1}, Lxd5;->onNewIntent(Landroid/content/Intent;)V

    invoke-static {p1}, Lmdb;->f(Landroid/content/Intent;)V

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    return-void
.end method

.method public final onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 5

    iget-object v0, p0, Lhjf;->h:Lsz4;

    if-eqz v0, :cond_d

    iget-object v0, v0, Lsz4;->a:Lg91;

    invoke-interface {v0, p1, p2, p3}, Lg91;->g(I[Ljava/lang/String;[I)Z

    move-result v0

    if-eqz v0, :cond_d

    return-void

    :cond_d
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/r;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    return-void
.end method

.method public bridge synthetic s()Lfi;
    .registers 1

    invoke-virtual {p0}, Lhjf;->t()Lijf;

    move-result-object p0

    return-object p0
.end method

.method public setTheme(I)V
    .registers 6

    invoke-super {p0, p1}, Lfp1;->setTheme(I)V

    invoke-static {p0}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_a

    return-void

    :cond_a
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lc7j;->values()[Lc7j;

    move-result-object v2

    const-string v3, "app_font"

    invoke-virtual {v1, v3}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v1

    aget-object v1, v2, v1

    sget-object v2, Lc7j;->b:Lc7j;

    const/4 v3, 0x1

    if-ne v1, v2, :cond_30

    move v1, v3

    goto :goto_31

    :cond_30
    const/4 v1, 0x0

    :goto_31
    invoke-static {v0, v1}, Lozk;->a(Landroid/content/res/Resources$Theme;Z)V

    invoke-static {}, Li0l;->g()Z

    move-result v0

    if-eqz v0, :cond_44

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    const v1, 0x7f1501b1

    invoke-virtual {v0, v1, v3}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    :cond_44
    iget-object p0, p0, Lhjf;->a:Ldll;

    iput p1, p0, Ldll;->a:I

    return-void
.end method

.method public t()Lijf;
    .registers 1

    iget-object p0, p0, Lhjf;->e:Lxbf;

    return-object p0
.end method

.method public final u()Lnzk;
    .registers 2

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->c1:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnzk;

    return-object p0
.end method

.method public w()I
    .registers 3

    invoke-virtual {p0}, Lhjf;->z()Z

    move-result v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object p0

    const/16 v1, 0xc

    invoke-static {p0, v0, v1}, Lqbe;->A(Lg7j;ZI)I

    move-result p0

    return p0
.end method

.method public y()Lqp2;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final z()Z
    .registers 2

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {p0}, Lhjf;->u()Lnzk;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->P(Lnzk;)Z

    move-result p0

    return p0
.end method
