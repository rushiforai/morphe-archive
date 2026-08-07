.class public final Ll/mfr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bgr0;


# instance fields
.field public final a:Ll/ofr0;

.field public final b:J


# direct methods
.method public constructor <init>(Ll/ofr0;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mfr0;->a:Ll/ofr0;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/mfr0;->b:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(J)Ll/zfr0;
    .locals 9

    .line 1
    iget-object v0, p0, Ll/mfr0;->a:Ll/ofr0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ofr0;->k:Ll/nfr0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/mfr0;->a:Ll/ofr0;

    .line 9
    .line 10
    iget-object v1, v0, Ll/ofr0;->k:Ll/nfr0;

    .line 11
    .line 12
    iget-object v2, v1, Ll/nfr0;->a:[J

    .line 13
    .line 14
    iget-object v1, v1, Ll/nfr0;->b:[J

    .line 15
    .line 16
    invoke-virtual {v0, p1, p2}, Ll/ofr0;->b(J)J

    .line 17
    .line 18
    .line 19
    move-result-wide v3

    .line 20
    const/4 v0, 0x0

    .line 21
    const/4 v5, 0x1

    .line 22
    invoke-static {v2, v3, v4, v5, v0}, Ll/mpw0;->r([JJZZ)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const-wide/16 v3, 0x0

    .line 27
    .line 28
    const/4 v6, -0x1

    .line 29
    if-ne v0, v6, :cond_0

    .line 30
    .line 31
    move-wide v7, v3

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    aget-wide v7, v2, v0

    .line 34
    .line 35
    :goto_0
    if-ne v0, v6, :cond_1

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    aget-wide v3, v1, v0

    .line 39
    .line 40
    :goto_1
    invoke-virtual {p0, v7, v8, v3, v4}, Ll/mfr0;->c(JJ)Ll/cgr0;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iget-wide v7, v3, Ll/cgr0;->a:J

    .line 45
    .line 46
    cmp-long p1, v7, p1

    .line 47
    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    array-length p1, v2

    .line 51
    add-int/2addr p1, v6

    .line 52
    if-ne v0, p1, :cond_2

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_2
    add-int/2addr v0, v5

    .line 56
    aget-wide p1, v2, v0

    .line 57
    .line 58
    aget-wide v0, v1, v0

    .line 59
    .line 60
    invoke-virtual {p0, p1, p2, v0, v1}, Ll/mfr0;->c(JJ)Ll/cgr0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance p1, Ll/zfr0;

    .line 65
    .line 66
    invoke-direct {p1, v3, p0}, Ll/zfr0;-><init>(Ll/cgr0;Ll/cgr0;)V

    .line 67
    .line 68
    .line 69
    return-object p1

    .line 70
    :cond_3
    :goto_2
    new-instance p0, Ll/zfr0;

    .line 71
    .line 72
    invoke-direct {p0, v3, v3}, Ll/zfr0;-><init>(Ll/cgr0;Ll/cgr0;)V

    .line 73
    .line 74
    .line 75
    return-object p0
.end method

.method public final c(JJ)Ll/cgr0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mfr0;->a:Ll/ofr0;

    .line 2
    .line 3
    iget v0, v0, Ll/ofr0;->e:I

    .line 4
    .line 5
    const-wide/32 v1, 0xf4240

    .line 6
    .line 7
    .line 8
    mul-long/2addr p1, v1

    .line 9
    int-to-long v0, v0

    .line 10
    div-long/2addr p1, v0

    .line 11
    new-instance v0, Ll/cgr0;

    .line 12
    .line 13
    iget-wide v1, p0, Ll/mfr0;->b:J

    .line 14
    .line 15
    add-long/2addr v1, p3

    .line 16
    invoke-direct {v0, p1, p2, v1, v2}, Ll/cgr0;-><init>(JJ)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public final zza()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/mfr0;->a:Ll/ofr0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ofr0;->a()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final zzh()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
