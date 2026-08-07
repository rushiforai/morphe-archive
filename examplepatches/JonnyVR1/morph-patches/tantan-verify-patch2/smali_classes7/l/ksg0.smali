.class public final Ll/ksg0;
.super Ll/tog0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/olg0;)V
    .locals 3

    .line 1
    invoke-direct {p0, p2}, Ll/tog0;-><init>(Ll/olg0;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/io/File;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/rsg0;->a()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "sud/mgp/utcore/"

    .line 15
    .line 16
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {p2, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    iput-object p2, p0, Ll/tog0;->b:Ljava/lang/String;

    .line 28
    .line 29
    new-instance p2, Ljava/io/File;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v0, "sud/mgp/utcache"

    .line 36
    .line 37
    invoke-direct {p2, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Ll/tog0;->c:Ljava/lang/String;

    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public final a()Ll/vgg0;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/tog0;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ofg0;->b(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/tog0;->b:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Ll/ofg0;->a(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/rsg0;->a()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ljava/io/File;

    .line 16
    .line 17
    iget-object v2, p0, Ll/tog0;->c:Ljava/lang/String;

    .line 18
    .line 19
    new-instance v3, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v4, "dynamic_load"

    .line 22
    .line 23
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ljava/io/File;

    .line 42
    .line 43
    iget-object p0, p0, Ll/tog0;->b:Ljava/lang/String;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    array-length v1, p0

    .line 55
    if-nez v1, :cond_0

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_0
    array-length v1, p0

    .line 59
    const/4 v2, 0x0

    .line 60
    move v3, v2

    .line 61
    :goto_0
    if-ge v3, v1, :cond_2

    .line 62
    .line 63
    aget-object v4, p0, v3

    .line 64
    .line 65
    new-instance v5, Ljava/io/File;

    .line 66
    .line 67
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    invoke-direct {v5, v0, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    invoke-static {v4, v6}, Ll/rsg0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/vgg0;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    iget v6, v4, Ll/vgg0;->a:I

    .line 87
    .line 88
    if-eqz v6, :cond_1

    .line 89
    .line 90
    return-object v4

    .line 91
    :cond_1
    invoke-virtual {v5}, Ljava/io/File;->setReadOnly()Z

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    new-instance v6, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    const-string v7, "setReadOnlyResult:"

    .line 98
    .line 99
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v4, " path:"

    .line 106
    .line 107
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    const-string v5, "UTRealSudGameCoreManager"

    .line 122
    .line 123
    invoke-static {v5, v4}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    add-int/lit8 v3, v3, 0x1

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_2
    new-instance p0, Ll/vgg0;

    .line 130
    .line 131
    invoke-direct {p0}, Ll/vgg0;-><init>()V

    .line 132
    .line 133
    .line 134
    iput v2, p0, Ll/vgg0;->a:I

    .line 135
    .line 136
    const-string v0, "TechSudMGPGlobal.sp"

    .line 137
    .line 138
    invoke-static {v0}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    const-string v1, "key_fix_android14_read_only_unity"

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ll/kjg0;->e(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    return-object p0

    .line 148
    :cond_3
    :goto_1
    new-instance p0, Ll/vgg0;

    .line 149
    .line 150
    invoke-direct {p0}, Ll/vgg0;-><init>()V

    .line 151
    .line 152
    .line 153
    const/16 v0, -0x28a1

    .line 154
    .line 155
    iput v0, p0, Ll/vgg0;->a:I

    .line 156
    .line 157
    const-string v0, "The source directory when the copy runtime is empty"

    .line 158
    .line 159
    iput-object v0, p0, Ll/vgg0;->b:Ljava/lang/String;

    .line 160
    .line 161
    return-object p0
.end method

.method public final c(JLjava/lang/Object;Ll/isg0;)V
    .locals 0

    .line 1
    check-cast p3, Ll/jlg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/tog0;->a:Ll/olg0;

    .line 4
    .line 5
    invoke-virtual {p0, p3}, Ll/olg0;->d(Ll/jlg0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final d(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Ll/jlg0;

    .line 2
    .line 3
    return p0
.end method

.method public final e()Ll/vyg0;
    .locals 0

    .line 1
    sget-object p0, Ll/utg0;->e:Ll/i0h0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/i0h0;->c:Ll/gvg0;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/gvg0;->c:Ll/vyg0;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method
