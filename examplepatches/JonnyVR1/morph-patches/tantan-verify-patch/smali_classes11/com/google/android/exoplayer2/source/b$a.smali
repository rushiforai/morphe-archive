.class public final Lcom/google/android/exoplayer2/source/b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xwd0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/xwd0;

.field public b:Z

.field public final synthetic c:Lcom/google/android/exoplayer2/source/b;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/b;Ll/xwd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/b$a;->c:Lcom/google/android/exoplayer2/source/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/b$a;->a:Ll/xwd0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/b$a;->a:Ll/xwd0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xwd0;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/b$a;->c:Lcom/google/android/exoplayer2/source/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/b;->n()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/b$a;->a:Ll/xwd0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/xwd0;->b()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/b$a;->b:Z

    .line 3
    .line 4
    return-void
.end method

.method public k(J)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/b$a;->c:Lcom/google/android/exoplayer2/source/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/b;->n()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x3

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/b$a;->a:Ll/xwd0;

    .line 12
    .line 13
    invoke-interface {p0, p1, p2}, Ll/xwd0;->k(J)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public l(Ll/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;I)I
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/b$a;->c:Lcom/google/android/exoplayer2/source/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/b;->n()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x3

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/b$a;->b:Z

    .line 12
    .line 13
    const/4 v2, 0x4

    .line 14
    const/4 v3, -0x4

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p2, v2}, Ll/ah3;->t(I)V

    .line 18
    .line 19
    .line 20
    return v3

    .line 21
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/b$a;->c:Lcom/google/android/exoplayer2/source/b;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/b;->d()J

    .line 24
    .line 25
    .line 26
    move-result-wide v4

    .line 27
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/b$a;->a:Ll/xwd0;

    .line 28
    .line 29
    invoke-interface {v0, p1, p2, p3}, Ll/xwd0;->l(Ll/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;I)I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    const/4 v0, -0x5

    .line 34
    const-wide/high16 v6, -0x8000000000000000L

    .line 35
    .line 36
    if-ne p3, v0, :cond_6

    .line 37
    .line 38
    iget-object p2, p1, Ll/p1j;->b:Lcom/google/android/exoplayer2/k;

    .line 39
    .line 40
    invoke-static {p2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    check-cast p2, Lcom/google/android/exoplayer2/k;

    .line 45
    .line 46
    iget p3, p2, Lcom/google/android/exoplayer2/k;->B:I

    .line 47
    .line 48
    if-nez p3, :cond_2

    .line 49
    .line 50
    iget v1, p2, Lcom/google/android/exoplayer2/k;->C:I

    .line 51
    .line 52
    if-eqz v1, :cond_5

    .line 53
    .line 54
    :cond_2
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/b$a;->c:Lcom/google/android/exoplayer2/source/b;

    .line 55
    .line 56
    iget-wide v1, p0, Lcom/google/android/exoplayer2/source/b;->e:J

    .line 57
    .line 58
    const-wide/16 v3, 0x0

    .line 59
    .line 60
    cmp-long v1, v1, v3

    .line 61
    .line 62
    const/4 v2, 0x0

    .line 63
    if-eqz v1, :cond_3

    .line 64
    .line 65
    move p3, v2

    .line 66
    :cond_3
    iget-wide v3, p0, Lcom/google/android/exoplayer2/source/b;->f:J

    .line 67
    .line 68
    cmp-long p0, v3, v6

    .line 69
    .line 70
    if-eqz p0, :cond_4

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_4
    iget v2, p2, Lcom/google/android/exoplayer2/k;->C:I

    .line 74
    .line 75
    :goto_0
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/k;->b()Lcom/google/android/exoplayer2/k$b;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0, p3}, Lcom/google/android/exoplayer2/k$b;->P(I)Lcom/google/android/exoplayer2/k$b;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/k$b;->Q(I)Lcom/google/android/exoplayer2/k$b;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    iput-object p0, p1, Ll/p1j;->b:Lcom/google/android/exoplayer2/k;

    .line 92
    .line 93
    :cond_5
    return v0

    .line 94
    :cond_6
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/b$a;->c:Lcom/google/android/exoplayer2/source/b;

    .line 95
    .line 96
    iget-wide v8, p1, Lcom/google/android/exoplayer2/source/b;->f:J

    .line 97
    .line 98
    cmp-long p1, v8, v6

    .line 99
    .line 100
    if-eqz p1, :cond_9

    .line 101
    .line 102
    if-ne p3, v3, :cond_7

    .line 103
    .line 104
    iget-wide v10, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->e:J

    .line 105
    .line 106
    cmp-long p1, v10, v8

    .line 107
    .line 108
    if-gez p1, :cond_8

    .line 109
    .line 110
    :cond_7
    if-ne p3, v1, :cond_9

    .line 111
    .line 112
    cmp-long p1, v4, v6

    .line 113
    .line 114
    if-nez p1, :cond_9

    .line 115
    .line 116
    iget-boolean p1, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->d:Z

    .line 117
    .line 118
    if-nez p1, :cond_9

    .line 119
    .line 120
    :cond_8
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->i()V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p2, v2}, Ll/ah3;->t(I)V

    .line 124
    .line 125
    .line 126
    const/4 p1, 0x1

    .line 127
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/b$a;->b:Z

    .line 128
    .line 129
    return v3

    .line 130
    :cond_9
    return p3
.end method
