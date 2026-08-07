.class Lcom/ss/android/ttvecamera/TECameraServer$w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->setExposureCompensation(Lcom/ss/android/ttvecamera/d;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$w;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$w;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$w;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1200(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$w;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$w;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$w;->a:I

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Lcom/ss/android/ttvecamera/c;->j0(I)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$w;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 33
    .line 34
    invoke-static {v2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1400(Lcom/ss/android/ttvecamera/TECameraServer;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_1

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$w;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 43
    .line 44
    invoke-static {v1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1500(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c$a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const-string v2, "exposure compensation"

    .line 49
    .line 50
    iget-object v3, p0, Lcom/ss/android/ttvecamera/TECameraServer$w;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 51
    .line 52
    invoke-static {v3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    const/4 v4, 0x0

    .line 57
    const/16 v5, 0x73

    .line 58
    .line 59
    invoke-interface {v1, v5, v4, v2, v3}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$w;->b:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 63
    .line 64
    invoke-static {p0, v4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1402(Lcom/ss/android/ttvecamera/TECameraServer;Z)Z

    .line 65
    .line 66
    .line 67
    :cond_1
    monitor-exit v0

    .line 68
    return-void

    .line 69
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    throw p0
.end method
