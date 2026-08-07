.class Lcom/ss/android/ttvecamera/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$ErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/a;->u0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/a;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/a$a;->a:Lcom/ss/android/ttvecamera/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onError(ILandroid/hardware/Camera;)V
    .locals 3

    .line 1
    const-string p2, "te_record_camera_err_ret"

    .line 2
    .line 3
    int-to-long v0, p1

    .line 4
    invoke-static {p2, v0, v1}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 5
    .line 6
    .line 7
    const/16 p2, 0x64

    .line 8
    .line 9
    const-string v0, "TECamera1"

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-ne p1, p2, :cond_0

    .line 13
    .line 14
    const-string p1, "Camera server died!"

    .line 15
    .line 16
    const/16 p2, -0x197

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p2, 0x2

    .line 20
    if-ne p1, p2, :cond_1

    .line 21
    .line 22
    new-instance p2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v2, "Camera disconnected: "

    .line 25
    .line 26
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const/16 p2, -0x199

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    if-ne p1, v1, :cond_3

    .line 40
    .line 41
    new-instance p2, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v2, "Camera unknown error: "

    .line 44
    .line 45
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const/16 p2, -0x19a

    .line 56
    .line 57
    :goto_0
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a$a;->a:Lcom/ss/android/ttvecamera/a;

    .line 61
    .line 62
    iget-object v2, v0, Lcom/ss/android/ttvecamera/c;->t:Lcom/bytedance/bpea/basics/Cert;

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Lcom/ss/android/ttvecamera/a;->f(Lcom/bytedance/bpea/basics/Cert;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a$a;->a:Lcom/ss/android/ttvecamera/a;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/c;->z0()V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a$a;->a:Lcom/ss/android/ttvecamera/a;

    .line 73
    .line 74
    iget-object v0, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 75
    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 79
    .line 80
    invoke-interface {v0, v1, p2, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->b(IILjava/lang/String;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    :cond_2
    return-void

    .line 84
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string p2, "Ignore camera error here: "

    .line 87
    .line 88
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method
