.class public Ll/jq70;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/uow;I)Ll/uow;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "resolutionLevel "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "jzheng"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    const v0, 0x7a120

    .line 21
    .line 22
    .line 23
    const/16 v1, 0x1e0

    .line 24
    .line 25
    const/16 v2, 0x160

    .line 26
    .line 27
    const/16 v3, 0x280

    .line 28
    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    const/4 v4, 0x1

    .line 32
    if-eq p1, v4, :cond_1

    .line 33
    .line 34
    const/4 v4, 0x2

    .line 35
    if-eq p1, v4, :cond_0

    .line 36
    .line 37
    const/4 v4, 0x3

    .line 38
    if-eq p1, v4, :cond_0

    .line 39
    .line 40
    iput v2, p0, Ll/tow;->s:I

    .line 41
    .line 42
    iput v3, p0, Ll/tow;->t:I

    .line 43
    .line 44
    iput v2, p0, Ll/tow;->u:I

    .line 45
    .line 46
    iput v3, p0, Ll/tow;->v:I

    .line 47
    .line 48
    iput v3, p0, Ll/tow;->w:I

    .line 49
    .line 50
    iput v1, p0, Ll/tow;->x:I

    .line 51
    .line 52
    iput v2, p0, Ll/tow;->m:I

    .line 53
    .line 54
    iput v3, p0, Ll/tow;->n:I

    .line 55
    .line 56
    iput v2, p0, Ll/tow;->z:I

    .line 57
    .line 58
    iput v3, p0, Ll/tow;->A:I

    .line 59
    .line 60
    iput v2, p0, Ll/tow;->B:I

    .line 61
    .line 62
    iput v3, p0, Ll/tow;->C:I

    .line 63
    .line 64
    iput v0, p0, Ll/tow;->H:I

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    const/16 p1, 0x210

    .line 68
    .line 69
    iput p1, p0, Ll/tow;->s:I

    .line 70
    .line 71
    const/16 v0, 0x3c0

    .line 72
    .line 73
    iput v0, p0, Ll/tow;->t:I

    .line 74
    .line 75
    iput p1, p0, Ll/tow;->u:I

    .line 76
    .line 77
    iput v0, p0, Ll/tow;->v:I

    .line 78
    .line 79
    const/16 v1, 0x500

    .line 80
    .line 81
    iput v1, p0, Ll/tow;->w:I

    .line 82
    .line 83
    const/16 v1, 0x2d0

    .line 84
    .line 85
    iput v1, p0, Ll/tow;->x:I

    .line 86
    .line 87
    iput p1, p0, Ll/tow;->m:I

    .line 88
    .line 89
    iput v0, p0, Ll/tow;->n:I

    .line 90
    .line 91
    iput p1, p0, Ll/tow;->z:I

    .line 92
    .line 93
    iput v0, p0, Ll/tow;->A:I

    .line 94
    .line 95
    iput p1, p0, Ll/tow;->B:I

    .line 96
    .line 97
    iput v0, p0, Ll/tow;->C:I

    .line 98
    .line 99
    const p1, 0xf4240

    .line 100
    .line 101
    .line 102
    iput p1, p0, Ll/tow;->H:I

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_1
    iput v2, p0, Ll/tow;->s:I

    .line 106
    .line 107
    iput v3, p0, Ll/tow;->t:I

    .line 108
    .line 109
    iput v2, p0, Ll/tow;->u:I

    .line 110
    .line 111
    iput v3, p0, Ll/tow;->v:I

    .line 112
    .line 113
    iput v3, p0, Ll/tow;->w:I

    .line 114
    .line 115
    iput v1, p0, Ll/tow;->x:I

    .line 116
    .line 117
    iput v2, p0, Ll/tow;->m:I

    .line 118
    .line 119
    iput v3, p0, Ll/tow;->n:I

    .line 120
    .line 121
    iput v2, p0, Ll/tow;->z:I

    .line 122
    .line 123
    iput v3, p0, Ll/tow;->A:I

    .line 124
    .line 125
    iput v2, p0, Ll/tow;->B:I

    .line 126
    .line 127
    iput v3, p0, Ll/tow;->C:I

    .line 128
    .line 129
    const p1, 0xb71b0

    .line 130
    .line 131
    .line 132
    iput p1, p0, Ll/tow;->H:I

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_2
    iput v2, p0, Ll/tow;->s:I

    .line 136
    .line 137
    iput v3, p0, Ll/tow;->t:I

    .line 138
    .line 139
    iput v2, p0, Ll/tow;->u:I

    .line 140
    .line 141
    iput v3, p0, Ll/tow;->v:I

    .line 142
    .line 143
    iput v3, p0, Ll/tow;->w:I

    .line 144
    .line 145
    iput v1, p0, Ll/tow;->x:I

    .line 146
    .line 147
    iput v2, p0, Ll/tow;->m:I

    .line 148
    .line 149
    iput v3, p0, Ll/tow;->n:I

    .line 150
    .line 151
    iput v2, p0, Ll/tow;->z:I

    .line 152
    .line 153
    iput v3, p0, Ll/tow;->A:I

    .line 154
    .line 155
    iput v2, p0, Ll/tow;->B:I

    .line 156
    .line 157
    iput v3, p0, Ll/tow;->C:I

    .line 158
    .line 159
    iput v0, p0, Ll/tow;->H:I

    .line 160
    .line 161
    :goto_0
    invoke-static {p0}, Ll/jq70;->e(Ll/uow;)V

    .line 162
    .line 163
    .line 164
    return-object p0
.end method

.method public static b(Ll/uow;II)Ll/uow;
    .locals 4

    .line 1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/csx;->N0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/csx;->k()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_3

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ll/csx$b;

    .line 34
    .line 35
    const-string v2, "configdata"

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/csx$b;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-static {v2, v3}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ll/csx$b;->b()Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-gt p1, v2, :cond_0

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/csx$b;->g()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    iput v2, p0, Ll/tow;->m:I

    .line 59
    .line 60
    invoke-virtual {v1}, Ll/csx$b;->f()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    iput v1, p0, Ll/tow;->n:I

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    const v0, 0xc3500

    .line 68
    .line 69
    .line 70
    if-le p1, v0, :cond_2

    .line 71
    .line 72
    const/16 v0, 0x210

    .line 73
    .line 74
    iput v0, p0, Ll/tow;->m:I

    .line 75
    .line 76
    const/16 v0, 0x3c0

    .line 77
    .line 78
    iput v0, p0, Ll/tow;->n:I

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_2
    const/16 v0, 0x160

    .line 82
    .line 83
    iput v0, p0, Ll/tow;->m:I

    .line 84
    .line 85
    const/16 v0, 0x280

    .line 86
    .line 87
    iput v0, p0, Ll/tow;->n:I

    .line 88
    .line 89
    :cond_3
    :goto_1
    iput p1, p0, Ll/tow;->H:I

    .line 90
    .line 91
    iput p2, p0, Ll/tow;->F:I

    .line 92
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    const-string v1, "getResolutionLevel_2 encode w/h: "

    .line 96
    .line 97
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget v1, p0, Ll/tow;->m:I

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v1, " / "

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    iget v2, p0, Ll/tow;->n:I

    .line 111
    .line 112
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    const-string p2, "newBitrate"

    .line 132
    .line 133
    invoke-static {p2, p1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    return-object p0
.end method

.method public static c(Ll/uow;I)Ll/uow;
    .locals 0

    .line 1
    iput p1, p0, Ll/tow;->H:I

    .line 2
    .line 3
    return-object p0
.end method

.method public static d()Ljava/lang/String;
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v3, "\nStack info, thread:"

    .line 17
    .line 18
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v3, "\n"

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    array-length v2, v0

    .line 47
    const/4 v3, 0x0

    .line 48
    :goto_0
    if-ge v3, v2, :cond_0

    .line 49
    .line 50
    aget-object v4, v0, v3

    .line 51
    .line 52
    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v5, "("

    .line 60
    .line 61
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v5, ":"

    .line 72
    .line 73
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v4, ")\n"

    .line 84
    .line 85
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    add-int/lit8 v3, v3, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    return-object v0
.end method

.method private static e(Ll/uow;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "videoWidth:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/tow;->s:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ",videoHeight:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Ll/tow;->t:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ",visualWidth:"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Ll/tow;->u:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ",visualHeight:"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Ll/tow;->v:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ",targetWidth:"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Ll/tow;->w:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ",targetHeight:"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Ll/tow;->x:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ",encodeWidth:"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v1, p0, Ll/tow;->m:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ",encodeHeight:"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v1, p0, Ll/tow;->n:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ",cameraRenderWidth:"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Ll/tow;->z:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ",cameraRenderHeight:"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v1, p0, Ll/tow;->A:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ",videoBitrate:"

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget v1, p0, Ll/tow;->H:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ",audioBitrate:"

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget v1, p0, Ll/tow;->S:I

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, ",videoFPS:"

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget v1, p0, Ll/tow;->F:I

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, ",mergeCanvaWidth "

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget v1, p0, Ll/tow;->k:I

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v1, ",mergeCanvaHeight "

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget v1, p0, Ll/tow;->l:I

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v1, "enhanceMode "

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget p0, p0, Ll/tow;->y:I

    .line 159
    .line 160
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    const-string v0, "newBitrate"

    .line 168
    .line 169
    invoke-static {v0, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    return-void
.end method
