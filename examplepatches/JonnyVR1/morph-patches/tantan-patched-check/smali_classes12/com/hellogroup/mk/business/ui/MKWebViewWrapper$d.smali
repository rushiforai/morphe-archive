.class final Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->w0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0010\u0001\u001a\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0001\u0010\u0002"
    }
    d2 = {
        "",
        "p",
        "()V"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$d;->a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final p()V
    .locals 3

    .line 1
    invoke-static {}, Ll/wi20;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$d;->a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->getBinding()Ll/q9r;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p0, p0, Ll/q9r;->b:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v2}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setRefreshing(Z)V

    .line 20
    .line 21
    .line 22
    const-string p0, "\u7f51\u7edc\u5f02\u5e38"

    .line 23
    .line 24
    invoke-static {p0}, Ll/t1j0;->p(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {v1}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->getSwipeRefreshCallback()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$d;->a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 37
    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->getMkWebView()Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$d;->a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->getSwipeRefreshCallback()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {v0, p0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void

    .line 57
    :cond_2
    invoke-virtual {v1}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->getBinding()Ll/q9r;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iget-object p0, p0, Ll/q9r;->b:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v2}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setRefreshing(Z)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
