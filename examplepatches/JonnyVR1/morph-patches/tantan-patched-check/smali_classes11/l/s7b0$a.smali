.class public final Ll/s7b0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/s7b0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/hte;

.field public final b:Ll/h0j0;

.field public final c:Ll/hg60;

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:I

.field public h:J


# direct methods
.method public constructor <init>(Ll/hte;Ll/h0j0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/s7b0$a;->a:Ll/hte;

    .line 5
    .line 6
    iput-object p2, p0, Ll/s7b0$a;->b:Ll/h0j0;

    .line 7
    .line 8
    new-instance p1, Ll/hg60;

    .line 9
    .line 10
    const/16 p2, 0x40

    .line 11
    .line 12
    new-array p2, p2, [B

    .line 13
    .line 14
    invoke-direct {p1, p2}, Ll/hg60;-><init>([B)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a(Ll/ig60;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 2
    .line 3
    iget-object v0, v0, Ll/hg60;->a:[B

    .line 4
    .line 5
    const/4 v1, 0x3

    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {p1, v0, v2, v1}, Ll/ig60;->l([BII)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Ll/hg60;->p(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/s7b0$a;->b()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 19
    .line 20
    iget-object v0, v0, Ll/hg60;->a:[B

    .line 21
    .line 22
    iget v1, p0, Ll/s7b0$a;->g:I

    .line 23
    .line 24
    invoke-virtual {p1, v0, v2, v1}, Ll/ig60;->l([BII)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Ll/hg60;->p(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/s7b0$a;->c()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/s7b0$a;->a:Ll/hte;

    .line 36
    .line 37
    iget-wide v1, p0, Ll/s7b0$a;->h:J

    .line 38
    .line 39
    const/4 v3, 0x4

    .line 40
    invoke-interface {v0, v1, v2, v3}, Ll/hte;->d(JI)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/s7b0$a;->a:Ll/hte;

    .line 44
    .line 45
    invoke-interface {v0, p1}, Ll/hte;->a(Ll/ig60;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/s7b0$a;->a:Ll/hte;

    .line 49
    .line 50
    invoke-interface {p0}, Ll/hte;->c()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final b()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/hg60;->r(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput-boolean v0, p0, Ll/s7b0$a;->d:Z

    .line 15
    .line 16
    iget-object v0, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput-boolean v0, p0, Ll/s7b0$a;->e:Z

    .line 23
    .line 24
    iget-object v0, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 25
    .line 26
    const/4 v2, 0x6

    .line 27
    invoke-virtual {v0, v2}, Ll/hg60;->r(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/hg60;->h(I)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iput v0, p0, Ll/s7b0$a;->g:I

    .line 37
    .line 38
    return-void
.end method

.method public final c()V
    .locals 10

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/s7b0$a;->h:J

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/s7b0$a;->d:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    invoke-virtual {v0, v1}, Ll/hg60;->r(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 16
    .line 17
    const/4 v2, 0x3

    .line 18
    invoke-virtual {v0, v2}, Ll/hg60;->h(I)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    int-to-long v3, v0

    .line 23
    const/16 v0, 0x1e

    .line 24
    .line 25
    shl-long/2addr v3, v0

    .line 26
    iget-object v5, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 27
    .line 28
    const/4 v6, 0x1

    .line 29
    invoke-virtual {v5, v6}, Ll/hg60;->r(I)V

    .line 30
    .line 31
    .line 32
    iget-object v5, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 33
    .line 34
    const/16 v7, 0xf

    .line 35
    .line 36
    invoke-virtual {v5, v7}, Ll/hg60;->h(I)I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    shl-int/2addr v5, v7

    .line 41
    int-to-long v8, v5

    .line 42
    or-long/2addr v3, v8

    .line 43
    iget-object v5, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 44
    .line 45
    invoke-virtual {v5, v6}, Ll/hg60;->r(I)V

    .line 46
    .line 47
    .line 48
    iget-object v5, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 49
    .line 50
    invoke-virtual {v5, v7}, Ll/hg60;->h(I)I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    int-to-long v8, v5

    .line 55
    or-long/2addr v3, v8

    .line 56
    iget-object v5, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 57
    .line 58
    invoke-virtual {v5, v6}, Ll/hg60;->r(I)V

    .line 59
    .line 60
    .line 61
    iget-boolean v5, p0, Ll/s7b0$a;->f:Z

    .line 62
    .line 63
    if-nez v5, :cond_0

    .line 64
    .line 65
    iget-boolean v5, p0, Ll/s7b0$a;->e:Z

    .line 66
    .line 67
    if-eqz v5, :cond_0

    .line 68
    .line 69
    iget-object v5, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 70
    .line 71
    invoke-virtual {v5, v1}, Ll/hg60;->r(I)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Ll/hg60;->h(I)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    int-to-long v1, v1

    .line 81
    shl-long v0, v1, v0

    .line 82
    .line 83
    iget-object v2, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 84
    .line 85
    invoke-virtual {v2, v6}, Ll/hg60;->r(I)V

    .line 86
    .line 87
    .line 88
    iget-object v2, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 89
    .line 90
    invoke-virtual {v2, v7}, Ll/hg60;->h(I)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    shl-int/2addr v2, v7

    .line 95
    int-to-long v8, v2

    .line 96
    or-long/2addr v0, v8

    .line 97
    iget-object v2, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 98
    .line 99
    invoke-virtual {v2, v6}, Ll/hg60;->r(I)V

    .line 100
    .line 101
    .line 102
    iget-object v2, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 103
    .line 104
    invoke-virtual {v2, v7}, Ll/hg60;->h(I)I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    int-to-long v7, v2

    .line 109
    or-long/2addr v0, v7

    .line 110
    iget-object v2, p0, Ll/s7b0$a;->c:Ll/hg60;

    .line 111
    .line 112
    invoke-virtual {v2, v6}, Ll/hg60;->r(I)V

    .line 113
    .line 114
    .line 115
    iget-object v2, p0, Ll/s7b0$a;->b:Ll/h0j0;

    .line 116
    .line 117
    invoke-virtual {v2, v0, v1}, Ll/h0j0;->b(J)J

    .line 118
    .line 119
    .line 120
    iput-boolean v6, p0, Ll/s7b0$a;->f:Z

    .line 121
    .line 122
    :cond_0
    iget-object v0, p0, Ll/s7b0$a;->b:Ll/h0j0;

    .line 123
    .line 124
    invoke-virtual {v0, v3, v4}, Ll/h0j0;->b(J)J

    .line 125
    .line 126
    .line 127
    move-result-wide v0

    .line 128
    iput-wide v0, p0, Ll/s7b0$a;->h:J

    .line 129
    .line 130
    :cond_1
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/s7b0$a;->f:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/s7b0$a;->a:Ll/hte;

    .line 5
    .line 6
    invoke-interface {p0}, Ll/hte;->b()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
