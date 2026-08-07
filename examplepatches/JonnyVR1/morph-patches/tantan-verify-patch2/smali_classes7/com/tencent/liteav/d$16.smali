.class Lcom/tencent/liteav/d$16;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/basic/c/h$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/basic/structs/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/ref/WeakReference;

.field final synthetic b:Lcom/tencent/liteav/d;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/d;Ljava/lang/ref/WeakReference;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/d$16;->b:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/d$16;->a:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/tencent/liteav/d$16;->b:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tencent/liteav/d;->q(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/basic/c/h;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/tencent/liteav/d$16;->a:Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/tencent/liteav/o;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    new-instance v1, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;

    .line 20
    .line 21
    invoke-direct {v1}, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/tencent/liteav/basic/c/h;->n()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    iput v2, v1, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->width:I

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/tencent/liteav/basic/c/h;->o()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, v1, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->height:I

    .line 35
    .line 36
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->generatePtsMS()J

    .line 37
    .line 38
    .line 39
    move-result-wide v2

    .line 40
    iput-wide v2, v1, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->pts:J

    .line 41
    .line 42
    iget-object p1, p0, Lcom/tencent/liteav/d$16;->b:Lcom/tencent/liteav/d;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object v2, p0, Lcom/tencent/liteav/d$16;->b:Lcom/tencent/liteav/d;

    .line 49
    .line 50
    invoke-static {v2}, Lcom/tencent/liteav/d;->r(Lcom/tencent/liteav/d;)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-interface {v0, p1, v2, v1}, Lcom/tencent/liteav/o;->onRenderVideoFrame(Ljava/lang/String;ILcom/tencent/liteav/basic/structs/TXSVideoFrame;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/tencent/liteav/d$16;->b:Lcom/tencent/liteav/d;

    .line 58
    .line 59
    iget-object p1, v1, Lcom/tencent/liteav/basic/structs/TXSVideoFrame;->data:[B

    .line 60
    .line 61
    invoke-static {p0, p1}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/d;[B)[B

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method
