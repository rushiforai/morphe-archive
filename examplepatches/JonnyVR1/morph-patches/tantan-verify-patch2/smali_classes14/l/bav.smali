.class public Ll/bav;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/bav;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/bav;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/bav;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/bav;->e(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareSingleEntryBean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareSingleEntryBean;->getGoAction()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareSingleEntryBean;->getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMc(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final d(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/j6t;->s(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p3, "entrance_type"

    .line 2
    .line 3
    const-string v0, "upper_right_button"

    .line 4
    .line 5
    invoke-static {p3, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const-string p1, ""

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->getTabId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    const-string v1, "audio_tab_id"

    .line 19
    .line 20
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    filled-new-array {p3, p1}, [Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string p3, "e_start_audio_room_entrance"

    .line 29
    .line 30
    const-string v1, "p_audio_explore_recommend"

    .line 31
    .line 32
    invoke-static {p3, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p2}, Ll/bav;->d(Lcom/p1/mobile/android/app/Act;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p1, "create-room-btn"

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p2, p0}, Ll/iqn0;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->getTabId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/bav;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    const p0, 0x186a1

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/hyn0;->b(I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string v0, "allow"

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {p2}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->requestRandom(Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p2, Ll/aav;

    .line 26
    .line 27
    invoke-direct {p2, p1}, Ll/aav;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 28
    .line 29
    .line 30
    new-instance p1, Ll/wnt;

    .line 31
    .line 32
    invoke-direct {p1}, Ll/wnt;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {p2, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public h(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/vwt;->U6()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    sget v1, Ll/ldc0;->L2:I

    .line 28
    .line 29
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Landroid/widget/LinearLayout;

    .line 34
    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    sget v1, Ll/xec0;->g2:I

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const/4 v3, 0x0

    .line 48
    invoke-virtual {v2, v1, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Landroid/widget/LinearLayout;

    .line 53
    .line 54
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 55
    .line 56
    const/high16 v3, 0x42080000    # 34.0f

    .line 57
    .line 58
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    const/4 v4, -0x2

    .line 63
    invoke-direct {v2, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v0, v1, p2}, Ll/bav;->i(Lcom/p1/mobile/android/app/Act;Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    invoke-virtual {p0, v0, v1, p2}, Ll/bav;->i(Lcom/p1/mobile/android/app/Act;Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V

    .line 73
    .line 74
    .line 75
    :cond_3
    :goto_0
    return-void
.end method

.method public final i(Lcom/p1/mobile/android/app/Act;Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 3

    .line 1
    sget v0, Ll/ldc0;->F0:I

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/TextView;

    .line 8
    .line 9
    sget v1, Ll/ldc0;->E0:I

    .line 10
    .line 11
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    const-string v1, "\u521b\u5efa"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    sget v0, Ll/ldc0;->G0:I

    .line 27
    .line 28
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p0, p1, p2, v2, p3}, Ll/bav;->j(Lcom/p1/mobile/android/app/Act;Landroid/view/View;ILcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final j(Lcom/p1/mobile/android/app/Act;Landroid/view/View;ILcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    if-eqz p3, :cond_3

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    if-eq p3, v0, :cond_1

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_1
    if-nez p4, :cond_2

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_2
    new-instance p3, Ll/z9v;

    .line 14
    .line 15
    invoke-direct {p3, p0, p1, p4}, Ll/z9v;-><init>(Ll/bav;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_3
    new-instance p3, Ll/y9v;

    .line 23
    .line 24
    invoke-direct {p3, p0, p4, p1}, Ll/y9v;-><init>(Ll/bav;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;Lcom/p1/mobile/android/app/Act;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
