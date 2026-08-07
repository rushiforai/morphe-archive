.class public final Ll/nqr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xor0;


# instance fields
.field public final a:Ll/bgw0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bgw0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/bgw0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/nqr0;->a:Ll/bgw0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a([BIILl/wor0;Ll/hkv0;)V
    .locals 9

    .line 1
    add-int/2addr p3, p2

    .line 2
    iget-object p4, p0, Ll/nqr0;->a:Ll/bgw0;

    .line 3
    .line 4
    invoke-virtual {p4, p1, p3}, Ll/bgw0;->i([BI)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/nqr0;->a:Ll/bgw0;

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Ll/bgw0;->k(I)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    :goto_0
    iget-object p1, p0, Ll/nqr0;->a:Ll/bgw0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-lez p2, :cond_8

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    const/4 p2, 0x0

    .line 30
    const/4 p3, 0x1

    .line 31
    const/16 p4, 0x8

    .line 32
    .line 33
    if-lt p1, p4, :cond_0

    .line 34
    .line 35
    move p1, p3

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    move p1, p2

    .line 38
    :goto_1
    const-string v0, "Incomplete Mp4Webvtt Top Level box header found."

    .line 39
    .line 40
    invoke-static {p1, v0}, Ll/lev0;->e(ZLjava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/nqr0;->a:Ll/bgw0;

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/bgw0;->v()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/lit8 v0, v0, -0x8

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/bgw0;->v()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iget-object v2, p0, Ll/nqr0;->a:Ll/bgw0;

    .line 56
    .line 57
    const v3, 0x76747463

    .line 58
    .line 59
    .line 60
    if-ne p1, v3, :cond_7

    .line 61
    .line 62
    const/4 p1, 0x0

    .line 63
    move-object v3, p1

    .line 64
    move-object v4, v3

    .line 65
    :goto_2
    if-lez v0, :cond_4

    .line 66
    .line 67
    if-lt v0, p4, :cond_1

    .line 68
    .line 69
    move v5, p3

    .line 70
    goto :goto_3

    .line 71
    :cond_1
    move v5, p2

    .line 72
    :goto_3
    const-string v6, "Incomplete vtt cue box header found."

    .line 73
    .line 74
    invoke-static {v5, v6}, Ll/lev0;->e(ZLjava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2}, Ll/bgw0;->v()I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    invoke-virtual {v2}, Ll/bgw0;->v()I

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    add-int/lit8 v0, v0, -0x8

    .line 86
    .line 87
    add-int/lit8 v5, v5, -0x8

    .line 88
    .line 89
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 90
    .line 91
    .line 92
    move-result-object v7

    .line 93
    invoke-virtual {v2}, Ll/bgw0;->s()I

    .line 94
    .line 95
    .line 96
    move-result v8

    .line 97
    invoke-static {v7, v8, v5}, Ll/mpw0;->a([BII)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v7

    .line 101
    invoke-virtual {v2, v5}, Ll/bgw0;->l(I)V

    .line 102
    .line 103
    .line 104
    const v8, 0x73747467

    .line 105
    .line 106
    .line 107
    if-ne v6, v8, :cond_2

    .line 108
    .line 109
    invoke-static {v7}, Ll/hrr0;->b(Ljava/lang/String;)Ll/j2v0;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    goto :goto_4

    .line 114
    :cond_2
    const v8, 0x7061796c

    .line 115
    .line 116
    .line 117
    if-ne v6, v8, :cond_3

    .line 118
    .line 119
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    sget-object v6, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 124
    .line 125
    invoke-static {p1, v3, v6}, Ll/hrr0;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Landroid/text/SpannedString;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    :cond_3
    :goto_4
    sub-int/2addr v0, v5

    .line 130
    goto :goto_2

    .line 131
    :cond_4
    if-nez v3, :cond_5

    .line 132
    .line 133
    const-string v3, ""

    .line 134
    .line 135
    :cond_5
    if-eqz v4, :cond_6

    .line 136
    .line 137
    invoke-virtual {v4, v3}, Ll/j2v0;->l(Ljava/lang/CharSequence;)Ll/j2v0;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v4}, Ll/j2v0;->p()Ll/u4v0;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    goto :goto_5

    .line 145
    :cond_6
    new-instance p1, Ll/grr0;

    .line 146
    .line 147
    invoke-direct {p1}, Ll/grr0;-><init>()V

    .line 148
    .line 149
    .line 150
    iput-object v3, p1, Ll/grr0;->c:Ljava/lang/CharSequence;

    .line 151
    .line 152
    invoke-virtual {p1}, Ll/grr0;->a()Ll/j2v0;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p1}, Ll/j2v0;->p()Ll/u4v0;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    :goto_5
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_7
    invoke-virtual {v2, v0}, Ll/bgw0;->l(I)V

    .line 166
    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :cond_8
    new-instance v0, Ll/qor0;

    .line 171
    .line 172
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    move-wide v4, v2

    .line 178
    invoke-direct/range {v0 .. v5}, Ll/qor0;-><init>(Ljava/util/List;JJ)V

    .line 179
    .line 180
    .line 181
    invoke-interface {p5, v0}, Ll/hkv0;->zza(Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    return-void
.end method
