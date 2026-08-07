.class Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->A2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$g;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public p()V
    .locals 4

    .line 1
    invoke-static {}, Ll/wi20;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$g;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->h1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, v2}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setRefreshing(Z)V

    .line 16
    .line 17
    .line 18
    sget v0, Lcom/hellogroup/mk/business/R$string;->a:I

    .line 19
    .line 20
    invoke-static {v0}, Ll/t1j0;->o(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$g;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object v0, v1, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->W:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    const-string v0, "MKActivity"

    .line 42
    .line 43
    const-string v1, "\u89e6\u53d1\u4e0b\u62c9\u5237\u65b0"

    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$g;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 49
    .line 50
    iget-object v1, v0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->W:Ljava/lang/String;

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    invoke-virtual {v1, v0, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$g;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 59
    .line 60
    invoke-static {v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$g;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 68
    .line 69
    invoke-static {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->j1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$h;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const-wide/16 v0, 0x3a98

    .line 74
    .line 75
    invoke-virtual {p0, v3, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$g;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 80
    .line 81
    invoke-static {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->h1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0, v2}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setRefreshing(Z)V

    .line 86
    .line 87
    .line 88
    return-void
.end method
