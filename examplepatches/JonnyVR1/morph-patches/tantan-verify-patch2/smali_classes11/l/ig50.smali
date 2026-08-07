.class public Ll/ig50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zrf;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final d:Ll/esf;


# instance fields
.field public a:Ll/bsf;

.field public b:Ll/v7g0;

.field public c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/hg50;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hg50;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ig50;->d:Ll/esf;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c()[Ll/zrf;
    .locals 3

    .line 1
    new-instance v0, Ll/ig50;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ig50;-><init>()V

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

.method public static d(Ll/ig60;)Ll/ig60;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 3
    .line 4
    .line 5
    return-object p0
.end method


# virtual methods
.method public a(JJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ig50;->b:Ll/v7g0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/v7g0;->m(JJ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b(Ll/bsf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ig50;->a:Ll/bsf;

    .line 2
    .line 3
    return-void
.end method

.method public final e(Ll/asf;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNullIf;
        expression = {
            "streamReader"
        }
        result = true
    .end annotation

    .line 1
    new-instance v0, Ll/lg50;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/lg50;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, p1, v1}, Ll/lg50;->a(Ll/asf;Z)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    if-eqz v2, :cond_3

    .line 13
    .line 14
    iget v2, v0, Ll/lg50;->b:I

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    and-int/2addr v2, v4

    .line 18
    if-eq v2, v4, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    iget v0, v0, Ll/lg50;->i:I

    .line 22
    .line 23
    const/16 v2, 0x8

    .line 24
    .line 25
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    new-instance v2, Ll/ig60;

    .line 30
    .line 31
    invoke-direct {v2, v0}, Ll/ig60;-><init>(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ll/ig60;->e()[B

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-interface {p1, v4, v3, v0}, Ll/asf;->f([BII)V

    .line 39
    .line 40
    .line 41
    invoke-static {v2}, Ll/ig50;->d(Ll/ig60;)Ll/ig60;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p1}, Ll/vri;->p(Ll/ig60;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    new-instance p1, Ll/vri;

    .line 52
    .line 53
    invoke-direct {p1}, Ll/vri;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Ll/ig50;->b:Ll/v7g0;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-static {v2}, Ll/ig50;->d(Ll/ig60;)Ll/ig60;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {p1}, Ll/bnp0;->r(Ll/ig60;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    new-instance p1, Ll/bnp0;

    .line 70
    .line 71
    invoke-direct {p1}, Ll/bnp0;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object p1, p0, Ll/ig50;->b:Ll/v7g0;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    invoke-static {v2}, Ll/ig50;->d(Ll/ig60;)Ll/ig60;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p1}, Ll/v560;->o(Ll/ig60;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_3

    .line 86
    .line 87
    new-instance p1, Ll/v560;

    .line 88
    .line 89
    invoke-direct {p1}, Ll/v560;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object p1, p0, Ll/ig50;->b:Ll/v7g0;

    .line 93
    .line 94
    :goto_0
    return v1

    .line 95
    :cond_3
    :goto_1
    return v3
.end method

.method public f(Ll/asf;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Ll/ig50;->e(Ll/asf;)Z

    .line 2
    .line 3
    .line 4
    move-result p0
    :try_end_0
    .catch Lcom/google/android/exoplayer2/ParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return p0

    .line 6
    :catch_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public h(Ll/asf;Ll/ll80;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ig50;->a:Ll/bsf;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ig50;->b:Ll/v7g0;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/ig50;->e(Ll/asf;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ll/asf;->h()V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p0, "Failed to determine bitstream type"

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    throw p0

    .line 28
    :cond_1
    :goto_0
    iget-boolean v0, p0, Ll/ig50;->c:Z

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Ll/ig50;->a:Ll/bsf;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-interface {v0, v1, v2}, Ll/bsf;->b(II)Ll/qfj0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p0, Ll/ig50;->a:Ll/bsf;

    .line 41
    .line 42
    invoke-interface {v1}, Ll/bsf;->l()V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/ig50;->b:Ll/v7g0;

    .line 46
    .line 47
    iget-object v3, p0, Ll/ig50;->a:Ll/bsf;

    .line 48
    .line 49
    invoke-virtual {v1, v3, v0}, Ll/v7g0;->d(Ll/bsf;Ll/qfj0;)V

    .line 50
    .line 51
    .line 52
    iput-boolean v2, p0, Ll/ig50;->c:Z

    .line 53
    .line 54
    :cond_2
    iget-object p0, p0, Ll/ig50;->b:Ll/v7g0;

    .line 55
    .line 56
    invoke-virtual {p0, p1, p2}, Ll/v7g0;->g(Ll/asf;Ll/ll80;)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method
