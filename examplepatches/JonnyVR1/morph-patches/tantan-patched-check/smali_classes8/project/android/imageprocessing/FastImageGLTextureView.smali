.class public Lproject/android/imageprocessing/FastImageGLTextureView;
.super Lproject/android/imageprocessing/GLTextureView;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lproject/android/imageprocessing/GLTextureView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x3

    .line 5
    invoke-virtual {p0, p1}, Lproject/android/imageprocessing/GLTextureView;->setDebugFlags(I)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x2

    .line 9
    invoke-virtual {p0, p1}, Lproject/android/imageprocessing/GLTextureView;->setEGLContextClientVersion(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lproject/android/imageprocessing/GLTextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x3

    .line 14
    invoke-virtual {p0, p1}, Lproject/android/imageprocessing/GLTextureView;->setDebugFlags(I)V

    const/4 p1, 0x2

    .line 15
    invoke-virtual {p0, p1}, Lproject/android/imageprocessing/GLTextureView;->setEGLContextClientVersion(I)V

    return-void
.end method


# virtual methods
.method public setPipeline(Landroid/opengl/GLSurfaceView$Renderer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lproject/android/imageprocessing/GLTextureView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lproject/android/imageprocessing/GLTextureView;->setRenderMode(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
