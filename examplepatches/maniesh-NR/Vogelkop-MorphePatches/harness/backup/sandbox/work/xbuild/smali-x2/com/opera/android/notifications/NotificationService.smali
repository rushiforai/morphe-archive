.class public final Lcom/opera/android/notifications/NotificationService;
.super Landroid/app/Service;
.source "SourceFile"

# interfaces
.implements Lcom/opera/android/notifications/NotificationBridge$Callback;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u0002B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/opera/android/notifications/NotificationService;",
        "Landroid/app/Service;",
        "Lcom/opera/android/notifications/NotificationBridge$Callback;",
        "<init>",
        "()V",
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
.field public static final synthetic b:I


# instance fields
.field public a:I


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public final onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onDone()V
    .registers 2

    iget v0, p0, Lcom/opera/android/notifications/NotificationService;->a:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/opera/android/notifications/NotificationService;->a:I

    if-nez v0, :cond_b

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    :cond_b
    return-void
.end method

.method public final onStartCommand(Landroid/content/Intent;II)I
    .registers 5

    iget p2, p0, Lcom/opera/android/notifications/NotificationService;->a:I

    add-int/lit8 p2, p2, 0x1

    iput p2, p0, Lcom/opera/android/notifications/NotificationService;->a:I

    const/4 p2, 0x2

    if-eqz p1, :cond_2c

    invoke-static {p1}, Lcom/opera/android/notifications/NotificationBridge;->c(Landroid/content/Intent;)Z

    move-result p3

    if-eqz p3, :cond_2c

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    if-nez v0, :cond_20

    const/4 v0, 0x0

    :cond_20
    invoke-static {p3, v0}, Lfsp;->g(Landroid/content/Context;Lorg/chromium/base/CommandLine;)V

    new-instance v0, Lcom/opera/android/notifications/c;

    invoke-direct {v0, p3, p1, p0}, Lcom/opera/android/notifications/c;-><init>(Landroid/content/Context;Landroid/content/Intent;Lcom/opera/android/notifications/NotificationService;)V

    invoke-static {p3, v0}, Le7d;->a(Landroid/content/Context;Lc7d;)V

    return p2

    :cond_2c
    iget p1, p0, Lcom/opera/android/notifications/NotificationService;->a:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/opera/android/notifications/NotificationService;->a:I

    if-nez p1, :cond_37

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    :cond_37
    return p2
.end method
