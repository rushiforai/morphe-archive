.class public final Ll/o5l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xwd0;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:I

.field public final b:Ll/s5l;

.field public c:I


# direct methods
.method public constructor <init>(Ll/s5l;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/o5l;->b:Ll/s5l;

    .line 5
    .line 6
    iput p2, p0, Ll/o5l;->a:I

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    iput p1, p0, Ll/o5l;->c:I

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/o5l;->c:I

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    if-eq v0, v1, :cond_2

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/o5l;->b:Ll/s5l;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/s5l;->T()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 v1, -0x3

    .line 16
    if-eq v0, v1, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/o5l;->b:Ll/s5l;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/s5l;->U(I)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void

    .line 24
    :cond_2
    new-instance v0, Lcom/google/android/exoplayer2/source/hls/SampleQueueMappingException;

    .line 25
    .line 26
    iget-object v1, p0, Ll/o5l;->b:Ll/s5l;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/s5l;->m()Ll/ffj0;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget p0, p0, Ll/o5l;->a:I

    .line 33
    .line 34
    invoke-virtual {v1, p0}, Ll/ffj0;->b(I)Ll/dfj0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {p0, v1}, Ll/dfj0;->c(I)Lcom/google/android/exoplayer2/k;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iget-object p0, p0, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Lcom/google/android/exoplayer2/source/hls/SampleQueueMappingException;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    throw v0
.end method

.method public b()Z
    .locals 2

    .line 1
    iget v0, p0, Ll/o5l;->c:I

    .line 2
    .line 3
    const/4 v1, -0x3

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/o5l;->d()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/o5l;->b:Ll/s5l;

    .line 13
    .line 14
    iget p0, p0, Ll/o5l;->c:I

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ll/s5l;->P(I)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 26
    return p0
.end method

.method public c()V
    .locals 2

    .line 1
    iget v0, p0, Ll/o5l;->c:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    invoke-static {v0}, Ll/w11;->a(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/o5l;->b:Ll/s5l;

    .line 13
    .line 14
    iget v1, p0, Ll/o5l;->a:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/s5l;->x(I)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Ll/o5l;->c:I

    .line 21
    .line 22
    return-void
.end method

.method public final d()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/o5l;->c:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    if-eq p0, v0, :cond_0

    .line 5
    .line 6
    const/4 v0, -0x3

    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 v0, -0x2

    .line 10
    if-eq p0, v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public e()V
    .locals 3

    .line 1
    iget v0, p0, Ll/o5l;->c:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/o5l;->b:Ll/s5l;

    .line 7
    .line 8
    iget v2, p0, Ll/o5l;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Ll/s5l;->o0(I)V

    .line 11
    .line 12
    .line 13
    iput v1, p0, Ll/o5l;->c:I

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public k(J)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/o5l;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/o5l;->b:Ll/s5l;

    .line 8
    .line 9
    iget p0, p0, Ll/o5l;->c:I

    .line 10
    .line 11
    invoke-virtual {v0, p0, p1, p2}, Ll/s5l;->n0(IJ)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public l(Ll/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;I)I
    .locals 2

    .line 1
    iget v0, p0, Ll/o5l;->c:I

    .line 2
    .line 3
    const/4 v1, -0x3

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x4

    .line 7
    invoke-virtual {p2, p0}, Ll/ah3;->h(I)V

    .line 8
    .line 9
    .line 10
    const/4 p0, -0x4

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/o5l;->d()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/o5l;->b:Ll/s5l;

    .line 19
    .line 20
    iget p0, p0, Ll/o5l;->c:I

    .line 21
    .line 22
    invoke-virtual {v0, p0, p1, p2, p3}, Ll/s5l;->d0(ILl/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;I)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    return v1
.end method
