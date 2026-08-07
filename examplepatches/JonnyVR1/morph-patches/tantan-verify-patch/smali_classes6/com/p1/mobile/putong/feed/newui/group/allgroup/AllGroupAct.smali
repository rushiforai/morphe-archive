.class public Lcom/p1/mobile/putong/feed/newui/group/allgroup/AllGroupAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Ll/yi0;

.field public d:Ll/zi0;

.field public e:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static X1(Landroid/content/Context;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/group/allgroup/AllGroupAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "has_my_group"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/AllGroupAct;->d:Ll/zi0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/zi0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    new-instance v0, Ll/zi0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zi0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/AllGroupAct;->d:Ll/zi0;

    .line 7
    .line 8
    new-instance v0, Ll/yi0;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/yi0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/AllGroupAct;->c:Ll/yi0;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/AllGroupAct;->d:Ll/zi0;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/AllGroupAct;->c:Ll/yi0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/yi0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_circle_list"

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/AllGroupAct;->c:Ll/yi0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/yi0;->f0()V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/AllGroupAct;->c:Ll/yi0;

    .line 10
    .line 11
    iget-boolean p1, p1, Ll/yi0;->a:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const-string p1, "joined"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p1, "popular"

    .line 19
    .line 20
    :goto_0
    const-string v0, "circle_tab"

    .line 21
    .line 22
    invoke-static {v0, p1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    filled-new-array {p1}, [Ll/tfj0$a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {p1}, Ll/tfj0;->a([Ll/tfj0$a;)Lorg/json/JSONObject;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/allgroup/AllGroupAct;->e:Lorg/json/JSONObject;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
