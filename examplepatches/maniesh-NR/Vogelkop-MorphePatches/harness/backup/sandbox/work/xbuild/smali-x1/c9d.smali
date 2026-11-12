.class public final Lc9d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;B)V
    .registers 3

    iput-byte p2, p0, Lc9d;->a:B

    iput-object p1, p0, Lc9d;->b:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Lc9d;->a:B

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_7e

    iget-object p0, p0, Lc9d;->b:Landroid/content/Context;

    sget-object v0, Ln0k;->e:Ljava/util/concurrent/atomic/AtomicReference;

    :try_start_a
    invoke-static {p0}, Lcvp;->b(Landroid/content/Context;)Lcvp;

    move-result-object p0

    monitor-enter p0
    :try_end_f
    .catch Ljava/lang/SecurityException; {:try_start_a .. :try_end_f} :catch_1a

    :try_start_f
    iput-boolean v1, p0, Lcvp;->f:Z

    invoke-virtual {p0}, Lcvp;->a()V
    :try_end_14
    .catchall {:try_start_f .. :try_end_14} :catchall_18

    :try_start_14
    monitor-exit p0
    :try_end_15
    .catch Ljava/lang/SecurityException; {:try_start_14 .. :try_end_15} :catch_1a

    goto :goto_1a

    :goto_16
    :try_start_16
    monitor-exit p0
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_18

    :try_start_17
    throw v0
    :try_end_18
    .catch Ljava/lang/SecurityException; {:try_start_17 .. :try_end_18} :catch_1a

    :catchall_18
    move-exception v0

    goto :goto_16

    :catch_1a
    :goto_1a
    return-void

    :pswitch_1b
    iget-object p0, p0, Lc9d;->b:Landroid/content/Context;

    invoke-static {p0}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    return-void

    :pswitch_21
    iget-object p0, p0, Lc9d;->b:Landroid/content/Context;

    const/4 v0, 0x2

    invoke-static {v0, p0}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, LJ/N;->MDn2Nmkb(Ljava/lang/Object;)V

    sput-boolean v1, Lcom/opera/android/browser/obml/Platform;->c:Z

    sget-byte p0, Lcom/opera/android/browser/obml/Platform;->d:B

    if-eqz p0, :cond_3a

    sget-boolean p0, Lcom/opera/android/browser/obml/Platform;->c:Z

    if-eqz p0, :cond_3a

    const/16 p0, 0x8

    invoke-static {p0}, Lcak;->a(I)V

    :cond_3a
    return-void

    :pswitch_3b
    iget-object p0, p0, Lc9d;->b:Landroid/content/Context;

    invoke-static {p0}, Lr9n;->F(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_5b

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-wide/16 v2, 0x0

    invoke-static {p0, v0, v2, v3}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v0, :cond_7c

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v2, v0, 0x1

    if-eqz v2, :cond_7c

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_7c

    :cond_5b
    invoke-static {v1, p0}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x4

    invoke-static {v2, v0}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lgc7;->c:Lu1b;

    const-string v2, "oem_ofa_lenovo_tablet"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7c

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    new-instance v2, Landroid/content/ComponentName;

    const-string v3, "com.opera.android.WebSearchActivity"

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v2, v1, v1}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    :cond_7c
    return-void

    nop

    :pswitch_data_7e
    .packed-switch 0x0
        :pswitch_3b
        :pswitch_21
        :pswitch_1b
    .end packed-switch
.end method
