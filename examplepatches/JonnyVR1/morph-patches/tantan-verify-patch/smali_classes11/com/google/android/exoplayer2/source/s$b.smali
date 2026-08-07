.class public final Lcom/google/android/exoplayer2/source/s$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xwd0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:Z

.field public final synthetic c:Lcom/google/android/exoplayer2/source/s;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/s;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/s$b;->c:Lcom/google/android/exoplayer2/source/s;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/source/s;Lcom/google/android/exoplayer2/source/s$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/source/s$b;-><init>(Lcom/google/android/exoplayer2/source/s;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/s$b;->c:Lcom/google/android/exoplayer2/source/s;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/s;->k:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/s;->i:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/upstream/Loader;->a()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/s$b;->c:Lcom/google/android/exoplayer2/source/s;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/source/s;->l:Z

    .line 4
    .line 5
    return p0
.end method

.method public final c()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/s$b;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/s$b;->c:Lcom/google/android/exoplayer2/source/s;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/s;->a(Lcom/google/android/exoplayer2/source/s;)Lcom/google/android/exoplayer2/source/j$a;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/s$b;->c:Lcom/google/android/exoplayer2/source/s;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/s;->j:Lcom/google/android/exoplayer2/k;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Ll/kb00;->k(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/s$b;->c:Lcom/google/android/exoplayer2/source/s;

    .line 22
    .line 23
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/s;->j:Lcom/google/android/exoplayer2/k;

    .line 24
    .line 25
    const/4 v5, 0x0

    .line 26
    const-wide/16 v6, 0x0

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    invoke-virtual/range {v1 .. v7}, Lcom/google/android/exoplayer2/source/j$a;->h(ILcom/google/android/exoplayer2/k;ILjava/lang/Object;J)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/s$b;->b:Z

    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/exoplayer2/source/s$b;->a:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput v0, p0, Lcom/google/android/exoplayer2/source/s$b;->a:I

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public k(J)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/s$b;->c()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long p1, p1, v0

    .line 7
    .line 8
    if-lez p1, :cond_0

    .line 9
    .line 10
    iget p1, p0, Lcom/google/android/exoplayer2/source/s$b;->a:I

    .line 11
    .line 12
    const/4 p2, 0x2

    .line 13
    if-eq p1, p2, :cond_0

    .line 14
    .line 15
    iput p2, p0, Lcom/google/android/exoplayer2/source/s$b;->a:I

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

.method public l(Ll/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;I)I
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/s$b;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/s$b;->c:Lcom/google/android/exoplayer2/source/s;

    .line 5
    .line 6
    iget-boolean v1, v0, Lcom/google/android/exoplayer2/source/s;->l:Z

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/s;->m:[B

    .line 12
    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    iput v2, p0, Lcom/google/android/exoplayer2/source/s$b;->a:I

    .line 16
    .line 17
    :cond_0
    iget v3, p0, Lcom/google/android/exoplayer2/source/s$b;->a:I

    .line 18
    .line 19
    const/4 v4, -0x4

    .line 20
    if-ne v3, v2, :cond_1

    .line 21
    .line 22
    const/4 p0, 0x4

    .line 23
    invoke-virtual {p2, p0}, Ll/ah3;->h(I)V

    .line 24
    .line 25
    .line 26
    return v4

    .line 27
    :cond_1
    and-int/lit8 v5, p3, 0x2

    .line 28
    .line 29
    const/4 v6, 0x1

    .line 30
    if-nez v5, :cond_6

    .line 31
    .line 32
    if-nez v3, :cond_2

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    if-nez v1, :cond_3

    .line 36
    .line 37
    const/4 p0, -0x3

    .line 38
    return p0

    .line 39
    :cond_3
    iget-object p1, v0, Lcom/google/android/exoplayer2/source/s;->m:[B

    .line 40
    .line 41
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p2, v6}, Ll/ah3;->h(I)V

    .line 45
    .line 46
    .line 47
    const-wide/16 v0, 0x0

    .line 48
    .line 49
    iput-wide v0, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->e:J

    .line 50
    .line 51
    and-int/lit8 p1, p3, 0x4

    .line 52
    .line 53
    if-nez p1, :cond_4

    .line 54
    .line 55
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/s$b;->c:Lcom/google/android/exoplayer2/source/s;

    .line 56
    .line 57
    iget p1, p1, Lcom/google/android/exoplayer2/source/s;->n:I

    .line 58
    .line 59
    invoke-virtual {p2, p1}, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->v(I)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->c:Ljava/nio/ByteBuffer;

    .line 63
    .line 64
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/s$b;->c:Lcom/google/android/exoplayer2/source/s;

    .line 65
    .line 66
    iget-object v0, p2, Lcom/google/android/exoplayer2/source/s;->m:[B

    .line 67
    .line 68
    const/4 v1, 0x0

    .line 69
    iget p2, p2, Lcom/google/android/exoplayer2/source/s;->n:I

    .line 70
    .line 71
    invoke-virtual {p1, v0, v1, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 72
    .line 73
    .line 74
    :cond_4
    and-int/lit8 p1, p3, 0x1

    .line 75
    .line 76
    if-nez p1, :cond_5

    .line 77
    .line 78
    iput v2, p0, Lcom/google/android/exoplayer2/source/s$b;->a:I

    .line 79
    .line 80
    :cond_5
    return v4

    .line 81
    :cond_6
    :goto_0
    iget-object p2, v0, Lcom/google/android/exoplayer2/source/s;->j:Lcom/google/android/exoplayer2/k;

    .line 82
    .line 83
    iput-object p2, p1, Ll/p1j;->b:Lcom/google/android/exoplayer2/k;

    .line 84
    .line 85
    iput v6, p0, Lcom/google/android/exoplayer2/source/s$b;->a:I

    .line 86
    .line 87
    const/4 p0, -0x5

    .line 88
    return p0
.end method
