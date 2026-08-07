.class public final Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;
.super Lcom/tantanapp/sharelib/workmanager/Worker;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0008\u0010\u000e\u001a\u00020\u000fH\u0016R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;",
        "Lcom/tantanapp/sharelib/workmanager/Worker;",
        "appContext",
        "Landroid/content/Context;",
        "info",
        "Lcom/tantanapp/sharelib/workmanager/WorkInfo;",
        "(Landroid/content/Context;Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V",
        "abi",
        "",
        "baseDir",
        "downloadInfoList",
        "",
        "Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;",
        "module",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field private final abi:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final baseDir:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final downloadInfoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final module:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V
    .locals 1
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
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string p2, "key_base_dir"

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Lcom/tantanapp/sharelib/workmanager/Data;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->baseDir:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string p2, "key_module"

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Lcom/tantanapp/sharelib/workmanager/Data;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->module:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string p2, "key_abi"

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Lcom/tantanapp/sharelib/workmanager/Data;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->abi:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInput()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    new-instance p2, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v0, "key_download_info_list"

    .line 56
    .line 57
    invoke-virtual {p1, v0, p2}, Lcom/tantanapp/sharelib/workmanager/Data;->c(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Ljava/util/List;

    .line 62
    .line 63
    iput-object p1, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->downloadInfoList:Ljava/util/List;

    .line 64
    .line 65
    return-void
.end method


# virtual methods
.method public doWork()Lcom/tantanapp/sharelib/workmanager/Result;
    .locals 6
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->baseDir:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->module:Ljava/lang/String;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    :goto_0
    sget-object v0, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 19
    .line 20
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v2, "baseDir or module is empty, baseDie: "

    .line 23
    .line 24
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->baseDir:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v2, ", module: "

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->module:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->a(Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_1
    new-instance v0, Ljava/io/File;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->baseDir:Ljava/lang/String;

    .line 54
    .line 55
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-nez v1, :cond_2

    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_2

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInfo()Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->a()Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/Constraints;->f()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_2

    .line 83
    .line 84
    sget-object p0, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->c()Lcom/tantanapp/sharelib/workmanager/Result$Retry;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_2
    new-instance v0, Ljava/io/File;

    .line 92
    .line 93
    iget-object v1, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->baseDir:Ljava/lang/String;

    .line 94
    .line 95
    iget-object v2, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->module:Ljava/lang/String;

    .line 96
    .line 97
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_3

    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-nez v1, :cond_3

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getInfo()Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v1}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->a()Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v1}, Lcom/tantanapp/sharelib/workmanager/Constraints;->f()Z

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    if-eqz v1, :cond_3

    .line 125
    .line 126
    sget-object p0, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->c()Lcom/tantanapp/sharelib/workmanager/Result$Retry;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    return-object p0

    .line 133
    :cond_3
    iget-object v1, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->downloadInfoList:Ljava/util/List;

    .line 134
    .line 135
    check-cast v1, Ljava/util/Collection;

    .line 136
    .line 137
    if-eqz v1, :cond_8

    .line 138
    .line 139
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_4

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_4
    iget-object v1, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->downloadInfoList:Ljava/util/List;

    .line 147
    .line 148
    check-cast v1, Ljava/lang/Iterable;

    .line 149
    .line 150
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    :cond_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    if-eqz v2, :cond_6

    .line 159
    .line 160
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    move-object v3, v2

    .line 165
    check-cast v3, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 166
    .line 167
    iget-object v4, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->abi:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {v3}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getAbi()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v5

    .line 173
    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v4

    .line 177
    if-eqz v4, :cond_5

    .line 178
    .line 179
    iget-object v4, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->module:Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {v3}, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;->getModule()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    invoke-static {v4, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v3

    .line 189
    if-eqz v3, :cond_5

    .line 190
    .line 191
    goto :goto_1

    .line 192
    :cond_6
    const/4 v2, 0x0

    .line 193
    :goto_1
    check-cast v2, Lcom/tantanapp/common/nativelib/manager/bean/ZipFileInfo;

    .line 194
    .line 195
    if-nez v2, :cond_7

    .line 196
    .line 197
    sget-object v0, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 198
    .line 199
    new-instance v1, Ljava/lang/StringBuilder;

    .line 200
    .line 201
    const-string v2, "Target zip file info not found: "

    .line 202
    .line 203
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    iget-object v2, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->module:Ljava/lang/String;

    .line 207
    .line 208
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    const-string v2, ", "

    .line 212
    .line 213
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    iget-object p0, p0, Lcom/tantanapp/common/nativelib/manager/worker/StarterWorker;->abi:Ljava/lang/String;

    .line 217
    .line 218
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-virtual {v0, p0}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->a(Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    return-object p0

    .line 230
    :cond_7
    new-instance p0, Lcom/tantanapp/sharelib/workmanager/Result$Success;

    .line 231
    .line 232
    new-instance v1, Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 233
    .line 234
    invoke-direct {v1}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;-><init>()V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 242
    .line 243
    .line 244
    const-string v3, "key_module_path"

    .line 245
    .line 246
    invoke-virtual {v1, v3, v0}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->e(Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    const-string v1, "key_download_info"

    .line 251
    .line 252
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->d(Ljava/lang/String;Ljava/lang/Object;)Lcom/tantanapp/sharelib/workmanager/Data$Builder;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/Data$Builder;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    invoke-direct {p0, v0}, Lcom/tantanapp/sharelib/workmanager/Result$Success;-><init>(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 261
    .line 262
    .line 263
    return-object p0

    .line 264
    :cond_8
    :goto_2
    sget-object p0, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 265
    .line 266
    const-string v0, "Download Info is Empty"

    .line 267
    .line 268
    invoke-virtual {p0, v0}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->a(Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    return-object p0
.end method
