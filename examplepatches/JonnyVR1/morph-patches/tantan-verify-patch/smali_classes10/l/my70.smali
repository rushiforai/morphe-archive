.class public Ll/my70;
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

.field public j:Landroid/widget/TextView;

.field public k:Landroid/view/View;

.field public l:Lv/VDraweeView;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VLinear;

.field public p:Lv/VImage;

.field public q:Lv/VDraweeView;

.field public r:Lv/VText;

.field public s:Lv/VText;

.field public t:Lv/VImage;

.field public u:Lv/VText;

.field public v:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public w:Ljava/lang/String;

.field public x:Ll/kcg0;

.field public y:Ljava/lang/String;

.field public z:Ljava/lang/String;


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
    iput-object p1, p0, Ll/my70;->y:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, "unaccept"

    .line 9
    .line 10
    iput-object p1, p0, Ll/my70;->z:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic J3(Ll/my70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/my70;->b4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K3(Ll/my70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/my70;->d4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;
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

.method public static synthetic M3(Ll/my70;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/my70;->a4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic O3(Ll/my70;Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/my70;->j4(Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V

    return-void
.end method

.method public static synthetic P3(Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic R3(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
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

.method public static synthetic S3(Ll/my70;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/my70;->h4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    return-void
.end method

.method public static synthetic T3(Ll/my70;Ll/hct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/my70;->e4(Ll/hct;)V

    return-void
.end method

.method public static synthetic U3(Ll/hct;)Ljava/lang/Boolean;
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

.method public static synthetic V3(Ll/my70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/my70;->c4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;
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

.method private synthetic b4(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/my70;->w:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/my70;->Y3(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic c4(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/my70;->w:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/my70;->i4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic d4(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/my70;->t:Lv/VImage;

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
    iget-object v0, p0, Ll/my70;->y:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object v0, p0, Ll/my70;->t:Lv/VImage;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Ll/my70;->z:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/my70;->t:Lv/VImage;

    .line 25
    .line 26
    sget p1, Ll/obc0;->N5:I

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object p1, p0, Ll/my70;->y:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/my70;->t:Lv/VImage;

    .line 38
    .line 39
    sget p1, Ll/obc0;->s4:I

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
    invoke-virtual {p0}, Ll/my70;->Z3()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private i4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/my70;->Z3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/my70;->x:Ll/kcg0;

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
    iget-object v0, p0, Ll/my70;->t:Lv/VImage;

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
    iget-object v1, p0, Ll/my70;->z:Ljava/lang/String;

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
    new-instance v0, Ll/jy70;

    .line 37
    .line 38
    invoke-direct {v0, p1}, Ll/jy70;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance p1, Ll/ky70;

    .line 46
    .line 47
    invoke-direct {p1}, Ll/ky70;-><init>()V

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


# virtual methods
.method public X3(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ny70;->b(Ll/my70;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final Y3(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/my70;->x:Ll/kcg0;

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
    invoke-virtual {p0}, Ll/my70;->Z3()V

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
    new-instance v0, Ll/ay70;

    .line 81
    .line 82
    invoke-direct {v0, p1}, Ll/ay70;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    new-instance p1, Ll/by70;

    .line 90
    .line 91
    invoke-direct {p1}, Ll/by70;-><init>()V

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

.method public Z3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/my70;->v:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

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
    iput-object v0, p0, Ll/my70;->w:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public final synthetic a4(Ljava/lang/Long;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/my70;->r:Lv/VText;

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
    const-wide/16 v8, 0x0

    .line 21
    .line 22
    if-lez v4, :cond_0

    .line 23
    .line 24
    move-wide v4, v8

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 27
    .line 28
    .line 29
    move-result-wide v4

    .line 30
    sub-long v4, v6, v4

    .line 31
    .line 32
    :goto_0
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v4, ""

    .line 36
    .line 37
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/my70;->r:Lv/VText;

    .line 56
    .line 57
    sget-object v1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 60
    .line 61
    .line 62
    move-result-wide v2

    .line 63
    cmp-long v2, v2, v6

    .line 64
    .line 65
    if-lez v2, :cond_1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 69
    .line 70
    .line 71
    move-result-wide v2

    .line 72
    sub-long v8, v6, v2

    .line 73
    .line 74
    :goto_1
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    const-string v3, "\u62d2\u7edd(%d)"

    .line 83
    .line 84
    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 92
    .line 93
    .line 94
    move-result-wide v0

    .line 95
    cmp-long p1, v0, v6

    .line 96
    .line 97
    if-ltz p1, :cond_2

    .line 98
    .line 99
    iget-object p1, p0, Ll/my70;->w:Ljava/lang/String;

    .line 100
    .line 101
    invoke-direct {p0, p1}, Ll/my70;->i4(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    :cond_2
    return-void
.end method

.method public final f4(Ljava/lang/String;)V
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
    new-instance v0, Ll/ly70;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/ly70;-><init>(Ll/my70;)V

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

.method public g4(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/my70;->w:Ljava/lang/String;

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
    iget-object p1, p0, Ll/my70;->x:Ll/kcg0;

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
    invoke-virtual {p0}, Ll/my70;->Z3()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final h4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
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
    invoke-virtual {p0, p1}, Ll/my70;->g4(Ljava/lang/String;)V

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
    invoke-virtual {p0, p1}, Ll/my70;->k4(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public final j4(Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 7

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
    return-void

    .line 8
    :cond_0
    iget-object v2, p0, Ll/my70;->m:Lv/VText;

    .line 9
    .line 10
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Ll/my70;->l:Lv/VDraweeView;

    .line 16
    .line 17
    sget v3, Ll/obc0;->J8:I

    .line 18
    .line 19
    invoke-virtual {v2, v3}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Ll/my70;->l:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 29
    .line 30
    sget v4, Ll/qa00;->J:I

    .line 31
    .line 32
    const-string v5, "context_single_room"

    .line 33
    .line 34
    invoke-static {v5, v2, v3, v4}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Ll/my70;->p:Lv/VImage;

    .line 38
    .line 39
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 40
    .line 41
    const-string v4, "male"

    .line 42
    .line 43
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    sget v3, Ll/obc0;->G8:I

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    sget v3, Ll/obc0;->E8:I

    .line 53
    .line 54
    :goto_0
    invoke-static {v3}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 59
    .line 60
    .line 61
    sget-object v2, Ll/htd0;->c:Ll/htd0;

    .line 62
    .line 63
    invoke-static {v2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Ll/hiv;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 70
    .line 71
    iget-wide v3, v1, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 72
    .line 73
    invoke-virtual {v2, v3, v4}, Ll/hiv;->v(J)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    const/4 v2, 0x1

    .line 78
    if-eqz v1, :cond_3

    .line 79
    .line 80
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    if-nez v3, :cond_3

    .line 87
    .line 88
    iget-object v3, p0, Ll/my70;->q:Lv/VDraweeView;

    .line 89
    .line 90
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    iget-wide v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->grade:J

    .line 94
    .line 95
    invoke-static {v3, v4}, Ll/kny;->a(J)Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-eqz v3, :cond_2

    .line 100
    .line 101
    sget v3, Ll/i0k;->b:I

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_2
    sget v3, Ll/i0k;->a:I

    .line 105
    .line 106
    :goto_1
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 107
    .line 108
    iget-object v4, p0, Ll/my70;->q:Lv/VDraweeView;

    .line 109
    .line 110
    invoke-static {v1, v4, v3}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 111
    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_3
    iget-object v1, p0, Ll/my70;->q:Lv/VDraweeView;

    .line 115
    .line 116
    const/4 v3, 0x0

    .line 117
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 118
    .line 119
    .line 120
    :goto_2
    iget-object v1, p0, Ll/my70;->u:Lv/VText;

    .line 121
    .line 122
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Z9:I

    .line 123
    .line 124
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(I)V

    .line 125
    .line 126
    .line 127
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;->live:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 128
    .line 129
    const-wide/16 v3, 0x0

    .line 130
    .line 131
    if-nez v1, :cond_4

    .line 132
    .line 133
    move-wide v5, v3

    .line 134
    goto :goto_3

    .line 135
    :cond_4
    iget-wide v5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 136
    .line 137
    :goto_3
    invoke-static {v5, v6}, Ll/yau;->c(D)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;->live:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 142
    .line 143
    if-nez p1, :cond_5

    .line 144
    .line 145
    goto :goto_4

    .line 146
    :cond_5
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->rewardPoint:D

    .line 147
    .line 148
    :goto_4
    invoke-static {v3, v4}, Ll/yau;->c(D)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iget-object v3, p0, Ll/my70;->n:Lv/VText;

    .line 153
    .line 154
    sget-object v4, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 155
    .line 156
    const-string v5, "%s\u89c2\u4f17 \u00b7 %s\u5fc3\u52a8"

    .line 157
    .line 158
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-static {v4, v5, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Ll/my70;->r:Lv/VText;

    .line 170
    .line 171
    const-string v1, "\u62d2\u7edd(10)"

    .line 172
    .line 173
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    .line 175
    .line 176
    iget-object p1, p0, Ll/my70;->r:Lv/VText;

    .line 177
    .line 178
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 179
    .line 180
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 181
    .line 182
    .line 183
    iget-object p1, p0, Ll/my70;->s:Lv/VText;

    .line 184
    .line 185
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 186
    .line 187
    .line 188
    iget-object p1, p0, Ll/my70;->x:Ll/kcg0;

    .line 189
    .line 190
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 198
    .line 199
    invoke-virtual {p1, v2, v1}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    invoke-virtual {p0, p1}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    new-instance v1, Ll/cy70;

    .line 208
    .line 209
    invoke-direct {v1, p0}, Ll/cy70;-><init>(Ll/my70;)V

    .line 210
    .line 211
    .line 212
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    iput-object p1, p0, Ll/my70;->x:Ll/kcg0;

    .line 221
    .line 222
    const-string p1, "onceMore"

    .line 223
    .line 224
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 225
    .line 226
    .line 227
    move-result p1

    .line 228
    iget-object p0, p0, Ll/my70;->j:Landroid/widget/TextView;

    .line 229
    .line 230
    if-eqz p1, :cond_6

    .line 231
    .line 232
    const-string p1, "\u9080\u8bf7\u4f60\u518d\u6765\u4e00\u5c40PK"

    .line 233
    .line 234
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 235
    .line 236
    .line 237
    return-void

    .line 238
    :cond_6
    const-string p1, "\u9080\u8bf7\u4f60\u53c2\u4e0ePK"

    .line 239
    .line 240
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 241
    .line 242
    .line 243
    return-void
.end method

.method public k4(Ljava/lang/String;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/my70;->w:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Ll/my70;->v:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

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
    invoke-virtual {p0, v1, v2}, Ll/my70;->X3(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, p0, v1}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/my70;->v:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 26
    .line 27
    iget-object v0, p0, Ll/my70;->s:Lv/VText;

    .line 28
    .line 29
    new-instance v1, Ll/fy70;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/fy70;-><init>(Ll/my70;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/my70;->r:Lv/VText;

    .line 38
    .line 39
    new-instance v1, Ll/gy70;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/gy70;-><init>(Ll/my70;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/my70;->t:Lv/VImage;

    .line 48
    .line 49
    new-instance v1, Ll/hy70;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/hy70;-><init>(Ll/my70;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v0, p0, Ll/my70;->t:Lv/VImage;

    .line 58
    .line 59
    iget-object v1, p0, Ll/my70;->y:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/my70;->t:Lv/VImage;

    .line 65
    .line 66
    sget v1, Ll/obc0;->s4:I

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/my70;->v:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 72
    .line 73
    new-instance v1, Ll/iy70;

    .line 74
    .line 75
    invoke-direct {v1}, Ll/iy70;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/my70;->v:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, p1}, Ll/my70;->f4(Ljava/lang/String;)V

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
    new-instance v1, Ll/zx70;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/zx70;-><init>(Ll/my70;)V

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
    new-instance v1, Ll/dy70;

    .line 53
    .line 54
    invoke-direct {v1}, Ll/dy70;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/ey70;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/ey70;-><init>(Ll/my70;)V

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
