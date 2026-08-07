.class Lcom/tencent/liteav/basic/c/h$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/basic/c/h;->a(IF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:F

.field final synthetic c:Lcom/tencent/liteav/basic/c/h;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/basic/c/h;IF)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/h$2;->c:Lcom/tencent/liteav/basic/c/h;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/basic/c/h$2;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/basic/c/h$2;->b:F

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
    .locals 1

    .line 1
    iget v0, p0, Lcom/tencent/liteav/basic/c/h$2;->a:I

    .line 2
    .line 3
    iget p0, p0, Lcom/tencent/liteav/basic/c/h$2;->b:F

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
