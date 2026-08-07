.class public Lcom/p1/mobile/putong/facertification/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z

.field public static final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static c:Ljava/lang/String;

.field public static d:Lcom/p1/mobile/putong/facertification/RxFacertification$b;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    const-string v10, "C0412007"

    .line 2
    .line 3
    const-string v11, "C0412008"

    .line 4
    .line 5
    const-string v0, "C0000000"

    .line 6
    .line 7
    const-string v1, "C0401001"

    .line 8
    .line 9
    const-string v2, "C0402001"

    .line 10
    .line 11
    const-string v3, "C0405001"

    .line 12
    .line 13
    const-string v4, "C0412002"

    .line 14
    .line 15
    const-string v5, "S0400001"

    .line 16
    .line 17
    const-string v6, "C0412003"

    .line 18
    .line 19
    const-string v7, "C0412004"

    .line 20
    .line 21
    const-string v8, "C0412005"

    .line 22
    .line 23
    const-string v9, "C0412006"

    .line 24
    .line 25
    filled-new-array/range {v0 .. v11}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Lcom/p1/mobile/putong/facertification/a;->b:Ljava/util/List;

    .line 34
    .line 35
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

.method public static synthetic a(Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Lcom/p1/mobile/putong/facertification/a;->d:Lcom/p1/mobile/putong/facertification/RxFacertification$b;

    .line 3
    .line 4
    sput-object v0, Lcom/p1/mobile/putong/facertification/a;->c:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static d(Landroid/app/Activity;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/RxFacertification$b;)V
    .locals 6
    .param p0    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/facertification/RxFacertification$b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sput-object p2, Lcom/p1/mobile/putong/facertification/a;->d:Lcom/p1/mobile/putong/facertification/RxFacertification$b;

    .line 2
    .line 3
    sput-object p1, Lcom/p1/mobile/putong/facertification/a;->c:Ljava/lang/String;

    .line 4
    .line 5
    const-string p1, "dexvmp"

    .line 6
    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/facertification/a;->g(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Lcn/wh/auth/bean/CheckInstall;->isAppInstalled(Landroid/app/Activity;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    new-instance v0, Lcn/wh/auth/bean/WParams;

    .line 17
    .line 18
    sget-object v3, Lcom/p1/mobile/putong/facertification/a;->c:Ljava/lang/String;

    .line 19
    .line 20
    const/4 v4, 0x1

    .line 21
    const/4 v5, 0x0

    .line 22
    const-string v1, "00000023"

    .line 23
    .line 24
    const-string v2, "0001"

    .line 25
    .line 26
    invoke-direct/range {v0 .. v5}, Lcn/wh/auth/bean/WParams;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    new-instance p1, Lcn/wh/auth/WAuthService;

    .line 30
    .line 31
    invoke-direct {p1, p0, v0}, Lcn/wh/auth/WAuthService;-><init>(Landroid/app/Activity;Lcn/wh/auth/bean/WParams;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Lcn/wh/auth/WAuthService;->getAuthFromIntent()V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    sput-boolean p0, Lcom/p1/mobile/putong/facertification/a;->a:Z

    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    const-string p1, "https://cdnrefresh.ctdidcii.cn/w1/WHClient_H5/Install/InstallGuide.html"

    .line 42
    .line 43
    invoke-static {p0, p1}, Ll/erq;->b(Landroid/content/Context;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static e(Landroid/content/Intent;)Z
    .locals 2
    .param p0    # Landroid/content/Intent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/facertification/a;->b:Ljava/util/List;

    .line 2
    .line 3
    const-string v1, "resultCode"

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static f(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 8
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/content/Intent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "resultCode"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "resultDesc"

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "idCardAuthData"

    .line 14
    .line 15
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const-string v4, "certPwdData"

    .line 20
    .line 21
    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    const-string v6, "verifyData"

    .line 26
    .line 27
    invoke-virtual {p1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    const-string v6, "extrasData"

    .line 31
    .line 32
    invoke-virtual {p1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    const-string p1, "C0000000"

    .line 36
    .line 37
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_1

    .line 48
    .line 49
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-nez p1, :cond_1

    .line 54
    .line 55
    sget-object p1, Lcom/p1/mobile/putong/facertification/a;->d:Lcom/p1/mobile/putong/facertification/RxFacertification$b;

    .line 56
    .line 57
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    new-instance p1, Lorg/json/JSONObject;

    .line 64
    .line 65
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 66
    .line 67
    .line 68
    :try_start_0
    const-string v6, "bizSeq"

    .line 69
    .line 70
    sget-object v7, Lcom/p1/mobile/putong/facertification/a;->c:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {p1, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    .line 80
    .line 81
    const-string v2, "clientStatus"

    .line 82
    .line 83
    invoke-virtual {p1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .line 85
    .line 86
    :catch_0
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->p()Lcom/p1/mobile/putong/facertification/TTFacertificationClient;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    sget-object v3, Lcom/p1/mobile/putong/facertification/a;->d:Lcom/p1/mobile/putong/facertification/RxFacertification$b;

    .line 91
    .line 92
    iget-object v4, v3, Lcom/p1/mobile/putong/facertification/RxFacertification$b;->c:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 93
    .line 94
    iget-object v4, v4, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->productId:Ljava/lang/String;

    .line 95
    .line 96
    const-string v5, "7"

    .line 97
    .line 98
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    if-eqz v4, :cond_0

    .line 103
    .line 104
    const-string v4, ""

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_0
    sget-object v4, Ll/uqb0;->c0:Ll/bn5;

    .line 108
    .line 109
    invoke-interface {v4}, Ll/bn5;->me_()Lcom/p1/mobile/putong/data/User;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 114
    .line 115
    :goto_0
    const/4 v5, 0x3

    .line 116
    invoke-virtual {v2, v3, v4, v5, p1}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->x(Lcom/p1/mobile/putong/facertification/RxFacertification$b;Ljava/lang/String;ILorg/json/JSONObject;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    new-instance p1, Ll/znp0;

    .line 125
    .line 126
    invoke-direct {p1}, Ll/znp0;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0, p1}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    new-instance p1, Ll/aop0;

    .line 134
    .line 135
    invoke-direct {p1, p2}, Ll/aop0;-><init>(Ljava/lang/Runnable;)V

    .line 136
    .line 137
    .line 138
    new-instance p2, Ll/bop0;

    .line 139
    .line 140
    invoke-direct {p2, p3}, Ll/bop0;-><init>(Ljava/lang/Runnable;)V

    .line 141
    .line 142
    .line 143
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    if-nez p0, :cond_2

    .line 156
    .line 157
    invoke-static {v1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    :cond_2
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    if-eqz p0, :cond_3

    .line 165
    .line 166
    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    .line 167
    .line 168
    .line 169
    :cond_3
    const/4 p0, 0x0

    .line 170
    sput-object p0, Lcom/p1/mobile/putong/facertification/a;->d:Lcom/p1/mobile/putong/facertification/RxFacertification$b;

    .line 171
    .line 172
    sput-object p0, Lcom/p1/mobile/putong/facertification/a;->c:Ljava/lang/String;

    .line 173
    .line 174
    :goto_1
    const-string p0, "WAuth verification, code is %s, desc is %s"

    .line 175
    .line 176
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    const-string p1, "Verification"

    .line 185
    .line 186
    invoke-static {p1, p0}, Ll/vu2;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public static g(Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catchall_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    return-void
.end method
