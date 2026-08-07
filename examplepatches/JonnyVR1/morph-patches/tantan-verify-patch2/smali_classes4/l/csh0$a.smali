.class Ll/csh0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/csh0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/csh0;


# direct methods
.method public constructor <init>(Ll/csh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/csh0$a;->a:Ll/csh0;

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
    iget-object v0, p0, Ll/csh0$a;->a:Ll/csh0;

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
    iget-object v0, v0, Ll/csh0;->m:[F

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Lcom/ss/android/ttvecamera/TECameraFrame;

    .line 14
    .line 15
    iget-object v0, p0, Ll/csh0$a;->a:Ll/csh0;

    .line 16
    .line 17
    iget-object v0, v0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 18
    .line 19
    iget v2, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 20
    .line 21
    iget v0, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->getTimestamp()J

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    invoke-direct {v1, v2, v0, v3, v4}, Lcom/ss/android/ttvecamera/TECameraFrame;-><init>(IIJ)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/csh0$a;->a:Ll/csh0;

    .line 31
    .line 32
    iget v2, p1, Ll/csh0;->n:I

    .line 33
    .line 34
    iget-object p1, p1, Ll/irh0;->d:Lcom/ss/android/ttvecamera/c;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/c;->D()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    iget-object p1, p0, Ll/csh0$a;->a:Ll/csh0;

    .line 41
    .line 42
    iget-object v4, p1, Ll/csh0;->m:[F

    .line 43
    .line 44
    iget-object v5, p1, Ll/irh0;->b:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 45
    .line 46
    iget-object p1, p1, Ll/irh0;->d:Lcom/ss/android/ttvecamera/c;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/c;->y()I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    invoke-virtual/range {v1 .. v6}, Lcom/ss/android/ttvecamera/TECameraFrame;->e(II[FLcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;I)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/csh0$a;->a:Ll/csh0;

    .line 56
    .line 57
    iget-object p1, p1, Ll/irh0;->g:Lcom/ss/android/ttvecamera/TECameraFrame$d;

    .line 58
    .line 59
    invoke-virtual {v1, p1}, Lcom/ss/android/ttvecamera/TECameraFrame;->h(Lcom/ss/android/ttvecamera/TECameraFrame$d;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/csh0$a;->a:Ll/csh0;

    .line 63
    .line 64
    invoke-virtual {p0, v1}, Ll/irh0;->k(Lcom/ss/android/ttvecamera/TECameraFrame;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
