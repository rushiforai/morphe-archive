.class Lcom/tencent/liteav/renderer/e$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/renderer/e;->c(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:Lcom/tencent/liteav/renderer/e;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/renderer/e;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/renderer/e$3;->c:Lcom/tencent/liteav/renderer/e;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/renderer/e$3;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/renderer/e$3;->b:I

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
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e$3;->c:Lcom/tencent/liteav/renderer/e;

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/liteav/renderer/e$3;->a:I

    .line 4
    .line 5
    iput v1, v0, Lcom/tencent/liteav/renderer/e;->m:I

    .line 6
    .line 7
    iget v1, p0, Lcom/tencent/liteav/renderer/e$3;->b:I

    .line 8
    .line 9
    iput v1, v0, Lcom/tencent/liteav/renderer/e;->n:I

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tencent/liteav/renderer/e;->a(Lcom/tencent/liteav/renderer/e;)Lcom/tencent/liteav/basic/c/e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e$3;->c:Lcom/tencent/liteav/renderer/e;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tencent/liteav/renderer/e;->a(Lcom/tencent/liteav/renderer/e;)Lcom/tencent/liteav/basic/c/e;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e$3;->c:Lcom/tencent/liteav/renderer/e;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tencent/liteav/renderer/e;->b(Lcom/tencent/liteav/renderer/e;)[I

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v2, 0x0

    .line 30
    aget v0, v0, v2

    .line 31
    .line 32
    iget-object v3, p0, Lcom/tencent/liteav/renderer/e$3;->c:Lcom/tencent/liteav/renderer/e;

    .line 33
    .line 34
    invoke-static {v3}, Lcom/tencent/liteav/renderer/e;->b(Lcom/tencent/liteav/renderer/e;)[I

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const/4 v4, 0x3

    .line 39
    aget v3, v3, v4

    .line 40
    .line 41
    const/4 v4, 0x1

    .line 42
    if-ne v3, v4, :cond_0

    .line 43
    .line 44
    move v3, v4

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    move v3, v2

    .line 47
    :goto_0
    iget-object v2, p0, Lcom/tencent/liteav/renderer/e$3;->c:Lcom/tencent/liteav/renderer/e;

    .line 48
    .line 49
    invoke-static {v2}, Lcom/tencent/liteav/renderer/e;->b(Lcom/tencent/liteav/renderer/e;)[I

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const/4 v5, 0x4

    .line 54
    aget v2, v2, v5

    .line 55
    .line 56
    iget-object v5, p0, Lcom/tencent/liteav/renderer/e$3;->c:Lcom/tencent/liteav/renderer/e;

    .line 57
    .line 58
    move-object v6, v5

    .line 59
    iget v5, v6, Lcom/tencent/liteav/renderer/e;->m:I

    .line 60
    .line 61
    move-object v7, v6

    .line 62
    iget v6, v7, Lcom/tencent/liteav/renderer/e;->n:I

    .line 63
    .line 64
    invoke-static {v7}, Lcom/tencent/liteav/renderer/e;->b(Lcom/tencent/liteav/renderer/e;)[I

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    aget v7, v7, v4

    .line 69
    .line 70
    iget-object p0, p0, Lcom/tencent/liteav/renderer/e$3;->c:Lcom/tencent/liteav/renderer/e;

    .line 71
    .line 72
    invoke-static {p0}, Lcom/tencent/liteav/renderer/e;->b(Lcom/tencent/liteav/renderer/e;)[I

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const/4 v4, 0x2

    .line 77
    aget v8, p0, v4

    .line 78
    .line 79
    const/4 v9, 0x1

    .line 80
    const/4 v10, 0x0

    .line 81
    move v4, v2

    .line 82
    move v2, v0

    .line 83
    invoke-virtual/range {v1 .. v10}, Lcom/tencent/liteav/basic/c/e;->a(IZIIIIIZZ)V

    .line 84
    .line 85
    .line 86
    :cond_1
    return-void
.end method
