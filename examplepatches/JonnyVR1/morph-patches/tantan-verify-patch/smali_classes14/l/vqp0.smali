.class public Ll/vqp0;
.super Ll/sup0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/sup0<",
        "Ll/tqp0;",
        ">;"
    }
.end annotation


# instance fields
.field public F:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sup0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(Ll/vqp0;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vqp0;->V(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic P(Ll/vqp0;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vqp0;->F:Ljava/util/Map;

    return-object p0
.end method

.method public static synthetic Q(Ll/vqp0;)Ll/lup0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sup0;->i:Ll/lup0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R(Ll/vqp0;)Ll/lup0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sup0;->i:Ll/lup0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic S(Ll/vqp0;)Ll/lup0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sup0;->i:Ll/lup0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic T(Ll/vqp0;)Ll/lup0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sup0;->i:Ll/lup0;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic V(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    return-object p0
.end method


# virtual methods
.method public A(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/vqp0;->F:Ljava/util/Map;

    .line 2
    .line 3
    iget-object v0, p0, Ll/sup0;->i:Ll/lup0;

    .line 4
    .line 5
    check-cast v0, Ll/tqp0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/tqp0;->o0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "p_mytantan"

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/sup0;->i:Ll/lup0;

    .line 20
    .line 21
    check-cast p0, Ll/tqp0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/tqp0;->n0()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-super {p0, p1}, Ll/sup0;->A(Ljava/util/Map;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public U()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sup0;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    new-instance v1, Ll/vqp0$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/vqp0$a;-><init>(Ll/vqp0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public W()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sup0;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/sup0;->e:Landroid/widget/ProgressBar;

    .line 8
    .line 9
    const/16 v0, 0x8

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    const-string p0, "\u7f51\u7edc\u9519\u8bef"

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public X(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 4

    .line 1
    new-instance v0, Ll/zpq;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sup0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v3, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3}, Ll/zpq;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/sup0;->A:Ll/zpq;

    .line 15
    .line 16
    new-instance v0, Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/sup0;->q()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    const-string v1, "H5-Authorization"

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 34
    .line 35
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object p1, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 39
    .line 40
    const/4 v1, 0x2

    .line 41
    invoke-virtual {p1, v1}, Landroid/view/View;->setOverScrollMode(I)V

    .line 42
    .line 43
    .line 44
    invoke-super {p0, v0}, Ll/sup0;->A(Ljava/util/Map;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public u()Ll/qcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/qcj<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/uqp0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uqp0;-><init>(Ll/vqp0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public v()Ll/rx3$a;
    .locals 2

    .line 1
    invoke-super {p0}, Ll/sup0;->v()Ll/rx3$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/vqp0$b;

    .line 6
    .line 7
    invoke-direct {v1, p0, v0}, Ll/vqp0$b;-><init>(Ll/vqp0;Ll/rx3$a;)V

    .line 8
    .line 9
    .line 10
    return-object v1
.end method
