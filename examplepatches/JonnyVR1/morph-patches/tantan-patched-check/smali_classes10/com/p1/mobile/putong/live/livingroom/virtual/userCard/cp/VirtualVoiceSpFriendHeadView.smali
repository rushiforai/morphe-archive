.class public Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendHeadView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings<",
        "Ll/ddm0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic b(Ll/ddm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelationSchema:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ddm0;->m4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;Ll/ddm0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;",
            "Ll/ddm0<",
            "*>;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->j:Lv/VImage;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->j:Lv/VImage;

    .line 15
    .line 16
    new-instance v1, Ll/zcm0;

    .line 17
    .line 18
    invoke-direct {v1, p2, p1}, Ll/zcm0;-><init>(Ll/ddm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->c:Lv/VDraweeView;

    .line 25
    .line 26
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjVZMlBZUFlaNlhPSVJBRzRZWllBV0ZCN0hOSVM2RTE0IiwidyI6MTAwNSwiaCI6MjI4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NTAwODYzODMxMTk4MDMzNTEwNX0.png"

    .line 27
    .line 28
    const-string v2, "context_livingAct"

    .line 29
    .line 30
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->d:Landroid/widget/TextView;

    .line 34
    .line 35
    const-string v1, "\u631a\n\u53cb"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->showSpecialFriendRelation:Z

    .line 41
    .line 42
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelations:Ljava/util/List;

    .line 46
    .line 47
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendHeadView;->d(Ljava/util/List;Ll/ddm0;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final d(Ljava/util/List;Ll/ddm0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;",
            ">;",
            "Ll/ddm0<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-lez v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;

    .line 22
    .line 23
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    new-instance v2, Ll/adm0;

    .line 27
    .line 28
    invoke-direct {v2, p2}, Ll/adm0;-><init>(Ll/ddm0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;Ll/y20;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/4 v1, 0x1

    .line 39
    if-le v0, v1, :cond_2

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->g:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

    .line 42
    .line 43
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;

    .line 48
    .line 49
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    new-instance v2, Ll/adm0;

    .line 53
    .line 54
    invoke-direct {v2, p2}, Ll/adm0;-><init>(Ll/ddm0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;Ll/y20;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    const/4 v1, 0x2

    .line 65
    if-le v0, v1, :cond_3

    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->h:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

    .line 68
    .line 69
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;

    .line 74
    .line 75
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    new-instance v2, Ll/adm0;

    .line 79
    .line 80
    invoke-direct {v2, p2}, Ll/adm0;-><init>(Ll/ddm0;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;Ll/y20;)V

    .line 84
    .line 85
    .line 86
    :cond_3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    const/4 v1, 0x3

    .line 91
    if-le v0, v1, :cond_4

    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->i:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

    .line 94
    .line 95
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;

    .line 100
    .line 101
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    new-instance v0, Ll/adm0;

    .line 105
    .line 106
    invoke-direct {v0, p2}, Ll/adm0;-><init>(Ll/ddm0;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;Ll/y20;)V

    .line 110
    .line 111
    .line 112
    :cond_4
    :goto_0
    return-void
.end method
