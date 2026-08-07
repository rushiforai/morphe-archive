.class public Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;
.super Lv/VRelative;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$b;
    }
.end annotation


# instance fields
.field public d:Lv/navigationbar/VNavigationBar;

.field public e:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;

.field public f:Lv/VRelative;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;)Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->h:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$b;

    return-object p0
.end method


# virtual methods
.method public B(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->f:Lv/VRelative;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$a;-><init>(Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->e:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->z(ZLcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public H(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "0"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->g:Lv/VText;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/16 p0, 0x8

    .line 12
    .line 13
    invoke-virtual {v1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->g:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sgg;->a(Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z(Ll/ntl;Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$b;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->h:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$b;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->e:Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/live/base/business/fansgroup/FansGroupListView;->u(ZLl/ntl;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
