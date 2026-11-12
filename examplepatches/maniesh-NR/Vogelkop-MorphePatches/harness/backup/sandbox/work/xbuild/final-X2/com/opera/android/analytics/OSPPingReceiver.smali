.class public Lcom/opera/android/analytics/OSPPingReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/HashSet;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ljava/util/HashSet;

    const-string v1, "android.intent.action.MY_PACKAGE_REPLACED"

    const-string v2, "com.opera.android.DELAYED_SYNC"

    const-string v3, "com.opera.android.action.APP_START"

    const-string v4, "android.intent.action.BOOT_COMPLETED"

    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/opera/android/analytics/OSPPingReceiver;->a:Ljava/util/HashSet;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static a(Landroid/content/Context;Llkk;Z)V
    .registers 6

    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.opera.android.DELAYED_SYNC"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-class v2, Lcom/opera/android/analytics/OSPPingReceiver;

    invoke-virtual {v1, p0, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "ui-sync"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p2

    if-eqz p1, :cond_2c

    const-string v1, "subject"

    iget-byte p1, p1, Llkk;->a:B

    invoke-virtual {p2, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    :cond_2c
    const/high16 p1, 0x4000000

    const/4 v1, 0x0

    invoke-static {p0, v1, p2, p1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p1

    const-wide/16 v1, 0x2710

    add-long/2addr p1, v1

    const/4 v1, 0x3

    invoke-virtual {v0, v1, p1, p2, p0}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 7

    invoke-static {p1}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_4a

    if-eqz p2, :cond_4a

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/opera/android/analytics/OSPPingReceiver;->a:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4a

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lxf8;->Q(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_4a

    const-string v0, "android.intent.action.MY_PACKAGE_REPLACED"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_4b

    invoke-static {p1}, Lxf8;->F(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object p0

    invoke-static {p1}, Lxf8;->G(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Landroid/content/ContentResolver;->cancelSync(Landroid/accounts/Account;Ljava/lang/String;)V

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string p2, "eula_accepted.gdpr"

    invoke-virtual {p0, p2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4a

    invoke-static {p1, v1, v2}, Lcom/opera/android/analytics/OSPPingReceiver;->a(Landroid/content/Context;Llkk;Z)V

    :cond_4a
    return-void

    :cond_4b
    const-string v0, "com.opera.android.DELAYED_SYNC"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_85

    invoke-static {p2}, Lmdb;->f(Landroid/content/Intent;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p0

    const/4 p2, 0x1

    if-eqz p0, :cond_66

    const-string v0, "ui-sync"

    invoke-virtual {p0, v0, p2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_66

    move p2, v2

    :cond_66
    if-eqz p0, :cond_74

    const-string v0, "subject"

    const/4 v3, -0x1

    invoke-virtual {p0, v0, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result p0

    invoke-static {p0}, Llkk;->d(I)Llkk;

    move-result-object p0

    goto :goto_75

    :cond_74
    move-object p0, v1

    :goto_75
    if-eqz p0, :cond_7b

    invoke-static {p1, p0, v2}, Lxf8;->n0(Landroid/content/Context;Llkk;Z)V

    return-void

    :cond_7b
    if-eqz p2, :cond_81

    invoke-static {p1, v1, v2}, Lxf8;->n0(Landroid/content/Context;Llkk;Z)V

    return-void

    :cond_81
    invoke-static {p1, v2}, Lxf8;->E(Landroid/content/Context;Z)V

    return-void

    :cond_85
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "com.opera.android.action.APP_START"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p1, p0}, Lxf8;->E(Landroid/content/Context;Z)V

    return-void
.end method
