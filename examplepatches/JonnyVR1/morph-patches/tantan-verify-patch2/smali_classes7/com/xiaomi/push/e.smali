.class final Lcom/xiaomi/push/e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/e$a;
    }
.end annotation


# direct methods
.method public static a(Ljava/lang/Exception;)Lcom/xiaomi/push/e$a;
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/xiaomi/push/e;->b(Ljava/lang/Exception;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p0, Lcom/xiaomi/push/fi;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object v0, p0

    .line 9
    check-cast v0, Lcom/xiaomi/push/fi;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/xiaomi/push/fi;->a()Ljava/lang/Throwable;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/xiaomi/push/fi;->a()Ljava/lang/Throwable;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_0
    new-instance v0, Lcom/xiaomi/push/e$a;

    .line 22
    .line 23
    invoke-direct {v0}, Lcom/xiaomi/push/e$a;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v3, ":"

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-static {p0}, Ll/w1r0;->a(Ljava/lang/Throwable;)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_2

    .line 77
    .line 78
    sget-object v2, Lcom/xiaomi/push/ei;->l:Lcom/xiaomi/push/ei;

    .line 79
    .line 80
    invoke-virtual {v2}, Lcom/xiaomi/push/ei;->a()I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    add-int/2addr v2, p0

    .line 85
    invoke-static {v2}, Lcom/xiaomi/push/ei;->a(I)Lcom/xiaomi/push/ei;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    iput-object p0, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 90
    .line 91
    :cond_2
    iget-object p0, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 92
    .line 93
    if-nez p0, :cond_3

    .line 94
    .line 95
    sget-object p0, Lcom/xiaomi/push/ei;->t:Lcom/xiaomi/push/ei;

    .line 96
    .line 97
    iput-object p0, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 98
    .line 99
    :cond_3
    iget-object p0, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 100
    .line 101
    sget-object v2, Lcom/xiaomi/push/ei;->t:Lcom/xiaomi/push/ei;

    .line 102
    .line 103
    if-ne p0, v2, :cond_4

    .line 104
    .line 105
    iput-object v1, v0, Lcom/xiaomi/push/e$a;->b:Ljava/lang/String;

    .line 106
    .line 107
    :cond_4
    return-object v0
.end method

.method private static b(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c(Ljava/lang/Exception;)Lcom/xiaomi/push/e$a;
    .locals 5

    .line 1
    invoke-static {p0}, Lcom/xiaomi/push/e;->b(Ljava/lang/Exception;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p0, Lcom/xiaomi/push/fi;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object v0, p0

    .line 9
    check-cast v0, Lcom/xiaomi/push/fi;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/xiaomi/push/fi;->a()Ljava/lang/Throwable;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/xiaomi/push/fi;->a()Ljava/lang/Throwable;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_0
    new-instance v0, Lcom/xiaomi/push/e$a;

    .line 22
    .line 23
    invoke-direct {v0}, Lcom/xiaomi/push/e$a;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    :cond_1
    invoke-static {p0}, Ll/w1r0;->a(Ljava/lang/Throwable;)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    new-instance v3, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v4, ":"

    .line 65
    .line 66
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    if-eqz v2, :cond_2

    .line 77
    .line 78
    sget-object v3, Lcom/xiaomi/push/ei;->v:Lcom/xiaomi/push/ei;

    .line 79
    .line 80
    invoke-virtual {v3}, Lcom/xiaomi/push/ei;->a()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    add-int/2addr v3, v2

    .line 85
    invoke-static {v3}, Lcom/xiaomi/push/ei;->a(I)Lcom/xiaomi/push/ei;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    iput-object v2, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 90
    .line 91
    sget-object v3, Lcom/xiaomi/push/ei;->G:Lcom/xiaomi/push/ei;

    .line 92
    .line 93
    if-ne v2, v3, :cond_3

    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    if-eqz p0, :cond_3

    .line 100
    .line 101
    instance-of p0, p0, Ljava/net/UnknownHostException;

    .line 102
    .line 103
    if-eqz p0, :cond_3

    .line 104
    .line 105
    sget-object p0, Lcom/xiaomi/push/ei;->F:Lcom/xiaomi/push/ei;

    .line 106
    .line 107
    iput-object p0, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    sget-object p0, Lcom/xiaomi/push/ei;->E:Lcom/xiaomi/push/ei;

    .line 111
    .line 112
    iput-object p0, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 113
    .line 114
    :cond_3
    :goto_0
    iget-object p0, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 115
    .line 116
    sget-object v2, Lcom/xiaomi/push/ei;->D:Lcom/xiaomi/push/ei;

    .line 117
    .line 118
    if-eq p0, v2, :cond_5

    .line 119
    .line 120
    sget-object v2, Lcom/xiaomi/push/ei;->E:Lcom/xiaomi/push/ei;

    .line 121
    .line 122
    if-eq p0, v2, :cond_5

    .line 123
    .line 124
    sget-object v2, Lcom/xiaomi/push/ei;->G:Lcom/xiaomi/push/ei;

    .line 125
    .line 126
    if-ne p0, v2, :cond_4

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_4
    return-object v0

    .line 130
    :cond_5
    :goto_1
    iput-object v1, v0, Lcom/xiaomi/push/e$a;->b:Ljava/lang/String;

    .line 131
    .line 132
    return-object v0
.end method

.method public static d(Ljava/lang/Exception;)Lcom/xiaomi/push/e$a;
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/xiaomi/push/e;->b(Ljava/lang/Exception;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p0, Lcom/xiaomi/push/fi;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object v0, p0

    .line 9
    check-cast v0, Lcom/xiaomi/push/fi;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/xiaomi/push/fi;->a()Ljava/lang/Throwable;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/xiaomi/push/fi;->a()Ljava/lang/Throwable;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_0
    new-instance v0, Lcom/xiaomi/push/e$a;

    .line 22
    .line 23
    invoke-direct {v0}, Lcom/xiaomi/push/e$a;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    :cond_1
    invoke-static {p0}, Ll/w1r0;->a(Ljava/lang/Throwable;)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    new-instance v3, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p0, ":"

    .line 65
    .line 66
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const/16 v3, 0x69

    .line 77
    .line 78
    if-eq v2, v3, :cond_6

    .line 79
    .line 80
    const/16 v3, 0xc7

    .line 81
    .line 82
    if-eq v2, v3, :cond_5

    .line 83
    .line 84
    const/16 v3, 0x1f3

    .line 85
    .line 86
    if-eq v2, v3, :cond_4

    .line 87
    .line 88
    const/16 v1, 0x6d

    .line 89
    .line 90
    if-eq v2, v1, :cond_3

    .line 91
    .line 92
    const/16 v1, 0x6e

    .line 93
    .line 94
    if-eq v2, v1, :cond_2

    .line 95
    .line 96
    sget-object v1, Lcom/xiaomi/push/ei;->P:Lcom/xiaomi/push/ei;

    .line 97
    .line 98
    iput-object v1, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_2
    sget-object v1, Lcom/xiaomi/push/ei;->N:Lcom/xiaomi/push/ei;

    .line 102
    .line 103
    iput-object v1, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_3
    sget-object v1, Lcom/xiaomi/push/ei;->M:Lcom/xiaomi/push/ei;

    .line 107
    .line 108
    iput-object v1, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_4
    sget-object v2, Lcom/xiaomi/push/ei;->R:Lcom/xiaomi/push/ei;

    .line 112
    .line 113
    iput-object v2, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 114
    .line 115
    const-string v2, "Terminal binding condition encountered: item-not-found"

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_7

    .line 122
    .line 123
    sget-object v1, Lcom/xiaomi/push/ei;->Q:Lcom/xiaomi/push/ei;

    .line 124
    .line 125
    iput-object v1, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_5
    sget-object v1, Lcom/xiaomi/push/ei;->O:Lcom/xiaomi/push/ei;

    .line 129
    .line 130
    iput-object v1, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_6
    sget-object v1, Lcom/xiaomi/push/ei;->L:Lcom/xiaomi/push/ei;

    .line 134
    .line 135
    iput-object v1, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 136
    .line 137
    :cond_7
    :goto_0
    iget-object v1, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 138
    .line 139
    sget-object v2, Lcom/xiaomi/push/ei;->O:Lcom/xiaomi/push/ei;

    .line 140
    .line 141
    if-eq v1, v2, :cond_9

    .line 142
    .line 143
    sget-object v2, Lcom/xiaomi/push/ei;->P:Lcom/xiaomi/push/ei;

    .line 144
    .line 145
    if-eq v1, v2, :cond_9

    .line 146
    .line 147
    sget-object v2, Lcom/xiaomi/push/ei;->R:Lcom/xiaomi/push/ei;

    .line 148
    .line 149
    if-ne v1, v2, :cond_8

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_8
    return-object v0

    .line 153
    :cond_9
    :goto_1
    iput-object p0, v0, Lcom/xiaomi/push/e$a;->b:Ljava/lang/String;

    .line 154
    .line 155
    return-object v0
.end method

.method public static e(Ljava/lang/Exception;)Lcom/xiaomi/push/e$a;
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/xiaomi/push/e;->b(Ljava/lang/Exception;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p0, Lcom/xiaomi/push/fi;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object v0, p0

    .line 9
    check-cast v0, Lcom/xiaomi/push/fi;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/xiaomi/push/fi;->a()Ljava/lang/Throwable;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/xiaomi/push/fi;->a()Ljava/lang/Throwable;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_0
    new-instance v0, Lcom/xiaomi/push/e$a;

    .line 22
    .line 23
    invoke-direct {v0}, Lcom/xiaomi/push/e$a;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {p0}, Ll/w1r0;->a(Ljava/lang/Throwable;)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    new-instance v3, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string p0, ":"

    .line 51
    .line 52
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const/16 v3, 0x69

    .line 63
    .line 64
    if-eq v2, v3, :cond_5

    .line 65
    .line 66
    const/16 v3, 0xc7

    .line 67
    .line 68
    if-eq v2, v3, :cond_4

    .line 69
    .line 70
    const/16 v3, 0x1f3

    .line 71
    .line 72
    if-eq v2, v3, :cond_3

    .line 73
    .line 74
    const/16 v1, 0x6d

    .line 75
    .line 76
    if-eq v2, v1, :cond_2

    .line 77
    .line 78
    const/16 v1, 0x6e

    .line 79
    .line 80
    if-eq v2, v1, :cond_1

    .line 81
    .line 82
    sget-object v1, Lcom/xiaomi/push/ei;->ab:Lcom/xiaomi/push/ei;

    .line 83
    .line 84
    iput-object v1, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    sget-object v1, Lcom/xiaomi/push/ei;->Z:Lcom/xiaomi/push/ei;

    .line 88
    .line 89
    iput-object v1, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    sget-object v1, Lcom/xiaomi/push/ei;->Y:Lcom/xiaomi/push/ei;

    .line 93
    .line 94
    iput-object v1, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    sget-object v2, Lcom/xiaomi/push/ei;->ad:Lcom/xiaomi/push/ei;

    .line 98
    .line 99
    iput-object v2, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 100
    .line 101
    const-string v2, "Terminal binding condition encountered: item-not-found"

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_6

    .line 108
    .line 109
    sget-object v1, Lcom/xiaomi/push/ei;->ac:Lcom/xiaomi/push/ei;

    .line 110
    .line 111
    iput-object v1, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_4
    sget-object v1, Lcom/xiaomi/push/ei;->aa:Lcom/xiaomi/push/ei;

    .line 115
    .line 116
    iput-object v1, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_5
    sget-object v1, Lcom/xiaomi/push/ei;->X:Lcom/xiaomi/push/ei;

    .line 120
    .line 121
    iput-object v1, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 122
    .line 123
    :cond_6
    :goto_0
    iget-object v1, v0, Lcom/xiaomi/push/e$a;->a:Lcom/xiaomi/push/ei;

    .line 124
    .line 125
    sget-object v2, Lcom/xiaomi/push/ei;->aa:Lcom/xiaomi/push/ei;

    .line 126
    .line 127
    if-eq v1, v2, :cond_8

    .line 128
    .line 129
    sget-object v2, Lcom/xiaomi/push/ei;->ab:Lcom/xiaomi/push/ei;

    .line 130
    .line 131
    if-eq v1, v2, :cond_8

    .line 132
    .line 133
    sget-object v2, Lcom/xiaomi/push/ei;->ad:Lcom/xiaomi/push/ei;

    .line 134
    .line 135
    if-ne v1, v2, :cond_7

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_7
    return-object v0

    .line 139
    :cond_8
    :goto_1
    iput-object p0, v0, Lcom/xiaomi/push/e$a;->b:Ljava/lang/String;

    .line 140
    .line 141
    return-object v0
.end method
