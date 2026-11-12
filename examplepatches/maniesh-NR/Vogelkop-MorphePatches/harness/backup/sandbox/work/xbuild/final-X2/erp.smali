.class public final Lerp;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lr40;

.field public final b:Landroid/content/IntentFilter;

.field public final c:Landroid/content/Context;

.field public final d:Ljava/util/HashSet;

.field public e:Lup1;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    new-instance v0, Lr40;

    const-string v1, "AppUpdateListenerRegistry"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lr40;-><init>(Ljava/lang/String;B)V

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "com.google.android.play.core.install.ACTION_INSTALL_STATUS"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lerp;->d:Ljava/util/HashSet;

    const/4 v2, 0x0

    iput-object v2, p0, Lerp;->e:Lup1;

    iput-object v0, p0, Lerp;->a:Lr40;

    iput-object v1, p0, Lerp;->b:Landroid/content/IntentFilter;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_27

    move-object p1, v0

    :cond_27
    iput-object p1, p0, Lerp;->c:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 7

    iget-object v0, p0, Lerp;->d:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v1

    iget-object v2, p0, Lerp;->c:Landroid/content/Context;

    if-nez v1, :cond_27

    iget-object v1, p0, Lerp;->e:Lup1;

    if-nez v1, :cond_27

    new-instance v1, Lup1;

    const/16 v3, 0x1a

    invoke-direct {v1, p0, v3}, Lup1;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lerp;->e:Lup1;

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x21

    iget-object v5, p0, Lerp;->b:Landroid/content/IntentFilter;

    if-lt v3, v4, :cond_24

    const/4 v3, 0x2

    invoke-virtual {v2, v1, v5, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_27

    :cond_24
    invoke-virtual {v2, v1, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_27
    :goto_27
    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_37

    iget-object v0, p0, Lerp;->e:Lup1;

    if-eqz v0, :cond_37

    invoke-virtual {v2, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lerp;->e:Lup1;

    :cond_37
    return-void
.end method
