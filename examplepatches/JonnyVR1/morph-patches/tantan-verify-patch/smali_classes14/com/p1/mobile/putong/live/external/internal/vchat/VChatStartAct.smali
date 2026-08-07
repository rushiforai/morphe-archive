.class public Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->o2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->l2()V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/n4u;->m(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->p2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->m2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->n2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static d2(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "type"

    .line 9
    .line 10
    const-string v2, "anchor"

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static e2(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/kwk0;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-direct {v1, v2}, Ll/kwk0;-><init>(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    new-instance v1, Ll/ad0;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/ad0;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/bc20;

    .line 24
    .line 25
    new-instance v2, Ll/dwk0;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/dwk0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 28
    .line 29
    .line 30
    invoke-direct {v1, v2}, Ll/bc20;-><init>(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/rr60;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/rr60;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    new-instance v1, Ll/pee0;

    .line 45
    .line 46
    sget-object v2, Ll/iit;->Companion:Ll/iit$a;

    .line 47
    .line 48
    invoke-virtual {v2}, Ll/iit$a;->R()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-direct {v1, v2}, Ll/pee0;-><init>(I)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    new-instance v1, Ll/fal0;

    .line 59
    .line 60
    invoke-direct {v1}, Ll/fal0;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->q2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public static g2(Lcom/p1/mobile/android/app/Act;Ll/xnu;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/fal0;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-direct {v1, v2, p1}, Ll/fal0;-><init>(ZLl/xnu;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->q2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static h2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "type"

    .line 9
    .line 10
    const-string v2, "audience_recall"

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    const-string v1, "source"

    .line 16
    .line 17
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    const-string p2, "userId"

    .line 21
    .line 22
    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    const-string p1, "recallId"

    .line 26
    .line 27
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-virtual {p0, p1, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static i2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "type"

    .line 9
    .line 10
    const-string v2, "audience_normal"

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    const-string v1, "source"

    .line 16
    .line 17
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    const-string p2, "roomId"

    .line 21
    .line 22
    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static k2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "type"

    .line 9
    .line 10
    const-string v2, "audience_user"

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    const-string v1, "source"

    .line 16
    .line 17
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    const-string p2, "userId"

    .line 21
    .line 22
    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private synthetic l2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0}, Ll/n4u;->m(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic n2(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    const-string v0, "reqLive"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const-string v2, "normal"

    .line 6
    .line 7
    invoke-static {v2, v0, p1, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->s2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget p1, Lcom/p1/mobile/putong/live/external/R$string;->O:I

    .line 11
    .line 12
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-static {p0}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static q2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Ll/lbl0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Ll/d45;->a(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static r2(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "type"

    .line 9
    .line 10
    const-string v2, "audience_coupons"

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    const-string v1, "source"

    .line 16
    .line 17
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    const-string p2, "coupons"

    .line 21
    .line 22
    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static s2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    instance-of p3, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 8
    .line 9
    iget p2, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 10
    .line 11
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    :cond_1
    :goto_0
    new-instance p2, Ll/pf60;

    .line 21
    .line 22
    const-string v0, "type"

    .line 23
    .line 24
    invoke-direct {p2, v0, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/pf60;

    .line 28
    .line 29
    const-string v0, "stage"

    .line 30
    .line 31
    invoke-direct {p0, v0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    new-instance p1, Ll/pf60;

    .line 35
    .line 36
    const-string v0, "error"

    .line 37
    .line 38
    invoke-direct {p1, v0, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    filled-new-array {p2, p0, p1}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "e_live_video_quickchat_enter_status"

    .line 46
    .line 47
    const-string p2, "p_live_video_quickchat_status"

    .line 48
    .line 49
    invoke-static {p1, p2, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static u2(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const-string v1, "type"

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ll/pf60;

    .line 9
    .line 10
    const-string v1, "stage"

    .line 11
    .line 12
    invoke-direct {p0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Ll/pf60;

    .line 16
    .line 17
    const-string v1, "error"

    .line 18
    .line 19
    const-string v2, "NA"

    .line 20
    .line 21
    invoke-direct {p1, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    filled-new-array {v0, p0, p1}, [Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "e_live_video_quickchat_enter_status"

    .line 29
    .line 30
    const-string v0, "p_live_video_quickchat_status"

    .line 31
    .line 32
    invoke-static {p1, v0, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public initDataOnCreate()V
    .locals 8

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "type"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v2, "anchor"

    .line 15
    .line 16
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v2, 0x1

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    new-instance v0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/kwk0;

    .line 29
    .line 30
    invoke-direct {v1, v2}, Ll/kwk0;-><init>(Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/ad0;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/ad0;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    new-instance v1, Ll/bc20;

    .line 45
    .line 46
    new-instance v2, Ll/ewk0;

    .line 47
    .line 48
    invoke-direct {v2, p0}, Ll/ewk0;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;)V

    .line 49
    .line 50
    .line 51
    invoke-direct {v1, v2}, Ll/bc20;-><init>(Ll/x20;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    new-instance v1, Ll/rr60;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/rr60;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    new-instance v1, Ll/pee0;

    .line 66
    .line 67
    sget-object v2, Ll/iit;->Companion:Ll/iit$a;

    .line 68
    .line 69
    invoke-virtual {v2}, Ll/iit$a;->R()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    invoke-direct {v1, v2}, Ll/pee0;-><init>(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    new-instance v1, Ll/fal0;

    .line 80
    .line 81
    invoke-direct {v1}, Ll/fal0;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->q2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    const-string v3, "audience_normal"

    .line 102
    .line 103
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    const-string v3, "source"

    .line 108
    .line 109
    const-string v4, "normal"

    .line 110
    .line 111
    const/4 v5, 0x0

    .line 112
    if-eqz v0, :cond_1

    .line 113
    .line 114
    new-instance v0, Ljava/util/ArrayList;

    .line 115
    .line 116
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 117
    .line 118
    .line 119
    new-instance v1, Ll/kwk0;

    .line 120
    .line 121
    invoke-direct {v1, v5}, Ll/kwk0;-><init>(Z)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    new-instance v1, Ll/mej0;

    .line 128
    .line 129
    invoke-direct {v1, v4, v2}, Ll/mej0;-><init>(Ljava/lang/String;Z)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    new-instance v1, Ll/rr60;

    .line 136
    .line 137
    invoke-direct {v1}, Ll/rr60;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    new-instance v1, Ll/pee0;

    .line 144
    .line 145
    sget-object v2, Ll/iit;->Companion:Ll/iit$a;

    .line 146
    .line 147
    invoke-virtual {v2}, Ll/iit$a;->S()I

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    invoke-direct {v1, v2}, Ll/pee0;-><init>(I)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    new-instance v1, Ll/ial0;

    .line 158
    .line 159
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    const-string v4, "roomId"

    .line 164
    .line 165
    invoke-virtual {v2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    invoke-virtual {v4, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    invoke-direct {v1, v2, v3}, Ll/ial0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 184
    .line 185
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->q2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 186
    .line 187
    .line 188
    return-void

    .line 189
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    const-string v6, "audience_user"

    .line 198
    .line 199
    invoke-static {v0, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    const-string v6, "userId"

    .line 204
    .line 205
    const-string v7, "start"

    .line 206
    .line 207
    if-eqz v0, :cond_2

    .line 208
    .line 209
    invoke-static {v4, v7}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->u2(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {v0, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-static {v0}, Ll/jwu;->I(Ljava/lang/String;)Lrx/c;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    new-instance v1, Ll/fwk0;

    .line 225
    .line 226
    invoke-direct {v1, p0}, Ll/fwk0;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;)V

    .line 227
    .line 228
    .line 229
    new-instance v2, Ll/gwk0;

    .line 230
    .line 231
    invoke-direct {v2, p0}, Ll/gwk0;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;)V

    .line 232
    .line 233
    .line 234
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 239
    .line 240
    .line 241
    return-void

    .line 242
    :cond_2
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    const-string v4, "audience_coupons"

    .line 251
    .line 252
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-eqz v0, :cond_3

    .line 257
    .line 258
    new-instance v0, Ljava/util/ArrayList;

    .line 259
    .line 260
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 261
    .line 262
    .line 263
    new-instance v1, Ll/kwk0;

    .line 264
    .line 265
    invoke-direct {v1, v5}, Ll/kwk0;-><init>(Z)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    new-instance v1, Ll/mej0;

    .line 272
    .line 273
    const-string v4, "randomMatch"

    .line 274
    .line 275
    invoke-direct {v1, v4, v2}, Ll/mej0;-><init>(Ljava/lang/String;Z)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 279
    .line 280
    .line 281
    new-instance v1, Ll/ogl0;

    .line 282
    .line 283
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    const-string v4, "coupons"

    .line 288
    .line 289
    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 290
    .line 291
    .line 292
    move-result v2

    .line 293
    invoke-direct {v1, v2}, Ll/ogl0;-><init>(I)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 297
    .line 298
    .line 299
    new-instance v1, Ll/rr60;

    .line 300
    .line 301
    invoke-direct {v1}, Ll/rr60;-><init>()V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    new-instance v1, Ll/pee0;

    .line 308
    .line 309
    sget-object v2, Ll/iit;->Companion:Ll/iit$a;

    .line 310
    .line 311
    invoke-virtual {v2}, Ll/iit$a;->S()I

    .line 312
    .line 313
    .line 314
    move-result v2

    .line 315
    invoke-direct {v1, v2}, Ll/pee0;-><init>(I)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 319
    .line 320
    .line 321
    new-instance v1, Ll/ckl0;

    .line 322
    .line 323
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 324
    .line 325
    .line 326
    move-result-object v2

    .line 327
    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    invoke-direct {v1, v2}, Ll/ckl0;-><init>(Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 335
    .line 336
    .line 337
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 338
    .line 339
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->q2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 340
    .line 341
    .line 342
    return-void

    .line 343
    :cond_3
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 344
    .line 345
    .line 346
    move-result-object v0

    .line 347
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    const-string v1, "audience_recall"

    .line 352
    .line 353
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 354
    .line 355
    .line 356
    move-result v0

    .line 357
    if-eqz v0, :cond_5

    .line 358
    .line 359
    const-string v0, "fakeCall"

    .line 360
    .line 361
    invoke-static {v0, v7}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->u2(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    .line 363
    .line 364
    sget-object v1, Ll/iit;->Companion:Ll/iit$a;

    .line 365
    .line 366
    invoke-virtual {v1}, Ll/iit$a;->S()I

    .line 367
    .line 368
    .line 369
    move-result v1

    .line 370
    invoke-static {v1}, Ll/wgt;->u(I)Z

    .line 371
    .line 372
    .line 373
    move-result v1

    .line 374
    const-string v2, "sdkRes"

    .line 375
    .line 376
    if-nez v1, :cond_4

    .line 377
    .line 378
    const/4 v1, 0x0

    .line 379
    const-string v3, "notReady"

    .line 380
    .line 381
    invoke-static {v0, v2, v1, v3}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->s2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 385
    .line 386
    invoke-static {p0}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 387
    .line 388
    .line 389
    return-void

    .line 390
    :cond_4
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->u2(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    .line 392
    .line 393
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    invoke-virtual {v0, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    invoke-static {v0}, Ll/jwu;->I(Ljava/lang/String;)Lrx/c;

    .line 402
    .line 403
    .line 404
    move-result-object v0

    .line 405
    new-instance v1, Ll/hwk0;

    .line 406
    .line 407
    invoke-direct {v1, p0}, Ll/hwk0;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;)V

    .line 408
    .line 409
    .line 410
    new-instance v2, Ll/iwk0;

    .line 411
    .line 412
    invoke-direct {v2, p0}, Ll/iwk0;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;)V

    .line 413
    .line 414
    .line 415
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 416
    .line 417
    .line 418
    move-result-object p0

    .line 419
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 420
    .line 421
    .line 422
    :cond_5
    return-void
.end method

.method public final synthetic m2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 4

    .line 1
    const-string v0, "reqLive"

    .line 2
    .line 3
    const-string v1, "normal"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->u2(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v2, Ll/kwk0;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-direct {v2, v3}, Ll/kwk0;-><init>(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/mej0;

    .line 23
    .line 24
    invoke-direct {v2, v1, v3}, Ll/mej0;-><init>(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    new-instance v1, Ll/rr60;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/rr60;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    new-instance v1, Ll/pee0;

    .line 39
    .line 40
    sget-object v2, Ll/iit;->Companion:Ll/iit$a;

    .line 41
    .line 42
    invoke-virtual {v2}, Ll/iit$a;->S()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-direct {v1, v2}, Ll/pee0;-><init>(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    new-instance v1, Ll/ial0;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->roomId:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    const-string v3, "source"

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-direct {v1, p1, v2}, Ll/ial0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->q2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final synthetic o2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)V
    .locals 5

    .line 1
    const-string v0, "reqLive"

    .line 2
    .line 3
    const-string v1, "fakeCall"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->u2(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/yuk0;->d(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const-string v0, "NA"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->status:Ljava/lang/String;

    .line 22
    .line 23
    :goto_0
    const-string v2, "anchorBusy"

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-static {v1, v2, v3, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->s2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1}, Ll/yuk0;->d(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    invoke-static {p0}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v2, Ll/kwk0;

    .line 51
    .line 52
    const/4 v3, 0x0

    .line 53
    invoke-direct {v2, v3}, Ll/kwk0;-><init>(Z)V

    .line 54
    .line 55
    .line 56
    const/4 v4, 0x1

    .line 57
    invoke-virtual {v2, v4}, Ll/kwk0;->k(Z)Ll/lbl0;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    new-instance v2, Ll/mej0;

    .line 65
    .line 66
    invoke-direct {v2, v1, v3}, Ll/mej0;-><init>(Ljava/lang/String;Z)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    new-instance v1, Ll/kd2;

    .line 73
    .line 74
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->roomId:Ljava/lang/String;

    .line 75
    .line 76
    invoke-direct {v1, v2}, Ll/kd2;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    new-instance v1, Ll/xdl0;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    const-string v3, "source"

    .line 89
    .line 90
    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    const-string v4, "recallId"

    .line 99
    .line 100
    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-direct {v1, p1, v2, v3}, Ll/xdl0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->q2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public final synthetic p2(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "reqLive"

    .line 7
    .line 8
    const-string v0, ""

    .line 9
    .line 10
    const-string v1, "fakeCall"

    .line 11
    .line 12
    invoke-static {v1, p0, p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartAct;->s2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
