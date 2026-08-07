.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public c:Landroid/view/View;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;

.field public f:Ll/jxd0;

.field public g:Ll/kcg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->d(Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;Ljava/lang/Long;)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->f:Ll/jxd0;

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->e:Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->l()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final c(J)Ljava/lang/String;
    .locals 4

    .line 1
    const-wide/16 v0, 0x3c

    .line 2
    .line 3
    div-long v2, p1, v0

    .line 4
    .line 5
    rem-long/2addr p1, v0

    .line 6
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "%02d:%02d"

    .line 19
    .line 20
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->k(Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e(Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->icon:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->a:Lv/VDraweeView;

    .line 11
    .line 12
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 16
    .line 17
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string v0, "svga"

    .line 22
    .line 23
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->iconType:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->a:Lv/VDraweeView;

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 38
    .line 39
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->icon:Ljava/lang/String;

    .line 45
    .line 46
    const/4 v0, -0x1

    .line 47
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->a:Lv/VDraweeView;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->icon:Ljava/lang/String;

    .line 62
    .line 63
    const-string v0, "context_single_room"

    .line 64
    .line 65
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V
    .locals 2

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->enableRedDot:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->f:Ll/jxd0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->j(Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public g(Ll/jfo0;Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V
    .locals 3

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->f:Ll/jxd0;

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v2, "voice_operation_reddot_"

    .line 25
    .line 26
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v2, "_"

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/jxd0;

    .line 47
    .line 48
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-direct {v1, v0, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 51
    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->f:Ll/jxd0;

    .line 54
    .line 55
    :cond_1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->e(Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->name:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->h(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->j(Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->i(Ll/jfo0;Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final h(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->e:Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->e:Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->setSingleText(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string p1, ""

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->setSingleText(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->e:Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->m()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final i(Ll/jfo0;Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->g:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p2, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->countDownTimestamp:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ll/pzi0;->o()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    const-wide/16 v4, 0x3e8

    .line 19
    .line 20
    div-long/2addr v0, v4

    .line 21
    iget-wide v4, p2, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->countDownTimestamp:J

    .line 22
    .line 23
    sub-long/2addr v4, v0

    .line 24
    cmp-long v0, v4, v2

    .line 25
    .line 26
    if-lez v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p1, Ll/jfo0;->j:Ll/qfo0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ll/rwn0;

    .line 35
    .line 36
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance v0, Ll/kfo0;

    .line 55
    .line 56
    invoke-direct {v0, p0, p2}, Ll/kfo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->g:Ll/kcg0;

    .line 68
    .line 69
    :cond_0
    return-void
.end method

.method public final j(Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V
    .locals 3

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->digitalRedDotCount:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->c:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->d:Lv/VText;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->d:Lv/VText;

    .line 18
    .line 19
    iget p1, p1, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->digitalRedDotCount:I

    .line 20
    .line 21
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->enableRedDot:Z

    .line 30
    .line 31
    if-eqz p1, :cond_3

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->f:Ll/jxd0;

    .line 34
    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->c:Landroid/view/View;

    .line 51
    .line 52
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->d:Lv/VText;

    .line 56
    .line 57
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->c:Landroid/view/View;

    .line 62
    .line 63
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->d:Lv/VText;

    .line 67
    .line 68
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->c:Landroid/view/View;

    .line 73
    .line 74
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->d:Lv/VText;

    .line 78
    .line 79
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;)V
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->countDownTimestamp:J

    .line 5
    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    cmp-long v0, v0, v2

    .line 9
    .line 10
    if-lez v0, :cond_2

    .line 11
    .line 12
    invoke-static {}, Ll/pzi0;->o()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    const-wide/16 v4, 0x3e8

    .line 17
    .line 18
    div-long/2addr v0, v4

    .line 19
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->countDownTimestamp:J

    .line 20
    .line 21
    sub-long/2addr v4, v0

    .line 22
    cmp-long v0, v4, v2

    .line 23
    .line 24
    if-lez v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, v4, v5}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->c(J)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->e:Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->setSingleText(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->e:Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->m()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    if-nez v0, :cond_2

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/apibean/IntlLiveOperationItemBean;->name:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->h(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    :goto_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->B2:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->a:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->p6:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->Y4:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->c:Landroid/view/View;

    .line 31
    .line 32
    sget v0, Ll/mdc0;->s4:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lv/VText;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->d:Lv/VText;

    .line 41
    .line 42
    sget v0, Ll/mdc0;->P6:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsItemView;->e:Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;

    .line 51
    .line 52
    return-void
.end method
