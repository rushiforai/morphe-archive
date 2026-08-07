.class public Ll/slp0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/xlp0;",
        ">;"
    }
.end annotation


# static fields
.field public static A:Ljava/lang/String; = "https://fe-static.tancdn.com/v1/images/eyJpZCI6IjUzMzE5MjMzN0FFQjRCMEZBOTVCRDEyMzhGRDI5NDc5IiwidyI6Mzk5LCJoIjo2MTUsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNDE1ODU4MjMwNzYzODUsInB0IjoyMDI1MDkxNTE2fQ.webp"

.field public static B:Ljava/lang/String; = "https://fe-static.tancdn.com/v1/images/eyJpZCI6IjIwQThFRUE2RURGNTRBQTFBMDc0Q0UyMDhEQjZFNTE3IiwidyI6MzAzLCJoIjo1MTksImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyMzA1ODQzMDA5MjEzODI1MDI1LCJwdCI6MjAyNTA5MTUxOX0.webp"

.field public static C:Ljava/lang/String; = "https://fe-static.tancdn.com/v1/images/eyJpZCI6IjU1MEY4Q0M3NzkwMTQ5RjJBMUExODYzMzY5MEZGM0IzIiwidyI6MzAzLCJoIjo1MTksImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNDA0OTI1NzIwOTcyOTEyMjE3NSwicHQiOjIwMjUwOTE1MTl9.webp"

.field public static z:Ljava/lang/String; = "https://fe-static.tancdn.com/v1/images/eyJpZCI6IjM3REEwRENBREEwOTQxNTc5N0U4MTg0ODc0NThEQjE2IiwidyI6MTEyNSwiaCI6ODIyLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTA4NTA4NjAzNzQwMTYwMzg1NSwicHQiOjIwMjUwOTE1MTV9.webp"


# instance fields
.field public k:Lv/VDraweeView;

.field public l:Lv/VRecyclerView;

.field public m:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public n:Landroid/view/View;

.field public o:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

.field public p:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

.field public q:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

.field public r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;",
            ">;"
        }
    .end annotation
.end field

.field public s:Lv/VDraweeView;

.field public t:Lv/VText;

.field public u:Lv/VText;

.field public v:Lv/VText;

.field public w:Lv/VText;

.field public x:Ll/l4g0;

.field public y:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/xlp0;)V
    .locals 3

    .line 1
    sget v0, Ll/yec0;->pb:I

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

.method public static synthetic F(Ll/slp0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/slp0;->O(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic G(Ll/slp0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/slp0;->N(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic H(Ll/slp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/slp0;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/slp0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/slp0;->P(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Ll/slp0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/slp0;->Q(Ljava/lang/String;)V

    return-void
.end method

.method private K(Landroid/view/View;)V
    .locals 3

    .line 1
    sget v0, Ll/mdc0;->N6:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/TextView;

    .line 8
    .line 9
    iput-object v0, p0, Ll/slp0;->y:Landroid/widget/TextView;

    .line 10
    .line 11
    sget v0, Ll/mdc0;->I:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VDraweeView;

    .line 18
    .line 19
    iput-object v0, p0, Ll/slp0;->k:Lv/VDraweeView;

    .line 20
    .line 21
    sget v0, Ll/mdc0;->t3:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lv/VRecyclerView;

    .line 28
    .line 29
    iput-object v0, p0, Ll/slp0;->l:Lv/VRecyclerView;

    .line 30
    .line 31
    sget v0, Ll/mdc0;->A:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Ll/slp0;->n:Landroid/view/View;

    .line 38
    .line 39
    sget v0, Ll/mdc0;->T6:I

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

    .line 46
    .line 47
    iput-object v0, p0, Ll/slp0;->o:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

    .line 48
    .line 49
    sget v0, Ll/mdc0;->U6:I

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

    .line 56
    .line 57
    iput-object v0, p0, Ll/slp0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

    .line 58
    .line 59
    sget v0, Ll/mdc0;->V6:I

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

    .line 66
    .line 67
    iput-object v0, p0, Ll/slp0;->q:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

    .line 68
    .line 69
    iget-object v1, p0, Ll/slp0;->o:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

    .line 70
    .line 71
    iget-object v2, p0, Ll/slp0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

    .line 72
    .line 73
    filled-new-array {v1, v2, v0}, [Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Ll/slp0;->r:Ljava/util/List;

    .line 82
    .line 83
    sget v0, Ll/mdc0;->j:I

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lv/VDraweeView;

    .line 90
    .line 91
    iput-object v0, p0, Ll/slp0;->s:Lv/VDraweeView;

    .line 92
    .line 93
    sget v0, Ll/mdc0;->m:I

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Lv/VText;

    .line 100
    .line 101
    iput-object v0, p0, Ll/slp0;->w:Lv/VText;

    .line 102
    .line 103
    sget v0, Ll/mdc0;->k:I

    .line 104
    .line 105
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Lv/VText;

    .line 110
    .line 111
    iput-object v0, p0, Ll/slp0;->t:Lv/VText;

    .line 112
    .line 113
    sget v0, Ll/mdc0;->l:I

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    check-cast v0, Lv/VText;

    .line 120
    .line 121
    iput-object v0, p0, Ll/slp0;->u:Lv/VText;

    .line 122
    .line 123
    sget v0, Ll/mdc0;->n:I

    .line 124
    .line 125
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    check-cast p1, Lv/VText;

    .line 130
    .line 131
    iput-object p1, p0, Ll/slp0;->v:Lv/VText;

    .line 132
    .line 133
    return-void
.end method

.method private L(I)Ljava/lang/String;
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

.method private synthetic M(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic N(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    const-class p1, Ll/slp0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "p_intl_gift_collcetion_weekly_star_hall"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/slp0;->x:Ll/l4g0;

    .line 14
    .line 15
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic O(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/slp0;->x:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic Q(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast v0, Ll/xlp0;

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
    check-cast v0, Ll/xlp0;

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

.method private r()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/slp0;->k:Lv/VDraweeView;

    .line 2
    .line 3
    sget-object v1, Ll/slp0;->z:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/slp0;->o:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

    .line 9
    .line 10
    sget-object v1, Ll/slp0;->A:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->i0(ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/slp0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v3, Ll/slp0;->B:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->i0(ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/slp0;->q:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    sget-object v3, Ll/slp0;->C:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->i0(ILjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/slp0;->n:Landroid/view/View;

    .line 33
    .line 34
    new-instance v1, Ll/nlp0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/nlp0;-><init>(Ll/slp0;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/slp0;->l:Lv/VRecyclerView;

    .line 43
    .line 44
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 45
    .line 46
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const/4 v4, 0x0

    .line 51
    invoke-direct {v1, v3, v2, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 58
    .line 59
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Ll/slp0;->m:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 63
    .line 64
    iget-object v1, p0, Ll/slp0;->l:Lv/VRecyclerView;

    .line 65
    .line 66
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->c:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 70
    .line 71
    new-instance v1, Ll/olp0;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/olp0;-><init>(Ll/slp0;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->c:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 80
    .line 81
    new-instance v1, Ll/plp0;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/plp0;-><init>(Ll/slp0;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method


# virtual methods
.method public final synthetic P(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p2, Ll/xlp0;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->dismiss()Ll/v3f$c;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2}, Ll/v3f$c;->p()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 19
    .line 20
    move-object p2, p0

    .line 21
    check-cast p2, Ll/xlp0;

    .line 22
    .line 23
    invoke-virtual {p2}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    check-cast p2, Ll/rwn0;

    .line 28
    .line 29
    invoke-virtual {p2}, Ll/oo2;->j0()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p0, p2, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final R(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarHallMainDetail;)V
    .locals 4

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarHallMainDetail;->myLeaderboard:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;

    .line 2
    .line 3
    iget-object v0, p0, Ll/slp0;->s:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->avatar:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/slp0;->t:Lv/VText;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->name:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->score:I

    .line 22
    .line 23
    invoke-static {v0}, Ll/yau;->j(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Ll/slp0;->u:Lv/VText;

    .line 28
    .line 29
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Mj:I

    .line 30
    .line 31
    invoke-static {v2, v0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Ll/slp0;->u:Lv/VText;

    .line 39
    .line 40
    const-string v2, "#FE7E1D"

    .line 41
    .line 42
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    iget-object v3, p0, Ll/slp0;->u:Lv/VText;

    .line 47
    .line 48
    invoke-virtual {v3}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-static {v1, v2, v3, v0}, Ll/xau;->E(Landroid/widget/TextView;ILjava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->rank:I

    .line 60
    .line 61
    iget-object v1, p0, Ll/slp0;->w:Lv/VText;

    .line 62
    .line 63
    if-gtz v0, :cond_0

    .line 64
    .line 65
    const-string v0, "-"

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    invoke-direct {p0, v0}, Ll/slp0;->L(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    :goto_0
    iget v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->rank:I

    .line 79
    .line 80
    iget-object p0, p0, Ll/slp0;->v:Lv/VText;

    .line 81
    .line 82
    const/4 v1, 0x1

    .line 83
    if-ne v0, v1, :cond_1

    .line 84
    .line 85
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Nj:I

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Oj:I

    .line 92
    .line 93
    iget p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->gapScore:I

    .line 94
    .line 95
    invoke-static {p1}, Ll/yau;->j(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-static {v0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarHallMainDetail;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/slp0;->y:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarHallMainDetail;->title:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarHallMainDetail;->leaderboards:Ljava/util/List;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarHallMainDetail;->lastWeekLeaderboards:Ljava/util/List;

    .line 18
    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarHallMainDetail;->lastWeekLeaderboards:Ljava/util/List;

    .line 27
    .line 28
    :cond_1
    const/4 v1, 0x0

    .line 29
    move v2, v1

    .line 30
    :goto_0
    iget-object v3, p0, Ll/slp0;->r:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-ge v2, v3, :cond_3

    .line 37
    .line 38
    iget-object v3, p0, Ll/slp0;->r:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;

    .line 45
    .line 46
    iget-object v4, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarHallMainDetail;->lastWeekLeaderboards:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    if-ge v2, v4, :cond_2

    .line 53
    .line 54
    iget-object v4, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarHallMainDetail;->lastWeekLeaderboards:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;

    .line 61
    .line 62
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->h0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;)V

    .line 63
    .line 64
    .line 65
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->f:Lv/VDraweeView;

    .line 66
    .line 67
    new-instance v5, Ll/qlp0;

    .line 68
    .line 69
    invoke-direct {v5, p0, v4}, Ll/qlp0;-><init>(Ll/slp0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v3, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->j0()V

    .line 77
    .line 78
    .line 79
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceWeekStarHallTop3ItemView;->f:Lv/VDraweeView;

    .line 80
    .line 81
    const/4 v4, 0x0

    .line 82
    invoke-static {v3, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    new-instance v3, Ljava/util/ArrayList;

    .line 93
    .line 94
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 95
    .line 96
    .line 97
    new-instance v4, Ll/bmp0;

    .line 98
    .line 99
    iget-object v5, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarHallMainDetail;->bubbleText:Ljava/lang/String;

    .line 100
    .line 101
    invoke-direct {v4, v5}, Ll/bmp0;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    if-nez v2, :cond_4

    .line 108
    .line 109
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-ge v1, v2, :cond_5

    .line 114
    .line 115
    new-instance v2, Ll/tlp0;

    .line 116
    .line 117
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;

    .line 122
    .line 123
    invoke-direct {v2, v4}, Ll/tlp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;)V

    .line 124
    .line 125
    .line 126
    new-instance v4, Ll/rlp0;

    .line 127
    .line 128
    invoke-direct {v4, p0}, Ll/rlp0;-><init>(Ll/slp0;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v2, v4}, Ll/tlp0;->I(Ll/y20;)V

    .line 132
    .line 133
    .line 134
    const/4 v4, 0x1

    .line 135
    invoke-virtual {v2, v4}, Ll/tlp0;->J(Z)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    add-int/lit8 v1, v1, 0x1

    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_4
    new-instance v0, Ll/mlp0;

    .line 145
    .line 146
    invoke-direct {v0}, Ll/mlp0;-><init>()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    :cond_5
    iget-object v0, p0, Ll/slp0;->m:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 153
    .line 154
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p0, p1}, Ll/slp0;->R(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarHallMainDetail;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/slp0;->K(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/slp0;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
