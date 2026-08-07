.class public Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# static fields
.field public static final l:Ljava/text/SimpleDateFormat;

.field public static final m:Ljava/text/SimpleDateFormat;


# instance fields
.field public d:Lv/VLinear;

.field public e:Lv/VDraweeView;

.field public f:Landroid/view/View;

.field public g:Lv/VText;

.field public h:Lv/VLinear;

.field public i:Lv/VText;

.field public j:Landroid/view/View;

.field public k:Lv/VText;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    const-string v1, "yyyy-MM-dd"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;->l:Ljava/text/SimpleDateFormat;

    .line 9
    .line 10
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 11
    .line 12
    const-string v1, "HH:mm"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;->m:Ljava/text/SimpleDateFormat;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/wou;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wou;->Y2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qou;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0(J)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 7
    .line 8
    .line 9
    move-result-wide p1

    .line 10
    invoke-static {p1, p2}, Landroid/text/format/DateUtils;->isToday(J)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;->m:Ljava/text/SimpleDateFormat;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 24
    .line 25
    .line 26
    move-result-wide p1

    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;->k0(J)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    const-string p0, "\u6628\u5929"

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;->l:Ljava/text/SimpleDateFormat;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public k0(J)Z
    .locals 2

    .line 1
    const-wide/32 v0, 0x5265c00

    .line 2
    .line 3
    .line 4
    add-long/2addr p1, v0

    .line 5
    invoke-static {p1, p2}, Landroid/text/format/DateUtils;->isToday(J)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public l0(Ll/wou;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;->f:Landroid/view/View;

    .line 2
    .line 3
    iget-boolean v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;->isOnline:Z

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;->i:Lv/VText;

    .line 9
    .line 10
    iget-boolean v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;->isNew:Z

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;->j:Landroid/view/View;

    .line 16
    .line 17
    iget-boolean v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;->isNew:Z

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;->g:Lv/VText;

    .line 23
    .line 24
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;->userName:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;->d:Lv/VLinear;

    .line 30
    .line 31
    iget-boolean v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;->canCallUser:Z

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;->e:Lv/VDraweeView;

    .line 37
    .line 38
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;->avatar:Ljava/lang/String;

    .line 39
    .line 40
    sget v2, Ll/qa00;->x:I

    .line 41
    .line 42
    const-string v3, "context_single_room"

    .line 43
    .line 44
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;->d:Lv/VLinear;

    .line 48
    .line 49
    new-instance v1, Ll/pou;

    .line 50
    .line 51
    invoke-direct {v1, p1, p2}, Ll/pou;-><init>(Ll/wou;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;->k:Lv/VText;

    .line 58
    .line 59
    iget-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;->calledTime:J

    .line 60
    .line 61
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;->j0(J)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMissedCallItem;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
