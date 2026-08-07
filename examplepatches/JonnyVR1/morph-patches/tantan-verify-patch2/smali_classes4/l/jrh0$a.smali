.class public Ll/jrh0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jrh0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:Lcom/ss/android/ttvecamera/TEFrameSizei;

.field public c:Ll/irh0$c;

.field public d:Landroid/graphics/SurfaceTexture;

.field public e:I

.field public f:I

.field public g:Landroid/view/Surface;

.field public h:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/TEFrameSizei;Ll/irh0$c;ZLandroid/graphics/SurfaceTexture;I)V
    .locals 1
    .param p2    # Ll/irh0$c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 49
    iput-boolean v0, p0, Ll/jrh0$a;->a:Z

    const/4 v0, 0x0

    .line 50
    iput v0, p0, Ll/jrh0$a;->f:I

    .line 51
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;->PIXEL_FORMAT_Count:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    iput-object v0, p0, Ll/jrh0$a;->h:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 52
    iput-object p1, p0, Ll/jrh0$a;->b:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 53
    iput-object p2, p0, Ll/jrh0$a;->c:Ll/irh0$c;

    .line 54
    iput-object p4, p0, Ll/jrh0$a;->d:Landroid/graphics/SurfaceTexture;

    .line 55
    iput p5, p0, Ll/jrh0$a;->e:I

    .line 56
    iput-boolean p3, p0, Ll/jrh0$a;->a:Z

    .line 57
    sget-object p1, Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;->PIXEL_FORMAT_OpenGL_OES:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    iput-object p1, p0, Ll/jrh0$a;->h:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    return-void
.end method

.method public constructor <init>(Lcom/ss/android/ttvecamera/TEFrameSizei;Ll/irh0$c;ZLandroid/graphics/SurfaceTexture;Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;)V
    .locals 1
    .param p2    # Ll/irh0$c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 40
    iput-boolean v0, p0, Ll/jrh0$a;->a:Z

    const/4 v0, 0x0

    .line 41
    iput v0, p0, Ll/jrh0$a;->f:I

    .line 42
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;->PIXEL_FORMAT_YUV420:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 43
    iput-object p1, p0, Ll/jrh0$a;->b:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 44
    iput-object p2, p0, Ll/jrh0$a;->c:Ll/irh0$c;

    .line 45
    iput-object p4, p0, Ll/jrh0$a;->d:Landroid/graphics/SurfaceTexture;

    .line 46
    iput-boolean p3, p0, Ll/jrh0$a;->a:Z

    .line 47
    iput-object p5, p0, Ll/jrh0$a;->h:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    return-void
.end method

.method public constructor <init>(Ll/jrh0$a;)V
    .locals 1
    .param p1    # Ll/jrh0$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/jrh0$a;->a:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/jrh0$a;->f:I

    .line 9
    .line 10
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;->PIXEL_FORMAT_Count:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 11
    .line 12
    iput-object v0, p0, Ll/jrh0$a;->h:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 13
    .line 14
    iget-boolean v0, p1, Ll/jrh0$a;->a:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Ll/jrh0$a;->a:Z

    .line 17
    .line 18
    iget-object v0, p1, Ll/jrh0$a;->b:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 19
    .line 20
    iput-object v0, p0, Ll/jrh0$a;->b:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 21
    .line 22
    iget-object v0, p1, Ll/jrh0$a;->c:Ll/irh0$c;

    .line 23
    .line 24
    iput-object v0, p0, Ll/jrh0$a;->c:Ll/irh0$c;

    .line 25
    .line 26
    iget-object v0, p1, Ll/jrh0$a;->d:Landroid/graphics/SurfaceTexture;

    .line 27
    .line 28
    iput-object v0, p0, Ll/jrh0$a;->d:Landroid/graphics/SurfaceTexture;

    .line 29
    .line 30
    iget v0, p1, Ll/jrh0$a;->e:I

    .line 31
    .line 32
    iput v0, p0, Ll/jrh0$a;->e:I

    .line 33
    .line 34
    iget p1, p1, Ll/jrh0$a;->f:I

    .line 35
    .line 36
    iput p1, p0, Ll/jrh0$a;->f:I

    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public a(Ll/jrh0$a;)V
    .locals 1
    .param p1    # Ll/jrh0$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p1, Ll/jrh0$a;->a:Z

    .line 2
    .line 3
    iput-boolean v0, p0, Ll/jrh0$a;->a:Z

    .line 4
    .line 5
    iget-object v0, p1, Ll/jrh0$a;->b:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 6
    .line 7
    iput-object v0, p0, Ll/jrh0$a;->b:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 8
    .line 9
    iget-object v0, p1, Ll/jrh0$a;->c:Ll/irh0$c;

    .line 10
    .line 11
    iput-object v0, p0, Ll/jrh0$a;->c:Ll/irh0$c;

    .line 12
    .line 13
    iget-object v0, p1, Ll/jrh0$a;->d:Landroid/graphics/SurfaceTexture;

    .line 14
    .line 15
    iput-object v0, p0, Ll/jrh0$a;->d:Landroid/graphics/SurfaceTexture;

    .line 16
    .line 17
    iget v0, p1, Ll/jrh0$a;->e:I

    .line 18
    .line 19
    iput v0, p0, Ll/jrh0$a;->e:I

    .line 20
    .line 21
    iget p1, p1, Ll/jrh0$a;->f:I

    .line 22
    .line 23
    iput p1, p0, Ll/jrh0$a;->f:I

    .line 24
    .line 25
    return-void
.end method

.method public b(Ll/jrh0$a;)Z
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean v0, p0, Ll/jrh0$a;->a:Z

    .line 4
    .line 5
    iget-boolean v1, p1, Ll/jrh0$a;->a:Z

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/jrh0$a;->b:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 10
    .line 11
    iget v1, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 12
    .line 13
    iget-object v2, p1, Ll/jrh0$a;->b:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 14
    .line 15
    iget v3, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_0

    .line 18
    .line 19
    iget v0, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 20
    .line 21
    iget v1, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 22
    .line 23
    if-ne v0, v1, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/jrh0$a;->c:Ll/irh0$c;

    .line 26
    .line 27
    iget-object v1, p1, Ll/jrh0$a;->c:Ll/irh0$c;

    .line 28
    .line 29
    if-ne v0, v1, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Ll/jrh0$a;->d:Landroid/graphics/SurfaceTexture;

    .line 32
    .line 33
    iget-object v1, p1, Ll/jrh0$a;->d:Landroid/graphics/SurfaceTexture;

    .line 34
    .line 35
    if-ne v0, v1, :cond_0

    .line 36
    .line 37
    iget v0, p0, Ll/jrh0$a;->e:I

    .line 38
    .line 39
    iget v1, p1, Ll/jrh0$a;->e:I

    .line 40
    .line 41
    if-ne v0, v1, :cond_0

    .line 42
    .line 43
    iget p0, p0, Ll/jrh0$a;->f:I

    .line 44
    .line 45
    iget p1, p1, Ll/jrh0$a;->f:I

    .line 46
    .line 47
    if-ne p0, p1, :cond_0

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_0
    const/4 p0, 0x0

    .line 52
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ProviderSettings: [mIsPreview = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Ll/jrh0$a;->a:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", mSize = "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/jrh0$a;->b:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", mListener = "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/jrh0$a;->c:Ll/irh0$c;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", mSurfaceTexture = "

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Ll/jrh0$a;->d:Landroid/graphics/SurfaceTexture;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", mTextureOES = "

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Ll/jrh0$a;->e:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", mImageReaderCount = "

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget p0, p0, Ll/jrh0$a;->f:I

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p0, "]"

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method
