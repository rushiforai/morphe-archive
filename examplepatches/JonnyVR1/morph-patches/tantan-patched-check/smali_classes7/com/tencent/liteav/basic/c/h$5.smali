.class Lcom/tencent/liteav/basic/c/h$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/basic/c/h;->c(I[F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:[F

.field final synthetic c:Lcom/tencent/liteav/basic/c/h;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/basic/c/h;I[F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/h$5;->c:Lcom/tencent/liteav/basic/c/h;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/basic/c/h$5;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/basic/c/h$5;->b:[F

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/basic/c/h$5;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/h$5;->b:[F

    .line 4
    .line 5
    invoke-static {p0}, Ljava/nio/FloatBuffer;->wrap([F)Ljava/nio/FloatBuffer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1, p0}, Landroid/opengl/GLES20;->glUniform4fv(IILjava/nio/FloatBuffer;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
