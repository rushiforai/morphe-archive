.class public final Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Z

.field public c:Z

.field public d:Z

.field public e:Ljava/lang/String;

.field public f:I

.field public g:Z

.field public h:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->b:Z

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->f:I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->g:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->h:Z

    .line 14
    .line 15
    return-void
.end method

.method public synthetic constructor <init>(Ll/avh0;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;-><init>(Ll/avh0;)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->s(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-boolean v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->b:Z

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->t(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->e:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->o(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->f:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->r(I)V

    .line 25
    .line 26
    .line 27
    iget-boolean v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->c:Z

    .line 28
    .line 29
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->c(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;Z)V

    .line 30
    .line 31
    .line 32
    iget-boolean v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->d:Z

    .line 33
    .line 34
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->b(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;Z)V

    .line 35
    .line 36
    .line 37
    iget-boolean v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->g:Z

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->a(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;Z)V

    .line 40
    .line 41
    .line 42
    iget-boolean p0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->h:Z

    .line 43
    .line 44
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->d(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;Z)V

    .line 45
    .line 46
    .line 47
    return-object v0
.end method

.method public b(Ljava/lang/String;)Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->a:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/camera/TTCameraConfig;)Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->o()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->c:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->e(I)Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->h()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "avatar"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->h()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "emblem"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    :cond_1
    const/4 v0, 0x1

    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->e(I)Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;

    .line 39
    .line 40
    .line 41
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->k()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iput-boolean p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->d:Z

    .line 46
    .line 47
    return-object p0
.end method

.method public d(Z)Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->d:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public e(I)Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ljava/lang/String;)Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Z)Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->b:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->h:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public i()Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig$b;->g:Z

    .line 3
    .line 4
    return-object p0
.end method
