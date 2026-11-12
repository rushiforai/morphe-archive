.class public Lcom/opera/android/gcm/PushNotificationService;
.super Lilf;
.source "SourceFile"


# instance fields
.field public f:Lx5f;

.field public g:Lnbh;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Landroid/content/Intent;)V
    .registers 4

    invoke-static {p0}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_35

    iget-object v0, p0, Lcom/opera/android/gcm/PushNotificationService;->g:Lnbh;

    if-eqz v0, :cond_35

    sget-object v0, Lmdb;->a:Ljava/util/HashSet;

    if-eqz p1, :cond_13

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    if-eqz v0, :cond_35

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const-string v1, "com.opera.android.gcm.NEW_PUSH_NOTIFICATION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_35

    :try_start_22
    iget-object v0, p0, Lcom/opera/android/gcm/PushNotificationService;->g:Lnbh;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, p1, v1}, Lnbh;->a(Landroid/content/Context;Landroid/os/Bundle;Z)Lwbh;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/gcm/PushNotificationService;->f:Lx5f;

    invoke-static {v0, v1}, Lybh;->l(Lwbh;Lorm;)Z
    :try_end_2e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_22 .. :try_end_2e} :catch_2f

    return-void

    :catch_2f
    move-exception v0

    iget-object p0, p0, Lcom/opera/android/gcm/PushNotificationService;->f:Lx5f;

    invoke-static {p0, v0, p1}, Loup;->j0(Lorm;Ljava/lang/IllegalArgumentException;Landroid/os/Bundle;)V

    :cond_35
    return-void
.end method

.method public final onCreate()V
    .registers 5

    invoke-super {p0}, Lilf;->onCreate()V

    invoke-static {p0}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_a

    return-void

    :cond_a
    sget-object v0, Lvml;->d:Lumi;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    iput-object v1, p0, Lcom/opera/android/gcm/PushNotificationService;->f:Lx5f;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->d:Lx5f;

    new-instance v2, Lnbh;

    iget-object v3, p0, Lcom/opera/android/gcm/PushNotificationService;->f:Lx5f;

    invoke-direct {v2, p0, v0, v3, v1}, Lnbh;-><init>(Landroid/content/Context;Lumi;Lorm;Lskm;)V

    iput-object v2, p0, Lcom/opera/android/gcm/PushNotificationService;->g:Lnbh;

    invoke-static {p0}, Lhd;->o(Landroid/content/Context;)Lhd;

    return-void
.end method
