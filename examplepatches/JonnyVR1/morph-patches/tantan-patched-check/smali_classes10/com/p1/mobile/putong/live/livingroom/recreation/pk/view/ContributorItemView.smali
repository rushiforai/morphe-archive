.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final f:Landroid/util/SparseIntArray;

.field public static final g:Landroid/util/SparseIntArray;

.field public static final h:Landroid/util/SparseIntArray;


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VImage;

.field public c:Lv/VDraweeView;

.field public d:Landroid/view/View;

.field public e:Lv/VImage;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Landroid/util/SparseIntArray;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;->f:Landroid/util/SparseIntArray;

    .line 7
    .line 8
    new-instance v1, Landroid/util/SparseIntArray;

    .line 9
    .line 10
    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;->g:Landroid/util/SparseIntArray;

    .line 14
    .line 15
    new-instance v2, Landroid/util/SparseIntArray;

    .line 16
    .line 17
    invoke-direct {v2}, Landroid/util/SparseIntArray;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;->h:Landroid/util/SparseIntArray;

    .line 21
    .line 22
    sget v3, Ll/obc0;->R4:I

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    invoke-virtual {v0, v4, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 26
    .line 27
    .line 28
    sget v3, Ll/obc0;->M8:I

    .line 29
    .line 30
    const/4 v5, 0x1

    .line 31
    invoke-virtual {v0, v5, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 32
    .line 33
    .line 34
    sget v3, Ll/obc0;->J7:I

    .line 35
    .line 36
    const/4 v6, 0x2

    .line 37
    invoke-virtual {v0, v6, v3}, Landroid/util/SparseIntArray;->put(II)V

    .line 38
    .line 39
    .line 40
    sget v0, Ll/obc0;->S4:I

    .line 41
    .line 42
    invoke-virtual {v1, v4, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 43
    .line 44
    .line 45
    sget v0, Ll/obc0;->N8:I

    .line 46
    .line 47
    invoke-virtual {v1, v5, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 48
    .line 49
    .line 50
    sget v0, Ll/obc0;->J7:I

    .line 51
    .line 52
    invoke-virtual {v1, v6, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 53
    .line 54
    .line 55
    sget v0, Ll/obc0;->P4:I

    .line 56
    .line 57
    invoke-virtual {v2, v4, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 58
    .line 59
    .line 60
    sget v0, Ll/obc0;->Q4:I

    .line 61
    .line 62
    invoke-virtual {v2, v5, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 63
    .line 64
    .line 65
    sget v0, Ll/obc0;->J7:I

    .line 66
    .line 67
    invoke-virtual {v2, v6, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/t36;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;->e:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isPunishStage()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isTied()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isSuccess()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->getRank()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    move v1, v3

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move v1, v2

    .line 32
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isPunishStage()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isSuccess()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    move v2, v3

    .line 48
    :cond_1
    if-eqz v2, :cond_2

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isTied()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    xor-int/lit8 v2, v0, 0x1

    .line 55
    .line 56
    :cond_2
    if-eqz v2, :cond_3

    .line 57
    .line 58
    sget v0, Ll/obc0;->A7:I

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isHost()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_4

    .line 66
    .line 67
    sget v0, Ll/obc0;->B7:I

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_4
    sget v0, Ll/obc0;->C7:I

    .line 71
    .line 72
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;->b:Lv/VImage;

    .line 73
    .line 74
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 75
    .line 76
    .line 77
    if-eqz v2, :cond_5

    .line 78
    .line 79
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;->h:Landroid/util/SparseIntArray;

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->getRank()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    invoke-virtual {v0, v1}, Landroid/util/SparseIntArray;->get(I)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    goto :goto_3

    .line 90
    :cond_5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->isHost()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_6

    .line 95
    .line 96
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;->f:Landroid/util/SparseIntArray;

    .line 97
    .line 98
    :goto_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->getRank()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    invoke-virtual {v0, v1}, Landroid/util/SparseIntArray;->get(I)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    goto :goto_3

    .line 107
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;->g:Landroid/util/SparseIntArray;

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :goto_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;->a:Lv/VImage;

    .line 111
    .line 112
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->getAvatarUrl()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;->c:Lv/VDraweeView;

    .line 124
    .line 125
    if-eqz v0, :cond_7

    .line 126
    .line 127
    sget p1, Ll/obc0;->T4:I

    .line 128
    .line 129
    invoke-virtual {v1, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 130
    .line 131
    .line 132
    goto :goto_4

    .line 133
    :cond_7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->getAvatarUrl()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    sget v0, Ll/qa00;->s:I

    .line 138
    .line 139
    const-string v3, "context_single_room"

    .line 140
    .line 141
    invoke-static {v3, v1, p1, v0}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 142
    .line 143
    .line 144
    :goto_4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;->d:Landroid/view/View;

    .line 145
    .line 146
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/ContributorItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
