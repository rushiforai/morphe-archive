.class public Ll/vpd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ltv;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final b:Ll/hjd;

.field public final c:J

.field public final d:J

.field public final e:J

.field public final f:J

.field public final g:I

.field public final h:Z

.field public final i:J

.field public final j:Z

.field public k:I

.field public l:Z


# direct methods
.method public constructor <init>()V
    .locals 10

    .line 87
    new-instance v1, Ll/hjd;

    const/4 v0, 0x1

    const/high16 v2, 0x10000

    invoke-direct {v1, v0, v2}, Ll/hjd;-><init>(ZI)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    const v2, 0xc350

    const v3, 0xc350

    const/16 v4, 0x9c4

    const/16 v5, 0x1388

    const/4 v6, -0x1

    const/4 v7, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v9}, Ll/vpd;-><init>(Ll/hjd;IIIIIZIZ)V

    return-void
.end method

.method public constructor <init>(Ll/hjd;IIIIIZIZ)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const-string v1, "bufferForPlaybackMs"

    .line 6
    .line 7
    const-string v2, "0"

    .line 8
    .line 9
    invoke-static {p4, v0, v1, v2}, Ll/vpd;->l(IILjava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v3, "bufferForPlaybackAfterRebufferMs"

    .line 13
    .line 14
    invoke-static {p5, v0, v3, v2}, Ll/vpd;->l(IILjava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v4, "minBufferMs"

    .line 18
    .line 19
    invoke-static {p2, p4, v4, v1}, Ll/vpd;->l(IILjava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p2, p5, v4, v3}, Ll/vpd;->l(IILjava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const-string v1, "maxBufferMs"

    .line 26
    .line 27
    invoke-static {p3, p2, v1, v4}, Ll/vpd;->l(IILjava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string v1, "backBufferDurationMs"

    .line 31
    .line 32
    invoke-static {p8, v0, v1, v2}, Ll/vpd;->l(IILjava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Ll/vpd;->b:Ll/hjd;

    .line 36
    .line 37
    int-to-long p1, p2

    .line 38
    invoke-static {p1, p2}, Ll/bmk0;->J0(J)J

    .line 39
    .line 40
    .line 41
    move-result-wide p1

    .line 42
    iput-wide p1, p0, Ll/vpd;->c:J

    .line 43
    .line 44
    int-to-long p1, p3

    .line 45
    invoke-static {p1, p2}, Ll/bmk0;->J0(J)J

    .line 46
    .line 47
    .line 48
    move-result-wide p1

    .line 49
    iput-wide p1, p0, Ll/vpd;->d:J

    .line 50
    .line 51
    int-to-long p1, p4

    .line 52
    invoke-static {p1, p2}, Ll/bmk0;->J0(J)J

    .line 53
    .line 54
    .line 55
    move-result-wide p1

    .line 56
    iput-wide p1, p0, Ll/vpd;->e:J

    .line 57
    .line 58
    int-to-long p1, p5

    .line 59
    invoke-static {p1, p2}, Ll/bmk0;->J0(J)J

    .line 60
    .line 61
    .line 62
    move-result-wide p1

    .line 63
    iput-wide p1, p0, Ll/vpd;->f:J

    .line 64
    .line 65
    iput p6, p0, Ll/vpd;->g:I

    .line 66
    .line 67
    const/4 p1, -0x1

    .line 68
    if-eq p6, p1, :cond_0

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    const/high16 p6, 0xc80000

    .line 72
    .line 73
    :goto_0
    iput p6, p0, Ll/vpd;->k:I

    .line 74
    .line 75
    iput-boolean p7, p0, Ll/vpd;->h:Z

    .line 76
    .line 77
    int-to-long p1, p8

    .line 78
    invoke-static {p1, p2}, Ll/bmk0;->J0(J)J

    .line 79
    .line 80
    .line 81
    move-result-wide p1

    .line 82
    iput-wide p1, p0, Ll/vpd;->i:J

    .line 83
    .line 84
    iput-boolean p9, p0, Ll/vpd;->j:Z

    .line 85
    .line 86
    return-void
.end method

.method public static l(IILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    if-lt p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p2, " cannot be less than "

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p0, p1}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static n(I)I
    .locals 1

    .line 1
    const/high16 v0, 0x20000

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    :pswitch_0
    invoke-static {}, Ll/fig0;->a()V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :pswitch_1
    return v0

    .line 12
    :pswitch_2
    const/high16 p0, 0x7d00000

    .line 13
    .line 14
    return p0

    .line 15
    :pswitch_3
    const/high16 p0, 0xc80000

    .line 16
    .line 17
    return p0

    .line 18
    :pswitch_4
    const/high16 p0, 0x89a0000

    .line 19
    .line 20
    return p0

    .line 21
    :pswitch_5
    const/4 p0, 0x0

    .line 22
    return p0

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/vpd;->o(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/vpd;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public d()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/vpd;->o(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public e(JJF)Z
    .locals 6

    .line 1
    iget-object p1, p0, Ll/vpd;->b:Ll/hjd;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/hjd;->f()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget p2, p0, Ll/vpd;->k:I

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x0

    .line 11
    if-lt p1, p2, :cond_0

    .line 12
    .line 13
    move p1, v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move p1, v1

    .line 16
    :goto_0
    iget-wide v2, p0, Ll/vpd;->c:J

    .line 17
    .line 18
    const/high16 p2, 0x3f800000    # 1.0f

    .line 19
    .line 20
    cmpl-float p2, p5, p2

    .line 21
    .line 22
    if-lez p2, :cond_1

    .line 23
    .line 24
    invoke-static {v2, v3, p5}, Ll/bmk0;->d0(JF)J

    .line 25
    .line 26
    .line 27
    move-result-wide v2

    .line 28
    iget-wide v4, p0, Ll/vpd;->d:J

    .line 29
    .line 30
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    .line 31
    .line 32
    .line 33
    move-result-wide v2

    .line 34
    :cond_1
    const-wide/32 v4, 0x7a120

    .line 35
    .line 36
    .line 37
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 38
    .line 39
    .line 40
    move-result-wide v2

    .line 41
    cmp-long p2, p3, v2

    .line 42
    .line 43
    if-gez p2, :cond_4

    .line 44
    .line 45
    iget-boolean p2, p0, Ll/vpd;->h:Z

    .line 46
    .line 47
    if-nez p2, :cond_3

    .line 48
    .line 49
    if-nez p1, :cond_2

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    move v0, v1

    .line 53
    :cond_3
    :goto_1
    iput-boolean v0, p0, Ll/vpd;->l:Z

    .line 54
    .line 55
    if-nez v0, :cond_6

    .line 56
    .line 57
    cmp-long p1, p3, v4

    .line 58
    .line 59
    if-gez p1, :cond_6

    .line 60
    .line 61
    const-string p1, "DefaultLoadControl"

    .line 62
    .line 63
    const-string p2, "Target buffer size reached with less than 500ms of buffered media data."

    .line 64
    .line 65
    invoke-static {p1, p2}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_4
    iget-wide v2, p0, Ll/vpd;->d:J

    .line 70
    .line 71
    cmp-long p2, p3, v2

    .line 72
    .line 73
    if-gez p2, :cond_5

    .line 74
    .line 75
    if-eqz p1, :cond_6

    .line 76
    .line 77
    :cond_5
    iput-boolean v1, p0, Ll/vpd;->l:Z

    .line 78
    .line 79
    :cond_6
    :goto_2
    iget-boolean p0, p0, Ll/vpd;->l:Z

    .line 80
    .line 81
    return p0
.end method

.method public f(Lcom/google/android/exoplayer2/c0;Ll/fyx;[Lcom/google/android/exoplayer2/x;Ll/ffj0;[Ll/u9f;)V
    .locals 0

    .line 1
    iget p1, p0, Ll/vpd;->g:I

    .line 2
    .line 3
    const/4 p2, -0x1

    .line 4
    if-ne p1, p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p3, p5}, Ll/vpd;->m([Lcom/google/android/exoplayer2/x;[Ll/u9f;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    :cond_0
    iput p1, p0, Ll/vpd;->k:I

    .line 11
    .line 12
    iget-object p0, p0, Ll/vpd;->b:Ll/hjd;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/hjd;->h(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public g()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/vpd;->i:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public i()Ll/oj0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vpd;->b:Ll/hjd;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/vpd;->o(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public k(Lcom/google/android/exoplayer2/c0;Ll/fyx;JFZJ)Z
    .locals 0

    .line 1
    invoke-static {p3, p4, p5}, Ll/bmk0;->i0(JF)J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    if-eqz p6, :cond_0

    .line 6
    .line 7
    iget-wide p3, p0, Ll/vpd;->f:J

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-wide p3, p0, Ll/vpd;->e:J

    .line 11
    .line 12
    :goto_0
    const-wide p5, -0x7fffffffffffffffL    # -4.9E-324

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    cmp-long p5, p7, p5

    .line 18
    .line 19
    if-eqz p5, :cond_1

    .line 20
    .line 21
    const-wide/16 p5, 0x2

    .line 22
    .line 23
    div-long/2addr p7, p5

    .line 24
    invoke-static {p7, p8, p3, p4}, Ljava/lang/Math;->min(JJ)J

    .line 25
    .line 26
    .line 27
    move-result-wide p3

    .line 28
    :cond_1
    const-wide/16 p5, 0x0

    .line 29
    .line 30
    cmp-long p5, p3, p5

    .line 31
    .line 32
    if-lez p5, :cond_3

    .line 33
    .line 34
    cmp-long p1, p1, p3

    .line 35
    .line 36
    if-gez p1, :cond_3

    .line 37
    .line 38
    iget-boolean p1, p0, Ll/vpd;->h:Z

    .line 39
    .line 40
    if-nez p1, :cond_2

    .line 41
    .line 42
    iget-object p1, p0, Ll/vpd;->b:Ll/hjd;

    .line 43
    .line 44
    invoke-virtual {p1}, Ll/hjd;->f()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iget p0, p0, Ll/vpd;->k:I

    .line 49
    .line 50
    if-lt p1, p0, :cond_2

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    const/4 p0, 0x0

    .line 54
    return p0

    .line 55
    :cond_3
    :goto_1
    const/4 p0, 0x1

    .line 56
    return p0
.end method

.method public m([Lcom/google/android/exoplayer2/x;[Ll/u9f;)I
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    :goto_0
    array-length v1, p1

    .line 4
    if-ge p0, v1, :cond_1

    .line 5
    .line 6
    aget-object v1, p2, p0

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    aget-object v1, p1, p0

    .line 11
    .line 12
    invoke-interface {v1}, Lcom/google/android/exoplayer2/x;->getTrackType()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-static {v1}, Ll/vpd;->n(I)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    add-int/2addr v0, v1

    .line 21
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const/high16 p0, 0xc80000

    .line 25
    .line 26
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method public final o(Z)V
    .locals 2

    .line 1
    iget v0, p0, Ll/vpd;->g:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/high16 v0, 0xc80000

    .line 7
    .line 8
    :cond_0
    iput v0, p0, Ll/vpd;->k:I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Ll/vpd;->l:Z

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Ll/vpd;->b:Ll/hjd;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/hjd;->g()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method
