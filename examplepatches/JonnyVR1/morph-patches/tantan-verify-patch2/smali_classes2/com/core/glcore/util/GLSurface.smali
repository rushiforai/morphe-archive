.class public Lcom/core/glcore/util/GLSurface;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/core/glcore/util/GLSurface$Viewport;
    }
.end annotation


# static fields
.field public static final TYPE_PBUFFER_SURFACE:I = 0x1

.field public static final TYPE_PIXMAP_SURFACE:I = 0x2

.field public static final TYPE_WINDOW_SURFACE:I


# instance fields
.field protected eglSurface:Landroid/opengl/EGLSurface;

.field protected surface:Ljava/lang/Object;

.field protected final type:I

.field protected viewport:Lcom/core/glcore/util/GLSurface$Viewport;


# direct methods
.method public constructor <init>(II)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/core/glcore/util/GLSurface;->eglSurface:Landroid/opengl/EGLSurface;

    .line 7
    .line 8
    new-instance v0, Lcom/core/glcore/util/GLSurface$Viewport;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/core/glcore/util/GLSurface$Viewport;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/core/glcore/util/GLSurface;->viewport:Lcom/core/glcore/util/GLSurface$Viewport;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0, v0, p1, p2}, Lcom/core/glcore/util/GLSurface;->setViewport(IIII)V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput-object p1, p0, Lcom/core/glcore/util/GLSurface;->surface:Ljava/lang/Object;

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    iput p1, p0, Lcom/core/glcore/util/GLSurface;->type:I

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/view/Surface;II)V
    .locals 6

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move v5, p3

    .line 26
    invoke-direct/range {v0 .. v5}, Lcom/core/glcore/util/GLSurface;-><init>(Landroid/view/Surface;IIII)V

    return-void
.end method

.method public constructor <init>(Landroid/view/Surface;IIII)V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lcom/core/glcore/util/GLSurface;->eglSurface:Landroid/opengl/EGLSurface;

    .line 29
    new-instance v0, Lcom/core/glcore/util/GLSurface$Viewport;

    invoke-direct {v0}, Lcom/core/glcore/util/GLSurface$Viewport;-><init>()V

    iput-object v0, p0, Lcom/core/glcore/util/GLSurface;->viewport:Lcom/core/glcore/util/GLSurface$Viewport;

    .line 30
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/core/glcore/util/GLSurface;->setViewport(IIII)V

    .line 31
    iput-object p1, p0, Lcom/core/glcore/util/GLSurface;->surface:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 32
    iput p1, p0, Lcom/core/glcore/util/GLSurface;->type:I

    return-void
.end method


# virtual methods
.method public getViewport()Lcom/core/glcore/util/GLSurface$Viewport;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/util/GLSurface;->viewport:Lcom/core/glcore/util/GLSurface$Viewport;

    .line 2
    .line 3
    return-object p0
.end method

.method public setViewport(IIII)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/util/GLSurface;->viewport:Lcom/core/glcore/util/GLSurface$Viewport;

    .line 2
    .line 3
    iput p1, p0, Lcom/core/glcore/util/GLSurface$Viewport;->x:I

    .line 4
    .line 5
    iput p2, p0, Lcom/core/glcore/util/GLSurface$Viewport;->y:I

    .line 6
    .line 7
    iput p3, p0, Lcom/core/glcore/util/GLSurface$Viewport;->width:I

    .line 8
    .line 9
    iput p4, p0, Lcom/core/glcore/util/GLSurface$Viewport;->height:I

    .line 10
    .line 11
    return-void
.end method

.method public setViewport(Lcom/core/glcore/util/GLSurface$Viewport;)V
    .locals 0

    .line 12
    iput-object p1, p0, Lcom/core/glcore/util/GLSurface;->viewport:Lcom/core/glcore/util/GLSurface$Viewport;

    return-void
.end method
