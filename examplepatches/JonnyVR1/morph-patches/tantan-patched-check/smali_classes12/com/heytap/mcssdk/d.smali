.class final Lcom/heytap/mcssdk/d;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field final synthetic a:Landroid/content/Intent;

.field final synthetic b:Lcom/heytap/mcssdk/PushManager;


# direct methods
.method public constructor <init>(Lcom/heytap/mcssdk/PushManager;Landroid/content/Intent;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/d;->b:Lcom/heytap/mcssdk/PushManager;

    iput-object p2, p0, Lcom/heytap/mcssdk/d;->a:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    iget-object v0, p0, Lcom/heytap/mcssdk/d;->a:Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :try_start_0
    invoke-static {p2}, Ll/uyl;->O(Landroid/os/IBinder;)Ll/vyl;

    move-result-object p2

    invoke-interface {p2, p1}, Ll/vyl;->i3(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "bindMcsService exception:"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/heytap/mcssdk/utils/LogUtil;->d(Ljava/lang/String;)V

    :goto_0
    iget-object p1, p0, Lcom/heytap/mcssdk/d;->b:Lcom/heytap/mcssdk/PushManager;

    invoke-static {p1}, Lcom/heytap/mcssdk/PushManager;->access$100(Lcom/heytap/mcssdk/PushManager;)Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    return-void
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    return-void
.end method
