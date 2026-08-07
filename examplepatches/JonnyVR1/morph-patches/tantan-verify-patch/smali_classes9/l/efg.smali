.class public Ll/efg;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"

# interfaces
.implements Ll/ntl;
.implements Ll/otl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/rfg;",
        ">;",
        "Ll/ntl;",
        "Ll/otl;"
    }
.end annotation


# instance fields
.field public k:Lv/VImage;

.field public l:Lv/VText;

.field public m:Lv/VImage;

.field public n:Lv/VText;

.field public o:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;

.field public p:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

.field public q:Ljava/lang/String;

.field public r:Z

.field public s:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;

.field public t:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/rfg;)V
    .locals 2
    .param p2    # Ll/rfg;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/yec0;->x0:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v1}, Ll/qag0;->c(F)Ll/rq2;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic F(Ll/efg;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/efg;->t:Z

    return p0
.end method

.method public static bridge synthetic G(Ll/efg;)Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/efg;->s:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;

    return-object p0
.end method

.method public static synthetic I(Ll/efg;)Ll/y8s;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic J(Ll/efg;)Ll/y8s;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/rfg;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ffg;->a(Ll/efg;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K(Ll/rfg;)V
    .locals 0

    .line 1
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
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
    iget-object p0, p0, Ll/efg;->p:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->K(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public M()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/efg;->p:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->G()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public N(ZLcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Ll/efg;->t:Z

    .line 2
    .line 3
    iput-object p2, p0, Ll/efg;->s:Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/efg;->r:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/efg;->l:Lv/VText;

    .line 9
    .line 10
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->x3:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/efg;->o:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/efg;->p:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 22
    .line 23
    const/16 v2, 0x8

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/efg;->m:Lv/VImage;

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move v1, v2

    .line 34
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/efg;->o:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;

    .line 38
    .line 39
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->z(ZLcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/efg;->q:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/efg;->P(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/efg;->m:Lv/VImage;

    .line 48
    .line 49
    new-instance p2, Ll/efg$a;

    .line 50
    .line 51
    invoke-direct {p2, p0}, Ll/efg$a;-><init>(Ll/efg;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/efg;->k:Lv/VImage;

    .line 58
    .line 59
    new-instance p2, Ll/efg$b;

    .line 60
    .line 61
    invoke-direct {p2, p0}, Ll/efg$b;-><init>(Ll/efg;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/efg;->r:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/efg;->l:Lv/VText;

    .line 5
    .line 6
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->u3:I

    .line 7
    .line 8
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/efg;->o:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;

    .line 12
    .line 13
    const/16 v2, 0x8

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/efg;->p:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/efg;->m:Lv/VImage;

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/efg;->n:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/efg;->p:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->M(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/efg;->k:Lv/VImage;

    .line 39
    .line 40
    new-instance v0, Ll/efg$c;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/efg$c;-><init>(Ll/efg;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public P(Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/efg;->q:Ljava/lang/String;

    .line 2
    .line 3
    iget-boolean v0, p0, Ll/efg;->r:Z

    .line 4
    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/16 v0, 0x8

    .line 12
    .line 13
    if-nez p1, :cond_2

    .line 14
    .line 15
    iget-object p1, p0, Ll/efg;->q:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "0"

    .line 18
    .line 19
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object p1, p0, Ll/efg;->n:Lv/VText;

    .line 27
    .line 28
    iget-boolean v1, p0, Ll/efg;->t:Z

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/efg;->n:Lv/VText;

    .line 37
    .line 38
    iget-object p0, p0, Ll/efg;->q:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/efg;->n:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    :cond_3
    return-void
.end method

.method public Q(ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/efg;->p:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->N(ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/rfg;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rfg;->s4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/rfg;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/rfg;->d4(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/rfg;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rfg;->e4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/rfg;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/rfg;->d4(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/rfg;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/rfg;->q4(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rfg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/efg;->K(Ll/rfg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public isLoading()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/rfg;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rfg;->g4()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/efg;->H(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/16 p1, 0x50

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->A(I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/efg;->o:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->u(ZLl/ntl;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/efg;->p:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;

    .line 19
    .line 20
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupNoticeListView;->E(ZLl/otl;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rfg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/efg;->K(Ll/rfg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
