.class public Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansNormalItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/LiveGenderMedalView;

.field public i:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/osn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/osn0;->p(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dzl0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansNormalItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;Ll/osn0;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansNormalItemView;->g:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansNormalItemView;->d:Lv/VText;

    .line 11
    .line 12
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->rank:J

    .line 13
    .line 14
    invoke-static {v1, v2}, Ll/usn0;->e(J)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansNormalItemView;->i:Lv/VText;

    .line 22
    .line 23
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->amount:J

    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/usn0;->d(J)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansNormalItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 33
    .line 34
    const/high16 v1, 0x42920000    # 73.0f

    .line 35
    .line 36
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-static {v0, p1, v1}, Ll/usn0;->f(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansNormalItemView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/LiveGenderMedalView;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 46
    .line 47
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->gender:Ljava/lang/String;

    .line 48
    .line 49
    iget-wide v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->age:J

    .line 50
    .line 51
    long-to-int v1, v3

    .line 52
    const/4 v3, 0x1

    .line 53
    invoke-virtual {v0, v2, v1, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/LiveGenderMedalView;->Q(Ljava/lang/String;IZ)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansNormalItemView;->d:Lv/VText;

    .line 57
    .line 58
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->rank:J

    .line 59
    .line 60
    invoke-static {v1, v2}, Ll/usn0;->e(J)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansNormalItemView;->d:Lv/VText;

    .line 68
    .line 69
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->rank:J

    .line 70
    .line 71
    const-wide/16 v3, 0x63

    .line 72
    .line 73
    cmp-long v1, v1, v3

    .line 74
    .line 75
    if-lez v1, :cond_0

    .line 76
    .line 77
    const/high16 v1, 0x41400000    # 12.0f

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    const/high16 v1, 0x41900000    # 18.0f

    .line 81
    .line 82
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansNormalItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 86
    .line 87
    new-instance v0, Ll/czl0;

    .line 88
    .line 89
    invoke-direct {v0, p2, p1}, Ll/czl0;-><init>(Ll/osn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansNormalItemView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansNormalItemView;->d:Lv/VText;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {v0}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
