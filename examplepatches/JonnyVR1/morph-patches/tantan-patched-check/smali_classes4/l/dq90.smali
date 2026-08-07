.class public Ll/dq90;
.super Ll/nx2;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public b:Ll/s740;

.field public c:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

.field public d:Ll/uxl0;

.field public e:Landroid/view/View$OnClickListener;

.field public f:Ll/pkp;

.field public g:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/p1/mobile/putong/core/data/VirtualCardType;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/core/data/VirtualCardType;",
            ">;"
        }
    .end annotation
.end field

.field public i:I

.field public j:J


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;Ll/s740;Ll/uxl0;Ll/pkp;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/nx2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/dq90;->g:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/dq90;->h:Ljava/util/HashMap;

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    iput v0, p0, Ll/dq90;->i:I

    .line 20
    .line 21
    const-wide/16 v0, -0x1

    .line 22
    .line 23
    iput-wide v0, p0, Ll/dq90;->j:J

    .line 24
    .line 25
    iput-object p2, p0, Ll/dq90;->b:Ll/s740;

    .line 26
    .line 27
    iput-object p3, p0, Ll/dq90;->d:Ll/uxl0;

    .line 28
    .line 29
    invoke-virtual {p2, p0}, Ll/s740;->H(Ll/x20;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/dq90;->c:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 33
    .line 34
    iput-object p4, p0, Ll/dq90;->f:Ll/pkp;

    .line 35
    .line 36
    return-void
.end method

.method public static synthetic n(Ll/dq90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dq90;->y()V

    return-void
.end method

.method public static synthetic o(Ll/dq90;ILcom/p1/mobile/putong/core/ui/home/VirtualCard;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dq90;->w(ILcom/p1/mobile/putong/core/ui/home/VirtualCard;)V

    return-void
.end method

.method public static synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic q(Ll/dq90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dq90;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r(Ll/dq90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dq90;->x()V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/home/VirtualCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->H0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private t(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->liveLivingCardDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    const-string p0, "VirtualCard"

    .line 10
    .line 11
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->liveLivingCardDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;->getCurrentLive()Lcom/p1/mobile/putong/data/Live;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveLivingCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 22
    .line 23
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveVoiceCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 27
    .line 28
    iput-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method private u(Lcom/p1/mobile/putong/core/data/VirtualCardType;)I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dq90;->g:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/dq90;->g:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    iget v0, p0, Ll/dq90;->i:I

    .line 23
    .line 24
    add-int/lit8 v1, v0, 0x1

    .line 25
    .line 26
    iput v1, p0, Ll/dq90;->i:I

    .line 27
    .line 28
    iget-object v1, p0, Ll/dq90;->g:Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/dq90;->h:Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v1, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/dq90;->g:Ljava/util/HashMap;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, Ljava/lang/Integer;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/dq90;->e:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-wide v0, p0, Ll/dq90;->j:J

    .line 10
    .line 11
    const-wide/16 v2, -0x1

    .line 12
    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/pzi0;->o()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iget-wide v2, p0, Ll/dq90;->j:J

    .line 22
    .line 23
    sub-long/2addr v0, v2

    .line 24
    const-wide/16 v2, 0x1f4

    .line 25
    .line 26
    cmp-long v0, v0, v2

    .line 27
    .line 28
    if-gez v0, :cond_0

    .line 29
    .line 30
    invoke-static {}, Ll/pzi0;->o()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    iget-wide v2, p0, Ll/dq90;->j:J

    .line 35
    .line 36
    sub-long/2addr v0, v2

    .line 37
    const-wide/16 v2, 0x0

    .line 38
    .line 39
    cmp-long v0, v0, v2

    .line 40
    .line 41
    if-gez v0, :cond_1

    .line 42
    .line 43
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    iput-wide v0, p0, Ll/dq90;->j:J

    .line 48
    .line 49
    iget-object p0, p0, Ll/dq90;->e:Landroid/view/View$OnClickListener;

    .line 50
    .line 51
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method private synthetic w(ILcom/p1/mobile/putong/core/ui/home/VirtualCard;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dq90;->b:Ll/s740;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 8
    .line 9
    const-string v1, "p_suggest_users_home_view"

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->i(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->getCardData()Ll/ik4;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    iget-object v0, p0, Ll/dq90;->b:Ll/s740;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v2, p0, Ll/dq90;->f:Ll/pkp;

    .line 29
    .line 30
    invoke-virtual {v2}, Ll/pkp;->k0()Ll/hjp;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iget-object p0, p0, Ll/dq90;->b:Ll/s740;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v2, p0}, Ll/hjp;->B1(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-static {p2, v1, v0, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->r(Ll/ik4;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private synthetic x()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nx2;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic y()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nx2;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public call()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nx2;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Landroid/view/View;I)V
    .locals 4

    .line 1
    invoke-virtual {p0, p2}, Ll/dq90;->h(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    instance-of v1, p1, Ll/q7m;

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/dq90;->b:Ll/s740;

    .line 12
    .line 13
    invoke-virtual {v0, p2}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 18
    .line 19
    invoke-virtual {p0, p2}, Ll/dq90;->h(I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {v0, p1, v1, v2, p2}, Ll/s740;->w(Landroid/view/View;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;II)V

    .line 24
    .line 25
    .line 26
    if-nez p2, :cond_0

    .line 27
    .line 28
    new-instance p2, Ll/xp90;

    .line 29
    .line 30
    invoke-direct {p2, p0}, Ll/xp90;-><init>(Ll/dq90;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    instance-of v1, p1, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 43
    .line 44
    if-eqz v1, :cond_6

    .line 45
    .line 46
    check-cast p1, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 47
    .line 48
    iget-object v1, p0, Ll/dq90;->h:Ljava/util/HashMap;

    .line 49
    .line 50
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 59
    .line 60
    if-nez v0, :cond_2

    .line 61
    .line 62
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->Unknown:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 63
    .line 64
    :cond_2
    iget-object v1, p0, Ll/dq90;->b:Ll/s740;

    .line 65
    .line 66
    invoke-virtual {v1, p2}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->getAdapter()Ll/sxl0;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    if-eqz v2, :cond_3

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->getCardType()Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    if-ne v2, v0, :cond_3

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/VirtualCardType;->getId()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    sget-object v3, Lcom/p1/mobile/putong/core/data/VirtualCardType;->AdCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 89
    .line 90
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/VirtualCardType;->getId()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_4

    .line 99
    .line 100
    :cond_3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->setCardType(Lcom/p1/mobile/putong/core/data/VirtualCardType;)V

    .line 101
    .line 102
    .line 103
    iget-object v2, p0, Ll/dq90;->d:Ll/uxl0;

    .line 104
    .line 105
    invoke-interface {v2, v0, v1}, Ll/uxl0;->d2(Lcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ll/sxl0;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->setAdapter(Ll/sxl0;)V

    .line 110
    .line 111
    .line 112
    const/4 v2, 0x0

    .line 113
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 114
    .line 115
    .line 116
    :cond_4
    invoke-virtual {p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->K0(ILcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 117
    .line 118
    .line 119
    if-nez p2, :cond_5

    .line 120
    .line 121
    new-instance v0, Ll/yp90;

    .line 122
    .line 123
    invoke-direct {v0, p1}, Ll/yp90;-><init>(Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V

    .line 124
    .line 125
    .line 126
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_5
    new-instance v0, Ll/zp90;

    .line 131
    .line 132
    invoke-direct {v0}, Ll/zp90;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 136
    .line 137
    .line 138
    :goto_0
    if-nez p2, :cond_6

    .line 139
    .line 140
    iget-object v0, p0, Ll/dq90;->c:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 141
    .line 142
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    new-instance v1, Ll/aq90;

    .line 147
    .line 148
    invoke-direct {v1, p0, p2, p1}, Ll/aq90;-><init>(Ll/dq90;ILcom/p1/mobile/putong/core/ui/home/VirtualCard;)V

    .line 149
    .line 150
    .line 151
    const-wide/16 p0, 0x64

    .line 152
    .line 153
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 154
    .line 155
    .line 156
    :cond_6
    return-void
.end method

.method public e(ILandroid/content/Context;Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Ll/dq90;->b:Ll/s740;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dq90;->c:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 6
    .line 7
    invoke-virtual {p2, p0, p1}, Ll/s740;->m(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 13
    .line 14
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dq90;->b:Ll/s740;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/a;->getCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dq90;->b:Ll/s740;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dq90;->b:Ll/s740;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 8
    .line 9
    invoke-direct {p0, v0}, Ll/dq90;->t(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 13
    .line 14
    const-string v2, "VirtualCard"

    .line 15
    .line 16
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iget-object p1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 23
    .line 24
    invoke-direct {p0, p1}, Ll/dq90;->u(Lcom/p1/mobile/putong/core/data/VirtualCardType;)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_0
    iget-object p0, p0, Ll/dq90;->b:Ll/s740;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/s740;->getItemViewType(I)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method public i(I)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dq90;->b:Ll/s740;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/dq90;->b:Ll/s740;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/a;->getItem(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-object p0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 28
    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/VirtualCardType;->getId()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const-string p0, "userType"

    .line 37
    .line 38
    :goto_0
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public l(Landroid/view/View;Z)V
    .locals 0

    .line 1
    instance-of p0, p1, Ll/xql;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/xql;

    .line 6
    .line 7
    invoke-interface {p1, p2}, Ll/tql;->k(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public m(Ll/txl0;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/dq90;->f()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p1, Ll/txl0;->c:Ljava/lang/Object;

    .line 8
    .line 9
    instance-of v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 14
    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "remove card:"

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v2, ","

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v3, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 33
    .line 34
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ll/txl0;->d()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Ll/t4j;->h(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/dq90;->b:Ll/s740;

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ll/s740;->F(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_0

    .line 61
    .line 62
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/n;->Z3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    .line 71
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v1, "\u79fb\u51fa\u5361\u7247\u65f6\u6570\u636e\u5df2\u7ecf\u4e0d\u5b58\u5728:"

    .line 75
    .line 76
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ll/dq90;->f()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v1, "renderList:"

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ll/nx2;->b()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Ll/dq90;->c:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 109
    .line 110
    new-instance v0, Ll/bq90;

    .line 111
    .line 112
    invoke-direct {v0, p0}, Ll/bq90;-><init>(Ll/dq90;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 116
    .line 117
    .line 118
    :cond_1
    return-void

    .line 119
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    .line 120
    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    const-string v1, "\u79fb\u51fa\u5361\u7247\u65f6\u6808\u5df2\u7ecf\u7a7a\u4e86"

    .line 124
    .line 125
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Ll/nx2;->b()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, Ll/dq90;->c:Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 146
    .line 147
    new-instance v0, Ll/cq90;

    .line 148
    .line 149
    invoke-direct {v0, p0}, Ll/cq90;-><init>(Ll/dq90;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public z(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dq90;->e:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method
