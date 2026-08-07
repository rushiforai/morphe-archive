.class public final Ll/vlr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/vfr0;

.field public final b:J

.field public final c:J

.field public final d:I

.field public final e:I

.field public final f:[J
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/vfr0;JJ[JII)V
    .locals 0
    .param p6    # [J
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vlr0;->a:Ll/vfr0;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/vlr0;->b:J

    .line 7
    .line 8
    iput-wide p4, p0, Ll/vlr0;->c:J

    .line 9
    .line 10
    iput-object p6, p0, Ll/vlr0;->f:[J

    .line 11
    .line 12
    iput p7, p0, Ll/vlr0;->d:I

    .line 13
    .line 14
    iput p8, p0, Ll/vlr0;->e:I

    .line 15
    .line 16
    return-void
.end method

.method public static a(Ll/vfr0;Ll/bgw0;)Ll/vlr0;
    .locals 14

    .line 1
    invoke-virtual {p1}, Ll/bgw0;->v()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/lit8 v1, v0, 0x1

    .line 6
    .line 7
    const/4 v2, -0x1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/bgw0;->E()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v1, v2

    .line 16
    :goto_0
    and-int/lit8 v3, v0, 0x2

    .line 17
    .line 18
    if-eqz v3, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/bgw0;->J()J

    .line 21
    .line 22
    .line 23
    move-result-wide v3

    .line 24
    :goto_1
    move-wide v9, v3

    .line 25
    goto :goto_2

    .line 26
    :cond_1
    const-wide/16 v3, -0x1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :goto_2
    and-int/lit8 v3, v0, 0x4

    .line 30
    .line 31
    const/4 v4, 0x4

    .line 32
    if-ne v3, v4, :cond_3

    .line 33
    .line 34
    const/16 v3, 0x64

    .line 35
    .line 36
    new-array v5, v3, [J

    .line 37
    .line 38
    const/4 v6, 0x0

    .line 39
    :goto_3
    if-ge v6, v3, :cond_2

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/bgw0;->B()I

    .line 42
    .line 43
    .line 44
    move-result v7

    .line 45
    int-to-long v7, v7

    .line 46
    aput-wide v7, v5, v6

    .line 47
    .line 48
    add-int/lit8 v6, v6, 0x1

    .line 49
    .line 50
    goto :goto_3

    .line 51
    :cond_2
    :goto_4
    move-object v11, v5

    .line 52
    goto :goto_5

    .line 53
    :cond_3
    const/4 v5, 0x0

    .line 54
    goto :goto_4

    .line 55
    :goto_5
    and-int/lit8 v0, v0, 0x8

    .line 56
    .line 57
    if-eqz v0, :cond_4

    .line 58
    .line 59
    invoke-virtual {p1, v4}, Ll/bgw0;->l(I)V

    .line 60
    .line 61
    .line 62
    :cond_4
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    const/16 v3, 0x18

    .line 67
    .line 68
    if-lt v0, v3, :cond_5

    .line 69
    .line 70
    const/16 v0, 0x15

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Ll/bgw0;->l(I)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Ll/bgw0;->D()I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    shr-int/lit8 v2, p1, 0xc

    .line 80
    .line 81
    and-int/lit16 p1, p1, 0xfff

    .line 82
    .line 83
    move v13, p1

    .line 84
    move v12, v2

    .line 85
    goto :goto_6

    .line 86
    :cond_5
    move v12, v2

    .line 87
    move v13, v12

    .line 88
    :goto_6
    int-to-long v7, v1

    .line 89
    new-instance v5, Ll/vlr0;

    .line 90
    .line 91
    move-object v6, p0

    .line 92
    invoke-direct/range {v5 .. v13}, Ll/vlr0;-><init>(Ll/vfr0;JJ[JII)V

    .line 93
    .line 94
    .line 95
    return-object v5
.end method
