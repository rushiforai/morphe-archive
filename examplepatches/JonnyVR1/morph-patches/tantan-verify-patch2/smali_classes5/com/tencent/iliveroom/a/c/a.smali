.class public Lcom/tencent/iliveroom/a/c/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:[Ljava/lang/Object;

.field private b:Z

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/iliveroom/a/c/a;->c:I

    .line 6
    .line 7
    iput v0, p0, Lcom/tencent/iliveroom/a/c/a;->d:I

    .line 8
    .line 9
    iput p1, p0, Lcom/tencent/iliveroom/a/c/a;->f:I

    .line 10
    .line 11
    mul-int/lit8 p1, p1, 0x2

    .line 12
    .line 13
    iput p1, p0, Lcom/tencent/iliveroom/a/c/a;->e:I

    .line 14
    .line 15
    new-array p1, p1, [Ljava/lang/Object;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/tencent/iliveroom/a/c/a;->a:[Ljava/lang/Object;

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lcom/tencent/iliveroom/a/c/a;->b:Z

    .line 21
    .line 22
    iput v0, p0, Lcom/tencent/iliveroom/a/c/a;->g:I

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public declared-synchronized a([B)V
    .locals 4

    monitor-enter p0

    if-eqz p1, :cond_3

    .line 65
    :try_start_0
    array-length v0, p1

    if-nez v0, :cond_0

    goto :goto_2

    .line 66
    :cond_0
    array-length v0, p1

    new-array v1, v0, [B

    const/4 v2, 0x0

    .line 67
    invoke-static {p1, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 68
    iget v0, p0, Lcom/tencent/iliveroom/a/c/a;->g:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/tencent/iliveroom/a/c/a;->g:I

    .line 69
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c/a;->a:[Ljava/lang/Object;

    iget v1, p0, Lcom/tencent/iliveroom/a/c/a;->c:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lcom/tencent/iliveroom/a/c/a;->c:I

    aput-object p1, v0, v1

    .line 70
    iget p1, p0, Lcom/tencent/iliveroom/a/c/a;->e:I

    if-ne v3, p1, :cond_1

    .line 71
    iput v2, p0, Lcom/tencent/iliveroom/a/c/a;->c:I

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 72
    :cond_1
    :goto_0
    iget v0, p0, Lcom/tencent/iliveroom/a/c/a;->c:I

    iget v1, p0, Lcom/tencent/iliveroom/a/c/a;->d:I

    if-ne v0, v1, :cond_2

    add-int/lit8 v1, v1, 0x1

    .line 73
    iput v1, p0, Lcom/tencent/iliveroom/a/c/a;->d:I

    if-ne v1, p1, :cond_2

    .line 74
    iput v2, p0, Lcom/tencent/iliveroom/a/c/a;->d:I

    .line 75
    :cond_2
    iput-boolean v2, p0, Lcom/tencent/iliveroom/a/c/a;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    .line 77
    :cond_3
    :goto_2
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized a()[B
    .locals 4

    monitor-enter p0

    .line 78
    :try_start_0
    iget-boolean v0, p0, Lcom/tencent/iliveroom/a/c/a;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 79
    monitor-exit p0

    return-object v1

    .line 80
    :cond_0
    :try_start_1
    iget v0, p0, Lcom/tencent/iliveroom/a/c/a;->g:I

    iget v2, p0, Lcom/tencent/iliveroom/a/c/a;->f:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-ge v0, v2, :cond_1

    .line 81
    monitor-exit p0

    return-object v1

    :cond_1
    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 82
    :try_start_2
    iput v0, p0, Lcom/tencent/iliveroom/a/c/a;->g:I

    .line 83
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c/a;->a:[Ljava/lang/Object;

    iget v2, p0, Lcom/tencent/iliveroom/a/c/a;->d:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/tencent/iliveroom/a/c/a;->d:I

    aget-object v0, v0, v2

    check-cast v0, [B

    .line 84
    iget v2, p0, Lcom/tencent/iliveroom/a/c/a;->e:I

    if-ne v3, v2, :cond_2

    const/4 v2, 0x0

    .line 85
    iput v2, p0, Lcom/tencent/iliveroom/a/c/a;->d:I

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    .line 86
    :cond_2
    :goto_0
    iget v2, p0, Lcom/tencent/iliveroom/a/c/a;->d:I

    iget v3, p0, Lcom/tencent/iliveroom/a/c/a;->c:I

    if-ne v2, v3, :cond_3

    .line 87
    iput-boolean v1, p0, Lcom/tencent/iliveroom/a/c/a;->b:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 88
    :cond_3
    monitor-exit p0

    return-object v0

    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0
.end method

.method public declared-synchronized a(I)[B
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/tencent/iliveroom/a/c/a;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-object v1

    .line 9
    :cond_0
    :try_start_1
    iget v0, p0, Lcom/tencent/iliveroom/a/c/a;->g:I

    .line 10
    .line 11
    sub-int/2addr v0, p1

    .line 12
    iget v2, p0, Lcom/tencent/iliveroom/a/c/a;->f:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    .line 14
    if-ge v0, v2, :cond_1

    .line 15
    .line 16
    monitor-exit p0

    .line 17
    return-object v1

    .line 18
    :cond_1
    :try_start_2
    new-array v0, p1, [Ljava/lang/Object;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    move v3, v2

    .line 22
    move v4, v3

    .line 23
    :goto_0
    if-ge v3, p1, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/c/a;->a()[B

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    aput-object v5, v0, v3

    .line 30
    .line 31
    array-length v5, v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 32
    add-int/2addr v4, v5

    .line 33
    add-int/lit8 v3, v3, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_2

    .line 38
    :cond_2
    if-nez v4, :cond_3

    .line 39
    .line 40
    monitor-exit p0

    .line 41
    return-object v1

    .line 42
    :cond_3
    :try_start_3
    new-array v1, v4, [B

    .line 43
    .line 44
    move v3, v2

    .line 45
    move v4, v3

    .line 46
    :goto_1
    if-ge v3, p1, :cond_4

    .line 47
    .line 48
    aget-object v5, v0, v3

    .line 49
    .line 50
    check-cast v5, [B

    .line 51
    .line 52
    array-length v6, v5

    .line 53
    invoke-static {v5, v2, v1, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 54
    .line 55
    .line 56
    array-length v5, v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 57
    add-int/2addr v4, v5

    .line 58
    add-int/lit8 v3, v3, 0x1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_4
    monitor-exit p0

    .line 62
    return-object v1

    .line 63
    :goto_2
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 64
    throw p1
.end method

.method public declared-synchronized b()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput v0, p0, Lcom/tencent/iliveroom/a/c/a;->c:I

    .line 4
    .line 5
    iput v0, p0, Lcom/tencent/iliveroom/a/c/a;->d:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Lcom/tencent/iliveroom/a/c/a;->b:Z

    .line 9
    .line 10
    iput v0, p0, Lcom/tencent/iliveroom/a/c/a;->g:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw v0
.end method
