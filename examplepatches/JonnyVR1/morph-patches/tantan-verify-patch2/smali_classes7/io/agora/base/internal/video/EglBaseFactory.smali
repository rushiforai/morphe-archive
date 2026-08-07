.class public Lio/agora/base/internal/video/EglBaseFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static create()Lio/agora/base/internal/video/EglBase;
    .locals 2

    const/4 v0, 0x0

    .line 32
    sget-object v1, Lio/agora/base/internal/video/EglBase;->CONFIG_PLAIN:[I

    invoke-static {v0, v1}, Lio/agora/base/internal/video/EglBaseFactory;->create(Lio/agora/base/internal/video/EglBase$Context;[I)Lio/agora/base/internal/video/EglBase;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lio/agora/base/internal/video/EglBase$Context;)Lio/agora/base/internal/video/EglBase;
    .locals 1

    .line 33
    sget-object v0, Lio/agora/base/internal/video/EglBase;->CONFIG_PLAIN:[I

    invoke-static {p0, v0}, Lio/agora/base/internal/video/EglBaseFactory;->create(Lio/agora/base/internal/video/EglBase$Context;[I)Lio/agora/base/internal/video/EglBase;

    move-result-object p0

    return-object p0
.end method

.method public static create(Lio/agora/base/internal/video/EglBase$Context;IZLio/agora/base/internal/video/EglBase$EglConfigType;)Lio/agora/base/internal/video/EglBase;
    .locals 1
    .param p0    # Lio/agora/base/internal/video/EglBase$Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Lio/agora/base/internal/video/EglBase14;->isEGL14Supported()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    instance-of v0, p0, Lio/agora/base/internal/video/EglBase14$Context;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    :cond_0
    new-instance v0, Lio/agora/base/internal/video/EglBase14;

    .line 14
    .line 15
    check-cast p0, Lio/agora/base/internal/video/EglBase14$Context;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1, p2, p3}, Lio/agora/base/internal/video/EglBase14;-><init>(Lio/agora/base/internal/video/EglBase14$Context;IZLio/agora/base/internal/video/EglBase$EglConfigType;)V

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_1
    new-instance v0, Lio/agora/base/internal/video/EglBase10;

    .line 22
    .line 23
    check-cast p0, Lio/agora/base/internal/video/EglBase10$Context;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1, p2, p3}, Lio/agora/base/internal/video/EglBase10;-><init>(Lio/agora/base/internal/video/EglBase10$Context;IZLio/agora/base/internal/video/EglBase$EglConfigType;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public static create(Lio/agora/base/internal/video/EglBase$Context;[I)Lio/agora/base/internal/video/EglBase;
    .locals 1
    .param p0    # Lio/agora/base/internal/video/EglBase$Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 29
    invoke-static {}, Lio/agora/base/internal/video/EglBase14;->isEGL14Supported()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p0, :cond_0

    instance-of v0, p0, Lio/agora/base/internal/video/EglBase14$Context;

    if-eqz v0, :cond_1

    .line 30
    :cond_0
    new-instance v0, Lio/agora/base/internal/video/EglBase14;

    check-cast p0, Lio/agora/base/internal/video/EglBase14$Context;

    invoke-direct {v0, p0, p1}, Lio/agora/base/internal/video/EglBase14;-><init>(Lio/agora/base/internal/video/EglBase14$Context;[I)V

    return-object v0

    .line 31
    :cond_1
    new-instance v0, Lio/agora/base/internal/video/EglBase10;

    check-cast p0, Lio/agora/base/internal/video/EglBase10$Context;

    invoke-direct {v0, p0, p1}, Lio/agora/base/internal/video/EglBase10;-><init>(Lio/agora/base/internal/video/EglBase10$Context;[I)V

    return-object v0
.end method

.method public static createEgl10(IZLio/agora/base/internal/video/EglBase$EglConfigType;)Lio/agora/base/internal/video/EglBase;
    .locals 2

    .line 12
    new-instance v0, Lio/agora/base/internal/video/EglBase10;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0, p1, p2}, Lio/agora/base/internal/video/EglBase10;-><init>(Lio/agora/base/internal/video/EglBase10$Context;IZLio/agora/base/internal/video/EglBase$EglConfigType;)V

    return-object v0
.end method

.method public static createEgl10(Ljavax/microedition/khronos/egl/EGLContext;[I)Lio/agora/base/internal/video/EglBase;
    .locals 2

    .line 1
    new-instance v0, Lio/agora/base/internal/video/EglBase10;

    .line 2
    .line 3
    new-instance v1, Lio/agora/base/internal/video/EglBase10$Context;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lio/agora/base/internal/video/EglBase10$Context;-><init>(Ljavax/microedition/khronos/egl/EGLContext;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1, p1}, Lio/agora/base/internal/video/EglBase10;-><init>(Lio/agora/base/internal/video/EglBase10$Context;[I)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static createEgl10([I)Lio/agora/base/internal/video/EglBase;
    .locals 2

    .line 13
    new-instance v0, Lio/agora/base/internal/video/EglBase10;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lio/agora/base/internal/video/EglBase10;-><init>(Lio/agora/base/internal/video/EglBase10$Context;[I)V

    return-object v0
.end method

.method public static createEgl10Context(Ljavax/microedition/khronos/egl/EGLContext;)Lio/agora/base/internal/video/EglBase$Context;
    .locals 1
    .param p0    # Ljavax/microedition/khronos/egl/EGLContext;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lio/agora/base/internal/video/EglBase10$Context;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lio/agora/base/internal/video/EglBase10$Context;-><init>(Ljavax/microedition/khronos/egl/EGLContext;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static createEgl14(Landroid/opengl/EGLContext;[I)Lio/agora/base/internal/video/EglBase;
    .locals 2

    .line 1
    new-instance v0, Lio/agora/base/internal/video/EglBase14;

    .line 2
    .line 3
    new-instance v1, Lio/agora/base/internal/video/EglBase14$Context;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lio/agora/base/internal/video/EglBase14$Context;-><init>(Landroid/opengl/EGLContext;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1, p1}, Lio/agora/base/internal/video/EglBase14;-><init>(Lio/agora/base/internal/video/EglBase14$Context;[I)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static createEgl14([I)Lio/agora/base/internal/video/EglBase;
    .locals 2

    .line 12
    new-instance v0, Lio/agora/base/internal/video/EglBase14;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lio/agora/base/internal/video/EglBase14;-><init>(Lio/agora/base/internal/video/EglBase14$Context;[I)V

    return-object v0
.end method

.method public static createEgl14Context(Landroid/opengl/EGLContext;)Lio/agora/base/internal/video/EglBase$Context;
    .locals 1
    .param p0    # Landroid/opengl/EGLContext;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lio/agora/base/internal/video/EglBase14$Context;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lio/agora/base/internal/video/EglBase14$Context;-><init>(Landroid/opengl/EGLContext;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static isEglBase14(Lio/agora/base/internal/video/EglBase$Context;)Z
    .locals 0
    .param p0    # Lio/agora/base/internal/video/EglBase$Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    instance-of p0, p0, Lio/agora/base/internal/video/EglBase14$Context;

    .line 2
    .line 3
    return p0
.end method
