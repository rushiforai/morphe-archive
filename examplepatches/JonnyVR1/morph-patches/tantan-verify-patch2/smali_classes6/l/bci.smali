.class public Ll/bci;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/xbi;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lcom/p1/mobile/putong/app/web/WebViewX;

.field public e:Landroid/widget/ProgressBar;

.field public f:Landroid/widget/FrameLayout;

.field public g:Landroid/widget/FrameLayout;

.field public h:Landroid/widget/ImageView;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Ll/zpq;

.field public u:Ll/rx3;

.field public v:Ll/k7f0;

.field public w:Ll/x20;

.field public final x:Lcom/p1/mobile/putong/app/PutongAct;

.field public y:Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewFrag;

.field public z:Ll/xbi;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/bci;->w:Ll/x20;

    .line 6
    .line 7
    iput-object p2, p0, Ll/bci;->y:Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewFrag;

    .line 8
    .line 9
    iput-object p1, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    return-void
.end method

.method private A()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bci;->l:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/bci;->l:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "transparent"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    :goto_0
    return-void

    .line 21
    :cond_1
    iget-object v0, p0, Ll/bci;->l:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "#"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v2, p0, Ll/bci;->l:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    :goto_1
    :try_start_0
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    iget-object v1, p0, Ll/bci;->a:Lv/VLinear;

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 58
    .line 59
    .line 60
    :catch_0
    return-void
.end method

.method private synthetic E(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->onHomePressed()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/bci;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bci;->B(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ll/bci;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bci;->E(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/bci;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bci;->C()V

    return-void
.end method

.method public static bridge synthetic d(Ll/bci;)Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/bci;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bci;->j:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public final synthetic B(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const-string v1, "H5-Authorization"

    .line 13
    .line 14
    iget-object v2, p0, Ll/bci;->i:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v2, "Load override url not in token whitelist: "

    .line 23
    .line 24
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, "\norigin: "

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Ll/bci;->k:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v1}, Ll/ntp0;->f(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    iget-object p0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 48
    .line 49
    invoke-virtual {p0, p1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 50
    .line 51
    .line 52
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 53
    .line 54
    return-object p0
.end method

.method public final synthetic C()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/bci;->k:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v2, "javascript:doWhenGetToken(\'"

    .line 19
    .line 20
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/bci;->i:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p0, "\')"

    .line 29
    .line 30
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v1, "Load javascript:doWhenGetToken not in token whitelist: "

    .line 44
    .line 45
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/bci;->k:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Ll/ntp0;->f(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final F(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/bci;->q()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_7

    .line 10
    .line 11
    iget-boolean v0, p0, Ll/bci;->p:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/bci;->t:Ll/zpq;

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ll/zpq;

    .line 20
    .line 21
    iget-object v1, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    const-string v2, ""

    .line 24
    .line 25
    iget-object v3, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 26
    .line 27
    invoke-direct {v0, v1, v2, v3}, Ll/zpq;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/bci;->t:Ll/zpq;

    .line 31
    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/bci;->p()Ll/zpq;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    iget-object v1, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 43
    .line 44
    const-string v2, "tantan"

    .line 45
    .line 46
    invoke-virtual {v1, v0, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    new-instance v0, Ll/rx3;

    .line 50
    .line 51
    iget-object v1, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/bci;->s()Ll/qcj;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iget-boolean v3, p0, Ll/bci;->o:Z

    .line 58
    .line 59
    invoke-direct {v0, v1, v2, v3}, Ll/rx3;-><init>(Landroid/content/Context;Ll/qcj;Z)V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Ll/bci;->u:Ll/rx3;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/bci;->u()Ll/rx3$a;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Ll/rx3;->setListener(Ll/rx3$a;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ll/k7f0;

    .line 72
    .line 73
    iget-object v1, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 74
    .line 75
    invoke-direct {v0, v1}, Ll/k7f0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 76
    .line 77
    .line 78
    iput-object v0, p0, Ll/bci;->v:Ll/k7f0;

    .line 79
    .line 80
    iget-object v0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 81
    .line 82
    iget-object v1, p0, Ll/bci;->u:Ll/rx3;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebViewClientX(Lcom/p1/mobile/putong/app/web/WebViewClientX;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 88
    .line 89
    iget-object v1, p0, Ll/bci;->v:Ll/k7f0;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebChromeClientX(Ll/wqp0;)V

    .line 92
    .line 93
    .line 94
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iget-object v1, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 99
    .line 100
    if-eqz v0, :cond_2

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/bci;->q()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v1, v0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    invoke-virtual {p0}, Ll/bci;->q()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {v1, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    :goto_0
    iget-object p1, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 118
    .line 119
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    const/4 v0, 0x1

    .line 124
    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 128
    .line 129
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    sget-object v0, Landroid/webkit/WebSettings$LayoutAlgorithm;->SINGLE_COLUMN:Landroid/webkit/WebSettings$LayoutAlgorithm;

    .line 134
    .line 135
    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setLayoutAlgorithm(Landroid/webkit/WebSettings$LayoutAlgorithm;)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 139
    .line 140
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    iget-boolean v0, p0, Ll/bci;->r:Z

    .line 145
    .line 146
    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 150
    .line 151
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    const/4 v0, 0x0

    .line 156
    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 160
    .line 161
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 166
    .line 167
    .line 168
    iget-object p1, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Landroid/view/View;->setHorizontalScrollBarEnabled(Z)V

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 174
    .line 175
    invoke-virtual {p1, v0}, Landroid/view/View;->setFadingEdgeLength(I)V

    .line 176
    .line 177
    .line 178
    iget-boolean p1, p0, Ll/bci;->n:Z

    .line 179
    .line 180
    if-eqz p1, :cond_3

    .line 181
    .line 182
    iget-object p1, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 183
    .line 184
    instance-of v0, p1, Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewAct;

    .line 185
    .line 186
    if-eqz v0, :cond_3

    .line 187
    .line 188
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    if-eqz p1, :cond_3

    .line 193
    .line 194
    iget-object p1, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 195
    .line 196
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-virtual {p1}, Ll/c30;->m()V

    .line 201
    .line 202
    .line 203
    :cond_3
    iget-object p1, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 204
    .line 205
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    iget p1, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 214
    .line 215
    sget-object v0, Landroid/webkit/WebSettings$ZoomDensity;->MEDIUM:Landroid/webkit/WebSettings$ZoomDensity;

    .line 216
    .line 217
    const/16 v1, 0x78

    .line 218
    .line 219
    if-eq p1, v1, :cond_5

    .line 220
    .line 221
    const/16 v1, 0xa0

    .line 222
    .line 223
    if-eq p1, v1, :cond_6

    .line 224
    .line 225
    const/16 v1, 0xf0

    .line 226
    .line 227
    if-eq p1, v1, :cond_4

    .line 228
    .line 229
    goto :goto_1

    .line 230
    :cond_4
    sget-object v0, Landroid/webkit/WebSettings$ZoomDensity;->FAR:Landroid/webkit/WebSettings$ZoomDensity;

    .line 231
    .line 232
    goto :goto_1

    .line 233
    :cond_5
    sget-object v0, Landroid/webkit/WebSettings$ZoomDensity;->CLOSE:Landroid/webkit/WebSettings$ZoomDensity;

    .line 234
    .line 235
    :cond_6
    :goto_1
    iget-object p0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 236
    .line 237
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    invoke-virtual {p0, v0}, Landroid/webkit/WebSettings;->setDefaultZoom(Landroid/webkit/WebSettings$ZoomDensity;)V

    .line 242
    .line 243
    .line 244
    :cond_7
    return-void
.end method

.method public G(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "title"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/bci;->j:Ljava/lang/String;

    .line 14
    .line 15
    const-string v0, "url"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/bci;->k:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "webviewColor"

    .line 24
    .line 25
    const-string v1, "#ffffff"

    .line 26
    .line 27
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Ll/bci;->l:Ljava/lang/String;

    .line 32
    .line 33
    const-string v0, "notchColor"

    .line 34
    .line 35
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Ll/bci;->m:Ljava/lang/String;

    .line 40
    .line 41
    const-string v0, "hideNavigationBar"

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iput-boolean v0, p0, Ll/bci;->n:Z

    .line 49
    .line 50
    const-string v0, "hardwareAccelerated"

    .line 51
    .line 52
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iput-boolean v0, p0, Ll/bci;->o:Z

    .line 57
    .line 58
    const-string v0, "advanceInitJsBridge"

    .line 59
    .line 60
    const/4 v2, 0x1

    .line 61
    invoke-virtual {p1, v0, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iput-boolean v0, p0, Ll/bci;->p:Z

    .line 66
    .line 67
    const-string v0, "transparent_status_bar"

    .line 68
    .line 69
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iput-boolean v0, p0, Ll/bci;->q:Z

    .line 74
    .line 75
    const-string v0, "useActConfig"

    .line 76
    .line 77
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iput-boolean v0, p0, Ll/bci;->s:Z

    .line 82
    .line 83
    const-string v0, "playbackRequiresUserGesture"

    .line 84
    .line 85
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    iput-boolean p1, p0, Ll/bci;->r:Z

    .line 90
    .line 91
    :cond_0
    return-void
.end method

.method public H(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/bci;->f:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/bci;->e:Landroid/widget/ProgressBar;

    .line 8
    .line 9
    const/16 p1, 0x8

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Ll/bci;->i:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bci;->i()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/bci;->i:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v2, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1, v2}, Ll/bci;->m(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)Ll/zpq;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/bci;->t:Ll/zpq;

    .line 18
    .line 19
    new-instance v0, Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/bci;->k:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v1}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    const-string v1, "H5-Authorization"

    .line 33
    .line 34
    iget-object v2, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 35
    .line 36
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v2, "Load url not in token whitelist: "

    .line 43
    .line 44
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Ll/bci;->k:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {v1}, Ll/ntp0;->f(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_1

    .line 66
    .line 67
    new-instance p1, Ljava/lang/NullPointerException;

    .line 68
    .line 69
    const-string v1, "AccessTokenWebView request h5 right,but accessToken is null !"

    .line 70
    .line 71
    invoke-direct {p1, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    invoke-virtual {p0, v0}, Ll/bci;->F(Ljava/util/Map;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public J()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bci;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/bci;->i()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/bci;->j:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/bci;->b:Lv/navigationbar/VNavigationBar;

    .line 19
    .line 20
    iget-object p0, p0, Ll/bci;->j:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public K(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bci;->t:Ll/zpq;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/zpq;->d()Ll/gqq;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "resume"

    .line 10
    .line 11
    filled-new-array {p1}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, v0, p1}, Ll/gqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/bci;->i()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bci;->t:Ll/zpq;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/bci;->t:Ll/zpq;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/zpq;->k()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/bci;->n()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cci;->b(Ll/bci;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/xbi;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bci;->j(Ll/xbi;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bci;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ll/xbi;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bci;->z:Ll/xbi;

    .line 2
    .line 3
    return-void
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bci;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public l()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object v0, Ll/rx3;->EMPTY_PAGE:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public m(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)Ll/zpq;
    .locals 0

    .line 1
    new-instance p2, Ll/zpq;

    .line 2
    .line 3
    iget-object p3, p0, Ll/bci;->i:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 6
    .line 7
    invoke-direct {p2, p1, p3, p0}, Ll/zpq;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 8
    .line 9
    .line 10
    return-object p2
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/bci;->c:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    iget-object v1, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/webkit/WebView;->clearHistory()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 33
    .line 34
    invoke-virtual {v0}, Lv/VWebView;->destroy()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public p()Ll/zpq;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bci;->t:Ll/zpq;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bci;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Ll/qcj;
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
    new-instance v0, Ll/aci;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/aci;-><init>(Ll/bci;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public u()Ll/rx3$a;
    .locals 1

    .line 1
    new-instance v0, Ll/bci$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bci$a;-><init>(Ll/bci;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public v()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/webkit/WebView;->goBack()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w()V
    .locals 1

    .line 1
    new-instance v0, Ll/zbi;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zbi;-><init>(Ll/bci;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/bci;->w:Ll/x20;

    .line 7
    .line 8
    return-void
.end method

.method public x()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bci;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    sget v1, Ll/abc0;->n:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/bci;->b:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/ybi;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/ybi;-><init>(Ll/bci;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/bci;->k()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/bci;->b:Lv/navigationbar/VNavigationBar;

    .line 25
    .line 26
    const/16 v1, 0x8

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Ll/bci;->b:Lv/navigationbar/VNavigationBar;

    .line 32
    .line 33
    invoke-virtual {p0}, Lv/navigationbar/VNavigationBar;->B()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final y()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bci;->m:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/bci;->m:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "transparent"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object v0, p0, Ll/bci;->m:Ljava/lang/String;

    .line 33
    .line 34
    const-string v2, "#"

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object v3, p0, Ll/bci;->m:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    :goto_0
    :try_start_0
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    iget-object v2, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 62
    .line 63
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    const/high16 v3, -0x80000000

    .line 68
    .line 69
    invoke-virtual {v2, v3}, Landroid/view/Window;->addFlags(I)V

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 73
    .line 74
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    const/high16 v3, 0x4000000

    .line 79
    .line 80
    invoke-virtual {v2, v3}, Landroid/view/Window;->clearFlags(I)V

    .line 81
    .line 82
    .line 83
    iget-object v2, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 84
    .line 85
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v2, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 90
    .line 91
    .line 92
    iget-object v2, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 93
    .line 94
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-static {v2, v1, v1}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;ZI)V

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 102
    .line 103
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 120
    .line 121
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const/4 v1, 0x1

    .line 126
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->FlymeSetStatusBarLightMode(Landroid/view/Window;Z)Z

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 130
    .line 131
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->MIUISetStatusBarLightMode(Landroid/view/Window;Z)Z

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 139
    .line 140
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-eqz v0, :cond_3

    .line 149
    .line 150
    iget-object p0, p0, Ll/bci;->x:Lcom/p1/mobile/putong/app/PutongAct;

    .line 151
    .line 152
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    const/4 v0, 0x0

    .line 157
    invoke-virtual {p0, v0}, Ll/c30;->A(F)V

    .line 158
    .line 159
    .line 160
    :catch_0
    :cond_3
    :goto_1
    return-void
.end method

.method public z(Ljava/util/Map;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "JavascriptInterface"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/bci;->q()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/bci;->q()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "?speed=true"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object p1, p0, Ll/bci;->z:Ll/xbi;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/xbi;->h0()V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Ll/bci;->A()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/bci;->y()V

    .line 35
    .line 36
    .line 37
    return-void
.end method
