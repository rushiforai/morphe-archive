.class public final Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/hellogroup/mk/business/base/ui/MKWebView$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->u0(Ll/zlw;ZLjava/lang/String;ZLandroid/content/Intent;Ll/ilw;Lcom/hellogroup/mk/business/base/ui/MKWebView$f;Ll/x0c;Lkotlin/jvm/functions/Function1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0008*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J!\u0010\u0007\u001a\u00020\u00062\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J+\u0010\u000c\u001a\u00020\u00062\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u00022\u0006\u0010\n\u001a\u00020\t2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u0002H\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0019\u0010\u000e\u001a\u00020\u00062\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002H\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0019\u0010\u0010\u001a\u00020\u00062\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002H\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u000f\u00a8\u0006\u0011"
    }
    d2 = {
        "com/hellogroup/mk/business/ui/MKWebViewWrapper$c",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView$f;",
        "",
        "url",
        "",
        "isLoadOfflinePackage",
        "",
        "c",
        "(Ljava/lang/String;Z)V",
        "",
        "errorCode",
        "errDesc",
        "d",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "a",
        "(Ljava/lang/String;)V",
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


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

.field final synthetic b:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;Lcom/hellogroup/mk/business/base/ui/MKWebView$f;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hellogroup/mk/business/base/ui/MKWebView$f;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$c;->a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$c;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView$f;->a(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$c;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView$f;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "MKWebViewWrapper"

    .line 2
    .line 3
    const-string v1, "loadUrlEnd"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView$f;->b(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$c;->a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->K0(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public c(Ljava/lang/String;Z)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "MKWebViewWrapper"

    .line 2
    .line 3
    const-string v1, "loadUrlStart"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$c;->a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->K0(Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$c;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-interface {p0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView$f;->c(Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public d(Ljava/lang/String;ILjava/lang/String;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$c;->a:Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;->j0(Lcom/hellogroup/mk/business/ui/MKWebViewWrapper;)Ll/d2f;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    const-string v2, "\u7f51\u7edc\u9519\u8bef"

    .line 11
    .line 12
    invoke-virtual {v0, v1, p1, v2}, Ll/d2f;->h(ZLjava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/MKWebViewWrapper$c;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-interface {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebView$f;->d(Ljava/lang/String;ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method
