.class public final Ll/rvr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Landroid/os/Handler;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/pvr0;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Ll/pvr0;-><init>(Ll/rvr0;Landroid/os/Handler;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/rvr0;->a:Ljava/util/concurrent/Executor;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(Ll/jwr0;Lcom/google/android/gms/internal/ads/zzaqj;)V
    .locals 2

    .line 1
    const-string v0, "post-error"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Ll/pwr0;->a(Lcom/google/android/gms/internal/ads/zzaqj;)Ll/pwr0;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    new-instance v0, Ll/qvr0;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, p1, p2, v1}, Ll/qvr0;-><init>(Ll/jwr0;Ll/pwr0;Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/rvr0;->a:Ljava/util/concurrent/Executor;

    .line 17
    .line 18
    check-cast p0, Ll/pvr0;

    .line 19
    .line 20
    iget-object p0, p0, Ll/pvr0;->a:Landroid/os/Handler;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final b(Ll/jwr0;Ll/pwr0;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jwr0;->u()V

    .line 2
    .line 3
    .line 4
    const-string v0, "post-response"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/qvr0;

    .line 10
    .line 11
    invoke-direct {v0, p1, p2, p3}, Ll/qvr0;-><init>(Ll/jwr0;Ll/pwr0;Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/rvr0;->a:Ljava/util/concurrent/Executor;

    .line 15
    .line 16
    check-cast p0, Ll/pvr0;

    .line 17
    .line 18
    iget-object p0, p0, Ll/pvr0;->a:Landroid/os/Handler;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method
