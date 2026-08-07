.class public Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VImage;

.field public i:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;->d(ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cuc0;->a(Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic d(ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;->a:Lv/VDraweeView;

    .line 6
    .line 7
    const-string p2, "https://auto.tancdn.com/v1/images/eyJpZCI6IlVLWVo3Q0lEWk9LVFVHVVJHNktEM1pIVzNEVFJVRiIsInciOjcyMCwiaCI6NzIwLCJkIjowLCJtdCI6ImltYWdlL2pwZWcifQ.png"

    .line 8
    .line 9
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;->a:Lv/VDraweeView;

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;->a:Lv/VDraweeView;

    .line 38
    .line 39
    sget p2, Ll/ibc0;->I0:I

    .line 40
    .line 41
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/core/data/ReceiveRecords;ZLcom/p1/mobile/putong/core/data/RedPacket;Ll/qsc0;J)V
    .locals 7

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;->a:Lv/VDraweeView;

    .line 4
    .line 5
    sget v2, Ll/ibc0;->I0:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->userId:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ll/dkb;->Ma(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p4, v0, v1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p4

    .line 28
    new-instance v0, Ll/buc0;

    .line 29
    .line 30
    invoke-direct {v0, p0, p2}, Ll/buc0;-><init>(Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;Z)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p4, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;->c:Lv/VText;

    .line 41
    .line 42
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->name:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;->f:Lv/VText;

    .line 48
    .line 49
    new-instance p4, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->amount:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v0, " \u5143"

    .line 60
    .line 61
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p4

    .line 68
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;->d:Lv/VText;

    .line 72
    .line 73
    new-instance p4, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->createTime:J

    .line 79
    .line 80
    const/4 v2, 0x1

    .line 81
    iget-wide v3, p3, Lcom/p1/mobile/putong/core/data/RedPacket;->createTime:J

    .line 82
    .line 83
    move-wide v5, p5

    .line 84
    invoke-static/range {v0 .. v6}, Ll/duc0;->a(JZJJ)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p5

    .line 88
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string p5, "\u524d"

    .line 92
    .line 93
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p4

    .line 100
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    iget-object p2, p3, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 104
    .line 105
    const-string p3, "random"

    .line 106
    .line 107
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-eqz p2, :cond_0

    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;->g:Landroid/widget/LinearLayout;

    .line 114
    .line 115
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->highest:Z

    .line 116
    .line 117
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 118
    .line 119
    .line 120
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketUserItemView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
