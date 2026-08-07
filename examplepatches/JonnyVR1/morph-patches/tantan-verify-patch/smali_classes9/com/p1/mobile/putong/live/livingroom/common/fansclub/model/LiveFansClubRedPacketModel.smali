.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

.field public b:Ll/ner;

.field public c:Landroid/view/View$OnClickListener;

.field public d:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->b:Ll/ner;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final H()Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->d:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hit:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;->GET:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hasGrabbed:Z

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;->NOT_GET:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isValid:Z

    .line 23
    .line 24
    if-nez v0, :cond_3

    .line 25
    .line 26
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;->EXPIRE:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_3
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isEnough:Z

    .line 30
    .line 31
    if-nez p0, :cond_4

    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;->NOT_ENOUGH:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;->AVAILABLE:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;

    .line 37
    .line 38
    return-object p0
.end method

.method public I(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$a;->a:[I

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->H()Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    aget v0, v0, v1

    .line 15
    .line 16
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 17
    .line 18
    const-wide/16 v2, 0x1

    .line 19
    .line 20
    packed-switch v0, :pswitch_data_0

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :pswitch_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->y0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :pswitch_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->u0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :pswitch_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->r0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :pswitch_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->v0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :pswitch_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->b:Ll/ner;

    .line 49
    .line 50
    invoke-static {v2, v3, v1}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-interface {v0, v1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 71
    .line 72
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->w0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Lrx/c;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :pswitch_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->b:Ll/ner;

    .line 77
    .line 78
    invoke-static {v2, v3, v1}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-interface {v0, v1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->c:Landroid/view/View$OnClickListener;

    .line 101
    .line 102
    invoke-virtual {p1, v1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->s0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Lrx/c;Landroid/view/View$OnClickListener;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    nop

    .line 107
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public J(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->c:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->d:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel$RedPacketState;

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->S0:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/model/LiveFansClubRedPacketModel;->I(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
