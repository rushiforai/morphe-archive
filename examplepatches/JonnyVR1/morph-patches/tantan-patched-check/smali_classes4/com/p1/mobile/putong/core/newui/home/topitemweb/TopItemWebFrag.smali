.class public Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;
.super Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;
.source "SourceFile"


# instance fields
.field public B:Ll/z4j0;

.field public C:Ll/a5j0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;->Z4(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;->a5(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic X4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic Y4(Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;)Ll/a5j0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;->C:Ll/a5j0;

    return-object p0
.end method

.method private synthetic Z4(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;->C:Ll/a5j0;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;->C:Ll/a5j0;

    .line 10
    .line 11
    iget-object p1, p1, Ll/a5j0;->g:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;->C:Ll/a5j0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/a5j0;->g:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 22
    .line 23
    const-string p1, "newOneOutofFourRefreshData"

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->S4(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private synthetic a5(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;->C:Ll/a5j0;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/a5j0;->d()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/z4j0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/z4j0;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;->B:Ll/z4j0;

    .line 10
    .line 11
    new-instance v0, Ll/a5j0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/a5j0;-><init>(Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;->C:Ll/a5j0;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;->B:Ll/z4j0;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/a5j0;->c(Ll/z4j0;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;->B:Ll/z4j0;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;->C:Ll/a5j0;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;->B:Ll/z4j0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ar2;->a0()V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    iget-object v0, v0, Ll/dkb;->E0:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag$a;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    iget-object v0, v0, Ll/dkb;->F0:Lrx/subjects/a;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/w4j0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/w4j0;-><init>(Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;)V

    .line 44
    .line 45
    .line 46
    new-instance p0, Ll/x4j0;

    .line 47
    .line 48
    invoke-direct {p0}, Ll/x4j0;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;->C:Ll/a5j0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/a5j0;->r()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->L4()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Ll/y4j0;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/y4j0;-><init>(Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/topitemweb/TopItemWebFrag;->C:Ll/a5j0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/a5j0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "source"

    .line 4
    .line 5
    const-string v2, "homepage"

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {}, Ll/gra;->h0()Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;->title:Ljava/lang/String;

    .line 16
    .line 17
    const-string v3, "title_name"

    .line 18
    .line 19
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {}, Ll/v4j0;->c()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    const-string v3, "1"

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string v3, "0"

    .line 33
    .line 34
    :goto_0
    const-string v4, "enter_by_default"

    .line 35
    .line 36
    invoke-static {v4, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    filled-new-array {v1, v2, v3}, [Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_choose"

    .line 2
    .line 3
    return-object p0
.end method
