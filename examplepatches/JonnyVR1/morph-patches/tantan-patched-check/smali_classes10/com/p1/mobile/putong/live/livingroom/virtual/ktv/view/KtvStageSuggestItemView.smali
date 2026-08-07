.class public Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;


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

.method public static synthetic h0(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Ll/k6r;Landroid/view/View;)V
    .locals 1

    .line 1
    const/16 p3, 0x3e9

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->title:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p3, p0, v0, p2}, Ll/q6r;->d(IILjava/lang/String;Ll/i6t;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2, p1}, Ll/k6r;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public i0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Ll/k6r;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->cover:Ljava/lang/String;

    .line 4
    .line 5
    const/high16 v2, 0x42400000    # 48.0f

    .line 6
    .line 7
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const-string v4, "context_single_room"

    .line 16
    .line 17
    invoke-static {v4, v0, v1, v3, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;->e:Landroid/widget/TextView;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->title:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;->f:Landroid/widget/TextView;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->author:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;->g:Landroid/widget/TextView;

    .line 35
    .line 36
    new-instance v1, Ll/a6r;

    .line 37
    .line 38
    invoke-direct {v1, p3, p1, p2}, Ll/a6r;-><init>(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Ll/k6r;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;->g:Landroid/widget/TextView;

    .line 45
    .line 46
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->isOrdered:Z

    .line 47
    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    const-string p1, "\u5df2\u70b9"

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    const-string p1, "\u70b9\u6b4c"

    .line 54
    .line 55
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->Q0:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;->d:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->N6:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/TextView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;->e:Landroid/widget/TextView;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->s:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/TextView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;->f:Landroid/widget/TextView;

    .line 33
    .line 34
    sget v0, Ll/mdc0;->t0:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/widget/TextView;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;->g:Landroid/widget/TextView;

    .line 43
    .line 44
    invoke-static {}, Ll/bnl0;->y0()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    const/high16 v1, 0x41900000    # 18.0f

    .line 49
    .line 50
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    sub-int/2addr v0, v1

    .line 55
    int-to-float v0, v0

    .line 56
    const/high16 v1, 0x40400000    # 3.0f

    .line 57
    .line 58
    div-float/2addr v0, v1

    .line 59
    float-to-int v0, v0

    .line 60
    const/4 v1, 0x1

    .line 61
    new-array v1, v1, [Landroid/view/View;

    .line 62
    .line 63
    const/4 v2, 0x0

    .line 64
    aput-object p0, v1, v2

    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
