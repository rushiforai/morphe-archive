.class public final Ll/ufr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bgr0;


# instance fields
.field public final a:[J

.field public final b:[J

.field public final c:J

.field public final d:Z


# direct methods
.method public constructor <init>([J[JJ)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    array-length v1, p2

    .line 6
    const/4 v2, 0x0

    .line 7
    const/4 v3, 0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    move v0, v3

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v0, v2

    .line 13
    :goto_0
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 14
    .line 15
    .line 16
    if-lez v1, :cond_1

    .line 17
    .line 18
    move v0, v3

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    move v0, v2

    .line 21
    :goto_1
    iput-boolean v0, p0, Ll/ufr0;->d:Z

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    aget-wide v4, p2, v2

    .line 26
    .line 27
    const-wide/16 v6, 0x0

    .line 28
    .line 29
    cmp-long v0, v4, v6

    .line 30
    .line 31
    if-lez v0, :cond_2

    .line 32
    .line 33
    add-int/lit8 v0, v1, 0x1

    .line 34
    .line 35
    new-array v4, v0, [J

    .line 36
    .line 37
    iput-object v4, p0, Ll/ufr0;->a:[J

    .line 38
    .line 39
    new-array v0, v0, [J

    .line 40
    .line 41
    iput-object v0, p0, Ll/ufr0;->b:[J

    .line 42
    .line 43
    invoke-static {p1, v2, v4, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    invoke-static {p2, v2, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 47
    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_2
    iput-object p1, p0, Ll/ufr0;->a:[J

    .line 51
    .line 52
    iput-object p2, p0, Ll/ufr0;->b:[J

    .line 53
    .line 54
    :goto_2
    iput-wide p3, p0, Ll/ufr0;->c:J

    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public final a(J)Ll/zfr0;
    .locals 8

    .line 1
    iget-boolean v0, p0, Ll/ufr0;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ll/zfr0;

    .line 6
    .line 7
    sget-object p1, Ll/cgr0;->c:Ll/cgr0;

    .line 8
    .line 9
    invoke-direct {p0, p1, p1}, Ll/zfr0;-><init>(Ll/cgr0;Ll/cgr0;)V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object v0, p0, Ll/ufr0;->b:[J

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-static {v0, p1, p2, v1, v1}, Ll/mpw0;->r([JJZZ)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v2, p0, Ll/ufr0;->b:[J

    .line 21
    .line 22
    new-instance v3, Ll/cgr0;

    .line 23
    .line 24
    aget-wide v4, v2, v0

    .line 25
    .line 26
    iget-object v2, p0, Ll/ufr0;->a:[J

    .line 27
    .line 28
    aget-wide v6, v2, v0

    .line 29
    .line 30
    invoke-direct {v3, v4, v5, v6, v7}, Ll/cgr0;-><init>(JJ)V

    .line 31
    .line 32
    .line 33
    iget-wide v4, v3, Ll/cgr0;->a:J

    .line 34
    .line 35
    cmp-long p1, v4, p1

    .line 36
    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    iget-object p1, p0, Ll/ufr0;->b:[J

    .line 40
    .line 41
    array-length p2, p1

    .line 42
    add-int/lit8 p2, p2, -0x1

    .line 43
    .line 44
    if-ne v0, p2, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    add-int/2addr v0, v1

    .line 48
    new-instance p2, Ll/cgr0;

    .line 49
    .line 50
    aget-wide v1, p1, v0

    .line 51
    .line 52
    iget-object p0, p0, Ll/ufr0;->a:[J

    .line 53
    .line 54
    aget-wide v4, p0, v0

    .line 55
    .line 56
    invoke-direct {p2, v1, v2, v4, v5}, Ll/cgr0;-><init>(JJ)V

    .line 57
    .line 58
    .line 59
    new-instance p0, Ll/zfr0;

    .line 60
    .line 61
    invoke-direct {p0, v3, p2}, Ll/zfr0;-><init>(Ll/cgr0;Ll/cgr0;)V

    .line 62
    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_2
    :goto_0
    new-instance p0, Ll/zfr0;

    .line 66
    .line 67
    invoke-direct {p0, v3, v3}, Ll/zfr0;-><init>(Ll/cgr0;Ll/cgr0;)V

    .line 68
    .line 69
    .line 70
    return-object p0
.end method

.method public final zza()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ufr0;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final zzh()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ufr0;->d:Z

    .line 2
    .line 3
    return p0
.end method
