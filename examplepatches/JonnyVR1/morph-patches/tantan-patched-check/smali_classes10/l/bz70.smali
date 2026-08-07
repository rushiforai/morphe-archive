.class public Ll/bz70;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Landroid/view/View;

.field public j:Lv/VDraweeView;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VImage;

.field public s:Lv/VText;

.field public t:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public u:Ljava/lang/String;

.field public v:Ll/kcg0;

.field public w:Ljava/lang/String;

.field public x:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "accept"

    .line 5
    .line 6
    iput-object p1, p0, Ll/bz70;->w:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, "unaccept"

    .line 9
    .line 10
    iput-object p1, p0, Ll/bz70;->x:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic J3(Ll/bz70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bz70;->d4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K3(Ll/bz70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bz70;->c4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L3(Ll/hct;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Ll/hct;->a:I

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic M3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "acceptPkInvite id:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0, p1}, Ll/n180;->i(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;

    .line 20
    .line 21
    return-object p0
.end method

.method public static synthetic N3(Ll/bz70;Ll/hct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bz70;->e4(Ll/hct;)V

    return-void
.end method

.method public static synthetic O3(Ll/bz70;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bz70;->h4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    return-void
.end method

.method public static synthetic P3(Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic R3(Ll/bz70;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bz70;->a4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic S3(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x4

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public static synthetic T3(Ll/bz70;Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bz70;->j4(Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V

    return-void
.end method

.method public static synthetic U3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "rejectInvite id:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0, p1}, Ll/n180;->i(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;

    .line 20
    .line 21
    return-object p0
.end method

.method public static synthetic V3(Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic W3(Ll/bz70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bz70;->b4(Landroid/view/View;)V

    return-void
.end method

.method private Y3(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bz70;->v:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p0, v0}, Ll/su70;->b(Ll/i6t;Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->cancelMatch()Ll/v3f$c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ll/v3f$c;->p()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->cancelMatch()Ll/v3f$c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ll/v3f$c;->p()V

    .line 34
    .line 35
    .line 36
    invoke-static {p0, v0}, Ll/su70;->e(Ll/i6t;Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->WebViewDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$WebViewDialogEvent;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$WebViewDialogEvent;->dismiss()Ll/v3f$d;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/ztp0$a;

    .line 50
    .line 51
    const/16 v2, 0x258

    .line 52
    .line 53
    invoke-direct {v1, v2}, Ll/ztp0$a;-><init>(I)V

    .line 54
    .line 55
    .line 56
    sget-object v2, Ll/efv;->i:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ll/ztp0$a;->c(Ljava/lang/String;)Ll/ztp0$a;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1}, Ll/ztp0$a;->b()Ll/ztp0;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/bz70;->Z3()V

    .line 70
    .line 71
    .line 72
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->v3(Ljava/lang/String;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    new-instance v0, Ll/yy70;

    .line 81
    .line 82
    invoke-direct {v0, p1}, Ll/yy70;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    new-instance p1, Ll/zy70;

    .line 90
    .line 91
    invoke-direct {p1}, Ll/zy70;-><init>()V

    .line 92
    .line 93
    .line 94
    new-instance v0, Ll/ga80;

    .line 95
    .line 96
    invoke-direct {v0}, Ll/ga80;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method private synthetic a4(Ljava/lang/Long;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/bz70;->p:Lv/VText;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Wb:I

    .line 6
    .line 7
    new-instance v3, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 13
    .line 14
    .line 15
    move-result-wide v4

    .line 16
    const-wide/16 v6, 0xa

    .line 17
    .line 18
    cmp-long v4, v4, v6

    .line 19
    .line 20
    if-lez v4, :cond_0

    .line 21
    .line 22
    const-wide/16 v4, 0x0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 26
    .line 27
    .line 28
    move-result-wide v4

    .line 29
    sub-long v4, v6, v4

    .line 30
    .line 31
    :goto_0
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v4, ""

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 55
    .line 56
    .line 57
    move-result-wide v0

    .line 58
    cmp-long p1, v0, v6

    .line 59
    .line 60
    if-ltz p1, :cond_1

    .line 61
    .line 62
    iget-object p1, p0, Ll/bz70;->u:Ljava/lang/String;

    .line 63
    .line 64
    invoke-direct {p0, p1}, Ll/bz70;->i4(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method private synthetic b4(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/bz70;->u:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/bz70;->Y3(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic c4(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/bz70;->u:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/bz70;->i4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic d4(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/bz70;->r:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p0, Ll/bz70;->w:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object v0, p0, Ll/bz70;->r:Lv/VImage;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Ll/bz70;->x:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/bz70;->r:Lv/VImage;

    .line 25
    .line 26
    sget p1, Ll/obc0;->O5:I

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object p1, p0, Ll/bz70;->w:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/bz70;->r:Lv/VImage;

    .line 38
    .line 39
    sget p1, Ll/obc0;->t4:I

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private synthetic e4(Ll/hct;)V
    .locals 0

    .line 1
    iget-boolean p1, p1, Ll/hct;->b:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bz70;->Z3()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private f4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->I5(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/az70;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/az70;-><init>(Ll/bz70;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/ga80;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/ga80;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private h4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "pk_invite_cancel"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/bz70;->g4(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "pk_invite_notify"

    .line 20
    .line 21
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    new-instance v0, Ll/qc80;

    .line 28
    .line 29
    const/16 v1, 0x258

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ll/qc80;-><init>(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->isOnceMore:Z

    .line 47
    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ll/bz70;->k4(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method private i4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/bz70;->Z3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/bz70;->v:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    sget v0, Ll/fct;->f:I

    .line 10
    .line 11
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/bz70;->r:Lv/VImage;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Ll/bz70;->x:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->R6(Ljava/lang/String;Z)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    new-instance v0, Ll/py70;

    .line 37
    .line 38
    invoke-direct {v0, p1}, Ll/py70;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance p1, Ll/qy70;

    .line 46
    .line 47
    invoke-direct {p1}, Ll/qy70;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v0, Ll/ga80;

    .line 51
    .line 52
    invoke-direct {v0}, Ll/ga80;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private j4(Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;->source:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;->userInfo:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto/16 :goto_7

    .line 8
    .line 9
    :cond_0
    iget-object v2, p0, Ll/bz70;->l:Lv/VText;

    .line 10
    .line 11
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Ll/bz70;->j:Lv/VDraweeView;

    .line 17
    .line 18
    sget v3, Ll/obc0;->J8:I

    .line 19
    .line 20
    invoke-virtual {v2, v3}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Ll/bz70;->j:Lv/VDraweeView;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 30
    .line 31
    sget v4, Ll/qa00;->J:I

    .line 32
    .line 33
    const-string v5, "context_single_room"

    .line 34
    .line 35
    invoke-static {v5, v2, v3, v4}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 36
    .line 37
    .line 38
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 39
    .line 40
    const-string v3, "male"

    .line 41
    .line 42
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    sget v2, Ll/obc0;->Ka:I

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    sget v2, Ll/obc0;->Ja:I

    .line 52
    .line 53
    :goto_0
    iget-object v4, p0, Ll/bz70;->m:Lv/VText;

    .line 54
    .line 55
    const/4 v5, 0x0

    .line 56
    invoke-virtual {v4, v2, v5, v5, v5}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Ll/bz70;->m:Lv/VText;

    .line 60
    .line 61
    iget-object v4, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 62
    .line 63
    invoke-static {v4, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_2

    .line 68
    .line 69
    const v3, -0x7a460e

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    const v3, -0xc370b

    .line 74
    .line 75
    .line 76
    :goto_1
    const/high16 v4, 0x40000000    # 2.0f

    .line 77
    .line 78
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    int-to-float v4, v4

    .line 83
    invoke-static {v3, v4}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 88
    .line 89
    .line 90
    iget-object v2, p0, Ll/bz70;->m:Lv/VText;

    .line 91
    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 93
    .line 94
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    iget-object v1, p0, Ll/bz70;->s:Lv/VText;

    .line 102
    .line 103
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Z9:I

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 106
    .line 107
    .line 108
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;->live:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 109
    .line 110
    const-wide/16 v2, 0x0

    .line 111
    .line 112
    if-nez v1, :cond_3

    .line 113
    .line 114
    move-wide v6, v2

    .line 115
    goto :goto_2

    .line 116
    :cond_3
    iget-wide v6, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 117
    .line 118
    :goto_2
    invoke-static {v6, v7}, Ll/yau;->c(D)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;->live:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 123
    .line 124
    if-nez p1, :cond_4

    .line 125
    .line 126
    goto :goto_3

    .line 127
    :cond_4
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->rewardPoint:D

    .line 128
    .line 129
    :goto_3
    invoke-static {v2, v3}, Ll/yau;->c(D)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iget-object v2, p0, Ll/bz70;->n:Lv/VText;

    .line 134
    .line 135
    sget-object v3, Ll/zrv;->e:Landroid/app/Application;

    .line 136
    .line 137
    sget-object v4, Ll/htd0;->f:Ll/htd0;

    .line 138
    .line 139
    invoke-static {v4}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    check-cast v4, Ll/civ;

    .line 144
    .line 145
    invoke-virtual {v4}, Ll/civ;->n()Z

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    if-eqz v4, :cond_5

    .line 150
    .line 151
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->z3:I

    .line 152
    .line 153
    goto :goto_4

    .line 154
    :cond_5
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->y3:I

    .line 155
    .line 156
    :goto_4
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {v3, v4, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    .line 166
    .line 167
    iget-object p1, p0, Ll/bz70;->p:Lv/VText;

    .line 168
    .line 169
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 170
    .line 171
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Wb:I

    .line 172
    .line 173
    const-string v3, "10"

    .line 174
    .line 175
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    .line 185
    .line 186
    iget-object p1, p0, Ll/bz70;->v:Ll/kcg0;

    .line 187
    .line 188
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 196
    .line 197
    const/4 v2, 0x1

    .line 198
    invoke-virtual {p1, v2, v1}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-virtual {p0, p1}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    new-instance v1, Ll/ry70;

    .line 207
    .line 208
    invoke-direct {v1, p0}, Ll/ry70;-><init>(Ll/bz70;)V

    .line 209
    .line 210
    .line 211
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    iput-object p1, p0, Ll/bz70;->v:Ll/kcg0;

    .line 220
    .line 221
    const-string p1, "onceMore"

    .line 222
    .line 223
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 224
    .line 225
    .line 226
    move-result p1

    .line 227
    iget-object v1, p0, Ll/bz70;->o:Lv/VText;

    .line 228
    .line 229
    const-string v3, "%s"

    .line 230
    .line 231
    if-eqz p1, :cond_6

    .line 232
    .line 233
    sget p1, Ll/fct;->q:I

    .line 234
    .line 235
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    invoke-static {v3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 248
    .line 249
    .line 250
    iget-object p0, p0, Ll/bz70;->k:Landroid/widget/TextView;

    .line 251
    .line 252
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 253
    .line 254
    .line 255
    return-void

    .line 256
    :cond_6
    sget p1, Ll/fct;->p:I

    .line 257
    .line 258
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object p1

    .line 262
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    invoke-static {v3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 271
    .line 272
    .line 273
    iget-object p1, p0, Ll/bz70;->k:Landroid/widget/TextView;

    .line 274
    .line 275
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 283
    .line 284
    .line 285
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 286
    .line 287
    .line 288
    move-result v0

    .line 289
    const/4 v1, -0x1

    .line 290
    sparse-switch v0, :sswitch_data_0

    .line 291
    .line 292
    .line 293
    :goto_5
    move v5, v1

    .line 294
    goto :goto_6

    .line 295
    :sswitch_0
    const-string v0, "similar"

    .line 296
    .line 297
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result p1

    .line 301
    if-nez p1, :cond_7

    .line 302
    .line 303
    goto :goto_5

    .line 304
    :cond_7
    const/4 v5, 0x3

    .line 305
    goto :goto_6

    .line 306
    :sswitch_1
    const-string v0, "match"

    .line 307
    .line 308
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 309
    .line 310
    .line 311
    move-result p1

    .line 312
    if-nez p1, :cond_8

    .line 313
    .line 314
    goto :goto_5

    .line 315
    :cond_8
    const/4 v5, 0x2

    .line 316
    goto :goto_6

    .line 317
    :sswitch_2
    const-string v0, "fans"

    .line 318
    .line 319
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    move-result p1

    .line 323
    if-nez p1, :cond_9

    .line 324
    .line 325
    goto :goto_5

    .line 326
    :cond_9
    move v5, v2

    .line 327
    goto :goto_6

    .line 328
    :sswitch_3
    const-string v0, "nearby"

    .line 329
    .line 330
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 331
    .line 332
    .line 333
    move-result p1

    .line 334
    if-nez p1, :cond_a

    .line 335
    .line 336
    goto :goto_5

    .line 337
    :cond_a
    :goto_6
    packed-switch v5, :pswitch_data_0

    .line 338
    .line 339
    .line 340
    :goto_7
    return-void

    .line 341
    :pswitch_0
    iget-object p0, p0, Ll/bz70;->k:Landroid/widget/TextView;

    .line 342
    .line 343
    sget p1, Ll/fct;->t:I

    .line 344
    .line 345
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 346
    .line 347
    .line 348
    return-void

    .line 349
    :pswitch_1
    iget-object p0, p0, Ll/bz70;->k:Landroid/widget/TextView;

    .line 350
    .line 351
    sget p1, Ll/fct;->r:I

    .line 352
    .line 353
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 354
    .line 355
    .line 356
    return-void

    .line 357
    :pswitch_2
    iget-object p0, p0, Ll/bz70;->k:Landroid/widget/TextView;

    .line 358
    .line 359
    sget p1, Ll/fct;->s:I

    .line 360
    .line 361
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 362
    .line 363
    .line 364
    return-void

    .line 365
    :pswitch_3
    iget-object p0, p0, Ll/bz70;->k:Landroid/widget/TextView;

    .line 366
    .line 367
    sget p1, Ll/fct;->u:I

    .line 368
    .line 369
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 370
    .line 371
    .line 372
    return-void

    .line 373
    :sswitch_data_0
    .sparse-switch
        -0x3e8dd581 -> :sswitch_3
        0x2fd7c0 -> :sswitch_2
        0x62dd9c5 -> :sswitch_1
        0x7ccad5eb -> :sswitch_0
    .end sparse-switch

    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public X3(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cz70;->b(Ll/bz70;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Z3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bz70;->t:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/bz70;->u:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public g4(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bz70;->u:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/bz70;->v:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    sget p1, Ll/fct;->e:I

    .line 15
    .line 16
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/bz70;->Z3()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public k4(Ljava/lang/String;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/bz70;->u:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Ll/bz70;->t:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/c0s;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {p0, v1, v2}, Ll/bz70;->X3(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, p0, v1}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/bz70;->t:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 26
    .line 27
    iget-object v0, p0, Ll/bz70;->q:Lv/VText;

    .line 28
    .line 29
    new-instance v1, Ll/uy70;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/uy70;-><init>(Ll/bz70;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/bz70;->p:Lv/VText;

    .line 38
    .line 39
    new-instance v1, Ll/vy70;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/vy70;-><init>(Ll/bz70;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/bz70;->r:Lv/VImage;

    .line 48
    .line 49
    new-instance v1, Ll/wy70;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/wy70;-><init>(Ll/bz70;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v0, p0, Ll/bz70;->r:Lv/VImage;

    .line 58
    .line 59
    iget-object v1, p0, Ll/bz70;->w:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/bz70;->r:Lv/VImage;

    .line 65
    .line 66
    sget v1, Ll/obc0;->t4:I

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/bz70;->t:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 72
    .line 73
    new-instance v1, Ll/xy70;

    .line 74
    .line 75
    invoke-direct {v1}, Ll/xy70;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/bz70;->t:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 84
    .line 85
    .line 86
    invoke-direct {p0, p1}, Ll/bz70;->f4(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/aj1;->U()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/oy70;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/oy70;-><init>(Ll/bz70;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->showPkDialog()Ll/v3f$d;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lrx/c;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/sy70;

    .line 53
    .line 54
    invoke-direct {v1}, Ll/sy70;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/ty70;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/ty70;-><init>(Ll/bz70;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    return-void
.end method
