.class public Ll/ztc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ltc0;",
        ">;"
    }
.end annotation


# static fields
.field public static final C:J = 0x12cL

.field public static final D:J = 0x190L


# instance fields
.field public A:Z

.field public B:Z

.field public a:Landroid/widget/RelativeLayout;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Landroid/widget/RelativeLayout;

.field public d:Lv/VImage;

.field public e:Lv/VImage;

.field public f:Lv/VRecyclerView;

.field public g:Landroid/widget/RelativeLayout;

.field public h:Landroid/widget/RelativeLayout;

.field public i:Landroid/widget/RelativeLayout;

.field public j:Landroid/view/View;

.field public k:Landroid/view/View;

.field public l:Landroid/widget/RelativeLayout;

.field public m:Landroid/widget/LinearLayout;

.field public n:Lv/VDraweeView;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lv/VImage;

.field public r:Lv/VText;

.field public s:Landroid/view/View;

.field public t:Landroid/widget/RelativeLayout;

.field public u:Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

.field public v:Ll/qsc0;

.field public w:Landroid/view/animation/AccelerateDecelerateInterpolator;

.field public x:Ll/ltc0;

.field public y:Z

.field public z:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ztc0;->w:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/ztc0;->y:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/ztc0;->A:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Ll/ztc0;->B:Z

    .line 17
    .line 18
    iput-object p1, p0, Ll/ztc0;->u:Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 19
    .line 20
    return-void
.end method

.method private synthetic B()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "\u52a0\u8f7d\u4e2d..."

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/ztc0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ztc0;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/ztc0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ztc0;->I(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c(Ll/ztc0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ztc0;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/ztc0;ZLcom/p1/mobile/putong/core/data/RedPacket;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ztc0;->H(ZLcom/p1/mobile/putong/core/data/RedPacket;)V

    return-void
.end method

.method public static synthetic e(Ll/ztc0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ztc0;->L(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic f(Ll/ztc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->E()V

    return-void
.end method

.method public static synthetic i(Ll/ztc0;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ztc0;->K(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Ll/ztc0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ztc0;->J(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k(Ll/ztc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->F()V

    return-void
.end method

.method public static synthetic l(Ll/ztc0;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ztc0;->O(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic m(Ll/ztc0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ztc0;->B()V

    return-void
.end method

.method public static synthetic n(Ll/ztc0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ztc0;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/ztc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->N()V

    return-void
.end method

.method public static bridge synthetic q(Ll/ztc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->Q()V

    return-void
.end method


# virtual methods
.method public A()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ztc0;->y:Z

    .line 2
    .line 3
    return p0
.end method

.method public A3(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/mtc0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mtc0;-><init>(Ll/ztc0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/ztc0;->z:Ljava/lang/String;

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x0

    .line 24
    const/4 v2, 0x1

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {p1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    move p1, v2

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move p1, v1

    .line 36
    :goto_0
    iput-boolean p1, p0, Ll/ztc0;->A:Z

    .line 37
    .line 38
    new-instance p1, Ll/qsc0;

    .line 39
    .line 40
    iget-object v0, p0, Ll/ztc0;->u:Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 41
    .line 42
    invoke-direct {p1, v0, p0}, Ll/qsc0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ll/ztc0;)V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Ll/ztc0;->v:Ll/qsc0;

    .line 46
    .line 47
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-direct {p1, v0, v2, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/ztc0;->f:Lv/VRecyclerView;

    .line 57
    .line 58
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/ztc0;->f:Lv/VRecyclerView;

    .line 62
    .line 63
    iget-object v0, p0, Ll/ztc0;->v:Ll/qsc0;

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/ztc0;->x:Ll/ltc0;

    .line 69
    .line 70
    invoke-virtual {p0, v2}, Ll/ltc0;->F0(Z)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final synthetic C(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->U()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ztc0;->u:Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic E()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ztc0;->x:Ll/ltc0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ltc0;->p0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic F()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "\u52a0\u8f7d\u4e2d..."

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic H(ZLcom/p1/mobile/putong/core/data/RedPacket;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v3, p2

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    iget-object v1, v0, Ll/ztc0;->g:Landroid/widget/RelativeLayout;

    .line 13
    .line 14
    const/16 v7, 0x8

    .line 15
    .line 16
    invoke-virtual {v1, v7}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->new_()Lcom/p1/mobile/putong/core/data/ReceiveRecords;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, v3, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 24
    .line 25
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/RedPacketOwner;->ownerId:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v4, v1, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->userId:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/RedPacketOwner;->name:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->name:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v2, v3, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 34
    .line 35
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;->amount:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v4, v1, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->amount:Ljava/lang/String;

    .line 38
    .line 39
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;->highest:Z

    .line 40
    .line 41
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->highest:Z

    .line 42
    .line 43
    iget-object v2, v3, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 44
    .line 45
    const/4 v8, 0x0

    .line 46
    invoke-interface {v2, v8, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, v0, Ll/ztc0;->v:Ll/qsc0;

    .line 50
    .line 51
    iget-object v2, v3, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 52
    .line 53
    iget-boolean v4, v0, Ll/ztc0;->A:Z

    .line 54
    .line 55
    sget-object v5, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 56
    .line 57
    invoke-virtual {v5}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 58
    .line 59
    .line 60
    move-result-wide v5

    .line 61
    invoke-virtual/range {v1 .. v6}, Ll/qsc0;->G(Ljava/util/List;Lcom/p1/mobile/putong/core/data/RedPacket;ZJ)V

    .line 62
    .line 63
    .line 64
    iget-object v1, v0, Ll/ztc0;->v:Ll/qsc0;

    .line 65
    .line 66
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 67
    .line 68
    .line 69
    if-eqz p1, :cond_0

    .line 70
    .line 71
    iget-object v9, v0, Ll/ztc0;->k:Landroid/view/View;

    .line 72
    .line 73
    sget-wide v14, Ll/ztc0;->D:J

    .line 74
    .line 75
    move-wide v13, v14

    .line 76
    iget-object v15, v0, Ll/ztc0;->w:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 77
    .line 78
    invoke-virtual {v9}, Landroid/view/View;->getHeight()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    neg-int v1, v1

    .line 83
    int-to-float v1, v1

    .line 84
    const/4 v2, 0x1

    .line 85
    new-array v3, v2, [F

    .line 86
    .line 87
    aput v1, v3, v8

    .line 88
    .line 89
    const-string v10, "translationY"

    .line 90
    .line 91
    const-wide/16 v11, 0x0

    .line 92
    .line 93
    move-object/from16 v16, v3

    .line 94
    .line 95
    invoke-static/range {v9 .. v16}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    move-wide v14, v13

    .line 100
    check-cast v1, Landroid/animation/ObjectAnimator;

    .line 101
    .line 102
    iget-object v10, v0, Ll/ztc0;->k:Landroid/view/View;

    .line 103
    .line 104
    iget-object v3, v0, Ll/ztc0;->w:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 105
    .line 106
    invoke-static {}, Ll/bnl0;->y0()I

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    int-to-float v4, v4

    .line 111
    iget-object v5, v0, Ll/ztc0;->k:Landroid/view/View;

    .line 112
    .line 113
    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    int-to-float v5, v5

    .line 118
    const/high16 v6, 0x3f800000    # 1.0f

    .line 119
    .line 120
    mul-float/2addr v5, v6

    .line 121
    div-float/2addr v4, v5

    .line 122
    new-array v5, v2, [F

    .line 123
    .line 124
    aput v4, v5, v8

    .line 125
    .line 126
    const-string v11, "scaleX"

    .line 127
    .line 128
    const-wide/16 v12, 0x0

    .line 129
    .line 130
    move-object/from16 v16, v3

    .line 131
    .line 132
    move-object/from16 v17, v5

    .line 133
    .line 134
    invoke-static/range {v10 .. v17}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    check-cast v3, Landroid/animation/ObjectAnimator;

    .line 139
    .line 140
    iget-object v10, v0, Ll/ztc0;->j:Landroid/view/View;

    .line 141
    .line 142
    iget-object v4, v0, Ll/ztc0;->w:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 143
    .line 144
    new-array v5, v2, [F

    .line 145
    .line 146
    const/high16 v7, 0x447a0000    # 1000.0f

    .line 147
    .line 148
    aput v7, v5, v8

    .line 149
    .line 150
    const-string v11, "translationY"

    .line 151
    .line 152
    move-object/from16 v16, v4

    .line 153
    .line 154
    move-object/from16 v17, v5

    .line 155
    .line 156
    invoke-static/range {v10 .. v17}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    check-cast v4, Landroid/animation/ObjectAnimator;

    .line 161
    .line 162
    iget-object v10, v0, Ll/ztc0;->j:Landroid/view/View;

    .line 163
    .line 164
    iget-object v5, v0, Ll/ztc0;->w:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 165
    .line 166
    invoke-static {}, Ll/bnl0;->y0()I

    .line 167
    .line 168
    .line 169
    move-result v7

    .line 170
    int-to-float v7, v7

    .line 171
    iget-object v9, v0, Ll/ztc0;->j:Landroid/view/View;

    .line 172
    .line 173
    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    .line 174
    .line 175
    .line 176
    move-result v9

    .line 177
    int-to-float v9, v9

    .line 178
    mul-float/2addr v9, v6

    .line 179
    div-float/2addr v7, v9

    .line 180
    new-array v6, v2, [F

    .line 181
    .line 182
    aput v7, v6, v8

    .line 183
    .line 184
    const-string v11, "scaleX"

    .line 185
    .line 186
    move-object/from16 v16, v5

    .line 187
    .line 188
    move-object/from16 v17, v6

    .line 189
    .line 190
    invoke-static/range {v10 .. v17}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 191
    .line 192
    .line 193
    move-result-object v5

    .line 194
    check-cast v5, Landroid/animation/ObjectAnimator;

    .line 195
    .line 196
    iget-object v10, v0, Ll/ztc0;->j:Landroid/view/View;

    .line 197
    .line 198
    iget-object v6, v0, Ll/ztc0;->w:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 199
    .line 200
    new-array v7, v2, [F

    .line 201
    .line 202
    const/4 v9, 0x0

    .line 203
    aput v9, v7, v8

    .line 204
    .line 205
    const-string v11, "alpha"

    .line 206
    .line 207
    move-object/from16 v16, v6

    .line 208
    .line 209
    move-object/from16 v17, v7

    .line 210
    .line 211
    invoke-static/range {v10 .. v17}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 212
    .line 213
    .line 214
    move-result-object v6

    .line 215
    check-cast v6, Landroid/animation/ObjectAnimator;

    .line 216
    .line 217
    iget-object v10, v0, Ll/ztc0;->l:Landroid/widget/RelativeLayout;

    .line 218
    .line 219
    iget-object v7, v0, Ll/ztc0;->w:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 220
    .line 221
    new-array v11, v2, [F

    .line 222
    .line 223
    aput v9, v11, v8

    .line 224
    .line 225
    move-object/from16 v17, v11

    .line 226
    .line 227
    const-string v11, "alpha"

    .line 228
    .line 229
    move-object/from16 v16, v7

    .line 230
    .line 231
    invoke-static/range {v10 .. v17}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 232
    .line 233
    .line 234
    move-result-object v7

    .line 235
    check-cast v7, Landroid/animation/ObjectAnimator;

    .line 236
    .line 237
    iget-object v10, v0, Ll/ztc0;->a:Landroid/widget/RelativeLayout;

    .line 238
    .line 239
    iget-object v9, v0, Ll/ztc0;->w:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 240
    .line 241
    const/4 v11, 0x2

    .line 242
    new-array v12, v11, [F

    .line 243
    .line 244
    fill-array-data v12, :array_0

    .line 245
    .line 246
    .line 247
    move v13, v11

    .line 248
    const-string v11, "alpha"

    .line 249
    .line 250
    move-object/from16 v17, v12

    .line 251
    .line 252
    move/from16 v16, v13

    .line 253
    .line 254
    const-wide/16 v12, 0x0

    .line 255
    .line 256
    move/from16 v18, v16

    .line 257
    .line 258
    move-object/from16 v16, v9

    .line 259
    .line 260
    move/from16 v9, v18

    .line 261
    .line 262
    invoke-static/range {v10 .. v17}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 263
    .line 264
    .line 265
    move-result-object v10

    .line 266
    check-cast v10, Landroid/animation/ObjectAnimator;

    .line 267
    .line 268
    const/4 v11, 0x7

    .line 269
    new-array v11, v11, [Landroid/animation/Animator;

    .line 270
    .line 271
    aput-object v1, v11, v8

    .line 272
    .line 273
    aput-object v3, v11, v2

    .line 274
    .line 275
    aput-object v4, v11, v9

    .line 276
    .line 277
    const/4 v1, 0x3

    .line 278
    aput-object v5, v11, v1

    .line 279
    .line 280
    const/4 v1, 0x4

    .line 281
    aput-object v6, v11, v1

    .line 282
    .line 283
    const/4 v1, 0x5

    .line 284
    aput-object v7, v11, v1

    .line 285
    .line 286
    const/4 v1, 0x6

    .line 287
    aput-object v10, v11, v1

    .line 288
    .line 289
    invoke-static {v11}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 290
    .line 291
    .line 292
    move-result-object v1

    .line 293
    new-instance v2, Ll/ztc0$a;

    .line 294
    .line 295
    invoke-direct {v2, v0}, Ll/ztc0$a;-><init>(Ll/ztc0;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 302
    .line 303
    .line 304
    return-void

    .line 305
    :cond_0
    iget-object v1, v0, Ll/ztc0;->h:Landroid/widget/RelativeLayout;

    .line 306
    .line 307
    invoke-virtual {v1, v7}, Landroid/view/View;->setVisibility(I)V

    .line 308
    .line 309
    .line 310
    iget-object v1, v0, Ll/ztc0;->t:Landroid/widget/RelativeLayout;

    .line 311
    .line 312
    invoke-virtual {v1, v7}, Landroid/view/View;->setVisibility(I)V

    .line 313
    .line 314
    .line 315
    invoke-virtual {v0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    sget v2, Ll/y7c0;->f:I

    .line 320
    .line 321
    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 322
    .line 323
    .line 324
    move-result-object v1

    .line 325
    new-instance v2, Ll/ztc0$b;

    .line 326
    .line 327
    invoke-direct {v2, v0}, Ll/ztc0$b;-><init>(Ll/ztc0;)V

    .line 328
    .line 329
    .line 330
    invoke-virtual {v1, v2}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 331
    .line 332
    .line 333
    iget-object v0, v0, Ll/ztc0;->a:Landroid/widget/RelativeLayout;

    .line 334
    .line 335
    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 336
    .line 337
    .line 338
    return-void

    .line 339
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final synthetic I(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic J(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    if-eqz v0, :cond_5

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 13
    .line 14
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->subCode:I

    .line 15
    .line 16
    const v0, 0x3d0a94

    .line 17
    .line 18
    .line 19
    if-ne p1, v0, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Ll/ztc0;->p:Lv/VText;

    .line 22
    .line 23
    const-string v0, "\u624b\u6162\u4e86\uff0c\u7ea2\u5305\u6d3e\u5b8c\u4e86"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/ztc0;->p:Lv/VText;

    .line 29
    .line 30
    const/4 v0, 0x2

    .line 31
    const/high16 v1, 0x41900000    # 18.0f

    .line 32
    .line 33
    invoke-virtual {p1, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/ztc0;->q:Lv/VImage;

    .line 37
    .line 38
    const/4 v0, 0x4

    .line 39
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/ztc0;->r:Lv/VText;

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const v0, 0x3d0a95

    .line 50
    .line 51
    .line 52
    if-ne p1, v0, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    const v0, 0x3d0a96

    .line 56
    .line 57
    .line 58
    if-ne p1, v0, :cond_2

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/ztc0;->R()V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    const v0, 0x3d0a97

    .line 65
    .line 66
    .line 67
    if-ne p1, v0, :cond_3

    .line 68
    .line 69
    const-string p1, "\u5355\u65e5\u6700\u591a\u53ef\u62a2\u540c\u4e00\u7528\u623710\u4e2a\u7ea2\u5305"

    .line 70
    .line 71
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    const v0, 0x3d0a98

    .line 76
    .line 77
    .line 78
    if-ne p1, v0, :cond_4

    .line 79
    .line 80
    const-string p1, "\u5355\u65e5\u6700\u591a\u53ef\u62a2100\u4e2a\u7ea2\u5305"

    .line 81
    .line 82
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :cond_4
    :goto_0
    iget-object p0, p0, Ll/ztc0;->x:Ll/ltc0;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/ltc0;->G0()V

    .line 88
    .line 89
    .line 90
    :cond_5
    return-void
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/ztc0;->x:Ll/ltc0;

    .line 2
    .line 3
    invoke-virtual {p3}, Ll/ltc0;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const-string v0, "groupchat_id"

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ztc0;->y()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "e_open_red_packet"

    .line 22
    .line 23
    invoke-static {v1, p3, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    new-instance p3, Ll/xtc0;

    .line 27
    .line 28
    invoke-direct {p3, p0}, Ll/xtc0;-><init>(Ll/ztc0;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p3}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d1:Lcom/p1/mobile/putong/core/api/x;

    .line 41
    .line 42
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/api/x;->v3(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p3, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    new-instance p3, Ll/ytc0;

    .line 51
    .line 52
    invoke-direct {p3, p0, p2}, Ll/ytc0;-><init>(Ll/ztc0;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    new-instance p2, Ll/ntc0;

    .line 56
    .line 57
    invoke-direct {p2, p0}, Ll/ntc0;-><init>(Ll/ztc0;)V

    .line 58
    .line 59
    .line 60
    invoke-static {p3, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/ztc0;->o:Lv/VText;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, "\u7684\u7ea2\u5305"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-boolean v0, p0, Ll/ztc0;->A:Z

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 36
    .line 37
    iget-object p0, p0, Ll/ztc0;->n:Lv/VDraweeView;

    .line 38
    .line 39
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlVLWVo3Q0lEWk9LVFVHVVJHNktEM1pIVzNEVFJVRiIsInciOjcyMCwiaCI6NzIwLCJkIjowLCJtdCI6ImltYWdlL2pwZWcifQ.png"

    .line 40
    .line 41
    invoke-virtual {p1, p0, v0}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 52
    .line 53
    iget-object p0, p0, Ll/ztc0;->n:Lv/VDraweeView;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 68
    .line 69
    iget-object p0, p0, Ll/ztc0;->n:Lv/VDraweeView;

    .line 70
    .line 71
    sget v0, Ll/ibc0;->I0:I

    .line 72
    .line 73
    invoke-virtual {p1, p0, v0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final synthetic M(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ztc0;->x:Ll/ltc0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/ltc0;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "groupchat_id"

    .line 8
    .line 9
    iget-object v1, p0, Ll/ztc0;->z:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v0}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "e_check_luck"

    .line 20
    .line 21
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/ztc0;->x:Ll/ltc0;

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-virtual {p0, p1}, Ll/ltc0;->F0(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic N()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "\u52a0\u8f7d\u4e2d..."

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic O(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 9
    .line 10
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 15
    .line 16
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    check-cast p2, Lcom/p1/mobile/putong/core/data/RedPacket;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p0, p1, v0, p2, v0}, Ll/ztc0;->S(Ljava/lang/String;ZLcom/p1/mobile/putong/core/data/RedPacket;Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public P()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ztc0;->x:Ll/ltc0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ltc0;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final Q()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/ztc0;->B:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ztc0;->t:Landroid/widget/RelativeLayout;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/ztc0;->g:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    new-instance v1, Ll/ptc0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/ptc0;-><init>(Ll/ztc0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public R()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ztc0;->u:Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    new-instance v1, Ll/otc0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/otc0;-><init>(Ll/ztc0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/tcz;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public S(Ljava/lang/String;ZLcom/p1/mobile/putong/core/data/RedPacket;Z)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ztc0;->y:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/qtc0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/qtc0;-><init>(Ll/ztc0;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/ztc0;->d:Lv/VImage;

    .line 20
    .line 21
    new-instance v1, Ll/rtc0;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/rtc0;-><init>(Ll/ztc0;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->d1:Lcom/p1/mobile/putong/core/api/x;

    .line 36
    .line 37
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/api/x;->t3(Ljava/lang/String;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v0, Ll/stc0;

    .line 46
    .line 47
    invoke-direct {v0, p0, p2}, Ll/stc0;-><init>(Ll/ztc0;Z)V

    .line 48
    .line 49
    .line 50
    new-instance p2, Ll/ttc0;

    .line 51
    .line 52
    invoke-direct {p2, p0}, Ll/ttc0;-><init>(Ll/ztc0;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/ztc0;->x:Ll/ltc0;

    .line 63
    .line 64
    invoke-virtual {p0, p3, p4}, Ll/ltc0;->E0(Lcom/p1/mobile/putong/core/data/RedPacket;Z)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/RedPacket;I)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/g9c0;->L:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->setStatusBarColorResId(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/ztc0;->i:Landroid/widget/RelativeLayout;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 17
    .line 18
    invoke-static {}, Ll/bnl0;->y0()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v1, v1

    .line 23
    const v2, 0x3f526e98    # 0.822f

    .line 24
    .line 25
    .line 26
    mul-float/2addr v1, v2

    .line 27
    float-to-int v1, v1

    .line 28
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 29
    .line 30
    int-to-float v1, v1

    .line 31
    const v2, 0x3fbe353f    # 1.486f

    .line 32
    .line 33
    .line 34
    mul-float/2addr v1, v2

    .line 35
    float-to-int v1, v1

    .line 36
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 37
    .line 38
    iget-object v1, p0, Ll/ztc0;->i:Landroid/widget/RelativeLayout;

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 50
    .line 51
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ll/dkb;->Ma(Ljava/lang/String;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/utc0;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/utc0;-><init>(Ll/ztc0;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/ztc0;->r:Lv/VText;

    .line 74
    .line 75
    new-instance v1, Ll/vtc0;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/vtc0;-><init>(Ll/ztc0;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/ztc0;->q:Lv/VImage;

    .line 84
    .line 85
    new-instance v1, Ll/wtc0;

    .line 86
    .line 87
    invoke-direct {v1, p0, p1, p2}, Ll/wtc0;-><init>(Ll/ztc0;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/ztc0;->r:Lv/VText;

    .line 94
    .line 95
    const/4 p2, 0x0

    .line 96
    invoke-virtual {p1, p2}, Landroid/view/View;->setClickable(Z)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Ll/ztc0;->q:Lv/VImage;

    .line 100
    .line 101
    invoke-virtual {p1, p2}, Landroid/view/View;->setClickable(Z)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/ztc0;->i:Landroid/widget/RelativeLayout;

    .line 105
    .line 106
    sget-wide v4, Ll/ztc0;->C:J

    .line 107
    .line 108
    iget-object v6, p0, Ll/ztc0;->w:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 109
    .line 110
    const/4 p1, 0x2

    .line 111
    new-array v7, p1, [F

    .line 112
    .line 113
    fill-array-data v7, :array_0

    .line 114
    .line 115
    .line 116
    const-string v1, "scaleX"

    .line 117
    .line 118
    const-wide/16 v2, 0x0

    .line 119
    .line 120
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Landroid/animation/ObjectAnimator;

    .line 125
    .line 126
    iget-object v1, p0, Ll/ztc0;->i:Landroid/widget/RelativeLayout;

    .line 127
    .line 128
    iget-object v7, p0, Ll/ztc0;->w:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 129
    .line 130
    new-array v8, p1, [F

    .line 131
    .line 132
    fill-array-data v8, :array_1

    .line 133
    .line 134
    .line 135
    const-string v2, "scaleY"

    .line 136
    .line 137
    move-wide v5, v4

    .line 138
    const-wide/16 v3, 0x0

    .line 139
    .line 140
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    check-cast v1, Landroid/animation/ObjectAnimator;

    .line 145
    .line 146
    new-array v2, p1, [Landroid/animation/Animator;

    .line 147
    .line 148
    aput-object v0, v2, p2

    .line 149
    .line 150
    const/4 v0, 0x1

    .line 151
    aput-object v1, v2, v0

    .line 152
    .line 153
    invoke-static {v2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    new-instance v2, Ll/ztc0$d;

    .line 158
    .line 159
    invoke-direct {v2, p0}, Ll/ztc0$d;-><init>(Ll/ztc0;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 166
    .line 167
    .line 168
    iget-object v1, p0, Ll/ztc0;->l:Landroid/widget/RelativeLayout;

    .line 169
    .line 170
    const/4 v2, 0x0

    .line 171
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 172
    .line 173
    .line 174
    const-string v1, "groupchat_id"

    .line 175
    .line 176
    const/high16 v2, 0x41900000    # 18.0f

    .line 177
    .line 178
    const/4 v3, 0x4

    .line 179
    if-ne p4, v0, :cond_0

    .line 180
    .line 181
    iget-object p2, p0, Ll/ztc0;->q:Lv/VImage;

    .line 182
    .line 183
    invoke-virtual {p2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 184
    .line 185
    .line 186
    iget-object p2, p0, Ll/ztc0;->r:Lv/VText;

    .line 187
    .line 188
    invoke-virtual {p2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 189
    .line 190
    .line 191
    iget-object p2, p0, Ll/ztc0;->p:Lv/VText;

    .line 192
    .line 193
    const-string p3, "\u8be5\u7ea2\u5305\u5df2\u8d85\u8fc748\u5c0f\u65f6\u3002\u5982\u5df2\u9886\u53d6\uff0c\u53ef\u5728\u300c\u94b1\u5305\u300d-\u300c\u7ea2\u5305\u8bb0\u5f55\u300d\u4e2d\u67e5\u770b\u3002"

    .line 194
    .line 195
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 196
    .line 197
    .line 198
    iget-object p2, p0, Ll/ztc0;->p:Lv/VText;

    .line 199
    .line 200
    invoke-virtual {p2, p1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 201
    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :cond_0
    if-ne p4, p1, :cond_1

    .line 206
    .line 207
    iget-object p3, p0, Ll/ztc0;->p:Lv/VText;

    .line 208
    .line 209
    const-string p4, "\u624b\u6162\u4e86\uff0c\u7ea2\u5305\u6d3e\u5b8c\u4e86"

    .line 210
    .line 211
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    .line 213
    .line 214
    iget-object p3, p0, Ll/ztc0;->p:Lv/VText;

    .line 215
    .line 216
    invoke-virtual {p3, p1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 217
    .line 218
    .line 219
    iget-object p1, p0, Ll/ztc0;->q:Lv/VImage;

    .line 220
    .line 221
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 222
    .line 223
    .line 224
    iget-object p1, p0, Ll/ztc0;->r:Lv/VText;

    .line 225
    .line 226
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 227
    .line 228
    .line 229
    goto :goto_0

    .line 230
    :cond_1
    const/4 p1, 0x3

    .line 231
    if-ne p4, p1, :cond_3

    .line 232
    .line 233
    iget-object p1, p0, Ll/ztc0;->x:Ll/ltc0;

    .line 234
    .line 235
    invoke-virtual {p1}, Ll/ltc0;->pageId()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-virtual {p0}, Ll/ztc0;->y()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object p4

    .line 243
    invoke-static {v1, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 244
    .line 245
    .line 246
    move-result-object p4

    .line 247
    filled-new-array {p4}, [Ll/pf60;

    .line 248
    .line 249
    .line 250
    move-result-object p4

    .line 251
    const-string v0, "e_open_red_packet"

    .line 252
    .line 253
    invoke-static {v0, p1, p4}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 254
    .line 255
    .line 256
    iget-object p1, p0, Ll/ztc0;->q:Lv/VImage;

    .line 257
    .line 258
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 259
    .line 260
    .line 261
    iget-object p1, p0, Ll/ztc0;->p:Lv/VText;

    .line 262
    .line 263
    iget-object p4, p3, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 264
    .line 265
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/RedPacketInfo;->title:Ljava/lang/String;

    .line 266
    .line 267
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 268
    .line 269
    .line 270
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 271
    .line 272
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 273
    .line 274
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 279
    .line 280
    iget-object p4, p3, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 281
    .line 282
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/RedPacketOwner;->ownerId:Ljava/lang/String;

    .line 283
    .line 284
    invoke-static {p1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 285
    .line 286
    .line 287
    move-result p1

    .line 288
    if-nez p1, :cond_2

    .line 289
    .line 290
    iget p1, p3, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 291
    .line 292
    iget p4, p3, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 293
    .line 294
    if-le p1, p4, :cond_2

    .line 295
    .line 296
    iget-wide p3, p3, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 297
    .line 298
    const-wide/16 v4, 0x3e8

    .line 299
    .line 300
    mul-long/2addr p3, v4

    .line 301
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 302
    .line 303
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 304
    .line 305
    .line 306
    move-result-wide v4

    .line 307
    cmp-long p1, p3, v4

    .line 308
    .line 309
    if-ltz p1, :cond_2

    .line 310
    .line 311
    iget-object p1, p0, Ll/ztc0;->r:Lv/VText;

    .line 312
    .line 313
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 314
    .line 315
    .line 316
    goto :goto_0

    .line 317
    :cond_2
    iget-object p1, p0, Ll/ztc0;->r:Lv/VText;

    .line 318
    .line 319
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 320
    .line 321
    .line 322
    :cond_3
    :goto_0
    iget-object p1, p0, Ll/ztc0;->r:Lv/VText;

    .line 323
    .line 324
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 325
    .line 326
    .line 327
    move-result p1

    .line 328
    if-nez p1, :cond_4

    .line 329
    .line 330
    iget-object p1, p0, Ll/ztc0;->x:Ll/ltc0;

    .line 331
    .line 332
    invoke-virtual {p1}, Ll/ltc0;->pageId()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    iget-object p0, p0, Ll/ztc0;->z:Ljava/lang/String;

    .line 337
    .line 338
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 339
    .line 340
    .line 341
    move-result-object p0

    .line 342
    filled-new-array {p0}, [Ll/pf60;

    .line 343
    .line 344
    .line 345
    move-result-object p0

    .line 346
    const-string p2, "e_check_luck"

    .line 347
    .line 348
    invoke-static {p2, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 349
    .line 350
    .line 351
    :cond_4
    return-void

    .line 352
    nop

    .line 353
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public U()V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/ztc0;->g:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 5
    .line 6
    .line 7
    iget-boolean v0, p0, Ll/ztc0;->B:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Ll/ztc0;->B:Z

    .line 14
    .line 15
    iget-object v1, p0, Ll/ztc0;->i:Landroid/widget/RelativeLayout;

    .line 16
    .line 17
    sget-wide v5, Ll/ztc0;->C:J

    .line 18
    .line 19
    iget-object v7, p0, Ll/ztc0;->w:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 20
    .line 21
    const/4 v10, 0x2

    .line 22
    new-array v8, v10, [F

    .line 23
    .line 24
    fill-array-data v8, :array_0

    .line 25
    .line 26
    .line 27
    const-string v2, "scaleX"

    .line 28
    .line 29
    const-wide/16 v3, 0x0

    .line 30
    .line 31
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroid/animation/ObjectAnimator;

    .line 36
    .line 37
    iget-object v2, p0, Ll/ztc0;->i:Landroid/widget/RelativeLayout;

    .line 38
    .line 39
    iget-object v8, p0, Ll/ztc0;->w:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 40
    .line 41
    new-array v9, v10, [F

    .line 42
    .line 43
    fill-array-data v9, :array_1

    .line 44
    .line 45
    .line 46
    const-string v3, "scaleY"

    .line 47
    .line 48
    move-wide v6, v5

    .line 49
    const-wide/16 v4, 0x0

    .line 50
    .line 51
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Landroid/animation/ObjectAnimator;

    .line 56
    .line 57
    new-array v3, v10, [Landroid/animation/Animator;

    .line 58
    .line 59
    const/4 v4, 0x0

    .line 60
    aput-object v1, v3, v4

    .line 61
    .line 62
    aput-object v2, v3, v0

    .line 63
    .line 64
    invoke-static {v3}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/ztc0$c;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/ztc0$c;-><init>(Ll/ztc0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    nop

    .line 81
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ltc0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ztc0;->x(Ll/ltc0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ztc0;->s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/auc0;->b(Ll/ztc0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ztc0;->u:Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public v(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 13
    .line 14
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->subCode:I

    .line 15
    .line 16
    const v0, 0xa3b1

    .line 17
    .line 18
    .line 19
    if-ne p1, v0, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->n7:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const v0, 0xa3b2

    .line 28
    .line 29
    .line 30
    if-ne p1, v0, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Ll/ztc0;->u:Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 33
    .line 34
    invoke-static {p0}, Ll/tcz;->I(Lcom/p1/mobile/android/app/Act;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m7:I

    .line 39
    .line 40
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m7:I

    .line 45
    .line 46
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public w(Ll/pf60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Ljava/lang/Integer;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/16 v1, 0x2328

    .line 17
    .line 18
    if-ne v1, v0, :cond_0

    .line 19
    .line 20
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->o7:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-string v0, "41905"

    .line 27
    .line 28
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->n7:I

    .line 37
    .line 38
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const-string v0, "41906"

    .line 43
    .line 44
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    iget-object p0, p0, Ll/ztc0;->u:Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 53
    .line 54
    invoke-static {p0}, Ll/tcz;->I(Lcom/p1/mobile/android/app/Act;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m7:I

    .line 59
    .line 60
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public x(Ll/ltc0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ztc0;->x:Ll/ltc0;

    .line 2
    .line 3
    return-void
.end method

.method public y()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ztc0;->z:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public z(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/RedPacket;Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 25
    .line 26
    const-string v2, "average"

    .line 27
    .line 28
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iget v2, p2, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 33
    .line 34
    iget v3, p2, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 35
    .line 36
    const/4 v4, 0x0

    .line 37
    const/4 v5, 0x1

    .line 38
    if-gt v2, v3, :cond_0

    .line 39
    .line 40
    move v2, v5

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move v2, v4

    .line 43
    :goto_0
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 44
    .line 45
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;->amount:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    iget-wide v6, p2, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 52
    .line 53
    const-wide/16 v8, 0x3e8

    .line 54
    .line 55
    mul-long/2addr v6, v8

    .line 56
    sget-object v8, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 57
    .line 58
    invoke-virtual {v8}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 59
    .line 60
    .line 61
    move-result-wide v8

    .line 62
    cmp-long v6, v6, v8

    .line 63
    .line 64
    if-gez v6, :cond_1

    .line 65
    .line 66
    move v6, v5

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    move v6, v4

    .line 69
    :goto_1
    if-nez v0, :cond_2

    .line 70
    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    if-eqz v3, :cond_2

    .line 74
    .line 75
    if-nez v2, :cond_2

    .line 76
    .line 77
    if-eqz v6, :cond_b

    .line 78
    .line 79
    :cond_2
    if-nez v0, :cond_3

    .line 80
    .line 81
    if-eqz v1, :cond_3

    .line 82
    .line 83
    if-eqz v3, :cond_3

    .line 84
    .line 85
    if-eqz v2, :cond_3

    .line 86
    .line 87
    if-eqz v6, :cond_b

    .line 88
    .line 89
    :cond_3
    if-nez v0, :cond_4

    .line 90
    .line 91
    if-eqz v1, :cond_4

    .line 92
    .line 93
    if-eqz v3, :cond_4

    .line 94
    .line 95
    if-eqz v2, :cond_4

    .line 96
    .line 97
    if-nez v6, :cond_b

    .line 98
    .line 99
    :cond_4
    if-nez v0, :cond_5

    .line 100
    .line 101
    if-eqz v1, :cond_5

    .line 102
    .line 103
    if-eqz v3, :cond_5

    .line 104
    .line 105
    if-nez v2, :cond_5

    .line 106
    .line 107
    if-nez v6, :cond_b

    .line 108
    .line 109
    :cond_5
    if-nez v0, :cond_6

    .line 110
    .line 111
    if-nez v1, :cond_6

    .line 112
    .line 113
    if-eqz v3, :cond_6

    .line 114
    .line 115
    if-nez v2, :cond_6

    .line 116
    .line 117
    if-eqz v6, :cond_b

    .line 118
    .line 119
    :cond_6
    if-nez v0, :cond_7

    .line 120
    .line 121
    if-nez v1, :cond_7

    .line 122
    .line 123
    if-eqz v3, :cond_7

    .line 124
    .line 125
    if-eqz v2, :cond_7

    .line 126
    .line 127
    if-eqz v6, :cond_b

    .line 128
    .line 129
    :cond_7
    if-nez v0, :cond_8

    .line 130
    .line 131
    if-nez v1, :cond_8

    .line 132
    .line 133
    if-eqz v3, :cond_8

    .line 134
    .line 135
    if-eqz v2, :cond_8

    .line 136
    .line 137
    if-nez v6, :cond_b

    .line 138
    .line 139
    :cond_8
    if-nez v0, :cond_9

    .line 140
    .line 141
    if-nez v1, :cond_9

    .line 142
    .line 143
    if-eqz v3, :cond_9

    .line 144
    .line 145
    if-nez v2, :cond_9

    .line 146
    .line 147
    if-nez v6, :cond_b

    .line 148
    .line 149
    :cond_9
    if-eqz v0, :cond_a

    .line 150
    .line 151
    if-nez v1, :cond_a

    .line 152
    .line 153
    if-eqz v3, :cond_a

    .line 154
    .line 155
    if-nez v2, :cond_a

    .line 156
    .line 157
    if-eqz v6, :cond_b

    .line 158
    .line 159
    :cond_a
    if-eqz v0, :cond_16

    .line 160
    .line 161
    if-nez v1, :cond_16

    .line 162
    .line 163
    if-eqz v3, :cond_16

    .line 164
    .line 165
    if-eqz v2, :cond_16

    .line 166
    .line 167
    if-nez v6, :cond_16

    .line 168
    .line 169
    :cond_b
    if-nez v0, :cond_c

    .line 170
    .line 171
    if-eqz v1, :cond_c

    .line 172
    .line 173
    if-eqz v3, :cond_c

    .line 174
    .line 175
    if-nez v2, :cond_c

    .line 176
    .line 177
    if-eqz v6, :cond_e

    .line 178
    .line 179
    :cond_c
    if-nez v0, :cond_d

    .line 180
    .line 181
    if-nez v1, :cond_d

    .line 182
    .line 183
    if-eqz v3, :cond_d

    .line 184
    .line 185
    if-nez v2, :cond_d

    .line 186
    .line 187
    if-eqz v6, :cond_e

    .line 188
    .line 189
    :cond_d
    if-eqz v0, :cond_f

    .line 190
    .line 191
    if-nez v1, :cond_f

    .line 192
    .line 193
    if-eqz v3, :cond_f

    .line 194
    .line 195
    if-nez v2, :cond_f

    .line 196
    .line 197
    if-nez v6, :cond_f

    .line 198
    .line 199
    :cond_e
    const/4 v0, 0x3

    .line 200
    goto :goto_2

    .line 201
    :cond_f
    if-nez v0, :cond_10

    .line 202
    .line 203
    if-eqz v1, :cond_10

    .line 204
    .line 205
    if-eqz v3, :cond_10

    .line 206
    .line 207
    if-eqz v2, :cond_10

    .line 208
    .line 209
    if-eqz v6, :cond_14

    .line 210
    .line 211
    :cond_10
    if-nez v0, :cond_11

    .line 212
    .line 213
    if-eqz v1, :cond_11

    .line 214
    .line 215
    if-eqz v3, :cond_11

    .line 216
    .line 217
    if-eqz v2, :cond_11

    .line 218
    .line 219
    if-nez v6, :cond_14

    .line 220
    .line 221
    :cond_11
    if-nez v0, :cond_12

    .line 222
    .line 223
    if-nez v1, :cond_12

    .line 224
    .line 225
    if-eqz v3, :cond_12

    .line 226
    .line 227
    if-eqz v2, :cond_12

    .line 228
    .line 229
    if-eqz v6, :cond_14

    .line 230
    .line 231
    :cond_12
    if-nez v0, :cond_13

    .line 232
    .line 233
    if-nez v1, :cond_13

    .line 234
    .line 235
    if-eqz v3, :cond_13

    .line 236
    .line 237
    if-eqz v2, :cond_13

    .line 238
    .line 239
    if-nez v6, :cond_14

    .line 240
    .line 241
    :cond_13
    if-eqz v0, :cond_15

    .line 242
    .line 243
    if-nez v1, :cond_15

    .line 244
    .line 245
    if-eqz v3, :cond_15

    .line 246
    .line 247
    if-eqz v2, :cond_15

    .line 248
    .line 249
    if-nez v6, :cond_15

    .line 250
    .line 251
    :cond_14
    const/4 v0, 0x2

    .line 252
    goto :goto_2

    .line 253
    :cond_15
    move v0, v5

    .line 254
    :goto_2
    invoke-virtual {p0, p1, p3, p2, v0}, Ll/ztc0;->T(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/RedPacket;I)V

    .line 255
    .line 256
    .line 257
    iget-object p1, p0, Ll/ztc0;->x:Ll/ltc0;

    .line 258
    .line 259
    invoke-virtual {p1, p2, v5}, Ll/ltc0;->E0(Lcom/p1/mobile/putong/core/data/RedPacket;Z)V

    .line 260
    .line 261
    .line 262
    goto :goto_3

    .line 263
    :cond_16
    invoke-virtual {p0, p3, v4, p2, v4}, Ll/ztc0;->S(Ljava/lang/String;ZLcom/p1/mobile/putong/core/data/RedPacket;Z)V

    .line 264
    .line 265
    .line 266
    :goto_3
    iget-object p0, p0, Ll/ztc0;->x:Ll/ltc0;

    .line 267
    .line 268
    invoke-virtual {p0}, Ll/ltc0;->r0()V

    .line 269
    .line 270
    .line 271
    return-void
.end method
