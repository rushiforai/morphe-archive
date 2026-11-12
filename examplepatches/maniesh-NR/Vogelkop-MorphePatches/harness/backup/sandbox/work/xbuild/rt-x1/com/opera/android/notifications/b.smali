.class public final Lcom/opera/android/notifications/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lc7d;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Landroid/content/Intent;

.field public final synthetic c:Lkqd;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/Intent;Lkqd;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/notifications/b;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/opera/android/notifications/b;->b:Landroid/content/Intent;

    iput-object p3, p0, Lcom/opera/android/notifications/b;->c:Lkqd;

    return-void
.end method


# virtual methods
.method public final c(I)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/notifications/b;->c:Lkqd;

    invoke-virtual {p0}, Lkqd;->onDone()V

    return-void
.end method

.method public final onSuccess()V
    .registers 2

    iget-object v0, p0, Lcom/opera/android/notifications/b;->b:Landroid/content/Intent;

    iget-object p0, p0, Lcom/opera/android/notifications/b;->c:Lkqd;

    invoke-static {v0, p0}, Lcom/opera/android/notifications/NotificationBridge;->a(Landroid/content/Intent;Lcom/opera/android/notifications/NotificationBridge$Callback;)V

    return-void
.end method
