.class public Ll/frw;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/String;

.field private c:Z

.field protected d:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/frw;->c:Z

    .line 6
    .line 7
    sget-object v0, Lcom/immomo/mwc/sdk/MWCEngine$CodeType;->BINARY:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 8
    .line 9
    iput-object v0, p0, Ll/frw;->d:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/frw;->e:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "0.0.0.0"

    .line 15
    .line 16
    iput-object v1, p0, Ll/frw;->f:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p1, p0, Ll/frw;->a:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p2, p0, Ll/frw;->b:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-nez p2, :cond_0

    .line 27
    .line 28
    const-string p2, "0"

    .line 29
    .line 30
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    invoke-direct {p0}, Ll/frw;->h()V

    .line 37
    .line 38
    .line 39
    :cond_0
    invoke-virtual {p0}, Ll/frw;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string p1, "MWCMkConfig"

    .line 48
    .line 49
    const-string p2, "[\u9879\u76ee\u914d\u7f6e\u9879\u89e3\u6790\u7ed3\u679c] %s"

    .line 50
    .line 51
    invoke-static {p1, v0, p2, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p0, ":"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static c(Ljava/lang/String;Lcom/immomo/mwc/sdk/MWCEngine$CodeType;)Ljava/io/File;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/MWCEngine$CodeType;->BINARY:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const-string p1, "service-worker.bin"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p1, "service-worker.js"

    .line 9
    .line 10
    :goto_0
    new-instance v0, Ljava/io/File;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public static f()Z
    .locals 3

    .line 1
    invoke-static {}, Ll/ikw;->b()Ll/ikw;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "kv:bool:mwc:getWebConfig:mk_config.serviceWorker"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Ll/ikw;->c(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    return v0
.end method

.method private static g(Ljava/lang/String;)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/ikw;->b()Ll/ikw;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "kv:bool:mwc:getWebConfig:mk_config.swBlackList"

    .line 6
    .line 7
    const-string v2, "[]"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/ikw;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "\""

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const/16 p0, 0x22

    .line 24
    .line 25
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0
.end method

.method private h()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/hellogroup/fep/base/core/FepManager;->z()Lcom/hellogroup/fep/base/core/FepManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/frw;->b:Ljava/lang/String;

    .line 6
    .line 7
    sget-object v2, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->LOCAL_ONLY:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/hellogroup/fep/base/core/FepManager;->l(Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/zgi;->f()Lcom/hellogroup/fep/feppkg/model/FepPackageConfig;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/zgi;->f()Lcom/hellogroup/fep/feppkg/model/FepPackageConfig;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Lcom/hellogroup/fep/feppkg/model/FepPackageConfig;->getVersionStr()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_0

    .line 34
    .line 35
    iput-object v1, p0, Ll/frw;->f:Ljava/lang/String;

    .line 36
    .line 37
    :cond_0
    iget-object v1, p0, Ll/frw;->a:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1}, Ll/tqw;->a(Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const/4 v2, 0x0

    .line 44
    const-string v3, "MWCMkConfig"

    .line 45
    .line 46
    const/4 v4, 0x1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    iput-boolean v4, p0, Ll/frw;->c:Z

    .line 50
    .line 51
    sget-object v0, Lcom/immomo/mwc/sdk/MWCEngine$CodeType;->JS:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 52
    .line 53
    iput-object v0, p0, Ll/frw;->d:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 54
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v1, "fdt-debug://"

    .line 58
    .line 59
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Ll/frw;->a:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v1, "/service-worker.js"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, p0, Ll/frw;->e:Ljava/lang/String;

    .line 77
    .line 78
    const-string v0, "0.0.0.0"

    .line 79
    .line 80
    iput-object v0, p0, Ll/frw;->f:Ljava/lang/String;

    .line 81
    .line 82
    iget-object p0, p0, Ll/frw;->a:Ljava/lang/String;

    .line 83
    .line 84
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const-string v0, "[\u542f\u7528FDT\u8c03\u8bd5\u6a21\u5f0f\u4e0b\u7684\u914d\u7f6e] @bid=%s"

    .line 89
    .line 90
    invoke-static {v3, v2, v0, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_1
    iget-object v1, p0, Ll/frw;->a:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v1}, Ll/frw;->g(Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-eqz v1, :cond_2

    .line 101
    .line 102
    const/4 v0, 0x0

    .line 103
    iput-boolean v0, p0, Ll/frw;->c:Z

    .line 104
    .line 105
    iget-object p0, p0, Ll/frw;->a:Ljava/lang/String;

    .line 106
    .line 107
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    const-string v0, "[\u8be5\u9879\u76ee\u547d\u4e2d\u9ed1\u540d\u5355\u7b56\u7565] @bid=%s"

    .line 112
    .line 113
    invoke-static {v3, v2, v0, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_2
    invoke-direct {p0}, Ll/frw;->m()Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_4

    .line 122
    .line 123
    invoke-direct {p0}, Ll/frw;->l()Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_3

    .line 128
    .line 129
    sget-object v1, Lcom/immomo/mwc/sdk/MWCEngine$CodeType;->BINARY:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_3
    sget-object v1, Lcom/immomo/mwc/sdk/MWCEngine$CodeType;->JS:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 133
    .line 134
    :goto_0
    iput-object v1, p0, Ll/frw;->d:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 135
    .line 136
    if-eqz v0, :cond_4

    .line 137
    .line 138
    invoke-virtual {v0}, Ll/zgi;->i()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iget-object v1, p0, Ll/frw;->d:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 143
    .line 144
    invoke-static {v0, v1}, Ll/frw;->c(Ljava/lang/String;Lcom/immomo/mwc/sdk/MWCEngine$CodeType;)Ljava/io/File;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    if-eqz v0, :cond_4

    .line 149
    .line 150
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-eqz v1, :cond_4

    .line 155
    .line 156
    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-eqz v1, :cond_4

    .line 161
    .line 162
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    iput-object v0, p0, Ll/frw;->e:Ljava/lang/String;

    .line 167
    .line 168
    iput-boolean v4, p0, Ll/frw;->c:Z

    .line 169
    .line 170
    :cond_4
    return-void
.end method

.method public static j(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 1
    const-string v0, "serviceWorker"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "1"

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ll/frw;->n(Z)Z

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string v0, "swBlackList"

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Ll/frw;->q(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public static k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    const-string v0, "0"

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v1, "serviceWorker"

    .line 17
    .line 18
    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    const-string p1, "1"

    .line 25
    .line 26
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-static {p0, p1}, Ll/frw;->p(Ljava/lang/String;Z)Z

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    const-string v1, "byteCode"

    .line 39
    .line 40
    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    xor-int/lit8 p1, p1, 0x1

    .line 55
    .line 56
    invoke-static {p0, p1}, Ll/frw;->o(Ljava/lang/String;Z)Z

    .line 57
    .line 58
    .line 59
    :cond_2
    :goto_0
    return-void
.end method

.method private l()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/ikw;->b()Ll/ikw;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "kv:bool:mwc:checkupdate:mk_config.byteCode"

    .line 6
    .line 7
    iget-object p0, p0, Ll/frw;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, p0}, Ll/frw;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, p0, v1}, Ll/ikw;->c(Ljava/lang/String;Z)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private m()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/ikw;->b()Ll/ikw;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "kv:bool:mwc:checkupdate:mk_config.serviceWorker"

    .line 6
    .line 7
    iget-object p0, p0, Ll/frw;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, p0}, Ll/frw;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, p0, v1}, Ll/ikw;->c(Ljava/lang/String;Z)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private static n(Z)Z
    .locals 5

    .line 1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "kv:bool:mwc:getWebConfig:mk_config.serviceWorker"

    .line 6
    .line 7
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v2, "MWCMkConfig"

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    const-string v4, "update:global:kv @key=%s, @value=%b"

    .line 15
    .line 16
    invoke-static {v2, v3, v4, v0}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/ikw;->b()Ll/ikw;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, v1, p0}, Ll/ikw;->h(Ljava/lang/String;Z)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method private static o(Ljava/lang/String;Z)Z
    .locals 4

    .line 1
    const-string v0, "kv:bool:mwc:checkupdate:mk_config.byteCode"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/frw;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "MWCMkConfig"

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    const-string v3, "update:project:kv @key=%s, @value=%b"

    .line 19
    .line 20
    invoke-static {v1, v2, v3, v0}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/ikw;->b()Ll/ikw;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0, p0, p1}, Ll/ikw;->h(Ljava/lang/String;Z)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method private static p(Ljava/lang/String;Z)Z
    .locals 4

    .line 1
    const-string v0, "kv:bool:mwc:checkupdate:mk_config.serviceWorker"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/frw;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "MWCMkConfig"

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    const-string v3, "update:project:kv @key=%s, @value=%b"

    .line 19
    .line 20
    invoke-static {v1, v2, v3, v0}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/ikw;->b()Ll/ikw;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0, p0, p1}, Ll/ikw;->h(Ljava/lang/String;Z)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method private static q(Ljava/lang/String;)Z
    .locals 5

    .line 1
    const-string v0, "update:global:kv @key=%s, @value=%s"

    .line 2
    .line 3
    const-string v1, "kv:bool:mwc:getWebConfig:mk_config.swBlackList"

    .line 4
    .line 5
    filled-new-array {v1, p0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string v3, "MWCMkConfig"

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    invoke-static {v3, v4, v0, v2}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/ikw;->b()Ll/ikw;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, v1, p0}, Ll/ikw;->g(Ljava/lang/String;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method


# virtual methods
.method public b()Lcom/immomo/mwc/sdk/MWCEngine$CodeType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/frw;->d:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/frw;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/frw;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/frw;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "MWCMkConfig{bid=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/frw;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', enabled="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean v1, p0, Ll/frw;->c:Z

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", codeType="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/frw;->d:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", serviceWorkerLocalPath=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Ll/frw;->e:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', version=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/frw;->f:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p0, "\'}"

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
