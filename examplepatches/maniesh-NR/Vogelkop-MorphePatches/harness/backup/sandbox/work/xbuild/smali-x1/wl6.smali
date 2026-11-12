.class public final synthetic Lwl6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lni;


# instance fields
.field public final synthetic a:Lyl6;

.field public final synthetic b:J

.field public final synthetic c:Ljava/lang/Runnable;

.field public final synthetic d:Loi;


# direct methods
.method public synthetic constructor <init>(Lyl6;JLjava/lang/Runnable;Loi;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwl6;->a:Lyl6;

    iput-wide p2, p0, Lwl6;->b:J

    iput-object p4, p0, Lwl6;->c:Ljava/lang/Runnable;

    iput-object p5, p0, Lwl6;->d:Loi;

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Intent;)V
    .registers 7

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lwl6;->b:J

    sub-long/2addr v0, v2

    const/4 p2, -0x1

    if-eq p1, p2, :cond_2e

    const-wide/16 p1, 0x1f4

    cmp-long p1, v0, p1

    if-gez p1, :cond_2e

    iget-object p1, p0, Lwl6;->a:Lyl6;

    iget-object p2, p1, Lyl6;->c:Lb59;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/SharedPreferences;

    const-string v0, "role_auto_denied"

    const/4 v1, 0x1

    invoke-static {p2, v0, v1}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    iget-object p2, p0, Lwl6;->c:Ljava/lang/Runnable;

    if-nez p2, :cond_2b

    const/4 p2, 0x0

    iget-object p0, p0, Lwl6;->d:Loi;

    invoke-virtual {p1, p0, p2}, Lyl6;->e(Loi;Ljava/lang/Runnable;)V

    return-void

    :cond_2b
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    :cond_2e
    return-void
.end method
