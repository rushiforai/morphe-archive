.class public final Ll/qrr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# static fields
.field public static final d:Ll/ifr0;


# instance fields
.field public final a:Ll/rrr0;

.field public final b:Ll/bgw0;

.field public c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/prr0;->b:Ll/prr0;

    .line 2
    .line 3
    sput-object v0, Ll/qrr0;->d:Ll/ifr0;

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
    new-instance v0, Ll/rrr0;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ll/rrr0;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/qrr0;->a:Ll/rrr0;

    .line 11
    .line 12
    new-instance v0, Ll/bgw0;

    .line 13
    .line 14
    const/16 v1, 0x4000

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/qrr0;->b:Ll/bgw0;

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
    iput-boolean p1, p0, Ll/qrr0;->c:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/qrr0;->a:Ll/rrr0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/rrr0;->zze()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 14
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
    const/4 v6, 0x3

    .line 31
    if-eq v3, v5, :cond_7

    .line 32
    .line 33
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 34
    .line 35
    .line 36
    move-object v3, p1

    .line 37
    check-cast v3, Ll/fer0;

    .line 38
    .line 39
    invoke-virtual {v3, v2, v1}, Ll/fer0;->j(IZ)Z

    .line 40
    .line 41
    .line 42
    move v0, v1

    .line 43
    move v4, v2

    .line 44
    :goto_1
    invoke-virtual {p0}, Ll/bgw0;->m()[B

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    const/4 v7, 0x7

    .line 49
    invoke-virtual {v3, v5, v1, v7, v1}, Ll/fer0;->c([BIIZ)Z

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v1}, Ll/bgw0;->k(I)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/bgw0;->F()I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    const v8, 0xac40

    .line 60
    .line 61
    .line 62
    const v9, 0xac41

    .line 63
    .line 64
    .line 65
    if-eq v5, v8, :cond_1

    .line 66
    .line 67
    if-eq v5, v9, :cond_1

    .line 68
    .line 69
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 70
    .line 71
    .line 72
    add-int/lit8 v4, v4, 0x1

    .line 73
    .line 74
    sub-int v0, v4, v2

    .line 75
    .line 76
    const/16 v5, 0x2000

    .line 77
    .line 78
    if-ge v0, v5, :cond_0

    .line 79
    .line 80
    invoke-virtual {v3, v4, v1}, Ll/fer0;->j(IZ)Z

    .line 81
    .line 82
    .line 83
    move v0, v1

    .line 84
    goto :goto_1

    .line 85
    :cond_0
    return v1

    .line 86
    :cond_1
    const/4 v8, 0x1

    .line 87
    add-int/2addr v0, v8

    .line 88
    const/4 v10, 0x4

    .line 89
    if-lt v0, v10, :cond_2

    .line 90
    .line 91
    return v8

    .line 92
    :cond_2
    invoke-virtual {p0}, Ll/bgw0;->m()[B

    .line 93
    .line 94
    .line 95
    move-result-object v8

    .line 96
    sget-object v11, Ll/idr0;->a:[I

    .line 97
    .line 98
    array-length v11, v8

    .line 99
    const/4 v12, -0x1

    .line 100
    if-ge v11, v7, :cond_3

    .line 101
    .line 102
    move v11, v12

    .line 103
    goto :goto_3

    .line 104
    :cond_3
    const/4 v11, 0x2

    .line 105
    aget-byte v11, v8, v11

    .line 106
    .line 107
    and-int/lit16 v11, v11, 0xff

    .line 108
    .line 109
    aget-byte v13, v8, v6

    .line 110
    .line 111
    shl-int/lit8 v11, v11, 0x8

    .line 112
    .line 113
    and-int/lit16 v13, v13, 0xff

    .line 114
    .line 115
    or-int/2addr v11, v13

    .line 116
    const v13, 0xffff

    .line 117
    .line 118
    .line 119
    if-ne v11, v13, :cond_4

    .line 120
    .line 121
    aget-byte v10, v8, v10

    .line 122
    .line 123
    and-int/lit16 v10, v10, 0xff

    .line 124
    .line 125
    const/4 v11, 0x5

    .line 126
    aget-byte v11, v8, v11

    .line 127
    .line 128
    and-int/lit16 v11, v11, 0xff

    .line 129
    .line 130
    shl-int/lit8 v10, v10, 0x10

    .line 131
    .line 132
    shl-int/lit8 v11, v11, 0x8

    .line 133
    .line 134
    const/4 v13, 0x6

    .line 135
    aget-byte v8, v8, v13

    .line 136
    .line 137
    and-int/lit16 v8, v8, 0xff

    .line 138
    .line 139
    or-int/2addr v10, v11

    .line 140
    or-int v11, v10, v8

    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_4
    move v7, v10

    .line 144
    :goto_2
    if-ne v5, v9, :cond_5

    .line 145
    .line 146
    add-int/lit8 v7, v7, 0x2

    .line 147
    .line 148
    :cond_5
    add-int/2addr v11, v7

    .line 149
    :goto_3
    if-ne v11, v12, :cond_6

    .line 150
    .line 151
    return v1

    .line 152
    :cond_6
    add-int/lit8 v11, v11, -0x7

    .line 153
    .line 154
    invoke-virtual {v3, v11, v1}, Ll/fer0;->j(IZ)Z

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_7
    invoke-virtual {p0, v6}, Ll/bgw0;->l(I)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Ll/bgw0;->A()I

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    add-int/lit8 v5, v3, 0xa

    .line 166
    .line 167
    add-int/2addr v2, v5

    .line 168
    invoke-virtual {v4, v3, v1}, Ll/fer0;->j(IZ)Z

    .line 169
    .line 170
    .line 171
    goto/16 :goto_0
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
    iget-object p0, p0, Ll/qrr0;->a:Ll/rrr0;

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Ll/rrr0;->d(Ll/ser0;Ll/gur0;)V

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
    iget-object p2, p0, Ll/qrr0;->b:Ll/bgw0;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/bgw0;->m()[B

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const/16 v0, 0x4000

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
    iget-object p2, p0, Ll/qrr0;->b:Ll/bgw0;

    .line 19
    .line 20
    invoke-virtual {p2, v1}, Ll/bgw0;->k(I)V

    .line 21
    .line 22
    .line 23
    iget-object p2, p0, Ll/qrr0;->b:Ll/bgw0;

    .line 24
    .line 25
    invoke-virtual {p2, p1}, Ll/bgw0;->j(I)V

    .line 26
    .line 27
    .line 28
    iget-boolean p1, p0, Ll/qrr0;->c:Z

    .line 29
    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Ll/qrr0;->a:Ll/rrr0;

    .line 33
    .line 34
    const-wide/16 v2, 0x0

    .line 35
    .line 36
    const/4 p2, 0x4

    .line 37
    invoke-virtual {p1, v2, v3, p2}, Ll/rrr0;->c(JI)V

    .line 38
    .line 39
    .line 40
    const/4 p1, 0x1

    .line 41
    iput-boolean p1, p0, Ll/qrr0;->c:Z

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Ll/qrr0;->a:Ll/rrr0;

    .line 44
    .line 45
    iget-object p0, p0, Ll/qrr0;->b:Ll/bgw0;

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Ll/rrr0;->b(Ll/bgw0;)V

    .line 48
    .line 49
    .line 50
    return v1
.end method
