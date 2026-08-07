.class public abstract Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapBaseAct;
.super Lcom/p1/mobile/putong/app/PutongMvpAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpAct<",
        "Ll/xco;",
        "Ll/rdo;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapBaseAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapBaseAct;->lambda$debugItems$0()V

    return-void
.end method

.method public static a2(Landroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    const-string v0, "placePickerType"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    const-string p1, "from"

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public static b2(Landroid/content/Intent;IZ)Landroid/content/Intent;
    .locals 1

    .line 1
    const-string v0, "placePickerType"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    const-string p1, "search_enabled"

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    return-object p0
.end method


# virtual methods
.method public bridge synthetic X1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapBaseAct;->c2()Ll/xco;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic Y1()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapBaseAct;->d2()Ll/rdo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c2()Ll/xco;
    .locals 1

    .line 1
    new-instance v0, Ll/xco;

    .line 2
    .line 3
    invoke-direct {v0, p0, p0}, Ll/xco;-><init>(Ll/ner;Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public d2()Ll/rdo;
    .locals 1

    .line 1
    new-instance v0, Ll/rdo;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rdo;-><init>(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapBaseAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public debugItems()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/vbo;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vbo;-><init>(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapBaseAct;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "show passed location!"

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    filled-new-array {p0}, [Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public abstract e2()Ll/hyl;
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->d:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rdo;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/rdo;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic lambda$debugItems$0()V
    .locals 0

    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->c:Ll/ar2;

    .line 2
    .line 3
    check-cast v0, Ll/xco;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xco;->g1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->c:Ll/ar2;

    .line 2
    .line 3
    check-cast p0, Ll/xco;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xco;->h1(Landroid/view/Menu;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_browse_map_and_select_location_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public pendChangeActionButtonTypeface()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->c:Ll/ar2;

    .line 2
    .line 3
    check-cast p0, Ll/xco;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xco;->j1()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "placePickerType"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const-string v2, "search_enabled"

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const-string v3, "from"

    .line 20
    .line 21
    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->c:Ll/ar2;

    .line 26
    .line 27
    check-cast v3, Ll/xco;

    .line 28
    .line 29
    invoke-virtual {v3, v1, v2, v0}, Ll/xco;->P0(IZLjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public shouldBlockOnCreate(Landroid/os/Bundle;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->shouldBlockOnCreate(Landroid/os/Bundle;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public shouldBlockOnResume()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->shouldBlockOnResume()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public shouldBlockOnStart()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->shouldBlockOnStart()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
