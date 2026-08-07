.class public Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VDraweeView;

.field public e:Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;Ll/pe50;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;->d(Ll/pe50;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/pe50;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;->anchorId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pe50;->Y3(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/he50;->a(Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d(Ll/pe50;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;->anchorId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Ll/pe50;->R3(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;->c:Landroid/widget/TextView;

    .line 7
    .line 8
    const/4 p3, 0x0

    .line 9
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, p1, p3}, Ll/tfs$a;->b(Ll/oo2;Z)Ll/tfs$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string p3, "perform_list"

    .line 29
    .line 30
    invoke-virtual {p1, p3}, Ll/tfs$a;->e(Ljava/lang/String;)Ll/tfs$a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;->anchorId:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1, p2}, Ll/tfs$a;->h(Ljava/lang/String;)Ll/tfs$a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Ll/tfs$a;->a()Ll/tfs;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p0, p1}, Ll/afu;->c(Ljava/lang/String;Ll/tfs;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public e(Ll/pe50;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;->anchorName:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;->g:Landroid/widget/TextView;

    .line 9
    .line 10
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;->desc:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;->d:Lv/VDraweeView;

    .line 16
    .line 17
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;->anchorAvatar:Ljava/lang/String;

    .line 18
    .line 19
    const-string v2, "context_single_room"

    .line 20
    .line 21
    invoke-static {v2, v0, v1}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;->b:Landroid/widget/TextView;

    .line 25
    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;->startTime:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v2, "-"

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;->endTime:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;->e:Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;

    .line 54
    .line 55
    const/high16 v1, 0x41880000    # 17.0f

    .line 56
    .line 57
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    const/high16 v2, 0x41700000    # 15.0f

    .line 62
    .line 63
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->d(II)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;->e:Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;

    .line 71
    .line 72
    iget-boolean v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;->isOnlive:Z

    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;->c:Landroid/widget/TextView;

    .line 78
    .line 79
    iget-boolean v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;->isFollowed:Z

    .line 80
    .line 81
    xor-int/lit8 v1, v1, 0x1

    .line 82
    .line 83
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;->c:Landroid/widget/TextView;

    .line 87
    .line 88
    new-instance v1, Ll/fe50;

    .line 89
    .line 90
    invoke-direct {v1, p0, p1, p2}, Ll/fe50;-><init>(Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;Ll/pe50;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;->d:Lv/VDraweeView;

    .line 97
    .line 98
    new-instance v0, Ll/ge50;

    .line 99
    .line 100
    invoke-direct {v0, p1, p2}, Ll/ge50;-><init>(Ll/pe50;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;)V

    .line 101
    .line 102
    .line 103
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    const/4 v1, 0x0

    .line 119
    invoke-virtual {v0, p1, v1}, Ll/tfs$a;->b(Ll/oo2;Z)Ll/tfs$a;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    const-string v0, "perform_list"

    .line 124
    .line 125
    invoke-virtual {p1, v0}, Ll/tfs$a;->e(Ljava/lang/String;)Ll/tfs$a;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;->anchorId:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p1, p2}, Ll/tfs$a;->h(Ljava/lang/String;)Ll/tfs$a;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p1}, Ll/tfs$a;->a()Ll/tfs;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-static {p0, p1}, Ll/afu;->d(Ljava/lang/String;Ll/tfs;)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;->e:Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    invoke-virtual {p0, v0, v0}, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->c(II)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
