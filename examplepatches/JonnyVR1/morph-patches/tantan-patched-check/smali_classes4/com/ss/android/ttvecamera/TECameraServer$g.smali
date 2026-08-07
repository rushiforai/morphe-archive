.class Lcom/ss/android/ttvecamera/TECameraServer$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->takePicture(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings$l;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/TECameraSettings$l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$g;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    const-string v0, "Can not takePicture on state : "

    .line 2
    .line 3
    const-string v1, "TECameraServer"

    .line 4
    .line 5
    const-string v2, "takePicture"

    .line 6
    .line 7
    invoke-static {v1, v2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$g;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1200(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    monitor-enter v1

    .line 17
    :try_start_0
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$g;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 18
    .line 19
    invoke-static {v2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/4 v3, 0x3

    .line 24
    if-eq v2, v3, :cond_0

    .line 25
    .line 26
    new-instance v2, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 45
    .line 46
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d$b;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const/16 v2, -0x69

    .line 51
    .line 52
    invoke-interface {p0, v2, v0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const-string p0, "TECameraServer"

    .line 56
    .line 57
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    monitor-exit v1

    .line 61
    return-void

    .line 62
    :catchall_0
    move-exception p0

    .line 63
    goto :goto_0

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 71
    .line 72
    const/4 v2, 0x1

    .line 73
    if-ne v0, v2, :cond_1

    .line 74
    .line 75
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 76
    .line 77
    const/4 v2, 0x2

    .line 78
    invoke-virtual {v0, v2}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 79
    .line 80
    .line 81
    :cond_1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 82
    .line 83
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const/4 v0, 0x0

    .line 88
    invoke-virtual {p0, v0}, Lcom/ss/android/ttvecamera/c;->E0(Lcom/ss/android/ttvecamera/TECameraSettings$l;)V

    .line 89
    .line 90
    .line 91
    monitor-exit v1

    .line 92
    return-void

    .line 93
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    throw p0
.end method
