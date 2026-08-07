.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field public d:Landroid/view/View;

.field public e:Ll/w0c;

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Ljava/lang/String;


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

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "accessOutterToken "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "[live]campaign"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method

.method public static synthetic c(Ll/qdo0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qdo0;->b4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gdo0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;Ll/qdo0;)V
    .locals 4

    .line 1
    new-instance v0, Ll/w0c;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/w0c;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->e:Ll/w0c;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Landroid/app/Activity;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->z(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->e:Ll/w0c;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 26
    .line 27
    const-string v2, ""

    .line 28
    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2, v3, v2}, Ll/w0c;->M(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 41
    .line 42
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView$a;

    .line 43
    .line 44
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->e:Ll/w0c;

    .line 45
    .line 46
    invoke-direct {v2, p0, v3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;Ll/nxl;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setMKWebLoadListener(Ll/ilw;)V

    .line 50
    .line 51
    .line 52
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->isH5HandleClick:Z

    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->d:Landroid/view/View;

    .line 55
    .line 56
    if-eqz v0, :cond_0

    .line 57
    .line 58
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->d:Landroid/view/View;

    .line 62
    .line 63
    const/4 p2, 0x0

    .line 64
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    const/4 v0, 0x1

    .line 69
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->d:Landroid/view/View;

    .line 73
    .line 74
    new-instance v1, Ll/fdo0;

    .line 75
    .line 76
    invoke-direct {v1, p2, p1}, Ll/fdo0;-><init>(Ll/qdo0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    const/4 p2, -0x1

    .line 89
    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->onResume()V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public final f(Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p3}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "H5-Authorization"

    .line 13
    .line 14
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p2, p3, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final g()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->g:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->entranceUrl:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p2, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->f(Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->g:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->f:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/wrv;->a()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/ddo0;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1}, Ll/ddo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;)V

    .line 31
    .line 32
    .line 33
    new-instance p0, Ll/edo0;

    .line 34
    .line 35
    invoke-direct {p0}, Ll/edo0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->g:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->entranceUrl:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->f(Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;Ll/qdo0;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->f:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;Ll/qdo0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;)V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
