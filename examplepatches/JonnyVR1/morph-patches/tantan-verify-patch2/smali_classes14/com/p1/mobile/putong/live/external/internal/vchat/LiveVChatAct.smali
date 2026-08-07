.class public Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;
.super Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseAct;
.source "SourceFile"


# static fields
.field public static h:Ljava/lang/String; = "start_data"

.field public static i:Ljava/lang/String; = "key_video_chat"


# instance fields
.field public c:Z

.field public d:Ll/wvk0;

.field public e:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;

.field public f:Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

.field public g:Ll/jgu;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->e2()V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->d2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->h2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static a2(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "jump_to_tag"

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static b2(Landroid/content/Context;Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->h:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "jump_to_tag"

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public static c2(Landroid/content/Context;Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "jump_to_tag"

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    sget-object p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->h:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method private d2(Landroid/os/Bundle;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->c:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-static {}, Ll/cvk0;->a()Ll/cvk0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/cvk0;->b()Ll/xnu;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    new-instance v0, Ll/wvk0;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->e:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;

    .line 23
    .line 24
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->c:Z

    .line 25
    .line 26
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 27
    .line 28
    move-object v1, p0

    .line 29
    invoke-direct/range {v0 .. v5}, Ll/wvk0;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;ZLcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;Ll/xnu;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, v1, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->d:Ll/wvk0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/wvk0;->R2()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private synthetic h2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->b()Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->e(Landroid/content/Context;)I

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public final e2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->d:Ll/wvk0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wvk0;->n()V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/am2;->j()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/r230;->s()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/tantan/library/svga/SVGALoader;->clear()V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 20
    .line 21
    .line 22
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 23
    .line 24
    invoke-static {p0}, Ll/r230;->G(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public g2(Lcom/p1/mobile/putong/data/PushMessageCustom;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->g:Ll/jgu;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/jgu;->T2(Lcom/p1/mobile/putong/data/PushMessageCustom;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public getResources()Landroid/content/res/Resources;
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, v0, Landroid/content/res/Configuration;->fontScale:F

    .line 10
    .line 11
    const/high16 v2, 0x3f800000    # 1.0f

    .line 12
    .line 13
    cmpl-float v1, v1, v2

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iput v2, v0, Landroid/content/res/Configuration;->fontScale:F

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p0, v0, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-object p0
.end method

.method public i2(Ll/jgu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->g:Ll/jgu;

    .line 2
    .line 3
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/xec0;->u1:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    instance-of p2, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->e:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;

    .line 15
    .line 16
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->e:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;

    .line 17
    .line 18
    const/4 p2, 0x1

    .line 19
    invoke-virtual {p1, p2}, Landroid/view/View;->setKeepScreenOn(Z)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->e:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;

    .line 23
    .line 24
    return-object p0
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/fgu;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/fgu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/ggu;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/ggu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/hgu;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/hgu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public needBindBillingService()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onBackPressed()V
    .locals 0

    return-void
.end method

.method public onStopLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onStopLifecycle()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "jump_to_tag"

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->c:Z

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->h:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
