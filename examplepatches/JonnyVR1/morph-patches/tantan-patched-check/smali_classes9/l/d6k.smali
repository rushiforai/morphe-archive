.class public Ll/d6k;
.super Ll/pf2;
.source "SourceFile"


# instance fields
.field public c:Ll/ihw;


# direct methods
.method public constructor <init>(Ll/ihw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pf2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/d6k;->c:Ll/ihw;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public i()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d6k;->c:Ll/ihw;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ihw;->c()Landroid/text/SpannableStringBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public o()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/pf2;->g()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/oo2;->o0()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Ll/pf2;->g()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->r(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0}, Ll/pf2;->g()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0}, Ll/pf2;->g()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v1, p0, Ll/d6k;->c:Ll/ihw;

    .line 61
    .line 62
    invoke-virtual {v1}, Ll/ihw;->b()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v1, p0, Ll/d6k;->c:Ll/ihw;

    .line 71
    .line 72
    invoke-virtual {v1}, Ll/ihw;->a()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-string v1, "live-lucky-gift"

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->u(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->CHANGE_SOURCE_WITH_BACK:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->n(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object p0, p0, Ll/pf2;->b:Ll/ki3;

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->JumpRoomEvent:Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;->jumpRoom()Ll/v3f$d;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public r(Landroid/view/ViewGroup;Ll/si3;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;->DEFAULT_BULLET_STYLE:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 2
    .line 3
    invoke-virtual {p2, v0, p1}, Ll/si3;->a(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p2, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;->e:Lv/VDraweeView;

    .line 11
    .line 12
    iget-object v0, p0, Ll/d6k;->c:Ll/ihw;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/ihw;->d()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "context_livingAct"

    .line 19
    .line 20
    invoke-static {v1, p1, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p2, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/pf2;->j()Landroid/graphics/drawable/GradientDrawable;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p2}, Ll/pf2;->d(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
