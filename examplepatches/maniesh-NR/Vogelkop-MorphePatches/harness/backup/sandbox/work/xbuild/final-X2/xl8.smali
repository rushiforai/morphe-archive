.class public abstract Lxl8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final a:Landroid/app/PendingIntent;

.field public final b:Landroid/content/Context;

.field public c:Z


# direct methods
.method public constructor <init>(Ldx3;Landroid/app/PendingIntent;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lxl8;->a:Landroid/app/PendingIntent;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lxl8;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a(Lsxh;)V
    .registers 6

    const/4 v0, 0x1

    iput-boolean v0, p0, Lxl8;->c:Z

    sget-boolean v0, Lcom/opera/android/browser/external/ExternalAppService;->b:Z

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lxl8;->b:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/opera/android/browser/external/ExternalAppService;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, "message"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "intent"

    iget-object p0, p0, Lxl8;->a:Landroid/app/PendingIntent;

    invoke-virtual {v0, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public final b(Ltcc;)V
    .registers 4

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-boolean p1, p0, Lxl8;->c:Z

    if-eqz p1, :cond_19

    sget-boolean p1, Lcom/opera/android/browser/external/ExternalAppService;->b:Z

    new-instance p1, Landroid/content/Intent;

    iget-object p0, p0, Lxl8;->b:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/opera/android/browser/external/ExternalAppService;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    :cond_19
    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p0, p1}, Lxl8;->b(Ltcc;)V

    return-void
.end method
