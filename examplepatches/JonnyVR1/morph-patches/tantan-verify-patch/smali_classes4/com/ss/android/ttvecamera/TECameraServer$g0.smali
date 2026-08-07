.class Lcom/ss/android/ttvecamera/TECameraServer$g0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/TECameraServer;->open(Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/TECameraServer;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TECameraServer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$g0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-le v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v2, 0x4

    .line 17
    if-ge v0, v2, :cond_1

    .line 18
    .line 19
    const-string v0, "TECameraServer"

    .line 20
    .line 21
    const-string v1, "close camera in main thread"

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-boolean v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->R:Z

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$g0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 56
    .line 57
    invoke-static {v1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$400(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/bytedance/bpea/basics/Cert;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Lcom/ss/android/ttvecamera/c;->n(Lcom/bytedance/bpea/basics/Cert;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 65
    .line 66
    const/4 v1, 0x0

    .line 67
    invoke-virtual {v0, v1}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 72
    .line 73
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$400(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/bytedance/bpea/basics/Cert;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$500(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/bytedance/bpea/basics/Cert;)V

    .line 78
    .line 79
    .line 80
    :goto_0
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 81
    .line 82
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$600(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_2

    .line 87
    .line 88
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 89
    .line 90
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$700(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 95
    .line 96
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-ne v0, v1, :cond_2

    .line 101
    .line 102
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$g0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 103
    .line 104
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$800(Lcom/ss/android/ttvecamera/TECameraServer;)Landroid/os/Handler;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    const-wide/16 v1, 0x7d0

    .line 109
    .line 110
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 111
    .line 112
    .line 113
    :cond_2
    return-void
.end method
