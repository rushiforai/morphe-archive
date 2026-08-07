.class Lcom/ss/android/ttvecamera/TECameraServer$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->takePicture(Lcom/ss/android/ttvecamera/d;IILcom/ss/android/ttvecamera/TECameraSettings$l;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/TECameraSettings$l;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$f;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    iput p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$f;->a:I

    .line 4
    .line 5
    iput p4, p0, Lcom/ss/android/ttvecamera/TECameraServer$f;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    const-string v0, "Can not takePicture on state : "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$f;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1200(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    monitor-enter v1

    .line 10
    :try_start_0
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$f;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 11
    .line 12
    invoke-static {v2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/4 v3, 0x3

    .line 17
    if-eq v2, v3, :cond_0

    .line 18
    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$f;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$f;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 38
    .line 39
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d$b;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const/16 v2, -0x69

    .line 44
    .line 45
    invoke-interface {p0, v2, v0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const-string p0, "TECameraServer"

    .line 49
    .line 50
    invoke-static {p0, v0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    monitor-exit v1

    .line 54
    return-void

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$f;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 58
    .line 59
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 64
    .line 65
    const/4 v2, 0x1

    .line 66
    if-ne v0, v2, :cond_1

    .line 67
    .line 68
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$f;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 69
    .line 70
    const/4 v2, 0x2

    .line 71
    invoke-virtual {v0, v2}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 72
    .line 73
    .line 74
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$f;->c:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 75
    .line 76
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$f;->a:I

    .line 81
    .line 82
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$f;->b:I

    .line 83
    .line 84
    const/4 v3, 0x0

    .line 85
    invoke-virtual {v0, v2, p0, v3}, Lcom/ss/android/ttvecamera/c;->D0(IILcom/ss/android/ttvecamera/TECameraSettings$l;)V

    .line 86
    .line 87
    .line 88
    monitor-exit v1

    .line 89
    return-void

    .line 90
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    throw p0
.end method
