.class public final Ll/nrr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# static fields
.field public static final d:Ll/ifr0;


# instance fields
.field public final a:Ll/orr0;

.field public final b:Ll/bgw0;

.field public c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/mrr0;->b:Ll/mrr0;

    .line 2
    .line 3
    sput-object v0, Ll/nrr0;->d:Ll/ifr0;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/orr0;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ll/orr0;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/nrr0;->a:Ll/orr0;

    .line 11
    .line 12
    new-instance v0, Ll/bgw0;

    .line 13
    .line 14
    const/16 v1, 0xae2

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/nrr0;->b:Ll/bgw0;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final c(JJ)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/nrr0;->c:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/nrr0;->a:Ll/orr0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/orr0;->zze()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Ll/bgw0;

    .line 2
    .line 3
    const/16 v0, 0xa

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ll/bgw0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    move v2, v1

    .line 10
    :goto_0
    invoke-virtual {p0}, Ll/bgw0;->m()[B

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    move-object v4, p1

    .line 15
    check-cast v4, Ll/fer0;

    .line 16
    .line 17
    invoke-virtual {v4, v3, v1, v0, v1}, Ll/fer0;->c([BIIZ)Z

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v1}, Ll/bgw0;->k(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/bgw0;->D()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    const v5, 0x494433

    .line 28
    .line 29
    .line 30
    if-eq v3, v5, :cond_4

    .line 31
    .line 32
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 33
    .line 34
    .line 35
    move-object v3, p1

    .line 36
    check-cast v3, Ll/fer0;

    .line 37
    .line 38
    invoke-virtual {v3, v2, v1}, Ll/fer0;->j(IZ)Z

    .line 39
    .line 40
    .line 41
    move v0, v1

    .line 42
    move v4, v2

    .line 43
    :goto_1
    invoke-virtual {p0}, Ll/bgw0;->m()[B

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    const/4 v6, 0x6

    .line 48
    invoke-virtual {v3, v5, v1, v6, v1}, Ll/fer0;->c([BIIZ)Z

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v1}, Ll/bgw0;->k(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/bgw0;->F()I

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    const/16 v6, 0xb77

    .line 59
    .line 60
    if-eq v5, v6, :cond_1

    .line 61
    .line 62
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 63
    .line 64
    .line 65
    add-int/lit8 v4, v4, 0x1

    .line 66
    .line 67
    sub-int v0, v4, v2

    .line 68
    .line 69
    const/16 v5, 0x2000

    .line 70
    .line 71
    if-ge v0, v5, :cond_0

    .line 72
    .line 73
    invoke-virtual {v3, v4, v1}, Ll/fer0;->j(IZ)Z

    .line 74
    .line 75
    .line 76
    move v0, v1

    .line 77
    goto :goto_1

    .line 78
    :cond_0
    return v1

    .line 79
    :cond_1
    const/4 v5, 0x1

    .line 80
    add-int/2addr v0, v5

    .line 81
    const/4 v6, 0x4

    .line 82
    if-lt v0, v6, :cond_2

    .line 83
    .line 84
    return v5

    .line 85
    :cond_2
    invoke-virtual {p0}, Ll/bgw0;->m()[B

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    invoke-static {v5}, Ll/fdr0;->b([B)I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    const/4 v6, -0x1

    .line 94
    if-ne v5, v6, :cond_3

    .line 95
    .line 96
    return v1

    .line 97
    :cond_3
    add-int/lit8 v5, v5, -0x6

    .line 98
    .line 99
    invoke-virtual {v3, v5, v1}, Ll/fer0;->j(IZ)Z

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_4
    const/4 v3, 0x3

    .line 104
    invoke-virtual {p0, v3}, Ll/bgw0;->l(I)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ll/bgw0;->A()I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    add-int/lit8 v5, v3, 0xa

    .line 112
    .line 113
    add-int/2addr v2, v5

    .line 114
    invoke-virtual {v4, v3, v1}, Ll/fer0;->j(IZ)Z

    .line 115
    .line 116
    .line 117
    goto :goto_0
.end method

.method public final e(Ll/ser0;)V
    .locals 4

    .line 1
    new-instance v0, Ll/gur0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    const/high16 v3, -0x80000000

    .line 6
    .line 7
    invoke-direct {v0, v3, v1, v2}, Ll/gur0;-><init>(III)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/nrr0;->a:Ll/orr0;

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Ll/orr0;->d(Ll/ser0;Ll/gur0;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p1}, Ll/ser0;->c()V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/agr0;

    .line 19
    .line 20
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 21
    .line 22
    .line 23
    .line 24
    .line 25
    const-wide/16 v2, 0x0

    .line 26
    .line 27
    invoke-direct {p0, v0, v1, v2, v3}, Ll/agr0;-><init>(JJ)V

    .line 28
    .line 29
    .line 30
    invoke-interface {p1, p0}, Ll/ser0;->j(Ll/bgr0;)V

    .line 31
    .line 32
    .line 33
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
    iget-object p2, p0, Ll/nrr0;->b:Ll/bgw0;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/bgw0;->m()[B

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const/16 v0, 0xae2

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-interface {p1, p2, v1, v0}, Ll/qer0;->a([BII)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 p2, -0x1

    .line 15
    if-ne p1, p2, :cond_0

    .line 16
    .line 17
    return p2

    .line 18
    :cond_0
    iget-object p2, p0, Ll/nrr0;->b:Ll/bgw0;

    .line 19
    .line 20
    invoke-virtual {p2, v1}, Ll/bgw0;->k(I)V

    .line 21
    .line 22
    .line 23
    iget-object p2, p0, Ll/nrr0;->b:Ll/bgw0;

    .line 24
    .line 25
    invoke-virtual {p2, p1}, Ll/bgw0;->j(I)V

    .line 26
    .line 27
    .line 28
    iget-boolean p1, p0, Ll/nrr0;->c:Z

    .line 29
    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Ll/nrr0;->a:Ll/orr0;

    .line 33
    .line 34
    const-wide/16 v2, 0x0

    .line 35
    .line 36
    const/4 p2, 0x4

    .line 37
    invoke-virtual {p1, v2, v3, p2}, Ll/orr0;->c(JI)V

    .line 38
    .line 39
    .line 40
    const/4 p1, 0x1

    .line 41
    iput-boolean p1, p0, Ll/nrr0;->c:Z

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Ll/nrr0;->a:Ll/orr0;

    .line 44
    .line 45
    iget-object p0, p0, Ll/nrr0;->b:Ll/bgw0;

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Ll/orr0;->b(Ll/bgw0;)V

    .line 48
    .line 49
    .line 50
    return v1
.end method
