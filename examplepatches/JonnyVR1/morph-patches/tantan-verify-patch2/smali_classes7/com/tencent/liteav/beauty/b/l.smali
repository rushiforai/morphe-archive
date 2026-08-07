.class public Lcom/tencent/liteav/beauty/b/l;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# static fields
.field private static r:Ljava/lang/String; = "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n\nuniform int  bTransform;\nuniform mat4 textureTransform;\n\nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n     gl_Position = position;\n    if (0 != bTransform){\n        textureCoordinate =  (textureTransform * inputTextureCoordinate).xy;\n    }else{\n        textureCoordinate = inputTextureCoordinate.xy;\n    }\n}\n"


# instance fields
.field private s:I

.field private t:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 11
    sget-object v0, Lcom/tencent/liteav/beauty/b/l;->r:Ljava/lang/String;

    const-string v1, "varying lowp vec2 textureCoordinate;\n \nuniform sampler2D inputImageTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/tencent/liteav/beauty/b/l;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/liteav/basic/c/h;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/tencent/liteav/beauty/b/l;->s:I

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/tencent/liteav/beauty/b/l;->t:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a([F)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/l;->s:I

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, v0, v1}, Lcom/tencent/liteav/basic/c/h;->b(II)V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1}, Lcom/tencent/liteav/basic/c/h;->b(II)V

    .line 12
    .line 13
    .line 14
    :goto_0
    invoke-super {p0, p1}, Lcom/tencent/liteav/basic/c/h;->a([F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public b()Z
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 6
    .line 7
    const-string v2, "bTransform"

    .line 8
    .line 9
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iput v1, p0, Lcom/tencent/liteav/beauty/b/l;->s:I

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p0, v1, v2}, Lcom/tencent/liteav/basic/c/h;->b(II)V

    .line 17
    .line 18
    .line 19
    return v0
.end method

.method public c(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/beauty/b/l;->t:Z

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/tencent/liteav/beauty/b/l;->t:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->h()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
