.class public final Ll/ory0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/mry0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:I

.field public c:J

.field public d:J

.field public e:J

.field public f:J


# direct methods
.method public constructor <init>(Landroid/media/AudioTrack;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mpw0;->a:I

    .line 5
    .line 6
    new-instance v0, Ll/mry0;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ll/mry0;-><init>(Landroid/media/AudioTrack;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/ory0;->a:Ll/mry0;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p0, p1}, Ll/ory0;->h(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final a()J
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ory0;->a:Ll/mry0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mry0;->a()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final b()J
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ory0;->a:Ll/mry0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mry0;->b()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final c()V
    .locals 2

    .line 1
    iget v0, p0, Ll/ory0;->b:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Ll/ory0;->h(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final d()V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Ll/ory0;->h(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final e()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/ory0;->h(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final f()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/ory0;->b:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public final g(J)Z
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .line 1
    iget-wide v0, p0, Ll/ory0;->e:J

    .line 2
    .line 3
    sub-long v0, p1, v0

    .line 4
    .line 5
    iget-wide v2, p0, Ll/ory0;->d:J

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-object v0, p0, Ll/ory0;->a:Ll/mry0;

    .line 14
    .line 15
    iput-wide p1, p0, Ll/ory0;->e:J

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/mry0;->c()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget v2, p0, Ll/ory0;->b:I

    .line 22
    .line 23
    const/4 v3, 0x3

    .line 24
    const/4 v4, 0x1

    .line 25
    if-eqz v2, :cond_8

    .line 26
    .line 27
    const/4 p1, 0x2

    .line 28
    if-eq v2, v4, :cond_5

    .line 29
    .line 30
    if-eq v2, p1, :cond_3

    .line 31
    .line 32
    if-eq v2, v3, :cond_1

    .line 33
    .line 34
    return v0

    .line 35
    :cond_1
    if-nez v0, :cond_2

    .line 36
    .line 37
    return v1

    .line 38
    :cond_2
    invoke-virtual {p0, v1}, Ll/ory0;->h(I)V

    .line 39
    .line 40
    .line 41
    return v4

    .line 42
    :cond_3
    if-eqz v0, :cond_4

    .line 43
    .line 44
    return v4

    .line 45
    :cond_4
    invoke-virtual {p0, v1}, Ll/ory0;->h(I)V

    .line 46
    .line 47
    .line 48
    return v1

    .line 49
    :cond_5
    if-eqz v0, :cond_7

    .line 50
    .line 51
    iget-object p2, p0, Ll/ory0;->a:Ll/mry0;

    .line 52
    .line 53
    invoke-virtual {p2}, Ll/mry0;->a()J

    .line 54
    .line 55
    .line 56
    move-result-wide v0

    .line 57
    iget-wide v2, p0, Ll/ory0;->f:J

    .line 58
    .line 59
    cmp-long p2, v0, v2

    .line 60
    .line 61
    if-gtz p2, :cond_6

    .line 62
    .line 63
    return v4

    .line 64
    :cond_6
    invoke-virtual {p0, p1}, Ll/ory0;->h(I)V

    .line 65
    .line 66
    .line 67
    return v4

    .line 68
    :cond_7
    invoke-virtual {p0, v1}, Ll/ory0;->h(I)V

    .line 69
    .line 70
    .line 71
    return v1

    .line 72
    :cond_8
    if-eqz v0, :cond_a

    .line 73
    .line 74
    iget-object p1, p0, Ll/ory0;->a:Ll/mry0;

    .line 75
    .line 76
    invoke-virtual {p1}, Ll/mry0;->b()J

    .line 77
    .line 78
    .line 79
    move-result-wide p1

    .line 80
    iget-wide v2, p0, Ll/ory0;->c:J

    .line 81
    .line 82
    cmp-long p1, p1, v2

    .line 83
    .line 84
    if-gez p1, :cond_9

    .line 85
    .line 86
    return v1

    .line 87
    :cond_9
    iget-object p1, p0, Ll/ory0;->a:Ll/mry0;

    .line 88
    .line 89
    invoke-virtual {p1}, Ll/mry0;->a()J

    .line 90
    .line 91
    .line 92
    move-result-wide p1

    .line 93
    iput-wide p1, p0, Ll/ory0;->f:J

    .line 94
    .line 95
    invoke-virtual {p0, v4}, Ll/ory0;->h(I)V

    .line 96
    .line 97
    .line 98
    return v4

    .line 99
    :cond_a
    iget-wide v4, p0, Ll/ory0;->c:J

    .line 100
    .line 101
    sub-long/2addr p1, v4

    .line 102
    const-wide/32 v4, 0x7a120

    .line 103
    .line 104
    .line 105
    cmp-long p1, p1, v4

    .line 106
    .line 107
    if-gtz p1, :cond_b

    .line 108
    .line 109
    return v1

    .line 110
    :cond_b
    invoke-virtual {p0, v3}, Ll/ory0;->h(I)V

    .line 111
    .line 112
    .line 113
    return v1
.end method

.method public final h(I)V
    .locals 6

    .line 1
    iput p1, p0, Ll/ory0;->b:I

    .line 2
    .line 3
    const-wide/16 v0, 0x2710

    .line 4
    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-eq p1, v2, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x3

    .line 14
    if-eq p1, v0, :cond_0

    .line 15
    .line 16
    const-wide/32 v0, 0x7a120

    .line 17
    .line 18
    .line 19
    :goto_0
    iput-wide v0, p0, Ll/ory0;->d:J

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-wide/32 v0, 0x989680

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iput-wide v0, p0, Ll/ory0;->d:J

    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    const-wide/16 v2, 0x0

    .line 30
    .line 31
    iput-wide v2, p0, Ll/ory0;->e:J

    .line 32
    .line 33
    const-wide/16 v2, -0x1

    .line 34
    .line 35
    iput-wide v2, p0, Ll/ory0;->f:J

    .line 36
    .line 37
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 38
    .line 39
    .line 40
    move-result-wide v2

    .line 41
    const-wide/16 v4, 0x3e8

    .line 42
    .line 43
    div-long/2addr v2, v4

    .line 44
    iput-wide v2, p0, Ll/ory0;->c:J

    .line 45
    .line 46
    goto :goto_0
.end method
