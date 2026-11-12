.class public final Lcom/opera/android/notifications/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lc7d;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Landroid/content/Intent;

.field public final synthetic c:Lcom/opera/android/notifications/NotificationService;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/Intent;Lcom/opera/android/notifications/NotificationService;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/notifications/c;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/opera/android/notifications/c;->b:Landroid/content/Intent;

    iput-object p3, p0, Lcom/opera/android/notifications/c;->c:Lcom/opera/android/notifications/NotificationService;

    return-void
.end method


# virtual methods
.method public final c(I)V
    .registers 2

    sget p1, Lcom/opera/android/notifications/NotificationService;->b:I

    iget-object p0, p0, Lcom/opera/android/notifications/c;->c:Lcom/opera/android/notifications/NotificationService;

    iget p1, p0, Lcom/opera/android/notifications/NotificationService;->a:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/opera/android/notifications/NotificationService;->a:I

    if-nez p1, :cond_f

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    :cond_f
    return-void
.end method

.method public final onSuccess()V
    .registers 2

    iget-object v0, p0, Lcom/opera/android/notifications/c;->b:Landroid/content/Intent;

    iget-object p0, p0, Lcom/opera/android/notifications/c;->c:Lcom/opera/android/notifications/NotificationService;

    invoke-static {v0, p0}, Lcom/opera/android/notifications/NotificationBridge;->a(Landroid/content/Intent;Lcom/opera/android/notifications/NotificationBridge$Callback;)V

    return-void
.end method
