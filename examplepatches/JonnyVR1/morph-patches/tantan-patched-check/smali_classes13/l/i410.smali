.class public Ll/i410;
.super Ll/j410;
.source "SourceFile"

# interfaces
.implements Ll/wzl;


# instance fields
.field private A:J

.field private B:J

.field private C:J

.field private D:J

.field private volatile E:J

.field private F:Ljava/lang/String;

.field private G:J

.field private H:J

.field private I:J

.field private J:J

.field protected u:Ljava/lang/String;

.field private v:J

.field private w:J

.field private x:J

.field private y:J

.field private z:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/j410;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "v2.pushLiveAidStop"

    .line 5
    .line 6
    iput-object p1, p0, Ll/i410;->u:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, ""

    .line 9
    .line 10
    iput-object v0, p0, Ll/i410;->F:Ljava/lang/String;

    .line 11
    .line 12
    const-wide/16 v0, 0x0

    .line 13
    .line 14
    iput-wide v0, p0, Ll/i410;->G:J

    .line 15
    .line 16
    iput-wide v0, p0, Ll/i410;->H:J

    .line 17
    .line 18
    iput-wide v0, p0, Ll/i410;->I:J

    .line 19
    .line 20
    iput-wide v0, p0, Ll/i410;->J:J

    .line 21
    .line 22
    const-string v0, "v2.pushLiveAidWatch"

    .line 23
    .line 24
    iput-object v0, p0, Ll/j410;->a:Ljava/lang/String;

    .line 25
    .line 26
    const-string v0, "v2.pullWatch"

    .line 27
    .line 28
    iput-object v0, p0, Ll/j410;->b:Ljava/lang/String;

    .line 29
    .line 30
    const-string v0, "v2.pushLiveAidStart"

    .line 31
    .line 32
    iput-object v0, p0, Ll/j410;->c:Ljava/lang/String;

    .line 33
    .line 34
    iput-object p1, p0, Ll/j410;->d:Ljava/lang/String;

    .line 35
    .line 36
    const-string p1, "v2.pushBitrateChange"

    .line 37
    .line 38
    iput-object p1, p0, Ll/j410;->e:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    iput-wide v0, p0, Ll/i410;->D:J

    .line 45
    .line 46
    invoke-static {}, Ll/fvx;->p()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Ll/i410;->F:Ljava/lang/String;

    .line 51
    .line 52
    return-void
.end method

.method private p(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    instance-of v0, p1, Ll/wyl;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast p1, Ll/wyl;

    .line 9
    .line 10
    const/16 v0, 0x1013

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-interface {p1, v0, p0, v1}, Ll/wyl;->j1(IILjava/lang/Object;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    const-wide/16 v2, 0x100

    .line 18
    .line 19
    cmp-long p1, v0, v2

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    :cond_0
    return p0
.end method


# virtual methods
.method public G1(Ll/wyl;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/j410;->G1(Ll/wyl;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/i410;->v:J

    .line 7
    .line 8
    iput-wide v0, p0, Ll/i410;->w:J

    .line 9
    .line 10
    iput-wide v0, p0, Ll/i410;->x:J

    .line 11
    .line 12
    iput-wide v0, p0, Ll/i410;->y:J

    .line 13
    .line 14
    iput-wide v0, p0, Ll/i410;->z:J

    .line 15
    .line 16
    iput-wide v0, p0, Ll/i410;->A:J

    .line 17
    .line 18
    iput-wide v0, p0, Ll/i410;->B:J

    .line 19
    .line 20
    iput-wide v0, p0, Ll/i410;->C:J

    .line 21
    .line 22
    iput-wide v0, p0, Ll/i410;->E:J

    .line 23
    .line 24
    iput-wide v0, p0, Ll/i410;->G:J

    .line 25
    .line 26
    iput-wide v0, p0, Ll/i410;->H:J

    .line 27
    .line 28
    iput-wide v0, p0, Ll/i410;->I:J

    .line 29
    .line 30
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    iput-wide v0, p0, Ll/i410;->D:J

    .line 35
    .line 36
    return-void
.end method

.method public a(IILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/j410;->a(IILjava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g(Ljava/lang/Object;I)J
    .locals 2

    .line 1
    const/16 p1, 0x64

    .line 2
    .line 3
    if-eq p2, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-wide p0, p0, Ll/i410;->E:J

    .line 7
    .line 8
    const-wide/16 v0, 0x2

    .line 9
    .line 10
    cmp-long p0, p0, v0

    .line 11
    .line 12
    if-ltz p0, :cond_1

    .line 13
    .line 14
    const-wide/16 p0, 0x1

    .line 15
    .line 16
    return-wide p0

    .line 17
    :cond_1
    :goto_0
    const-wide/16 p0, 0x0

    .line 18
    .line 19
    return-wide p0
.end method

.method public i(Ljava/lang/Object;)Ljava/lang/String;
    .locals 6

    .line 1
    iget v0, p0, Ll/j410;->k:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/j410;->l:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    instance-of p0, p1, Ll/wyl;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    check-cast p1, Ll/wyl;

    .line 28
    .line 29
    invoke-interface {p1}, Ll/wyl;->J0()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    long-to-int p0, v0

    .line 34
    invoke-interface {p1}, Ll/wyl;->X0()J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    long-to-int v0, v0

    .line 39
    invoke-interface {p1}, Ll/wyl;->u1()J

    .line 40
    .line 41
    .line 42
    move-result-wide v1

    .line 43
    long-to-int v1, v1

    .line 44
    invoke-interface {p1}, Ll/wyl;->D0()J

    .line 45
    .line 46
    .line 47
    move-result-wide v2

    .line 48
    long-to-int p1, v2

    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    new-instance v4, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v5, "{"

    .line 56
    .line 57
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v2, ","

    .line 64
    .line 65
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string p0, "}"

    .line 90
    .line 91
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0

    .line 99
    :cond_0
    const-string p0, ""

    .line 100
    .line 101
    return-object p0
.end method

.method public j(Ljava/lang/Object;I)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/j410;->l:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    instance-of p0, p1, Ll/wyl;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    check-cast p1, Ll/wyl;

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    invoke-interface {p1, p2, p0, v1}, Ll/wyl;->g1(IILjava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 32
    .line 33
    .line 34
    move-result-wide p1

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v1, "{"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string p1, ","

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p0, "}"

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string p1, "pushSomethingExt "

    .line 67
    .line 68
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string p1, "zhengjijian"

    .line 79
    .line 80
    invoke-static {p1, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    return-object v1
.end method

.method public l(Ljava/lang/Object;)Ljava/lang/String;
    .locals 9

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v2, "watchaid"

    .line 16
    .line 17
    invoke-static {v2, v0}, Ll/t9c;->f(Ljava/lang/String;Ljava/lang/Object;)I

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/u6y;->T()V

    .line 25
    .line 26
    .line 27
    if-eqz p1, :cond_e

    .line 28
    .line 29
    instance-of v0, p1, Ll/wyl;

    .line 30
    .line 31
    if-eqz v0, :cond_e

    .line 32
    .line 33
    new-instance v0, Ll/lmb0;

    .line 34
    .line 35
    invoke-direct {v0}, Ll/lmb0;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Ll/j410;->l:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-eqz v3, :cond_0

    .line 45
    .line 46
    move-object v3, p1

    .line 47
    check-cast v3, Ll/wyl;

    .line 48
    .line 49
    invoke-interface {v3}, Ll/wyl;->D1()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-nez v4, :cond_0

    .line 58
    .line 59
    invoke-interface {v3}, Ll/wyl;->D1()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    :cond_0
    const/4 v3, 0x1

    .line 64
    const-string v4, "video/hevc"

    .line 65
    .line 66
    invoke-static {v3, v4}, Ll/y0f;->a(ZLjava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    sget v4, Ll/lmb0;->c:I

    .line 71
    .line 72
    new-instance v5, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 78
    .line 79
    .line 80
    move-result-wide v6

    .line 81
    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    invoke-virtual {v0, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 92
    .line 93
    .line 94
    sget v4, Ll/lmb0;->d:I

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    if-eqz v5, :cond_1

    .line 101
    .line 102
    move-object v5, p1

    .line 103
    check-cast v5, Ll/wyl;

    .line 104
    .line 105
    invoke-interface {v5}, Ll/wyl;->getServerIpAddr()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    goto :goto_0

    .line 110
    :cond_1
    const-string v5, "0.0.0.0"

    .line 111
    .line 112
    :goto_0
    invoke-virtual {v0, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 113
    .line 114
    .line 115
    sget v4, Ll/lmb0;->e:I

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    const-string v6, " "

    .line 122
    .line 123
    if-eqz v5, :cond_2

    .line 124
    .line 125
    new-instance v5, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    move-object v7, p1

    .line 131
    check-cast v7, Ll/wyl;

    .line 132
    .line 133
    invoke-interface {v7}, Ll/wyl;->V0()J

    .line 134
    .line 135
    .line 136
    move-result-wide v7

    .line 137
    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    goto :goto_1

    .line 148
    :cond_2
    move-object v5, v6

    .line 149
    :goto_1
    invoke-virtual {v0, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 150
    .line 151
    .line 152
    sget v4, Ll/lmb0;->f:I

    .line 153
    .line 154
    invoke-virtual {p0, p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v5

    .line 158
    if-eqz v5, :cond_3

    .line 159
    .line 160
    new-instance v5, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 163
    .line 164
    .line 165
    move-object v7, p1

    .line 166
    check-cast v7, Ll/wyl;

    .line 167
    .line 168
    invoke-interface {v7}, Ll/wyl;->r0()J

    .line 169
    .line 170
    .line 171
    move-result-wide v7

    .line 172
    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v5

    .line 182
    goto :goto_2

    .line 183
    :cond_3
    move-object v5, v6

    .line 184
    :goto_2
    invoke-virtual {v0, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 185
    .line 186
    .line 187
    sget v4, Ll/lmb0;->g:I

    .line 188
    .line 189
    invoke-virtual {p0, p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result v5

    .line 193
    if-eqz v5, :cond_4

    .line 194
    .line 195
    new-instance v5, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    .line 199
    .line 200
    move-object v7, p1

    .line 201
    check-cast v7, Ll/wyl;

    .line 202
    .line 203
    invoke-interface {v7}, Ll/wyl;->l1()J

    .line 204
    .line 205
    .line 206
    move-result-wide v7

    .line 207
    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v5

    .line 217
    goto :goto_3

    .line 218
    :cond_4
    move-object v5, v6

    .line 219
    :goto_3
    invoke-virtual {v0, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 220
    .line 221
    .line 222
    sget v4, Ll/lmb0;->h:I

    .line 223
    .line 224
    invoke-virtual {p0, p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v5

    .line 228
    if-eqz v5, :cond_5

    .line 229
    .line 230
    new-instance v5, Ljava/lang/StringBuilder;

    .line 231
    .line 232
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 233
    .line 234
    .line 235
    move-object v7, p1

    .line 236
    check-cast v7, Ll/wyl;

    .line 237
    .line 238
    invoke-interface {v7}, Ll/wyl;->u0()J

    .line 239
    .line 240
    .line 241
    move-result-wide v7

    .line 242
    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v5

    .line 252
    goto :goto_4

    .line 253
    :cond_5
    move-object v5, v6

    .line 254
    :goto_4
    invoke-virtual {v0, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 255
    .line 256
    .line 257
    sget v4, Ll/lmb0;->i:I

    .line 258
    .line 259
    iget-object v5, p0, Ll/j410;->s:Ll/drl;

    .line 260
    .line 261
    invoke-virtual {p0, v5}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result v5

    .line 265
    if-eqz v5, :cond_6

    .line 266
    .line 267
    new-instance v5, Ljava/lang/StringBuilder;

    .line 268
    .line 269
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 270
    .line 271
    .line 272
    iget-object v7, p0, Ll/j410;->s:Ll/drl;

    .line 273
    .line 274
    invoke-interface {v7}, Ll/drl;->d()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v7

    .line 278
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v5

    .line 288
    goto :goto_5

    .line 289
    :cond_6
    move-object v5, v6

    .line 290
    :goto_5
    invoke-virtual {v0, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 291
    .line 292
    .line 293
    sget v4, Ll/lmb0;->j:I

    .line 294
    .line 295
    const-string v5, "0"

    .line 296
    .line 297
    invoke-virtual {v0, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 298
    .line 299
    .line 300
    sget v4, Ll/lmb0;->k:I

    .line 301
    .line 302
    invoke-virtual {v0, v4, v2}, Ll/v310;->a(ILjava/lang/String;)V

    .line 303
    .line 304
    .line 305
    sget v2, Ll/lmb0;->l:I

    .line 306
    .line 307
    iget-object v4, p0, Ll/j410;->s:Ll/drl;

    .line 308
    .line 309
    invoke-virtual {p0, v4}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    move-result v4

    .line 313
    if-eqz v4, :cond_7

    .line 314
    .line 315
    new-instance v4, Ljava/lang/StringBuilder;

    .line 316
    .line 317
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 318
    .line 319
    .line 320
    iget-object v7, p0, Ll/j410;->s:Ll/drl;

    .line 321
    .line 322
    invoke-interface {v7}, Ll/drl;->getPushType()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v7

    .line 326
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v4

    .line 336
    goto :goto_6

    .line 337
    :cond_7
    move-object v4, v6

    .line 338
    :goto_6
    invoke-virtual {v0, v2, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 339
    .line 340
    .line 341
    sget v2, Ll/lmb0;->m:I

    .line 342
    .line 343
    iget-object v4, p0, Ll/j410;->s:Ll/drl;

    .line 344
    .line 345
    invoke-virtual {p0, v4}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    move-result v4

    .line 349
    if-eqz v4, :cond_8

    .line 350
    .line 351
    new-instance v4, Ljava/lang/StringBuilder;

    .line 352
    .line 353
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 354
    .line 355
    .line 356
    iget-object v7, p0, Ll/j410;->s:Ll/drl;

    .line 357
    .line 358
    invoke-interface {v7}, Ll/drl;->c()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v7

    .line 362
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object v4

    .line 372
    goto :goto_7

    .line 373
    :cond_8
    move-object v4, v6

    .line 374
    :goto_7
    invoke-virtual {v0, v2, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 375
    .line 376
    .line 377
    sget v2, Ll/lmb0;->n:I

    .line 378
    .line 379
    invoke-virtual {p0, p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 380
    .line 381
    .line 382
    move-result v4

    .line 383
    if-eqz v4, :cond_9

    .line 384
    .line 385
    new-instance v4, Ljava/lang/StringBuilder;

    .line 386
    .line 387
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 388
    .line 389
    .line 390
    move-object v7, p1

    .line 391
    check-cast v7, Ll/wyl;

    .line 392
    .line 393
    invoke-interface {v7}, Ll/wyl;->getVideoWidth()I

    .line 394
    .line 395
    .line 396
    move-result v7

    .line 397
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 398
    .line 399
    .line 400
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    .line 402
    .line 403
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object v4

    .line 407
    goto :goto_8

    .line 408
    :cond_9
    move-object v4, v6

    .line 409
    :goto_8
    invoke-virtual {v0, v2, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 410
    .line 411
    .line 412
    sget v2, Ll/lmb0;->o:I

    .line 413
    .line 414
    invoke-virtual {p0, p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 415
    .line 416
    .line 417
    move-result v4

    .line 418
    if-eqz v4, :cond_a

    .line 419
    .line 420
    new-instance v4, Ljava/lang/StringBuilder;

    .line 421
    .line 422
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 423
    .line 424
    .line 425
    move-object v7, p1

    .line 426
    check-cast v7, Ll/wyl;

    .line 427
    .line 428
    invoke-interface {v7}, Ll/wyl;->k0()I

    .line 429
    .line 430
    .line 431
    move-result v7

    .line 432
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 433
    .line 434
    .line 435
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 436
    .line 437
    .line 438
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v4

    .line 442
    goto :goto_9

    .line 443
    :cond_a
    move-object v4, v6

    .line 444
    :goto_9
    invoke-virtual {v0, v2, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 445
    .line 446
    .line 447
    sget v2, Ll/lmb0;->p:I

    .line 448
    .line 449
    if-eqz v3, :cond_b

    .line 450
    .line 451
    const-string v5, "1"

    .line 452
    .line 453
    :cond_b
    invoke-virtual {v0, v2, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 454
    .line 455
    .line 456
    invoke-virtual {p0, p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 457
    .line 458
    .line 459
    move-result v2

    .line 460
    if-eqz v2, :cond_c

    .line 461
    .line 462
    new-instance v2, Ljava/lang/StringBuilder;

    .line 463
    .line 464
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 465
    .line 466
    .line 467
    move-object v3, p1

    .line 468
    check-cast v3, Ll/wyl;

    .line 469
    .line 470
    invoke-interface {v3}, Ll/wyl;->p1()I

    .line 471
    .line 472
    .line 473
    move-result v3

    .line 474
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 475
    .line 476
    .line 477
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 478
    .line 479
    .line 480
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 481
    .line 482
    .line 483
    move-result-object v2

    .line 484
    goto :goto_a

    .line 485
    :cond_c
    move-object v2, v6

    .line 486
    :goto_a
    const/16 v3, 0xe

    .line 487
    .line 488
    invoke-virtual {v0, v3, v2}, Ll/v310;->a(ILjava/lang/String;)V

    .line 489
    .line 490
    .line 491
    invoke-virtual {p0, p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 492
    .line 493
    .line 494
    move-result p0

    .line 495
    if-eqz p0, :cond_d

    .line 496
    .line 497
    new-instance p0, Ljava/lang/StringBuilder;

    .line 498
    .line 499
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 500
    .line 501
    .line 502
    move-object v2, p1

    .line 503
    check-cast v2, Ll/wyl;

    .line 504
    .line 505
    invoke-interface {v2}, Ll/wyl;->A0()I

    .line 506
    .line 507
    .line 508
    move-result v2

    .line 509
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 510
    .line 511
    .line 512
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 513
    .line 514
    .line 515
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 516
    .line 517
    .line 518
    move-result-object v6

    .line 519
    :cond_d
    const/16 p0, 0xf

    .line 520
    .line 521
    invoke-virtual {v0, p0, v6}, Ll/v310;->a(ILjava/lang/String;)V

    .line 522
    .line 523
    .line 524
    sget p0, Ll/lmb0;->q:I

    .line 525
    .line 526
    invoke-static {}, Lcom/immomo/medialog/BatteryMetrics;->getInstance()Lcom/immomo/medialog/BatteryMetrics;

    .line 527
    .line 528
    .line 529
    move-result-object v1

    .line 530
    invoke-virtual {v1}, Lcom/immomo/medialog/BatteryMetrics;->getIpAddr()Ljava/lang/String;

    .line 531
    .line 532
    .line 533
    move-result-object v1

    .line 534
    invoke-virtual {v0, p0, v1}, Ll/v310;->a(ILjava/lang/String;)V

    .line 535
    .line 536
    .line 537
    new-instance p0, Ljava/lang/StringBuilder;

    .line 538
    .line 539
    const-string v1, "startPush ["

    .line 540
    .line 541
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 542
    .line 543
    .line 544
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 545
    .line 546
    .line 547
    move-result-object p1

    .line 548
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 549
    .line 550
    .line 551
    const-string p1, "] "

    .line 552
    .line 553
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 554
    .line 555
    .line 556
    invoke-virtual {v0}, Ll/v310;->toString()Ljava/lang/String;

    .line 557
    .line 558
    .line 559
    move-result-object p1

    .line 560
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 561
    .line 562
    .line 563
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 564
    .line 565
    .line 566
    move-result-object p0

    .line 567
    const-string p1, "zhengjijian"

    .line 568
    .line 569
    invoke-static {p1, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 570
    .line 571
    .line 572
    invoke-virtual {v0}, Ll/v310;->toString()Ljava/lang/String;

    .line 573
    .line 574
    .line 575
    move-result-object p0

    .line 576
    return-object p0

    .line 577
    :cond_e
    return-object v1
.end method

.method public m(Ljava/lang/Object;I)Ljava/lang/String;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, ""

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const-string v4, "watchaid"

    .line 20
    .line 21
    invoke-static {v4, v2}, Ll/t9c;->f(Ljava/lang/String;Ljava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/mmb0;

    .line 25
    .line 26
    invoke-direct {v2}, Ll/mmb0;-><init>()V

    .line 27
    .line 28
    .line 29
    if-eqz v1, :cond_8

    .line 30
    .line 31
    instance-of v4, v1, Ll/wyl;

    .line 32
    .line 33
    if-eqz v4, :cond_8

    .line 34
    .line 35
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    const-wide/16 v5, 0x0

    .line 40
    .line 41
    if-eqz v4, :cond_0

    .line 42
    .line 43
    move-object v4, v1

    .line 44
    check-cast v4, Ll/wyl;

    .line 45
    .line 46
    invoke-interface {v4}, Ll/wyl;->N0()J

    .line 47
    .line 48
    .line 49
    move-result-wide v7

    .line 50
    cmp-long v7, v7, v5

    .line 51
    .line 52
    if-lez v7, :cond_0

    .line 53
    .line 54
    invoke-interface {v4}, Ll/wyl;->N0()J

    .line 55
    .line 56
    .line 57
    move-result-wide v7

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    move-wide v7, v5

    .line 60
    :goto_0
    iget-object v4, v0, Ll/j410;->l:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v9

    .line 66
    if-eqz v9, :cond_1

    .line 67
    .line 68
    move-object v9, v1

    .line 69
    check-cast v9, Ll/wyl;

    .line 70
    .line 71
    invoke-interface {v9}, Ll/wyl;->D1()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v10

    .line 75
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v10

    .line 79
    if-nez v10, :cond_1

    .line 80
    .line 81
    invoke-interface {v9}, Ll/wyl;->D1()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    :cond_1
    move-object v9, v1

    .line 86
    check-cast v9, Ll/wyl;

    .line 87
    .line 88
    const/16 v10, 0x101d

    .line 89
    .line 90
    const/4 v11, 0x0

    .line 91
    const/4 v12, 0x0

    .line 92
    invoke-interface {v9, v10, v11, v12}, Ll/wyl;->j1(IILjava/lang/Object;)J

    .line 93
    .line 94
    .line 95
    move-result-wide v13

    .line 96
    const-wide/16 v15, 0x1

    .line 97
    .line 98
    cmp-long v10, v13, v15

    .line 99
    .line 100
    if-nez v10, :cond_3

    .line 101
    .line 102
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v10

    .line 106
    if-eqz v10, :cond_2

    .line 107
    .line 108
    const/16 v10, 0x101c

    .line 109
    .line 110
    invoke-interface {v9, v10, v11, v12}, Ll/wyl;->j1(IILjava/lang/Object;)J

    .line 111
    .line 112
    .line 113
    move-result-wide v10

    .line 114
    goto :goto_1

    .line 115
    :cond_2
    move-wide v10, v5

    .line 116
    :goto_1
    cmp-long v5, v10, v5

    .line 117
    .line 118
    if-eqz v5, :cond_4

    .line 119
    .line 120
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 121
    .line 122
    .line 123
    move-result-wide v5

    .line 124
    sub-long v10, v5, v10

    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_3
    const-wide/16 v10, -0x1

    .line 128
    .line 129
    :cond_4
    :goto_2
    sget v5, Ll/mmb0;->c:I

    .line 130
    .line 131
    new-instance v6, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .line 135
    .line 136
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 137
    .line 138
    .line 139
    move-result-wide v12

    .line 140
    invoke-virtual {v6, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v6

    .line 150
    invoke-virtual {v2, v5, v6}, Ll/v310;->a(ILjava/lang/String;)V

    .line 151
    .line 152
    .line 153
    sget v5, Ll/mmb0;->d:I

    .line 154
    .line 155
    iget-object v6, v0, Ll/j410;->s:Ll/drl;

    .line 156
    .line 157
    invoke-virtual {v0, v6}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v6

    .line 161
    const-string v12, " "

    .line 162
    .line 163
    if-eqz v6, :cond_5

    .line 164
    .line 165
    new-instance v6, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 168
    .line 169
    .line 170
    iget-object v13, v0, Ll/j410;->s:Ll/drl;

    .line 171
    .line 172
    invoke-interface {v13}, Ll/drl;->a()I

    .line 173
    .line 174
    .line 175
    move-result v13

    .line 176
    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v6

    .line 186
    goto :goto_3

    .line 187
    :cond_5
    move-object v6, v12

    .line 188
    :goto_3
    invoke-virtual {v2, v5, v6}, Ll/v310;->a(ILjava/lang/String;)V

    .line 189
    .line 190
    .line 191
    sget v5, Ll/mmb0;->e:I

    .line 192
    .line 193
    new-instance v6, Ljava/lang/StringBuilder;

    .line 194
    .line 195
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v6

    .line 208
    invoke-virtual {v2, v5, v6}, Ll/v310;->a(ILjava/lang/String;)V

    .line 209
    .line 210
    .line 211
    sget v5, Ll/mmb0;->f:I

    .line 212
    .line 213
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v6

    .line 217
    if-eqz v6, :cond_6

    .line 218
    .line 219
    invoke-interface {v9}, Ll/wyl;->getServerIpAddr()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v6

    .line 223
    goto :goto_4

    .line 224
    :cond_6
    const-string v6, "0.0.0.0"

    .line 225
    .line 226
    :goto_4
    invoke-virtual {v2, v5, v6}, Ll/v310;->a(ILjava/lang/String;)V

    .line 227
    .line 228
    .line 229
    sget v5, Ll/mmb0;->g:I

    .line 230
    .line 231
    invoke-virtual {v2, v5, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 232
    .line 233
    .line 234
    sget v4, Ll/mmb0;->h:I

    .line 235
    .line 236
    iget-object v5, v0, Ll/i410;->F:Ljava/lang/String;

    .line 237
    .line 238
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 239
    .line 240
    .line 241
    sget v4, Ll/mmb0;->i:I

    .line 242
    .line 243
    new-instance v5, Ljava/lang/StringBuilder;

    .line 244
    .line 245
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 246
    .line 247
    .line 248
    invoke-virtual {v5, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v5

    .line 258
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 259
    .line 260
    .line 261
    sget v4, Ll/mmb0;->j:I

    .line 262
    .line 263
    iget-object v5, v0, Ll/j410;->s:Ll/drl;

    .line 264
    .line 265
    invoke-virtual {v0, v5}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result v5

    .line 269
    if-eqz v5, :cond_7

    .line 270
    .line 271
    new-instance v5, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 274
    .line 275
    .line 276
    iget-object v0, v0, Ll/j410;->s:Ll/drl;

    .line 277
    .line 278
    invoke-interface {v0}, Ll/drl;->d()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v12

    .line 292
    :cond_7
    invoke-virtual {v2, v4, v12}, Ll/v310;->a(ILjava/lang/String;)V

    .line 293
    .line 294
    .line 295
    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 296
    .line 297
    const-string v3, "stopPush ["

    .line 298
    .line 299
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    const-string v1, "] "

    .line 310
    .line 311
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    invoke-virtual {v2}, Ll/v310;->toString()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v1

    .line 318
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    const-string v1, "zhengjijian"

    .line 326
    .line 327
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    .line 329
    .line 330
    invoke-virtual {v2}, Ll/v310;->toString()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    return-object v0
.end method

.method public o(Ljava/lang/Object;)Ljava/lang/String;
    .locals 43

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v4, "watchaid"

    invoke-static {v4, v2}, Ll/t9c;->f(Ljava/lang/String;Ljava/lang/Object;)I

    .line 2
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v2

    invoke-virtual {v2}, Ll/u6y;->S()V

    .line 3
    new-instance v2, Ll/nmb0;

    invoke-direct {v2}, Ll/nmb0;-><init>()V

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-eqz v1, :cond_3d

    .line 4
    instance-of v8, v1, Ll/wyl;

    if-eqz v8, :cond_3d

    .line 5
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    move-object v8, v1

    check-cast v8, Ll/wyl;

    invoke-interface {v8}, Ll/wyl;->x1()J

    move-result-wide v8

    goto :goto_0

    :cond_0
    const-wide/16 v8, 0x0

    .line 6
    :goto_0
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    move-object v10, v1

    check-cast v10, Ll/wyl;

    invoke-interface {v10}, Ll/wyl;->a0()J

    move-result-wide v10

    goto :goto_1

    :cond_1
    const-wide/16 v10, 0x0

    .line 7
    :goto_1
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    move-object v12, v1

    check-cast v12, Ll/wyl;

    invoke-interface {v12}, Ll/wyl;->O0()J

    move-result-wide v12

    goto :goto_2

    :cond_2
    const-wide/16 v12, 0x0

    .line 8
    :goto_2
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3

    move-object v14, v1

    check-cast v14, Ll/wyl;

    invoke-interface {v14}, Ll/wyl;->q1()J

    move-result-wide v14

    goto :goto_3

    :cond_3
    const-wide/16 v14, 0x0

    .line 9
    :goto_3
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_4

    move-object/from16 v16, v1

    check-cast v16, Ll/wyl;

    invoke-interface/range {v16 .. v16}, Ll/wyl;->b1()J

    move-result-wide v16

    move-wide/from16 v18, v16

    goto :goto_4

    :cond_4
    const-wide/16 v18, 0x0

    .line 10
    :goto_4
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_5

    move-object/from16 v16, v1

    check-cast v16, Ll/wyl;

    invoke-interface/range {v16 .. v16}, Ll/wyl;->g0()J

    move-result-wide v16

    move-wide/from16 v20, v16

    goto :goto_5

    :cond_5
    const-wide/16 v20, 0x0

    .line 11
    :goto_5
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_6

    move-object/from16 v16, v1

    check-cast v16, Ll/wyl;

    invoke-interface/range {v16 .. v16}, Ll/wyl;->F1()J

    move-result-wide v16

    move-wide/from16 v6, v16

    :goto_6
    const-wide/16 v16, 0x0

    goto :goto_7

    :cond_6
    const-wide/16 v6, 0x0

    goto :goto_6

    .line 12
    :goto_7
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_7

    move-object/from16 v22, v1

    check-cast v22, Ll/wyl;

    invoke-interface/range {v22 .. v22}, Ll/wyl;->o0()J

    move-result-wide v22

    move-wide/from16 v24, v22

    goto :goto_8

    :cond_7
    move-wide/from16 v24, v16

    .line 13
    :goto_8
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v22

    const-string v23, "0"

    if-eqz v22, :cond_8

    move-object/from16 v1, p1

    check-cast v1, Ll/wyl;

    move-wide/from16 v26, v6

    const/16 v6, 0x100b

    invoke-interface {v1, v6, v5, v4}, Ll/wyl;->g1(IILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_9

    :cond_8
    move-wide/from16 v26, v6

    move-object/from16 v1, v23

    .line 14
    :goto_9
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    move-object/from16 v6, p1

    check-cast v6, Ll/wyl;

    const/16 v7, 0x1024

    invoke-interface {v6, v7, v5, v4}, Ll/wyl;->g1(IILjava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    goto :goto_a

    :cond_9
    move-object/from16 v6, v23

    .line 15
    :goto_a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    move-wide/from16 v28, v8

    .line 16
    iget-wide v7, v0, Ll/i410;->B:J

    cmp-long v30, v26, v7

    if-lez v30, :cond_a

    sub-long v7, v26, v7

    goto :goto_b

    :cond_a
    move-wide/from16 v7, v16

    :goto_b
    cmp-long v30, v7, v16

    const-wide/16 v31, 0x1

    if-nez v30, :cond_b

    .line 17
    invoke-direct/range {p0 .. p1}, Ll/i410;->p(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_b

    move-wide/from16 v33, v10

    .line 18
    iget-wide v9, v0, Ll/i410;->E:J

    add-long v9, v9, v31

    iput-wide v9, v0, Ll/i410;->E:J

    goto :goto_c

    :cond_b
    move-wide/from16 v33, v10

    move-wide/from16 v9, v16

    .line 19
    iput-wide v9, v0, Ll/i410;->E:J

    .line 20
    :goto_c
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v10

    invoke-virtual {v10}, Ll/u6y;->v()F

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v10, ","

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ll/u6y;->t()F

    move-result v11

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v11

    invoke-virtual {v11}, Ll/u6y;->c()F

    move-result v11

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v11

    invoke-virtual {v11}, Ll/u6y;->I()F

    move-result v11

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 24
    sget v11, Ll/nmb0;->c:I

    move-wide/from16 v35, v7

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-wide/from16 v37, v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v11, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 25
    sget v4, Ll/nmb0;->d:I

    .line 26
    iget-wide v7, v0, Ll/i410;->v:J

    cmp-long v5, v28, v7

    if-lez v5, :cond_c

    sub-long v7, v28, v7

    goto :goto_d

    :cond_c
    const-wide/16 v7, 0x0

    :goto_d
    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    .line 27
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 28
    sget v4, Ll/nmb0;->e:I

    .line 29
    iget-wide v7, v0, Ll/i410;->w:J

    cmp-long v5, v33, v7

    if-lez v5, :cond_d

    sub-long v7, v33, v7

    goto :goto_e

    :cond_d
    const-wide/16 v7, 0x0

    :goto_e
    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    .line 30
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 31
    sget v4, Ll/nmb0;->f:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    const-string v8, " "

    if-eqz v5, :cond_e

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, p1

    check-cast v7, Ll/wyl;

    move-object v11, v8

    invoke-interface {v7}, Ll/wyl;->u1()J

    move-result-wide v7

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_f

    :cond_e
    move-object v11, v8

    move-object v5, v11

    :goto_f
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 32
    sget v4, Ll/nmb0;->g:I

    .line 33
    iget-wide v7, v0, Ll/i410;->x:J

    cmp-long v5, v12, v7

    if-lez v5, :cond_f

    sub-long v7, v12, v7

    goto :goto_10

    :cond_f
    const-wide/16 v7, 0x0

    :goto_10
    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    .line 34
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 35
    sget v4, Ll/nmb0;->h:I

    .line 36
    iget-wide v7, v0, Ll/i410;->y:J

    cmp-long v5, v14, v7

    if-lez v5, :cond_10

    sub-long v7, v14, v7

    goto :goto_11

    :cond_10
    const-wide/16 v7, 0x0

    :goto_11
    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    .line 37
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 38
    sget v4, Ll/nmb0;->i:I

    .line 39
    iget-wide v7, v0, Ll/i410;->z:J

    move-wide/from16 v39, v7

    move-wide/from16 v7, v18

    cmp-long v5, v7, v39

    if-lez v5, :cond_11

    sub-long v18, v7, v39

    goto :goto_12

    :cond_11
    const-wide/16 v18, 0x0

    :goto_12
    invoke-static/range {v18 .. v19}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    .line 40
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 41
    sget v4, Ll/nmb0;->j:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_12

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v18, p1

    check-cast v18, Ll/wyl;

    move-wide/from16 v39, v7

    invoke-interface/range {v18 .. v18}, Ll/wyl;->c0()J

    move-result-wide v7

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_13

    :cond_12
    move-wide/from16 v39, v7

    move-object v5, v11

    :goto_13
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 42
    sget v4, Ll/nmb0;->k:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_13

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, p1

    check-cast v7, Ll/wyl;

    invoke-interface {v7}, Ll/wyl;->G0()J

    move-result-wide v7

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_14

    :cond_13
    move-object v5, v11

    :goto_14
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 43
    sget v4, Ll/nmb0;->l:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_14

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, p1

    check-cast v7, Ll/wyl;

    invoke-interface {v7}, Ll/wyl;->n0()J

    move-result-wide v7

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_15

    :cond_14
    move-object v5, v11

    :goto_15
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 44
    sget v4, Ll/nmb0;->m:I

    .line 45
    iget-wide v7, v0, Ll/i410;->A:J

    move-wide/from16 v18, v7

    move-wide/from16 v7, v20

    cmp-long v5, v7, v18

    if-lez v5, :cond_15

    sub-long v18, v7, v18

    goto :goto_16

    :cond_15
    const-wide/16 v18, 0x0

    :goto_16
    invoke-static/range {v18 .. v19}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    .line 46
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 47
    sget v4, Ll/nmb0;->n:I

    invoke-static/range {v35 .. v36}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 48
    sget v4, Ll/nmb0;->o:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_16

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v18, p1

    check-cast v18, Ll/wyl;

    move-object/from16 v19, v11

    invoke-interface/range {v18 .. v18}, Ll/wyl;->n1()I

    move-result v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_17

    :cond_16
    move-object/from16 v19, v11

    move-object/from16 v5, v19

    :goto_17
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 49
    sget v4, Ll/nmb0;->p:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v11, p1

    check-cast v11, Ll/wyl;

    invoke-interface {v11}, Ll/wyl;->F0()I

    move-result v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_18

    :cond_17
    move-object/from16 v5, v19

    :goto_18
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 50
    sget v4, Ll/nmb0;->q:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ll/pgy;->h()Ll/pgy;

    move-result-object v11

    invoke-virtual {v11}, Ll/pgy;->e()I

    move-result v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 51
    sget v4, Ll/nmb0;->r:I

    iget-object v5, v0, Ll/j410;->s:Ll/drl;

    invoke-virtual {v0, v5}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_18

    iget-object v5, v0, Ll/j410;->s:Ll/drl;

    invoke-interface {v5}, Ll/drl;->b()Ljava/lang/String;

    move-result-object v5

    goto :goto_19

    :cond_18
    move-object/from16 v5, v19

    :goto_19
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 52
    sget v4, Ll/nmb0;->s:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_19

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v11, p1

    check-cast v11, Ll/wyl;

    move-wide/from16 v20, v7

    invoke-interface {v11}, Ll/wyl;->L0()J

    move-result-wide v7

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_1a

    :cond_19
    move-wide/from16 v20, v7

    move-object/from16 v5, v19

    :goto_1a
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 53
    sget v4, Ll/nmb0;->t:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-wide/from16 v7, v24

    const-wide/16 v16, 0x0

    cmp-long v11, v7, v16

    if-eqz v11, :cond_1a

    iget-wide v7, v0, Ll/i410;->C:J

    sub-long v7, v24, v7

    move-wide/from16 v35, v7

    iget-wide v7, v0, Ll/i410;->D:J

    sub-long v7, v37, v7

    sub-long v7, v35, v7

    goto :goto_1b

    :cond_1a
    const-wide/16 v7, 0x0

    :goto_1b
    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 54
    sget v4, Ll/nmb0;->u:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1b

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, p1

    check-cast v7, Ll/wyl;

    invoke-interface {v7}, Ll/wyl;->J0()J

    move-result-wide v7

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_1c

    :cond_1b
    move-object/from16 v5, v19

    :goto_1c
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 55
    sget v4, Ll/nmb0;->v:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1c

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, p1

    check-cast v7, Ll/wyl;

    invoke-interface {v7}, Ll/wyl;->w1()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_1d

    :cond_1c
    move-object/from16 v5, v19

    :goto_1d
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 56
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v4

    invoke-virtual {v4}, Ll/u6y;->r()J

    move-result-wide v4

    .line 57
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v7

    invoke-virtual {v7}, Ll/u6y;->q()J

    move-result-wide v7

    .line 58
    sget v11, Ll/nmb0;->w:I

    move-wide/from16 v35, v14

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v11, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 59
    sget v4, Ll/nmb0;->x:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 60
    sget v4, Ll/nmb0;->y:I

    iget-object v5, v0, Ll/j410;->q:Ll/eql;

    invoke-virtual {v0, v5}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1d

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, v0, Ll/j410;->q:Ll/eql;

    invoke-interface {v7}, Ll/eql;->I0()J

    move-result-wide v7

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_1e

    :cond_1d
    move-object/from16 v5, v19

    :goto_1e
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 61
    sget v4, Ll/nmb0;->z:I

    iget-object v5, v0, Ll/j410;->q:Ll/eql;

    invoke-virtual {v0, v5}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1e

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, v0, Ll/j410;->q:Ll/eql;

    invoke-interface {v7}, Ll/eql;->v1()J

    move-result-wide v7

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_1f

    :cond_1e
    move-object/from16 v5, v19

    :goto_1f
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 62
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v4

    invoke-virtual {v4}, Ll/u6y;->y()J

    move-result-wide v4

    .line 63
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v7

    invoke-virtual {v7}, Ll/u6y;->x()J

    move-result-wide v7

    .line 64
    sget v11, Ll/nmb0;->A:I

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v11, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 65
    sget v4, Ll/nmb0;->B:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 66
    sget v4, Ll/nmb0;->C:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, p1

    check-cast v7, Ll/wyl;

    invoke-interface {v7}, Ll/wyl;->h1()I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_20

    :cond_1f
    move-object/from16 v5, v19

    :goto_20
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 67
    sget v4, Ll/nmb0;->D:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_20

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, p1

    check-cast v7, Ll/wyl;

    invoke-interface {v7}, Ll/wyl;->Y0()I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_21

    :cond_20
    move-object/from16 v5, v19

    :goto_21
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 68
    sget v4, Ll/nmb0;->E:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_21

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, p1

    check-cast v7, Ll/wyl;

    invoke-interface {v7}, Ll/wyl;->m0()I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_22

    :cond_21
    move-object/from16 v5, v19

    :goto_22
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 69
    sget v4, Ll/nmb0;->F:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_22

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, p1

    check-cast v7, Ll/wyl;

    invoke-interface {v7}, Ll/wyl;->Q0()I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_23

    :cond_22
    move-object/from16 v5, v19

    :goto_23
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 70
    sget v4, Ll/nmb0;->G:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_23

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, p1

    check-cast v7, Ll/wyl;

    invoke-interface {v7}, Ll/wyl;->getVideoWidth()I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_24

    :cond_23
    move-object/from16 v5, v19

    :goto_24
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 71
    sget v4, Ll/nmb0;->H:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_24

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, p1

    check-cast v7, Ll/wyl;

    invoke-interface {v7}, Ll/wyl;->k0()I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_25

    :cond_24
    move-object/from16 v5, v19

    :goto_25
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 72
    sget v4, Ll/nmb0;->I:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_25

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, p1

    check-cast v7, Ll/wyl;

    invoke-interface {v7}, Ll/wyl;->M0()I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_26

    :cond_25
    move-object/from16 v5, v19

    :goto_26
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 73
    sget v4, Ll/nmb0;->J:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_26

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, p1

    check-cast v7, Ll/wyl;

    invoke-interface {v7}, Ll/wyl;->getRoomType()I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_27

    :cond_26
    move-object/from16 v5, v19

    :goto_27
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 74
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_27

    move-object/from16 v4, p1

    check-cast v4, Ll/wyl;

    invoke-interface {v4}, Ll/wyl;->h0()I

    move-result v4

    int-to-long v4, v4

    goto :goto_28

    :cond_27
    const-wide/16 v4, 0x0

    .line 75
    :goto_28
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_28

    move-object/from16 v7, p1

    check-cast v7, Ll/wyl;

    invoke-interface {v7}, Ll/wyl;->N1()I

    move-result v7

    int-to-long v7, v7

    goto :goto_29

    :cond_28
    const-wide/16 v7, 0x0

    .line 76
    :goto_29
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_29

    move-object/from16 v11, p1

    check-cast v11, Ll/wyl;

    invoke-interface {v11}, Ll/wyl;->W0()I

    move-result v11

    int-to-long v14, v11

    goto :goto_2a

    :cond_29
    const-wide/16 v14, 0x0

    .line 77
    :goto_2a
    sget v11, Ll/nmb0;->K:I

    move-wide/from16 v41, v12

    iget-wide v12, v0, Ll/i410;->G:J

    cmp-long v18, v4, v12

    if-lez v18, :cond_2a

    sub-long v12, v4, v12

    goto :goto_2b

    :cond_2a
    const-wide/16 v12, 0x0

    :goto_2b
    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Ll/v310;->a(ILjava/lang/String;)V

    .line 78
    sget v11, Ll/nmb0;->L:I

    iget-wide v12, v0, Ll/i410;->H:J

    cmp-long v18, v7, v12

    if-lez v18, :cond_2b

    sub-long v12, v7, v12

    goto :goto_2c

    :cond_2b
    const-wide/16 v12, 0x0

    :goto_2c
    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Ll/v310;->a(ILjava/lang/String;)V

    .line 79
    sget v11, Ll/nmb0;->M:I

    iget-wide v12, v0, Ll/i410;->I:J

    cmp-long v18, v14, v12

    if-lez v18, :cond_2c

    sub-long v12, v14, v12

    goto :goto_2d

    :cond_2c
    const-wide/16 v12, 0x0

    :goto_2d
    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Ll/v310;->a(ILjava/lang/String;)V

    .line 80
    iput-wide v4, v0, Ll/i410;->G:J

    .line 81
    iput-wide v7, v0, Ll/i410;->H:J

    .line 82
    iput-wide v14, v0, Ll/i410;->I:J

    .line 83
    sget v4, Ll/nmb0;->N:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2d

    move-object/from16 v5, p1

    check-cast v5, Ll/wyl;

    const/16 v7, 0x1015

    const/4 v8, 0x0

    const/4 v11, 0x0

    invoke-interface {v5, v7, v8, v11}, Ll/wyl;->g1(IILjava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    goto :goto_2e

    :cond_2d
    const/4 v8, 0x0

    const/4 v11, 0x0

    move-object/from16 v5, v19

    :goto_2e
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 84
    sget v4, Ll/nmb0;->O:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2e

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v7, p1

    check-cast v7, Ll/wyl;

    const/16 v12, 0x1016

    invoke-interface {v7, v12, v8, v11}, Ll/wyl;->j1(IILjava/lang/Object;)J

    move-result-wide v12

    invoke-virtual {v5, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_2f

    :cond_2e
    move-object/from16 v5, v19

    :goto_2f
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 85
    sget v4, Ll/nmb0;->P:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2f

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v8, p1

    check-cast v8, Ll/wyl;

    const/16 v11, 0x1017

    const/4 v7, 0x0

    const/4 v12, 0x0

    invoke-interface {v8, v11, v12, v7}, Ll/wyl;->g1(IILjava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_30

    :cond_2f
    move-object/from16 v5, v19

    :goto_30
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 86
    sget v4, Ll/nmb0;->Q:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_30

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v8, p1

    check-cast v8, Ll/wyl;

    const/16 v11, 0x1018

    const/4 v7, 0x0

    const/4 v12, 0x0

    invoke-interface {v8, v11, v12, v7}, Ll/wyl;->g1(IILjava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_31

    :cond_30
    move-object/from16 v5, v19

    :goto_31
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 87
    sget v4, Ll/nmb0;->R:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_31

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v8, p1

    check-cast v8, Ll/wyl;

    const/16 v11, 0x101b

    const/4 v7, 0x0

    const/4 v12, 0x0

    invoke-interface {v8, v11, v12, v7}, Ll/wyl;->j1(IILjava/lang/Object;)J

    move-result-wide v13

    invoke-virtual {v5, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_32

    :cond_31
    move-object/from16 v5, v19

    :goto_32
    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 88
    sget v4, Ll/nmb0;->S:I

    invoke-virtual {v2, v4, v9}, Ll/v310;->a(ILjava/lang/String;)V

    .line 89
    sget v4, Ll/nmb0;->T:I

    const-string v5, "-1"

    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 90
    sget v4, Ll/nmb0;->U:I

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_32

    move-object/from16 v5, p1

    check-cast v5, Ll/wyl;

    const/16 v8, 0x100a

    const/4 v7, 0x0

    const/4 v12, 0x0

    invoke-interface {v5, v8, v12, v7}, Ll/wyl;->g1(IILjava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    goto :goto_33

    :cond_32
    move-object/from16 v8, v19

    :goto_33
    invoke-virtual {v2, v4, v8}, Ll/v310;->a(ILjava/lang/String;)V

    .line 91
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v5

    invoke-virtual {v5}, Ll/u6y;->d()J

    move-result-wide v8

    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v5

    invoke-virtual {v5}, Ll/u6y;->p()J

    move-result-wide v8

    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v5

    invoke-virtual {v5}, Ll/u6y;->A()J

    move-result-wide v8

    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v5

    invoke-virtual {v5}, Ll/u6y;->E()J

    move-result-wide v8

    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 95
    sget v5, Ll/nmb0;->V:I

    invoke-virtual {v2, v5, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 96
    sget v4, Ll/nmb0;->W:I

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v8

    invoke-virtual {v8}, Ll/u6y;->K()I

    move-result v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ll/v310;->a(ILjava/lang/String;)V

    .line 97
    sget v4, Ll/nmb0;->X:I

    invoke-virtual {v2, v4, v1}, Ll/v310;->a(ILjava/lang/String;)V

    .line 98
    sget v1, Ll/nmb0;->Y:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v5

    invoke-virtual {v5}, Ll/u6y;->H()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v1, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 99
    sget v1, Ll/nmb0;->Z:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v8, v0, Ll/i410;->J:J

    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v1, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 100
    sget v1, Ll/nmb0;->a0:I

    invoke-virtual {v2, v1, v6}, Ll/v310;->a(ILjava/lang/String;)V

    .line 101
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_33

    move-object/from16 v1, p1

    check-cast v1, Ll/wyl;

    const/16 v4, 0x1025

    const/4 v7, 0x0

    const/4 v12, 0x0

    invoke-interface {v1, v4, v12, v7}, Ll/wyl;->j1(IILjava/lang/Object;)J

    move-result-wide v4

    goto :goto_34

    :cond_33
    const/4 v7, 0x0

    const/4 v12, 0x0

    const-wide/16 v4, 0x0

    .line 102
    :goto_34
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_34

    move-object/from16 v1, p1

    check-cast v1, Ll/wyl;

    const/16 v6, 0x1026

    invoke-interface {v1, v6, v12, v7}, Ll/wyl;->j1(IILjava/lang/Object;)J

    move-result-wide v8

    move-wide v9, v8

    :goto_35
    const-wide/16 v16, 0x0

    goto :goto_36

    :cond_34
    const-wide/16 v9, 0x0

    goto :goto_35

    :goto_36
    cmp-long v1, v4, v16

    const-wide/16 v11, 0x3e8

    if-lez v1, :cond_35

    .line 103
    div-long/2addr v4, v11

    :cond_35
    cmp-long v1, v9, v16

    if-lez v1, :cond_36

    .line 104
    div-long/2addr v9, v11

    .line 105
    :cond_36
    sget v1, Ll/nmb0;->b0:I

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v1, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 106
    sget v1, Ll/nmb0;->c0:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v1, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 107
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_37

    move-object/from16 v1, p1

    check-cast v1, Ll/wyl;

    const/16 v4, 0x1020

    const/4 v7, 0x0

    const/4 v12, 0x0

    invoke-interface {v1, v4, v12, v7}, Ll/wyl;->g1(IILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_37

    :cond_37
    const/4 v7, 0x0

    const/4 v12, 0x0

    const-string v1, "100"

    .line 108
    :goto_37
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_38

    move-object/from16 v4, p1

    check-cast v4, Ll/wyl;

    const/16 v5, 0x101e

    invoke-interface {v4, v5, v12, v7}, Ll/wyl;->j1(IILjava/lang/Object;)J

    move-result-wide v9

    goto :goto_38

    :cond_38
    const-wide/16 v9, 0x0

    .line 109
    :goto_38
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_39

    move-object/from16 v4, p1

    check-cast v4, Ll/wyl;

    const/16 v5, 0x101f

    invoke-interface {v4, v5, v12, v7}, Ll/wyl;->j1(IILjava/lang/Object;)J

    move-result-wide v4

    goto :goto_39

    :cond_39
    const-wide/16 v4, 0x0

    .line 110
    :goto_39
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3a

    move-object/from16 v6, p1

    check-cast v6, Ll/wyl;

    const/16 v8, 0x1022

    invoke-interface {v6, v8, v12, v7}, Ll/wyl;->j1(IILjava/lang/Object;)J

    move-result-wide v13

    goto :goto_3a

    :cond_3a
    const-wide/16 v13, 0x0

    .line 111
    :goto_3a
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3b

    move-object/from16 v6, p1

    check-cast v6, Ll/wyl;

    const/16 v8, 0x1023

    invoke-interface {v6, v8, v12, v7}, Ll/wyl;->j1(IILjava/lang/Object;)J

    move-result-wide v18

    move-wide/from16 v11, v18

    goto :goto_3b

    :cond_3b
    const-wide/16 v11, 0x0

    .line 112
    :goto_3b
    sget v6, Ll/nmb0;->d0:I

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v6, v1}, Ll/v310;->a(ILjava/lang/String;)V

    .line 113
    sget v1, Ll/nmb0;->e0:I

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v1, v6}, Ll/v310;->a(ILjava/lang/String;)V

    .line 114
    sget v1, Ll/nmb0;->f0:I

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v1, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 115
    sget v1, Ll/nmb0;->g0:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v1, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 116
    sget v1, Ll/nmb0;->h0:I

    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v4

    invoke-virtual {v4}, Ll/u6y;->D()Z

    move-result v4

    if-eqz v4, :cond_3c

    const-string v23, "1"

    :cond_3c
    move-object/from16 v4, v23

    invoke-virtual {v2, v1, v4}, Ll/v310;->a(ILjava/lang/String;)V

    .line 117
    sget v1, Ll/nmb0;->i0:I

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Ll/v310;->a(ILjava/lang/String;)V

    .line 118
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    move-result-object v1

    invoke-virtual {v1}, Ll/u6y;->T()V

    move-wide/from16 v8, v28

    .line 119
    iput-wide v8, v0, Ll/i410;->v:J

    move-wide/from16 v10, v33

    .line 120
    iput-wide v10, v0, Ll/i410;->w:J

    move-wide/from16 v12, v41

    .line 121
    iput-wide v12, v0, Ll/i410;->x:J

    move-wide/from16 v14, v35

    .line 122
    iput-wide v14, v0, Ll/i410;->y:J

    move-wide/from16 v3, v39

    .line 123
    iput-wide v3, v0, Ll/i410;->z:J

    move-wide/from16 v3, v20

    .line 124
    iput-wide v3, v0, Ll/i410;->A:J

    move-wide/from16 v3, v26

    .line 125
    iput-wide v3, v0, Ll/i410;->B:J

    move-wide/from16 v3, v24

    .line 126
    iput-wide v3, v0, Ll/i410;->C:J

    move-wide/from16 v3, v37

    .line 127
    iput-wide v3, v0, Ll/i410;->D:J

    .line 128
    iget-wide v3, v0, Ll/i410;->J:J

    add-long v3, v3, v31

    iput-wide v3, v0, Ll/i410;->J:J

    .line 129
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "pushWatch "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ll/v310;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "NetUtils"

    invoke-static {v3, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    :cond_3d
    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    move-object/from16 v1, p1

    check-cast v1, Ll/wyl;

    const/16 v3, 0x1027

    const/4 v7, 0x0

    const/4 v12, 0x0

    invoke-interface {v1, v3, v12, v7}, Ll/wyl;->j1(IILjava/lang/Object;)J

    move-result-wide v9

    :goto_3c
    const-wide/16 v16, 0x0

    goto :goto_3d

    :cond_3e
    const-wide/16 v9, 0x0

    goto :goto_3c

    :goto_3d
    cmp-long v1, v9, v16

    if-nez v1, :cond_3f

    .line 131
    iget-wide v3, v0, Ll/i410;->E:J

    const-wide/16 v5, 0x3

    cmp-long v1, v3, v5

    if-nez v1, :cond_3f

    invoke-virtual/range {p0 .. p1}, Ll/j410;->e(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 132
    move-object/from16 v0, p1

    check-cast v0, Ll/wyl;

    const/16 v1, 0x100c

    const/4 v7, 0x0

    const/4 v12, 0x0

    invoke-interface {v0, v1, v12, v7}, Ll/wyl;->g1(IILjava/lang/Object;)Ljava/lang/String;

    .line 133
    :cond_3f
    invoke-virtual {v2}, Ll/v310;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
