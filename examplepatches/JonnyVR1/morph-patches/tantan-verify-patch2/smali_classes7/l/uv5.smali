.class public Ll/uv5;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/uv5$b;
    }
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Z

.field private c:Z

.field private d:Z

.field private e:J

.field private f:J

.field private g:J


# direct methods
.method private constructor <init>(Landroid/content/Context;Ll/uv5$b;)V
    .locals 10

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/uv5;->b:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Ll/uv5;->c:Z

    .line 9
    .line 10
    iput-boolean v1, p0, Ll/uv5;->d:Z

    .line 11
    .line 12
    const-wide/32 v2, 0x100000

    .line 13
    .line 14
    .line 15
    iput-wide v2, p0, Ll/uv5;->e:J

    .line 16
    .line 17
    const-wide/32 v4, 0x15180

    .line 18
    .line 19
    .line 20
    iput-wide v4, p0, Ll/uv5;->f:J

    .line 21
    .line 22
    iput-wide v4, p0, Ll/uv5;->g:J

    .line 23
    .line 24
    invoke-static {p2}, Ll/uv5$b;->a(Ll/uv5$b;)I

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    if-nez v6, :cond_0

    .line 29
    .line 30
    iput-boolean v1, p0, Ll/uv5;->b:Z

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-static {p2}, Ll/uv5$b;->a(Ll/uv5$b;)I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    if-ne v6, v0, :cond_1

    .line 38
    .line 39
    iput-boolean v0, p0, Ll/uv5;->b:Z

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iput-boolean v0, p0, Ll/uv5;->b:Z

    .line 43
    .line 44
    :goto_0
    invoke-static {p2}, Ll/uv5$b;->b(Ll/uv5$b;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    if-nez v6, :cond_2

    .line 53
    .line 54
    invoke-static {p2}, Ll/uv5$b;->b(Ll/uv5$b;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Ll/uv5;->a:Ljava/lang/String;

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    invoke-static {p1}, Ll/lvq0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Ll/uv5;->a:Ljava/lang/String;

    .line 66
    .line 67
    :goto_1
    invoke-static {p2}, Ll/uv5$b;->c(Ll/uv5$b;)J

    .line 68
    .line 69
    .line 70
    move-result-wide v6

    .line 71
    const-wide/16 v8, -0x1

    .line 72
    .line 73
    cmp-long p1, v6, v8

    .line 74
    .line 75
    if-lez p1, :cond_3

    .line 76
    .line 77
    invoke-static {p2}, Ll/uv5$b;->c(Ll/uv5$b;)J

    .line 78
    .line 79
    .line 80
    move-result-wide v2

    .line 81
    iput-wide v2, p0, Ll/uv5;->e:J

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_3
    iput-wide v2, p0, Ll/uv5;->e:J

    .line 85
    .line 86
    :goto_2
    invoke-static {p2}, Ll/uv5$b;->d(Ll/uv5$b;)J

    .line 87
    .line 88
    .line 89
    move-result-wide v2

    .line 90
    cmp-long p1, v2, v8

    .line 91
    .line 92
    if-lez p1, :cond_4

    .line 93
    .line 94
    invoke-static {p2}, Ll/uv5$b;->d(Ll/uv5$b;)J

    .line 95
    .line 96
    .line 97
    move-result-wide v2

    .line 98
    iput-wide v2, p0, Ll/uv5;->f:J

    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_4
    iput-wide v4, p0, Ll/uv5;->f:J

    .line 102
    .line 103
    :goto_3
    invoke-static {p2}, Ll/uv5$b;->e(Ll/uv5$b;)J

    .line 104
    .line 105
    .line 106
    move-result-wide v2

    .line 107
    cmp-long p1, v2, v8

    .line 108
    .line 109
    if-lez p1, :cond_5

    .line 110
    .line 111
    invoke-static {p2}, Ll/uv5$b;->e(Ll/uv5$b;)J

    .line 112
    .line 113
    .line 114
    move-result-wide v2

    .line 115
    iput-wide v2, p0, Ll/uv5;->g:J

    .line 116
    .line 117
    goto :goto_4

    .line 118
    :cond_5
    iput-wide v4, p0, Ll/uv5;->g:J

    .line 119
    .line 120
    :goto_4
    invoke-static {p2}, Ll/uv5$b;->f(Ll/uv5$b;)I

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-nez p1, :cond_6

    .line 125
    .line 126
    iput-boolean v1, p0, Ll/uv5;->c:Z

    .line 127
    .line 128
    goto :goto_5

    .line 129
    :cond_6
    invoke-static {p2}, Ll/uv5$b;->f(Ll/uv5$b;)I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-ne p1, v0, :cond_7

    .line 134
    .line 135
    iput-boolean v0, p0, Ll/uv5;->c:Z

    .line 136
    .line 137
    goto :goto_5

    .line 138
    :cond_7
    iput-boolean v1, p0, Ll/uv5;->c:Z

    .line 139
    .line 140
    :goto_5
    invoke-static {p2}, Ll/uv5$b;->g(Ll/uv5$b;)I

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-nez p1, :cond_8

    .line 145
    .line 146
    iput-boolean v1, p0, Ll/uv5;->d:Z

    .line 147
    .line 148
    return-void

    .line 149
    :cond_8
    invoke-static {p2}, Ll/uv5$b;->g(Ll/uv5$b;)I

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-ne p1, v0, :cond_9

    .line 154
    .line 155
    iput-boolean v0, p0, Ll/uv5;->d:Z

    .line 156
    .line 157
    return-void

    .line 158
    :cond_9
    iput-boolean v1, p0, Ll/uv5;->d:Z

    .line 159
    .line 160
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ll/uv5$b;Ll/uv5$a;)V
    .locals 0

    .line 161
    invoke-direct {p0, p1, p2}, Ll/uv5;-><init>(Landroid/content/Context;Ll/uv5$b;)V

    return-void
.end method

.method public static a(Landroid/content/Context;)Ll/uv5;
    .locals 4

    .line 1
    invoke-static {}, Ll/uv5;->b()Ll/uv5$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/uv5$b;->j(Z)Ll/uv5$b;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {p0}, Ll/lvq0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ll/uv5$b;->i(Ljava/lang/String;)Ll/uv5$b;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-wide/32 v1, 0x100000

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Ll/uv5$b;->m(J)Ll/uv5$b;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, v1}, Ll/uv5$b;->l(Z)Ll/uv5$b;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-wide/32 v2, 0x15180

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v2, v3}, Ll/uv5$b;->k(J)Ll/uv5$b;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0, v1}, Ll/uv5$b;->o(Z)Ll/uv5$b;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0, v2, v3}, Ll/uv5$b;->n(J)Ll/uv5$b;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0, p0}, Ll/uv5$b;->h(Landroid/content/Context;)Ll/uv5;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method public static b()Ll/uv5$b;
    .locals 1

    .line 1
    new-instance v0, Ll/uv5$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/uv5$b;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/uv5;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public d()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/uv5;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public e()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/uv5;->g:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/uv5;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/uv5;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/uv5;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Config{mEventEncrypted="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Ll/uv5;->b:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", mAESKey=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/uv5;->a:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', mMaxFileLength="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-wide v1, p0, Ll/uv5;->e:J

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", mEventUploadSwitchOpen="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-boolean v1, p0, Ll/uv5;->c:Z

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", mPerfUploadSwitchOpen="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-boolean v1, p0, Ll/uv5;->d:Z

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", mEventUploadFrequency="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-wide v1, p0, Ll/uv5;->f:J

    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", mPerfUploadFrequency="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-wide v1, p0, Ll/uv5;->g:J

    .line 69
    .line 70
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const/16 p0, 0x7d

    .line 74
    .line 75
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method
