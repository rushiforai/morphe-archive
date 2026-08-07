.class public Ll/ajk0;
.super Ll/db;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ajk0$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/uik0;",
        ">",
        "Ll/db<",
        "Ll/uik0;",
        ">;"
    }
.end annotation


# static fields
.field public static final I:[Ljava/lang/String;


# instance fields
.field public H:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    const-string v7, "\u8ba4\u8bc6\u6211\u8fd9\u4e48\u4e45\uff0c\u60f3\u542c\u542c\u6211\u7684\u6545\u4e8b\u5417\uff1f"

    .line 2
    .line 3
    const-string v8, "\u548c\u4f60\u5206\u4eab\u4e00\u4e2a\u6211\u7684\u6545\u4e8b\uff0c\u60f3\u542c\u5417\uff1f"

    .line 4
    .line 5
    const-string v0, "\u548c\u4f60\u8bb2\u4e00\u4e2a\u6211\u7684\u6545\u4e8b\uff0c\u53ea\u544a\u8bc9\u4f60\u4e00\u4e2a\u4eba\u54e6\uff01"

    .line 6
    .line 7
    const-string v1, "\u5077\u5077\u548c\u4f60\u5206\u4eab\u4e00\u4e2a\u6211\u7684\u6545\u4e8b"

    .line 8
    .line 9
    const-string v2, "\u4e00\u5b9a\u8981\u770b\uff01\u6211\u7684\u4e00\u4e2a\u5c0f\u6545\u4e8b\uff01"

    .line 10
    .line 11
    const-string v3, "\u521a\u521a\u5199\u4e86\u4e00\u4e2a\u6211\u7684\u6545\u4e8b\uff0c\u60f3\u770b\u5417\uff1f"

    .line 12
    .line 13
    const-string v4, "\u6211\u7684\u4e00\u4e2a\u5c0f\u6545\u4e8b\uff0c\u5206\u4eab\u7ed9\u7231\u516b\u5366\u7684\u4f60"

    .line 14
    .line 15
    const-string v5, "\u5077\u5077\u548c\u4f60\u8bf4\u4e00\u4e2a\u6211\u7684\u5c0f\u6545\u4e8b\uff0c\u5206\u4eab\u7ed9\u7231\u516b\u5366\u7684\u4f60"

    .line 16
    .line 17
    const-string v6, "\u548c\u4f60\u8bf4\u4e00\u4e2a\u6211\u7684\u6545\u4e8b\uff0c\u8ba4\u8bc6\u6211\u8fd9\u4e48\u4e45\u4f60\u80af\u5b9a\u4e0d\u77e5\u9053\uff01"

    .line 18
    .line 19
    filled-new-array/range {v0 .. v8}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/ajk0;->I:[Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/db;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic F(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "tantan:"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    const-string v0, "shareAction"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/ajk0;->H:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    invoke-static {p1}, Ll/ktp0;->d(Ljava/lang/String;)Ljava/util/Map;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, "imgurl"

    .line 30
    .line 31
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    new-instance v0, Ll/wik0;

    .line 44
    .line 45
    invoke-direct {v0, p0, p1}, Ll/wik0;-><init>(Ll/ajk0;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    new-instance p1, Ll/xik0;

    .line 53
    .line 54
    invoke-direct {p1, p0}, Ll/xik0;-><init>(Ll/ajk0;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 64
    .line 65
    return-object p0
.end method

.method public static synthetic e0(Ll/ajk0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ajk0;->k0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic f0(Ll/ajk0;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ajk0;->F(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h0(Ll/ajk0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ajk0;->l0()V

    return-void
.end method

.method public static synthetic i0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic j0(Ll/ajk0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ajk0;->H:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public U(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)Ll/zpq;
    .locals 1

    .line 1
    new-instance v0, Ll/ajk0$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/ajk0$b;-><init>(Ll/ajk0;Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic k0(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "h5"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Ll/ajk0;->H:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "UTF-8"

    .line 6
    .line 7
    invoke-static {p1, v2}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, v1, p1, v0}, Ll/ajk0;->m0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception p1

    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/ajk0;->H:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {p0, p1, v1, v0}, Ll/ajk0;->m0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic l0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ajk0;->H:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "h5"

    .line 5
    .line 6
    invoke-virtual {p0, v0, v1, v2}, Ll/ajk0;->m0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final m0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ljava/util/Random;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const-string v1, ".jpg"

    .line 13
    .line 14
    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    const-string v1, "?format=180x180"

    .line 21
    .line 22
    invoke-virtual {p2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    :cond_0
    :goto_0
    move-object v7, p2

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    const-string v1, ".jpg?format=180x180"

    .line 29
    .line 30
    invoke-virtual {p2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    goto :goto_0

    .line 35
    :goto_1
    sget-object p2, Ll/ajk0;->I:[Ljava/lang/String;

    .line 36
    .line 37
    array-length v1, p2

    .line 38
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    new-instance v1, Lcom/p1/mobile/putong/data/Link;

    .line 43
    .line 44
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Link;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 48
    .line 49
    new-instance p1, Lcom/p1/mobile/putong/data/IdBoxed;

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    const-string v3, "user"

    .line 60
    .line 61
    invoke-direct {p1, v2, v3}, Lcom/p1/mobile/putong/data/IdBoxed;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    filled-new-array {p1}, [Lcom/p1/mobile/putong/data/IdBoxed;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Link;->resources:Ljava/util/List;

    .line 73
    .line 74
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_2

    .line 79
    .line 80
    new-instance p1, Ljava/util/HashMap;

    .line 81
    .line 82
    const/4 v2, 0x1

    .line 83
    invoke-direct {p1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 84
    .line 85
    .line 86
    const-string v2, "share_from"

    .line 87
    .line 88
    invoke-interface {p1, v2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    :goto_2
    move-object p3, v1

    .line 92
    goto :goto_3

    .line 93
    :cond_2
    const/4 p1, 0x0

    .line 94
    goto :goto_2

    .line 95
    :goto_3
    new-instance v1, Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 96
    .line 97
    invoke-direct {v1, p3, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;-><init>(Lcom/p1/mobile/putong/data/Link;Ljava/util/Map;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Ll/sup0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {p0}, Ll/sup0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Il:I

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    aget-object v4, p2, v0

    .line 115
    .line 116
    const-string p0, "wechat-moments"

    .line 117
    .line 118
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    const-string p1, "wechat-session"

    .line 123
    .line 124
    invoke-static {p1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    filled-new-array {p0, p1}, [Lcom/p1/mobile/putong/data/LinkChannel;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    const/4 v6, 0x1

    .line 137
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    new-instance p1, Ll/yik0;

    .line 142
    .line 143
    invoke-direct {p1}, Ll/yik0;-><init>()V

    .line 144
    .line 145
    .line 146
    new-instance p2, Ll/zik0;

    .line 147
    .line 148
    invoke-direct {p2}, Ll/zik0;-><init>()V

    .line 149
    .line 150
    .line 151
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public u()Ll/qcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/qcj<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/vik0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vik0;-><init>(Ll/ajk0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public v()Ll/rx3$a;
    .locals 2

    .line 1
    invoke-super {p0}, Ll/db;->v()Ll/rx3$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ajk0$a;

    .line 6
    .line 7
    invoke-direct {v1, p0, v0}, Ll/ajk0$a;-><init>(Ll/ajk0;Ll/rx3$a;)V

    .line 8
    .line 9
    .line 10
    return-object v1
.end method
