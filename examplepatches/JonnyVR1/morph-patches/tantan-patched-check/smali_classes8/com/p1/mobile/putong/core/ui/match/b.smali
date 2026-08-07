.class public Lcom/p1/mobile/putong/core/ui/match/b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:Lcom/p1/mobile/putong/core/ui/match/b;


# instance fields
.field public a:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/match/b;->a:I

    .line 6
    .line 7
    return-void
.end method

.method public static A(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;Ll/y20;Ljava/lang/String;)V
    .locals 7
    .param p3    # Ll/x20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/String;",
            "Ll/x20;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "coin"

    .line 2
    .line 3
    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 12
    .line 13
    const-string v1, "instantChat"

    .line 14
    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/lqb;->s4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string v0, ""

    .line 25
    .line 26
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->P1:Ll/e59;

    .line 29
    .line 30
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v1, v2, p2, v0}, Ll/e59;->n3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/mp50;

    .line 41
    .line 42
    move-object v5, p0

    .line 43
    move-object v4, p1

    .line 44
    move-object v2, p2

    .line 45
    move-object v6, p3

    .line 46
    move-object v3, p5

    .line 47
    invoke-direct/range {v1 .. v6}, Ll/mp50;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 48
    .line 49
    .line 50
    new-instance p0, Ll/np50;

    .line 51
    .line 52
    invoke-direct {p0, p4, v4}, Ll/np50;-><init>(Ll/y20;Lcom/p1/mobile/putong/data/User;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static B(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 5

    .line 1
    invoke-static {p2}, Ll/a5i0;->N1(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/l4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/lqb;->A4()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    new-instance v2, Ll/ugy$a;

    .line 14
    .line 15
    invoke-direct {v2, p0}, Ll/ugy$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    const-string v3, "\u4e00\u952e\u914d\u5bf9"

    .line 19
    .line 20
    invoke-virtual {v2, v3}, Ll/ugy$a;->D(Ljava/lang/String;)Ll/ugy$a;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v3, "\u672c\u6b21\u4eab\u53d7 %s \u63a2\u63a2\u5e01\u9650\u65f6\u4f18\u60e0\u4ef7\u683c\n\u4e00\u952e\u914d\u5bf9\u7528\u5b8c\u4e86\uff0c\u53ef\u4ee5\u7528\u63a2\u63a2\u5e01\u8d2d\u4e70\u66f4\u591a"

    .line 33
    .line 34
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    sget v3, Ll/c9c0;->I:I

    .line 39
    .line 40
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    const/4 v4, 0x2

    .line 45
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-static {v1, v3, v4}, Ll/q8g0;->N(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v2, v1}, Ll/ugy$a;->C(Ljava/lang/CharSequence;)Ll/ugy$a;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Xp:I

    .line 58
    .line 59
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    new-instance v3, Ll/pp50;

    .line 64
    .line 65
    invoke-direct {v3, p1, p2}, Ll/pp50;-><init>(Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, v2, v3}, Ll/ugy$a;->x(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const/4 p2, 0x0

    .line 73
    invoke-virtual {p1, p2}, Ll/ugy$a;->A(Z)Ll/ugy$a;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    sget p2, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 78
    .line 79
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p1, p0}, Ll/ugy$a;->u(Ljava/lang/CharSequence;)Ll/ugy$a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p1}, Ll/a5i0;->y0()Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    invoke-virtual {p0, p1}, Ll/ugy$a;->z(Z)Ll/ugy$a;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    sget p1, Lcom/p1/mobile/putong/core/R$string;->dm:I

    .line 100
    .line 101
    new-instance p2, Ll/qp50;

    .line 102
    .line 103
    invoke-direct {p2}, Ll/qp50;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, p1, p2}, Ll/ugy$a;->w(ILandroid/widget/CompoundButton$OnCheckedChangeListener;)Ll/ugy$a;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p0}, Ll/ugy$a;->t()Ll/ugy;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    sget p2, Ll/dbc0;->x5:I

    .line 119
    .line 120
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->B(I)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-static {}, Ll/c17;->u0()Z

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    if-eqz p2, :cond_0

    .line 129
    .line 130
    sget p2, Ll/dbc0;->z5:I

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_0
    sget p2, Ll/dbc0;->y5:I

    .line 134
    .line 135
    :goto_0
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->F(I)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0, v0}, Ll/ugy;->m(Ll/l4g0;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0}, Ll/ugy;->n()V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public static C(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "other"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-object v1

    .line 10
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, -0x1

    .line 18
    sparse-switch v0, :sswitch_data_0

    .line 19
    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :sswitch_0
    const-string v0, "home_card"

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 v2, 0x7

    .line 33
    goto :goto_0

    .line 34
    :sswitch_1
    const-string v0, "moment_visitor"

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-nez p0, :cond_2

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    const/4 v2, 0x6

    .line 44
    goto :goto_0

    .line 45
    :sswitch_2
    const-string v0, "from_meet_feed"

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-nez p0, :cond_3

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    const/4 v2, 0x5

    .line 55
    goto :goto_0

    .line 56
    :sswitch_3
    const-string v0, "liked_users"

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-nez p0, :cond_4

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_4
    const/4 v2, 0x4

    .line 66
    goto :goto_0

    .line 67
    :sswitch_4
    const-string v0, "photo_album_feed_from_discover_dating"

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-nez p0, :cond_5

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_5
    const/4 v2, 0x3

    .line 77
    goto :goto_0

    .line 78
    :sswitch_5
    const-string v0, "from_new_meet_picks_feed"

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-nez p0, :cond_6

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_6
    const/4 v2, 0x2

    .line 88
    goto :goto_0

    .line 89
    :sswitch_6
    const-string v0, "from_new_meet_see_feed"

    .line 90
    .line 91
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-nez p0, :cond_7

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_7
    const/4 v2, 0x1

    .line 99
    goto :goto_0

    .line 100
    :sswitch_7
    const-string v0, "from_picks"

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-nez p0, :cond_8

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_8
    const/4 v2, 0x0

    .line 110
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 111
    .line 112
    .line 113
    return-object v1

    .line 114
    :pswitch_0
    const-string p0, "home"

    .line 115
    .line 116
    return-object p0

    .line 117
    :pswitch_1
    const-string p0, "diamond_tab"

    .line 118
    .line 119
    return-object p0

    .line 120
    :pswitch_2
    const-string p0, "iliked"

    .line 121
    .line 122
    return-object p0

    .line 123
    :pswitch_3
    const-string p0, "explore"

    .line 124
    .line 125
    return-object p0

    .line 126
    :pswitch_4
    const-string p0, "meet"

    .line 127
    .line 128
    return-object p0

    .line 129
    :pswitch_5
    const-string p0, "picks"

    .line 130
    .line 131
    return-object p0

    .line 132
    nop

    .line 133
    :sswitch_data_0
    .sparse-switch
        -0x6b21e863 -> :sswitch_7
        -0x536216b2 -> :sswitch_6
        0x31e19b8f -> :sswitch_5
        0x3be77790 -> :sswitch_4
        0x49bdfef6 -> :sswitch_3
        0x5e8b2441 -> :sswitch_2
        0x6a0f5d2f -> :sswitch_1
        0x7e397270 -> :sswitch_0
    .end sparse-switch

    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_5
        :pswitch_3
        :pswitch_2
        :pswitch_4
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic a(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    const-string p5, "privilege"

    .line 2
    .line 3
    invoke-static {p5, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/lqb;->k5()Lrx/c;

    .line 22
    .line 23
    .line 24
    :goto_0
    const-string p0, "home_moment_theme_card"

    .line 25
    .line 26
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 35
    .line 36
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/b0;->U3(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    const-string p0, "p_home,odiamond_sayhi"

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    new-instance p0, Ll/rp50;

    .line 51
    .line 52
    invoke-direct {p0, p2}, Ll/rp50;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 53
    .line 54
    .line 55
    const-wide/16 v0, 0x1f4

    .line 56
    .line 57
    invoke-static {p3, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 64
    .line 65
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->E8(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :goto_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->U9()Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_3

    .line 83
    .line 84
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f2:Ll/y6b;

    .line 87
    .line 88
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ll/y6b;->K3(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 96
    .line 97
    invoke-virtual {p0}, Ll/yna;->E3()Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-eqz p0, :cond_4

    .line 102
    .line 103
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 106
    .line 107
    iget-object p1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Ll/yna;->W3(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :cond_4
    invoke-interface {p4}, Ll/x20;->call()V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ljava/lang/String;)V
    .locals 6

    .line 1
    new-instance v4, Ll/nro;

    .line 2
    .line 3
    invoke-direct {v4}, Ll/nro;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v2, "coin"

    .line 7
    .line 8
    move-object v0, p0

    .line 9
    move-object v1, p1

    .line 10
    move-object v3, p2

    .line 11
    move-object v5, p3

    .line 12
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/match/b;->A(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;Ll/y20;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    filled-new-array {p1}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    const/16 v1, 0x2e

    .line 17
    .line 18
    invoke-static {p0, p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 23
    .line 24
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    invoke-interface {p2}, Ll/x20;->call()V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public static synthetic d(Ll/y20;Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 12
    .line 13
    iget v0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 14
    .line 15
    const v1, 0x9dcf

    .line 16
    .line 17
    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    iget-object p2, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 21
    .line 22
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    const-string p0, "other_user_id"

    .line 26
    .line 27
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    filled-new-array {p0}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p1, "e_odiamond_sayhi_toast"

    .line 38
    .line 39
    const-string p2, "p_suggest_user_profile_info_view"

    .line 40
    .line 41
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    const p1, 0x9d97

    .line 46
    .line 47
    .line 48
    if-ne v0, p1, :cond_1

    .line 49
    .line 50
    const-string p1, "\u4eca\u5929\u7684\u4e00\u952e\u914d\u5bf9\u7528\u5b8c\u4e86\uff0c\u660e\u5929\u518d\u6765\u5427"

    .line 51
    .line 52
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->E8(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic f(Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic g(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a5i0;->K0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    filled-new-array {p1}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    const/16 v1, 0x2e

    .line 17
    .line 18
    invoke-static {p0, p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 23
    .line 24
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    invoke-interface {p2}, Ll/x20;->call()V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public static synthetic i(Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/ugy;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {p1}, Ll/a5i0;->M1(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/a5i0;->T0()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V
    .locals 6

    .line 1
    new-instance v2, Ll/ip50;

    .line 2
    .line 3
    invoke-direct {v2}, Ll/ip50;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v3, Ll/jp50;

    .line 7
    .line 8
    invoke-direct {v3, p2}, Ll/jp50;-><init>(Ll/x20;)V

    .line 9
    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 13
    .line 14
    move-object v0, p0

    .line 15
    move-object v1, p1

    .line 16
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/purchase/c;->a0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/match/b;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/b;->u()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/b;->w()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    :cond_1
    move-object v1, p0

    .line 17
    move-object v5, p2

    .line 18
    goto :goto_0

    .line 19
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    filled-new-array {p1}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->nr()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    new-instance v4, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    move-object v1, p0

    .line 55
    move-object v5, p2

    .line 56
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->n8(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-interface {p1, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hg(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/android/app/Act$w;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {v1, p0, p1}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :goto_0
    new-instance p0, Ll/lp50;

    .line 77
    .line 78
    invoke-direct {p0, v1, p1, p3}, Ll/lp50;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1, p1, p0, v5}, Lcom/p1/mobile/putong/core/ui/match/b;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public static o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/b;->u()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_2

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/b;->w()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const/4 p1, 0x0

    .line 18
    invoke-static {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/match/b;->l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_2
    :goto_0
    new-instance v0, Ll/op50;

    .line 23
    .line 24
    invoke-direct {v0, p0, p1, p3}, Ll/op50;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p0, p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/match/b;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static q()Lcom/p1/mobile/putong/core/ui/match/b;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/match/b;->b:Lcom/p1/mobile/putong/core/ui/match/b;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/core/ui/match/b;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/match/b;->b:Lcom/p1/mobile/putong/core/ui/match/b;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/p1/mobile/putong/core/ui/match/b;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/match/b;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/p1/mobile/putong/core/ui/match/b;->b:Lcom/p1/mobile/putong/core/ui/match/b;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/p1/mobile/putong/core/ui/match/b;->b:Lcom/p1/mobile/putong/core/ui/match/b;

    .line 27
    .line 28
    return-object v0
.end method

.method public static r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, p1, v0, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static s(Landroid/app/Activity;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "-11006"

    .line 6
    .line 7
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->sg(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p0, v1, v0, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public static t()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/joa;->R3()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    return v0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    return v0
.end method

.method public static u()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/joa;->G3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method public static v(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "-11006"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static w()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/joa;->O3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method public static x(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/match/b;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ljava/lang/String;)V
    .locals 12

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->sg(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    move-object v1, p0

    .line 20
    move-object v2, p1

    .line 21
    goto/16 :goto_2

    .line 22
    .line 23
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/b;->t()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    new-instance v5, Ll/nro;

    .line 30
    .line 31
    invoke-direct {v5}, Ll/nro;-><init>()V

    .line 32
    .line 33
    .line 34
    const-string v3, "privilege"

    .line 35
    .line 36
    move-object v1, p0

    .line 37
    move-object v2, p1

    .line 38
    move-object v4, p2

    .line 39
    move-object v6, p3

    .line 40
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/match/b;->A(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;Ll/y20;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    move-object v1, p0

    .line 45
    move-object v2, p1

    .line 46
    move-object v4, p2

    .line 47
    move-object v6, p3

    .line 48
    invoke-static {}, Ll/a5i0;->F()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_4

    .line 53
    .line 54
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ll/a5i0;->d1()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_3

    .line 63
    .line 64
    new-instance p0, Ll/kp50;

    .line 65
    .line 66
    invoke-direct {p0, v1, v2, v4, v6}, Ll/kp50;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 70
    .line 71
    invoke-static {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/match/b;->B(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_3
    new-instance v10, Ll/nro;

    .line 76
    .line 77
    invoke-direct {v10}, Ll/nro;-><init>()V

    .line 78
    .line 79
    .line 80
    const-string v8, "coin"

    .line 81
    .line 82
    move-object v7, v2

    .line 83
    move-object v9, v4

    .line 84
    move-object v11, v6

    .line 85
    move-object v6, v1

    .line 86
    invoke-static/range {v6 .. v11}, Lcom/p1/mobile/putong/core/ui/match/b;->A(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;Ll/y20;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 93
    .line 94
    invoke-virtual {p0}, Ll/lqb;->A4()I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    const-string p1, "p_pay_result,e_odiamond_sayhi,click"

    .line 99
    .line 100
    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_6

    .line 105
    .line 106
    const-string p1, "p_meet_visit,odiamond_sayhi"

    .line 107
    .line 108
    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-eqz p1, :cond_5

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_5
    const-string p3, "p_diamond_tab,e_diamond_sayhi,click"

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_6
    :goto_0
    move-object p3, v6

    .line 119
    :goto_1
    invoke-static {v1, p3, p0}, Ll/a5i0;->q1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :goto_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    const-string p1, "has_im or match == "

    .line 126
    .line 127
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iget-object p1, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    const-string p1, "[onebtnmatch]"

    .line 140
    .line 141
    invoke-static {p1, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/core/ui/match/b;->r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public static z()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Lcom/p1/mobile/putong/core/ui/match/b;->b:Lcom/p1/mobile/putong/core/ui/match/b;

    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public k()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/match/b;->a:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/match/b;->a:I

    .line 6
    .line 7
    return-void
.end method

.method public p()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/match/b;->a:I

    .line 2
    .line 3
    return p0
.end method
