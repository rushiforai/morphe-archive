.class public Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VDraweeView;

.field public j:Lv/VText;

.field public k:Lv/VText;


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

.method public static synthetic h0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Ll/t3r;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->schema:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance p2, Ll/bae0$a;

    .line 20
    .line 21
    const/16 v0, 0x1b61

    .line 22
    .line 23
    invoke-direct {p2, v0}, Ll/bae0$a;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->schema:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p2, p0}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/bae0$a;->c()Ll/bae0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;Lcom/tantanapp/media/ttmediautils/download/Action2;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->l0(Lcom/tantanapp/media/ttmediautils/download/Action2;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/o2r;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->k:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->k:Lv/VText;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const-string p1, "\u5df2\u70b9"

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string p1, "\u70b9\u6b4c"

    .line 14
    .line 15
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic l0(Lcom/tantanapp/media/ttmediautils/download/Action2;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->k:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    iget p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->position:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p1, p2, p0}, Lcom/tantanapp/media/ttmediautils/download/Action2;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public m0(Ll/t3r;Lcom/tantanapp/media/ttmediautils/download/Action2;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/t3r;",
            "Lcom/tantanapp/media/ttmediautils/download/Action2<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;",
            ")V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->isOrdered:Z

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->k0(Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->g:Lv/VText;

    .line 7
    .line 8
    iget-object v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->title:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->h:Lv/VText;

    .line 14
    .line 15
    iget-object v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->author:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->k:Lv/VText;

    .line 21
    .line 22
    new-instance v1, Ll/m2r;

    .line 23
    .line 24
    invoke-direct {v1, p0, p2, p3}, Ll/m2r;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;Lcom/tantanapp/media/ttmediautils/download/Action2;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->e:Lv/VDraweeView;

    .line 31
    .line 32
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->cover:Ljava/lang/String;

    .line 33
    .line 34
    sget v1, Ll/qa00;->D:I

    .line 35
    .line 36
    const-string v2, "context_single_room"

    .line 37
    .line 38
    invoke-static {v2, p2, v0, v1}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 39
    .line 40
    .line 41
    new-instance p2, Ll/n2r;

    .line 42
    .line 43
    invoke-direct {p2, p3, p1}, Ll/n2r;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Ll/t3r;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->bestSinger:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVBestSinger;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->n0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVBestSinger;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final n0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVBestSinger;)V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->f:Landroid/widget/TextView;

    .line 5
    .line 6
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVBestSinger;->score:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v1, v1, v3

    .line 11
    .line 12
    if-lez v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 v1, 0x0

    .line 17
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->f:Landroid/widget/TextView;

    .line 21
    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVBestSinger;->score:J

    .line 28
    .line 29
    long-to-double v2, v2

    .line 30
    invoke-static {v2, v3}, Ll/yau;->c(D)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v2, "\u97f3\u6d6a"

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->j:Lv/VText;

    .line 50
    .line 51
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVBestSinger;->userName:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    const-string v1, "\u865a\u4f4d\u4ee5\u5f85"

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVBestSinger;->userName:Ljava/lang/String;

    .line 63
    .line 64
    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVBestSinger;->userAvatar:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->i:Lv/VDraweeView;

    .line 74
    .line 75
    if-nez v0, :cond_3

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVBestSinger;->userAvatar:Ljava/lang/String;

    .line 78
    .line 79
    sget v0, Ll/qa00;->m:I

    .line 80
    .line 81
    const-string v1, "context_single_room"

    .line 82
    .line 83
    invoke-static {v1, p0, p1, v0}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_3
    sget p1, Ll/obc0;->G9:I

    .line 88
    .line 89
    invoke-static {p0, p1}, Ll/izs;->x(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
