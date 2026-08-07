.class public Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Lv/VDraweeView;

.field public c:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, -0x1

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/j3p0;->a(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->b:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;->width:I

    .line 8
    .line 9
    int-to-float p1, p1

    .line 10
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    const/high16 p1, 0x42900000    # 72.0f

    .line 17
    .line 18
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    :cond_0
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->b:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public c(ZLcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->c:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {v1}, Ll/jyn0;->g(Z)Ll/us2;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ll/us2;->d()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {v1}, Ll/jyn0;->g(Z)Ll/us2;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Ll/us2;->l()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->a:Landroid/widget/TextView;

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->c:Z

    .line 32
    .line 33
    invoke-static {p2}, Ll/jyn0;->g(Z)Ll/us2;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-interface {p2}, Ll/us2;->c()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    if-eqz p2, :cond_2

    .line 43
    .line 44
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 45
    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->textColor:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_2

    .line 55
    .line 56
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 57
    .line 58
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->textColor:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {p2}, Ll/gc2;->d(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    goto :goto_1

    .line 65
    :cond_2
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->c:Z

    .line 66
    .line 67
    invoke-static {p2}, Ll/jyn0;->g(Z)Ll/us2;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-interface {p2}, Ll/us2;->k()I

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    :goto_1
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    .line 77
    .line 78
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->a:Landroid/widget/TextView;

    .line 79
    .line 80
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->c:Z

    .line 81
    .line 82
    if-eqz p1, :cond_3

    .line 83
    .line 84
    invoke-static {p0}, Ll/jyn0;->g(Z)Ll/us2;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-interface {p0}, Ll/us2;->b()F

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    goto :goto_2

    .line 93
    :cond_3
    invoke-static {p0}, Ll/jyn0;->g(Z)Ll/us2;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-interface {p0}, Ll/us2;->h()F

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    :goto_2
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;Z)V
    .locals 3

    .line 1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->c:Z

    .line 2
    .line 3
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;->tabSelectedUrl:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->b:Lv/VDraweeView;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->a:Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->a:Landroid/widget/TextView;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;->name:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->a:Landroid/widget/TextView;

    .line 35
    .line 36
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->b:Lv/VDraweeView;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;->tabDefaultUrl:Ljava/lang/String;

    .line 45
    .line 46
    sget p2, Ll/qa00;->K:I

    .line 47
    .line 48
    sget v0, Ll/qa00;->v:I

    .line 49
    .line 50
    const-string v1, "context_square"

    .line 51
    .line 52
    invoke-static {v1, p0, p1, p2, v0}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/VoiceTabView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
