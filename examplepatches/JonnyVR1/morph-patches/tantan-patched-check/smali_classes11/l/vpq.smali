.class public final Ll/vpq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zrf;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/ig60;

.field public b:Ll/bsf;

.field public c:I

.field public d:I

.field public e:I

.field public f:J

.field public g:Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:Ll/asf;

.field public i:Ll/b3g0;

.field public j:Ll/c710;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ig60;

    .line 5
    .line 6
    const/4 v1, 0x6

    .line 7
    invoke-direct {v0, v1}, Ll/ig60;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/vpq;->a:Ll/ig60;

    .line 11
    .line 12
    const-wide/16 v0, -0x1

    .line 13
    .line 14
    iput-wide v0, p0, Ll/vpq;->f:J

    .line 15
    .line 16
    return-void
.end method

.method public static e(Ljava/lang/String;J)Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    invoke-static {p0}, Ll/mmq0;->a(Ljava/lang/String;)Ll/v610;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_1
    invoke-virtual {p0, p1, p2}, Ll/v610;->a(J)Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method


# virtual methods
.method public a(JJ)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Ll/vpq;->c:I

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Ll/vpq;->j:Ll/c710;

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget v0, p0, Ll/vpq;->c:I

    .line 15
    .line 16
    const/4 v1, 0x5

    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ll/vpq;->j:Ll/c710;

    .line 20
    .line 21
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ll/c710;

    .line 26
    .line 27
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/c710;->a(JJ)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public b(Ll/bsf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vpq;->b:Ll/bsf;

    .line 2
    .line 3
    return-void
.end method

.method public final c(Ll/asf;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vpq;->a:Ll/ig60;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-virtual {v0, v1}, Ll/ig60;->Q(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/vpq;->a:Ll/ig60;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-interface {p1, v0, v2, v1}, Ll/asf;->f([BII)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/vpq;->a:Ll/ig60;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ig60;->N()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    sub-int/2addr p0, v1

    .line 24
    invoke-interface {p1, p0}, Ll/asf;->m(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final d()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lcom/google/android/exoplayer2/metadata/Metadata$Entry;

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Ll/vpq;->g([Lcom/google/android/exoplayer2/metadata/Metadata$Entry;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/vpq;->b:Ll/bsf;

    .line 8
    .line 9
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/bsf;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/bsf;->l()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/vpq;->b:Ll/bsf;

    .line 19
    .line 20
    new-instance v1, Ll/mke0$b;

    .line 21
    .line 22
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    invoke-direct {v1, v2, v3}, Ll/mke0$b;-><init>(J)V

    .line 28
    .line 29
    .line 30
    invoke-interface {v0, v1}, Ll/bsf;->k(Ll/mke0;)V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x6

    .line 34
    iput v0, p0, Ll/vpq;->c:I

    .line 35
    .line 36
    return-void
.end method

.method public f(Ll/asf;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/vpq;->i(Ll/asf;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const v1, 0xffd8

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    return v2

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Ll/vpq;->i(Ll/asf;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Ll/vpq;->d:I

    .line 17
    .line 18
    const v1, 0xffe0

    .line 19
    .line 20
    .line 21
    if-ne v0, v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/vpq;->c(Ll/asf;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/vpq;->i(Ll/asf;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Ll/vpq;->d:I

    .line 31
    .line 32
    :cond_1
    iget v0, p0, Ll/vpq;->d:I

    .line 33
    .line 34
    const v1, 0xffe1

    .line 35
    .line 36
    .line 37
    if-eq v0, v1, :cond_2

    .line 38
    .line 39
    return v2

    .line 40
    :cond_2
    const/4 v0, 0x2

    .line 41
    invoke-interface {p1, v0}, Ll/asf;->m(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/vpq;->a:Ll/ig60;

    .line 45
    .line 46
    const/4 v1, 0x6

    .line 47
    invoke-virtual {v0, v1}, Ll/ig60;->Q(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/vpq;->a:Ll/ig60;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-interface {p1, v0, v2, v1}, Ll/asf;->f([BII)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/vpq;->a:Ll/ig60;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/ig60;->J()J

    .line 62
    .line 63
    .line 64
    move-result-wide v0

    .line 65
    const-wide/32 v3, 0x45786966    # 5.758429993E-315

    .line 66
    .line 67
    .line 68
    cmp-long p1, v0, v3

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    iget-object p0, p0, Ll/vpq;->a:Ll/ig60;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/ig60;->N()I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-nez p0, :cond_3

    .line 79
    .line 80
    const/4 p0, 0x1

    .line 81
    return p0

    .line 82
    :cond_3
    return v2
.end method

.method public final varargs g([Lcom/google/android/exoplayer2/metadata/Metadata$Entry;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/vpq;->b:Ll/bsf;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/bsf;

    .line 8
    .line 9
    const/16 v0, 0x400

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    invoke-interface {p0, v0, v1}, Ll/bsf;->b(II)Ll/qfj0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Lcom/google/android/exoplayer2/k$b;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v1, "image/jpeg"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->M(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 28
    .line 29
    invoke-direct {v1, p1}, Lcom/google/android/exoplayer2/metadata/Metadata;-><init>([Lcom/google/android/exoplayer2/metadata/Metadata$Entry;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->Z(Lcom/google/android/exoplayer2/metadata/Metadata;)Lcom/google/android/exoplayer2/k$b;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-interface {p0, p1}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public h(Ll/asf;Ll/ll80;)I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/vpq;->c:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_9

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-eq v0, v2, :cond_8

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    if-eq v0, v3, :cond_7

    .line 11
    .line 12
    const/4 v3, 0x4

    .line 13
    if-eq v0, v3, :cond_5

    .line 14
    .line 15
    const/4 v3, 0x5

    .line 16
    if-eq v0, v3, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x6

    .line 19
    if-ne v0, p0, :cond_0

    .line 20
    .line 21
    const/4 p0, -0x1

    .line 22
    return p0

    .line 23
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 24
    .line 25
    .line 26
    return v1

    .line 27
    :cond_1
    iget-object v0, p0, Ll/vpq;->i:Ll/b3g0;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Ll/vpq;->h:Ll/asf;

    .line 32
    .line 33
    if-eq p1, v0, :cond_3

    .line 34
    .line 35
    :cond_2
    iput-object p1, p0, Ll/vpq;->h:Ll/asf;

    .line 36
    .line 37
    new-instance v0, Ll/b3g0;

    .line 38
    .line 39
    iget-wide v3, p0, Ll/vpq;->f:J

    .line 40
    .line 41
    invoke-direct {v0, p1, v3, v4}, Ll/b3g0;-><init>(Ll/asf;J)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/vpq;->i:Ll/b3g0;

    .line 45
    .line 46
    :cond_3
    iget-object p1, p0, Ll/vpq;->j:Ll/c710;

    .line 47
    .line 48
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Ll/c710;

    .line 53
    .line 54
    iget-object v0, p0, Ll/vpq;->i:Ll/b3g0;

    .line 55
    .line 56
    invoke-virtual {p1, v0, p2}, Ll/c710;->h(Ll/asf;Ll/ll80;)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-ne p1, v2, :cond_4

    .line 61
    .line 62
    iget-wide v0, p2, Ll/ll80;->a:J

    .line 63
    .line 64
    iget-wide v2, p0, Ll/vpq;->f:J

    .line 65
    .line 66
    add-long/2addr v0, v2

    .line 67
    iput-wide v0, p2, Ll/ll80;->a:J

    .line 68
    .line 69
    :cond_4
    return p1

    .line 70
    :cond_5
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 71
    .line 72
    .line 73
    move-result-wide v3

    .line 74
    iget-wide v5, p0, Ll/vpq;->f:J

    .line 75
    .line 76
    cmp-long v0, v3, v5

    .line 77
    .line 78
    if-eqz v0, :cond_6

    .line 79
    .line 80
    iput-wide v5, p2, Ll/ll80;->a:J

    .line 81
    .line 82
    return v2

    .line 83
    :cond_6
    invoke-virtual {p0, p1}, Ll/vpq;->m(Ll/asf;)V

    .line 84
    .line 85
    .line 86
    return v1

    .line 87
    :cond_7
    invoke-virtual {p0, p1}, Ll/vpq;->k(Ll/asf;)V

    .line 88
    .line 89
    .line 90
    return v1

    .line 91
    :cond_8
    invoke-virtual {p0, p1}, Ll/vpq;->l(Ll/asf;)V

    .line 92
    .line 93
    .line 94
    return v1

    .line 95
    :cond_9
    invoke-virtual {p0, p1}, Ll/vpq;->j(Ll/asf;)V

    .line 96
    .line 97
    .line 98
    return v1
.end method

.method public final i(Ll/asf;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vpq;->a:Ll/ig60;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-virtual {v0, v1}, Ll/ig60;->Q(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/vpq;->a:Ll/ig60;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-interface {p1, v0, v2, v1}, Ll/asf;->f([BII)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/vpq;->a:Ll/ig60;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ig60;->N()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public final j(Ll/asf;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vpq;->a:Ll/ig60;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-virtual {v0, v1}, Ll/ig60;->Q(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/vpq;->a:Ll/ig60;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-interface {p1, v0, v2, v1}, Ll/asf;->readFully([BII)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/vpq;->a:Ll/ig60;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/ig60;->N()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iput p1, p0, Ll/vpq;->d:I

    .line 24
    .line 25
    const v0, 0xffda

    .line 26
    .line 27
    .line 28
    if-ne p1, v0, :cond_1

    .line 29
    .line 30
    iget-wide v0, p0, Ll/vpq;->f:J

    .line 31
    .line 32
    const-wide/16 v2, -0x1

    .line 33
    .line 34
    cmp-long p1, v0, v2

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    const/4 p1, 0x4

    .line 39
    iput p1, p0, Ll/vpq;->c:I

    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-virtual {p0}, Ll/vpq;->d()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    const v0, 0xffd0

    .line 47
    .line 48
    .line 49
    if-lt p1, v0, :cond_2

    .line 50
    .line 51
    const v0, 0xffd9

    .line 52
    .line 53
    .line 54
    if-le p1, v0, :cond_3

    .line 55
    .line 56
    :cond_2
    const v0, 0xff01

    .line 57
    .line 58
    .line 59
    if-eq p1, v0, :cond_3

    .line 60
    .line 61
    const/4 p1, 0x1

    .line 62
    iput p1, p0, Ll/vpq;->c:I

    .line 63
    .line 64
    :cond_3
    return-void
.end method

.method public final k(Ll/asf;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/vpq;->d:I

    .line 2
    .line 3
    const v1, 0xffe1

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/ig60;

    .line 10
    .line 11
    iget v1, p0, Ll/vpq;->e:I

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ll/ig60;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget v3, p0, Ll/vpq;->e:I

    .line 21
    .line 22
    invoke-interface {p1, v1, v2, v3}, Ll/asf;->readFully([BII)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/vpq;->g:Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;

    .line 26
    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    const-string v1, "http://ns.adobe.com/xap/1.0/"

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/ig60;->B()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/ig60;->B()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-interface {p1}, Ll/asf;->getLength()J

    .line 48
    .line 49
    .line 50
    move-result-wide v3

    .line 51
    invoke-static {v0, v3, v4}, Ll/vpq;->e(Ljava/lang/String;J)Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Ll/vpq;->g:Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;

    .line 56
    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    iget-wide v0, p1, Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;->videoStartPosition:J

    .line 60
    .line 61
    iput-wide v0, p0, Ll/vpq;->f:J

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    iget v0, p0, Ll/vpq;->e:I

    .line 65
    .line 66
    invoke-interface {p1, v0}, Ll/asf;->o(I)V

    .line 67
    .line 68
    .line 69
    :cond_1
    :goto_0
    iput v2, p0, Ll/vpq;->c:I

    .line 70
    .line 71
    return-void
.end method

.method public final l(Ll/asf;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vpq;->a:Ll/ig60;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-virtual {v0, v1}, Ll/ig60;->Q(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/vpq;->a:Ll/ig60;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-interface {p1, v0, v2, v1}, Ll/asf;->readFully([BII)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/vpq;->a:Ll/ig60;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/ig60;->N()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    sub-int/2addr p1, v1

    .line 24
    iput p1, p0, Ll/vpq;->e:I

    .line 25
    .line 26
    iput v1, p0, Ll/vpq;->c:I

    .line 27
    .line 28
    return-void
.end method

.method public final m(Ll/asf;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vpq;->a:Ll/ig60;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-interface {p1, v0, v1, v2, v2}, Ll/asf;->g([BIIZ)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/vpq;->d()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-interface {p1}, Ll/asf;->h()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/vpq;->j:Ll/c710;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    new-instance v0, Ll/c710;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/c710;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/vpq;->j:Ll/c710;

    .line 32
    .line 33
    :cond_1
    new-instance v0, Ll/b3g0;

    .line 34
    .line 35
    iget-wide v1, p0, Ll/vpq;->f:J

    .line 36
    .line 37
    invoke-direct {v0, p1, v1, v2}, Ll/b3g0;-><init>(Ll/asf;J)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/vpq;->i:Ll/b3g0;

    .line 41
    .line 42
    iget-object p1, p0, Ll/vpq;->j:Ll/c710;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ll/c710;->f(Ll/asf;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    iget-object p1, p0, Ll/vpq;->j:Ll/c710;

    .line 51
    .line 52
    new-instance v0, Ll/c3g0;

    .line 53
    .line 54
    iget-wide v1, p0, Ll/vpq;->f:J

    .line 55
    .line 56
    iget-object v3, p0, Ll/vpq;->b:Ll/bsf;

    .line 57
    .line 58
    invoke-static {v3}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Ll/bsf;

    .line 63
    .line 64
    invoke-direct {v0, v1, v2, v3}, Ll/c3g0;-><init>(JLl/bsf;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ll/c710;->b(Ll/bsf;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/vpq;->n()V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    invoke-virtual {p0}, Ll/vpq;->d()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final n()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vpq;->g:Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/exoplayer2/metadata/Metadata$Entry;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    new-array v1, v1, [Lcom/google/android/exoplayer2/metadata/Metadata$Entry;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    aput-object v0, v1, v2

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Ll/vpq;->g([Lcom/google/android/exoplayer2/metadata/Metadata$Entry;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x5

    .line 19
    iput v0, p0, Ll/vpq;->c:I

    .line 20
    .line 21
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vpq;->j:Ll/c710;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/c710;->release()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
