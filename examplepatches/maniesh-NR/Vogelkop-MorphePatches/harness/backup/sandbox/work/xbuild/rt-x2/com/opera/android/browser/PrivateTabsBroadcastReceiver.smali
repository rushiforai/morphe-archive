.class public Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# static fields
.field public static a:Ljava/util/Random;

.field public static final b:Ljava/lang/Object;

.field public static c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static a(Landroid/content/Context;)V
    .registers 6

    const-string v0, "private_tabs_receiver"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "secret"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    sget-object v4, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->a:Ljava/util/Random;

    invoke-virtual {v4}, Ljava/util/Random;->nextInt()I

    move-result v4

    add-int/2addr v4, v2

    sput-boolean v1, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->c:Z

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 7

    invoke-static {p1}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_85

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p0

    const-string v0, "com.opera.android.ACTION_CLOSE_ALL_PRIVATE_TABS"

    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_85

    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p0

    if-eqz p0, :cond_85

    const-string p2, "com.opera.android.ARGUMENT"

    const/4 v0, 0x0

    invoke-virtual {p0, p2, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result p0

    sget-object p2, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->b:Ljava/lang/Object;

    monitor-enter p2

    :try_start_22
    sget-boolean v1, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->c:Z

    if-eqz v1, :cond_29

    invoke-static {p1}, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->a(Landroid/content/Context;)V

    :cond_29
    monitor-exit p2
    :try_end_2a
    .catchall {:try_start_22 .. :try_end_2a} :catchall_83

    const-string p2, "private_tabs_receiver"

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    const-string v1, "secret"

    invoke-interface {p2, v1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    if-ne p0, p2, :cond_85

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_60

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p2

    invoke-static {p1, p2}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object p1

    iget-object p1, p1, Lhi0;->b:Lfi0;

    const/4 v0, 0x7

    const/4 v1, 0x1

    const-wide/16 v2, 0x1

    invoke-virtual {p1, v0, v1, v2, v3}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, p2}, Lx5f;->U0(Lx56;)V

    :cond_60
    new-instance p0, Lx55;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    invoke-static {}, Laib;->t()Lwub;

    move-result-object p0

    const-string p1, "NotificationManagerProxyImpl.cancel(id)"

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object p1

    new-instance p2, Lbr;

    const/16 v0, 0x12

    const v1, 0x7f0a07d9

    invoke-direct {p2, p0, v1, v0}, Lbr;-><init>(Ljava/lang/Object;IB)V

    invoke-static {p1, p2}, Lwub;->N(Lorg/chromium/base/TraceEvent;Ljava/lang/Runnable;)V

    return-void

    :goto_81
    :try_start_81
    monitor-exit p2
    :try_end_82
    .catchall {:try_start_81 .. :try_end_82} :catchall_83

    throw p0

    :catchall_83
    move-exception p0

    goto :goto_81

    :cond_85
    return-void
.end method
