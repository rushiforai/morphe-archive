.class public final Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileCheckWorker;
.super Lcom/tantanapp/sharelib/workmanager/Worker;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0008\u0010\u0007\u001a\u00020\u0008H\u0016\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/tantanapp/common/nativelib/manager/worker/obb/ObbFileCheckWorker;",
        "Lcom/tantanapp/sharelib/workmanager/Worker;",
        "appContext",
        "Landroid/content/Context;",
        "workInfo",
        "Lcom/tantanapp/sharelib/workmanager/WorkInfo;",
        "(Landroid/content/Context;Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V",
        "doWork",
        "Lcom/tantanapp/sharelib/workmanager/Result;",
        "sharedlibrarymanager_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantanapp/sharelib/workmanager/WorkInfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lcom/tantanapp/sharelib/workmanager/Worker;-><init>(Landroid/content/Context;Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public doWork()Lcom/tantanapp/sharelib/workmanager/Result;
    .locals 7
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->Companion:Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo$Companion;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo$Companion;->getEMPTY()Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const-string v3, "key_download_info"

    .line 12
    .line 13
    invoke-virtual {v0, v3, v2}, Lcom/tantanapp/sharelib/workmanager/Data;->c(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, "key_module"

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Lcom/tantanapp/sharelib/workmanager/Data;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    const-string v4, "key_base_dir"

    .line 34
    .line 35
    invoke-virtual {v3, v4}, Lcom/tantanapp/sharelib/workmanager/Data;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    new-instance v4, Ljava/io/File;

    .line 40
    .line 41
    invoke-direct {v4, v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo$Companion;->getEMPTY()Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    sget-object p0, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 59
    .line 60
    const-string v0, "Target obb file info is empty"

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->a(Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0

    .line 67
    :cond_0
    new-instance v1, Ljava/io/File;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getAppContext()Landroid/content/Context;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v3}, Landroid/content/Context;->getObbDir()Ljava/io/File;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v0}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getName()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-direct {v1, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    const-string v4, ""

    .line 89
    .line 90
    const/4 v5, 0x1

    .line 91
    if-eqz v3, :cond_1

    .line 92
    .line 93
    invoke-static {v1}, Ll/o1m;->g(Ljava/io/File;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-virtual {v0}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getMd5()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v6

    .line 101
    invoke-static {v3, v6, v5}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    if-eqz v3, :cond_1

    .line 106
    .line 107
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    goto :goto_0

    .line 112
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 113
    .line 114
    .line 115
    move-object v1, v4

    .line 116
    :goto_0
    new-instance v3, Ljava/io/File;

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getName()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    invoke-direct {v3, v2, v6}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    if-eqz v6, :cond_2

    .line 130
    .line 131
    invoke-static {v3}, Ll/o1m;->g(Ljava/io/File;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v6

    .line 135
    invoke-virtual {v0}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getMd5()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {v6, v0, v5}, Lkotlin/text/d;->x(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_2

    .line 144
    .line 145
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    :cond_2
    new-instance v0, Lcom/tantanapp/sharelib/workmanager/Result$Success;

    .line 150
    .line 151
    new-instance v3, Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 152
    .line 153
    invoke-direct {v3}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 157
    .line 158
    .line 159
    const-string v5, "key_module_path"

    .line 160
    .line 161
    invoke-virtual {v3, v5, v2}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->e(Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 166
    .line 167
    .line 168
    const-string v3, "key_obb_file_path"

    .line 169
    .line 170
    invoke-virtual {v2, v3, v4}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->d(Ljava/lang/String;Ljava/lang/Object;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 175
    .line 176
    .line 177
    const-string v3, "key_file_path"

    .line 178
    .line 179
    invoke-virtual {v2, v3, v1}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->d(Ljava/lang/String;Ljava/lang/Object;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-virtual {v1, p0}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->c(Lcom/tantanapp/sharelib/workmanager/Data;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    invoke-direct {v0, p0}, Lcom/tantanapp/sharelib/workmanager/Result$Success;-><init>(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 196
    .line 197
    .line 198
    return-object v0
.end method
