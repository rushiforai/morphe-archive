.class public Ll/p380;
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
.field public A:Landroid/widget/TextView;

.field public B:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public C:Ljava/lang/String;

.field public D:Ll/kcg0;

.field public E:Ljava/lang/String;

.field public F:I

.field public G:Ll/kcg0;

.field public H:I

.field public i:Landroid/view/View;

.field public j:Landroid/widget/ImageView;

.field public k:Lv/VText;

.field public l:Landroid/widget/LinearLayout;

.field public m:Lv/VDraweeView;

.field public n:Lv/VText;

.field public o:Landroid/widget/LinearLayout;

.field public p:Lv/VDraweeView;

.field public q:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;

.field public r:Lv/VImage;

.field public s:Lv/VImage;

.field public t:Lv/VImage;

.field public u:Lv/VImage;

.field public v:Lv/VText;

.field public w:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public x:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;

.field public y:Landroid/widget/Button;

.field public z:Landroid/widget/Button;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/p380;->F:I

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput p1, p0, Ll/p380;->H:I

    .line 9
    .line 10
    return-void
.end method

.method private synthetic A4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/p380;->G4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic B4(Ll/hct;)V
    .locals 0

    .line 1
    iget-boolean p1, p1, Ll/hct;->b:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/p380;->S4()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/p380;->l4()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic C4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p380;->i4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic D4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "pk_invite_reject"

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
    invoke-direct {p0, p1}, Ll/p380;->H4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "pk_seek_timeout"

    .line 18
    .line 19
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-direct {p0}, Ll/p380;->O4()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method private F4(Lcom/p1/mobile/putong/data/User;)V
    .locals 8

    .line 1
    const-string v0, "onceMore"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 4
    .line 5
    .line 6
    move-result-object v5

    .line 7
    invoke-direct {p0}, Ll/p380;->o4()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->createInvite()Ll/v3f$d;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v1, Ll/ict;

    .line 24
    .line 25
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object v4, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 34
    .line 35
    const/4 v6, 0x1

    .line 36
    const/4 v7, 0x0

    .line 37
    invoke-direct/range {v1 .. v7}, Ll/ict;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;ZLl/y20;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    const/4 p1, 0x1

    .line 45
    invoke-static {p0, p1}, Ll/su70;->d(Ll/i6t;Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private G4()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/p380;->n4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/p380;->B:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/p380;->G:Ll/kcg0;

    .line 13
    .line 14
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput v0, p0, Ll/p380;->F:I

    .line 19
    .line 20
    return-void
.end method

.method private H4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->pkStateEvent()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v1}, Ll/jct;->a(I)Ll/jct;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/p380;->I4(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic J3(Ll/p380;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->w4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic K3(Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L3(Ll/p380;Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->z4(Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;)V

    return-void
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic N3(Ll/p380;Ll/hct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->B4(Ll/hct;)V

    return-void
.end method

.method public static synthetic O3(Ll/p380;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->x4(Ljava/lang/Long;)V

    return-void
.end method

.method private O4()V
    .locals 2

    .line 1
    new-instance v0, Ll/aa80;

    .line 2
    .line 3
    const/16 v1, 0x258

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/aa80;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/Integer;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x2

    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->pkStateEvent()Ll/v3f$d;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-static {v1}, Ll/jct;->a(I)Ll/jct;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/p380;->L4()V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public static synthetic P3(Ll/p380;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->t4(Landroid/view/View;)V

    return-void
.end method

.method private P4(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p380;->p:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "context_single_room"

    .line 12
    .line 13
    invoke-static {v2, v0, v1}, Ll/izs;->r(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/p380;->v:Lv/VText;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private Q4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string p1, "context_single_room"

    .line 2
    .line 3
    iget-object v0, p0, Ll/p380;->p:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-static {p1, v0, p3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/p380;->v:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic R3(Ll/p380;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->y4(Ljava/lang/Long;)V

    return-void
.end method

.method private R4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, p3}, Ll/p380;->Q4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic S3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "cancelInvite id:"

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

.method public static synthetic T3(Ll/p380;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->C4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic U3(Ll/p380;Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->p4(Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;)V

    return-void
.end method

.method public static synthetic V3(Ll/p380;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->D4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    return-void
.end method

.method public static synthetic W3(Ll/p380;Ll/ict;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->k4(Ll/ict;)V

    return-void
.end method

.method public static synthetic X3(Ll/p380;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->q4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Y3(Ll/p380;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->A4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic Z3(Ll/p380;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->s4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic a4(Ll/p380;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->u4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b4(Ll/hct;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Ll/hct;->a:I

    .line 2
    .line 3
    const/4 v0, 0x2

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

.method public static synthetic c4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;)Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "cancelSeek id:"

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
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;

    .line 20
    .line 21
    return-object p0
.end method

.method public static synthetic d4(Ll/p380;Ll/ict;Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/p380;->r4(Ll/ict;Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V

    return-void
.end method

.method public static synthetic e4(Ll/p380;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->F4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic f4(Ll/p380;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p380;->v4(Landroid/view/View;)V

    return-void
.end method

.method private h4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->pkStateEvent()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v1}, Ll/jct;->a(I)Ll/jct;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->W3(Ljava/lang/String;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v0, Ll/o380;

    .line 28
    .line 29
    invoke-direct {v0, p1}, Ll/o380;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    new-instance p1, Ll/s280;

    .line 37
    .line 38
    invoke-direct {p1}, Ll/s280;-><init>()V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/ga80;

    .line 42
    .line 43
    invoke-direct {v0}, Ll/ga80;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private j4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->X3(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/t280;

    .line 10
    .line 11
    invoke-direct {v1, p1}, Ll/t280;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/u280;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/u280;-><init>(Ll/p380;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/v280;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/v280;-><init>(Ll/p380;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    new-instance p1, Ll/w280;

    .line 37
    .line 38
    invoke-direct {p1}, Ll/w280;-><init>()V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/ga80;

    .line 42
    .line 43
    invoke-direct {v0}, Ll/ga80;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private k4(Ll/ict;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/ict;->c:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Ll/ict;->d:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 4
    .line 5
    iget-boolean v2, p1, Ll/ict;->e:Z

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->g4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;Z)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/x280;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/x280;-><init>(Ll/p380;Ll/ict;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/ga80;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/ga80;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private n4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p380;->B:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private o4()Z
    .locals 2

    .line 1
    iget v0, p0, Ll/p380;->F:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/p380;->E:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method private synthetic p4(Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->pkStateEvent()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-static {p1}, Ll/jct;->a(I)Ll/jct;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private synthetic q4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->pkStateEvent()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-static {p1}, Ll/jct;->a(I)Ll/jct;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private synthetic r4(Ll/ict;Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->pkStateEvent()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x2

    .line 12
    invoke-static {v1}, Ll/jct;->a(I)Ll/jct;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p1, Ll/ict;->c:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v1, p1, Ll/ict;->b:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v2, p1, Ll/ict;->a:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/p380;->J4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p1, Ll/ict;->f:Ll/y20;

    .line 31
    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method private synthetic s4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p380;->l4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic t4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p380;->i4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic u4(Landroid/view/View;)V
    .locals 0

    .line 1
    iget p1, p0, Ll/p380;->H:I

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p380;->N4(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic v4(Landroid/view/View;)V
    .locals 1

    .line 1
    iget p1, p0, Ll/p380;->F:I

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    new-instance p1, Ll/qc80;

    .line 7
    .line 8
    const/16 v0, 0x258

    .line 9
    .line 10
    invoke-direct {p1, v0}, Ll/qc80;-><init>(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    invoke-static {p0, p1}, Ll/su70;->e(Ll/i6t;Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/p380;->i4()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private synthetic w4(Ljava/lang/Long;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->R1:I

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
    const-wide/16 v6, 0xf

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
    invoke-virtual {p0}, Ll/p380;->i4()V

    .line 63
    .line 64
    .line 65
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ce:I

    .line 66
    .line 67
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-void
.end method

.method private synthetic x4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/p380;->O4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic y4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p380;->l4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic z4(Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/Throwable;

    .line 4
    .line 5
    const-string p1, "seek is Null"

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Ll/ab80;->a(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->pkStateEvent()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x2

    .line 25
    invoke-static {v1}, Ll/jct;->a(I)Ll/jct;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/p380;->K4(Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public E4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/Throwable;

    .line 4
    .line 5
    const-string p1, "pk create pkinfo is null"

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Ll/ab80;->a(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUser()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    new-instance p0, Ljava/lang/Throwable;

    .line 21
    .line 22
    const-string p1, "user is null"

    .line 23
    .line 24
    invoke-direct {p0, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p0}, Ll/ab80;->a(Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->categoryV2:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 34
    .line 35
    const-string v1, "specified"

    .line 36
    .line 37
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/4 v1, 0x3

    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/p380;->m4()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 49
    .line 50
    .line 51
    invoke-direct {p0, v0}, Ll/p380;->P4(Lcom/p1/mobile/putong/data/User;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v1}, Ll/p380;->M4(I)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/p380;->G:Ll/kcg0;

    .line 58
    .line 59
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    invoke-virtual {p0}, Ll/p380;->m4()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_3

    .line 72
    .line 73
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ia:I

    .line 74
    .line 75
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    invoke-direct {p0, v0}, Ll/p380;->P4(Lcom/p1/mobile/putong/data/User;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v1}, Ll/p380;->M4(I)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public I4(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/p380;->F:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-direct {p0}, Ll/p380;->n4()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/p380;->E:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/p380;->z:Landroid/widget/Button;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 27
    .line 28
    sget v1, Ll/fct;->g:I

    .line 29
    .line 30
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 34
    .line 35
    const-string v1, "#bfbfbf"

    .line 36
    .line 37
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 45
    .line 46
    sget v1, Ll/obc0;->l0:I

    .line 47
    .line 48
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/p380;->G:Ll/kcg0;

    .line 57
    .line 58
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/p380;->x:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->d()V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/p380;->x:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;

    .line 67
    .line 68
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    const/4 p1, 0x0

    .line 72
    iput-object p1, p0, Ll/p380;->E:Ljava/lang/String;

    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method public J4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p4, p0, Ll/p380;->E:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p4, p0, Ll/p380;->G:Ll/kcg0;

    .line 4
    .line 5
    invoke-static {p4}, Ll/psd0;->z(Ll/kcg0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object p4

    .line 12
    const/4 v0, 0x1

    .line 13
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 14
    .line 15
    invoke-virtual {p4, v0, v1}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    invoke-virtual {p0, p4}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    invoke-virtual {p4}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p4, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p4

    .line 35
    new-instance v0, Ll/g380;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/g380;-><init>(Ll/p380;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p4, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    move-result-object p4

    .line 48
    iput-object p4, p0, Ll/p380;->G:Ll/kcg0;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/p380;->m4()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 51
    .line 52
    .line 53
    move-result-object p4

    .line 54
    if-eqz p4, :cond_0

    .line 55
    .line 56
    const/4 p4, 0x4

    .line 57
    invoke-virtual {p0, p4}, Ll/p380;->M4(I)V

    .line 58
    .line 59
    .line 60
    invoke-direct {p0, p1, p2, p3}, Ll/p380;->R4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    invoke-virtual {p0}, Ll/p380;->S4()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public K4(Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;->id:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p1, p0, Ll/p380;->C:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p0, Ll/p380;->D:Ll/kcg0;

    .line 6
    .line 7
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/4 v0, 0x5

    .line 15
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    .line 16
    .line 17
    invoke-virtual {p1, v0, v1}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v1, Ll/f380;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/f380;-><init>(Ll/p380;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Ll/p380;->D:Ll/kcg0;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/p380;->m4()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/p380;->M4(I)V

    .line 52
    .line 53
    .line 54
    :cond_0
    invoke-virtual {p0}, Ll/p380;->S4()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public L4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/p380;->m4()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/p380;->m4()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ha:I

    .line 19
    .line 20
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 21
    .line 22
    .line 23
    :cond_1
    const/4 v0, 0x2

    .line 24
    invoke-virtual {p0, v0}, Ll/p380;->M4(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public M4(I)V
    .locals 6

    .line 1
    invoke-static {p1}, Ll/n180;->l(I)V

    .line 2
    .line 3
    .line 4
    const-string v0, "#212121"

    .line 5
    .line 6
    const-string v1, "#f57c00"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x1

    .line 10
    if-eq p1, v3, :cond_5

    .line 11
    .line 12
    const/4 v4, 0x2

    .line 13
    if-eq p1, v4, :cond_3

    .line 14
    .line 15
    const/4 v4, 0x3

    .line 16
    if-eq p1, v4, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x4

    .line 19
    if-eq p1, v1, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iput p1, p0, Ll/p380;->F:I

    .line 23
    .line 24
    iget-object p1, p0, Ll/p380;->k:Lv/VText;

    .line 25
    .line 26
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->O4:I

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/p380;->k:Lv/VText;

    .line 32
    .line 33
    const-string v1, "#923bff"

    .line 34
    .line 35
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/p380;->q:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;

    .line 43
    .line 44
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/p380;->w:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 48
    .line 49
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/p380;->p:Lv/VDraweeView;

    .line 53
    .line 54
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/p380;->x:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;

    .line 58
    .line 59
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/p380;->x:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->j()V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/p380;->z:Landroid/widget/Button;

    .line 68
    .line 69
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 73
    .line 74
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 78
    .line 79
    invoke-virtual {p1, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Ll/p380;->A:Landroid/widget/TextView;

    .line 83
    .line 84
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 88
    .line 89
    sget v1, Ll/obc0;->D7:I

    .line 90
    .line 91
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 95
    .line 96
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 97
    .line 98
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->R1:I

    .line 99
    .line 100
    const-string v3, "15"

    .line 101
    .line 102
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 114
    .line 115
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_1
    iget-object v0, p0, Ll/p380;->k:Lv/VText;

    .line 124
    .line 125
    iget v5, p0, Ll/p380;->F:I

    .line 126
    .line 127
    if-ne v5, v3, :cond_2

    .line 128
    .line 129
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->Sa:I

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_2
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ca:I

    .line 133
    .line 134
    :goto_0
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(I)V

    .line 135
    .line 136
    .line 137
    iput p1, p0, Ll/p380;->F:I

    .line 138
    .line 139
    iget-object p1, p0, Ll/p380;->k:Lv/VText;

    .line 140
    .line 141
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Ll/p380;->q:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;

    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->h()V

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Ll/p380;->w:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 154
    .line 155
    const-string v0, "https://auto.tancdn.com/v1/raw/dea9b7f8-1bdc-4260-8a16-3e18c3ca767910.so"

    .line 156
    .line 157
    invoke-virtual {p1, v0, v3}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Ll/p380;->w:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 161
    .line 162
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Ll/p380;->x:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;

    .line 166
    .line 167
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->d()V

    .line 168
    .line 169
    .line 170
    iget-object p1, p0, Ll/p380;->p:Lv/VDraweeView;

    .line 171
    .line 172
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 173
    .line 174
    .line 175
    iget-object p1, p0, Ll/p380;->z:Landroid/widget/Button;

    .line 176
    .line 177
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 178
    .line 179
    .line 180
    iget-object p1, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 181
    .line 182
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Ll/p380;->A:Landroid/widget/TextView;

    .line 186
    .line 187
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 195
    .line 196
    invoke-virtual {p1, v4, v0}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-virtual {p0, p1}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-virtual {p1, v3}, Lrx/c;->take(I)Lrx/c;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    new-instance v0, Ll/d380;

    .line 221
    .line 222
    invoke-direct {v0, p0}, Ll/d380;-><init>(Ll/p380;)V

    .line 223
    .line 224
    .line 225
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 230
    .line 231
    .line 232
    return-void

    .line 233
    :cond_3
    iget-object v0, p0, Ll/p380;->k:Lv/VText;

    .line 234
    .line 235
    iget v4, p0, Ll/p380;->F:I

    .line 236
    .line 237
    if-ne v4, v3, :cond_4

    .line 238
    .line 239
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->Sa:I

    .line 240
    .line 241
    goto :goto_1

    .line 242
    :cond_4
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ca:I

    .line 243
    .line 244
    :goto_1
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(I)V

    .line 245
    .line 246
    .line 247
    iput p1, p0, Ll/p380;->F:I

    .line 248
    .line 249
    iget-object p1, p0, Ll/p380;->k:Lv/VText;

    .line 250
    .line 251
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 252
    .line 253
    .line 254
    move-result v0

    .line 255
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 256
    .line 257
    .line 258
    iget-object p1, p0, Ll/p380;->q:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;

    .line 259
    .line 260
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->g()V

    .line 261
    .line 262
    .line 263
    iget-object p1, p0, Ll/p380;->p:Lv/VDraweeView;

    .line 264
    .line 265
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 266
    .line 267
    .line 268
    iget-object p1, p0, Ll/p380;->v:Lv/VText;

    .line 269
    .line 270
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ca:I

    .line 271
    .line 272
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 273
    .line 274
    .line 275
    iget-object p1, p0, Ll/p380;->w:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 276
    .line 277
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 278
    .line 279
    .line 280
    iget-object p1, p0, Ll/p380;->x:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;

    .line 281
    .line 282
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->k()V

    .line 283
    .line 284
    .line 285
    iget-object p1, p0, Ll/p380;->z:Landroid/widget/Button;

    .line 286
    .line 287
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 288
    .line 289
    .line 290
    iget-object p1, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 291
    .line 292
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 293
    .line 294
    .line 295
    iget-object p0, p0, Ll/p380;->A:Landroid/widget/TextView;

    .line 296
    .line 297
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 298
    .line 299
    .line 300
    return-void

    .line 301
    :cond_5
    iput p1, p0, Ll/p380;->F:I

    .line 302
    .line 303
    iget-object p1, p0, Ll/p380;->k:Lv/VText;

    .line 304
    .line 305
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->Sa:I

    .line 306
    .line 307
    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setText(I)V

    .line 308
    .line 309
    .line 310
    iget-object p1, p0, Ll/p380;->k:Lv/VText;

    .line 311
    .line 312
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 313
    .line 314
    .line 315
    move-result v1

    .line 316
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 317
    .line 318
    .line 319
    iget-object p1, p0, Ll/p380;->q:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;

    .line 320
    .line 321
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->i()V

    .line 322
    .line 323
    .line 324
    iget-object p1, p0, Ll/p380;->v:Lv/VText;

    .line 325
    .line 326
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->n7:I

    .line 327
    .line 328
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 329
    .line 330
    .line 331
    iget-object p1, p0, Ll/p380;->w:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 332
    .line 333
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 334
    .line 335
    .line 336
    iget-object p1, p0, Ll/p380;->p:Lv/VDraweeView;

    .line 337
    .line 338
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 339
    .line 340
    .line 341
    iget-object p1, p0, Ll/p380;->x:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;

    .line 342
    .line 343
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchLoadView;->j()V

    .line 344
    .line 345
    .line 346
    iget-object p1, p0, Ll/p380;->z:Landroid/widget/Button;

    .line 347
    .line 348
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 349
    .line 350
    .line 351
    iget-object p1, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 352
    .line 353
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 354
    .line 355
    .line 356
    iget-object p1, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 357
    .line 358
    invoke-virtual {p1, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 359
    .line 360
    .line 361
    iget-object p1, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 362
    .line 363
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->S1:I

    .line 364
    .line 365
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 366
    .line 367
    .line 368
    iget-object p1, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 369
    .line 370
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 371
    .line 372
    .line 373
    move-result v0

    .line 374
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 375
    .line 376
    .line 377
    iget-object p1, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 378
    .line 379
    sget v0, Ll/obc0;->D7:I

    .line 380
    .line 381
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 382
    .line 383
    .line 384
    iget-object p0, p0, Ll/p380;->A:Landroid/widget/TextView;

    .line 385
    .line 386
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 387
    .line 388
    .line 389
    return-void
.end method

.method public N4(I)V
    .locals 2

    .line 1
    iput p1, p0, Ll/p380;->H:I

    .line 2
    .line 3
    const-string v0, "e_pk_start_randompk"

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->h4(I)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Ll/e380;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/e380;-><init>(Ll/p380;)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/ga80;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/ga80;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public S4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p380;->B:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/p380;->C:Ljava/lang/String;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget v0, p0, Ll/p380;->F:I

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    if-ne v0, v1, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/p380;->q:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkMatchProfileView;->i()V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object p0, p0, Ll/p380;->B:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public g4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/q380;->b(Ll/p380;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/p380;->l4()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/p380;->F:I

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/p380;->D:Ll/kcg0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/p380;->C:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-direct {p0, v0}, Ll/p380;->j4(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iput-object v2, p0, Ll/p380;->C:Ljava/lang/String;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v1, 0x4

    .line 26
    if-ne v0, v1, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Ll/p380;->G:Ll/kcg0;

    .line 29
    .line 30
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/p380;->E:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-direct {p0, v0}, Ll/p380;->h4(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, Ll/p380;->E:Ljava/lang/String;

    .line 41
    .line 42
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 43
    iput v0, p0, Ll/p380;->F:I

    .line 44
    .line 45
    return-void
.end method

.method public l4()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/p380;->n4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/p380;->B:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public m4()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/p380;->B:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/c0s;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p0, v1, v2}, Ll/p380;->g4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {v0, p0, v1}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/p380;->B:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 24
    .line 25
    iget-object v0, p0, Ll/p380;->m:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "context_single_room"

    .line 44
    .line 45
    invoke-static {v2, v0, v1}, Ll/izs;->r(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/p380;->n:Lv/VText;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/p380;->i:Landroid/view/View;

    .line 64
    .line 65
    new-instance v1, Ll/y280;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/y280;-><init>(Ll/p380;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/p380;->y:Landroid/widget/Button;

    .line 74
    .line 75
    new-instance v1, Ll/z280;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/z280;-><init>(Ll/p380;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/p380;->z:Landroid/widget/Button;

    .line 84
    .line 85
    new-instance v1, Ll/a380;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/a380;-><init>(Ll/p380;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/p380;->j:Landroid/widget/ImageView;

    .line 94
    .line 95
    new-instance v1, Ll/b380;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/b380;-><init>(Ll/p380;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Ll/p380;->A:Landroid/widget/TextView;

    .line 104
    .line 105
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 106
    .line 107
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ua:I

    .line 108
    .line 109
    const-string v3, " <font color=\'#f36c4e\'>5</font> "

    .line 110
    .line 111
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    :cond_0
    iget-object p0, p0, Ll/p380;->B:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 127
    .line 128
    return-object p0
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->createInvite()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/r280;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/r280;-><init>(Ll/p380;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->pkPrepare()Ll/v3f$d;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/c380;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/c380;-><init>(Ll/p380;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->pkOnceMoreSuccess()Ll/v3f$c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lrx/c;

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/h380;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/h380;-><init>(Ll/p380;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->showPkDialog()Ll/v3f$d;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    check-cast v0, Lrx/c;

    .line 115
    .line 116
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    new-instance v1, Ll/i380;

    .line 121
    .line 122
    invoke-direct {v1}, Ll/i380;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    new-instance v1, Ll/j380;

    .line 130
    .line 131
    invoke-direct {v1, p0}, Ll/j380;-><init>(Ll/p380;)V

    .line 132
    .line 133
    .line 134
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 146
    .line 147
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->startRandomSeek()Ll/v3f$d;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    check-cast v0, Lrx/c;

    .line 156
    .line 157
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    new-instance v1, Ll/k380;

    .line 162
    .line 163
    invoke-direct {v1, p0}, Ll/k380;-><init>(Ll/p380;)V

    .line 164
    .line 165
    .line 166
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 178
    .line 179
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->cancelMatch()Ll/v3f$c;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    check-cast v0, Lrx/c;

    .line 188
    .line 189
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    new-instance v1, Ll/l380;

    .line 194
    .line 195
    invoke-direct {v1, p0}, Ll/l380;-><init>(Ll/p380;)V

    .line 196
    .line 197
    .line 198
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 210
    .line 211
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->clickOnceMore()Ll/v3f$d;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    check-cast v0, Lrx/c;

    .line 220
    .line 221
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    new-instance v1, Ll/m380;

    .line 226
    .line 227
    invoke-direct {v1, p0}, Ll/m380;-><init>(Ll/p380;)V

    .line 228
    .line 229
    .line 230
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 235
    .line 236
    .line 237
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-virtual {v0}, Ll/aj1;->U()Lrx/c;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    new-instance v1, Ll/n380;

    .line 254
    .line 255
    invoke-direct {v1, p0}, Ll/n380;-><init>(Ll/p380;)V

    .line 256
    .line 257
    .line 258
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 263
    .line 264
    .line 265
    return-void
.end method
