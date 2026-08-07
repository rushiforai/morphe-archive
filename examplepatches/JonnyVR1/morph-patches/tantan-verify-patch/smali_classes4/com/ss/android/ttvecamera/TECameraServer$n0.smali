.class Lcom/ss/android/ttvecamera/TECameraServer$n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/android/ttvecamera/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttvecamera/TECameraServer;
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
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(IIILjava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 1
    const-string p1, "TECameraServer"

    .line 2
    .line 3
    const-string v0, "startCapture success!"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2402(Lcom/ss/android/ttvecamera/TECameraServer;Z)Z

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->w:I

    .line 37
    .line 38
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 39
    .line 40
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    invoke-virtual {p3}, Lcom/ss/android/ttvecamera/c;->L()I

    .line 45
    .line 46
    .line 47
    move-result p3

    .line 48
    sub-int/2addr p1, p3

    .line 49
    new-instance p3, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string p4, ", Retry preview times = "

    .line 58
    .line 59
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    invoke-virtual {p0, p2, p1, p3, p5}, Lcom/ss/android/ttvecamera/TECameraServer$n0;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 73
    .line 74
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->g()V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_0
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/ss/android/ttvecamera/TECameraServer$n0;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    :goto_0
    const-string p0, "te_record_camera_preview_ret"

    .line 86
    .line 87
    const-wide/16 p1, 0x0

    .line 88
    .line 89
    invoke-static {p0, p1, p2}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public b(IILjava/lang/String;Ljava/lang/Object;)V
    .locals 3

    .line 1
    const-string v0, "Retry to startPreview. "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-boolean v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->g0:Z

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    const/16 v1, -0x1b5

    .line 14
    .line 15
    if-ne p2, v1, :cond_1

    .line 16
    .line 17
    const-string p1, "te_record_camera_preview_ret"

    .line 18
    .line 19
    int-to-long p2, p2

    .line 20
    invoke-static {p1, p2, p3}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2500(Lcom/ss/android/ttvecamera/TECameraServer;)Landroid/os/Handler;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    new-instance p2, Lcom/ss/android/ttvecamera/TECameraServer$n0$a;

    .line 33
    .line 34
    invoke-direct {p2, p0}, Lcom/ss/android/ttvecamera/TECameraServer$n0$a;-><init>(Lcom/ss/android/ttvecamera/TECameraServer$n0;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 42
    .line 43
    invoke-static {v1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1200(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    monitor-enter v1

    .line 48
    :try_start_0
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 49
    .line 50
    invoke-static {v2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    if-eqz v2, :cond_3

    .line 55
    .line 56
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 57
    .line 58
    invoke-static {v2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/c;->L()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-lez v2, :cond_3

    .line 67
    .line 68
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 69
    .line 70
    const/4 p2, 0x1

    .line 71
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2402(Lcom/ss/android/ttvecamera/TECameraServer;Z)Z

    .line 72
    .line 73
    .line 74
    const-string p1, "TECameraServer"

    .line 75
    .line 76
    new-instance p2, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 82
    .line 83
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    invoke-virtual {p3}, Lcom/ss/android/ttvecamera/c;->L()I

    .line 88
    .line 89
    .line 90
    move-result p3

    .line 91
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string p3, " times is waiting to retry."

    .line 95
    .line 96
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 107
    .line 108
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/c;->e0()V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 116
    .line 117
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2500(Lcom/ss/android/ttvecamera/TECameraServer;)Landroid/os/Handler;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    if-nez p1, :cond_2

    .line 122
    .line 123
    monitor-exit v1

    .line 124
    return-void

    .line 125
    :catchall_0
    move-exception p0

    .line 126
    goto :goto_1

    .line 127
    :cond_2
    new-instance p2, Lcom/ss/android/ttvecamera/TECameraServer$n0$b;

    .line 128
    .line 129
    invoke-direct {p2, p0}, Lcom/ss/android/ttvecamera/TECameraServer$n0$b;-><init>(Lcom/ss/android/ttvecamera/TECameraServer$n0;)V

    .line 130
    .line 131
    .line 132
    const-wide/16 p3, 0x64

    .line 133
    .line 134
    invoke-virtual {p1, p2, p3, p4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/android/ttvecamera/TECameraServer$n0;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    const-string p0, "te_record_camera_preview_ret"

    .line 142
    .line 143
    int-to-long p1, p2

    .line 144
    invoke-static {p0, p1, p2}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 145
    .line 146
    .line 147
    :goto_0
    monitor-exit v1

    .line 148
    return-void

    .line 149
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 150
    throw p0
.end method

.method public c(IILjava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string p4, "onCameraError: code = "

    .line 4
    .line 5
    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p4, ", msg = "

    .line 12
    .line 13
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string p4, "TECameraServer"

    .line 24
    .line 25
    invoke-static {p4, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d$b;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance p4, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v0, "Open camera failed @"

    .line 37
    .line 38
    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 48
    .line 49
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v0, ",face:"

    .line 53
    .line 54
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 58
    .line 59
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 64
    .line 65
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v0, " "

    .line 69
    .line 70
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 74
    .line 75
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/TEFrameSizei;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-interface {p1, p2, p0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public d(IIILjava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 1
    const-string p1, "TECameraServer"

    .line 2
    .line 3
    const-string v0, "stopCapture success!"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/ss/android/ttvecamera/TECameraServer$n0;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e(IILjava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 1
    new-instance p4, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "onCameraInfo: "

    .line 4
    .line 5
    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, ", ext: "

    .line 12
    .line 13
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v0, " msg: "

    .line 20
    .line 21
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p4

    .line 31
    const-string v0, "TECameraServer"

    .line 32
    .line 33
    invoke-static {v0, p4}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/16 p4, 0x6c

    .line 37
    .line 38
    if-ne p1, p4, :cond_0

    .line 39
    .line 40
    iget-object p4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 41
    .line 42
    const/4 v0, 0x4

    .line 43
    invoke-virtual {p4, v0}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const/16 p4, 0x6d

    .line 48
    .line 49
    if-ne p1, p4, :cond_1

    .line 50
    .line 51
    iget-object p4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    invoke-virtual {p4, v0}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 58
    .line 59
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d$b;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-interface {p0, p1, p2, p3}, Lcom/ss/android/ttvecamera/d$b;->onInfo(IILjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public f(IILcom/ss/android/ttvecamera/c;Ljava/lang/Object;)V
    .locals 9

    .line 1
    const-string p3, "onCameraOpened, no need to close camera, state: "

    .line 2
    .line 3
    const-string p4, "onCameraOpened, no need to close camera, state: "

    .line 4
    .line 5
    const-string v0, "onCameraOpened, no need to close camera, state: "

    .line 6
    .line 7
    const-string v1, "Open camera error ? May be closed now!!, state = "

    .line 8
    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v3, "TECameraServer-onCameraOpened: cameraType "

    .line 12
    .line 13
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v3, ", ret "

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v2}, Ll/dsh0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 35
    .line 36
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 37
    .line 38
    .line 39
    move-result-wide v3

    .line 40
    iget-object v5, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 41
    .line 42
    invoke-static {v5}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1700(Lcom/ss/android/ttvecamera/TECameraServer;)J

    .line 43
    .line 44
    .line 45
    move-result-wide v5

    .line 46
    sub-long/2addr v3, v5

    .line 47
    invoke-static {v2, v3, v4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1602(Lcom/ss/android/ttvecamera/TECameraServer;J)J

    .line 48
    .line 49
    .line 50
    const-string v2, "TECameraServer"

    .line 51
    .line 52
    new-instance v3, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v4, "onCameraOpened: CameraType = "

    .line 55
    .line 56
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object v4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 60
    .line 61
    invoke-static {v4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    iget v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 66
    .line 67
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v4, ", Ret = "

    .line 71
    .line 72
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v4, ",retryCnt = "

    .line 79
    .line 80
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    iget-object v4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 84
    .line 85
    invoke-static {v4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1800(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-static {v2, v3}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 100
    .line 101
    invoke-static {v2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    new-instance v3, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    const-string v4, "CamType"

    .line 108
    .line 109
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-object v4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 113
    .line 114
    invoke-static {v4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1800(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    iget-object v4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 126
    .line 127
    invoke-static {v4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    iget v4, v4, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 132
    .line 133
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 141
    .line 142
    invoke-static {v2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    new-instance v3, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    const-string v4, "Ret"

    .line 149
    .line 150
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    iget-object v4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 154
    .line 155
    invoke-static {v4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1800(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 156
    .line 157
    .line 158
    move-result v4

    .line 159
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 174
    .line 175
    invoke-static {v2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    new-instance v3, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    const-string v4, "OpenTime"

    .line 182
    .line 183
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    iget-object v4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 187
    .line 188
    invoke-static {v4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1800(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 189
    .line 190
    .line 191
    move-result v4

    .line 192
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    iget-object v4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 200
    .line 201
    invoke-static {v4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1600(Lcom/ss/android/ttvecamera/TECameraServer;)J

    .line 202
    .line 203
    .line 204
    move-result-wide v4

    .line 205
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v4

    .line 209
    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    iget-object v2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 213
    .line 214
    const/4 v3, 0x2

    .line 215
    const/4 v4, 0x1

    .line 216
    if-nez p2, :cond_1

    .line 217
    .line 218
    invoke-static {v2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 219
    .line 220
    .line 221
    move-result-object p3

    .line 222
    iget p3, p3, Lcom/ss/android/ttvecamera/TECameraSettings;->v:I

    .line 223
    .line 224
    invoke-static {v2, p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1802(Lcom/ss/android/ttvecamera/TECameraServer;I)I

    .line 225
    .line 226
    .line 227
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 228
    .line 229
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1200(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v5

    .line 233
    monitor-enter v5

    .line 234
    :try_start_0
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 235
    .line 236
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 237
    .line 238
    .line 239
    move-result p3

    .line 240
    if-ne p3, v4, :cond_0

    .line 241
    .line 242
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 243
    .line 244
    invoke-virtual {p3, v3}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 245
    .line 246
    .line 247
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 248
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 249
    .line 250
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d$b;

    .line 251
    .line 252
    .line 253
    move-result-object p3

    .line 254
    invoke-interface {p3, p1, p2}, Lcom/ss/android/ttvecamera/d$b;->onCaptureStarted(II)V

    .line 255
    .line 256
    .line 257
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 258
    .line 259
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    iget p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->v:I

    .line 264
    .line 265
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 266
    .line 267
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1800(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 268
    .line 269
    .line 270
    move-result p3

    .line 271
    sub-int/2addr p1, p3

    .line 272
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 273
    .line 274
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d$b;

    .line 275
    .line 276
    .line 277
    move-result-object p3

    .line 278
    new-instance p4, Ljava/lang/StringBuilder;

    .line 279
    .line 280
    const-string v0, "Retry open camera times = "

    .line 281
    .line 282
    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object p4

    .line 292
    const/16 v0, 0x78

    .line 293
    .line 294
    invoke-interface {p3, v0, p1, p4}, Lcom/ss/android/ttvecamera/d$b;->onInfo(IILjava/lang/String;)V

    .line 295
    .line 296
    .line 297
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 298
    .line 299
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    const-string p3, "ResultType"

    .line 304
    .line 305
    const-string p4, "Open Success"

    .line 306
    .line 307
    invoke-virtual {p1, p3, p4}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    const-string p1, "te_record_camera_open_ret"

    .line 311
    .line 312
    int-to-long p2, p2

    .line 313
    invoke-static {p1, p2, p3}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 314
    .line 315
    .line 316
    const-string p1, "te_record_camera_open_cost"

    .line 317
    .line 318
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 319
    .line 320
    invoke-static {p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1600(Lcom/ss/android/ttvecamera/TECameraServer;)J

    .line 321
    .line 322
    .line 323
    move-result-wide p2

    .line 324
    invoke-static {p1, p2, p3}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 325
    .line 326
    .line 327
    const-string p1, "te_record_camera_open_info"

    .line 328
    .line 329
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 330
    .line 331
    invoke-static {p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 332
    .line 333
    .line 334
    move-result-object p2

    .line 335
    invoke-virtual {p2}, Ljava/util/concurrent/ConcurrentHashMap;->toString()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object p2

    .line 339
    invoke-static {p1, p2}, Ll/hrh0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    const-string p1, "VESDKCOST"

    .line 343
    .line 344
    new-instance p2, Ljava/lang/StringBuilder;

    .line 345
    .line 346
    const-string p3, "TE_RECORD_CAMERA_OPEN_COST "

    .line 347
    .line 348
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 352
    .line 353
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1600(Lcom/ss/android/ttvecamera/TECameraServer;)J

    .line 354
    .line 355
    .line 356
    move-result-wide p3

    .line 357
    invoke-virtual {p2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object p2

    .line 364
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 368
    .line 369
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 370
    .line 371
    .line 372
    move-result-object p0

    .line 373
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 374
    .line 375
    .line 376
    goto/16 :goto_8

    .line 377
    .line 378
    :catchall_0
    move-exception p0

    .line 379
    goto :goto_0

    .line 380
    :cond_0
    :try_start_1
    const-string p1, "TECameraServer"

    .line 381
    .line 382
    new-instance p2, Ljava/lang/StringBuilder;

    .line 383
    .line 384
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 385
    .line 386
    .line 387
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 388
    .line 389
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 390
    .line 391
    .line 392
    move-result p0

    .line 393
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 394
    .line 395
    .line 396
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    move-result-object p0

    .line 400
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 401
    .line 402
    .line 403
    monitor-exit v5

    .line 404
    return-void

    .line 405
    :goto_0
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 406
    throw p0

    .line 407
    :cond_1
    invoke-static {v2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 408
    .line 409
    .line 410
    move-result-object v1

    .line 411
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 412
    .line 413
    const/16 v2, 0xb

    .line 414
    .line 415
    const/4 v5, 0x4

    .line 416
    const/4 v6, 0x0

    .line 417
    const/4 v7, 0x0

    .line 418
    if-ne v1, v2, :cond_4

    .line 419
    .line 420
    const/16 v1, -0x1ac

    .line 421
    .line 422
    if-ne p2, v1, :cond_4

    .line 423
    .line 424
    const-string p1, "TECameraServer"

    .line 425
    .line 426
    const-string p2, "CameraUnit auth failed, fall back to camera2"

    .line 427
    .line 428
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 429
    .line 430
    .line 431
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 432
    .line 433
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 434
    .line 435
    .line 436
    move-result-object p2

    .line 437
    iget p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->v:I

    .line 438
    .line 439
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1802(Lcom/ss/android/ttvecamera/TECameraServer;I)I

    .line 440
    .line 441
    .line 442
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 443
    .line 444
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1200(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/lang/Object;

    .line 445
    .line 446
    .line 447
    move-result-object v1

    .line 448
    monitor-enter v1

    .line 449
    :try_start_2
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 450
    .line 451
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 452
    .line 453
    .line 454
    move-result p1

    .line 455
    if-nez p1, :cond_2

    .line 456
    .line 457
    const-string p1, "TECameraServer"

    .line 458
    .line 459
    new-instance p2, Ljava/lang/StringBuilder;

    .line 460
    .line 461
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 462
    .line 463
    .line 464
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 465
    .line 466
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 467
    .line 468
    .line 469
    move-result p3

    .line 470
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 471
    .line 472
    .line 473
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 474
    .line 475
    .line 476
    move-result-object p2

    .line 477
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 478
    .line 479
    .line 480
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 481
    .line 482
    invoke-static {p1, v7}, Lcom/ss/android/ttvecamera/TECameraServer;->access$302(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/c;)Lcom/ss/android/ttvecamera/c;

    .line 483
    .line 484
    .line 485
    goto :goto_1

    .line 486
    :catchall_1
    move-exception p0

    .line 487
    goto :goto_2

    .line 488
    :cond_2
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 489
    .line 490
    invoke-virtual {p1, v5}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 491
    .line 492
    .line 493
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 494
    .line 495
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 496
    .line 497
    .line 498
    move-result-object p1

    .line 499
    if-eqz p1, :cond_3

    .line 500
    .line 501
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 502
    .line 503
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 504
    .line 505
    .line 506
    move-result-object p1

    .line 507
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 508
    .line 509
    invoke-static {p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2000(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/bytedance/bpea/basics/Cert;

    .line 510
    .line 511
    .line 512
    move-result-object p2

    .line 513
    invoke-virtual {p1, p2}, Lcom/ss/android/ttvecamera/c;->f(Lcom/bytedance/bpea/basics/Cert;)V

    .line 514
    .line 515
    .line 516
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 517
    .line 518
    invoke-static {p1, v7}, Lcom/ss/android/ttvecamera/TECameraServer;->access$302(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/c;)Lcom/ss/android/ttvecamera/c;

    .line 519
    .line 520
    .line 521
    :cond_3
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 522
    .line 523
    invoke-virtual {p1, v6}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 524
    .line 525
    .line 526
    :goto_1
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 527
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 528
    .line 529
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 530
    .line 531
    .line 532
    move-result-object p1

    .line 533
    iput v3, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 534
    .line 535
    sget-object p1, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 536
    .line 537
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 538
    .line 539
    invoke-static {p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2100(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d;

    .line 540
    .line 541
    .line 542
    move-result-object p2

    .line 543
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 544
    .line 545
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 546
    .line 547
    .line 548
    move-result-object p3

    .line 549
    iget-object p4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 550
    .line 551
    invoke-static {p4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2000(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/bytedance/bpea/basics/Cert;

    .line 552
    .line 553
    .line 554
    move-result-object p4

    .line 555
    invoke-static {p1, p2, p3, p4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$000(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I

    .line 556
    .line 557
    .line 558
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 559
    .line 560
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 561
    .line 562
    .line 563
    move-result-object p1

    .line 564
    const-string p2, "ResultType"

    .line 565
    .line 566
    const-string p3, "fallback to Camera2"

    .line 567
    .line 568
    invoke-virtual {p1, p2, p3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 569
    .line 570
    .line 571
    const-string p1, "te_record_camera_open_info"

    .line 572
    .line 573
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 574
    .line 575
    invoke-static {p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 576
    .line 577
    .line 578
    move-result-object p2

    .line 579
    invoke-virtual {p2}, Ljava/util/concurrent/ConcurrentHashMap;->toString()Ljava/lang/String;

    .line 580
    .line 581
    .line 582
    move-result-object p2

    .line 583
    invoke-static {p1, p2}, Ll/hrh0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 584
    .line 585
    .line 586
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 587
    .line 588
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 589
    .line 590
    .line 591
    move-result-object p0

    .line 592
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 593
    .line 594
    .line 595
    goto/16 :goto_8

    .line 596
    .line 597
    :goto_2
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 598
    throw p0

    .line 599
    :cond_4
    const/16 v0, -0x198

    .line 600
    .line 601
    const/16 v1, -0x193

    .line 602
    .line 603
    const/4 v2, -0x1

    .line 604
    if-eq p2, v1, :cond_b

    .line 605
    .line 606
    if-eq p2, v0, :cond_b

    .line 607
    .line 608
    iget-object v8, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 609
    .line 610
    invoke-static {v8}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1800(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 611
    .line 612
    .line 613
    move-result v8

    .line 614
    if-lez v8, :cond_b

    .line 615
    .line 616
    iget-object v8, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 617
    .line 618
    invoke-static {v8}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2200(Lcom/ss/android/ttvecamera/TECameraServer;)Z

    .line 619
    .line 620
    .line 621
    move-result v8

    .line 622
    if-eqz v8, :cond_b

    .line 623
    .line 624
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 625
    .line 626
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d$b;

    .line 627
    .line 628
    .line 629
    move-result-object p3

    .line 630
    new-instance v0, Ljava/lang/StringBuilder;

    .line 631
    .line 632
    const-string v1, "Retry to Open Camera Failed @"

    .line 633
    .line 634
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 635
    .line 636
    .line 637
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 638
    .line 639
    invoke-static {v1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 640
    .line 641
    .line 642
    move-result-object v1

    .line 643
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 644
    .line 645
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 646
    .line 647
    .line 648
    const-string v1, ",face:"

    .line 649
    .line 650
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 651
    .line 652
    .line 653
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 654
    .line 655
    invoke-static {v1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 656
    .line 657
    .line 658
    move-result-object v1

    .line 659
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 660
    .line 661
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 662
    .line 663
    .line 664
    const-string v1, " "

    .line 665
    .line 666
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 667
    .line 668
    .line 669
    iget-object v1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 670
    .line 671
    invoke-static {v1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 672
    .line 673
    .line 674
    move-result-object v1

    .line 675
    iget-object v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 676
    .line 677
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/TEFrameSizei;->toString()Ljava/lang/String;

    .line 678
    .line 679
    .line 680
    move-result-object v1

    .line 681
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 682
    .line 683
    .line 684
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 685
    .line 686
    .line 687
    move-result-object v0

    .line 688
    const/16 v1, -0x194

    .line 689
    .line 690
    invoke-interface {p3, v1, v0}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 691
    .line 692
    .line 693
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 694
    .line 695
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1100(Lcom/ss/android/ttvecamera/TECameraServer;)Z

    .line 696
    .line 697
    .line 698
    move-result p3

    .line 699
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 700
    .line 701
    if-eqz p3, :cond_5

    .line 702
    .line 703
    invoke-static {v0, v6}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1102(Lcom/ss/android/ttvecamera/TECameraServer;Z)Z

    .line 704
    .line 705
    .line 706
    const-string p1, "TECameraServer"

    .line 707
    .line 708
    const-string p2, "retry to open camera, but camera close was called"

    .line 709
    .line 710
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 711
    .line 712
    .line 713
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 714
    .line 715
    invoke-static {p1, v2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1802(Lcom/ss/android/ttvecamera/TECameraServer;I)I

    .line 716
    .line 717
    .line 718
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 719
    .line 720
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 721
    .line 722
    .line 723
    move-result-object p1

    .line 724
    new-instance p2, Ljava/lang/StringBuilder;

    .line 725
    .line 726
    const-string p3, "ResultType"

    .line 727
    .line 728
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 729
    .line 730
    .line 731
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 732
    .line 733
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1800(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 734
    .line 735
    .line 736
    move-result p3

    .line 737
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 738
    .line 739
    .line 740
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 741
    .line 742
    .line 743
    move-result-object p2

    .line 744
    const-string p3, "retry to open camera"

    .line 745
    .line 746
    invoke-virtual {p1, p2, p3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 747
    .line 748
    .line 749
    const-string p1, "te_record_camera_open_info"

    .line 750
    .line 751
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 752
    .line 753
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 754
    .line 755
    .line 756
    move-result-object p0

    .line 757
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->toString()Ljava/lang/String;

    .line 758
    .line 759
    .line 760
    move-result-object p0

    .line 761
    invoke-static {p1, p0}, Ll/hrh0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 762
    .line 763
    .line 764
    return-void

    .line 765
    :cond_5
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 766
    .line 767
    .line 768
    move-result-object p3

    .line 769
    iget-object p3, p3, Lcom/ss/android/ttvecamera/TECameraSettings;->a:Landroid/content/Context;

    .line 770
    .line 771
    if-nez p3, :cond_6

    .line 772
    .line 773
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 774
    .line 775
    invoke-static {p1, v2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1802(Lcom/ss/android/ttvecamera/TECameraServer;I)I

    .line 776
    .line 777
    .line 778
    const-string p1, "TECameraServer"

    .line 779
    .line 780
    new-instance p2, Ljava/lang/StringBuilder;

    .line 781
    .line 782
    const-string p3, "abort retry to open camera, no context: "

    .line 783
    .line 784
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 785
    .line 786
    .line 787
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 788
    .line 789
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 790
    .line 791
    .line 792
    move-result-object p0

    .line 793
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 794
    .line 795
    .line 796
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 797
    .line 798
    .line 799
    move-result-object p0

    .line 800
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 801
    .line 802
    .line 803
    return-void

    .line 804
    :cond_6
    if-ne p1, v3, :cond_8

    .line 805
    .line 806
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 807
    .line 808
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1800(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 809
    .line 810
    .line 811
    move-result p1

    .line 812
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 813
    .line 814
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 815
    .line 816
    .line 817
    move-result-object p3

    .line 818
    iget p3, p3, Lcom/ss/android/ttvecamera/TECameraSettings;->v:I

    .line 819
    .line 820
    if-ne p1, p3, :cond_8

    .line 821
    .line 822
    if-eq p2, v5, :cond_7

    .line 823
    .line 824
    const/4 p1, 0x5

    .line 825
    if-eq p2, p1, :cond_7

    .line 826
    .line 827
    if-ne p2, v4, :cond_8

    .line 828
    .line 829
    :cond_7
    const-string p1, "TECameraServer"

    .line 830
    .line 831
    const-string p2, "camera2 is not available"

    .line 832
    .line 833
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 834
    .line 835
    .line 836
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 837
    .line 838
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 839
    .line 840
    .line 841
    move-result-object p2

    .line 842
    iget p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->x:I

    .line 843
    .line 844
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1802(Lcom/ss/android/ttvecamera/TECameraServer;I)I

    .line 845
    .line 846
    .line 847
    :cond_8
    const-wide/16 p1, 0x1e

    .line 848
    .line 849
    :try_start_4
    invoke-static {p1, p2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0

    .line 850
    .line 851
    .line 852
    goto :goto_3

    .line 853
    :catch_0
    move-exception p1

    .line 854
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 855
    .line 856
    .line 857
    :goto_3
    const-string p1, "TECameraServer"

    .line 858
    .line 859
    new-instance p2, Ljava/lang/StringBuilder;

    .line 860
    .line 861
    const-string p3, "retry to open camera, mRetryCnt = "

    .line 862
    .line 863
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 864
    .line 865
    .line 866
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 867
    .line 868
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1800(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 869
    .line 870
    .line 871
    move-result p3

    .line 872
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 873
    .line 874
    .line 875
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 876
    .line 877
    .line 878
    move-result-object p2

    .line 879
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 880
    .line 881
    .line 882
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 883
    .line 884
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1200(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/lang/Object;

    .line 885
    .line 886
    .line 887
    move-result-object v3

    .line 888
    monitor-enter v3

    .line 889
    :try_start_5
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 890
    .line 891
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 892
    .line 893
    .line 894
    move-result p1

    .line 895
    if-nez p1, :cond_9

    .line 896
    .line 897
    const-string p1, "TECameraServer"

    .line 898
    .line 899
    new-instance p2, Ljava/lang/StringBuilder;

    .line 900
    .line 901
    invoke-direct {p2, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 902
    .line 903
    .line 904
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 905
    .line 906
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 907
    .line 908
    .line 909
    move-result p3

    .line 910
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 911
    .line 912
    .line 913
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 914
    .line 915
    .line 916
    move-result-object p2

    .line 917
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 918
    .line 919
    .line 920
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 921
    .line 922
    invoke-static {p1, v7}, Lcom/ss/android/ttvecamera/TECameraServer;->access$302(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/c;)Lcom/ss/android/ttvecamera/c;

    .line 923
    .line 924
    .line 925
    goto :goto_4

    .line 926
    :catchall_2
    move-exception p0

    .line 927
    goto :goto_5

    .line 928
    :cond_9
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 929
    .line 930
    invoke-virtual {p1, v5}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 931
    .line 932
    .line 933
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 934
    .line 935
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 936
    .line 937
    .line 938
    move-result-object p1

    .line 939
    if-eqz p1, :cond_a

    .line 940
    .line 941
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 942
    .line 943
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 944
    .line 945
    .line 946
    move-result-object p1

    .line 947
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 948
    .line 949
    invoke-static {p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2000(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/bytedance/bpea/basics/Cert;

    .line 950
    .line 951
    .line 952
    move-result-object p2

    .line 953
    invoke-virtual {p1, p2}, Lcom/ss/android/ttvecamera/c;->f(Lcom/bytedance/bpea/basics/Cert;)V

    .line 954
    .line 955
    .line 956
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 957
    .line 958
    invoke-static {p1, v7}, Lcom/ss/android/ttvecamera/TECameraServer;->access$302(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/c;)Lcom/ss/android/ttvecamera/c;

    .line 959
    .line 960
    .line 961
    :cond_a
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 962
    .line 963
    invoke-virtual {p1, v6}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 964
    .line 965
    .line 966
    :goto_4
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 967
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 968
    .line 969
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1810(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 970
    .line 971
    .line 972
    sget-object p1, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 973
    .line 974
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 975
    .line 976
    invoke-static {p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2100(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d;

    .line 977
    .line 978
    .line 979
    move-result-object p2

    .line 980
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 981
    .line 982
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 983
    .line 984
    .line 985
    move-result-object p3

    .line 986
    iget-object p4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 987
    .line 988
    invoke-static {p4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2000(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/bytedance/bpea/basics/Cert;

    .line 989
    .line 990
    .line 991
    move-result-object p4

    .line 992
    invoke-static {p1, p2, p3, p4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$000(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I

    .line 993
    .line 994
    .line 995
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 996
    .line 997
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 998
    .line 999
    .line 1000
    move-result-object p1

    .line 1001
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1002
    .line 1003
    const-string p3, "ResultType"

    .line 1004
    .line 1005
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1006
    .line 1007
    .line 1008
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1009
    .line 1010
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1800(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 1011
    .line 1012
    .line 1013
    move-result p3

    .line 1014
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1015
    .line 1016
    .line 1017
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1018
    .line 1019
    .line 1020
    move-result-object p2

    .line 1021
    const-string p3, "retry to open camera"

    .line 1022
    .line 1023
    invoke-virtual {p1, p2, p3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1024
    .line 1025
    .line 1026
    const-string p1, "te_record_camera_open_info"

    .line 1027
    .line 1028
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1029
    .line 1030
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 1031
    .line 1032
    .line 1033
    move-result-object p0

    .line 1034
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->toString()Ljava/lang/String;

    .line 1035
    .line 1036
    .line 1037
    move-result-object p0

    .line 1038
    invoke-static {p1, p0}, Ll/hrh0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 1039
    .line 1040
    .line 1041
    goto/16 :goto_8

    .line 1042
    .line 1043
    :goto_5
    :try_start_6
    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 1044
    throw p0

    .line 1045
    :cond_b
    iget-object p4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1046
    .line 1047
    invoke-static {p4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 1048
    .line 1049
    .line 1050
    move-result-object p4

    .line 1051
    iget-boolean p4, p4, Lcom/ss/android/ttvecamera/TECameraSettings;->L:Z

    .line 1052
    .line 1053
    if-eqz p4, :cond_c

    .line 1054
    .line 1055
    if-eq p1, v4, :cond_c

    .line 1056
    .line 1057
    if-ne p2, v0, :cond_d

    .line 1058
    .line 1059
    :cond_c
    if-ne p2, v1, :cond_10

    .line 1060
    .line 1061
    :cond_d
    const-string p1, "TECameraServer"

    .line 1062
    .line 1063
    const-string p2, "Open camera failed, fall back to camera1"

    .line 1064
    .line 1065
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1066
    .line 1067
    .line 1068
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1069
    .line 1070
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 1071
    .line 1072
    .line 1073
    move-result-object p2

    .line 1074
    iget p2, p2, Lcom/ss/android/ttvecamera/TECameraSettings;->v:I

    .line 1075
    .line 1076
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1802(Lcom/ss/android/ttvecamera/TECameraServer;I)I

    .line 1077
    .line 1078
    .line 1079
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1080
    .line 1081
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1200(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/lang/Object;

    .line 1082
    .line 1083
    .line 1084
    move-result-object p4

    .line 1085
    monitor-enter p4

    .line 1086
    :try_start_7
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1087
    .line 1088
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 1089
    .line 1090
    .line 1091
    move-result p1

    .line 1092
    if-nez p1, :cond_e

    .line 1093
    .line 1094
    const-string p1, "TECameraServer"

    .line 1095
    .line 1096
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1097
    .line 1098
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1099
    .line 1100
    .line 1101
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1102
    .line 1103
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 1104
    .line 1105
    .line 1106
    move-result p3

    .line 1107
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1108
    .line 1109
    .line 1110
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1111
    .line 1112
    .line 1113
    move-result-object p2

    .line 1114
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 1115
    .line 1116
    .line 1117
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1118
    .line 1119
    invoke-static {p1, v7}, Lcom/ss/android/ttvecamera/TECameraServer;->access$302(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/c;)Lcom/ss/android/ttvecamera/c;

    .line 1120
    .line 1121
    .line 1122
    goto :goto_6

    .line 1123
    :catchall_3
    move-exception p0

    .line 1124
    goto :goto_7

    .line 1125
    :cond_e
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1126
    .line 1127
    invoke-virtual {p1, v5}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 1128
    .line 1129
    .line 1130
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1131
    .line 1132
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 1133
    .line 1134
    .line 1135
    move-result-object p1

    .line 1136
    if-eqz p1, :cond_f

    .line 1137
    .line 1138
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1139
    .line 1140
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 1141
    .line 1142
    .line 1143
    move-result-object p1

    .line 1144
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1145
    .line 1146
    invoke-static {p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2000(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/bytedance/bpea/basics/Cert;

    .line 1147
    .line 1148
    .line 1149
    move-result-object p2

    .line 1150
    invoke-virtual {p1, p2}, Lcom/ss/android/ttvecamera/c;->f(Lcom/bytedance/bpea/basics/Cert;)V

    .line 1151
    .line 1152
    .line 1153
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1154
    .line 1155
    invoke-static {p1, v7}, Lcom/ss/android/ttvecamera/TECameraServer;->access$302(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/c;)Lcom/ss/android/ttvecamera/c;

    .line 1156
    .line 1157
    .line 1158
    :cond_f
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1159
    .line 1160
    invoke-virtual {p1, v6}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 1161
    .line 1162
    .line 1163
    :goto_6
    monitor-exit p4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 1164
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1165
    .line 1166
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 1167
    .line 1168
    .line 1169
    move-result-object p1

    .line 1170
    iput v4, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 1171
    .line 1172
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1173
    .line 1174
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1500(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c$a;

    .line 1175
    .line 1176
    .line 1177
    move-result-object p1

    .line 1178
    const/16 p2, 0x33

    .line 1179
    .line 1180
    const-string p3, "need recreate surfacetexture"

    .line 1181
    .line 1182
    invoke-interface {p1, p2, v6, p3, v7}, Lcom/ss/android/ttvecamera/c$a;->e(IILjava/lang/String;Ljava/lang/Object;)V

    .line 1183
    .line 1184
    .line 1185
    sget-object p1, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1186
    .line 1187
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1188
    .line 1189
    invoke-static {p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2100(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d;

    .line 1190
    .line 1191
    .line 1192
    move-result-object p2

    .line 1193
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1194
    .line 1195
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 1196
    .line 1197
    .line 1198
    move-result-object p3

    .line 1199
    iget-object p4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1200
    .line 1201
    invoke-static {p4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2000(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/bytedance/bpea/basics/Cert;

    .line 1202
    .line 1203
    .line 1204
    move-result-object p4

    .line 1205
    invoke-static {p1, p2, p3, p4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$000(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/ss/android/ttvecamera/d;Lcom/ss/android/ttvecamera/TECameraSettings;Lcom/bytedance/bpea/basics/Cert;)I

    .line 1206
    .line 1207
    .line 1208
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1209
    .line 1210
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 1211
    .line 1212
    .line 1213
    move-result-object p1

    .line 1214
    const-string p2, "ResultType"

    .line 1215
    .line 1216
    const-string p3, "fallback to Camera1"

    .line 1217
    .line 1218
    invoke-virtual {p1, p2, p3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1219
    .line 1220
    .line 1221
    const-string p1, "te_record_camera_open_info"

    .line 1222
    .line 1223
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1224
    .line 1225
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 1226
    .line 1227
    .line 1228
    move-result-object p0

    .line 1229
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->toString()Ljava/lang/String;

    .line 1230
    .line 1231
    .line 1232
    move-result-object p0

    .line 1233
    invoke-static {p1, p0}, Ll/hrh0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 1234
    .line 1235
    .line 1236
    goto/16 :goto_8

    .line 1237
    .line 1238
    :goto_7
    :try_start_8
    monitor-exit p4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 1239
    throw p0

    .line 1240
    :cond_10
    iget-object p3, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1241
    .line 1242
    invoke-static {p3}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d$b;

    .line 1243
    .line 1244
    .line 1245
    move-result-object p3

    .line 1246
    invoke-interface {p3, p1, p2}, Lcom/ss/android/ttvecamera/d$b;->onCaptureStarted(II)V

    .line 1247
    .line 1248
    .line 1249
    const-string p1, "TECameraServer"

    .line 1250
    .line 1251
    const-string p3, "finally go to the error."

    .line 1252
    .line 1253
    invoke-static {p1, p3}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1254
    .line 1255
    .line 1256
    const-string p1, "te_record_camera_open_ret"

    .line 1257
    .line 1258
    int-to-long p3, p2

    .line 1259
    invoke-static {p1, p3, p4}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 1260
    .line 1261
    .line 1262
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1263
    .line 1264
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d$b;

    .line 1265
    .line 1266
    .line 1267
    move-result-object p1

    .line 1268
    new-instance p3, Ljava/lang/StringBuilder;

    .line 1269
    .line 1270
    const-string p4, "Open camera failed @"

    .line 1271
    .line 1272
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1273
    .line 1274
    .line 1275
    iget-object p4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1276
    .line 1277
    invoke-static {p4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 1278
    .line 1279
    .line 1280
    move-result-object p4

    .line 1281
    iget p4, p4, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 1282
    .line 1283
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1284
    .line 1285
    .line 1286
    const-string p4, ",face:"

    .line 1287
    .line 1288
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1289
    .line 1290
    .line 1291
    iget-object p4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1292
    .line 1293
    invoke-static {p4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 1294
    .line 1295
    .line 1296
    move-result-object p4

    .line 1297
    iget p4, p4, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 1298
    .line 1299
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1300
    .line 1301
    .line 1302
    const-string p4, " "

    .line 1303
    .line 1304
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1305
    .line 1306
    .line 1307
    iget-object p4, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1308
    .line 1309
    invoke-static {p4}, Lcom/ss/android/ttvecamera/TECameraServer;->access$200(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 1310
    .line 1311
    .line 1312
    move-result-object p4

    .line 1313
    iget-object p4, p4, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 1314
    .line 1315
    invoke-virtual {p4}, Lcom/ss/android/ttvecamera/TEFrameSizei;->toString()Ljava/lang/String;

    .line 1316
    .line 1317
    .line 1318
    move-result-object p4

    .line 1319
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1320
    .line 1321
    .line 1322
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1323
    .line 1324
    .line 1325
    move-result-object p3

    .line 1326
    invoke-interface {p1, p2, p3}, Lcom/ss/android/ttvecamera/d$b;->onError(ILjava/lang/String;)V

    .line 1327
    .line 1328
    .line 1329
    sget-object p1, Lcom/ss/android/ttvecamera/TECameraServer;->INSTANCE:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1330
    .line 1331
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1332
    .line 1333
    invoke-static {p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2000(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/bytedance/bpea/basics/Cert;

    .line 1334
    .line 1335
    .line 1336
    move-result-object p2

    .line 1337
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$2300(Lcom/ss/android/ttvecamera/TECameraServer;Lcom/bytedance/bpea/basics/Cert;)I

    .line 1338
    .line 1339
    .line 1340
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1341
    .line 1342
    invoke-static {p1, v2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1802(Lcom/ss/android/ttvecamera/TECameraServer;I)I

    .line 1343
    .line 1344
    .line 1345
    const-string p1, "te_record_camera_open_info"

    .line 1346
    .line 1347
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1348
    .line 1349
    invoke-static {p2}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 1350
    .line 1351
    .line 1352
    move-result-object p2

    .line 1353
    invoke-virtual {p2}, Ljava/util/concurrent/ConcurrentHashMap;->toString()Ljava/lang/String;

    .line 1354
    .line 1355
    .line 1356
    move-result-object p2

    .line 1357
    invoke-static {p1, p2}, Ll/hrh0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 1358
    .line 1359
    .line 1360
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 1361
    .line 1362
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1900(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 1363
    .line 1364
    .line 1365
    move-result-object p0

    .line 1366
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 1367
    .line 1368
    .line 1369
    :goto_8
    invoke-static {}, Ll/dsh0;->b()V

    .line 1370
    .line 1371
    .line 1372
    return-void
.end method

.method public g(IIILjava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string p1, "onTorchError "

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    if-nez p3, :cond_0

    .line 12
    .line 13
    const-string p1, " close"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p1, " open"

    .line 17
    .line 18
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "TECameraServer"

    .line 26
    .line 27
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public h(IIILjava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string p1, "onTorchSuccess "

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    if-nez p3, :cond_0

    .line 12
    .line 13
    const-string p1, " close"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p1, " open"

    .line 17
    .line 18
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "TECameraServer"

    .line 26
    .line 27
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public i(ILcom/ss/android/ttvecamera/c;Ljava/lang/Object;)V
    .locals 1

    .line 1
    const-string p1, "TECameraServer"

    .line 2
    .line 3
    new-instance p3, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v0, "onCameraClosed, CameraState = "

    .line 6
    .line 7
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$100(Lcom/ss/android/ttvecamera/TECameraServer;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-static {p1, p3}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-ne p2, p1, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 35
    .line 36
    invoke-static {p1}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1200(Lcom/ss/android/ttvecamera/TECameraServer;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    monitor-enter p1

    .line 41
    :try_start_0
    iget-object p2, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 42
    .line 43
    const/4 p3, 0x0

    .line 44
    invoke-virtual {p2, p3}, Lcom/ss/android/ttvecamera/TECameraServer;->updateCameraState(I)V

    .line 45
    .line 46
    .line 47
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraServer$n0;->a:Lcom/ss/android/ttvecamera/TECameraServer;

    .line 49
    .line 50
    invoke-static {p0}, Lcom/ss/android/ttvecamera/TECameraServer;->access$1300(Lcom/ss/android/ttvecamera/TECameraServer;)Lcom/ss/android/ttvecamera/d$b;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-interface {p0, p3}, Lcom/ss/android/ttvecamera/d$b;->onCaptureStopped(I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :catchall_0
    move-exception p0

    .line 59
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    throw p0

    .line 61
    :cond_0
    return-void
.end method
