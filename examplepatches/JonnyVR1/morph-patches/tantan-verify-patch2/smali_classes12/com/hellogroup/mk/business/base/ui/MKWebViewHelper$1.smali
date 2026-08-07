.class Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$1;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$1;->a:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "mk.close.close_all_page"

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    const-string p1, "url"

    .line 17
    .line 18
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    array-length p2, p1

    .line 25
    const/4 v0, 0x0

    .line 26
    :goto_0
    if-ge v0, p2, :cond_2

    .line 27
    .line 28
    aget-object v1, p1, v0

    .line 29
    .line 30
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$1;->a:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getOriginURL()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$1;->a:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 51
    .line 52
    invoke-interface {p0}, Ll/ziw;->closePage()V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->x()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string p1, "\u5173\u95ed\u6240\u6709\u9875\u9762"

    .line 60
    .line 61
    invoke-static {p0, p1}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_3
    const-string v0, "mk.close.close_other_page"

    .line 66
    .line 67
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_4

    .line 72
    .line 73
    const-string p1, "webview_id"

    .line 74
    .line 75
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iget-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$1;->a:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 80
    .line 81
    invoke-static {p2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->y(Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-nez p1, :cond_4

    .line 90
    .line 91
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$1;->a:Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;

    .line 92
    .line 93
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 94
    .line 95
    invoke-interface {p0}, Ll/ziw;->closePage()V

    .line 96
    .line 97
    .line 98
    invoke-static {}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->x()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    const-string p1, "\u5173\u95ed\u5176\u4ed6\u9875\u9762"

    .line 103
    .line 104
    invoke-static {p0, p1}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :cond_4
    :goto_1
    return-void
.end method
