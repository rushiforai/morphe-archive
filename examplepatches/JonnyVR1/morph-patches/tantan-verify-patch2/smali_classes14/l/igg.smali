.class public Ll/igg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/otl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/hgg;",
        ">;",
        "Ll/otl;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/app/PutongAct;

.field public b:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeView;

.field public c:Ll/hgg;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/igg;->a:Lcom/p1/mobile/putong/app/PutongAct;

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
    iget-object p0, p0, Ll/igg;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/igg;->c:Ll/hgg;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/hgg;->n0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/igg;->c:Ll/hgg;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/hgg;->i0(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public c(Ll/hgg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/igg;->c:Ll/hgg;

    .line 2
    .line 3
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/igg;->b:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeView;->d:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->K(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/igg;->c:Ll/hgg;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/hgg;->i0(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/igg;->c:Ll/hgg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hgg;->n0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/igg;->b:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeView;->d:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->G()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/hgg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/igg;->c(Ll/hgg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p1, p0, Ll/igg;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    sget v0, Ll/xec0;->f:I

    .line 4
    .line 5
    invoke-static {p1, v0, p2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeView;

    .line 10
    .line 11
    iput-object p1, p0, Ll/igg;->b:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeView;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeView;->d:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 14
    .line 15
    const/4 p2, 0x0

    .line 16
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->E(ZLl/otl;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/igg;->b:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeView;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeView;->c:Lv/navigationbar/VNavigationBar;

    .line 22
    .line 23
    iget-object p2, p0, Ll/igg;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/igg;->b:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeView;

    .line 29
    .line 30
    return-object p0
.end method

.method public isLoading()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/igg;->c:Ll/hgg;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hgg;->j0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/igg;->b:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeView;->d:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->M(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public k(ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/igg;->b:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeView;->d:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->N(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
