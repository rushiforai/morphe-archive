.class public final Ll/trr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# static fields
.field public static final j:Ll/ifr0;


# instance fields
.field public final a:Ll/urr0;

.field public final b:Ll/bgw0;

.field public final c:Ll/bgw0;

.field public final d:Ll/dfw0;

.field public e:Ll/ser0;

.field public f:J

.field public g:J

.field public h:Z

.field public i:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/srr0;->b:Ll/srr0;

    .line 2
    .line 3
    sput-object v0, Ll/trr0;->j:Ll/ifr0;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 48
    invoke-direct {p0, v0}, Ll/trr0;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/urr0;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {p1, v0, v1}, Ll/urr0;-><init>(ZLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/trr0;->a:Ll/urr0;

    .line 12
    .line 13
    new-instance p1, Ll/bgw0;

    .line 14
    .line 15
    const/16 v0, 0x800

    .line 16
    .line 17
    invoke-direct {p1, v0}, Ll/bgw0;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/trr0;->b:Ll/bgw0;

    .line 21
    .line 22
    const-wide/16 v0, -0x1

    .line 23
    .line 24
    iput-wide v0, p0, Ll/trr0;->g:J

    .line 25
    .line 26
    new-instance p1, Ll/bgw0;

    .line 27
    .line 28
    const/16 v0, 0xa

    .line 29
    .line 30
    invoke-direct {p1, v0}, Ll/bgw0;-><init>(I)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Ll/trr0;->c:Ll/bgw0;

    .line 34
    .line 35
    new-instance v0, Ll/dfw0;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    array-length v1, p1

    .line 42
    invoke-direct {v0, p1, v1}, Ll/dfw0;-><init>([BI)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Ll/trr0;->d:Ll/dfw0;

    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public final c(JJ)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/trr0;->h:Z

    .line 3
    .line 4
    iget-object p1, p0, Ll/trr0;->a:Ll/urr0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/urr0;->zze()V

    .line 7
    .line 8
    .line 9
    iput-wide p3, p0, Ll/trr0;->f:J

    .line 10
    .line 11
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/trr0;->c:Ll/bgw0;

    .line 4
    .line 5
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    move-object v3, p1

    .line 10
    check-cast v3, Ll/fer0;

    .line 11
    .line 12
    const/16 v4, 0xa

    .line 13
    .line 14
    invoke-virtual {v3, v2, v0, v4, v0}, Ll/fer0;->c([BIIZ)Z

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Ll/trr0;->c:Ll/bgw0;

    .line 18
    .line 19
    invoke-virtual {v2, v0}, Ll/bgw0;->k(I)V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Ll/trr0;->c:Ll/bgw0;

    .line 23
    .line 24
    invoke-virtual {v2}, Ll/bgw0;->D()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const v4, 0x494433

    .line 29
    .line 30
    .line 31
    if-eq v2, v4, :cond_6

    .line 32
    .line 33
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 34
    .line 35
    .line 36
    move-object v2, p1

    .line 37
    check-cast v2, Ll/fer0;

    .line 38
    .line 39
    invoke-virtual {v2, v1, v0}, Ll/fer0;->j(IZ)Z

    .line 40
    .line 41
    .line 42
    iget-wide v3, p0, Ll/trr0;->g:J

    .line 43
    .line 44
    const-wide/16 v5, -0x1

    .line 45
    .line 46
    cmp-long v3, v3, v5

    .line 47
    .line 48
    if-nez v3, :cond_0

    .line 49
    .line 50
    int-to-long v3, v1

    .line 51
    iput-wide v3, p0, Ll/trr0;->g:J

    .line 52
    .line 53
    :cond_0
    move v3, v0

    .line 54
    move v5, v3

    .line 55
    move v4, v1

    .line 56
    :cond_1
    iget-object v6, p0, Ll/trr0;->c:Ll/bgw0;

    .line 57
    .line 58
    invoke-virtual {v6}, Ll/bgw0;->m()[B

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    const/4 v7, 0x2

    .line 63
    invoke-virtual {v2, v6, v0, v7, v0}, Ll/fer0;->c([BIIZ)Z

    .line 64
    .line 65
    .line 66
    iget-object v6, p0, Ll/trr0;->c:Ll/bgw0;

    .line 67
    .line 68
    invoke-virtual {v6, v0}, Ll/bgw0;->k(I)V

    .line 69
    .line 70
    .line 71
    iget-object v6, p0, Ll/trr0;->c:Ll/bgw0;

    .line 72
    .line 73
    invoke-virtual {v6}, Ll/bgw0;->F()I

    .line 74
    .line 75
    .line 76
    move-result v6

    .line 77
    invoke-static {v6}, Ll/urr0;->e(I)Z

    .line 78
    .line 79
    .line 80
    move-result v6

    .line 81
    if-nez v6, :cond_2

    .line 82
    .line 83
    add-int/lit8 v4, v4, 0x1

    .line 84
    .line 85
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v2, v4, v0}, Ll/fer0;->j(IZ)Z

    .line 89
    .line 90
    .line 91
    :goto_1
    move v3, v0

    .line 92
    move v5, v3

    .line 93
    goto :goto_3

    .line 94
    :cond_2
    const/4 v6, 0x1

    .line 95
    add-int/2addr v3, v6

    .line 96
    const/4 v7, 0x4

    .line 97
    if-lt v3, v7, :cond_4

    .line 98
    .line 99
    const/16 v8, 0xbc

    .line 100
    .line 101
    if-gt v5, v8, :cond_3

    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_3
    return v6

    .line 105
    :cond_4
    :goto_2
    iget-object v6, p0, Ll/trr0;->c:Ll/bgw0;

    .line 106
    .line 107
    invoke-virtual {v6}, Ll/bgw0;->m()[B

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    invoke-virtual {v2, v6, v0, v7, v0}, Ll/fer0;->c([BIIZ)Z

    .line 112
    .line 113
    .line 114
    iget-object v6, p0, Ll/trr0;->d:Ll/dfw0;

    .line 115
    .line 116
    const/16 v7, 0xe

    .line 117
    .line 118
    invoke-virtual {v6, v7}, Ll/dfw0;->k(I)V

    .line 119
    .line 120
    .line 121
    iget-object v6, p0, Ll/trr0;->d:Ll/dfw0;

    .line 122
    .line 123
    const/16 v7, 0xd

    .line 124
    .line 125
    invoke-virtual {v6, v7}, Ll/dfw0;->d(I)I

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    const/4 v7, 0x6

    .line 130
    if-gt v6, v7, :cond_5

    .line 131
    .line 132
    add-int/lit8 v4, v4, 0x1

    .line 133
    .line 134
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v2, v4, v0}, Ll/fer0;->j(IZ)Z

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_5
    add-int/lit8 v7, v6, -0x6

    .line 142
    .line 143
    invoke-virtual {v2, v7, v0}, Ll/fer0;->j(IZ)Z

    .line 144
    .line 145
    .line 146
    add-int/2addr v5, v6

    .line 147
    :goto_3
    sub-int v6, v4, v1

    .line 148
    .line 149
    const/16 v7, 0x2000

    .line 150
    .line 151
    if-lt v6, v7, :cond_1

    .line 152
    .line 153
    return v0

    .line 154
    :cond_6
    iget-object v2, p0, Ll/trr0;->c:Ll/bgw0;

    .line 155
    .line 156
    const/4 v4, 0x3

    .line 157
    invoke-virtual {v2, v4}, Ll/bgw0;->l(I)V

    .line 158
    .line 159
    .line 160
    iget-object v2, p0, Ll/trr0;->c:Ll/bgw0;

    .line 161
    .line 162
    invoke-virtual {v2}, Ll/bgw0;->A()I

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    add-int/lit8 v4, v2, 0xa

    .line 167
    .line 168
    add-int/2addr v1, v4

    .line 169
    invoke-virtual {v3, v2, v0}, Ll/fer0;->j(IZ)Z

    .line 170
    .line 171
    .line 172
    goto/16 :goto_0
.end method

.method public final e(Ll/ser0;)V
    .locals 4

    .line 1
    iput-object p1, p0, Ll/trr0;->e:Ll/ser0;

    .line 2
    .line 3
    new-instance v0, Ll/gur0;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    const/high16 v3, -0x80000000

    .line 8
    .line 9
    invoke-direct {v0, v3, v1, v2}, Ll/gur0;-><init>(III)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/trr0;->a:Ll/urr0;

    .line 13
    .line 14
    invoke-virtual {p0, p1, v0}, Ll/urr0;->d(Ll/ser0;Ll/gur0;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1}, Ll/ser0;->c()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p2, p0, Ll/trr0;->e:Ll/ser0;

    .line 2
    .line 3
    invoke-static {p2}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Ll/trr0;->b:Ll/bgw0;

    .line 7
    .line 8
    invoke-virtual {p2}, Ll/bgw0;->m()[B

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    const/16 v0, 0x800

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-interface {p1, p2, v1, v0}, Ll/qer0;->a([BII)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget-boolean p2, p0, Ll/trr0;->i:Z

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    if-nez p2, :cond_0

    .line 23
    .line 24
    iget-object p2, p0, Ll/trr0;->e:Ll/ser0;

    .line 25
    .line 26
    new-instance v2, Ll/agr0;

    .line 27
    .line 28
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    const-wide/16 v5, 0x0

    .line 34
    .line 35
    invoke-direct {v2, v3, v4, v5, v6}, Ll/agr0;-><init>(JJ)V

    .line 36
    .line 37
    .line 38
    invoke-interface {p2, v2}, Ll/ser0;->j(Ll/bgr0;)V

    .line 39
    .line 40
    .line 41
    iput-boolean v0, p0, Ll/trr0;->i:Z

    .line 42
    .line 43
    :cond_0
    const/4 p2, -0x1

    .line 44
    if-ne p1, p2, :cond_1

    .line 45
    .line 46
    return p2

    .line 47
    :cond_1
    iget-object p2, p0, Ll/trr0;->b:Ll/bgw0;

    .line 48
    .line 49
    invoke-virtual {p2, v1}, Ll/bgw0;->k(I)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, Ll/trr0;->b:Ll/bgw0;

    .line 53
    .line 54
    invoke-virtual {p2, p1}, Ll/bgw0;->j(I)V

    .line 55
    .line 56
    .line 57
    iget-boolean p1, p0, Ll/trr0;->h:Z

    .line 58
    .line 59
    if-nez p1, :cond_2

    .line 60
    .line 61
    iget-object p1, p0, Ll/trr0;->a:Ll/urr0;

    .line 62
    .line 63
    iget-wide v2, p0, Ll/trr0;->f:J

    .line 64
    .line 65
    const/4 p2, 0x4

    .line 66
    invoke-virtual {p1, v2, v3, p2}, Ll/urr0;->c(JI)V

    .line 67
    .line 68
    .line 69
    iput-boolean v0, p0, Ll/trr0;->h:Z

    .line 70
    .line 71
    :cond_2
    iget-object p1, p0, Ll/trr0;->a:Ll/urr0;

    .line 72
    .line 73
    iget-object p0, p0, Ll/trr0;->b:Ll/bgw0;

    .line 74
    .line 75
    invoke-virtual {p1, p0}, Ll/urr0;->b(Ll/bgw0;)V

    .line 76
    .line 77
    .line 78
    return v1
.end method
