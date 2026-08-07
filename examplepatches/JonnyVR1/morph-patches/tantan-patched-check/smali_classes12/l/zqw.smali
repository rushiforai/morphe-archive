.class public Ll/zqw;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zqw$d;
    }
.end annotation


# static fields
.field public static a:Ljava/lang/String; = "MWCFactory"

.field private static final b:Ll/ehi;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/zqw$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zqw$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/zqw;->b:Ll/ehi;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a()Ll/ehi;
    .locals 1

    .line 1
    sget-object v0, Ll/zqw;->b:Ll/ehi;

    .line 2
    .line 3
    return-object v0
.end method

.method public static b()Ll/xqw$b;
    .locals 2

    .line 1
    new-instance v0, Ll/xqw$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xqw$b;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/erw;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/erw;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/xqw$b;->n(Ll/uzv;)Ll/xqw$b;

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/grw;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/grw;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/xqw$b;->l(Ll/iml;)Ll/xqw$b;

    .line 20
    .line 21
    .line 22
    new-instance v1, Ll/zse0;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/zse0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/xqw$b;->p(Ll/yse0;)Ll/xqw$b;

    .line 28
    .line 29
    .line 30
    new-instance v1, Ll/crw;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/crw;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/xqw$b;->m(Ll/krq;)Ll/xqw$b;

    .line 36
    .line 37
    .line 38
    new-instance v1, Ll/llw;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/llw;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ll/xqw$b;->o(Ll/klw;)Ll/xqw$b;

    .line 44
    .line 45
    .line 46
    return-object v0
.end method

.method public static c(Ll/brw;)Ll/arw;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ll/brw;->d()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->I()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-nez v2, :cond_3

    .line 14
    .line 15
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v2, :cond_3

    .line 20
    .line 21
    invoke-static {v1}, Ll/zqw;->f(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-virtual {p0}, Ll/brw;->f()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/brw;->c()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {p0}, Ll/brw;->e()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {v2, p0}, Ll/zqw;->g(Ljava/lang/String;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_3

    .line 47
    .line 48
    new-instance v0, Ll/arw;

    .line 49
    .line 50
    invoke-direct {v0, v2, p0, v1}, Ll/arw;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-object v0

    .line 54
    :cond_2
    invoke-virtual {p0}, Ll/brw;->g()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_3

    .line 59
    .line 60
    invoke-static {v1}, Ll/zqw;->j(Ljava/lang/String;)Ll/zqw$d;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    if-eqz p0, :cond_3

    .line 65
    .line 66
    iget-object v2, p0, Ll/zqw$d;->a:Ljava/lang/String;

    .line 67
    .line 68
    iget-object p0, p0, Ll/zqw$d;->b:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v2, p0}, Ll/zqw;->g(Ljava/lang/String;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eqz v3, :cond_3

    .line 75
    .line 76
    new-instance v0, Ll/arw;

    .line 77
    .line 78
    invoke-direct {v0, v2, p0, v1}, Ll/arw;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    :goto_0
    return-object v0
.end method

.method public static d(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/zqw;->e(Landroid/content/Context;Ll/xqw;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static e(Landroid/content/Context;Ll/xqw;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-static {}, Ll/frw;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Lcom/immomo/mwc/sdk/MWCEngine;->N(Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->J()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {}, Ll/zqw;->b()Ll/xqw$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ll/xqw$b;->k()Ll/xqw;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :goto_0
    invoke-static {p0, p1}, Lcom/immomo/mwc/sdk/MWCEngine;->E(Landroid/content/Context;Ll/xqw;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/zqw;->i()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    sget-object p0, Ll/zqw;->a:Ljava/lang/String;

    .line 33
    .line 34
    const-string p1, "[Web\u5bb9\u5668\u672a\u521d\u59cb\u5316: \u5168\u5c40\u914d\u7f6e\u5f00\u5173\u672a\u5f00\u542f\uff0c\u8bf7\u68c0\u67e5getWebConfig\u63a5\u53e3]"

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-static {p0, v0, p1}, Lcom/immomo/mwc/sdk/MWCEngine;->P(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    sget-object p1, Ll/zqw;->a:Ljava/lang/String;

    .line 43
    .line 44
    const-string v0, ""

    .line 45
    .line 46
    invoke-static {p1, v0, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static f(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    return v1

    .line 9
    :cond_0
    const-string v0, "https://passport.immomo.com/authorize?redirect_uri="

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    const-string v0, "https://www.immomo.com/checkurl/?url="

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return v1

    .line 27
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 28
    return p0
.end method

.method public static g(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static h()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->L()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private static i()V
    .locals 3

    .line 1
    sget-object v0, Ll/zqw;->a:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "prepareJsfPackage ... "

    .line 5
    .line 6
    invoke-static {v0, v1, v2}, Lcom/immomo/mwc/sdk/MWCEngine;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/hellogroup/fep/base/core/FepManager;->z()Lcom/hellogroup/fep/base/core/FepManager;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Ll/zqw;->b:Ll/ehi;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/hellogroup/fep/base/core/FepManager;->v(Ll/ehi;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/hellogroup/fep/base/core/FepManager;->z()Lcom/hellogroup/fep/base/core/FepManager;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "https://g.immomo.com/fep/momo/m-fes-sdk/mwc-js-sdk/mwc-jsf.js?_bid=1002065"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/hellogroup/fep/base/core/FepManager;->k(Ljava/lang/String;)Ll/zgi;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private static j(Ljava/lang/String;)Ll/zqw$d;
    .locals 10
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Ll/hrw;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/a6k0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-nez v1, :cond_3

    .line 14
    .line 15
    const-string v1, "0"

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    goto/16 :goto_1

    .line 24
    .line 25
    :cond_0
    :try_start_0
    new-instance v1, Ll/frw;

    .line 26
    .line 27
    invoke-direct {v1, v0, p0}, Ll/frw;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ll/frw;->i()Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-nez v3, :cond_1

    .line 35
    .line 36
    sget-object v1, Ll/zqw;->a:Ljava/lang/String;

    .line 37
    .line 38
    const-string v3, "startWorker project:%s serviceWorker disabled, @url=%s"

    .line 39
    .line 40
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-static {v1, v2, v3, v4}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    return-object v2

    .line 48
    :catch_0
    move-exception v1

    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :cond_1
    invoke-virtual {v1}, Ll/frw;->d()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-eqz v4, :cond_2

    .line 60
    .line 61
    sget-object v3, Ll/zqw;->a:Ljava/lang/String;

    .line 62
    .line 63
    const-string v4, "startWorker no local service-worker.%s file found for project:%s @codeType=%s"

    .line 64
    .line 65
    iget-object v5, v1, Ll/frw;->d:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 66
    .line 67
    invoke-virtual {v5}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    iget-object v1, v1, Ll/frw;->d:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 72
    .line 73
    filled-new-array {v5, v0, v1}, [Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v3, v2, v4, v1}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    return-object v2

    .line 81
    :cond_2
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    invoke-static {}, Ll/zqw;->h()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    invoke-virtual {v1}, Ll/frw;->e()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    new-instance v7, Lorg/json/JSONObject;

    .line 94
    .line 95
    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 96
    .line 97
    .line 98
    const-string v8, "url"

    .line 99
    .line 100
    invoke-virtual {v7, v8, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 101
    .line 102
    .line 103
    const-string v8, "versionStr"

    .line 104
    .line 105
    invoke-virtual {v7, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 106
    .line 107
    .line 108
    const-string v8, "platform"

    .line 109
    .line 110
    const-string v9, "android"

    .line 111
    .line 112
    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 113
    .line 114
    .line 115
    new-instance v8, Lcom/immomo/mwc/sdk/c;

    .line 116
    .line 117
    invoke-direct {v8}, Lcom/immomo/mwc/sdk/c;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v8, v4}, Lcom/immomo/mwc/sdk/c;->m(Ljava/lang/String;)Lcom/immomo/mwc/sdk/c;

    .line 121
    .line 122
    .line 123
    move-result-object v8

    .line 124
    invoke-virtual {v8, v5}, Lcom/immomo/mwc/sdk/c;->q(Ljava/lang/String;)Lcom/immomo/mwc/sdk/c;

    .line 125
    .line 126
    .line 127
    move-result-object v8

    .line 128
    invoke-virtual {v1}, Ll/frw;->b()Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v8, v1}, Lcom/immomo/mwc/sdk/c;->k(Lcom/immomo/mwc/sdk/MWCEngine$CodeType;)Lcom/immomo/mwc/sdk/c;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v1, v3}, Lcom/immomo/mwc/sdk/c;->n(Ljava/lang/String;)Lcom/immomo/mwc/sdk/c;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-virtual {v1, v7}, Lcom/immomo/mwc/sdk/c;->l(Lorg/json/JSONObject;)Lcom/immomo/mwc/sdk/c;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-virtual {v1, p0}, Lcom/immomo/mwc/sdk/c;->o(Ljava/lang/String;)Lcom/immomo/mwc/sdk/c;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v1, v6}, Lcom/immomo/mwc/sdk/c;->p(Ljava/lang/String;)Lcom/immomo/mwc/sdk/c;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->q()Ll/byl;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    new-instance v6, Ll/zqw$c;

    .line 157
    .line 158
    invoke-direct {v6, v5}, Ll/zqw$c;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-interface {v3, v1, v6}, Ll/byl;->d(Lcom/immomo/mwc/sdk/c;Ll/ro5;)Ll/byl;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    sget-object v3, Lcom/immomo/mwc/sdk/EventType;->MK_CREATE:Lcom/immomo/mwc/sdk/EventType;

    .line 166
    .line 167
    new-instance v6, Ll/zqw$b;

    .line 168
    .line 169
    invoke-direct {v6, v5}, Ll/zqw$b;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-interface {v1, v3, v5, v7, v6}, Ll/byl;->b(Lcom/immomo/mwc/sdk/EventType;Ljava/lang/String;Lorg/json/JSONObject;Ll/z84;)V

    .line 173
    .line 174
    .line 175
    new-instance v1, Ll/zqw$d;

    .line 176
    .line 177
    invoke-direct {v1, v4, v5, v2}, Ll/zqw$d;-><init>(Ljava/lang/String;Ljava/lang/String;Ll/zqw$a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    .line 179
    .line 180
    return-object v1

    .line 181
    :goto_0
    sget-object v3, Ll/zqw;->a:Ljava/lang/String;

    .line 182
    .line 183
    const-string v4, "startWorker error @bid=%s, @url=%s, @error=%s"

    .line 184
    .line 185
    filled-new-array {v0, p0, v1}, [Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-static {v3, v2, v4, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    return-object v2

    .line 193
    :cond_3
    :goto_1
    sget-object v1, Ll/zqw;->a:Ljava/lang/String;

    .line 194
    .line 195
    const-string v3, "startWorker invalid bid @bid=%s, @url=%s"

    .line 196
    .line 197
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-static {v1, v2, v3, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 202
    .line 203
    .line 204
    return-object v2
.end method

.method public static k(Landroid/content/Intent;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->I()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    invoke-static {p1}, Ll/zqw;->f(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-static {p1}, Ll/zqw;->j(Ljava/lang/String;)Ll/zqw$d;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    const-string v0, "PARAM_WORKER_ID"

    .line 29
    .line 30
    iget-object v1, p1, Ll/zqw$d;->b:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    const-string v0, "PARAM_SERVICE_ID"

    .line 36
    .line 37
    iget-object p1, p1, Ll/zqw$d;->a:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void

    .line 43
    :cond_2
    :goto_0
    sget-object v0, Ll/zqw;->a:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->o()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    filled-new-array {v1, p1, p0}, [Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const/4 p1, 0x0

    .line 58
    const-string v1, "startWorkerBeforeActivityCreate:params @MWCEngine::enabled=%b, @url=%s, @intent=%s"

    .line 59
    .line 60
    invoke-static {v0, p1, v1, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method
