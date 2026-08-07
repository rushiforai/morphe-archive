.class public final Ll/lpp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zrf;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/lpp0$b;,
        Ll/lpp0$a;,
        Ll/lpp0$c;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final h:Ll/esf;


# instance fields
.field public a:Ll/bsf;

.field public b:Ll/qfj0;

.field public c:I

.field public d:J

.field public e:Ll/lpp0$b;

.field public f:I

.field public g:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/kpp0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/kpp0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/lpp0;->h:Ll/esf;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/lpp0;->c:I

    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    iput-wide v0, p0, Ll/lpp0;->d:J

    .line 10
    .line 11
    const/4 v2, -0x1

    .line 12
    iput v2, p0, Ll/lpp0;->f:I

    .line 13
    .line 14
    iput-wide v0, p0, Ll/lpp0;->g:J

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic c()[Ll/zrf;
    .locals 3

    .line 1
    new-instance v0, Ll/lpp0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/lpp0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    new-array v1, v1, [Ll/zrf;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aput-object v0, v1, v2

    .line 11
    .line 12
    return-object v1
.end method

.method private d()V
    .locals 1
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNull;
        value = {
            "extractorOutput",
            "trackOutput"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/lpp0;->b:Ll/qfj0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/lpp0;->a:Ll/bsf;

    .line 7
    .line 8
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(JJ)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p1, p1, v0

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p1, 0x4

    .line 10
    :goto_0
    iput p1, p0, Ll/lpp0;->c:I

    .line 11
    .line 12
    iget-object p0, p0, Ll/lpp0;->e:Ll/lpp0$b;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-interface {p0, p3, p4}, Ll/lpp0$b;->c(J)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public b(Ll/bsf;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/lpp0;->a:Ll/bsf;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-interface {p1, v0, v1}, Ll/bsf;->b(II)Ll/qfj0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/lpp0;->b:Ll/qfj0;

    .line 10
    .line 11
    invoke-interface {p1}, Ll/bsf;->l()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final e(Ll/asf;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    move v0, v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Ll/lpp0;->f:I

    .line 19
    .line 20
    const/4 v2, -0x1

    .line 21
    if-eq v0, v2, :cond_1

    .line 22
    .line 23
    invoke-interface {p1, v0}, Ll/asf;->o(I)V

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x4

    .line 27
    iput p1, p0, Ll/lpp0;->c:I

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-static {p1}, Ll/npp0;->a(Ll/asf;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    invoke-interface {p1}, Ll/asf;->k()J

    .line 37
    .line 38
    .line 39
    move-result-wide v2

    .line 40
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 41
    .line 42
    .line 43
    move-result-wide v4

    .line 44
    sub-long/2addr v2, v4

    .line 45
    long-to-int v0, v2

    .line 46
    invoke-interface {p1, v0}, Ll/asf;->o(I)V

    .line 47
    .line 48
    .line 49
    iput v1, p0, Ll/lpp0;->c:I

    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    const-string p0, "Unsupported or unrecognized wav file type."

    .line 53
    .line 54
    const/4 p1, 0x0

    .line 55
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    throw p0
.end method

.method public f(Ll/asf;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/npp0;->a(Ll/asf;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final g(Ll/asf;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "extractorOutput",
            "trackOutput"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/npp0;->b(Ll/asf;)Ll/mpp0;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    iget p1, v3, Ll/mpp0;->a:I

    .line 6
    .line 7
    const/16 v0, 0x11

    .line 8
    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    new-instance p1, Ll/lpp0$a;

    .line 12
    .line 13
    iget-object v0, p0, Ll/lpp0;->a:Ll/bsf;

    .line 14
    .line 15
    iget-object v1, p0, Ll/lpp0;->b:Ll/qfj0;

    .line 16
    .line 17
    invoke-direct {p1, v0, v1, v3}, Ll/lpp0$a;-><init>(Ll/bsf;Ll/qfj0;Ll/mpp0;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/lpp0;->e:Ll/lpp0$b;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x6

    .line 24
    if-ne p1, v0, :cond_1

    .line 25
    .line 26
    new-instance v0, Ll/lpp0$c;

    .line 27
    .line 28
    iget-object v1, p0, Ll/lpp0;->a:Ll/bsf;

    .line 29
    .line 30
    iget-object v2, p0, Ll/lpp0;->b:Ll/qfj0;

    .line 31
    .line 32
    const-string v4, "audio/g711-alaw"

    .line 33
    .line 34
    const/4 v5, -0x1

    .line 35
    invoke-direct/range {v0 .. v5}, Ll/lpp0$c;-><init>(Ll/bsf;Ll/qfj0;Ll/mpp0;Ljava/lang/String;I)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ll/lpp0;->e:Ll/lpp0$b;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v0, 0x7

    .line 42
    if-ne p1, v0, :cond_2

    .line 43
    .line 44
    new-instance v0, Ll/lpp0$c;

    .line 45
    .line 46
    iget-object v1, p0, Ll/lpp0;->a:Ll/bsf;

    .line 47
    .line 48
    iget-object v2, p0, Ll/lpp0;->b:Ll/qfj0;

    .line 49
    .line 50
    const-string v4, "audio/g711-mlaw"

    .line 51
    .line 52
    const/4 v5, -0x1

    .line 53
    invoke-direct/range {v0 .. v5}, Ll/lpp0$c;-><init>(Ll/bsf;Ll/qfj0;Ll/mpp0;Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ll/lpp0;->e:Ll/lpp0$b;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    iget v0, v3, Ll/mpp0;->f:I

    .line 60
    .line 61
    invoke-static {p1, v0}, Ll/ppp0;->a(II)I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    if-eqz v5, :cond_3

    .line 66
    .line 67
    new-instance v0, Ll/lpp0$c;

    .line 68
    .line 69
    iget-object v1, p0, Ll/lpp0;->a:Ll/bsf;

    .line 70
    .line 71
    iget-object v2, p0, Ll/lpp0;->b:Ll/qfj0;

    .line 72
    .line 73
    const-string v4, "audio/raw"

    .line 74
    .line 75
    invoke-direct/range {v0 .. v5}, Ll/lpp0$c;-><init>(Ll/bsf;Ll/qfj0;Ll/mpp0;Ljava/lang/String;I)V

    .line 76
    .line 77
    .line 78
    iput-object v0, p0, Ll/lpp0;->e:Ll/lpp0$b;

    .line 79
    .line 80
    :goto_0
    const/4 p1, 0x3

    .line 81
    iput p1, p0, Ll/lpp0;->c:I

    .line 82
    .line 83
    return-void

    .line 84
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string p1, "Unsupported WAV format type: "

    .line 87
    .line 88
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget p1, v3, Ll/mpp0;->a:I

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {p0}, Lcom/google/android/exoplayer2/ParserException;->createForUnsupportedContainerFeature(Ljava/lang/String;)Lcom/google/android/exoplayer2/ParserException;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    throw p0
.end method

.method public h(Ll/asf;Ll/ll80;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/lpp0;->d()V

    .line 2
    .line 3
    .line 4
    iget p2, p0, Ll/lpp0;->c:I

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-eqz p2, :cond_4

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-eq p2, v1, :cond_3

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    if-eq p2, v1, :cond_2

    .line 14
    .line 15
    const/4 v1, 0x3

    .line 16
    if-eq p2, v1, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-ne p2, v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/lpp0;->j(Ll/asf;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return p0

    .line 31
    :cond_1
    invoke-virtual {p0, p1}, Ll/lpp0;->k(Ll/asf;)V

    .line 32
    .line 33
    .line 34
    return v0

    .line 35
    :cond_2
    invoke-virtual {p0, p1}, Ll/lpp0;->g(Ll/asf;)V

    .line 36
    .line 37
    .line 38
    return v0

    .line 39
    :cond_3
    invoke-virtual {p0, p1}, Ll/lpp0;->i(Ll/asf;)V

    .line 40
    .line 41
    .line 42
    return v0

    .line 43
    :cond_4
    invoke-virtual {p0, p1}, Ll/lpp0;->e(Ll/asf;)V

    .line 44
    .line 45
    .line 46
    return v0
.end method

.method public final i(Ll/asf;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/npp0;->c(Ll/asf;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/lpp0;->d:J

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    iput p1, p0, Ll/lpp0;->c:I

    .line 9
    .line 10
    return-void
.end method

.method public final j(Ll/asf;)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Ll/lpp0;->g:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v0, v1

    .line 13
    :goto_0
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 14
    .line 15
    .line 16
    iget-wide v2, p0, Ll/lpp0;->g:J

    .line 17
    .line 18
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 19
    .line 20
    .line 21
    move-result-wide v4

    .line 22
    sub-long/2addr v2, v4

    .line 23
    iget-object p0, p0, Ll/lpp0;->e:Ll/lpp0$b;

    .line 24
    .line 25
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ll/lpp0$b;

    .line 30
    .line 31
    invoke-interface {p0, p1, v2, v3}, Ll/lpp0$b;->a(Ll/asf;J)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    const/4 p0, -0x1

    .line 38
    return p0

    .line 39
    :cond_1
    return v1
.end method

.method public final k(Ll/asf;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/npp0;->e(Ll/asf;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Long;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iput v1, p0, Ll/lpp0;->f:I

    .line 14
    .line 15
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Ljava/lang/Long;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iget-wide v2, p0, Ll/lpp0;->d:J

    .line 24
    .line 25
    const-wide/16 v4, -0x1

    .line 26
    .line 27
    cmp-long v6, v2, v4

    .line 28
    .line 29
    if-eqz v6, :cond_0

    .line 30
    .line 31
    const-wide v6, 0xffffffffL

    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    cmp-long v6, v0, v6

    .line 37
    .line 38
    if-nez v6, :cond_0

    .line 39
    .line 40
    move-wide v0, v2

    .line 41
    :cond_0
    iget v2, p0, Ll/lpp0;->f:I

    .line 42
    .line 43
    int-to-long v2, v2

    .line 44
    add-long/2addr v2, v0

    .line 45
    iput-wide v2, p0, Ll/lpp0;->g:J

    .line 46
    .line 47
    invoke-interface {p1}, Ll/asf;->getLength()J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    cmp-long p1, v0, v4

    .line 52
    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    iget-wide v2, p0, Ll/lpp0;->g:J

    .line 56
    .line 57
    cmp-long p1, v2, v0

    .line 58
    .line 59
    if-lez p1, :cond_1

    .line 60
    .line 61
    new-instance p1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    const-string v2, "Data exceeds input length: "

    .line 64
    .line 65
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-wide v2, p0, Ll/lpp0;->g:J

    .line 69
    .line 70
    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v2, ", "

    .line 74
    .line 75
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    const-string v2, "WavExtractor"

    .line 86
    .line 87
    invoke-static {v2, p1}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iput-wide v0, p0, Ll/lpp0;->g:J

    .line 91
    .line 92
    :cond_1
    iget-object p1, p0, Ll/lpp0;->e:Ll/lpp0$b;

    .line 93
    .line 94
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Ll/lpp0$b;

    .line 99
    .line 100
    iget v0, p0, Ll/lpp0;->f:I

    .line 101
    .line 102
    iget-wide v1, p0, Ll/lpp0;->g:J

    .line 103
    .line 104
    invoke-interface {p1, v0, v1, v2}, Ll/lpp0$b;->b(IJ)V

    .line 105
    .line 106
    .line 107
    const/4 p1, 0x4

    .line 108
    iput p1, p0, Ll/lpp0;->c:I

    .line 109
    .line 110
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method
