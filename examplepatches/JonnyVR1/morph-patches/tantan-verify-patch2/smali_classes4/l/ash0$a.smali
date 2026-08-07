.class Ll/ash0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ash0;->i(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ash0;


# direct methods
.method public constructor <init>(Ll/ash0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ash0$a;->a:Ll/ash0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ash0$a;->a:Ll/ash0;

    .line 2
    .line 3
    iget-object v1, v0, Ll/irh0;->d:Lcom/ss/android/ttvecamera/c;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {v0}, Ll/ash0;->p(Ll/ash0;)[F

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1, v0}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraFrame;

    .line 16
    .line 17
    iget-object v0, p0, Ll/ash0$a;->a:Ll/ash0;

    .line 18
    .line 19
    iget-object v0, v0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 20
    .line 21
    iget v2, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 22
    .line 23
    iget v0, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->getTimestamp()J

    .line 26
    .line 27
    .line 28
    move-result-wide v3

    .line 29
    invoke-direct {v1, v2, v0, v3, v4}, Lcom/ss/android/ttvecamera/TECameraFrame;-><init>(IIJ)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/ash0$a;->a:Ll/ash0;

    .line 33
    .line 34
    iget v2, p1, Ll/ash0;->o:I

    .line 35
    .line 36
    iget-object p1, p1, Ll/irh0;->d:Lcom/ss/android/ttvecamera/c;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/c;->D()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    iget-object p1, p0, Ll/ash0$a;->a:Ll/ash0;

    .line 43
    .line 44
    invoke-static {p1}, Ll/ash0;->p(Ll/ash0;)[F

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    iget-object p1, p0, Ll/ash0$a;->a:Ll/ash0;

    .line 49
    .line 50
    iget-object v5, p1, Ll/irh0;->b:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 51
    .line 52
    iget-object p1, p1, Ll/irh0;->d:Lcom/ss/android/ttvecamera/c;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/c;->y()I

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    invoke-virtual/range {v1 .. v6}, Lcom/ss/android/ttvecamera/TECameraFrame;->e(II[FLcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;I)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/ash0$a;->a:Ll/ash0;

    .line 62
    .line 63
    invoke-virtual {p0, v1}, Ll/irh0;->k(Lcom/ss/android/ttvecamera/TECameraFrame;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
