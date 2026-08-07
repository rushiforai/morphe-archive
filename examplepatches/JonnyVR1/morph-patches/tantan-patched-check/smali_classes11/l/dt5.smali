.class public Ll/dt5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/r;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:[Lcom/google/android/exoplayer2/source/r;


# direct methods
.method public constructor <init>([Lcom/google/android/exoplayer2/source/r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dt5;->a:[Lcom/google/android/exoplayer2/source/r;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public c(J)Z
    .locals 17

    .line 1
    move-wide/from16 v0, p1

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    move v3, v2

    .line 5
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ll/dt5;->f()J

    .line 6
    .line 7
    .line 8
    move-result-wide v4

    .line 9
    const-wide/high16 v6, -0x8000000000000000L

    .line 10
    .line 11
    cmp-long v8, v4, v6

    .line 12
    .line 13
    if-nez v8, :cond_1

    .line 14
    .line 15
    return v3

    .line 16
    :cond_1
    move-object/from16 v8, p0

    .line 17
    .line 18
    iget-object v9, v8, Ll/dt5;->a:[Lcom/google/android/exoplayer2/source/r;

    .line 19
    .line 20
    array-length v10, v9

    .line 21
    move v11, v2

    .line 22
    move v12, v11

    .line 23
    :goto_0
    if-ge v11, v10, :cond_5

    .line 24
    .line 25
    aget-object v13, v9, v11

    .line 26
    .line 27
    invoke-interface {v13}, Lcom/google/android/exoplayer2/source/r;->f()J

    .line 28
    .line 29
    .line 30
    move-result-wide v14

    .line 31
    cmp-long v16, v14, v6

    .line 32
    .line 33
    if-eqz v16, :cond_2

    .line 34
    .line 35
    cmp-long v16, v14, v0

    .line 36
    .line 37
    if-gtz v16, :cond_2

    .line 38
    .line 39
    const/16 v16, 0x1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    move/from16 v16, v2

    .line 43
    .line 44
    :goto_1
    cmp-long v14, v14, v4

    .line 45
    .line 46
    if-eqz v14, :cond_3

    .line 47
    .line 48
    if-eqz v16, :cond_4

    .line 49
    .line 50
    :cond_3
    invoke-interface {v13, v0, v1}, Lcom/google/android/exoplayer2/source/r;->c(J)Z

    .line 51
    .line 52
    .line 53
    move-result v13

    .line 54
    or-int/2addr v12, v13

    .line 55
    :cond_4
    add-int/lit8 v11, v11, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_5
    or-int/2addr v3, v12

    .line 59
    if-nez v12, :cond_0

    .line 60
    .line 61
    return v3
.end method

.method public final d()J
    .locals 10

    .line 1
    iget-object p0, p0, Ll/dt5;->a:[Lcom/google/android/exoplayer2/source/r;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const-wide v1, 0x7fffffffffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    move-wide v4, v1

    .line 11
    :goto_0
    const-wide/high16 v6, -0x8000000000000000L

    .line 12
    .line 13
    if-ge v3, v0, :cond_1

    .line 14
    .line 15
    aget-object v8, p0, v3

    .line 16
    .line 17
    invoke-interface {v8}, Lcom/google/android/exoplayer2/source/r;->d()J

    .line 18
    .line 19
    .line 20
    move-result-wide v8

    .line 21
    cmp-long v6, v8, v6

    .line 22
    .line 23
    if-eqz v6, :cond_0

    .line 24
    .line 25
    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->min(JJ)J

    .line 26
    .line 27
    .line 28
    move-result-wide v4

    .line 29
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    cmp-long p0, v4, v1

    .line 33
    .line 34
    if-nez p0, :cond_2

    .line 35
    .line 36
    return-wide v6

    .line 37
    :cond_2
    return-wide v4
.end method

.method public final e(J)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/dt5;->a:[Lcom/google/android/exoplayer2/source/r;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_0

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-interface {v2, p1, p2}, Lcom/google/android/exoplayer2/source/r;->e(J)V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method public final f()J
    .locals 10

    .line 1
    iget-object p0, p0, Ll/dt5;->a:[Lcom/google/android/exoplayer2/source/r;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const-wide v1, 0x7fffffffffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    move-wide v4, v1

    .line 11
    :goto_0
    const-wide/high16 v6, -0x8000000000000000L

    .line 12
    .line 13
    if-ge v3, v0, :cond_1

    .line 14
    .line 15
    aget-object v8, p0, v3

    .line 16
    .line 17
    invoke-interface {v8}, Lcom/google/android/exoplayer2/source/r;->f()J

    .line 18
    .line 19
    .line 20
    move-result-wide v8

    .line 21
    cmp-long v6, v8, v6

    .line 22
    .line 23
    if-eqz v6, :cond_0

    .line 24
    .line 25
    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->min(JJ)J

    .line 26
    .line 27
    .line 28
    move-result-wide v4

    .line 29
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    cmp-long p0, v4, v1

    .line 33
    .line 34
    if-nez p0, :cond_2

    .line 35
    .line 36
    return-wide v6

    .line 37
    :cond_2
    return-wide v4
.end method

.method public isLoading()Z
    .locals 4

    .line 1
    iget-object p0, p0, Ll/dt5;->a:[Lcom/google/android/exoplayer2/source/r;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v2, v0, :cond_1

    .line 7
    .line 8
    aget-object v3, p0, v2

    .line 9
    .line 10
    invoke-interface {v3}, Lcom/google/android/exoplayer2/source/r;->isLoading()Z

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    return v1
.end method
