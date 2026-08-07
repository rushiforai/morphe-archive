.class public Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;
.super Ll/l7t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/l7t<",
        "Ll/de10;",
        ">;"
    }
.end annotation


# instance fields
.field public l:Ll/km10;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/l7t;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->y(I)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 2
    .line 3
    check-cast p0, Ll/de10;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/de10;->e4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final B()V
    .locals 5

    .line 1
    new-instance v0, Landroid/text/SpannableString;

    .line 2
    .line 3
    const-string v1, "\u81f3\u5c112\u540d\u4e3b\u64ad\u52a0\u5165\u8fde\u7ebf\uff0c\u624d\u80fd\u53d1\u8d77\u591a\u4ebaPK"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    .line 9
    .line 10
    const-string v2, "#FE7E1D"

    .line 11
    .line 12
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-direct {v1, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x4

    .line 20
    const/16 v3, 0x21

    .line 21
    .line 22
    const/4 v4, 0x2

    .line 23
    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/l7t;->k:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public C(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->l:Ll/km10;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/km10;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 8
    .line 9
    check-cast v1, Ll/de10;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;->users:Ljava/util/List;

    .line 16
    .line 17
    new-instance v2, Ll/wd10;

    .line 18
    .line 19
    invoke-direct {v2, p0}, Ll/wd10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v0, v1, p1, v2}, Ll/km10;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/y20;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->l:Ll/km10;

    .line 26
    .line 27
    iget-object p1, p0, Ll/l7t;->i:Lv/VRecyclerView;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/l7t;->i:Lv/VRecyclerView;

    .line 33
    .line 34
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 37
    .line 38
    check-cast v1, Ll/de10;

    .line 39
    .line 40
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const/4 v2, 0x0

    .line 45
    invoke-direct {v0, v1, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    iget-object v0, v0, Ll/km10;->d:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->l:Ll/km10;

    .line 58
    .line 59
    iget-object v0, v0, Ll/km10;->d:Ljava/util/List;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;->users:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->l:Ll/km10;

    .line 67
    .line 68
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 69
    .line 70
    .line 71
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->z()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public init()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->init()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/l7t;->j:Lv/VText;

    .line 5
    .line 6
    new-instance v1, Ll/ud10;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/ud10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/l7t;->g:Lv/VImage;

    .line 15
    .line 16
    new-instance v1, Ll/vd10;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/vd10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public k()I
    .locals 0

    .line 1
    sget p0, Ll/obc0;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->l:Ll/km10;

    .line 2
    .line 3
    if-eqz p1, :cond_3

    .line 4
    .line 5
    iget-object p1, p1, Ll/km10;->d:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->l:Ll/km10;

    .line 20
    .line 21
    iget-object v0, v0, Ll/km10;->d:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;

    .line 38
    .line 39
    iget-boolean v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->picked:Z

    .line 40
    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 50
    .line 51
    check-cast p0, Ll/de10;

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/de10;->f4(Ljava/util/List;)V

    .line 54
    .line 55
    .line 56
    :cond_3
    :goto_1
    return-void
.end method

.method public final y(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->l:Ll/km10;

    .line 2
    .line 3
    iget-object v0, v0, Ll/km10;->d:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string v2, "-1"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 22
    .line 23
    check-cast p0, Ll/de10;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/de10;->d4()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->toast:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->toast:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    const-string v1, "spectator"

    .line 44
    .line 45
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->role:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->id:Ljava/lang/String;

    .line 55
    .line 56
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 57
    .line 58
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    :goto_0
    return-void

    .line 69
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->l:Ll/km10;

    .line 70
    .line 71
    iget-object v0, v0, Ll/km10;->d:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->l:Ll/km10;

    .line 80
    .line 81
    iget-object v1, v1, Ll/km10;->d:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;

    .line 88
    .line 89
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->picked:Z

    .line 90
    .line 91
    xor-int/lit8 v1, v1, 0x1

    .line 92
    .line 93
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->picked:Z

    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->l:Ll/km10;

    .line 96
    .line 97
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->z()V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public final z()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->l:Ll/km10;

    .line 2
    .line 3
    iget-object v0, v0, Ll/km10;->d:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    move v2, v1

    .line 11
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_1

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;

    .line 22
    .line 23
    iget-boolean v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->picked:Z

    .line 24
    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object v0, p0, Ll/l7t;->j:Lv/VText;

    .line 31
    .line 32
    const/4 v3, 0x2

    .line 33
    if-lt v2, v3, :cond_2

    .line 34
    .line 35
    const/4 v4, -0x1

    .line 36
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/l7t;->k:Lv/VText;

    .line 40
    .line 41
    const-string v4, "\u5f00\u59cbPK\u540e\u5c06\u76f4\u63a5\u8fdb\u5165PK\uff0c\u8bf7\u4e0e\u8fde\u7ebf\u4e3b\u64ad\u63d0\u524d\u6c9f\u901a"

    .line 42
    .line 43
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    sget v5, Ll/n9c0;->j1:I

    .line 52
    .line 53
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/a;->B()V

    .line 61
    .line 62
    .line 63
    :goto_1
    iget-object p0, p0, Ll/l7t;->j:Lv/VText;

    .line 64
    .line 65
    if-lt v2, v3, :cond_3

    .line 66
    .line 67
    const/4 v1, 0x1

    .line 68
    :cond_3
    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 69
    .line 70
    .line 71
    return-void
.end method
