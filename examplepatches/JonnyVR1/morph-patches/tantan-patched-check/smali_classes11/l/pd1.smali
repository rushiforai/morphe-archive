.class public final Ll/pd1;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pd1$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/pd1$a;
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
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/bmk0;->a:I

    .line 5
    .line 6
    const/16 v1, 0x13

    .line 7
    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    new-instance v0, Ll/pd1$a;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Ll/pd1$a;-><init>(Landroid/media/AudioTrack;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/pd1;->a:Ll/pd1$a;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/pd1;->g()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/4 p1, 0x0

    .line 22
    iput-object p1, p0, Ll/pd1;->a:Ll/pd1$a;

    .line 23
    .line 24
    const/4 p1, 0x3

    .line 25
    invoke-virtual {p0, p1}, Ll/pd1;->h(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget v0, p0, Ll/pd1;->b:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/pd1;->g()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public b()J
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pd1;->a:Ll/pd1$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pd1$a;->a()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, -0x1

    .line 11
    .line 12
    return-wide v0
.end method

.method public c()J
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pd1;->a:Ll/pd1$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pd1$a;->b()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    return-wide v0
.end method

.method public d()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/pd1;->b:I

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

.method public e(J)Z
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pd1;->a:Ll/pd1$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_a

    .line 5
    .line 6
    iget-wide v2, p0, Ll/pd1;->e:J

    .line 7
    .line 8
    sub-long v2, p1, v2

    .line 9
    .line 10
    iget-wide v4, p0, Ll/pd1;->d:J

    .line 11
    .line 12
    cmp-long v2, v2, v4

    .line 13
    .line 14
    if-gez v2, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    iput-wide p1, p0, Ll/pd1;->e:J

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/pd1$a;->c()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget v2, p0, Ll/pd1;->b:I

    .line 24
    .line 25
    const/4 v3, 0x3

    .line 26
    const/4 v4, 0x1

    .line 27
    if-eqz v2, :cond_6

    .line 28
    .line 29
    const/4 p1, 0x2

    .line 30
    if-eq v2, v4, :cond_4

    .line 31
    .line 32
    if-eq v2, p1, :cond_3

    .line 33
    .line 34
    if-eq v2, v3, :cond_2

    .line 35
    .line 36
    const/4 p0, 0x4

    .line 37
    if-ne v2, p0, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-static {}, Ll/wpg0;->a()V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    return p0

    .line 45
    :cond_2
    if-eqz v0, :cond_9

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/pd1;->g()V

    .line 48
    .line 49
    .line 50
    return v0

    .line 51
    :cond_3
    if-nez v0, :cond_9

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/pd1;->g()V

    .line 54
    .line 55
    .line 56
    return v0

    .line 57
    :cond_4
    if-eqz v0, :cond_5

    .line 58
    .line 59
    iget-object p2, p0, Ll/pd1;->a:Ll/pd1$a;

    .line 60
    .line 61
    invoke-virtual {p2}, Ll/pd1$a;->a()J

    .line 62
    .line 63
    .line 64
    move-result-wide v1

    .line 65
    iget-wide v3, p0, Ll/pd1;->f:J

    .line 66
    .line 67
    cmp-long p2, v1, v3

    .line 68
    .line 69
    if-lez p2, :cond_9

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ll/pd1;->h(I)V

    .line 72
    .line 73
    .line 74
    return v0

    .line 75
    :cond_5
    invoke-virtual {p0}, Ll/pd1;->g()V

    .line 76
    .line 77
    .line 78
    return v0

    .line 79
    :cond_6
    if-eqz v0, :cond_8

    .line 80
    .line 81
    iget-object p1, p0, Ll/pd1;->a:Ll/pd1$a;

    .line 82
    .line 83
    invoke-virtual {p1}, Ll/pd1$a;->b()J

    .line 84
    .line 85
    .line 86
    move-result-wide p1

    .line 87
    iget-wide v2, p0, Ll/pd1;->c:J

    .line 88
    .line 89
    cmp-long p1, p1, v2

    .line 90
    .line 91
    if-ltz p1, :cond_7

    .line 92
    .line 93
    iget-object p1, p0, Ll/pd1;->a:Ll/pd1$a;

    .line 94
    .line 95
    invoke-virtual {p1}, Ll/pd1$a;->a()J

    .line 96
    .line 97
    .line 98
    move-result-wide p1

    .line 99
    iput-wide p1, p0, Ll/pd1;->f:J

    .line 100
    .line 101
    invoke-virtual {p0, v4}, Ll/pd1;->h(I)V

    .line 102
    .line 103
    .line 104
    return v0

    .line 105
    :cond_7
    return v1

    .line 106
    :cond_8
    iget-wide v1, p0, Ll/pd1;->c:J

    .line 107
    .line 108
    sub-long/2addr p1, v1

    .line 109
    const-wide/32 v1, 0x7a120

    .line 110
    .line 111
    .line 112
    cmp-long p1, p1, v1

    .line 113
    .line 114
    if-lez p1, :cond_9

    .line 115
    .line 116
    invoke-virtual {p0, v3}, Ll/pd1;->h(I)V

    .line 117
    .line 118
    .line 119
    :cond_9
    :goto_0
    return v0

    .line 120
    :cond_a
    :goto_1
    return v1
.end method

.method public f()V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Ll/pd1;->h(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pd1;->a:Ll/pd1$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Ll/pd1;->h(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final h(I)V
    .locals 6

    .line 1
    iput p1, p0, Ll/pd1;->b:I

    .line 2
    .line 3
    const-wide/16 v0, 0x2710

    .line 4
    .line 5
    if-eqz p1, :cond_3

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-eq p1, v2, :cond_2

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    if-eq p1, v0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x3

    .line 14
    if-eq p1, v0, :cond_1

    .line 15
    .line 16
    const/4 v0, 0x4

    .line 17
    if-ne p1, v0, :cond_0

    .line 18
    .line 19
    const-wide/32 v0, 0x7a120

    .line 20
    .line 21
    .line 22
    iput-wide v0, p0, Ll/pd1;->d:J

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    const-wide/32 v0, 0x989680

    .line 30
    .line 31
    .line 32
    iput-wide v0, p0, Ll/pd1;->d:J

    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    iput-wide v0, p0, Ll/pd1;->d:J

    .line 36
    .line 37
    return-void

    .line 38
    :cond_3
    const-wide/16 v2, 0x0

    .line 39
    .line 40
    iput-wide v2, p0, Ll/pd1;->e:J

    .line 41
    .line 42
    const-wide/16 v2, -0x1

    .line 43
    .line 44
    iput-wide v2, p0, Ll/pd1;->f:J

    .line 45
    .line 46
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 47
    .line 48
    .line 49
    move-result-wide v2

    .line 50
    const-wide/16 v4, 0x3e8

    .line 51
    .line 52
    div-long/2addr v2, v4

    .line 53
    iput-wide v2, p0, Ll/pd1;->c:J

    .line 54
    .line 55
    iput-wide v0, p0, Ll/pd1;->d:J

    .line 56
    .line 57
    return-void
.end method
