.class public final Ll/gtr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/yrr0;

.field public final b:Ll/nnw0;

.field public final c:Ll/dfw0;

.field public d:Z

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Ll/yrr0;Ll/nnw0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gtr0;->a:Ll/yrr0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/gtr0;->b:Ll/nnw0;

    .line 7
    .line 8
    new-instance p1, Ll/dfw0;

    .line 9
    .line 10
    const/16 p2, 0x40

    .line 11
    .line 12
    new-array v0, p2, [B

    .line 13
    .line 14
    invoke-direct {p1, v0, p2}, Ll/dfw0;-><init>([BI)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/gtr0;->c:Ll/dfw0;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final a(Ll/bgw0;)V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 6
    .line 7
    iget-object v2, v2, Ll/dfw0;->a:[B

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const/4 v4, 0x3

    .line 11
    invoke-virtual {v1, v2, v3, v4}, Ll/bgw0;->g([BII)V

    .line 12
    .line 13
    .line 14
    iget-object v2, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Ll/dfw0;->k(I)V

    .line 17
    .line 18
    .line 19
    iget-object v2, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 20
    .line 21
    const/16 v5, 0x8

    .line 22
    .line 23
    invoke-virtual {v2, v5}, Ll/dfw0;->m(I)V

    .line 24
    .line 25
    .line 26
    iget-object v2, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 27
    .line 28
    invoke-virtual {v2}, Ll/dfw0;->o()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    iput-boolean v2, v0, Ll/gtr0;->d:Z

    .line 33
    .line 34
    iget-object v2, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 35
    .line 36
    invoke-virtual {v2}, Ll/dfw0;->o()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    iput-boolean v2, v0, Ll/gtr0;->e:Z

    .line 41
    .line 42
    iget-object v2, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 43
    .line 44
    const/4 v6, 0x6

    .line 45
    invoke-virtual {v2, v6}, Ll/dfw0;->m(I)V

    .line 46
    .line 47
    .line 48
    iget-object v2, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 49
    .line 50
    invoke-virtual {v2, v5}, Ll/dfw0;->d(I)I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    iget-object v2, v2, Ll/dfw0;->a:[B

    .line 55
    .line 56
    invoke-virtual {v1, v2, v3, v5}, Ll/bgw0;->g([BII)V

    .line 57
    .line 58
    .line 59
    iget-object v2, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Ll/dfw0;->k(I)V

    .line 62
    .line 63
    .line 64
    iget-boolean v2, v0, Ll/gtr0;->d:Z

    .line 65
    .line 66
    const/4 v5, 0x4

    .line 67
    if-eqz v2, :cond_1

    .line 68
    .line 69
    iget-object v2, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 70
    .line 71
    invoke-virtual {v2, v5}, Ll/dfw0;->m(I)V

    .line 72
    .line 73
    .line 74
    iget-object v2, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 75
    .line 76
    invoke-virtual {v2, v4}, Ll/dfw0;->d(I)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    int-to-long v6, v2

    .line 81
    iget-object v2, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 82
    .line 83
    const/4 v8, 0x1

    .line 84
    invoke-virtual {v2, v8}, Ll/dfw0;->m(I)V

    .line 85
    .line 86
    .line 87
    iget-object v2, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 88
    .line 89
    const/16 v9, 0xf

    .line 90
    .line 91
    invoke-virtual {v2, v9}, Ll/dfw0;->d(I)I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    shl-int/2addr v2, v9

    .line 96
    iget-object v10, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 97
    .line 98
    invoke-virtual {v10, v8}, Ll/dfw0;->m(I)V

    .line 99
    .line 100
    .line 101
    iget-object v10, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 102
    .line 103
    invoke-virtual {v10, v9}, Ll/dfw0;->d(I)I

    .line 104
    .line 105
    .line 106
    move-result v10

    .line 107
    int-to-long v10, v10

    .line 108
    iget-object v12, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 109
    .line 110
    invoke-virtual {v12, v8}, Ll/dfw0;->m(I)V

    .line 111
    .line 112
    .line 113
    iget-boolean v12, v0, Ll/gtr0;->f:Z

    .line 114
    .line 115
    const/16 v13, 0x1e

    .line 116
    .line 117
    if-nez v12, :cond_0

    .line 118
    .line 119
    iget-boolean v12, v0, Ll/gtr0;->e:Z

    .line 120
    .line 121
    if-eqz v12, :cond_0

    .line 122
    .line 123
    iget-object v12, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 124
    .line 125
    invoke-virtual {v12, v5}, Ll/dfw0;->m(I)V

    .line 126
    .line 127
    .line 128
    iget-object v12, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 129
    .line 130
    invoke-virtual {v12, v4}, Ll/dfw0;->d(I)I

    .line 131
    .line 132
    .line 133
    move-result v4

    .line 134
    int-to-long v14, v4

    .line 135
    shl-long/2addr v14, v13

    .line 136
    iget-object v4, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 137
    .line 138
    invoke-virtual {v4, v8}, Ll/dfw0;->m(I)V

    .line 139
    .line 140
    .line 141
    iget-object v4, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 142
    .line 143
    invoke-virtual {v4, v9}, Ll/dfw0;->d(I)I

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    shl-int/2addr v4, v9

    .line 148
    iget-object v12, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 149
    .line 150
    invoke-virtual {v12, v8}, Ll/dfw0;->m(I)V

    .line 151
    .line 152
    .line 153
    iget-object v12, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 154
    .line 155
    invoke-virtual {v12, v9}, Ll/dfw0;->d(I)I

    .line 156
    .line 157
    .line 158
    move-result v9

    .line 159
    move v12, v13

    .line 160
    move-wide/from16 v16, v14

    .line 161
    .line 162
    int-to-long v13, v9

    .line 163
    iget-object v9, v0, Ll/gtr0;->c:Ll/dfw0;

    .line 164
    .line 165
    invoke-virtual {v9, v8}, Ll/dfw0;->m(I)V

    .line 166
    .line 167
    .line 168
    iget-object v9, v0, Ll/gtr0;->b:Ll/nnw0;

    .line 169
    .line 170
    move v15, v12

    .line 171
    move-wide/from16 v18, v13

    .line 172
    .line 173
    int-to-long v12, v4

    .line 174
    or-long v12, v16, v12

    .line 175
    .line 176
    or-long v12, v12, v18

    .line 177
    .line 178
    invoke-virtual {v9, v12, v13}, Ll/nnw0;->b(J)J

    .line 179
    .line 180
    .line 181
    iput-boolean v8, v0, Ll/gtr0;->f:Z

    .line 182
    .line 183
    goto :goto_0

    .line 184
    :cond_0
    move v15, v13

    .line 185
    :goto_0
    shl-long/2addr v6, v15

    .line 186
    int-to-long v8, v2

    .line 187
    or-long/2addr v6, v8

    .line 188
    or-long/2addr v6, v10

    .line 189
    iget-object v2, v0, Ll/gtr0;->b:Ll/nnw0;

    .line 190
    .line 191
    invoke-virtual {v2, v6, v7}, Ll/nnw0;->b(J)J

    .line 192
    .line 193
    .line 194
    move-result-wide v6

    .line 195
    goto :goto_1

    .line 196
    :cond_1
    const-wide/16 v6, 0x0

    .line 197
    .line 198
    :goto_1
    iget-object v2, v0, Ll/gtr0;->a:Ll/yrr0;

    .line 199
    .line 200
    invoke-interface {v2, v6, v7, v5}, Ll/yrr0;->c(JI)V

    .line 201
    .line 202
    .line 203
    iget-object v2, v0, Ll/gtr0;->a:Ll/yrr0;

    .line 204
    .line 205
    invoke-interface {v2, v1}, Ll/yrr0;->b(Ll/bgw0;)V

    .line 206
    .line 207
    .line 208
    iget-object v0, v0, Ll/gtr0;->a:Ll/yrr0;

    .line 209
    .line 210
    invoke-interface {v0, v3}, Ll/yrr0;->a(Z)V

    .line 211
    .line 212
    .line 213
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/gtr0;->f:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/gtr0;->a:Ll/yrr0;

    .line 5
    .line 6
    invoke-interface {p0}, Ll/yrr0;->zze()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
