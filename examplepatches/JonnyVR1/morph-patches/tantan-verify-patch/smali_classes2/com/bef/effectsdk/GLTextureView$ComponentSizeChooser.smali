.class Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;
.super Lcom/bef/effectsdk/GLTextureView$BaseConfigChooser;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bef/effectsdk/GLTextureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ComponentSizeChooser"
.end annotation


# instance fields
.field protected mAlphaSize:I

.field protected mBlueSize:I

.field protected mDepthSize:I

.field protected mGreenSize:I

.field protected mRedSize:I

.field protected mStencilSize:I

.field private mValue:[I

.field final synthetic this$0:Lcom/bef/effectsdk/GLTextureView;


# direct methods
.method public constructor <init>(Lcom/bef/effectsdk/GLTextureView;IIIIII)V
    .locals 13

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->this$0:Lcom/bef/effectsdk/GLTextureView;

    .line 2
    .line 3
    const/16 v10, 0x3026

    .line 4
    .line 5
    const/16 v12, 0x3038

    .line 6
    .line 7
    const/16 v0, 0x3024

    .line 8
    .line 9
    const/16 v2, 0x3023

    .line 10
    .line 11
    const/16 v4, 0x3022

    .line 12
    .line 13
    const/16 v6, 0x3021

    .line 14
    .line 15
    const/16 v8, 0x3025

    .line 16
    .line 17
    move v1, p2

    .line 18
    move/from16 v3, p3

    .line 19
    .line 20
    move/from16 v5, p4

    .line 21
    .line 22
    move/from16 v7, p5

    .line 23
    .line 24
    move/from16 v9, p6

    .line 25
    .line 26
    move/from16 v11, p7

    .line 27
    .line 28
    filled-new-array/range {v0 .. v12}, [I

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-direct {p0, p1, v0}, Lcom/bef/effectsdk/GLTextureView$BaseConfigChooser;-><init>(Lcom/bef/effectsdk/GLTextureView;[I)V

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    new-array p1, p1, [I

    .line 37
    .line 38
    iput-object p1, p0, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->mValue:[I

    .line 39
    .line 40
    iput p2, p0, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->mRedSize:I

    .line 41
    .line 42
    iput v3, p0, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->mGreenSize:I

    .line 43
    .line 44
    iput v5, p0, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->mBlueSize:I

    .line 45
    .line 46
    iput v7, p0, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->mAlphaSize:I

    .line 47
    .line 48
    iput v9, p0, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->mDepthSize:I

    .line 49
    .line 50
    iput v11, p0, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->mStencilSize:I

    .line 51
    .line 52
    return-void
.end method

.method private findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->mValue:[I

    .line 2
    .line 3
    invoke-interface {p1, p2, p3, p4, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->mValue:[I

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    aget p0, p0, p1

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    return p5
.end method


# virtual methods
.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 8

    .line 1
    array-length v0, p3

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_1

    .line 4
    .line 5
    aget-object v5, p3, v1

    .line 6
    .line 7
    const/16 v6, 0x3025

    .line 8
    .line 9
    const/4 v7, 0x0

    .line 10
    move-object v2, p0

    .line 11
    move-object v3, p1

    .line 12
    move-object v4, p2

    .line 13
    invoke-direct/range {v2 .. v7}, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/16 v6, 0x3026

    .line 18
    .line 19
    invoke-direct/range {v2 .. v7}, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iget p2, v2, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->mDepthSize:I

    .line 24
    .line 25
    if-lt p0, p2, :cond_0

    .line 26
    .line 27
    iget p0, v2, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->mStencilSize:I

    .line 28
    .line 29
    if-lt p1, p0, :cond_0

    .line 30
    .line 31
    const/16 v6, 0x3024

    .line 32
    .line 33
    const/4 v7, 0x0

    .line 34
    invoke-direct/range {v2 .. v7}, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    const/16 v6, 0x3023

    .line 39
    .line 40
    invoke-direct/range {v2 .. v7}, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    const/16 v6, 0x3022

    .line 45
    .line 46
    invoke-direct/range {v2 .. v7}, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    const/16 v6, 0x3021

    .line 51
    .line 52
    invoke-direct/range {v2 .. v7}, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    iget v7, v2, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->mRedSize:I

    .line 57
    .line 58
    if-ne p0, v7, :cond_0

    .line 59
    .line 60
    iget p0, v2, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->mGreenSize:I

    .line 61
    .line 62
    if-ne p1, p0, :cond_0

    .line 63
    .line 64
    iget p0, v2, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->mBlueSize:I

    .line 65
    .line 66
    if-ne p2, p0, :cond_0

    .line 67
    .line 68
    iget p0, v2, Lcom/bef/effectsdk/GLTextureView$ComponentSizeChooser;->mAlphaSize:I

    .line 69
    .line 70
    if-ne v6, p0, :cond_0

    .line 71
    .line 72
    return-object v5

    .line 73
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 74
    .line 75
    move-object p0, v2

    .line 76
    move-object p1, v3

    .line 77
    move-object p2, v4

    .line 78
    goto :goto_0

    .line 79
    :cond_1
    const/4 p0, 0x0

    .line 80
    return-object p0
.end method
