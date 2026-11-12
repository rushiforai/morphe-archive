.class public final Lcom/opera/android/browser/external/ExternalAppService;
.super Landroid/app/Service;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0007\u0018\u00002\u00020\u0001:\u0004\u0004\u0005\u0006\u0004B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/opera/android/browser/external/ExternalAppService;",
        "Landroid/app/Service;",
        "<init>",
        "()V",
        "yl8",
        "xl8",
        "wl8",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static b:Z


# instance fields
.field public final a:Lq65;


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    new-instance v0, Lbn7;

    const/16 v1, 0x11

    invoke-direct {v0, p0, v1}, Lbn7;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lq65;

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lcom/opera/android/browser/external/ExternalAppService;->a:Lq65;

    return-void
.end method


# virtual methods
.method public final onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onCreate()V
    .registers 5

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/opera/android/browser/external/ExternalAppService;->b:Z

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x22

    if-ge v0, v1, :cond_22

    sget-object v0, Lvml;->d:Lumi;

    sget-object v1, Lpn7;->b:Lon7;

    const/4 v1, 0x3

    sget-object v2, Lun7;->f:Lun7;

    invoke-static {v1, v2}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object p0, p0, Lcom/opera/android/browser/external/ExternalAppService;->a:Lq65;

    invoke-virtual {p0, v0, v1, v2, v3}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    :cond_22
    return-void
.end method

.method public final onDestroy()V
    .registers 1

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    iget-object p0, p0, Lcom/opera/android/browser/external/ExternalAppService;->a:Lq65;

    invoke-virtual {p0}, Ln1;->S()V

    const/4 p0, 0x0

    sput-boolean p0, Lcom/opera/android/browser/external/ExternalAppService;->b:Z

    return-void
.end method

.method public final onStartCommand(Landroid/content/Intent;II)I
    .registers 7

    new-instance p2, Lcm;

    const/4 p3, 0x5

    const/4 v0, 0x0

    const v1, 0x7f0a03b8

    invoke-direct {p2, v0, v1, p3}, Lcm;-><init>(Ljava/lang/String;IB)V

    const-string p3, "other"

    invoke-static {p3, p2}, Lzi4;->t(Ljava/lang/String;Lcm;)Lua7;

    move-result-object p2

    const/4 p3, 0x1

    invoke-virtual {p2, p3}, Lua7;->R(Z)V

    const v2, 0x7f0803bc

    invoke-virtual {p2, v2}, Lua7;->S(I)V

    if-eqz p1, :cond_28

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_28

    const-string v0, "message"

    invoke-virtual {v2, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_28
    if-nez v0, :cond_2c

    const-string v0, ""

    :cond_2c
    invoke-virtual {p2, v0}, Lua7;->O(Ljava/lang/CharSequence;)V

    if-eqz p1, :cond_4b

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_4b

    const-string v0, "intent"

    const-class v2, Landroid/app/PendingIntent;

    invoke-static {p1, v0, v2}, Lj14;->T(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Parcelable;

    check-cast p1, Landroid/app/PendingIntent;

    if-eqz p1, :cond_4b

    iget-object v0, p2, Lua7;->b:Ljava/lang/Object;

    check-cast v0, Ll1f;

    iput-object p1, v0, Ll1f;->g:Landroid/app/PendingIntent;

    :cond_4b
    invoke-virtual {p2}, Lua7;->l()Li16;

    move-result-object p1

    iget-object p1, p1, Li16;->b:Ljava/lang/Object;

    check-cast p1, Landroid/app/Notification;

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1f

    if-lt p2, v0, :cond_5e

    invoke-static {p0, v1, p1}, Lm41;->L(Landroid/app/Service;ILandroid/app/Notification;)Z

    move-result p3

    goto :goto_61

    :cond_5e
    invoke-virtual {p0, v1, p1}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V

    :goto_61
    if-nez p3, :cond_66

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    :cond_66
    const/4 p0, 0x2

    return p0
.end method

.method public final onTimeout(I)V
    .registers 2

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    return-void
.end method
