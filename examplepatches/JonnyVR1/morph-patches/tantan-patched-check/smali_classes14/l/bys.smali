.class public Ll/bys;
.super Ll/txs;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/txs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q2(Ll/bys;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bys;->Y2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic R2(Ll/bys;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bys;->d3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic S2(Ll/bys;Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bys;->Z2(Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T2(Ll/bys;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bys;->h3(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic U2(Ll/bys;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bys;->f3(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic V2(Ll/bys;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bys;->a3(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public T()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ll/gm3;

    .line 11
    .line 12
    iget-object v1, v1, Ll/gm3;->a:Lrx/subjects/a;

    .line 13
    .line 14
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Ll/gm3;

    .line 19
    .line 20
    iget-object v2, v2, Ll/gm3;->i:Lrx/subjects/a;

    .line 21
    .line 22
    new-instance v3, Ll/uxs;

    .line 23
    .line 24
    invoke-direct {v3}, Ll/uxs;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2, v3}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-virtual {p0, v1, v2}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v1, v3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    new-instance v3, Ll/vxs;

    .line 45
    .line 46
    invoke-direct {v3, p0}, Ll/vxs;-><init>(Ll/bys;)V

    .line 47
    .line 48
    .line 49
    new-instance v4, Ll/wxs;

    .line 50
    .line 51
    invoke-direct {v4, p0}, Ll/wxs;-><init>(Ll/bys;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v3, v4}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v1, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ll/gm3;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/gm3;->e()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0, v2}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/xxs;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/xxs;-><init>(Ll/bys;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/yxs;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/yxs;-><init>(Ll/bys;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    invoke-static {}, Ll/t4u;->i()Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v1, Ll/zxs;

    .line 105
    .line 106
    invoke-direct {v1, p0}, Ll/zxs;-><init>(Ll/bys;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/ays;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/ays;-><init>(Ll/bys;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public final W2([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V
    .locals 5

    .line 1
    if-lez p3, :cond_5

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    const/4 v0, 0x2

    .line 18
    const/4 v1, 0x3

    .line 19
    const/4 v2, 0x0

    .line 20
    const/4 v3, 0x1

    .line 21
    const/4 v4, -0x1

    .line 22
    sparse-switch p2, :sswitch_data_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :sswitch_0
    const-string p2, "liveIcon"

    .line 27
    .line 28
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    move v4, v1

    .line 36
    goto :goto_0

    .line 37
    :sswitch_1
    const-string p2, "guild"

    .line 38
    .line 39
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    move v4, v0

    .line 47
    goto :goto_0

    .line 48
    :sswitch_2
    const-string p2, "redDot"

    .line 49
    .line 50
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_3

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    move v4, v3

    .line 58
    goto :goto_0

    .line 59
    :sswitch_3
    const-string p2, "number"

    .line 60
    .line 61
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_4

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    move v4, v2

    .line 69
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :pswitch_0
    aget p0, p1, v2

    .line 74
    .line 75
    add-int/2addr p0, v3

    .line 76
    aput p0, p1, v2

    .line 77
    .line 78
    return-void

    .line 79
    :pswitch_1
    aget p0, p1, v1

    .line 80
    .line 81
    add-int/2addr p0, p3

    .line 82
    aput p0, p1, v1

    .line 83
    .line 84
    return-void

    .line 85
    :pswitch_2
    aget p0, p1, v0

    .line 86
    .line 87
    add-int/2addr p0, v3

    .line 88
    aput p0, p1, v0

    .line 89
    .line 90
    return-void

    .line 91
    :pswitch_3
    aget p0, p1, v3

    .line 92
    .line 93
    add-int/2addr p0, p3

    .line 94
    aput p0, p1, v3

    .line 95
    .line 96
    :cond_5
    :goto_1
    return-void

    .line 97
    :sswitch_data_0
    .sparse-switch
        -0x3da724b7 -> :sswitch_3
        -0x37b9c108 -> :sswitch_2
        0x5e23bf3 -> :sswitch_1
        0x547b0b85 -> :sswitch_0
    .end sparse-switch

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final X2()Z
    .locals 4

    .line 1
    new-instance v0, Ll/jcs;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jcs;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    const/4 v0, 0x0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    return v0

    .line 20
    :cond_0
    invoke-static {}, Ll/t4u;->h()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    return v0

    .line 27
    :cond_1
    const/16 p0, 0x14

    .line 28
    .line 29
    const/16 v1, 0x18

    .line 30
    .line 31
    invoke-static {p0, v1}, Ll/pzi0;->x(II)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    sget-object p0, Ll/itd0;->e:Ll/itd0;

    .line 38
    .line 39
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ll/fm3;

    .line 44
    .line 45
    iget-object p0, p0, Ll/fm3;->f:Ll/byd0;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ljava/lang/Long;

    .line 52
    .line 53
    invoke-static {}, Ll/pzi0;->o()J

    .line 54
    .line 55
    .line 56
    move-result-wide v0

    .line 57
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 58
    .line 59
    .line 60
    move-result-wide v2

    .line 61
    invoke-static {v0, v1, v2, v3}, Ll/pzi0;->C(JJ)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    xor-int/lit8 p0, p0, 0x1

    .line 66
    .line 67
    return p0

    .line 68
    :cond_2
    return v0
.end method

.method public final synthetic Y2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/bys;->f3(Landroid/util/Pair;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic Z2(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    new-instance p1, Ll/jcs;

    .line 2
    .line 3
    invoke-direct {p1}, Ll/jcs;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/lang/Boolean;

    .line 11
    .line 12
    return-object p0
.end method

.method public final synthetic a3(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    new-instance p1, Ll/jcs;

    .line 2
    .line 3
    invoke-direct {p1}, Ll/jcs;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/lang/Boolean;

    .line 11
    .line 12
    return-object p0
.end method

.method public final b3()Z
    .locals 0

    .line 1
    sget-object p0, Ll/itd0;->d:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/bk3;

    .line 8
    .line 9
    iget-object p0, p0, Ll/bk3;->a:Ll/jxd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    xor-int/lit8 p0, p0, 0x1

    .line 22
    .line 23
    return p0
.end method

.method public final c3()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ppi0;->x()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/mqr;->j()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    sget-object p0, Ll/itd0;->e:Ll/itd0;

    .line 18
    .line 19
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/fm3;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/fm3;->d()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/y6u;->b()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public final d3(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Ll/itd0;->c:Ll/itd0;

    .line 8
    .line 9
    invoke-static {p1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/gm3;

    .line 14
    .line 15
    iget-object v0, v0, Ll/gm3;->a:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-virtual {v0}, Lrx/subjects/a;->i()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-static {p1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/gm3;

    .line 28
    .line 29
    iget-object v0, v0, Ll/gm3;->i:Lrx/subjects/a;

    .line 30
    .line 31
    invoke-virtual {v0}, Lrx/subjects/a;->i()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    new-instance v0, Landroid/util/Pair;

    .line 38
    .line 39
    invoke-static {p1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Ll/gm3;

    .line 44
    .line 45
    iget-object v1, v1, Ll/gm3;->a:Lrx/subjects/a;

    .line 46
    .line 47
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 52
    .line 53
    invoke-static {p1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Ll/gm3;

    .line 58
    .line 59
    iget-object p1, p1, Ll/gm3;->i:Lrx/subjects/a;

    .line 60
    .line 61
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Ljava/lang/Boolean;

    .line 66
    .line 67
    invoke-direct {v0, v1, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 71
    .line 72
    if-eqz p1, :cond_0

    .line 73
    .line 74
    iget-object p1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 75
    .line 76
    if-eqz p1, :cond_0

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Ll/bys;->f3(Landroid/util/Pair;)V

    .line 79
    .line 80
    .line 81
    :cond_0
    return-void
.end method

.method public final e3(Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;[I)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    aget v1, p2, v0

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    if-lez v1, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 8
    .line 9
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->redDotNum:I

    .line 10
    .line 11
    invoke-virtual {p0, v1, p1}, Ll/bys;->g3(II)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 19
    .line 20
    aget p2, p2, v0

    .line 21
    .line 22
    invoke-static {p1, v1, p2}, Ll/mbs;->Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0, v1, v2}, Ll/mbs;->X(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p0, v1, v2}, Ll/bys;->g3(II)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 41
    .line 42
    invoke-static {p1, v1, v2}, Ll/mbs;->Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 43
    .line 44
    .line 45
    const/4 p1, 0x2

    .line 46
    aget p1, p2, p1

    .line 47
    .line 48
    if-lez p1, :cond_1

    .line 49
    .line 50
    aget p1, p2, v0

    .line 51
    .line 52
    invoke-virtual {p0, p1, v2}, Ll/bys;->g3(II)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {p1, v1, v0}, Ll/mbs;->X(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p0, v1, v2}, Ll/mbs;->Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {p0, v1, v2}, Ll/mbs;->X(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final f3(Landroid/util/Pair;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 4
    .line 5
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v1, 0x0

    .line 14
    filled-new-array {v1, v1, v1, v1}, [I

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    if-eqz v0, :cond_5

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getLiveActivitySummary()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    if-nez v3, :cond_0

    .line 25
    .line 26
    goto/16 :goto_2

    .line 27
    .line 28
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->getLiveActivitySummary()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    iget-object v4, v4, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeStartLiveEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeStartLiveEvent;

    .line 37
    .line 38
    invoke-virtual {v4}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeStartLiveEvent;->showRedDot()Ll/v3f$d;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {p0}, Ll/bys;->c3()Z

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-virtual {v4, v5}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    sget-object v4, Ll/tbs;->b:Ll/vwt;

    .line 54
    .line 55
    invoke-virtual {v4}, Ll/vwt;->s3()Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    iget-object v5, v3, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 60
    .line 61
    iget v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->redDotNum:I

    .line 62
    .line 63
    invoke-virtual {p0, v2, v4, v5}, Ll/bys;->W2([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;->needShowActivitiesRedDot()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-virtual {p0}, Ll/bys;->b3()Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    const-string v5, "redDot"

    .line 75
    .line 76
    invoke-static {v5}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    invoke-virtual {p0, v2, v6, v0}, Ll/bys;->W2([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 81
    .line 82
    .line 83
    invoke-static {v5}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p0, v2, v0, v4}, Ll/bys;->W2([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 88
    .line 89
    .line 90
    invoke-static {v5}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p0, v2, v0, p1}, Ll/bys;->W2([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 95
    .line 96
    .line 97
    new-instance p1, Ll/jcs;

    .line 98
    .line 99
    invoke-direct {p1}, Ll/jcs;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Ljava/lang/Boolean;

    .line 107
    .line 108
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    const/4 v0, 0x1

    .line 113
    if-eqz p1, :cond_4

    .line 114
    .line 115
    sget-object p1, Ll/itd0;->c:Ll/itd0;

    .line 116
    .line 117
    invoke-static {p1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    check-cast p1, Ll/gm3;

    .line 122
    .line 123
    invoke-virtual {p1}, Ll/gm3;->f()Ljava/lang/Integer;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    if-eqz p1, :cond_4

    .line 128
    .line 129
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    if-lez v4, :cond_3

    .line 134
    .line 135
    sget-object v4, Ll/tbs;->b:Ll/vwt;

    .line 136
    .line 137
    invoke-virtual {v4}, Ll/vwt;->V5()Z

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    if-eqz v4, :cond_1

    .line 142
    .line 143
    const-string v4, "number"

    .line 144
    .line 145
    invoke-static {v4}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    invoke-virtual {p0, v2, v4, p1}, Ll/bys;->W2([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_1
    invoke-static {v5}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-lez p1, :cond_2

    .line 166
    .line 167
    move p1, v0

    .line 168
    goto :goto_0

    .line 169
    :cond_2
    move p1, v1

    .line 170
    :goto_0
    invoke-virtual {p0, v2, v4, p1}, Ll/bys;->W2([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 171
    .line 172
    .line 173
    :cond_3
    :goto_1
    invoke-virtual {p0}, Ll/bys;->X2()Z

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    if-eqz p1, :cond_4

    .line 178
    .line 179
    sget-object p1, Ll/itd0;->e:Ll/itd0;

    .line 180
    .line 181
    invoke-static {p1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    check-cast p1, Ll/fm3;

    .line 186
    .line 187
    iget-object p1, p1, Ll/fm3;->f:Ll/byd0;

    .line 188
    .line 189
    invoke-static {}, Ll/pzi0;->o()J

    .line 190
    .line 191
    .line 192
    move-result-wide v6

    .line 193
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    invoke-virtual {p1, v4}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    invoke-static {v5}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-virtual {p0, v2, p1, v0}, Ll/bys;->W2([ILcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 205
    .line 206
    .line 207
    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 208
    .line 209
    const-string v4, "result:["

    .line 210
    .line 211
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    aget v1, v2, v1

    .line 215
    .line 216
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    const-string v1, "-"

    .line 220
    .line 221
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    aget v0, v2, v0

    .line 225
    .line 226
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    const/4 v0, 0x2

    .line 233
    aget v0, v2, v0

    .line 234
    .line 235
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    const/4 v0, 0x3

    .line 242
    aget v0, v2, v0

    .line 243
    .line 244
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    const-string v0, "]"

    .line 248
    .line 249
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->toJson()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    invoke-virtual {p0, v3, v2}, Ll/bys;->e3(Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;[I)V

    .line 256
    .line 257
    .line 258
    return-void

    .line 259
    :cond_5
    :goto_2
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 264
    .line 265
    invoke-static {v0, v2, p1}, Ll/mbs;->X(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    invoke-static {p0, v2, v1}, Ll/mbs;->Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 273
    .line 274
    .line 275
    return-void
.end method

.method public final g3(II)V
    .locals 2

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/fk3;->t()Ll/lc3;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/lc3;->b()Ll/lc3;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_0
    const/4 v1, -0x1

    .line 20
    invoke-virtual {v0, p1, v1, p2, v1}, Ll/lc3;->c(IIII)V

    .line 21
    .line 22
    .line 23
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/fk3;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/fk3;->R(Ll/lc3;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final h3(Ljava/lang/Integer;)V
    .locals 3

    .line 1
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ll/gm3;

    .line 8
    .line 9
    iget-object v1, v1, Ll/gm3;->a:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {v1}, Lrx/subjects/a;->i()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/gm3;

    .line 22
    .line 23
    iget-object v1, v1, Ll/gm3;->i:Lrx/subjects/a;

    .line 24
    .line 25
    invoke-virtual {v1}, Lrx/subjects/a;->i()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ll/gm3;

    .line 36
    .line 37
    iget-object v1, v1, Ll/gm3;->a:Lrx/subjects/a;

    .line 38
    .line 39
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    .line 44
    .line 45
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ll/gm3;

    .line 50
    .line 51
    iget-object v0, v0, Ll/gm3;->i:Lrx/subjects/a;

    .line 52
    .line 53
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Ljava/lang/Boolean;

    .line 58
    .line 59
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_0

    .line 68
    .line 69
    iget-object p1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 70
    .line 71
    if-eqz p1, :cond_0

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 78
    .line 79
    iget-object v2, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast v2, Ljava/lang/Boolean;

    .line 82
    .line 83
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    invoke-static {p1, v1, v2}, Ll/mbs;->X(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ll/txs;->act()Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    const/4 v2, 0x0

    .line 95
    invoke-static {p1, v1, v2}, Ll/mbs;->Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 96
    .line 97
    .line 98
    :cond_0
    iget-object p1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 99
    .line 100
    if-eqz p1, :cond_1

    .line 101
    .line 102
    iget-object p1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 103
    .line 104
    if-eqz p1, :cond_1

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Ll/bys;->f3(Landroid/util/Pair;)V

    .line 107
    .line 108
    .line 109
    :cond_1
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
