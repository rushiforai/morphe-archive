.class public final Lcom/waze/gw/AaStartStateTimeoutRunnable;
.super Ljava/lang/Object;
.source "WazeSource"

.implements Ljava/lang/Runnable;

.field public final a:Lcom/waze/car_lib/f/u;

.method public constructor <init>(Lcom/waze/car_lib/f/u;)V
    .locals 0

    iput-object p1, p0, Lcom/waze/gw/AaStartStateTimeoutRunnable;->a:Lcom/waze/car_lib/f/u;
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public final run()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/waze/gw/AaStartStateTimeoutRunnable;->a:Lcom/waze/car_lib/f/u;
    sget-object v1, Lcom/waze/car_lib/f/s;->b:Lcom/waze/car_lib/f/s;
    invoke-virtual {v0, v1}, Lcom/waze/car_lib/f/u;->A(Lcom/waze/car_lib/f/s;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    return-void

    :catch_0
    move-exception v0
    return-void
.end method
