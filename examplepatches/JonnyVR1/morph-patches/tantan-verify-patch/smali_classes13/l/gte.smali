.class public Ll/gte;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/gse;

.field public b:Landroid/opengl/EGLSurface;

.field public c:I

.field public d:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/gse;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 5
    .line 6
    iput-object v0, p0, Ll/gte;->b:Landroid/opengl/EGLSurface;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Ll/gte;->c:I

    .line 10
    .line 11
    iput v0, p0, Ll/gte;->d:I

    .line 12
    .line 13
    iput-object p1, p0, Ll/gte;->a:Ll/gse;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gte;->b:Landroid/opengl/EGLSurface;

    .line 2
    .line 3
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/gte;->a:Ll/gse;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/gse;->b(Ljava/lang/Object;)Landroid/opengl/EGLSurface;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/gte;->b:Landroid/opengl/EGLSurface;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string p0, "surface already created"

    .line 17
    .line 18
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gte;->a:Ll/gse;

    .line 2
    .line 3
    iget-object p0, p0, Ll/gte;->b:Landroid/opengl/EGLSurface;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/gse;->d(Landroid/opengl/EGLSurface;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gte;->a:Ll/gse;

    .line 2
    .line 3
    iget-object p0, p0, Ll/gte;->b:Landroid/opengl/EGLSurface;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1, p2}, Ll/gse;->f(Landroid/opengl/EGLSurface;J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gte;->a:Ll/gse;

    .line 2
    .line 3
    iget-object p0, p0, Ll/gte;->b:Landroid/opengl/EGLSurface;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/gse;->g(Landroid/opengl/EGLSurface;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
