.class public Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;
.super Lcom/p1/mobile/putong/ui/webview/WebViewAct;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation$f;


# instance fields
.field public f:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:[Ljava/lang/String;

.field public h:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->f:Lrx/subjects/b;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    new-array v0, v0, [Ljava/lang/String;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->g:[Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public static a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    const/4 v3, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->k2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->o2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic h2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u672a\u5b89\u88c5\u5fae\u4fe1"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i2(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static k2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;
    .locals 7

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move v5, p5

    .line 8
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->l2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZZ)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static l2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZZ)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "title"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "url"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "hideNavigationBar"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p0, "isOpenUploadLog"

    .line 24
    .line 25
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    const-string p0, "hardwareAccelerated"

    .line 29
    .line 30
    invoke-virtual {v0, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    const-string p0, "transparent_status_bar"

    .line 34
    .line 35
    invoke-virtual {v0, p0, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    return-object v0
.end method


# virtual methods
.method public S(Ljava/lang/String;)Lrx/c;
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->f:Lrx/subjects/b;

    .line 2
    .line 3
    new-instance v1, Ll/ra;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/ra;-><init>(Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public c2()Ll/lup0;
    .locals 1

    .line 1
    new-instance v0, Ll/xa;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xa;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public d2()Ll/sup0;
    .locals 1

    .line 1
    new-instance v0, Ll/db;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/db;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public initDataOnCreate()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 5
    .line 6
    check-cast p0, Ll/db;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/db;->W()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public m2()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->g:[Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/ua;

    .line 8
    .line 9
    const-string v2, "share"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ll/ua;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 21
    .line 22
    check-cast p0, Ll/db;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/db;->Y()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0

    .line 33
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 34
    return p0
.end method

.method public n2()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic o2(Ljava/lang/String;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    new-array p1, p1, [Ljava/lang/String;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->g:[Ljava/lang/String;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const-string v0, ",\\s*"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->g:[Ljava/lang/String;

    .line 16
    .line 17
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 18
    .line 19
    check-cast p0, Ll/db;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/db;->X()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public p2()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 2
    .line 3
    check-cast v0, Ll/db;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/db;->Y()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/data/Link;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Link;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/sup0;->q()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 23
    .line 24
    new-instance v2, Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 25
    .line 26
    invoke-direct {v2, v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;-><init>(Lcom/p1/mobile/putong/data/Link;)V

    .line 27
    .line 28
    .line 29
    iget-object v3, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 32
    .line 33
    check-cast v0, Ll/db;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/db;->V()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->d:Ll/sup0;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/sup0;->q()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    const-string p0, "wechat-moments"

    .line 46
    .line 47
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v0, "wechat-session"

    .line 52
    .line 53
    invoke-static {v0}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    filled-new-array {p0, v0}, [Lcom/p1/mobile/putong/data/LinkChannel;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 62
    .line 63
    .line 64
    move-result-object v7

    .line 65
    sget p0, Ll/cbc0;->h0:I

    .line 66
    .line 67
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->U(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v9

    .line 71
    const/4 v4, 0x0

    .line 72
    const/4 v8, 0x0

    .line 73
    invoke-virtual/range {v2 .. v9}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    new-instance v0, Ll/sa;

    .line 78
    .line 79
    invoke-direct {v0}, Ll/sa;-><init>()V

    .line 80
    .line 81
    .line 82
    new-instance v1, Ll/ta;

    .line 83
    .line 84
    invoke-direct {v1}, Ll/ta;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->f:Lrx/subjects/b;

    .line 96
    .line 97
    const-string v0, "share"

    .line 98
    .line 99
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "isOpenUploadLog"

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 12
    .line 13
    .line 14
    iput-boolean v1, p0, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->h:Z

    .line 15
    .line 16
    return-void
.end method

.method public q2()V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {v0, p0}, Ll/bn5;->r(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
