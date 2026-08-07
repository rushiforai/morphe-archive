.class public Ll/pd00$b;
.super Ll/dpf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pd00;->z()Ll/dpf0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic c:Ll/pd00;


# direct methods
.method public constructor <init>(Ll/pd00;Ll/nxl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/dpf0;-><init>(Ll/nxl;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    new-instance p1, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p2, "step"

    .line 7
    .line 8
    const-string p3, "onError"

    .line 9
    .line 10
    invoke-virtual {p1, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 14
    .line 15
    iget-object p3, p2, Ll/pd00;->n:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p2, p3, p1}, Ll/pd00;->W(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 21
    .line 22
    invoke-static {p1}, Ll/pd00;->k(Ll/pd00;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    :try_start_0
    iget-object p1, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 29
    .line 30
    iget-object p1, p1, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 31
    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getMkWebCaptureHelper()Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p2, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 39
    .line 40
    iget-object p2, p2, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->j(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    .line 45
    :catch_0
    :cond_0
    iget-object p0, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 46
    .line 47
    iget-object p0, p0, Ll/pd00;->j:Landroid/widget/LinearLayout;

    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public f(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "step"

    .line 7
    .line 8
    const-string v1, "onFinish"

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 14
    .line 15
    invoke-virtual {v0, p2, p1}, Ll/pd00;->W(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 22
    .line 23
    invoke-static {p1}, Ll/pd00;->j(Ll/pd00;)J

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 27
    .line 28
    iget-object p1, p1, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const/4 v0, 0x0

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 38
    .line 39
    iget-object p1, p1, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {p1, v1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p1, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 46
    .line 47
    iget-object p1, p1, Ll/pd00;->i:Landroid/widget/ProgressBar;

    .line 48
    .line 49
    const/16 v1, 0x8

    .line 50
    .line 51
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 55
    .line 56
    iget-object p1, p1, Ll/pd00;->m:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    iget-object p1, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 65
    .line 66
    iget-object p1, p1, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_2

    .line 73
    .line 74
    iget-object p1, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 75
    .line 76
    iget-object p1, p1, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-nez p1, :cond_2

    .line 87
    .line 88
    sget-object p1, Ll/rx3;->EMPTY_PAGE:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_2

    .line 95
    .line 96
    iget-object p1, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 97
    .line 98
    iget-object p1, p1, Ll/pd00;->j:Landroid/widget/LinearLayout;

    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_2

    .line 105
    .line 106
    iget-object p1, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 107
    .line 108
    iget-object p1, p1, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 109
    .line 110
    sget p2, Ll/ycc0;->J0:I

    .line 111
    .line 112
    invoke-virtual {p1, p2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iget-object p2, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 117
    .line 118
    if-nez p1, :cond_1

    .line 119
    .line 120
    invoke-static {p2}, Ll/pd00;->f(Ll/pd00;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iget-object p2, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 125
    .line 126
    iget-object p2, p2, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 127
    .line 128
    invoke-virtual {p2}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 136
    .line 137
    iget-object p2, p1, Ll/pd00;->b:Lv/navigationbar/VNavigationBar;

    .line 138
    .line 139
    iget-object p1, p1, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 140
    .line 141
    invoke-virtual {p1}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p2, p1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 146
    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_1
    iget-object p1, p2, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 150
    .line 151
    sget p2, Ll/ycc0;->J0:I

    .line 152
    .line 153
    invoke-virtual {p1, p2, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 157
    .line 158
    iget-object p1, p1, Ll/pd00;->C:Ll/x20;

    .line 159
    .line 160
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    if-eqz p1, :cond_3

    .line 165
    .line 166
    iget-object p0, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 167
    .line 168
    iget-object p0, p0, Ll/pd00;->C:Ll/x20;

    .line 169
    .line 170
    invoke-interface {p0}, Ll/x20;->call()V

    .line 171
    .line 172
    .line 173
    :cond_3
    return-void
.end method

.method public g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "step"

    .line 7
    .line 8
    const-string v2, "onStart"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 14
    .line 15
    invoke-virtual {v1, p2, v0}, Ll/pd00;->W(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 22
    .line 23
    invoke-static {v0}, Ll/pd00;->j(Ll/pd00;)J

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 27
    .line 28
    iget-object v0, v0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 37
    .line 38
    iget-object v0, v0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 39
    .line 40
    const/4 v1, 0x2

    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object v0, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 46
    .line 47
    invoke-static {v0}, Ll/pd00;->l(Ll/pd00;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    const/16 v1, 0x8

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    iget-object v0, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 56
    .line 57
    iget-object v0, v0, Ll/pd00;->i:Landroid/widget/ProgressBar;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    const-string v0, "&_offline=1"

    .line 64
    .line 65
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iget-object v2, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 70
    .line 71
    const/4 v3, 0x0

    .line 72
    if-nez v0, :cond_2

    .line 73
    .line 74
    const/4 v0, 0x1

    .line 75
    invoke-static {v2, v0}, Ll/pd00;->m(Ll/pd00;Z)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 79
    .line 80
    iget-object v0, v0, Ll/pd00;->i:Landroid/widget/ProgressBar;

    .line 81
    .line 82
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    invoke-static {v2, v3}, Ll/pd00;->m(Ll/pd00;Z)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 90
    .line 91
    iget-object v0, v0, Ll/pd00;->i:Landroid/widget/ProgressBar;

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 94
    .line 95
    .line 96
    :goto_0
    invoke-super {p0, p1, p2, p3}, Ll/dpf0;->g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public l(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/ilw;->l(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 5
    .line 6
    iget-object p2, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 7
    .line 8
    if-ne p2, p1, :cond_0

    .line 9
    .line 10
    invoke-static {p0}, Ll/pd00;->i(Ll/pd00;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 p1, 0x1

    .line 15
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public m(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pd00$b;->c:Ll/pd00;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/pd00;->L(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    invoke-super {p0, p1, p2}, Ll/ilw;->m(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
