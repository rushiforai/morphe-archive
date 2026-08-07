.class public Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VImage;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;


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


# virtual methods
.method public h0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->rank:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->e:Lv/VImage;

    .line 7
    .line 8
    sget v1, Ll/obc0;->t3:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v1, 0x2

    .line 15
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->e:Lv/VImage;

    .line 18
    .line 19
    sget v1, Ll/obc0;->u3:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v1, 0x3

    .line 26
    if-ne v0, v1, :cond_2

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->e:Lv/VImage;

    .line 29
    .line 30
    sget v1, Ll/obc0;->v3:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 33
    .line 34
    .line 35
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->f:Lv/VDraweeView;

    .line 36
    .line 37
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->avatar:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->d:Lv/VText;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->name:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public i0(ILjava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "context_single_room"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->g:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-static {v0, v1, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p2, 0x1

    .line 9
    if-eq p1, p2, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->f:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 18
    .line 19
    const/high16 v1, 0x41f00000    # 30.0f

    .line 20
    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 26
    .line 27
    const/high16 v1, 0x425c0000    # 55.0f

    .line 28
    .line 29
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 34
    .line 35
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->f:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->e:Lv/VImage;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 53
    .line 54
    const/high16 v1, 0x42a80000    # 84.0f

    .line 55
    .line 56
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 61
    .line 62
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->e:Lv/VImage;

    .line 69
    .line 70
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    :cond_0
    if-ne p1, p2, :cond_1

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->e:Lv/VImage;

    .line 76
    .line 77
    sget p1, Ll/obc0;->t3:I

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_1
    const/4 p2, 0x2

    .line 84
    if-ne p1, p2, :cond_2

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->e:Lv/VImage;

    .line 87
    .line 88
    sget p1, Ll/obc0;->u3:I

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    const/4 p2, 0x3

    .line 95
    if-ne p1, p2, :cond_3

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->e:Lv/VImage;

    .line 98
    .line 99
    sget p1, Ll/obc0;->v3:I

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 102
    .line 103
    .line 104
    :cond_3
    return-void
.end method

.method public j0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->f:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->d:Lv/VText;

    .line 8
    .line 9
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Wd:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->I:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->g:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->t:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VDraweeView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->f:Lv/VDraweeView;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->V0:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VImage;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->e:Lv/VImage;

    .line 33
    .line 34
    sget v0, Ll/mdc0;->e4:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VText;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->d:Lv/VText;

    .line 43
    .line 44
    return-void
.end method
