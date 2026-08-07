.class final Ll/fuq0$a;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fuq0;->d(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field a:Z

.field final synthetic b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fuq0$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/fuq0$a;->a:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    invoke-static {}, Ll/fuq0;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/fuq0$a;->b:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Ll/fuq0;->f(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_3

    .line 11
    .line 12
    const-string v0, "updateSo"

    .line 13
    .line 14
    iget-object v1, p0, Ll/fuq0$a;->b:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/h5r0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ljava/io/File;

    .line 20
    .line 21
    iget-object v1, p0, Ll/fuq0$a;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1}, Ll/fuq0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 44
    .line 45
    .line 46
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v2, "doUnpackLibrary: "

    .line 49
    .line 50
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Ll/fuq0$a;->b:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-static {v1}, Ll/q5r0;->b(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :try_start_0
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iget-object v2, p0, Ll/fuq0$a;->b:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v1, v2, v0}, Ll/jwq0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    goto :goto_0

    .line 76
    :catchall_0
    move-exception v1

    .line 77
    const-string v2, "updateSoError"

    .line 78
    .line 79
    iget-object v3, p0, Ll/fuq0$a;->b:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v2, v3}, Ll/h5r0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 85
    .line 86
    .line 87
    const-string v2, "NPTH_CATCH"

    .line 88
    .line 89
    invoke-static {v2, v1}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    const/4 v1, 0x0

    .line 93
    :goto_0
    if-nez v1, :cond_1

    .line 94
    .line 95
    invoke-static {}, Ll/fuq0;->e()Ljava/util/HashMap;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const-string v2, "0.0.2"

    .line 104
    .line 105
    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    :try_start_1
    new-instance v0, Ljava/io/File;

    .line 109
    .line 110
    iget-object v1, p0, Ll/fuq0$a;->b:Ljava/lang/String;

    .line 111
    .line 112
    invoke-static {v1}, Ll/fuq0;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    const/4 v1, 0x0

    .line 120
    invoke-static {v0, v2, v1}, Ll/r3r0;->j(Ljava/io/File;Ljava/lang/String;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 121
    .line 122
    .line 123
    :catchall_1
    const-string v0, "updateSoSuccess"

    .line 124
    .line 125
    :goto_1
    iget-object p0, p0, Ll/fuq0$a;->b:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {v0, p0}, Ll/h5r0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_1
    iget-boolean v0, p0, Ll/fuq0$a;->a:Z

    .line 132
    .line 133
    if-nez v0, :cond_2

    .line 134
    .line 135
    const/4 v0, 0x1

    .line 136
    iput-boolean v0, p0, Ll/fuq0$a;->a:Z

    .line 137
    .line 138
    const-string v0, "updateSoPostRetry"

    .line 139
    .line 140
    iget-object v1, p0, Ll/fuq0$a;->b:Ljava/lang/String;

    .line 141
    .line 142
    invoke-static {v0, v1}, Ll/h5r0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    const-wide/16 v1, 0xbb8

    .line 150
    .line 151
    invoke-virtual {v0, p0, v1, v2}, Ll/r5r0;->f(Ljava/lang/Runnable;J)Z

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_2
    const-string v0, "updateSoFailed"

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_3
    :goto_2
    return-void
.end method
