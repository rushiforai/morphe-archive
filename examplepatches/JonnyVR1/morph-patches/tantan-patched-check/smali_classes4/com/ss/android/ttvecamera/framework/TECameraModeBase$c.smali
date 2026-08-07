.class Lcom/ss/android/ttvecamera/framework/TECameraModeBase$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lwk$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttvecamera/framework/TECameraModeBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/framework/TECameraModeBase;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$c;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$c;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->h:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 4
    .line 5
    iget-boolean v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->n:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/b;->U0()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x3

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    const-string v0, "TECameraModeBase"

    .line 21
    .line 22
    const-string v1, "gyro onChange set focus mode to continuous focus."

    .line 23
    .line 24
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$c;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->d()I

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$c;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->a()I

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$c;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/b;->T0()Ll/lwk;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$c;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g:Lcom/ss/android/ttvecamera/b;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/b;->T0()Ll/lwk;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object p0, p0, Lcom/ss/android/ttvecamera/framework/TECameraModeBase$c;->a:Lcom/ss/android/ttvecamera/framework/TECameraModeBase;

    .line 56
    .line 57
    invoke-static {p0}, Lcom/ss/android/ttvecamera/framework/TECameraModeBase;->g(Lcom/ss/android/ttvecamera/framework/TECameraModeBase;)Ll/lwk$b;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v0, p0}, Ll/lwk;->i(Ll/lwk$b;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method
