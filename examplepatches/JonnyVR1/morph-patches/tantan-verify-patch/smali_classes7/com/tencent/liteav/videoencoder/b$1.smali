.class Lcom/tencent/liteav/videoencoder/b$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/videoencoder/b;->a(II)Ljavax/microedition/khronos/egl/EGLContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:[Z

.field final synthetic d:Lcom/tencent/liteav/videoencoder/b;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/videoencoder/b;II[Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/b$1;->d:Lcom/tencent/liteav/videoencoder/b;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/videoencoder/b$1;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/videoencoder/b$1;->b:I

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/liteav/videoencoder/b$1;->c:[Z

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$1;->d:Lcom/tencent/liteav/videoencoder/b;

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/liteav/videoencoder/b$1;->a:I

    .line 4
    .line 5
    iget v2, p0, Lcom/tencent/liteav/videoencoder/b$1;->b:I

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-static {v3, v3, v3, v1, v2}, Lcom/tencent/liteav/basic/c/b;->a(Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;Landroid/view/Surface;II)Lcom/tencent/liteav/basic/c/b;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/b;Lcom/tencent/liteav/basic/c/b;)Lcom/tencent/liteav/basic/c/b;

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b$1;->c:[Z

    .line 16
    .line 17
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b$1;->d:Lcom/tencent/liteav/videoencoder/b;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/tencent/liteav/videoencoder/b;->a(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/basic/c/b;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 v1, 0x0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move p0, v1

    .line 29
    :goto_0
    aput-boolean p0, v0, v1

    .line 30
    .line 31
    return-void
.end method
