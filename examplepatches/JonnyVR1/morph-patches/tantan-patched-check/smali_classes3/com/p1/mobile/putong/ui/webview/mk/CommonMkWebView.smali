.class public Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field public b:Ll/w0c;

.field public c:Landroid/widget/ProgressBar;

.field public d:Landroid/widget/LinearLayout;

.field public e:Landroid/widget/LinearLayout;

.field public f:Landroid/widget/ImageView;

.field public g:Ll/rx3$a;

.field public h:Z

.field public i:Ll/zpq;

.field public j:Z

.field public k:Z

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->j:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->k:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->l:Z

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->j:Z

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->k:Z

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->l:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 16
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->j:Z

    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->k:Z

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->l:Z

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->j:Z

    return p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->h:Z

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->d:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Ll/rx3$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->g:Ll/rx3$a;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Landroid/widget/ProgressBar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->c:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->l:Z

    return p0
.end method

.method private getPageListener()Ll/rx3$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$b;-><init>(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private getWebview()Landroid/webkit/WebView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->k:Z

    return p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->h:Z

    return-void
.end method

.method public static q(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ll/w0c;)V
    .locals 1
    .param p0    # Lcom/hellogroup/mk/business/base/ui/MKWebView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/w0c;->K()V

    .line 4
    .line 5
    .line 6
    :cond_0
    if-eqz p0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    check-cast p1, Landroid/view/ViewGroup;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/webkit/WebView;->clearHistory()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->destroy()V

    .line 32
    .line 33
    .line 34
    :cond_2
    return-void
.end method


# virtual methods
.method public getWebViewHashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public j(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/app/PutongAct;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-static {p3}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const-string p1, "H5-Authorization"

    .line 12
    .line 13
    invoke-interface {p4, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 17
    .line 18
    invoke-virtual {p0, p3, p4}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->b:Ll/w0c;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->q(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ll/w0c;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->i:Ll/zpq;

    .line 12
    .line 13
    return-void
.end method

.method public final l(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V
    .locals 4

    .line 1
    sget v0, Ll/ycc0;->G0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/LinearLayout;

    .line 8
    .line 9
    sget-object v1, Ll/mjw;->INSTANCE:Ll/mjw;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    iget-object v3, v3, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    invoke-virtual {v3}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v1, v2, p1, v3}, Ll/mjw;->s(Landroid/app/Activity;Ljava/lang/String;Landroid/content/Intent;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const/4 v2, 0x0

    .line 34
    if-nez v1, :cond_0

    .line 35
    .line 36
    new-instance v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    check-cast p2, Lcom/p1/mobile/putong/app/PutongAct;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Lcom/p1/mobile/putong/app/PutongAct;

    .line 49
    .line 50
    iget-object v3, v3, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    invoke-virtual {v3}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-static {v3, p1}, Ll/brw;->a(Landroid/content/Intent;Ljava/lang/String;)Ll/brw;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-direct {v1, p2, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;-><init>(Landroid/content/Context;Ll/brw;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->DEFAULT_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 65
    .line 66
    if-eq p2, p1, :cond_1

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 69
    .line 70
    .line 71
    :cond_1
    :goto_0
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    if-nez p1, :cond_2

    .line 76
    .line 77
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    .line 81
    .line 82
    const/4 p2, -0x1

    .line 83
    invoke-direct {p1, p2, p2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 90
    .line 91
    new-instance p1, Ll/w0c;

    .line 92
    .line 93
    invoke-direct {p1}, Ll/w0c;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->b:Ll/w0c;

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    check-cast p2, Landroid/app/Activity;

    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 105
    .line 106
    invoke-virtual {p1, p2, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->z(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->b:Ll/w0c;

    .line 110
    .line 111
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    check-cast p2, Lcom/p1/mobile/putong/app/PutongAct;

    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 118
    .line 119
    const-string v1, ""

    .line 120
    .line 121
    invoke-virtual {p1, p2, v1, v0, v1}, Ll/w0c;->M(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    sget p1, Ll/ycc0;->c0:I

    .line 125
    .line 126
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    check-cast p1, Landroid/widget/ProgressBar;

    .line 131
    .line 132
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->c:Landroid/widget/ProgressBar;

    .line 133
    .line 134
    sget p1, Ll/ycc0;->C:I

    .line 135
    .line 136
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Landroid/widget/LinearLayout;

    .line 141
    .line 142
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->d:Landroid/widget/LinearLayout;

    .line 143
    .line 144
    sget p1, Ll/ycc0;->n0:I

    .line 145
    .line 146
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    check-cast p1, Landroid/widget/LinearLayout;

    .line 151
    .line 152
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->e:Landroid/widget/LinearLayout;

    .line 153
    .line 154
    sget p1, Ll/ycc0;->S:I

    .line 155
    .line 156
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    check-cast p1, Landroid/widget/ImageView;

    .line 161
    .line 162
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->f:Landroid/widget/ImageView;

    .line 163
    .line 164
    return-void
.end method

.method public final m(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/jec0;->j:I

    .line 6
    .line 7
    invoke-virtual {p1, v0, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final n()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->getPageListener()Ll/rx3$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->g:Ll/rx3$a;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, -0x1

    .line 14
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 18
    .line 19
    new-instance v1, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$a;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->b:Ll/w0c;

    .line 22
    .line 23
    invoke-direct {v1, p0, v2}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$a;-><init>(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;Ll/nxl;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setMKWebLoadListener(Ll/ilw;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public o(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->m(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->l(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->n()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "about:blank"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public r(Lcom/p1/mobile/putong/ui/webview/mk/a;Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->b:Ll/w0c;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$c;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    move-object v3, v2

    .line 10
    check-cast v3, Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    const-string v4, ""

    .line 13
    .line 14
    iget-object v5, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 15
    .line 16
    move-object v2, p0

    .line 17
    move-object v6, p1

    .line 18
    move-object v7, p3

    .line 19
    invoke-direct/range {v1 .. v7}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$c;-><init>(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/p1/mobile/putong/ui/webview/mk/a;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p2, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->H(Ljava/lang/String;Ll/qpl;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public s(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setCanLoadWhiteBgOnError(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public setVerticalScrollBarEnable(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setWebViewBg(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->DEFAULT_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-ne p1, v1, :cond_0

    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 24
    .line 25
    invoke-virtual {p0, v2}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const/4 v0, 0x2

    .line 39
    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 43
    .line 44
    const/4 p1, 0x1

    .line 45
    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public setWebViewLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setWebViewOverScrollMode(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setOverScrollMode(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setWithErrorView(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method public setWithProgressView(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->k:Z

    .line 2
    .line 3
    return-void
.end method
