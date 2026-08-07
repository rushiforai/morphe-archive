.class public Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;
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

.method public static E2(Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;->idCard:Lcom/p1/mobile/putong/live/base/data/BLiveIdCardVerificationInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "verified"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public static F2(Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/live/base/data/BLiveVerificationAnchor;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVerificationAnchor;->status:Lcom/p1/mobile/putong/live/base/data/BLiveVerificationStatus;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "verified"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public static M2(Lcom/p1/mobile/android/app/Act;ZLl/x20;)V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->t()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/uur;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/uur;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/vur;

    .line 21
    .line 22
    invoke-direct {v1, p1, p0, p2}, Ll/vur;-><init>(ZLcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/kur;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/kur;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->A2(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->w2(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    return-void
.end method

.method public static synthetic Z1(ZLcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;)V
    .locals 0

    .line 1
    invoke-static {p3, p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->s2(Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;ZLcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->D2()V

    return-void
.end method

.method public static synthetic b2(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "voice:"

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
    const-string v0, "[live]verification"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->u2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->C2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->v2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    return-void
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->y2()V

    return-void
.end method

.method public static synthetic i2(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget v0, Lcom/p1/mobile/putong/common/R$string;->R:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "voice:"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p0, ":"

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "[live]verification"

    .line 29
    .line 30
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic k2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->z2(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    return-void
.end method

.method public static synthetic l2(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->B2(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    return-void
.end method

.method public static m2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

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
    const/high16 p0, 0x4000000

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    const-string p0, "LIVE_ANCHOR_START_DATA"

    .line 20
    .line 21
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method public static n2(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "start_data"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "type"

    .line 14
    .line 15
    const-string p1, "live"

    .line 16
    .line 17
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public static o2(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "start_data"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "type"

    .line 14
    .line 15
    const-string p1, "voice"

    .line 16
    .line 17
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public static s2(Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;ZLcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->E2(Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-interface {p3}, Ll/x20;->call()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->E2(Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_2

    .line 18
    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->F2(Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const-string p0, "tantanapp://actualnameVerify"

    .line 27
    .line 28
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance p1, Ll/lur;

    .line 33
    .line 34
    invoke-direct {p1}, Ll/lur;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {p2, p0, p1}, Ll/nae0;->n(Landroid/app/Activity;Landroid/net/Uri;Ll/z20;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p2}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    :goto_0
    invoke-interface {p3}, Ll/x20;->call()V

    .line 45
    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public final synthetic A2(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->L2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic B2(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 1

    .line 1
    const-string v0, "voice"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->r2(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->q2(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic C2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->I2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic D2()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final H2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 3

    .line 1
    sget-object v0, Ll/v2t;->d:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "start_voice_live_act"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 9
    .line 10
    const-string v1, "voice_res_loading"

    .line 11
    .line 12
    const-string v2, "voice check res"

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v0, "type_voice_live"

    .line 18
    .line 19
    iput-object v0, p2, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->type:Ljava/lang/String;

    .line 20
    .line 21
    new-instance v0, Landroid/content/Intent;

    .line 22
    .line 23
    const-class v1, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    .line 24
    .line 25
    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 26
    .line 27
    .line 28
    const-string v1, "jump_to_tag"

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    const/high16 v1, 0x4000000

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    const-string v1, "LIVE_ANCHOR_START_DATA"

    .line 40
    .line 41
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p0}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final I2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/p6s;->B1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->anchorSource:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->voiceEntranceType:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->T(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget-object v1, Ll/v2t;->d:Ljava/lang/String;

    .line 45
    .line 46
    const-string v2, "start_voice_live_act"

    .line 47
    .line 48
    invoke-static {v1, v2}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    sget-object v1, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 52
    .line 53
    const-string v2, "voice_res_loading"

    .line 54
    .line 55
    const-string v3, "voice check res"

    .line 56
    .line 57
    invoke-virtual {v1, v2, v3}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    const-string v1, "type_voice_live"

    .line 61
    .line 62
    iput-object v1, p2, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->type:Ljava/lang/String;

    .line 63
    .line 64
    new-instance p2, Landroid/content/Intent;

    .line 65
    .line 66
    const-class v1, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    .line 67
    .line 68
    invoke-direct {p2, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 69
    .line 70
    .line 71
    const-string v1, "jump_to_tag"

    .line 72
    .line 73
    const/4 v2, 0x0

    .line 74
    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 75
    .line 76
    .line 77
    const/high16 v1, 0x4000000

    .line 78
    .line 79
    invoke-virtual {p2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 80
    .line 81
    .line 82
    const-string v1, "LIVE_AUDIENCE_START_DATA"

    .line 83
    .line 84
    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p0}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->H2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public final K2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 1

    .line 1
    new-instance p1, Ll/pvn$a;

    .line 2
    .line 3
    new-instance v0, Ll/qur;

    .line 4
    .line 5
    invoke-direct {v0, p0, p2, p3}, Ll/qur;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-direct {p1, p0, v0}, Ll/pvn$a;-><init>(Ll/x20;Ll/x20;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p2, p1}, Ll/pvn;->c(Ljava/lang/String;Ll/ga1;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final L2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 3

    .line 1
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 2
    .line 3
    const-string v1, "voice_res_loading"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/iit;->Companion:Ll/iit$a;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/iit$a;->S()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    new-instance v1, Ll/sur;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1, p2}, Ll/sur;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Ll/tur;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Ll/tur;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, p2, v0, v1, v2}, Ll/pn0;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;ILl/x20;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public initDataOnCreate()V
    .locals 3

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
    const-string v1, "start_data"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "type"

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "voice"

    .line 35
    .line 36
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    check-cast v0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->r2(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    check-cast v0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->q2(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final p2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;Z)V
    .locals 1

    .line 1
    new-instance v0, Ll/rur;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/rur;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0, p3}, Ll/sz2;->d(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final q2(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 8

    .line 1
    invoke-static {}, Ll/q2f;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Ll/v2t;->d:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "anchor_start_live"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/wrv;->R()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-virtual {p1, v1}, Ll/wrv;->o0(I)V

    .line 30
    .line 31
    .line 32
    const-string p1, "teenMode_can\'t_startLive"

    .line 33
    .line 34
    invoke-static {v0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p0}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v1, 0x2

    .line 50
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_2

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    sget-object v1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->CHAT_ROOM_WINDOW:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 59
    .line 60
    if-eq v0, v1, :cond_2

    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    const-string v1, "live"

    .line 65
    .line 66
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->K2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->traceId:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->anchorSource:Ljava/lang/String;

    .line 73
    .line 74
    const/4 v6, 0x0

    .line 75
    const/4 v7, 0x0

    .line 76
    const-string v2, "anchor_start_live_click"

    .line 77
    .line 78
    const/4 v3, 0x1

    .line 79
    invoke-static/range {v2 .. v7}, Ll/fgt;->a(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/y20;)V

    .line 80
    .line 81
    .line 82
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 83
    .line 84
    const-string v1, "live_res_loading"

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    sget-object v1, Ll/iit;->Companion:Ll/iit$a;

    .line 92
    .line 93
    invoke-virtual {v1}, Ll/iit$a;->O()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    new-instance v2, Ll/our;

    .line 98
    .line 99
    invoke-direct {v2, p0, p1}, Ll/our;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 100
    .line 101
    .line 102
    new-instance v3, Ll/pur;

    .line 103
    .line 104
    invoke-direct {v3, p0}, Ll/pur;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v0, p1, v1, v2, v3}, Ll/pn0;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;ILl/x20;Ll/x20;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public final r2(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x3

    .line 10
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    sget-object v2, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->CHAT_ROOM_WINDOW:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 19
    .line 20
    if-eq v0, v2, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    const-string v1, "voice"

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->K2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->L2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    if-eqz p1, :cond_2

    .line 43
    .line 44
    invoke-static {}, Ll/cmp0;->d()Ll/cmp0;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/cmp0;->f()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    invoke-static {}, Ll/cmp0;->d()Ll/cmp0;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Ll/cmp0;->j()V

    .line 59
    .line 60
    .line 61
    invoke-static {p0}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Ll/vwt;->m6()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const-string v1, "mobile"

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    const/4 v2, 0x1

    .line 80
    if-eqz v1, :cond_3

    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    invoke-virtual {p0, v0, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->p2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;Z)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_3
    const-string v1, "forceRealName"

    .line 89
    .line 90
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    if-eqz v0, :cond_4

    .line 97
    .line 98
    new-instance v0, Ll/jur;

    .line 99
    .line 100
    invoke-direct {v0, p0, p1}, Ll/jur;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v1, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->M2(Lcom/p1/mobile/android/app/Act;ZLl/x20;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_4
    new-instance v0, Ll/nur;

    .line 108
    .line 109
    invoke-direct {v0, p0, p1}, Ll/nur;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 110
    .line 111
    .line 112
    const/4 p0, 0x0

    .line 113
    invoke-static {v1, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->M2(Lcom/p1/mobile/android/app/Act;ZLl/x20;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public final synthetic u2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->L2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic v2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->B6()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/mur;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1, p2}, Ll/mur;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic w2(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 3

    .line 1
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 2
    .line 3
    const-string v1, "live_res_loading"

    .line 4
    .line 5
    const-string v2, "live check res"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/v2t;->d:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "start_live_act"

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->m2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic y2()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z2(Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->L2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
