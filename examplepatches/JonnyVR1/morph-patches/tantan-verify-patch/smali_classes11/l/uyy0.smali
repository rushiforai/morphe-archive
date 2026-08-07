.class public final Ll/uyy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/h2z0;


# instance fields
.field public final a:[Ll/h2z0;


# direct methods
.method public constructor <init>([Ll/h2z0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/uyy0;->a:[Ll/h2z0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ll/gay0;)Z
    .locals 17

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ll/uyy0;->zzc()J

    .line 5
    .line 6
    .line 7
    move-result-wide v3

    .line 8
    const-wide/high16 v5, -0x8000000000000000L

    .line 9
    .line 10
    cmp-long v7, v3, v5

    .line 11
    .line 12
    if-eqz v7, :cond_6

    .line 13
    .line 14
    move-object/from16 v7, p0

    .line 15
    .line 16
    iget-object v8, v7, Ll/uyy0;->a:[Ll/h2z0;

    .line 17
    .line 18
    array-length v9, v8

    .line 19
    const/4 v10, 0x0

    .line 20
    const/4 v11, 0x0

    .line 21
    :goto_0
    if-ge v10, v9, :cond_5

    .line 22
    .line 23
    aget-object v12, v8, v10

    .line 24
    .line 25
    invoke-interface {v12}, Ll/h2z0;->zzc()J

    .line 26
    .line 27
    .line 28
    move-result-wide v13

    .line 29
    cmp-long v15, v13, v5

    .line 30
    .line 31
    if-eqz v15, :cond_2

    .line 32
    .line 33
    move/from16 v16, v2

    .line 34
    .line 35
    iget-wide v1, v0, Ll/gay0;->a:J

    .line 36
    .line 37
    cmp-long v1, v13, v1

    .line 38
    .line 39
    if-gtz v1, :cond_1

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    goto :goto_2

    .line 43
    :cond_1
    :goto_1
    const/4 v1, 0x0

    .line 44
    goto :goto_2

    .line 45
    :cond_2
    move/from16 v16, v2

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :goto_2
    cmp-long v2, v13, v3

    .line 49
    .line 50
    if-eqz v2, :cond_3

    .line 51
    .line 52
    if-eqz v1, :cond_4

    .line 53
    .line 54
    :cond_3
    invoke-interface {v12, v0}, Ll/h2z0;->a(Ll/gay0;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    or-int/2addr v11, v1

    .line 59
    :cond_4
    add-int/lit8 v10, v10, 0x1

    .line 60
    .line 61
    move/from16 v2, v16

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_5
    move/from16 v16, v2

    .line 65
    .line 66
    or-int v2, v16, v11

    .line 67
    .line 68
    if-nez v11, :cond_0

    .line 69
    .line 70
    return v2

    .line 71
    :cond_6
    move/from16 v16, v2

    .line 72
    .line 73
    return v16
.end method

.method public final b(J)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/uyy0;->a:[Ll/h2z0;

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
    invoke-interface {v2, p1, p2}, Ll/h2z0;->b(J)V

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

.method public final zzb()J
    .locals 10

    .line 1
    iget-object p0, p0, Ll/uyy0;->a:[Ll/h2z0;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    const-wide v2, 0x7fffffffffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    move-wide v4, v2

    .line 11
    :goto_0
    const-wide/high16 v6, -0x8000000000000000L

    .line 12
    .line 13
    if-ge v1, v0, :cond_1

    .line 14
    .line 15
    aget-object v8, p0, v1

    .line 16
    .line 17
    invoke-interface {v8}, Ll/h2z0;->zzb()J

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
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    cmp-long p0, v4, v2

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

.method public final zzc()J
    .locals 10

    .line 1
    iget-object p0, p0, Ll/uyy0;->a:[Ll/h2z0;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    const-wide v2, 0x7fffffffffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    move-wide v4, v2

    .line 11
    :goto_0
    const-wide/high16 v6, -0x8000000000000000L

    .line 12
    .line 13
    if-ge v1, v0, :cond_1

    .line 14
    .line 15
    aget-object v8, p0, v1

    .line 16
    .line 17
    invoke-interface {v8}, Ll/h2z0;->zzc()J

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
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    cmp-long p0, v4, v2

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

.method public final zzp()Z
    .locals 4

    .line 1
    iget-object p0, p0, Ll/uyy0;->a:[Ll/h2z0;

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
    invoke-interface {v3}, Ll/h2z0;->zzp()Z

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
