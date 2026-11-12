.class public final synthetic Lveh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llfh;


# direct methods
.method public synthetic constructor <init>(Llfh;B)V
    .registers 3

    iput-byte p2, p0, Lveh;->a:B

    iput-object p1, p0, Lveh;->b:Llfh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Lveh;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    iget-object p0, p0, Lveh;->b:Llfh;

    packed-switch v0, :pswitch_data_19e

    check-cast p1, Ljava/lang/Integer;

    iget-object v0, p0, Llfh;->k:Lpde;

    iget-object p0, p0, Llfh;->f:Lycc;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lxug;->i()V

    iget-object p0, p0, Lycc;->m:Lxcc;

    if-eqz p0, :cond_1f

    invoke-virtual {p0}, Lxcc;->a()Lud4;

    move-result-object v3

    :cond_1f
    if-eqz v3, :cond_3a

    check-cast v3, Lmr;

    iget-object p0, v3, Lmr;->b:Lxd4;

    invoke-interface {p0}, Lud4;->q()Z

    move-result p0

    if-ne p0, v4, :cond_3a

    new-instance p0, Lhfh;

    if-eqz p1, :cond_36

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne p1, v4, :cond_36

    move v2, v4

    :cond_36
    invoke-direct {p0, v2}, Lhfh;-><init>(Z)V

    goto :goto_3c

    :cond_3a
    sget-object p0, Lifh;->a:Lifh;

    :goto_3c
    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_42
    check-cast p1, Lcom/google/android/gms/common/moduleinstall/ModuleAvailabilityResponse;

    invoke-virtual {p1}, Lcom/google/android/gms/common/moduleinstall/ModuleAvailabilityResponse;->areModulesAvailable()Z

    move-result p1

    if-eqz p1, :cond_4e

    invoke-virtual {p0}, Llfh;->b()V

    goto :goto_85

    :cond_4e
    iget-object p1, p0, Llfh;->d:Landroid/content/Context;

    invoke-static {p1}, Lcom/google/android/gms/common/moduleinstall/ModuleInstall;->getClient(Landroid/content/Context;)Lcom/google/android/gms/common/moduleinstall/ModuleInstallClient;

    move-result-object p1

    new-instance v0, Lcom/google/android/gms/common/moduleinstall/ModuleInstallRequest$Builder;

    invoke-direct {v0}, Lcom/google/android/gms/common/moduleinstall/ModuleInstallRequest$Builder;-><init>()V

    iget-object v2, p0, Llfh;->e:Lysp;

    if-eqz v2, :cond_5e

    move-object v3, v2

    :cond_5e
    invoke-virtual {v0, v3}, Lcom/google/android/gms/common/moduleinstall/ModuleInstallRequest$Builder;->addApi(Lcom/google/android/gms/common/api/OptionalModuleApi;)Lcom/google/android/gms/common/moduleinstall/ModuleInstallRequest$Builder;

    move-result-object v0

    new-instance v2, Lkfh;

    invoke-direct {v2, p0, p1}, Lkfh;-><init>(Llfh;Lcom/google/android/gms/common/moduleinstall/ModuleInstallClient;)V

    invoke-virtual {v0, v2}, Lcom/google/android/gms/common/moduleinstall/ModuleInstallRequest$Builder;->setListener(Lcom/google/android/gms/common/moduleinstall/InstallStatusListener;)Lcom/google/android/gms/common/moduleinstall/ModuleInstallRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/moduleinstall/ModuleInstallRequest$Builder;->build()Lcom/google/android/gms/common/moduleinstall/ModuleInstallRequest;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/google/android/gms/common/moduleinstall/ModuleInstallClient;->installModules(Lcom/google/android/gms/common/moduleinstall/ModuleInstallRequest;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lweh;

    invoke-direct {v0, p0, v1}, Lweh;-><init>(Llfh;B)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lweh;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lweh;-><init>(Llfh;B)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCanceledListener(Lcom/google/android/gms/tasks/OnCanceledListener;)Lcom/google/android/gms/tasks/Task;

    :goto_85
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_88
    check-cast p1, Lndc;

    iget-object p1, p0, Llfh;->e:Lysp;

    if-nez p1, :cond_8f

    move-object p1, v3

    :cond_8f
    invoke-virtual {p1}, Lysp;->close()V

    iget-object p1, p0, Llfh;->f:Lycc;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lxug;->i()V

    iput-object v3, p1, Lycc;->G:Lndc;

    iput-object v3, p1, Lycc;->m:Lxcc;

    iget-object p1, p1, Lycc;->n:Lg1h;

    if-eqz p1, :cond_a9

    iget-object p1, p1, Lg1h;->a:Lf1h;

    iget-object p1, p1, Lf1h;->a:Lp12;

    invoke-virtual {p1}, Lp12;->A()V

    :cond_a9
    iget-object p1, p0, Llfh;->f:Lycc;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lxug;->i()V

    iget-object v0, p1, Lycc;->f:Lj3e;

    iput-object v3, p1, Lycc;->e:Ljava/util/concurrent/Executor;

    iput-object v3, p1, Lycc;->f:Lj3e;

    iget-object v2, p1, Lycc;->g:Lqva;

    iget-object v5, v2, Lqva;->s:Ljava/lang/Object;

    monitor-enter v5

    :try_start_bc
    iget-object v4, v2, Lqva;->t:Lrva;

    if-eqz v4, :cond_c3

    invoke-virtual {v4, v3, v3}, Lrva;->h(Ljava/util/concurrent/Executor;Llva;)V

    :cond_c3
    iget-object v4, v2, Lqva;->v:Lj3e;

    if-eqz v4, :cond_cc

    iput v1, v2, Lqrm;->d:I

    invoke-virtual {v2}, Lqrm;->s()V

    :cond_cc
    iput-object v3, v2, Lqva;->u:Ljava/util/concurrent/Executor;

    iput-object v3, v2, Lqva;->v:Lj3e;

    monitor-exit v5
    :try_end_d1
    .catchall {:try_start_bc .. :try_end_d1} :catchall_e5

    invoke-virtual {p1, v0, v3}, Lycc;->l(Lj3e;Lj3e;)V

    iget-object p1, p0, Llfh;->g:Lgcl;

    invoke-virtual {p1}, Lgcl;->a()V

    iget-object p0, p0, Llfh;->j:Lpde;

    sget-object p1, Ldfh;->a:Ldfh;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :goto_e3
    :try_start_e3
    monitor-exit v5
    :try_end_e4
    .catchall {:try_start_e3 .. :try_end_e4} :catchall_e5

    throw p0

    :catchall_e5
    move-exception p0

    goto :goto_e3

    :pswitch_e7
    check-cast p1, Lndc;

    iget-object p1, p0, Llfh;->j:Lpde;

    iget-object v0, p0, Llfh;->d:Landroid/content/Context;

    iget-object v5, p0, Llfh;->b:Lkotlin/jvm/functions/Function0;

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lt33;

    const-string v6, "You must provide a valid BarcodeScannerOptions."

    invoke-static {v5, v6}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lk3e;->c()Lk3e;

    move-result-object v6

    const-class v7, Lqsp;

    invoke-virtual {v6, v7}, Lk3e;->a(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lqsp;

    iget-object v7, v6, Lqsp;->a:Latp;

    new-instance v8, Lysp;

    invoke-virtual {v7, v5}, Lx4c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lmtp;

    iget-object v6, v6, Lqsp;->b:Lmg8;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v6, v6, Lmg8;->a:Ll7h;

    invoke-interface {v6}, Ll7h;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/concurrent/Executor;

    invoke-static {}, Lzpp;->c()Z

    move-result v9

    if-eq v4, v9, :cond_126

    const-string v9, "play-services-mlkit-barcode-scanning"

    goto :goto_128

    :cond_126
    const-string v9, "barcode-scanning"

    :goto_128
    invoke-static {v9}, Lcom/google/android/gms/internal/mlkit_vision_barcode/zzxa;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/mlkit_vision_barcode/zzwp;

    move-result-object v9

    invoke-direct {v8, v5, v7, v6, v9}, Lysp;-><init>(Lt33;Lmtp;Ljava/util/concurrent/Executor;Lcom/google/android/gms/internal/mlkit_vision_barcode/zzwp;)V

    iput-object v8, p0, Llfh;->e:Lysp;

    sget-object v5, Llfh;->l:[Ljava/lang/String;

    array-length v6, v5

    move v7, v2

    :goto_135
    if-ge v7, v6, :cond_14d

    aget-object v8, v5, v7

    invoke-static {v0, v8}, Lnb6;->h(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    if-nez v8, :cond_142

    add-int/lit8 v7, v7, 0x1

    goto :goto_135

    :cond_142
    new-instance p0, Lcfh;

    sget-object v0, Lzeh;->a:Lzeh;

    invoke-direct {p0, v0}, Lcfh;-><init>(Lbfh;)V

    invoke-virtual {p1, p0}, Lekc;->r(Ljava/lang/Object;)V

    goto :goto_19b

    :cond_14d
    sget-object v5, Llfh;->l:[Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v5

    if-nez v5, :cond_191

    sget-object v5, Lefh;->a:Lefh;

    invoke-virtual {p1, v5}, Lekc;->r(Ljava/lang/Object;)V

    invoke-static {v0}, Lcom/google/android/gms/common/moduleinstall/ModuleInstall;->getClient(Landroid/content/Context;)Lcom/google/android/gms/common/moduleinstall/ModuleInstallClient;

    move-result-object p1

    iget-object v0, p0, Llfh;->e:Lysp;

    if-eqz v0, :cond_167

    move-object v3, v0

    :cond_167
    new-array v0, v4, [Lcom/google/android/gms/common/api/OptionalModuleApi;

    aput-object v3, v0, v2

    invoke-interface {p1, v0}, Lcom/google/android/gms/common/moduleinstall/ModuleInstallClient;->areModulesAvailable([Lcom/google/android/gms/common/api/OptionalModuleApi;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lveh;

    invoke-direct {v0, p0, v1}, Lveh;-><init>(Llfh;B)V

    new-instance v1, Lr9g;

    const/16 v3, 0xd

    invoke-direct {v1, v0, v3}, Lr9g;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lweh;

    invoke-direct {v0, p0, v2}, Lweh;-><init>(Llfh;B)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lweh;

    invoke-direct {v0, p0, v4}, Lweh;-><init>(Llfh;B)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCanceledListener(Lcom/google/android/gms/tasks/OnCanceledListener;)Lcom/google/android/gms/tasks/Task;

    goto :goto_19b

    :cond_191
    new-instance p0, Lcfh;

    sget-object v0, Lyeh;->a:Lyeh;

    invoke-direct {p0, v0}, Lcfh;-><init>(Lbfh;)V

    invoke-virtual {p1, p0}, Lekc;->r(Ljava/lang/Object;)V

    :goto_19b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_19e
    .packed-switch 0x0
        :pswitch_e7
        :pswitch_88
        :pswitch_42
    .end packed-switch
.end method
