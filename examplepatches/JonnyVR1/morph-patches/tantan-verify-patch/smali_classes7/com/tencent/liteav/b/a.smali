.class public Lcom/tencent/liteav/b/a;
.super Lcom/tencent/liteav/beauty/b/z;
.source "SourceFile"


# instance fields
.field private x:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/z;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "WatermarkTexture"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/tencent/liteav/b/a;->x:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/tencent/liteav/beauty/b/z;->t:Z

    .line 10
    .line 11
    const/16 p1, 0x302

    .line 12
    .line 13
    iput p1, p0, Lcom/tencent/liteav/beauty/b/z;->u:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a([Lcom/tencent/liteav/beauty/d$f;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    array-length v0, p1

    .line 6
    new-array v0, v0, [Lcom/tencent/liteav/beauty/b/z$a;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 9
    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    move v7, v0

    .line 12
    :goto_0
    array-length v1, p1

    .line 13
    if-ge v7, v1, :cond_3

    .line 14
    .line 15
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 16
    .line 17
    aget-object v2, v1, v7

    .line 18
    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    new-instance v2, Lcom/tencent/liteav/beauty/b/z$a;

    .line 22
    .line 23
    invoke-direct {v2, p0}, Lcom/tencent/liteav/beauty/b/z$a;-><init>(Lcom/tencent/liteav/beauty/b/z;)V

    .line 24
    .line 25
    .line 26
    aput-object v2, v1, v7

    .line 27
    .line 28
    :cond_1
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 29
    .line 30
    aget-object v1, v1, v7

    .line 31
    .line 32
    iget-object v2, v1, Lcom/tencent/liteav/beauty/b/z$a;->d:[I

    .line 33
    .line 34
    if-nez v2, :cond_2

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    new-array v2, v2, [I

    .line 38
    .line 39
    iput-object v2, v1, Lcom/tencent/liteav/beauty/b/z$a;->d:[I

    .line 40
    .line 41
    :cond_2
    aget-object v1, p1, v7

    .line 42
    .line 43
    iget v2, v1, Lcom/tencent/liteav/beauty/d$f;->f:I

    .line 44
    .line 45
    iget v3, v1, Lcom/tencent/liteav/beauty/d$f;->g:I

    .line 46
    .line 47
    iget v4, v1, Lcom/tencent/liteav/beauty/d$f;->b:F

    .line 48
    .line 49
    iget v5, v1, Lcom/tencent/liteav/beauty/d$f;->c:F

    .line 50
    .line 51
    iget v6, v1, Lcom/tencent/liteav/beauty/d$f;->d:F

    .line 52
    .line 53
    move-object v1, p0

    .line 54
    invoke-virtual/range {v1 .. v7}, Lcom/tencent/liteav/beauty/b/z;->a(IIFFFI)V

    .line 55
    .line 56
    .line 57
    iget-object p0, v1, Lcom/tencent/liteav/beauty/b/z;->r:[Lcom/tencent/liteav/beauty/b/z$a;

    .line 58
    .line 59
    aget-object p0, p0, v7

    .line 60
    .line 61
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/z$a;->d:[I

    .line 62
    .line 63
    aget-object v2, p1, v7

    .line 64
    .line 65
    iget v2, v2, Lcom/tencent/liteav/beauty/d$f;->e:I

    .line 66
    .line 67
    aput v2, p0, v0

    .line 68
    .line 69
    add-int/lit8 v7, v7, 0x1

    .line 70
    .line 71
    move-object p0, v1

    .line 72
    goto :goto_0

    .line 73
    :cond_3
    return-void
.end method
