.class public Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Ll/ent;

.field public d:Ll/bnt;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->e:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->b2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->destroy()V

    return-void
.end method

.method public static Z1(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "search_from"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method private b2(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->d:Ll/bnt;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->c:Ll/ent;

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/wmt;->a(Ll/bnt;Ll/ent;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->d:Ll/bnt;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/bnt;->T()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->d:Ll/bnt;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/klt;->F2()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->d:Ll/bnt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bnt;->n()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->c:Ll/ent;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ent;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ent;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ent;-><init>(Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->c:Ll/ent;

    .line 10
    .line 11
    new-instance v0, Ll/bnt;

    .line 12
    .line 13
    new-instance v1, Ll/imt;

    .line 14
    .line 15
    new-instance v2, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 16
    .line 17
    invoke-direct {v2}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-direct {v1, v2, p0}, Ll/imt;-><init>(Lcom/tantan/live/search/eventbus/LiveSearchEventBus;Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {v0, p0, v1}, Ll/bnt;-><init>(Ll/ner;Ll/imt;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->d:Ll/bnt;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->c:Ll/ent;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/l6t;->C(Ll/iam;)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Ll/flt;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/flt;-><init>(Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;)V

    .line 36
    .line 37
    .line 38
    new-instance v1, Ll/glt;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/glt;-><init>(Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_live_search"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "search_from"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    const-string p1, ""

    .line 17
    .line 18
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->e:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method
