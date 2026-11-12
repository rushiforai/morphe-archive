.class public final Latf;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lbtf;Landroid/app/job/JobParameters;Ljava/lang/String;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Latf;->a:B

    .line 19
    iput-object p1, p0, Latf;->c:Ljava/lang/Object;

    .line 20
    invoke-direct {p0, p3}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/Thread;->setPriority(I)V

    .line 22
    iput-object p2, p0, Latf;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/ref/ReferenceQueue;Lceg;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Latf;->a:B

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    iput-object p1, p0, Latf;->b:Ljava/lang/Object;

    iput-object p2, p0, Latf;->c:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Ljava/lang/Thread;->setDaemon(Z)V

    const-string p1, "Picasso-refQueue"

    invoke-virtual {p0, p1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Latf;->a:B

    packed-switch v0, :pswitch_data_104

    iget-object v0, p0, Latf;->c:Ljava/lang/Object;

    check-cast v0, Lceg;

    const/16 v1, 0xa

    invoke-static {v1}, Landroid/os/Process;->setThreadPriority(I)V

    :goto_e
    :try_start_e
    iget-object v1, p0, Latf;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/ref/ReferenceQueue;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v1, v2, v3}, Ljava/lang/ref/ReferenceQueue;->remove(J)Ljava/lang/ref/Reference;

    move-result-object v1

    check-cast v1, Lbc;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v2

    if-eqz v1, :cond_2b

    const/4 v3, 0x3

    iput v3, v2, Landroid/os/Message;->what:I

    iget-object v1, v1, Lbc;->a:Ldc;

    iput-object v1, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_e

    :cond_2b
    invoke-virtual {v2}, Landroid/os/Message;->recycle()V
    :try_end_2e
    .catch Ljava/lang/InterruptedException; {:try_start_e .. :try_end_2e} :catch_3a
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_2e} :catch_2f

    goto :goto_e

    :catch_2f
    move-exception v1

    new-instance v2, Lvl9;

    const/16 v3, 0x15

    invoke-direct {v2, p0, v1, v3}, Lvl9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :catch_3a
    return-void

    :pswitch_3b
    iget-object v0, p0, Latf;->c:Ljava/lang/Object;

    check-cast v0, Lbtf;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    :try_start_44
    invoke-static {v0}, Lxf8;->Q(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_e2

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const-string v2, "eula_accepted.gdpr"

    invoke-virtual {v0, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_ce

    sget-object v0, Lh11;->j:Lh11;

    iget-object v2, p0, Latf;->c:Ljava/lang/Object;

    check-cast v2, Lbtf;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Latf;->c:Ljava/lang/Object;

    check-cast v3, Lbtf;

    iget-boolean v3, v3, Lbtf;->b:Z

    invoke-virtual {v0, v2, v3}, Lz43;->D(Landroid/content/Context;Z)Z

    move-result v1

    iget-object v0, p0, Latf;->c:Ljava/lang/Object;

    check-cast v0, Lbtf;

    iget-boolean v2, v0, Lbtf;->b:Z

    if-eqz v2, :cond_af

    sget-object v2, Laxh;->j:Laxh;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v3, p0, Latf;->c:Ljava/lang/Object;

    check-cast v3, Lbtf;

    iget-boolean v3, v3, Lbtf;->b:Z

    invoke-virtual {v2, v0, v3}, Lz43;->D(Landroid/content/Context;Z)Z

    sget-object v0, Ltc3;->j:Ltc3;

    iget-object v2, p0, Latf;->c:Ljava/lang/Object;

    check-cast v2, Lbtf;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Latf;->c:Ljava/lang/Object;

    check-cast v3, Lbtf;

    iget-boolean v3, v3, Lbtf;->b:Z

    invoke-virtual {v0, v2, v3}, Lz43;->D(Landroid/content/Context;Z)Z

    sget-object v0, Lbe7;->j:Lbe7;

    iget-object v2, p0, Latf;->c:Ljava/lang/Object;

    check-cast v2, Lbtf;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Latf;->c:Ljava/lang/Object;

    check-cast v3, Lbtf;

    iget-boolean v3, v3, Lbtf;->b:Z

    invoke-virtual {v0, v2, v3}, Lz43;->D(Landroid/content/Context;Z)Z

    :cond_af
    sget-object v0, Lcef;->j:Lcef;

    iget-object v2, p0, Latf;->c:Ljava/lang/Object;

    check-cast v2, Lbtf;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Latf;->c:Ljava/lang/Object;

    check-cast v3, Lbtf;

    iget-boolean v3, v3, Lbtf;->b:Z

    invoke-virtual {v0, v2, v3}, Lz43;->D(Landroid/content/Context;Z)Z

    sget-object v0, Lks3;->k:Lks3;

    iget-object v0, v0, Lks3;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0}, Lcom/opera/android/crashhandler/CrashReportProcessingService;->c(JLandroid/content/Context;)V

    goto :goto_e2

    :cond_ce
    sget-object v0, Lcef;->j:Lcef;

    iget-object v2, p0, Latf;->c:Ljava/lang/Object;

    check-cast v2, Lbtf;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Latf;->c:Ljava/lang/Object;

    check-cast v3, Lbtf;

    iget-boolean v3, v3, Lbtf;->b:Z

    invoke-virtual {v0, v2, v3}, Lz43;->D(Landroid/content/Context;Z)Z

    move-result v1
    :try_end_e2
    .catchall {:try_start_44 .. :try_end_e2} :catchall_f2

    :cond_e2
    :goto_e2
    iget-object v0, p0, Latf;->c:Ljava/lang/Object;

    check-cast v0, Lbtf;

    iget-object p0, p0, Latf;->b:Ljava/lang/Object;

    check-cast p0, Landroid/app/job/JobParameters;

    invoke-virtual {v0, v1}, Lbtf;->b(Z)Z

    move-result v1

    invoke-virtual {v0, p0, v1}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    return-void

    :catchall_f2
    move-exception v0

    iget-object v2, p0, Latf;->c:Ljava/lang/Object;

    check-cast v2, Lbtf;

    iget-object p0, p0, Latf;->b:Ljava/lang/Object;

    check-cast p0, Landroid/app/job/JobParameters;

    invoke-virtual {v2, v1}, Lbtf;->b(Z)Z

    move-result v1

    invoke-virtual {v2, p0, v1}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    throw v0

    nop

    :pswitch_data_104
    .packed-switch 0x0
        :pswitch_3b
    .end packed-switch
.end method
