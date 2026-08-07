.class public Ll/llp0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/clp0;",
        ">;"
    }
.end annotation


# static fields
.field public static w:Ljava/lang/String; = "https://fe-static.tancdn.com/v1/images/eyJpZCI6IjgyQzY5OEUzQUUyQTQ0OTE5QjZFOTMwNjRBRjc3QUE3IiwidyI6MTEyNSwiaCI6ODIyLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6OTgwNDA3MTQ3MTE2MDQzMDM1OSwicHQiOjIwMjUxMDE1MTl9.webp"


# instance fields
.field public k:Lv/VDraweeView;

.field public l:Lv/VRecyclerView;

.field public m:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public n:Landroid/view/View;

.field public o:Lv/VDraweeView;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VText;

.field public s:Lv/VText;

.field public t:Landroid/widget/TextView;

.field public u:Landroid/widget/TextView;

.field public v:Ll/l4g0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/clp0;)V
    .locals 3

    .line 1
    sget v0, Ll/yec0;->ob:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-static {v2}, Ll/qag0;->e(Z)Ll/rq2;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-direct {p0, v0, v1, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic F(Ll/llp0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/llp0;->U(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/llp0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/llp0;->Q(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic H(Ll/llp0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/llp0;->T(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/llp0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/llp0;->S(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V

    return-void
.end method

.method public static synthetic J(Ll/llp0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/llp0;->W(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/llp0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/llp0;->R(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic L(Ll/llp0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/llp0;->V(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic M(Ll/llp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/llp0;->P(Landroid/view/View;)V

    return-void
.end method

.method private N(Landroid/view/View;)V
    .locals 3

    .line 1
    sget v0, Ll/mdc0;->I:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VDraweeView;

    .line 8
    .line 9
    iput-object v0, p0, Ll/llp0;->k:Lv/VDraweeView;

    .line 10
    .line 11
    sget v0, Ll/mdc0;->t3:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VRecyclerView;

    .line 18
    .line 19
    iput-object v0, p0, Ll/llp0;->l:Lv/VRecyclerView;

    .line 20
    .line 21
    sget v0, Ll/mdc0;->A:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/llp0;->n:Landroid/view/View;

    .line 28
    .line 29
    sget v0, Ll/mdc0;->j:I

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lv/VDraweeView;

    .line 36
    .line 37
    iput-object v0, p0, Ll/llp0;->o:Lv/VDraweeView;

    .line 38
    .line 39
    sget v0, Ll/mdc0;->m:I

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lv/VText;

    .line 46
    .line 47
    iput-object v0, p0, Ll/llp0;->r:Lv/VText;

    .line 48
    .line 49
    sget v0, Ll/mdc0;->k:I

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lv/VText;

    .line 56
    .line 57
    iput-object v0, p0, Ll/llp0;->p:Lv/VText;

    .line 58
    .line 59
    sget v0, Ll/mdc0;->l:I

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lv/VText;

    .line 66
    .line 67
    iput-object v0, p0, Ll/llp0;->q:Lv/VText;

    .line 68
    .line 69
    sget v0, Ll/mdc0;->y4:I

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Lv/VText;

    .line 76
    .line 77
    iput-object v0, p0, Ll/llp0;->s:Lv/VText;

    .line 78
    .line 79
    sget v0, Ll/mdc0;->N6:I

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Landroid/widget/TextView;

    .line 86
    .line 87
    iput-object v0, p0, Ll/llp0;->t:Landroid/widget/TextView;

    .line 88
    .line 89
    sget v0, Ll/mdc0;->f1:I

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Landroid/widget/TextView;

    .line 96
    .line 97
    iput-object p1, p0, Ll/llp0;->u:Landroid/widget/TextView;

    .line 98
    .line 99
    sget v0, Ll/obc0;->K1:I

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    if-eqz p1, :cond_0

    .line 110
    .line 111
    const/high16 v0, 0x41500000    # 13.0f

    .line 112
    .line 113
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    const/4 v2, 0x0

    .line 122
    invoke-virtual {p1, v2, v2, v1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/llp0;->u:Landroid/widget/TextView;

    .line 126
    .line 127
    const/4 v1, 0x0

    .line 128
    invoke-virtual {v0, p1, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 129
    .line 130
    .line 131
    iget-object p0, p0, Ll/llp0;->u:Landroid/widget/TextView;

    .line 132
    .line 133
    const/high16 p1, 0x40000000    # 2.0f

    .line 134
    .line 135
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 140
    .line 141
    .line 142
    :cond_0
    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic R(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/llp0;->v:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic U(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-direct {p0, p1, p2}, Ll/llp0;->a0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private X(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V
    .locals 6

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    move-object v0, p1

    .line 4
    check-cast v0, Ll/clp0;

    .line 5
    .line 6
    move-object v1, p1

    .line 7
    check-cast v1, Ll/clp0;

    .line 8
    .line 9
    iget-object v1, v1, Ll/clp0;->j:Ljava/lang/String;

    .line 10
    .line 11
    move-object v2, p1

    .line 12
    check-cast v2, Ll/clp0;

    .line 13
    .line 14
    iget-object v2, v2, Ll/clp0;->k:Ljava/lang/String;

    .line 15
    .line 16
    check-cast p1, Ll/clp0;

    .line 17
    .line 18
    iget-wide v3, p1, Ll/clp0;->l:J

    .line 19
    .line 20
    new-instance v5, Ll/jlp0;

    .line 21
    .line 22
    invoke-direct {v5, p0}, Ll/jlp0;-><init>(Ll/llp0;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual/range {v0 .. v5}, Ll/clp0;->e4(Ljava/lang/String;Ljava/lang/String;JLl/y20;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private a0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;I)V
    .locals 7

    .line 1
    new-instance v0, Ll/hne0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hne0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->gift:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->id:Ljava/lang/String;

    .line 9
    .line 10
    new-instance v2, Ll/llp0$a;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Ll/llp0$a;-><init>(Ll/llp0;)V

    .line 13
    .line 14
    .line 15
    const-string p1, "common"

    .line 16
    .line 17
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v3, "giftcollection"

    .line 22
    .line 23
    invoke-static {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    const-string v4, "giftWall"

    .line 32
    .line 33
    const-string v5, "giftWall"

    .line 34
    .line 35
    move v3, p2

    .line 36
    invoke-virtual/range {v0 .. v6}, Ll/hne0$a;->u(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/hne0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 41
    .line 42
    move-object p2, p0

    .line 43
    check-cast p2, Ll/clp0;

    .line 44
    .line 45
    iget-object p2, p2, Ll/clp0;->j:Ljava/lang/String;

    .line 46
    .line 47
    iput-object p2, p1, Ll/hne0$a;->u:Ljava/lang/String;

    .line 48
    .line 49
    const-string p2, "voice_gift_wall"

    .line 50
    .line 51
    iput-object p2, p1, Ll/hne0$a;->a:Ljava/lang/String;

    .line 52
    .line 53
    check-cast p0, Ll/clp0;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p1}, Ll/hne0$a;->t()Ll/hne0;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method private r()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/llp0;->k:Lv/VDraweeView;

    .line 2
    .line 3
    const/high16 v1, 0x41c00000    # 24.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    neg-int v4, v2

    .line 10
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v5

    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-static/range {v0 .. v5}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/llp0;->k:Lv/VDraweeView;

    .line 21
    .line 22
    sget-object v1, Ll/llp0;->w:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/llp0;->n:Landroid/view/View;

    .line 28
    .line 29
    new-instance v1, Ll/dlp0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/dlp0;-><init>(Ll/llp0;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/llp0;->l:Lv/VRecyclerView;

    .line 38
    .line 39
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 40
    .line 41
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    const/4 v3, 0x1

    .line 46
    const/4 v4, 0x0

    .line 47
    invoke-direct {v1, v2, v3, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 54
    .line 55
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Ll/llp0;->m:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 59
    .line 60
    iget-object v1, p0, Ll/llp0;->l:Lv/VRecyclerView;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->c:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 66
    .line 67
    new-instance v1, Ll/elp0;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/elp0;-><init>(Ll/llp0;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->c:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 76
    .line 77
    new-instance v1, Ll/flp0;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/flp0;-><init>(Ll/llp0;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method


# virtual methods
.method public final O(I)Ljava/lang/String;
    .locals 0

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "-"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const/16 p0, 0x63

    .line 7
    .line 8
    if-le p1, p0, :cond_1

    .line 9
    .line 10
    const-string p0, "99+"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic Q(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    new-instance p1, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v0, "intl_gift_collcetion_weekly_star_gift"

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 9
    .line 10
    check-cast v1, Ll/clp0;

    .line 11
    .line 12
    iget-object v1, v1, Ll/clp0;->k:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    :catch_0
    const-class v0, Ll/llp0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "p_intl_gift_collcetion_weekly_star_gift"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ll/llp0;->v:Ll/l4g0;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/llp0;->v:Ll/l4g0;

    .line 35
    .line 36
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/llp0;->Z(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/llp0;->b0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/llp0;->X(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast v0, Ll/clp0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->dismiss()Ll/v3f$c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 19
    .line 20
    move-object v0, p0

    .line 21
    check-cast v0, Ll/clp0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/rwn0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic W(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    iget p2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->grabRankGiftNum:I

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Ll/llp0;->a0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final Y(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->myLeaderboard:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;

    .line 2
    .line 3
    iget-object v1, p0, Ll/llp0;->o:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->avatar:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v2}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/llp0;->p:Lv/VText;

    .line 13
    .line 14
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 15
    .line 16
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->name:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/llp0;->u:Landroid/widget/TextView;

    .line 22
    .line 23
    new-instance v2, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    iget-object v3, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->gift:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;

    .line 29
    .line 30
    iget v3, v3, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->price:I

    .line 31
    .line 32
    iget v4, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->grabRankGiftNum:I

    .line 33
    .line 34
    mul-int/2addr v3, v4

    .line 35
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v3, ""

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->myLeaderboard:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;

    .line 51
    .line 52
    iget v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->rank:I

    .line 53
    .line 54
    iget-object v2, p0, Ll/llp0;->r:Lv/VText;

    .line 55
    .line 56
    if-gtz v1, :cond_0

    .line 57
    .line 58
    const-string v0, "-"

    .line 59
    .line 60
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    iget v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->rank:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ll/llp0;->O(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    :goto_0
    iget v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->grabRankGiftNum:I

    .line 74
    .line 75
    iget-object v1, p0, Ll/llp0;->s:Lv/VText;

    .line 76
    .line 77
    const/16 v2, 0xa

    .line 78
    .line 79
    if-gtz v0, :cond_1

    .line 80
    .line 81
    const/4 v0, 0x0

    .line 82
    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/llp0;->s:Lv/VText;

    .line 86
    .line 87
    const-string v1, "#33FFFFFF"

    .line 88
    .line 89
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/llp0;->s:Lv/VText;

    .line 97
    .line 98
    const-string v1, "#1AFFFFFF"

    .line 99
    .line 100
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    invoke-static {v1, v2}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Ll/llp0;->q:Lv/VText;

    .line 112
    .line 113
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N2:I

    .line 114
    .line 115
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 116
    .line 117
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->name:Ljava/lang/String;

    .line 118
    .line 119
    invoke-static {v0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_1
    const-string v0, "#FE7E1D"

    .line 128
    .line 129
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    invoke-static {v4, v2}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 138
    .line 139
    .line 140
    iget-object v1, p0, Ll/llp0;->s:Lv/VText;

    .line 141
    .line 142
    const/4 v2, -0x1

    .line 143
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 144
    .line 145
    .line 146
    iget-object v1, p0, Ll/llp0;->s:Lv/VText;

    .line 147
    .line 148
    new-instance v2, Ll/ilp0;

    .line 149
    .line 150
    invoke-direct {v2, p0, p1}, Ll/ilp0;-><init>(Ll/llp0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V

    .line 151
    .line 152
    .line 153
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    iget-object v1, p0, Ll/llp0;->q:Lv/VText;

    .line 157
    .line 158
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->B9:I

    .line 159
    .line 160
    iget v4, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->grabRankGiftNum:I

    .line 161
    .line 162
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    invoke-static {v2, v4}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 171
    .line 172
    .line 173
    iget-object v1, p0, Ll/llp0;->q:Lv/VText;

    .line 174
    .line 175
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    iget-object p0, p0, Ll/llp0;->q:Lv/VText;

    .line 180
    .line 181
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    new-instance v2, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 192
    .line 193
    .line 194
    iget p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->grabRankGiftNum:I

    .line 195
    .line 196
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-static {v1, v0, p0, p1}, Ll/xau;->E(Landroid/widget/TextView;ILjava/lang/String;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public Z(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->c:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/llp0;->t:Landroid/widget/TextView;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->gift:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->name:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->leaderboards:Ljava/util/List;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    new-instance v0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    new-instance v2, Ll/qdv;

    .line 34
    .line 35
    invoke-direct {v2, p1}, Ll/qdv;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V

    .line 36
    .line 37
    .line 38
    new-instance v3, Ll/glp0;

    .line 39
    .line 40
    invoke-direct {v3, p0, p1}, Ll/glp0;-><init>(Ll/llp0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ll/qdv;->I(Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    new-instance v0, Ll/mlp0;

    .line 56
    .line 57
    invoke-direct {v0}, Ll/mlp0;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    const/4 v2, 0x0

    .line 65
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-ge v2, v3, :cond_3

    .line 70
    .line 71
    new-instance v3, Ll/tlp0;

    .line 72
    .line 73
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;

    .line 78
    .line 79
    invoke-direct {v3, v4}, Ll/tlp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;)V

    .line 80
    .line 81
    .line 82
    new-instance v4, Ll/hlp0;

    .line 83
    .line 84
    invoke-direct {v4, p0}, Ll/hlp0;-><init>(Ll/llp0;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v3, v4}, Ll/tlp0;->I(Ll/y20;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    add-int/lit8 v2, v2, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/llp0;->m:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, p1}, Ll/llp0;->Y(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public b0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V
    .locals 5

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->nd:I

    .line 2
    .line 3
    iget v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->grabRankPrice:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->gift:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;

    .line 10
    .line 11
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->name:Ljava/lang/String;

    .line 12
    .line 13
    iget v3, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->grabRankGiftNum:I

    .line 14
    .line 15
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    iget-object v4, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 20
    .line 21
    iget-object v4, v4, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->name:Ljava/lang/String;

    .line 22
    .line 23
    filled-new-array {v1, v2, v3, v4}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v0, v1}, Ll/xau;->v(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/th0$a;

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 34
    .line 35
    check-cast v2, Ll/clp0;

    .line 36
    .line 37
    invoke-virtual {v2}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-direct {v1, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->b:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/klp0;

    .line 55
    .line 56
    invoke-direct {v1, p0, p1}, Ll/klp0;-><init>(Ll/llp0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->a:I

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/llp0;->N(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/llp0;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
