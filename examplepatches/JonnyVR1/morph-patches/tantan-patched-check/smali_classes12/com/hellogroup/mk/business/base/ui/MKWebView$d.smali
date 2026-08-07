.class Lcom/hellogroup/mk/business/base/ui/MKWebView$d;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/base/ui/MKWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private lastSafeBrowsingHitT:J

.field final synthetic this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->lastSafeBrowsingHitT:J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public doUpdateVisitedHistory(Landroid/webkit/WebView;Ljava/lang/String;Z)V
    .locals 5

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->doUpdateVisitedHistory(Landroid/webkit/WebView;Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "lehua:boost:debug doUpdateVisitedHistory:before="

    .line 7
    .line 8
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v0, "   isFirstUrl="

    .line 15
    .line 16
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v1, "  isNeedClearHistory="

    .line 33
    .line 34
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 38
    .line 39
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->C(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v2, "  delayInjectState="

    .line 47
    .line 48
    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 52
    .line 53
    invoke-static {v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    const-string v3, "MK---WebView"

    .line 65
    .line 66
    invoke-static {v3, p3}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 70
    .line 71
    invoke-static {p3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->C(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z

    .line 72
    .line 73
    .line 74
    move-result p3

    .line 75
    if-eqz p3, :cond_0

    .line 76
    .line 77
    new-instance p3, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string v4, "lehua:boost doUpdateVisitedHistory clearHistory: "

    .line 80
    .line 81
    invoke-direct {p3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p3

    .line 91
    invoke-static {v3, p3}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Landroid/webkit/WebView;->clearHistory()V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 98
    .line 99
    const/4 p3, 0x0

    .line 100
    invoke-static {p1, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->D(Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)Z

    .line 101
    .line 102
    .line 103
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    const-string p3, "lehua:boost:debug doUpdateVisitedHistory:after="

    .line 106
    .line 107
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    iget-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 117
    .line 118
    invoke-static {p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 123
    .line 124
    .line 125
    move-result p2

    .line 126
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 133
    .line 134
    invoke-static {p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->C(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 145
    .line 146
    invoke-static {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-static {v3, p0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public onDealRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    move v1, v0

    .line 23
    :goto_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 24
    .line 25
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 32
    .line 33
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    move v2, v0

    .line 43
    :goto_1
    if-ge v1, v2, :cond_2

    .line 44
    .line 45
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 46
    .line 47
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 58
    .line 59
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Ll/ilw;

    .line 68
    .line 69
    invoke-virtual {v2, p1, p2}, Ll/ilw;->l(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    .line 71
    .line 72
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    return-void

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    const-string p1, "MK---WebView"

    .line 78
    .line 79
    const-string p2, ""

    .line 80
    .line 81
    invoke-static {p1, p2, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-static {}, Ll/rs8;->e()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, p2}, Ll/xkw;->K(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, p2}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;->i(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void

    .line 41
    :catch_0
    move-exception p0

    .line 42
    const-string p1, "MK---WebView"

    .line 43
    .line 44
    const-string p2, ""

    .line 45
    .line 46
    invoke-static {p1, p2, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->e()Lcom/hellogroup/mk/core/log/global/MKGlobalLog;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 6
    .line 7
    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->c0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 12
    .line 13
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v1, p2, v2}, Lcom/hellogroup/mk/core/log/global/MKGlobalLog;->u(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->F(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 23
    .line 24
    .line 25
    if-eqz p1, :cond_b

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_b

    .line 32
    .line 33
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    goto/16 :goto_3

    .line 42
    .line 43
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v1, "lehua:boost:debug onPageFinished="

    .line 46
    .line 47
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "   isFirstUrl="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 59
    .line 60
    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v1, "  isNeedClearHistory="

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 77
    .line 78
    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->C(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v1, "  delayInjectState="

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 91
    .line 92
    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const-string v1, "MK---WebView"

    .line 104
    .line 105
    invoke-static {v1, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p2}, Ll/glw;->g(Ljava/lang/String;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    const/4 v2, 0x0

    .line 113
    if-nez v0, :cond_1

    .line 114
    .line 115
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 116
    .line 117
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_1

    .line 126
    .line 127
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 128
    .line 129
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1}, Landroid/webkit/WebView;->clearHistory()V

    .line 137
    .line 138
    .line 139
    :cond_1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 140
    .line 141
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 149
    .line 150
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-static {v0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {v0, p2}, Ll/xkw;->L(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 165
    .line 166
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->q(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    const/4 v3, 0x1

    .line 171
    if-nez v0, :cond_2

    .line 172
    .line 173
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 174
    .line 175
    invoke-static {v0, v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->r(Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)Z

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 179
    .line 180
    const-string v4, "onPageFinished"

    .line 181
    .line 182
    invoke-static {v0, v4}, Ll/c2f;->e(Ll/hul;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    :cond_2
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 186
    .line 187
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    if-eqz v0, :cond_5

    .line 192
    .line 193
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 194
    .line 195
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-lez v0, :cond_5

    .line 204
    .line 205
    move v0, v2

    .line 206
    :goto_0
    iget-object v4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 207
    .line 208
    invoke-static {v4}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 209
    .line 210
    .line 211
    move-result-object v4

    .line 212
    if-eqz v4, :cond_3

    .line 213
    .line 214
    iget-object v4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 215
    .line 216
    invoke-static {v4}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 217
    .line 218
    .line 219
    move-result-object v4

    .line 220
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 221
    .line 222
    .line 223
    move-result v4

    .line 224
    goto :goto_1

    .line 225
    :cond_3
    move v4, v2

    .line 226
    :goto_1
    if-ge v0, v4, :cond_5

    .line 227
    .line 228
    iget-object v4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 229
    .line 230
    invoke-static {v4}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 231
    .line 232
    .line 233
    move-result-object v4

    .line 234
    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v4

    .line 238
    if-eqz v4, :cond_4

    .line 239
    .line 240
    iget-object v4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 241
    .line 242
    invoke-static {v4}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 243
    .line 244
    .line 245
    move-result-object v4

    .line 246
    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v4

    .line 250
    check-cast v4, Ll/ilw;

    .line 251
    .line 252
    invoke-virtual {v4, p1, p2}, Ll/ilw;->f(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 256
    .line 257
    goto :goto_0

    .line 258
    :cond_5
    sget-object v0, Ll/auf;->INSTANCE:Ll/auf;

    .line 259
    .line 260
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 261
    .line 262
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->o(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    invoke-virtual {v0, v2, p2}, Ll/auf;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 270
    .line 271
    invoke-virtual {v0, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N0(Ljava/lang/String;)Z

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    if-nez v0, :cond_6

    .line 276
    .line 277
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 278
    .line 279
    invoke-static {v0, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->x(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)Z

    .line 280
    .line 281
    .line 282
    move-result v0

    .line 283
    if-eqz v0, :cond_7

    .line 284
    .line 285
    :cond_6
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 286
    .line 287
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getCurrentLogKey()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    invoke-static {}, Ll/mkw;->f()Ll/mkw;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    invoke-virtual {v2, v0}, Ll/mkw;->g(Ljava/lang/String;)Ll/pxl;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    if-eqz v2, :cond_7

    .line 300
    .line 301
    check-cast v2, Ll/vkw;

    .line 302
    .line 303
    invoke-virtual {v2}, Ll/vkw;->n()V

    .line 304
    .line 305
    .line 306
    invoke-virtual {v2}, Ll/vkw;->m()Z

    .line 307
    .line 308
    .line 309
    invoke-virtual {v2}, Ll/djw;->g()V

    .line 310
    .line 311
    .line 312
    invoke-static {}, Ll/mkw;->f()Ll/mkw;

    .line 313
    .line 314
    .line 315
    move-result-object v4

    .line 316
    invoke-virtual {v4, v2}, Ll/mkw;->j(Ll/pxl;)Z

    .line 317
    .line 318
    .line 319
    invoke-static {}, Ll/mkw;->f()Ll/mkw;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    invoke-virtual {v2, v0}, Ll/mkw;->i(Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    :cond_7
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 327
    .line 328
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    if-eqz v0, :cond_8

    .line 333
    .line 334
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 335
    .line 336
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    invoke-interface {v0, p1, p2}, Ll/grp0;->b(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 341
    .line 342
    .line 343
    :cond_8
    :try_start_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 344
    .line 345
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 346
    .line 347
    .line 348
    move-result-object p1

    .line 349
    if-eqz p1, :cond_9

    .line 350
    .line 351
    invoke-static {}, Ll/yfi;->o()Z

    .line 352
    .line 353
    .line 354
    move-result p1

    .line 355
    if-eqz p1, :cond_9

    .line 356
    .line 357
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 358
    .line 359
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->s(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z

    .line 360
    .line 361
    .line 362
    move-result p1

    .line 363
    if-nez p1, :cond_9

    .line 364
    .line 365
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 366
    .line 367
    invoke-static {p1, v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->t(Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)Z

    .line 368
    .line 369
    .line 370
    const-string p1, "\u4f4e\u7248\u672c\u624b\u673a\uff0conPageFinished \u5173\u95edUI\u589e\u5f3a"

    .line 371
    .line 372
    invoke-static {v1, p1}, Ll/jzv;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 376
    .line 377
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 378
    .line 379
    .line 380
    move-result-object p1

    .line 381
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 382
    .line 383
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Z(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object v0

    .line 387
    invoke-interface {p1, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$f;->a(Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 391
    .line 392
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 393
    .line 394
    .line 395
    move-result-object p1

    .line 396
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 397
    .line 398
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Z(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    invoke-interface {p1, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$f;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 403
    .line 404
    .line 405
    goto :goto_2

    .line 406
    :catch_0
    move-exception p1

    .line 407
    const-string v0, ""

    .line 408
    .line 409
    invoke-static {v1, v0, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 410
    .line 411
    .line 412
    :cond_9
    :goto_2
    sget-object p1, Ll/dlw;->INSTANCE:Ll/dlw;

    .line 413
    .line 414
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 415
    .line 416
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->c0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object v0

    .line 420
    invoke-virtual {p1, v0}, Ll/dlw;->m(Ljava/lang/String;)V

    .line 421
    .line 422
    .line 423
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 424
    .line 425
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getCheckOfflineInfo()Ll/y35;

    .line 426
    .line 427
    .line 428
    move-result-object p1

    .line 429
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 430
    .line 431
    iget-object v0, v0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->s:Ll/x4d0;

    .line 432
    .line 433
    invoke-static {p1, v0}, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil;->a(Ll/y35;Ll/x4d0;)V

    .line 434
    .line 435
    .line 436
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 437
    .line 438
    .line 439
    move-result-wide v0

    .line 440
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 441
    .line 442
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H(Lcom/hellogroup/mk/business/base/ui/MKWebView;)J

    .line 443
    .line 444
    .line 445
    move-result-wide v4

    .line 446
    sub-long/2addr v0, v4

    .line 447
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 448
    .line 449
    .line 450
    move-result-object p1

    .line 451
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 452
    .line 453
    .line 454
    move-result-object p1

    .line 455
    const-string v0, "mk loadFinished cost: %d ms"

    .line 456
    .line 457
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 458
    .line 459
    .line 460
    move-result-object p1

    .line 461
    const-string v0, "webRsa"

    .line 462
    .line 463
    invoke-static {v0, p1}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 464
    .line 465
    .line 466
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 467
    .line 468
    invoke-static {p1, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I(Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 469
    .line 470
    .line 471
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 472
    .line 473
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->J(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z

    .line 474
    .line 475
    .line 476
    move-result p1

    .line 477
    if-nez p1, :cond_a

    .line 478
    .line 479
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 480
    .line 481
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 482
    .line 483
    .line 484
    move-result-object v0

    .line 485
    invoke-static {p1, v0}, Ll/yfi;->c(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)Z

    .line 486
    .line 487
    .line 488
    move-result v0

    .line 489
    invoke-static {p1, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K(Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)Z

    .line 490
    .line 491
    .line 492
    :cond_a
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 493
    .line 494
    invoke-static {p1, p2}, Ll/yfi;->e(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 495
    .line 496
    .line 497
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 498
    .line 499
    iput-boolean v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I:Z

    .line 500
    .line 501
    :cond_b
    :goto_3
    return-void
.end method

.method public final onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->w(Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->r(Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-lez v0, :cond_2

    .line 35
    .line 36
    move v0, v1

    .line 37
    :goto_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 38
    .line 39
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    if-eqz v2, :cond_0

    .line 44
    .line 45
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 46
    .line 47
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    goto :goto_1

    .line 56
    :cond_0
    move v2, v1

    .line 57
    :goto_1
    if-ge v0, v2, :cond_2

    .line 58
    .line 59
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 60
    .line 61
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    if-eqz v2, :cond_1

    .line 70
    .line 71
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 72
    .line 73
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Ll/ilw;

    .line 82
    .line 83
    invoke-virtual {v2, p1, p2, p3}, Ll/ilw;->g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 84
    .line 85
    .line 86
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_2
    :try_start_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-static {v0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0, p2}, Ll/xkw;->M(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .line 101
    .line 102
    goto :goto_2

    .line 103
    :catch_0
    move-exception v0

    .line 104
    const-string v1, "MK---WebView"

    .line 105
    .line 106
    const-string v2, ""

    .line 107
    .line 108
    invoke-static {v1, v2, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 109
    .line 110
    .line 111
    :goto_2
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 112
    .line 113
    invoke-virtual {v0, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N0(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_3

    .line 118
    .line 119
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 120
    .line 121
    invoke-static {v0, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->x(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_4

    .line 126
    .line 127
    :cond_3
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 128
    .line 129
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getCurrentLogKey()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-static {}, Ll/mkw;->f()Ll/mkw;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v1, v0}, Ll/mkw;->g(Ljava/lang/String;)Ll/pxl;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    if-eqz v1, :cond_4

    .line 142
    .line 143
    check-cast v1, Ll/vkw;

    .line 144
    .line 145
    invoke-virtual {v1}, Ll/vkw;->o()V

    .line 146
    .line 147
    .line 148
    invoke-static {}, Ll/mkw;->f()Ll/mkw;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    invoke-virtual {v2, v0, v1}, Ll/mkw;->h(Ljava/lang/String;Ll/pxl;)Z

    .line 153
    .line 154
    .line 155
    :cond_4
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    if-eqz v0, :cond_5

    .line 162
    .line 163
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 164
    .line 165
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getBid()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    if-eqz v0, :cond_5

    .line 170
    .line 171
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 172
    .line 173
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-interface {v0, p1, p2, p3}, Ll/grp0;->a(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 178
    .line 179
    .line 180
    :cond_5
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 181
    .line 182
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    if-eqz p1, :cond_6

    .line 187
    .line 188
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 189
    .line 190
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;->j()V

    .line 195
    .line 196
    .line 197
    :cond_6
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 198
    .line 199
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->y(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    if-nez p1, :cond_7

    .line 204
    .line 205
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 206
    .line 207
    invoke-static {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-static {p0, p1}, Ll/yfi;->d(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)Z

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    invoke-static {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->z(Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)Z

    .line 216
    .line 217
    .line 218
    :cond_7
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 76
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 77
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    invoke-static {v0, p1, p4, p2, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/webkit/WebView;Ljava/lang/String;ILjava/lang/String;)V

    .line 78
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    const-string v2, "ERR_2.1"

    const-string v3, "onReceivedError1"

    move v5, p2

    move-object v6, p3

    move-object v4, p4

    invoke-static/range {v1 .. v6}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V
    .locals 11
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x17
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 5
    .line 6
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getErrorCode()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getDescription()Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    const-string v4, ""

    .line 23
    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getDescription()Ljava/lang/CharSequence;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move-object v3, v4

    .line 36
    :goto_0
    invoke-static {v0, p1, v1, v2, v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/webkit/WebView;Ljava/lang/String;ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v5, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 40
    .line 41
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v8

    .line 49
    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getErrorCode()I

    .line 50
    .line 51
    .line 52
    move-result v9

    .line 53
    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getDescription()Ljava/lang/CharSequence;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    invoke-virtual {p3}, Landroid/webkit/WebResourceError;->getDescription()Ljava/lang/CharSequence;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    :cond_1
    move-object v10, v4

    .line 68
    const-string v6, "ERR_2.1"

    .line 69
    .line 70
    const-string v7, "onReceivedError2"

    .line 71
    .line 72
    invoke-static/range {v5 .. v10}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V
    .locals 6
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Z(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {p1, v0}, Ll/i8g0;->a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 31
    .line 32
    invoke-static {v1, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->W(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 39
    .line 40
    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->w0(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {p3}, Landroid/webkit/WebResourceResponse;->getStatusCode()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    invoke-virtual {p3}, Landroid/webkit/WebResourceResponse;->getReasonPhrase()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-interface {v0, v1, v2, v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView$f;->d(Ljava/lang/String;ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 80
    .line 81
    if-eqz p1, :cond_1

    .line 82
    .line 83
    const-string v1, "ERR_1.3"

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    const-string v1, "ERR_2.1"

    .line 87
    .line 88
    :goto_0
    if-eqz p1, :cond_2

    .line 89
    .line 90
    const-string p1, "Html Fail"

    .line 91
    .line 92
    :goto_1
    move-object v2, p1

    .line 93
    goto :goto_2

    .line 94
    :cond_2
    const-string p1, "onReceivedHttpError"

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :goto_2
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-virtual {p3}, Landroid/webkit/WebResourceResponse;->getStatusCode()I

    .line 106
    .line 107
    .line 108
    move-result v4

    .line 109
    invoke-virtual {p3}, Landroid/webkit/WebResourceResponse;->getReasonPhrase()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    invoke-static/range {v0 .. v5}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 117
    .line 118
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    if-eqz p1, :cond_3

    .line 123
    .line 124
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 125
    .line 126
    invoke-static {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p0, p3}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;->l(Landroid/webkit/WebResourceResponse;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    .line 132
    .line 133
    :cond_3
    return-void

    .line 134
    :catch_0
    move-exception v0

    .line 135
    move-object p0, v0

    .line 136
    const-string p1, "MK---WebView"

    .line 137
    .line 138
    const-string p2, ""

    .line 139
    .line 140
    invoke-static {p1, p2, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "tang------onReceivedSslError "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "MK---WebView"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v1, "mkweb dns error: "

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "DNSTest"

    .line 35
    .line 36
    invoke-static {v1, v0}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 48
    .line 49
    invoke-static {v0, p2, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->X(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 53
    .line 54
    if-eqz p3, :cond_1

    .line 55
    .line 56
    invoke-virtual {p3}, Landroid/net/http/SslError;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    goto :goto_0

    .line 61
    :cond_1
    const/4 v1, 0x0

    .line 62
    :goto_0
    const/16 v2, -0x22b8

    .line 63
    .line 64
    invoke-static {v0, v2, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Y(Lcom/hellogroup/mk/business/base/ui/MKWebView;ILjava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 68
    .line 69
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 76
    .line 77
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-lez v0, :cond_4

    .line 86
    .line 87
    const/4 v0, 0x0

    .line 88
    move v1, v0

    .line 89
    :goto_1
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 90
    .line 91
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    if-eqz v2, :cond_2

    .line 96
    .line 97
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 98
    .line 99
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    goto :goto_2

    .line 108
    :cond_2
    move v2, v0

    .line 109
    :goto_2
    if-ge v1, v2, :cond_4

    .line 110
    .line 111
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 112
    .line 113
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    if-eqz v2, :cond_3

    .line 122
    .line 123
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 124
    .line 125
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    check-cast v2, Ll/ilw;

    .line 134
    .line 135
    invoke-virtual {v2, p1, p2, p3}, Ll/ilw;->j(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    .line 136
    .line 137
    .line 138
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_4
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 142
    .line 143
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    if-eqz p1, :cond_5

    .line 148
    .line 149
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 150
    .line 151
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getOriginURL()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-interface {p1, v0, p2, p3}, Ll/grp0;->e(Ljava/lang/String;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    .line 162
    .line 163
    .line 164
    :cond_5
    if-eqz p3, :cond_6

    .line 165
    .line 166
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 167
    .line 168
    invoke-virtual {p3}, Landroid/net/http/SslError;->getUrl()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    invoke-virtual {p3}, Landroid/net/http/SslError;->getPrimaryError()I

    .line 173
    .line 174
    .line 175
    move-result v5

    .line 176
    invoke-virtual {p3}, Landroid/net/http/SslError;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v6

    .line 180
    const-string v2, "ERR_2.1"

    .line 181
    .line 182
    const-string v3, "onReceivedSslError"

    .line 183
    .line 184
    invoke-static/range {v1 .. v6}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 185
    .line 186
    .line 187
    :cond_6
    return-void
.end method

.method public onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z
    .locals 7
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x1a
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/nlw;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 18
    .line 19
    new-instance v1, Ll/nlw;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/nlw;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ll/nlw;)Ll/nlw;

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-static {p2}, Ll/ejt0;->a(Landroid/webkit/RenderProcessGoneDetail;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    const/4 v3, 0x0

    .line 35
    if-nez v0, :cond_3

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v4, "System killed the WebView rendering process for out of memory, RendererPriority: "

    .line 48
    .line 49
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p2}, Ll/fjt0;->a(Landroid/webkit/RenderProcessGoneDetail;)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Ll/xkw;->P(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 67
    .line 68
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 75
    .line 76
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 85
    .line 86
    if-eqz v1, :cond_2

    .line 87
    .line 88
    check-cast v0, Landroid/view/ViewGroup;

    .line 89
    .line 90
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 91
    .line 92
    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S0()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_1

    .line 106
    .line 107
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 108
    .line 109
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->destroy()V

    .line 114
    .line 115
    .line 116
    :cond_1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 117
    .line 118
    invoke-static {v0, v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->T(Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 119
    .line 120
    .line 121
    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->onDealRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V

    .line 122
    .line 123
    .line 124
    return v2

    .line 125
    :cond_3
    invoke-virtual {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-static {v0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    new-instance v1, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    const-string v4, "The WebView rendering process crashed! RendererPriority: "

    .line 136
    .line 137
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-static {p2}, Ll/fjt0;->a(Landroid/webkit/RenderProcessGoneDetail;)I

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {v0, v1}, Ll/xkw;->P(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-static {}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->e()Lcom/hellogroup/mk/core/log/global/MKGlobalLog;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 159
    .line 160
    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Z(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    iget-object v4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 165
    .line 166
    invoke-static {v4}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    invoke-static {p2}, Ll/fjt0;->a(Landroid/webkit/RenderProcessGoneDetail;)I

    .line 171
    .line 172
    .line 173
    move-result v5

    .line 174
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 175
    .line 176
    .line 177
    move-result-object v5

    .line 178
    invoke-static {}, Ll/sjw;->n()Z

    .line 179
    .line 180
    .line 181
    move-result v6

    .line 182
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 183
    .line 184
    .line 185
    move-result-object v6

    .line 186
    invoke-virtual {v0, v1, v4, v5, v6}, Lcom/hellogroup/mk/core/log/global/MKGlobalLog;->x(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 190
    .line 191
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    if-eqz v0, :cond_5

    .line 196
    .line 197
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 198
    .line 199
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 208
    .line 209
    if-eqz v1, :cond_5

    .line 210
    .line 211
    check-cast v0, Landroid/view/ViewGroup;

    .line 212
    .line 213
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 214
    .line 215
    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 223
    .line 224
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S0()Z

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    if-nez v0, :cond_4

    .line 229
    .line 230
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 231
    .line 232
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->destroy()V

    .line 237
    .line 238
    .line 239
    :cond_4
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 240
    .line 241
    invoke-static {v0, v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->T(Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 242
    .line 243
    .line 244
    :cond_5
    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->onDealRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V

    .line 245
    .line 246
    .line 247
    return v2
.end method

.method public onSafeBrowsingHit(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;ILandroid/webkit/SafeBrowsingResponse;)V
    .locals 6

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onSafeBrowsingHit(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;ILandroid/webkit/SafeBrowsingResponse;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iget-wide v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->lastSafeBrowsingHitT:J

    .line 9
    .line 10
    sub-long v2, v0, v2

    .line 11
    .line 12
    const-wide/16 v4, 0x3e8

    .line 13
    .line 14
    cmp-long p1, v2, v4

    .line 15
    .line 16
    if-gez p1, :cond_0

    .line 17
    .line 18
    goto/16 :goto_2

    .line 19
    .line 20
    :cond_0
    iput-wide v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->lastSafeBrowsingHitT:J

    .line 21
    .line 22
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->v(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_6

    .line 29
    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const-string p1, ""

    .line 44
    .line 45
    :goto_0
    const/4 p2, 0x1

    .line 46
    if-eq p3, p2, :cond_5

    .line 47
    .line 48
    const/4 p2, 0x2

    .line 49
    if-eq p3, p2, :cond_4

    .line 50
    .line 51
    const/4 p2, 0x3

    .line 52
    if-eq p3, p2, :cond_3

    .line 53
    .line 54
    const/4 p2, 0x4

    .line 55
    if-eq p3, p2, :cond_2

    .line 56
    .line 57
    const-string p2, "SAFE_BROWSING_THREAT_UNKNOWN"

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    const-string p2, "SAFE_BROWSING_THREAT_BILLING"

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    const-string p2, "SAFE_BROWSING_THREAT_UNWANTED_SOFTWARE"

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_4
    const-string p2, "SAFE_BROWSING_THREAT_PHISHING"

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_5
    const-string p2, "SAFE_BROWSING_THREAT_MALWARE"

    .line 70
    .line 71
    :goto_1
    new-instance p4, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v0, "onSafeBrowsingHit,threatType: "

    .line 74
    .line 75
    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v0, ",URL: "

    .line 82
    .line 83
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p4

    .line 93
    const-string v0, "MK---WebView"

    .line 94
    .line 95
    invoke-static {v0, p4}, Ll/jzv;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-static {p0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    new-instance p4, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string p2, "(threatType="

    .line 117
    .line 118
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string p2, ")"

    .line 125
    .line 126
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    invoke-virtual {p0, p2, p1}, Ll/xkw;->O(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_6
    :goto_2
    return-void
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    const-string v0, "lehua:offline  \u52a0\u8f7d\u7ebf\u4e0a\u8d44\u6e90: mkweb handleAllRequest failed: "

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-static {v1, p1, v2, v3, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 29
    .line 30
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 37
    .line 38
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v2, v3, v1}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;->h(Ljava/lang/String;Landroid/webkit/WebResourceResponse;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    if-eqz v1, :cond_2

    .line 54
    .line 55
    return-object v1

    .line 56
    :cond_2
    :try_start_0
    const-string v1, "DNSTest"

    .line 57
    .line 58
    new-instance v2, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v1, v0}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :catch_0
    move-exception v0

    .line 83
    const-string v1, "MK---WebView"

    .line 84
    .line 85
    const-string v2, ""

    .line 86
    .line 87
    invoke-static {v1, v2, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    :goto_0
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    sget-object v1, Ll/auf;->INSTANCE:Ll/auf;

    .line 99
    .line 100
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 101
    .line 102
    invoke-static {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/Map;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-virtual {v1, p2, v2, p1}, Ll/auf;->g(Landroid/webkit/WebResourceRequest;Ljava/util/Map;Landroid/webkit/WebView;)Landroid/webkit/WebResourceResponse;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    if-eqz p2, :cond_3

    .line 111
    .line 112
    return-object p2

    .line 113
    :cond_3
    invoke-super {p0, p1, v0}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    return-object p0
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 118
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    const/4 v1, 0x0

    invoke-static {v0, p1, p2, v1, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    move-result-object v0

    .line 119
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 120
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    invoke-static {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    move-result-object v1

    invoke-virtual {v1, p2, v0}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;->h(Ljava/lang/String;Landroid/webkit/WebResourceResponse;)V

    :cond_0
    if-eqz v0, :cond_1

    return-object v0

    .line 121
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "lehua:offline \u52a0\u8f7d\u7ebf\u4e0a\u8d44\u6e90: mkweb handleAllRequest failed: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "DNSTest"

    invoke-static {v1, v0}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "shouldInterceptRequest====="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MK---WebView"

    invoke-static {v1, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object p0

    return-object p0
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->L(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/tm80;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->L(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/tm80;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0, p2}, Ll/tm80;->a(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    move v0, v2

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v0, v1

    .line 26
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v4, "tang------shouldOverrideUrlLoading "

    .line 29
    .line 30
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v4, "   hasProcessed "

    .line 37
    .line 38
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    const-string v4, "MK---WebView"

    .line 49
    .line 50
    invoke-static {v4, v3}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    const-string p0, "tang------shouldOverrideUrlLoading \u5df2\u7ecf\u88ab\u5904\u7406\uff0c\u4e0d\u9700\u8981\u989d\u5916\u5904\u7406"

    .line 56
    .line 57
    invoke-static {v4, p0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return v2

    .line 61
    :cond_1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 62
    .line 63
    invoke-virtual {v0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->t1(Landroid/webkit/WebView;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    return v2

    .line 70
    :cond_2
    invoke-static {p2}, Ll/bwi0;->a(Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_3

    .line 75
    .line 76
    const-string p0, "url host in 3rd white host list"

    .line 77
    .line 78
    invoke-static {v4, p0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return v1

    .line 82
    :cond_3
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 83
    .line 84
    invoke-static {v0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/webkit/WebView;Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_4

    .line 89
    .line 90
    return v2

    .line 91
    :cond_4
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;->this$0:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 92
    .line 93
    invoke-virtual {p0, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return v2
.end method
