.class public final Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;
.super Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;,
        Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000Z\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u0000 -2\u00020\u0001:\u0002./B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0003J)\u0010\r\u001a\u00020\u000c2\u0006\u0010\u0007\u001a\u00020\u00062\u0008\u0010\t\u001a\u0004\u0018\u00010\u00082\u0006\u0010\u000b\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0017\u0010\u0011\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0019\u0010\u0014\u001a\u00020\u000c2\u0008\u0010\u0013\u001a\u0004\u0018\u00010\nH\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0019\u0010\u0018\u001a\u00020\u00042\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0016H\u0014\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J!\u0010\u001e\u001a\u00020\u000c2\u0006\u0010\u001b\u001a\u00020\u001a2\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u001cH\u0016\u00a2\u0006\u0004\u0008\u001e\u0010\u001fR\u0016\u0010#\u001a\u00020 8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008!\u0010\"R\u0018\u0010&\u001a\u0004\u0018\u00010\n8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008$\u0010%R\u0018\u0010(\u001a\u0004\u0018\u00010\n8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\'\u0010%R\u0018\u0010,\u001a\u0004\u0018\u00010)8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008*\u0010+\u00a8\u00060"
    }
    d2 = {
        "Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;",
        "Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;",
        "<init>",
        "()V",
        "",
        "j1",
        "Ll/p7m;",
        "itConfig",
        "Landroid/webkit/WebView;",
        "view",
        "",
        "newUrl",
        "",
        "k1",
        "(Ll/p7m;Landroid/webkit/WebView;Ljava/lang/String;)Z",
        "Landroid/net/Uri;",
        "newUri",
        "h1",
        "(Landroid/net/Uri;)V",
        "currentUrl",
        "f1",
        "(Ljava/lang/String;)Z",
        "Landroid/os/Bundle;",
        "savedInstanceState",
        "onCreate",
        "(Landroid/os/Bundle;)V",
        "",
        "keyCode",
        "Landroid/view/KeyEvent;",
        "event",
        "onKeyDown",
        "(ILandroid/view/KeyEvent;)Z",
        "Ll/x40;",
        "e",
        "Ll/x40;",
        "binding",
        "f",
        "Ljava/lang/String;",
        "url",
        "g",
        "title",
        "Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;",
        "h",
        "Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;",
        "mmBridge",
        "Companion",
        "a",
        "b",
        "MKBusiness_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$a;

.field private static i:Lkotlin/jvm/functions/Function4;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function4<",
            "-",
            "Landroid/content/Context;",
            "-",
            "Landroid/webkit/WebView;",
            "-",
            "Ll/flw;",
            "-",
            "Lorg/json/JSONObject;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private e:Ll/x40;

.field private f:Ljava/lang/String;

.field private g:Ljava/lang/String;

.field private h:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->Companion:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic V0(Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;)Ll/x40;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string v0, "binding"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-object p0
.end method

.method public static final synthetic W0()Lkotlin/jvm/functions/Function4;
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->i:Lkotlin/jvm/functions/Function4;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic X0(Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;)Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->h:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic Y0(Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic a1(Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic d1(Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;Ll/p7m;Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->k1(Ll/p7m;Landroid/webkit/WebView;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final f1(Ljava/lang/String;)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    :try_start_0
    invoke-static {p1}, Ll/glw;->j(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    return p0

    .line 16
    :catch_0
    move-exception p1

    .line 17
    const-string v0, "NormalWebViewActivity"

    .line 18
    .line 19
    const-string v1, ""

    .line 20
    .line 21
    invoke-static {v0, v1, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return p0
.end method

.method private final h1(Landroid/net/Uri;)V
    .locals 1

    .line 1
    const-string v0, "_mk_close"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "1"

    .line 8
    .line 9
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private final j1()V
    .locals 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$d;-><init>(Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$c;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$c;-><init>(Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;)V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 12
    .line 13
    const-string v3, "binding"

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v2, v2, Ll/x40;->f:Landroid/webkit/WebView;

    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, v0}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 29
    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v0, v0, Ll/x40;->f:Landroid/webkit/WebView;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 44
    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object v0, v0, Ll/x40;->f:Landroid/webkit/WebView;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    const/4 v1, 0x1

    .line 60
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 64
    .line 65
    .line 66
    const/4 v2, 0x0

    .line 67
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    .line 68
    .line 69
    .line 70
    const/4 v4, 0x2

    .line 71
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setLoadsImagesAutomatically(Z)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setBlockNetworkImage(Z)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setBlockNetworkLoads(Z)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setGeolocationEnabled(Z)V

    .line 93
    .line 94
    .line 95
    const-string v5, "webdata"

    .line 96
    .line 97
    invoke-virtual {p0, v5, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    invoke-virtual {v0, v5}, Landroid/webkit/WebSettings;->setDatabasePath(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    .line 118
    .line 119
    .line 120
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 121
    .line 122
    if-nez v1, :cond_3

    .line 123
    .line 124
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_3
    iget-object v1, v1, Ll/x40;->f:Landroid/webkit/WebView;

    .line 128
    .line 129
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v1, v2}, Landroid/view/View;->setHorizontalScrollBarEnabled(Z)V

    .line 133
    .line 134
    .line 135
    sget-boolean v1, Ll/sjw;->a:Z

    .line 136
    .line 137
    const/4 v5, 0x0

    .line 138
    if-eqz v1, :cond_6

    .line 139
    .line 140
    invoke-static {}, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->f()Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    iget-object v6, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->f:Ljava/lang/String;

    .line 145
    .line 146
    if-eqz v1, :cond_5

    .line 147
    .line 148
    if-eqz v6, :cond_6

    .line 149
    .line 150
    if-eqz v6, :cond_4

    .line 151
    .line 152
    :try_start_0
    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 157
    .line 158
    .line 159
    goto :goto_0

    .line 160
    :catch_0
    move-exception v1

    .line 161
    goto :goto_1

    .line 162
    :cond_4
    move-object v1, v5

    .line 163
    :goto_0
    if-eqz v1, :cond_6

    .line 164
    .line 165
    const-string v6, "1"

    .line 166
    .line 167
    sget-object v7, Ll/a6k0;->INSTANCE:Ll/a6k0;

    .line 168
    .line 169
    const-string v8, "_mkua"

    .line 170
    .line 171
    invoke-virtual {v7, v1, v8}, Ll/a6k0;->d(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-static {v6, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    if-eqz v1, :cond_6

    .line 180
    .line 181
    new-instance v1, Ljava/lang/StringBuilder;

    .line 182
    .line 183
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v6

    .line 190
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const-string v6, " "

    .line 194
    .line 195
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    iget-object v6, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->f:Ljava/lang/String;

    .line 199
    .line 200
    invoke-static {v6}, Ll/sjw;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v6

    .line 204
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 212
    .line 213
    .line 214
    goto :goto_2

    .line 215
    :goto_1
    const-string v6, "NormalWebViewActivity"

    .line 216
    .line 217
    const-string v7, ""

    .line 218
    .line 219
    invoke-static {v6, v7, v1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 220
    .line 221
    .line 222
    goto :goto_2

    .line 223
    :cond_5
    invoke-static {v6}, Ll/sjw;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    :cond_6
    :goto_2
    invoke-static {v0}, Ll/jqh0;->c(Landroid/webkit/WebSettings;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    .line 234
    .line 235
    .line 236
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 237
    .line 238
    if-nez v0, :cond_7

    .line 239
    .line 240
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    :cond_7
    iget-object v0, v0, Ll/x40;->f:Landroid/webkit/WebView;

    .line 244
    .line 245
    invoke-virtual {v0, v4, v5}, Landroid/webkit/WebView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 246
    .line 247
    .line 248
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->f:Ljava/lang/String;

    .line 249
    .line 250
    if-eqz v0, :cond_e

    .line 251
    .line 252
    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->f1(Ljava/lang/String;)Z

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    if-nez v1, :cond_8

    .line 257
    .line 258
    invoke-static {}, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->f()Z

    .line 259
    .line 260
    .line 261
    move-result v1

    .line 262
    if-eqz v1, :cond_c

    .line 263
    .line 264
    :cond_8
    new-instance v1, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;

    .line 265
    .line 266
    iget-object v2, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 267
    .line 268
    if-nez v2, :cond_9

    .line 269
    .line 270
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    :cond_9
    invoke-direct {v1, p0, v2}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;-><init>(Landroid/app/Activity;Ll/x40;)V

    .line 274
    .line 275
    .line 276
    iput-object v1, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->h:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;

    .line 277
    .line 278
    invoke-virtual {v1, v0}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;->f(Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 282
    .line 283
    if-nez v1, :cond_a

    .line 284
    .line 285
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    :cond_a
    iget-object v1, v1, Ll/x40;->f:Landroid/webkit/WebView;

    .line 289
    .line 290
    iget-object v2, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->h:Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$b;

    .line 291
    .line 292
    if-nez v2, :cond_b

    .line 293
    .line 294
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 295
    .line 296
    .line 297
    :cond_b
    const-string v4, "aobj"

    .line 298
    .line 299
    invoke-virtual {v1, v2, v4}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    :cond_c
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 303
    .line 304
    if-nez p0, :cond_d

    .line 305
    .line 306
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    :cond_d
    iget-object p0, p0, Ll/x40;->f:Landroid/webkit/WebView;

    .line 310
    .line 311
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    :cond_e
    return-void
.end method

.method private final k1(Ll/p7m;Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 11

    .line 1
    const-string v1, "https://"

    .line 2
    .line 3
    const/4 v3, 0x0

    .line 4
    const/4 v5, 0x2

    .line 5
    const/4 v6, 0x0

    .line 6
    invoke-static {p3, v1, v3, v5, v6}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const-string v1, "http://"

    .line 13
    .line 14
    invoke-static {p3, v1, v3, v5, v6}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_8

    .line 19
    .line 20
    :cond_0
    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 21
    .line 22
    .line 23
    move-result-object v9

    .line 24
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    const-string v1, "_bid"

    .line 28
    .line 29
    invoke-virtual {v9, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v1}, Ll/d8g0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_1

    .line 42
    .line 43
    return v3

    .line 44
    :cond_1
    const-string v1, "_mk_target"

    .line 45
    .line 46
    invoke-virtual {v9, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {v1}, Ll/d8g0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    if-nez v5, :cond_2

    .line 59
    .line 60
    return v3

    .line 61
    :cond_2
    invoke-virtual {v9}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    invoke-virtual {p1, p3}, Ll/p7m;->c(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    if-nez v7, :cond_3

    .line 70
    .line 71
    invoke-static {v5}, Ll/bfe0;->e(Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    if-nez v5, :cond_4

    .line 76
    .line 77
    return v3

    .line 78
    :cond_3
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    if-nez v5, :cond_4

    .line 83
    .line 84
    return v3

    .line 85
    :cond_4
    invoke-virtual {p1, p2, p3, v1}, Ll/p7m;->b(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    const/4 v10, 0x1

    .line 90
    if-eqz v0, :cond_5

    .line 91
    .line 92
    invoke-direct {p0, v9}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->h1(Landroid/net/Uri;)V

    .line 93
    .line 94
    .line 95
    return v10

    .line 96
    :cond_5
    const-string v0, "1"

    .line 97
    .line 98
    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_6

    .line 103
    .line 104
    move-object v6, v1

    .line 105
    :cond_6
    if-eqz v6, :cond_8

    .line 106
    .line 107
    if-eqz p2, :cond_7

    .line 108
    .line 109
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    if-eqz v1, :cond_7

    .line 114
    .line 115
    sget-object v0, Ll/hm3;->Companion:Ll/hm3$a;

    .line 116
    .line 117
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    const/16 v7, 0x30

    .line 122
    .line 123
    const/4 v8, 0x0

    .line 124
    const/4 v5, 0x0

    .line 125
    const/4 v6, 0x0

    .line 126
    move-object v2, p2

    .line 127
    move-object v4, p3

    .line 128
    invoke-static/range {v0 .. v8}, Ll/hm3$a;->d(Ll/hm3$a;Landroid/content/Context;Landroid/webkit/WebView;ILjava/lang/String;Lorg/json/JSONObject;Ll/flw;ILjava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    :cond_7
    invoke-direct {p0, v9}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->h1(Landroid/net/Uri;)V

    .line 132
    .line 133
    .line 134
    return v10

    .line 135
    :cond_8
    return v3
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Ll/q4g0;->f(Landroid/view/Window;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Ll/x40;->c(Landroid/view/LayoutInflater;)Ll/x40;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 23
    .line 24
    const-string v0, "binding"

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-virtual {p1}, Ll/x40;->b()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->setContentView(Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v1, "param_start_url"

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->f:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const-string v1, "param_title"

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->g:Ljava/lang/String;

    .line 61
    .line 62
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 63
    .line 64
    if-nez p1, :cond_1

    .line 65
    .line 66
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    iget-object p1, p1, Ll/x40;->c:Landroid/widget/ImageView;

    .line 70
    .line 71
    new-instance v1, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$e;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$e;-><init>(Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 80
    .line 81
    if-nez p1, :cond_2

    .line 82
    .line 83
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    iget-object p1, p1, Ll/x40;->d:Landroid/widget/ImageView;

    .line 87
    .line 88
    new-instance v1, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$f;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity$f;-><init>(Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->g:Ljava/lang/String;

    .line 97
    .line 98
    if-eqz p1, :cond_4

    .line 99
    .line 100
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 101
    .line 102
    if-nez v1, :cond_3

    .line 103
    .line 104
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :cond_3
    iget-object v0, v1, Ll/x40;->b:Landroid/widget/TextView;

    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    :cond_4
    invoke-direct {p0}, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->j1()V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p2    # Landroid/view/KeyEvent;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 2
    .line 3
    const-string v1, "binding"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, v0, Ll/x40;->f:Landroid/webkit/WebView;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_3

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-ne p1, v0, :cond_3

    .line 20
    .line 21
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object p1, p1, Ll/x40;->d:Landroid/widget/ImageView;

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    const/4 p2, 0x0

    .line 34
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/NormalWebViewActivity;->e:Ll/x40;

    .line 38
    .line 39
    if-nez p0, :cond_2

    .line 40
    .line 41
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    iget-object p0, p0, Ll/x40;->f:Landroid/webkit/WebView;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/webkit/WebView;->goBack()V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_3
    invoke-super {p0, p1, p2}, Landroidx/appcompat/app/AppCompatActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0
.end method
