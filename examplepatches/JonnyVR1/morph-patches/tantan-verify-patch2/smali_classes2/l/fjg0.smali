.class public final Ll/fjg0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Z

.field public c:Z

.field public d:Z

.field public final e:Ll/aug0;

.field public final f:Ll/bog0;

.field public final g:J


# direct methods
.method public constructor <init>(Ll/aug0;Ll/bog0;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fjg0;->e:Ll/aug0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fjg0;->f:Ll/bog0;

    .line 7
    .line 8
    iput-wide p3, p0, Ll/fjg0;->g:J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/fjg0;->e:Ll/aug0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/aug0;->d:Landroid/net/Uri;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "content"

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    const/4 v5, 0x1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-static {v0}, Ll/ytg0;->a(Landroid/net/Uri;)J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    cmp-long v0, v0, v2

    .line 26
    .line 27
    if-lez v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v0, p0, Ll/fjg0;->e:Ll/aug0;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/aug0;->j()Ljava/io/File;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    :goto_0
    move v0, v5

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    move v0, v4

    .line 47
    :goto_1
    iput-boolean v0, p0, Ll/fjg0;->b:Z

    .line 48
    .line 49
    iget-object v0, p0, Ll/fjg0;->f:Ll/bog0;

    .line 50
    .line 51
    iget-object v0, v0, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-gtz v0, :cond_2

    .line 58
    .line 59
    goto :goto_3

    .line 60
    :cond_2
    iget-object v1, p0, Ll/fjg0;->f:Ll/bog0;

    .line 61
    .line 62
    iget-boolean v6, v1, Ll/bog0;->i:Z

    .line 63
    .line 64
    if-eqz v6, :cond_3

    .line 65
    .line 66
    goto :goto_3

    .line 67
    :cond_3
    invoke-virtual {v1}, Ll/bog0;->d()Ljava/io/File;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    if-nez v1, :cond_4

    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_4
    iget-object v1, p0, Ll/fjg0;->e:Ll/aug0;

    .line 75
    .line 76
    invoke-virtual {v1}, Ll/aug0;->j()Ljava/io/File;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iget-object v6, p0, Ll/fjg0;->f:Ll/bog0;

    .line 81
    .line 82
    invoke-virtual {v6}, Ll/bog0;->d()Ljava/io/File;

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    invoke-virtual {v6, v1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-nez v1, :cond_5

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_5
    iget-object v1, p0, Ll/fjg0;->f:Ll/bog0;

    .line 94
    .line 95
    invoke-virtual {v1}, Ll/bog0;->d()Ljava/io/File;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v1}, Ljava/io/File;->length()J

    .line 100
    .line 101
    .line 102
    move-result-wide v6

    .line 103
    iget-object v1, p0, Ll/fjg0;->f:Ll/bog0;

    .line 104
    .line 105
    invoke-virtual {v1}, Ll/bog0;->c()J

    .line 106
    .line 107
    .line 108
    move-result-wide v8

    .line 109
    cmp-long v1, v6, v8

    .line 110
    .line 111
    if-lez v1, :cond_6

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_6
    iget-wide v6, p0, Ll/fjg0;->g:J

    .line 115
    .line 116
    cmp-long v1, v6, v2

    .line 117
    .line 118
    if-lez v1, :cond_7

    .line 119
    .line 120
    iget-object v1, p0, Ll/fjg0;->f:Ll/bog0;

    .line 121
    .line 122
    invoke-virtual {v1}, Ll/bog0;->c()J

    .line 123
    .line 124
    .line 125
    move-result-wide v6

    .line 126
    iget-wide v8, p0, Ll/fjg0;->g:J

    .line 127
    .line 128
    cmp-long v1, v6, v8

    .line 129
    .line 130
    if-eqz v1, :cond_7

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_7
    move v1, v4

    .line 134
    :goto_2
    if-ge v1, v0, :cond_9

    .line 135
    .line 136
    iget-object v6, p0, Ll/fjg0;->f:Ll/bog0;

    .line 137
    .line 138
    iget-object v6, v6, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 139
    .line 140
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v6

    .line 144
    check-cast v6, Ll/akg0;

    .line 145
    .line 146
    iget-wide v6, v6, Ll/akg0;->b:J

    .line 147
    .line 148
    cmp-long v6, v6, v2

    .line 149
    .line 150
    if-gtz v6, :cond_8

    .line 151
    .line 152
    :goto_3
    move v0, v4

    .line 153
    goto :goto_4

    .line 154
    :cond_8
    add-int/lit8 v1, v1, 0x1

    .line 155
    .line 156
    goto :goto_2

    .line 157
    :cond_9
    move v0, v5

    .line 158
    :goto_4
    iput-boolean v0, p0, Ll/fjg0;->c:Z

    .line 159
    .line 160
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    iget-object v0, v0, Ll/jwg0;->e:Ll/zqg0;

    .line 165
    .line 166
    iput-boolean v5, p0, Ll/fjg0;->d:Z

    .line 167
    .line 168
    iget-boolean v0, p0, Ll/fjg0;->c:Z

    .line 169
    .line 170
    if-eqz v0, :cond_a

    .line 171
    .line 172
    iget-boolean v0, p0, Ll/fjg0;->b:Z

    .line 173
    .line 174
    if-eqz v0, :cond_a

    .line 175
    .line 176
    goto :goto_5

    .line 177
    :cond_a
    move v4, v5

    .line 178
    :goto_5
    iput-boolean v4, p0, Ll/fjg0;->a:Z

    .line 179
    .line 180
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "fileExist["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Ll/fjg0;->b:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "] infoRight["

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean v1, p0, Ll/fjg0;->c:Z

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "] outputStreamSupport["

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Ll/fjg0;->d:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "] "

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method
