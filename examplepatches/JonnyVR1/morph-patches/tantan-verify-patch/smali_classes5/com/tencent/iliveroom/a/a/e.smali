.class public Lcom/tencent/iliveroom/a/a/e;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Lcom/tencent/iliveroom/a/a/c;

.field private b:Lcom/tencent/liteav/c/a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tencent/iliveroom/a/a/c;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/tencent/iliveroom/a/a/c;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/iliveroom/a/a/e;->a:Lcom/tencent/iliveroom/a/a/c;

    .line 10
    .line 11
    new-instance v0, Lcom/tencent/liteav/c/a;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/tencent/liteav/c/a;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/iliveroom/a/a/e;->b:Lcom/tencent/liteav/c/a;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a([Lcom/tencent/iliveroom/a/a/a;II)I
    .locals 11

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, -0x1

    .line 4
    return p0

    .line 5
    :cond_0
    array-length v0, p1

    .line 6
    const/4 v1, 0x1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    aget-object p0, p1, v2

    .line 11
    .line 12
    iget p0, p0, Lcom/tencent/iliveroom/a/a/a;->a:I

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a/e;->a:Lcom/tencent/iliveroom/a/a/c;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lcom/tencent/iliveroom/a/a/c;->a([Lcom/tencent/iliveroom/a/a/a;)[Lcom/tencent/iliveroom/a/a/a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    array-length p1, p1

    .line 22
    new-array p1, p1, [Lcom/tencent/liteav/basic/e/a;

    .line 23
    .line 24
    array-length v1, v0

    .line 25
    move v3, v2

    .line 26
    move v4, v3

    .line 27
    :goto_0
    if-ge v3, v1, :cond_2

    .line 28
    .line 29
    aget-object v5, v0, v3

    .line 30
    .line 31
    new-instance v6, Lcom/tencent/liteav/basic/e/a;

    .line 32
    .line 33
    invoke-direct {v6}, Lcom/tencent/liteav/basic/e/a;-><init>()V

    .line 34
    .line 35
    .line 36
    iget v7, v5, Lcom/tencent/iliveroom/a/a/a;->a:I

    .line 37
    .line 38
    iput v7, v6, Lcom/tencent/liteav/basic/e/a;->a:I

    .line 39
    .line 40
    iput v2, v6, Lcom/tencent/liteav/basic/e/a;->b:I

    .line 41
    .line 42
    iget v7, v5, Lcom/tencent/iliveroom/a/a/a;->c:I

    .line 43
    .line 44
    iput v7, v6, Lcom/tencent/liteav/basic/e/a;->c:I

    .line 45
    .line 46
    iget v7, v5, Lcom/tencent/iliveroom/a/a/a;->d:I

    .line 47
    .line 48
    iput v7, v6, Lcom/tencent/liteav/basic/e/a;->d:I

    .line 49
    .line 50
    new-instance v7, Lcom/tencent/liteav/basic/c/a;

    .line 51
    .line 52
    iget v8, v5, Lcom/tencent/iliveroom/a/a/a;->g:I

    .line 53
    .line 54
    iget v9, v5, Lcom/tencent/iliveroom/a/a/a;->h:I

    .line 55
    .line 56
    iget v10, v5, Lcom/tencent/iliveroom/a/a/a;->e:I

    .line 57
    .line 58
    iget v5, v5, Lcom/tencent/iliveroom/a/a/a;->f:I

    .line 59
    .line 60
    invoke-direct {v7, v8, v9, v10, v5}, Lcom/tencent/liteav/basic/c/a;-><init>(IIII)V

    .line 61
    .line 62
    .line 63
    iput-object v7, v6, Lcom/tencent/liteav/basic/e/a;->f:Lcom/tencent/liteav/basic/c/a;

    .line 64
    .line 65
    add-int/lit8 v5, v4, 0x1

    .line 66
    .line 67
    aput-object v6, p1, v4

    .line 68
    .line 69
    add-int/lit8 v3, v3, 0x1

    .line 70
    .line 71
    move v4, v5

    .line 72
    goto :goto_0

    .line 73
    :cond_2
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a/e;->b:Lcom/tencent/liteav/c/a;

    .line 74
    .line 75
    invoke-virtual {v0, p2, p3}, Lcom/tencent/liteav/c/a;->a(II)V

    .line 76
    .line 77
    .line 78
    iget-object p2, p0, Lcom/tencent/iliveroom/a/a/e;->b:Lcom/tencent/liteav/c/a;

    .line 79
    .line 80
    const/4 p3, 0x0

    .line 81
    invoke-virtual {p2, p3}, Lcom/tencent/liteav/c/a;->a(Lcom/tencent/liteav/basic/c/a;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a/e;->b:Lcom/tencent/liteav/c/a;

    .line 85
    .line 86
    invoke-virtual {p0, p1, v2}, Lcom/tencent/liteav/c/a;->a([Lcom/tencent/liteav/basic/e/a;I)I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    return p0
.end method

.method public a()V
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a/e;->a:Lcom/tencent/iliveroom/a/a/c;

    invoke-virtual {v0}, Lcom/tencent/iliveroom/a/a/c;->a()V

    .line 92
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a/e;->b:Lcom/tencent/liteav/c/a;

    invoke-virtual {p0}, Lcom/tencent/liteav/c/a;->a()V

    return-void
.end method
