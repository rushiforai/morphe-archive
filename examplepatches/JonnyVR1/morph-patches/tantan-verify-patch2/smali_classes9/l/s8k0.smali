.class public Ll/s8k0;
.super Ll/p8k0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/p8k0<",
        "TD;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lv/VText;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lv/VText;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/p8k0;-><init>(Ll/dum;Lv/VText;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q4(Ll/s8k0;Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/s8k0;->s4(Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method

.method public static synthetic r4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isFollowForbidden()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->C:I

    .line 14
    .line 15
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public l4(Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ljava/lang/String;)V
    .locals 9

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v7

    .line 27
    move-object v2, p1

    .line 28
    move v3, p2

    .line 29
    move-object v8, p4

    .line 30
    move-object v4, p5

    .line 31
    invoke-virtual/range {v0 .. v8}, Ll/wrv;->d(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance p2, Ll/q8k0;

    .line 40
    .line 41
    invoke-direct {p2, p0, v2, v3, p3}, Ll/q8k0;-><init>(Ll/s8k0;Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 42
    .line 43
    .line 44
    new-instance p0, Ll/r8k0;

    .line 45
    .line 46
    invoke-direct {p0}, Ll/r8k0;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {p2, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic s4(Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/data/Followship;)V
    .locals 2

    .line 1
    iput-object p4, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ms2;->d4()Ll/ms2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/ms2;->X3(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0, p4}, Ll/oo2;->U(Lcom/p1/mobile/putong/data/Followship;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    sget-object p4, Ll/zrv;->a:Ll/wrv;

    .line 36
    .line 37
    invoke-virtual {p4}, Ll/wrv;->H()Z

    .line 38
    .line 39
    .line 40
    move-result p4

    .line 41
    if-eqz p4, :cond_1

    .line 42
    .line 43
    invoke-static {}, Ll/mjj;->d()V

    .line 44
    .line 45
    .line 46
    :cond_1
    if-eqz p2, :cond_2

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OfficialShowEvent:Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;->followOfficialAnchor()Ll/v3f$d;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->matchedOrFollowed()Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_4

    .line 68
    .line 69
    const/4 p0, 0x2

    .line 70
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_3

    .line 75
    .line 76
    if-eqz p3, :cond_3

    .line 77
    .line 78
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->M4:I

    .line 79
    .line 80
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_3
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->L4:I

    .line 85
    .line 86
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 87
    .line 88
    .line 89
    :cond_4
    return-void
.end method
