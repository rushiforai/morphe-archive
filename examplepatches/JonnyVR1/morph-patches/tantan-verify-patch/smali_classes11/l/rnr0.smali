.class public final Ll/rnr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# static fields
.field public static final d:Ll/ifr0;


# instance fields
.field public a:Ll/ser0;

.field public b:Ll/lor0;

.field public c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/qnr0;->b:Ll/qnr0;

    .line 2
    .line 3
    sput-object v0, Ll/rnr0;->d:Ll/ifr0;

    .line 4
    .line 5
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


# virtual methods
.method public final a(Ll/qer0;)Z
    .locals 8
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
    new-instance v0, Ll/tnr0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/tnr0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, p1, v1}, Ll/tnr0;->b(Ll/qer0;Z)Z

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
    iget v2, v0, Ll/tnr0;->a:I

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
    iget v0, v0, Ll/tnr0;->e:I

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
    new-instance v2, Ll/bgw0;

    .line 30
    .line 31
    invoke-direct {v2, v0}, Ll/bgw0;-><init>(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    check-cast p1, Ll/fer0;

    .line 39
    .line 40
    invoke-virtual {p1, v4, v3, v0, v3}, Ll/fer0;->c([BIIZ)Z

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ll/bgw0;->k(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ll/bgw0;->q()I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    const/4 v0, 0x5

    .line 51
    if-lt p1, v0, :cond_1

    .line 52
    .line 53
    invoke-virtual {v2}, Ll/bgw0;->B()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    const/16 v0, 0x7f

    .line 58
    .line 59
    if-ne p1, v0, :cond_1

    .line 60
    .line 61
    invoke-virtual {v2}, Ll/bgw0;->J()J

    .line 62
    .line 63
    .line 64
    move-result-wide v4

    .line 65
    const-wide/32 v6, 0x464c4143

    .line 66
    .line 67
    .line 68
    cmp-long p1, v4, v6

    .line 69
    .line 70
    if-nez p1, :cond_1

    .line 71
    .line 72
    new-instance p1, Ll/pnr0;

    .line 73
    .line 74
    invoke-direct {p1}, Ll/pnr0;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object p1, p0, Ll/rnr0;->b:Ll/lor0;

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    invoke-virtual {v2, v3}, Ll/bgw0;->k(I)V

    .line 81
    .line 82
    .line 83
    :try_start_0
    invoke-static {v1, v2, v1}, Ll/ygr0;->d(ILl/bgw0;Z)Z

    .line 84
    .line 85
    .line 86
    move-result p1
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzcc; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    if-eqz p1, :cond_2

    .line 88
    .line 89
    new-instance p1, Ll/nor0;

    .line 90
    .line 91
    invoke-direct {p1}, Ll/nor0;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object p1, p0, Ll/rnr0;->b:Ll/lor0;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :catch_0
    :cond_2
    invoke-virtual {v2, v3}, Ll/bgw0;->k(I)V

    .line 98
    .line 99
    .line 100
    invoke-static {v2}, Ll/hor0;->j(Ll/bgw0;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_3

    .line 105
    .line 106
    new-instance p1, Ll/hor0;

    .line 107
    .line 108
    invoke-direct {p1}, Ll/hor0;-><init>()V

    .line 109
    .line 110
    .line 111
    iput-object p1, p0, Ll/rnr0;->b:Ll/lor0;

    .line 112
    .line 113
    :goto_0
    return v1

    .line 114
    :cond_3
    :goto_1
    return v3
.end method

.method public final c(JJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rnr0;->b:Ll/lor0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/lor0;->i(JJ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Ll/rnr0;->a(Ll/qer0;)Z

    .line 2
    .line 3
    .line 4
    move-result p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzcc; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return p0

    .line 6
    :catch_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public final e(Ll/ser0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rnr0;->a:Ll/ser0;

    .line 2
    .line 3
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rnr0;->a:Ll/ser0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/rnr0;->b:Ll/lor0;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/rnr0;->a(Ll/qer0;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ll/qer0;->zzj()V

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
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    throw p0

    .line 28
    :cond_1
    :goto_0
    iget-boolean v0, p0, Ll/rnr0;->c:Z

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Ll/rnr0;->a:Ll/ser0;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-interface {v0, v1, v2}, Ll/ser0;->i(II)Ll/sgr0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p0, Ll/rnr0;->a:Ll/ser0;

    .line 41
    .line 42
    invoke-interface {v1}, Ll/ser0;->c()V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/rnr0;->b:Ll/lor0;

    .line 46
    .line 47
    iget-object v3, p0, Ll/rnr0;->a:Ll/ser0;

    .line 48
    .line 49
    invoke-virtual {v1, v3, v0}, Ll/lor0;->g(Ll/ser0;Ll/sgr0;)V

    .line 50
    .line 51
    .line 52
    iput-boolean v2, p0, Ll/rnr0;->c:Z

    .line 53
    .line 54
    :cond_2
    iget-object p0, p0, Ll/rnr0;->b:Ll/lor0;

    .line 55
    .line 56
    invoke-virtual {p0, p1, p2}, Ll/lor0;->d(Ll/qer0;Ll/yfr0;)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0
.end method
