.class public final Ll/kri$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/kri;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:J

.field public b:J

.field public c:J

.field public d:J

.field public e:J

.field public f:J

.field public final g:[Z

.field public h:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xf

    .line 5
    .line 6
    new-array v0, v0, [Z

    .line 7
    .line 8
    iput-object v0, p0, Ll/kri$a;->g:[Z

    .line 9
    .line 10
    return-void
.end method

.method public static c(J)I
    .locals 2

    .line 1
    const-wide/16 v0, 0xf

    .line 2
    .line 3
    rem-long/2addr p0, v0

    .line 4
    long-to-int p0, p0

    .line 5
    return p0
.end method


# virtual methods
.method public a()J
    .locals 5

    .line 1
    iget-wide v0, p0, Ll/kri$a;->e:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-nez v4, :cond_0

    .line 8
    .line 9
    return-wide v2

    .line 10
    :cond_0
    iget-wide v2, p0, Ll/kri$a;->f:J

    .line 11
    .line 12
    div-long/2addr v2, v0

    .line 13
    return-wide v2
.end method

.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/kri$a;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public d()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/kri$a;->d:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/kri$a;->g:[Z

    .line 12
    .line 13
    const-wide/16 v2, 0x1

    .line 14
    .line 15
    sub-long/2addr v0, v2

    .line 16
    invoke-static {v0, v1}, Ll/kri$a;->c(J)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    aget-boolean p0, p0, v0

    .line 21
    .line 22
    return p0
.end method

.method public e()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/kri$a;->d:J

    .line 2
    .line 3
    const-wide/16 v2, 0xf

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget p0, p0, Ll/kri$a;->h:I

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public f(J)V
    .locals 9

    .line 1
    iget-wide v0, p0, Ll/kri$a;->d:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    const-wide/16 v3, 0x1

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    iput-wide p1, p0, Ll/kri$a;->a:J

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    cmp-long v2, v0, v3

    .line 15
    .line 16
    if-nez v2, :cond_1

    .line 17
    .line 18
    iget-wide v0, p0, Ll/kri$a;->a:J

    .line 19
    .line 20
    sub-long v0, p1, v0

    .line 21
    .line 22
    iput-wide v0, p0, Ll/kri$a;->b:J

    .line 23
    .line 24
    iput-wide v0, p0, Ll/kri$a;->f:J

    .line 25
    .line 26
    iput-wide v3, p0, Ll/kri$a;->e:J

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-wide v5, p0, Ll/kri$a;->c:J

    .line 30
    .line 31
    sub-long v5, p1, v5

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/kri$a;->c(J)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget-wide v1, p0, Ll/kri$a;->b:J

    .line 38
    .line 39
    sub-long v1, v5, v1

    .line 40
    .line 41
    invoke-static {v1, v2}, Ljava/lang/Math;->abs(J)J

    .line 42
    .line 43
    .line 44
    move-result-wide v1

    .line 45
    const-wide/32 v7, 0xf4240

    .line 46
    .line 47
    .line 48
    cmp-long v1, v1, v7

    .line 49
    .line 50
    const/4 v2, 0x1

    .line 51
    if-gtz v1, :cond_2

    .line 52
    .line 53
    iget-wide v7, p0, Ll/kri$a;->e:J

    .line 54
    .line 55
    add-long/2addr v7, v3

    .line 56
    iput-wide v7, p0, Ll/kri$a;->e:J

    .line 57
    .line 58
    iget-wide v7, p0, Ll/kri$a;->f:J

    .line 59
    .line 60
    add-long/2addr v7, v5

    .line 61
    iput-wide v7, p0, Ll/kri$a;->f:J

    .line 62
    .line 63
    iget-object v1, p0, Ll/kri$a;->g:[Z

    .line 64
    .line 65
    aget-boolean v5, v1, v0

    .line 66
    .line 67
    if-eqz v5, :cond_3

    .line 68
    .line 69
    const/4 v5, 0x0

    .line 70
    aput-boolean v5, v1, v0

    .line 71
    .line 72
    iget v0, p0, Ll/kri$a;->h:I

    .line 73
    .line 74
    sub-int/2addr v0, v2

    .line 75
    iput v0, p0, Ll/kri$a;->h:I

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    iget-object v1, p0, Ll/kri$a;->g:[Z

    .line 79
    .line 80
    aget-boolean v5, v1, v0

    .line 81
    .line 82
    if-nez v5, :cond_3

    .line 83
    .line 84
    aput-boolean v2, v1, v0

    .line 85
    .line 86
    iget v0, p0, Ll/kri$a;->h:I

    .line 87
    .line 88
    add-int/2addr v0, v2

    .line 89
    iput v0, p0, Ll/kri$a;->h:I

    .line 90
    .line 91
    :cond_3
    :goto_0
    iget-wide v0, p0, Ll/kri$a;->d:J

    .line 92
    .line 93
    add-long/2addr v0, v3

    .line 94
    iput-wide v0, p0, Ll/kri$a;->d:J

    .line 95
    .line 96
    iput-wide p1, p0, Ll/kri$a;->c:J

    .line 97
    .line 98
    return-void
.end method

.method public g()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/kri$a;->d:J

    .line 4
    .line 5
    iput-wide v0, p0, Ll/kri$a;->e:J

    .line 6
    .line 7
    iput-wide v0, p0, Ll/kri$a;->f:J

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Ll/kri$a;->h:I

    .line 11
    .line 12
    iget-object p0, p0, Ll/kri$a;->g:[Z

    .line 13
    .line 14
    invoke-static {p0, v0}, Ljava/util/Arrays;->fill([ZZ)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
