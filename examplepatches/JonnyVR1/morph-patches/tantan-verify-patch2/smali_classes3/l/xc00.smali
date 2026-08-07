.class public Ll/xc00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqq;


# instance fields
.field public final a:Ll/wc00;

.field public final b:Lcom/p1/mobile/putong/app/PutongAct;

.field public final c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field public final d:Ljava/lang/String;

.field public e:Ll/ad00;


# direct methods
.method public constructor <init>(Ll/wc00;Lcom/p1/mobile/putong/app/PutongAct;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xc00;->a:Ll/wc00;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xc00;->b:Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    iput-object p3, p0, Ll/xc00;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 9
    .line 10
    iput-object p4, p0, Ll/xc00;->d:Ljava/lang/String;

    .line 11
    .line 12
    new-instance p1, Ll/ad00;

    .line 13
    .line 14
    invoke-direct {p1, p2, p3}, Ll/ad00;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/xc00;->e:Ll/ad00;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public bridge synthetic a()Landroid/webkit/WebView;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xc00;->e()Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xc00;->b:Lcom/p1/mobile/putong/app/PutongAct;

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

.method public c()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xc00;->b:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/hqq;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xc00;->e:Ll/ad00;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/hellogroup/mk/business/base/ui/MKWebView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xc00;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    return-object p0
.end method

.method public varargs f(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xc00;->a:Ll/wc00;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/wc00;->G(Ljava/lang/String;[Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xc00;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
