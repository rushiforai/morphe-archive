.class public Lcom/p1/mobile/putong/live/external/page/fansgroup/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/ntl;
.implements Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/qgg;",
        ">;",
        "Ll/ntl;",
        "Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$b;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/app/PutongAct;

.field public b:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;

.field public c:Ll/qgg;

.field public d:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->C0()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeActivity;->X1(Landroid/content/Context;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public b(Ll/qgg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->c:Ll/qgg;

    .line 2
    .line 3
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->c:Ll/qgg;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qgg;->k0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, p1, v0, v0}, Ll/mbs;->j0(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->d:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->b:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->d:Lv/navigationbar/VNavigationBar;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->b:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->B(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->b:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->H(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/qgg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->b(Ll/qgg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    sget v0, Ll/xec0;->e:I

    .line 4
    .line 5
    invoke-static {p1, v0, p2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->b:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;

    .line 12
    .line 13
    invoke-virtual {p1, p0, p0}, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->z(Ll/ntl;Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$b;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/a;->b:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;

    .line 17
    .line 18
    return-object p0
.end method
