.class public Lcom/immomo/moment/opengl/b;
.super Ll/l4b0;
.source "SourceFile"


# instance fields
.field private g:I

.field private h:I

.field private i:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const-string v0, "uniform mat4 uMVPMatrix;\nattribute vec4 aPosition;\nattribute vec2 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n    gl_Position = uMVPMatrix * aPosition;\n    vTextureCoord = aTextureCoord;\n}\n"

    .line 2
    .line 3
    const-string v1, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nvoid main() {\n    gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Ll/l4b0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()Lcom/immomo/moment/opengl/Drawable2d;
    .locals 1

    .line 1
    new-instance p0, Lcom/immomo/moment/opengl/Drawable2d;

    .line 2
    .line 3
    sget-object v0, Lcom/immomo/moment/opengl/Drawable2d$Prefab;->FULL_RECTANGLE:Lcom/immomo/moment/opengl/Drawable2d$Prefab;

    .line 4
    .line 5
    invoke-direct {p0, v0}, Lcom/immomo/moment/opengl/Drawable2d;-><init>(Lcom/immomo/moment/opengl/Drawable2d$Prefab;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public c()V
    .locals 2

    .line 1
    iget v0, p0, Ll/l4b0;->a:I

    .line 2
    .line 3
    const-string v1, "aPosition"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/immomo/moment/opengl/b;->h:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/z3k;->b(ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Ll/l4b0;->a:I

    .line 15
    .line 16
    const-string v1, "aTextureCoord"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/immomo/moment/opengl/b;->i:I

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/z3k;->b(ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget v0, p0, Ll/l4b0;->a:I

    .line 28
    .line 29
    const-string v1, "uMVPMatrix"

    .line 30
    .line 31
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Lcom/immomo/moment/opengl/b;->g:I

    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/z3k;->b(ILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
