.class Lcom/tencent/liteav/basic/c/e$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/basic/c/e;->b(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/tencent/liteav/basic/c/e;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/basic/c/e;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/e$2;->b:Lcom/tencent/liteav/basic/c/e;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/basic/c/e$2;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e$2;->b:Lcom/tencent/liteav/basic/c/e;

    .line 2
    .line 3
    iget p0, p0, Lcom/tencent/liteav/basic/c/e$2;->a:I

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/c/e;->b(Lcom/tencent/liteav/basic/c/e;I)I

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-static {p0, p0, p0, v0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 12
    .line 13
    .line 14
    const/16 p0, 0x4100

    .line 15
    .line 16
    invoke-static {p0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
