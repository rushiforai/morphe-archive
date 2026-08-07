.class public Ll/ov4;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lv/VText;Lcom/p1/mobile/putong/core/api/c0$b;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/api/c0$b;->d:J

    .line 7
    .line 8
    invoke-static {}, Ll/pzi0;->o()J

    .line 9
    .line 10
    .line 11
    move-result-wide v3

    .line 12
    sub-long/2addr v1, v3

    .line 13
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/core/api/c0;->l(J)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p1, "\u540e\u7ed3\u675f\uff0c\u671f\u95f4\u4e0d\u80fd\u548c\u5176\u4ed6\u597d\u53cb\u804a\u5929\u54e6"

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic b(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/cn7;->n3(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d([JLv/VText;Ljava/lang/String;[Ll/jl80;Lcom/p1/mobile/putong/core/data/CoreBoxData;)V
    .locals 8

    .line 1
    iget-object v0, p4, Lcom/p1/mobile/putong/core/data/CoreBoxData;->box:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p4, Lcom/p1/mobile/putong/core/data/CoreBoxData;->box:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 15
    .line 16
    iget-wide v4, v0, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 17
    .line 18
    double-to-long v4, v4

    .line 19
    invoke-static {}, Ll/pzi0;->o()J

    .line 20
    .line 21
    .line 22
    move-result-wide v6

    .line 23
    sub-long/2addr v4, v6

    .line 24
    cmp-long v0, v4, v1

    .line 25
    .line 26
    if-lez v0, :cond_0

    .line 27
    .line 28
    iget-object p3, p4, Lcom/p1/mobile/putong/core/data/CoreBoxData;->box:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p3, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 31
    .line 32
    iget-wide v0, p3, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 33
    .line 34
    double-to-long v0, v0

    .line 35
    invoke-static {}, Ll/pzi0;->o()J

    .line 36
    .line 37
    .line 38
    move-result-wide v4

    .line 39
    sub-long/2addr v0, v4

    .line 40
    const-wide/32 v4, 0xea60

    .line 41
    .line 42
    .line 43
    div-long/2addr v0, v4

    .line 44
    aput-wide v0, p0, v3

    .line 45
    .line 46
    new-instance p0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    iget-object p3, p4, Lcom/p1/mobile/putong/core/data/CoreBoxData;->box:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast p3, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 54
    .line 55
    iget-wide v0, p3, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 56
    .line 57
    double-to-long v0, v0

    .line 58
    invoke-static {}, Ll/pzi0;->o()J

    .line 59
    .line 60
    .line 61
    move-result-wide v2

    .line 62
    sub-long/2addr v0, v2

    .line 63
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/api/c0;->l(J)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string p3, "\u540e\u7ed3\u675f\uff0c\u671f\u95f4\u4e0d\u80fd\u548c\u5176\u4ed6\u597d\u53cb\u804a\u5929\u54e6"

    .line 71
    .line 72
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    new-instance p0, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 83
    .line 84
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 85
    .line 86
    .line 87
    const/4 p1, 0x1

    .line 88
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    const-string v1, "current_exclusive_progress_"

    .line 95
    .line 96
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/api/c0$a;->e(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iget-object p2, p4, Lcom/p1/mobile/putong/core/data/CoreBoxData;->box:Ljava/lang/Object;

    .line 115
    .line 116
    check-cast p2, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 117
    .line 118
    iget-wide p2, p2, Lcom/p1/mobile/putong/core/data/ChatHeat;->exclusiveChatEndTime:D

    .line 119
    .line 120
    double-to-long p2, p2

    .line 121
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 122
    .line 123
    .line 124
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 125
    .line 126
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 127
    .line 128
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_0
    aget-object p1, p3, v3

    .line 133
    .line 134
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-eqz p1, :cond_1

    .line 139
    .line 140
    aget-object p1, p3, v3

    .line 141
    .line 142
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-eqz p1, :cond_1

    .line 147
    .line 148
    aget-object p1, p3, v3

    .line 149
    .line 150
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 151
    .line 152
    .line 153
    :cond_1
    aput-wide v1, p0, v3

    .line 154
    .line 155
    return-void
.end method

.method public static synthetic e(Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;[J)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ov4;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    aget-wide p0, p2, p0

    .line 6
    .line 7
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "private_chat_remaining_time"

    .line 12
    .line 13
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    filled-new-array {p0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "e_end_private_chat_button"

    .line 22
    .line 23
    const-string p2, "p_during_private_chat"

    .line 24
    .line 25
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic g(Ll/l4g0;[Ll/kcg0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    aget-object p0, p1, p0

    .line 6
    .line 7
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    aget-object p0, p1, p0

    .line 12
    .line 13
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x2

    .line 17
    aget-object p0, p1, p0

    .line 18
    .line 19
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic h()V
    .locals 0

    .line 1
    return-void
.end method

.method public static i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "\u662f\u5426\u63d0\u524d\u7ed3\u675f\u4e13\u5c5e\u804a\u5929\uff1f"

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 9
    .line 10
    .line 11
    const-string p0, "\u5728\u60f3\u60f3"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v1, Ll/mv4;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/mv4;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 23
    .line 24
    .line 25
    const-string p0, "\u7ed3\u675f"

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v1, Ll/nv4;

    .line 32
    .line 33
    invoke-direct {v1, p1}, Ll/nv4;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static j(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;)V
    .locals 12

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_during_private_chat"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->ENTER_CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 14
    .line 15
    const-string v2, "during_private_chat_show_from"

    .line 16
    .line 17
    if-ne p2, v1, :cond_0

    .line 18
    .line 19
    const-string p2, "click_private_chat_entrance"

    .line 20
    .line 21
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    filled-new-array {p2}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {v0, p2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-string p2, "send_message_to_others"

    .line 34
    .line 35
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    filled-new-array {p2}, [Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {v0, p2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    :goto_0
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    sget v2, Ll/qec0;->R3:I

    .line 58
    .line 59
    const/4 v3, 0x0

    .line 60
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    sget v2, Ll/edc0;->v0:I

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Lv/VText;

    .line 71
    .line 72
    sget v3, Ll/edc0;->n4:I

    .line 73
    .line 74
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Lv/VText;

    .line 79
    .line 80
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    const/4 v4, 0x1

    .line 85
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 86
    .line 87
    .line 88
    sget v2, Ll/edc0;->t1:I

    .line 89
    .line 90
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    check-cast v2, Lv/VDraweeView;

    .line 95
    .line 96
    sget v5, Ll/edc0;->v1:I

    .line 97
    .line 98
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    check-cast v5, Lv/VDraweeView;

    .line 103
    .line 104
    sget-object v6, Ll/uqb0;->G:Ll/fsb0;

    .line 105
    .line 106
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 107
    .line 108
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 109
    .line 110
    invoke-virtual {v7}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 111
    .line 112
    .line 113
    move-result-object v7

    .line 114
    invoke-static {v7}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 115
    .line 116
    .line 117
    move-result-object v7

    .line 118
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 119
    .line 120
    .line 121
    move-result-object v7

    .line 122
    invoke-virtual {v6, v2, v7}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 123
    .line 124
    .line 125
    new-array v2, v4, [J

    .line 126
    .line 127
    const-wide/16 v6, 0x0

    .line 128
    .line 129
    const/4 v8, 0x0

    .line 130
    aput-wide v6, v2, v8

    .line 131
    .line 132
    new-array v6, v4, [Ll/jl80;

    .line 133
    .line 134
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 135
    .line 136
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 137
    .line 138
    invoke-virtual {v7, p1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object v7

    .line 142
    invoke-virtual {p0, v7}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object v7

    .line 146
    new-instance v9, Ll/gv4;

    .line 147
    .line 148
    invoke-direct {v9, v5}, Ll/gv4;-><init>(Lv/VDraweeView;)V

    .line 149
    .line 150
    .line 151
    invoke-static {v9}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    invoke-virtual {v7, v5}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 160
    .line 161
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 162
    .line 163
    invoke-virtual {v7, p1}, Ll/cn7;->t3(Ljava/lang/String;)Lrx/c;

    .line 164
    .line 165
    .line 166
    move-result-object v7

    .line 167
    invoke-virtual {v7}, Lrx/c;->first()Lrx/c;

    .line 168
    .line 169
    .line 170
    move-result-object v7

    .line 171
    invoke-virtual {p0, v7}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 172
    .line 173
    .line 174
    move-result-object v7

    .line 175
    new-instance v9, Ll/hv4;

    .line 176
    .line 177
    invoke-direct {v9, v2, v3, p1, v6}, Ll/hv4;-><init>([JLv/VText;Ljava/lang/String;[Ll/jl80;)V

    .line 178
    .line 179
    .line 180
    invoke-static {v9}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 181
    .line 182
    .line 183
    move-result-object v9

    .line 184
    invoke-virtual {v7, v9}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 185
    .line 186
    .line 187
    move-result-object v7

    .line 188
    sget-object v9, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 189
    .line 190
    iget-object v9, v9, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 191
    .line 192
    new-instance v10, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    const-string v11, "current_exclusive_progress_"

    .line 195
    .line 196
    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v10

    .line 206
    invoke-virtual {v9, v10}, Lcom/p1/mobile/putong/core/api/c0;->n(Ljava/lang/String;)Lrx/c;

    .line 207
    .line 208
    .line 209
    move-result-object v9

    .line 210
    invoke-virtual {p0, v9}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 211
    .line 212
    .line 213
    move-result-object v9

    .line 214
    new-instance v10, Ll/iv4;

    .line 215
    .line 216
    invoke-direct {v10, v3}, Ll/iv4;-><init>(Lv/VText;)V

    .line 217
    .line 218
    .line 219
    invoke-static {v10}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 220
    .line 221
    .line 222
    move-result-object v3

    .line 223
    invoke-virtual {v9, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    const/4 v9, 0x3

    .line 228
    new-array v9, v9, [Ll/kcg0;

    .line 229
    .line 230
    aput-object v5, v9, v8

    .line 231
    .line 232
    aput-object v7, v9, v4

    .line 233
    .line 234
    const/4 v4, 0x2

    .line 235
    aput-object v3, v9, v4

    .line 236
    .line 237
    invoke-virtual {p2, v1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 238
    .line 239
    .line 240
    new-instance v1, Ll/jv4;

    .line 241
    .line 242
    invoke-direct {v1, v0, v9}, Ll/jv4;-><init>(Ll/l4g0;[Ll/kcg0;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {p2, v1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 246
    .line 247
    .line 248
    new-instance v0, Ll/kv4;

    .line 249
    .line 250
    invoke-direct {v0}, Ll/kv4;-><init>()V

    .line 251
    .line 252
    .line 253
    const-string v1, "\u77e5\u9053\u4e86"

    .line 254
    .line 255
    invoke-virtual {p2, v1, v0}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    new-instance v1, Ll/lv4;

    .line 260
    .line 261
    invoke-direct {v1, p0, p1, v2}, Ll/lv4;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;[J)V

    .line 262
    .line 263
    .line 264
    const-string p0, "\u63d0\u524d\u7ed3\u675f\u4e13\u5c5e\u804a\u5929"

    .line 265
    .line 266
    invoke-virtual {v0, p0, v1}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 267
    .line 268
    .line 269
    invoke-virtual {p2}, Ll/jl80$a;->r0()Ll/jl80;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    aput-object p0, v6, v8

    .line 274
    .line 275
    return-void
.end method
