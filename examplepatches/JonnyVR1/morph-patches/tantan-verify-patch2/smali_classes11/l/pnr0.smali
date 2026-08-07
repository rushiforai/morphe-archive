.class public final Ll/pnr0;
.super Ll/lor0;
.source "SourceFile"


# instance fields
.field public n:Ll/ofr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public o:Ll/onr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lor0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static j([B)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-byte p0, p0, v0

    .line 3
    .line 4
    const/4 v1, -0x1

    .line 5
    if-ne p0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    return v0
.end method


# virtual methods
.method public final a(Ll/bgw0;)J
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/pnr0;->j([B)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_2

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x2

    .line 16
    aget-byte p0, p0, v0

    .line 17
    .line 18
    and-int/lit16 p0, p0, 0xff

    .line 19
    .line 20
    const/4 v0, 0x4

    .line 21
    shr-int/2addr p0, v0

    .line 22
    const/4 v1, 0x6

    .line 23
    if-eq p0, v1, :cond_0

    .line 24
    .line 25
    const/4 v1, 0x7

    .line 26
    if-ne p0, v1, :cond_1

    .line 27
    .line 28
    move p0, v1

    .line 29
    :cond_0
    invoke-virtual {p1, v0}, Ll/bgw0;->l(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ll/bgw0;->L()J

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-static {p1, p0}, Ll/kfr0;->a(Ll/bgw0;I)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p1, v0}, Ll/bgw0;->k(I)V

    .line 41
    .line 42
    .line 43
    int-to-long p0, p0

    .line 44
    return-wide p0

    .line 45
    :cond_2
    const-wide/16 p0, -0x1

    .line 46
    .line 47
    return-wide p0
.end method

.method public final b(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/lor0;->b(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Ll/pnr0;->n:Ll/ofr0;

    .line 8
    .line 9
    iput-object p1, p0, Ll/pnr0;->o:Ll/onr0;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final c(Ll/bgw0;JLl/ior0;)Z
    .locals 6
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNullIf;
        expression = {
            "#3.format"
        }
        result = false
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/pnr0;->n:Ll/ofr0;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    new-instance p2, Ll/ofr0;

    .line 11
    .line 12
    const/16 p3, 0x11

    .line 13
    .line 14
    invoke-direct {p2, v0, p3}, Ll/ofr0;-><init>([BI)V

    .line 15
    .line 16
    .line 17
    iput-object p2, p0, Ll/pnr0;->n:Ll/ofr0;

    .line 18
    .line 19
    const/16 p0, 0x9

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-static {v0, p0, p1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-virtual {p2, p0, p1}, Ll/ofr0;->c([BLcom/google/android/gms/internal/ads/zzby;)Ll/sqr0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iput-object p0, p4, Ll/ior0;->a:Ll/sqr0;

    .line 35
    .line 36
    return v2

    .line 37
    :cond_0
    const/4 v3, 0x0

    .line 38
    aget-byte v4, v0, v3

    .line 39
    .line 40
    and-int/lit8 v4, v4, 0x7f

    .line 41
    .line 42
    const/4 v5, 0x3

    .line 43
    if-ne v4, v5, :cond_1

    .line 44
    .line 45
    invoke-static {p1}, Ll/lfr0;->b(Ll/bgw0;)Ll/nfr0;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {v1, p1}, Ll/ofr0;->f(Ll/nfr0;)Ll/ofr0;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    iput-object p2, p0, Ll/pnr0;->n:Ll/ofr0;

    .line 54
    .line 55
    new-instance p3, Ll/onr0;

    .line 56
    .line 57
    invoke-direct {p3, p2, p1}, Ll/onr0;-><init>(Ll/ofr0;Ll/nfr0;)V

    .line 58
    .line 59
    .line 60
    iput-object p3, p0, Ll/pnr0;->o:Ll/onr0;

    .line 61
    .line 62
    return v2

    .line 63
    :cond_1
    invoke-static {v0}, Ll/pnr0;->j([B)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_3

    .line 68
    .line 69
    iget-object p1, p0, Ll/pnr0;->o:Ll/onr0;

    .line 70
    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    invoke-virtual {p1, p2, p3}, Ll/onr0;->c(J)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Ll/pnr0;->o:Ll/onr0;

    .line 77
    .line 78
    iput-object p0, p4, Ll/ior0;->b:Ll/unr0;

    .line 79
    .line 80
    :cond_2
    iget-object p0, p4, Ll/ior0;->a:Ll/sqr0;

    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    return v3

    .line 86
    :cond_3
    return v2
.end method
