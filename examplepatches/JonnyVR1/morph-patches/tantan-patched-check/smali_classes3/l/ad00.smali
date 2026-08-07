.class public Ll/ad00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hqq;


# instance fields
.field public final a:Ll/tc00;

.field public final b:Lcom/p1/mobile/putong/app/PutongAct;

.field public final c:Lcom/hellogroup/mk/business/base/ui/MKWebView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/app/PutongAct;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/hellogroup/mk/business/base/ui/MKWebView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tc00;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/tc00;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ad00;->a:Ll/tc00;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ad00;->b:Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    iput-object p2, p0, Ll/ad00;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ad00;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/ad00;->a:Ll/tc00;

    .line 9
    .line 10
    iget-object p0, p0, Ll/ad00;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    invoke-virtual {v0, p0, p1}, Ll/tc00;->f(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public varargs b(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ad00;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/ad00;->a:Ll/tc00;

    .line 9
    .line 10
    iget-object p0, p0, Ll/ad00;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    invoke-virtual {v0, p0, p1, p2}, Ll/tc00;->i(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;[Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public varargs c(Ljava/lang/String;Ll/y20;[Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ad00;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/ad00;->a:Ll/tc00;

    .line 9
    .line 10
    iget-object p0, p0, Ll/ad00;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    invoke-virtual {v0, p0, p1, p2, p3}, Ll/tc00;->j(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;Ll/y20;[Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public varargs d(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ad00;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/ad00;->a:Ll/tc00;

    .line 9
    .line 10
    iget-object p0, p0, Ll/ad00;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    invoke-virtual {v0, p0, p1, p2}, Ll/tc00;->k(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;[Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public varargs e(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ad00;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/ad00;->a:Ll/tc00;

    .line 9
    .line 10
    iget-object p0, p0, Ll/ad00;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    invoke-virtual {v0, p0, p1, p2}, Ll/tc00;->l(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;[Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ad00;->b:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
