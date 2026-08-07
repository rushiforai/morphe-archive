.class final Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->J0(IZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

.field final synthetic b:I

.field final synthetic c:Z

.field final synthetic d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;IZLjava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$e;->a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    iput p2, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$e;->b:I

    iput-boolean p3, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$e;->c:Z

    iput-object p4, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$e;->d:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$e;->b:I

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$e;->a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->getBinding()Ll/q9r;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p0, p0, Ll/q9r;->b:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setRefreshing(Z)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$e;->a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->getBinding()Ll/q9r;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v0, v0, Ll/q9r;->b:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setEnabled(Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$e;->a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$e;->d:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, p0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->setSwipeRefreshCallback(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$e;->a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->getBinding()Ll/q9r;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v0, v0, Ll/q9r;->b:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$e;->c:Z

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setEnabled(Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
