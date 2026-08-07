.class Lcom/ss/android/ttvecamera/a$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$AutoFocusCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/a;->m(Lcom/ss/android/ttvecamera/TEFocusSettings;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/TEFocusSettings;

.field final synthetic b:Lcom/ss/android/ttvecamera/a;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/a;Lcom/ss/android/ttvecamera/TEFocusSettings;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/a$d;->b:Lcom/ss/android/ttvecamera/a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/android/ttvecamera/a$d;->a:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAutoFocus(ZLandroid/hardware/Camera;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/a$d;->a:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a$d;->a:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->h()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget-object v2, p0, Lcom/ss/android/ttvecamera/a$d;->b:Lcom/ss/android/ttvecamera/a;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 18
    .line 19
    iget v2, v2, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 20
    .line 21
    const-string v3, "Camera Focus Succeed!"

    .line 22
    .line 23
    invoke-interface {v0, v1, v2, v3}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/TEFocusSettings;->g()Lcom/ss/android/ttvecamera/TEFocusSettings$b;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a$d;->b:Lcom/ss/android/ttvecamera/a;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/ss/android/ttvecamera/c;->b:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 34
    .line 35
    iget v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 36
    .line 37
    const/4 v2, -0x1

    .line 38
    const-string v3, "Camera Focus Failed!"

    .line 39
    .line 40
    invoke-interface {v0, v2, v1, v3}, Lcom/ss/android/ttvecamera/TEFocusSettings$b;->a(IILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :goto_0
    const-string v0, "TECamera1"

    .line 44
    .line 45
    invoke-static {v0, v3}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/ss/android/ttvecamera/a$d;->a:Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->n()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    :try_start_0
    invoke-virtual {p2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const-string v1, "continuous-video"

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2, p1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/ss/android/ttvecamera/a$d;->b:Lcom/ss/android/ttvecamera/a;

    .line 72
    .line 73
    invoke-static {p1}, Lcom/ss/android/ttvecamera/a;->I0(Lcom/ss/android/ttvecamera/a;)I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    invoke-virtual {p1, p2}, Lcom/ss/android/ttvecamera/a;->T0(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :catch_0
    move-exception p1

    .line 82
    new-instance p2, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v1, "Error: focusAtPoint failed: "

    .line 85
    .line 86
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a$d;->b:Lcom/ss/android/ttvecamera/a;

    .line 104
    .line 105
    iget-object p2, p0, Lcom/ss/android/ttvecamera/c;->d:Lcom/ss/android/ttvecamera/c$a;

    .line 106
    .line 107
    const/16 v0, -0x19b

    .line 108
    .line 109
    iget-object p0, p0, Lcom/ss/android/ttvecamera/a;->y:Landroid/hardware/Camera;

    .line 110
    .line 111
    const/4 v1, 0x1

    .line 112
    invoke-interface {p2, v1, v0, p1, p0}, Lcom/ss/android/ttvecamera/c$a;->c(IILjava/lang/String;Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method
