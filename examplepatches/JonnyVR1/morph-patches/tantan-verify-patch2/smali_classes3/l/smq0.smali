.class public Ll/smq0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Ljava/lang/Integer; = null

.field public static volatile b:I = -0x1

.field public static volatile c:I = -0x1

.field public static volatile d:J = -0x1L


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/content/Context;)I
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/smq0;->g()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v0, v1}, Ll/smq0;->c(Ljava/util/ArrayList;I)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/smq0;->f()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v0, v1}, Ll/smq0;->c(Ljava/util/ArrayList;I)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Ll/smq0;->i(Landroid/content/Context;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-static {v0, p0}, Ll/smq0;->c(Ljava/util/ArrayList;I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const/4 p0, -0x1

    .line 34
    return p0

    .line 35
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    const/4 v1, 0x1

    .line 43
    and-int/2addr p0, v1

    .line 44
    if-ne p0, v1, :cond_1

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    div-int/lit8 p0, p0, 0x2

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ljava/lang/Integer;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    return p0

    .line 63
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    div-int/lit8 p0, p0, 0x2

    .line 68
    .line 69
    add-int/lit8 v1, p0, -0x1

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, Ljava/lang/Integer;

    .line 76
    .line 77
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    check-cast p0, Ljava/lang/Integer;

    .line 86
    .line 87
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Ljava/lang/Integer;

    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    sub-int/2addr p0, v0

    .line 102
    div-int/lit8 p0, p0, 0x2

    .line 103
    .line 104
    add-int/2addr v2, p0

    .line 105
    return v2
.end method

.method public static b(Landroid/content/Context;)I
    .locals 6

    .line 1
    invoke-static {p0}, Ll/smq0;->j(Landroid/content/Context;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, -0x1

    .line 6
    .line 7
    cmp-long v2, v0, v2

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ll/smq0;->a(Landroid/content/Context;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const-wide/32 v2, 0x30000000

    .line 17
    .line 18
    .line 19
    cmp-long p0, v0, v2

    .line 20
    .line 21
    if-gtz p0, :cond_2

    .line 22
    .line 23
    invoke-static {}, Ll/smq0;->h()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const/4 v0, 0x1

    .line 28
    if-gt p0, v0, :cond_1

    .line 29
    .line 30
    const/16 p0, 0x7d9

    .line 31
    .line 32
    return p0

    .line 33
    :cond_1
    const/16 p0, 0x7da

    .line 34
    .line 35
    return p0

    .line 36
    :cond_2
    const-wide/32 v2, 0x40000000

    .line 37
    .line 38
    .line 39
    cmp-long p0, v0, v2

    .line 40
    .line 41
    const/16 v2, 0x7dc

    .line 42
    .line 43
    if-gtz p0, :cond_4

    .line 44
    .line 45
    invoke-static {}, Ll/smq0;->e()J

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    const-wide/32 v3, 0x13d620

    .line 50
    .line 51
    .line 52
    cmp-long p0, v0, v3

    .line 53
    .line 54
    if-gez p0, :cond_3

    .line 55
    .line 56
    const/16 p0, 0x7db

    .line 57
    .line 58
    return p0

    .line 59
    :cond_3
    return v2

    .line 60
    :cond_4
    const-wide/32 v3, 0x60000000

    .line 61
    .line 62
    .line 63
    cmp-long p0, v0, v3

    .line 64
    .line 65
    const/16 v3, 0x7dd

    .line 66
    .line 67
    if-gtz p0, :cond_6

    .line 68
    .line 69
    invoke-static {}, Ll/a0e;->b()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    const v0, 0x1b7740

    .line 74
    .line 75
    .line 76
    if-ge p0, v0, :cond_5

    .line 77
    .line 78
    return v2

    .line 79
    :cond_5
    return v3

    .line 80
    :cond_6
    const-wide v4, 0x80000000L

    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    cmp-long p0, v0, v4

    .line 86
    .line 87
    if-gtz p0, :cond_7

    .line 88
    .line 89
    return v3

    .line 90
    :cond_7
    const-wide v2, 0xc0000000L

    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    cmp-long p0, v0, v2

    .line 96
    .line 97
    if-gtz p0, :cond_8

    .line 98
    .line 99
    const/16 p0, 0x7de

    .line 100
    .line 101
    return p0

    .line 102
    :cond_8
    const-wide v2, 0x140000000L

    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    cmp-long p0, v0, v2

    .line 108
    .line 109
    if-gtz p0, :cond_9

    .line 110
    .line 111
    const/16 p0, 0x7df

    .line 112
    .line 113
    return p0

    .line 114
    :cond_9
    const/16 p0, 0x7e0

    .line 115
    .line 116
    return p0
.end method

.method public static c(Ljava/util/ArrayList;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;I)V"
        }
    .end annotation

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static d(Landroid/content/Context;)I
    .locals 2

    .line 1
    sget-object v0, Ll/smq0;->a:Ljava/lang/Integer;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/smq0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/smq0;->a:Ljava/lang/Integer;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-static {p0}, Ll/smq0;->b(Landroid/content/Context;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sput-object p0, Ll/smq0;->a:Ljava/lang/Integer;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    monitor-exit v0

    .line 26
    goto :goto_2

    .line 27
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0

    .line 29
    :cond_1
    :goto_2
    sget-object p0, Ll/smq0;->a:Ljava/lang/Integer;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method public static e()J
    .locals 2

    .line 1
    sget v0, Ll/smq0;->c:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-static {}, Ll/a0e;->b()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sput v0, Ll/smq0;->c:I

    .line 11
    .line 12
    :cond_0
    sget v0, Ll/smq0;->c:I

    .line 13
    .line 14
    int-to-long v0, v0

    .line 15
    return-wide v0
.end method

.method public static f()I
    .locals 4

    .line 1
    invoke-static {}, Ll/a0e;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-long v0, v0

    .line 6
    const-wide/16 v2, -0x1

    .line 7
    .line 8
    cmp-long v2, v0, v2

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    const/4 v0, -0x1

    .line 13
    return v0

    .line 14
    :cond_0
    const-wide/32 v2, 0x80e80

    .line 15
    .line 16
    .line 17
    cmp-long v2, v0, v2

    .line 18
    .line 19
    if-gtz v2, :cond_1

    .line 20
    .line 21
    const/16 v0, 0x7d8

    .line 22
    .line 23
    return v0

    .line 24
    :cond_1
    const-wide/32 v2, 0x975e0

    .line 25
    .line 26
    .line 27
    cmp-long v2, v0, v2

    .line 28
    .line 29
    if-gtz v2, :cond_2

    .line 30
    .line 31
    const/16 v0, 0x7d9

    .line 32
    .line 33
    return v0

    .line 34
    :cond_2
    const-wide/32 v2, 0xf9060

    .line 35
    .line 36
    .line 37
    cmp-long v2, v0, v2

    .line 38
    .line 39
    if-gtz v2, :cond_3

    .line 40
    .line 41
    const/16 v0, 0x7da

    .line 42
    .line 43
    return v0

    .line 44
    :cond_3
    const-wide/32 v2, 0x129da0

    .line 45
    .line 46
    .line 47
    cmp-long v2, v0, v2

    .line 48
    .line 49
    if-gtz v2, :cond_4

    .line 50
    .line 51
    const/16 v0, 0x7db

    .line 52
    .line 53
    return v0

    .line 54
    :cond_4
    const-wide/32 v2, 0x173180

    .line 55
    .line 56
    .line 57
    cmp-long v2, v0, v2

    .line 58
    .line 59
    if-gtz v2, :cond_5

    .line 60
    .line 61
    const/16 v0, 0x7dc

    .line 62
    .line 63
    return v0

    .line 64
    :cond_5
    const-wide/32 v2, 0x1ed2a0

    .line 65
    .line 66
    .line 67
    cmp-long v0, v0, v2

    .line 68
    .line 69
    if-gtz v0, :cond_6

    .line 70
    .line 71
    const/16 v0, 0x7dd

    .line 72
    .line 73
    return v0

    .line 74
    :cond_6
    const/16 v0, 0x7de

    .line 75
    .line 76
    return v0
.end method

.method public static g()I
    .locals 2

    .line 1
    invoke-static {}, Ll/a0e;->f()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    return v0

    .line 10
    :cond_0
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    const/16 v0, 0x7d8

    .line 13
    .line 14
    return v0

    .line 15
    :cond_1
    const/4 v1, 0x3

    .line 16
    if-gt v0, v1, :cond_2

    .line 17
    .line 18
    const/16 v0, 0x7db

    .line 19
    .line 20
    return v0

    .line 21
    :cond_2
    const/16 v0, 0x7dc

    .line 22
    .line 23
    return v0
.end method

.method public static h()I
    .locals 2

    .line 1
    sget v0, Ll/smq0;->b:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-static {}, Ll/a0e;->f()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sput v0, Ll/smq0;->b:I

    .line 11
    .line 12
    :cond_0
    sget v0, Ll/smq0;->b:I

    .line 13
    .line 14
    return v0
.end method

.method public static i(Landroid/content/Context;)I
    .locals 4

    .line 1
    invoke-static {p0}, Ll/a0e;->g(Landroid/content/Context;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-gtz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, -0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const-wide/32 v2, 0xc000000

    .line 14
    .line 15
    .line 16
    cmp-long p0, v0, v2

    .line 17
    .line 18
    if-gtz p0, :cond_1

    .line 19
    .line 20
    const/16 p0, 0x7d8

    .line 21
    .line 22
    return p0

    .line 23
    :cond_1
    const-wide/32 v2, 0x12200000

    .line 24
    .line 25
    .line 26
    cmp-long p0, v0, v2

    .line 27
    .line 28
    if-gtz p0, :cond_2

    .line 29
    .line 30
    const/16 p0, 0x7d9

    .line 31
    .line 32
    return p0

    .line 33
    :cond_2
    const-wide/32 v2, 0x20000000

    .line 34
    .line 35
    .line 36
    cmp-long p0, v0, v2

    .line 37
    .line 38
    if-gtz p0, :cond_3

    .line 39
    .line 40
    const/16 p0, 0x7da

    .line 41
    .line 42
    return p0

    .line 43
    :cond_3
    const-wide/32 v2, 0x40000000

    .line 44
    .line 45
    .line 46
    cmp-long p0, v0, v2

    .line 47
    .line 48
    if-gtz p0, :cond_4

    .line 49
    .line 50
    const/16 p0, 0x7db

    .line 51
    .line 52
    return p0

    .line 53
    :cond_4
    const-wide/32 v2, 0x60000000

    .line 54
    .line 55
    .line 56
    cmp-long p0, v0, v2

    .line 57
    .line 58
    if-gtz p0, :cond_5

    .line 59
    .line 60
    const/16 p0, 0x7dc

    .line 61
    .line 62
    return p0

    .line 63
    :cond_5
    const-wide v2, 0x80000000L

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    cmp-long p0, v0, v2

    .line 69
    .line 70
    if-gtz p0, :cond_6

    .line 71
    .line 72
    const/16 p0, 0x7dd

    .line 73
    .line 74
    return p0

    .line 75
    :cond_6
    const/16 p0, 0x7de

    .line 76
    .line 77
    return p0
.end method

.method public static j(Landroid/content/Context;)J
    .locals 4

    .line 1
    sget-wide v0, Ll/smq0;->d:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/a0e;->g(Landroid/content/Context;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    sput-wide v0, Ll/smq0;->d:J

    .line 14
    .line 15
    :cond_0
    sget-wide v0, Ll/smq0;->d:J

    .line 16
    .line 17
    return-wide v0
.end method
