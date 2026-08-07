.class public Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;


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

.method public static synthetic h0(Ll/y20;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private i0(I)Ljava/lang/String;
    .locals 0

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "-"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const/16 p0, 0x63

    .line 7
    .line 8
    if-le p1, p0, :cond_1

    .line 9
    .line 10
    const-string p0, "99+"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method


# virtual methods
.method public j0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;Ll/y20;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->avatar:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;->e:Lv/VText;

    .line 11
    .line 12
    iget v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->rank:I

    .line 13
    .line 14
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;->i0(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;->f:Lv/VText;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->name:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    if-eqz p3, :cond_1

    .line 31
    .line 32
    iget p3, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->rank:I

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;->g:Lv/VText;

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    if-ne p3, v1, :cond_0

    .line 38
    .line 39
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Nj:I

    .line 40
    .line 41
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Oj:I

    .line 46
    .line 47
    iget v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->gapScore:I

    .line 48
    .line 49
    invoke-static {v1}, Ll/yau;->j(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {p3, v1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;->g:Lv/VText;

    .line 62
    .line 63
    iget v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->score:I

    .line 64
    .line 65
    invoke-static {v0}, Ll/yau;->j(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;->d:Lv/VDraweeView;

    .line 73
    .line 74
    new-instance p3, Ll/ulp0;

    .line 75
    .line 76
    invoke-direct {p3, p2, p1}, Ll/ulp0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;)V

    .line 77
    .line 78
    .line 79
    invoke-static {p0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->t:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;->d:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->P4:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;->e:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->e4:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VText;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;->f:Lv/VText;

    .line 33
    .line 34
    sget v0, Ll/mdc0;->b6:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarListItemView;->g:Lv/VText;

    .line 43
    .line 44
    return-void
.end method
