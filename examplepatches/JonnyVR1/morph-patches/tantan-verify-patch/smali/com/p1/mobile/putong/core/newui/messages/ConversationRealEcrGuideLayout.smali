.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;

.field public d:Lv/VFrame;

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;

.field public h:Lv/VDraweeView;

.field public i:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public j:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/android/app/Act;Ll/bkj0;Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p2, Ll/qmc0;

    .line 2
    .line 3
    invoke-direct {p2, p0}, Ll/qmc0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Ll/qmc0;->show()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Ll/vg60;

    .line 12
    .line 13
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {}, Ll/gra;->Q0()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "match_status"

    .line 32
    .line 33
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    filled-new-array {p0}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "e_messages_verify_guide"

    .line 42
    .line 43
    const-string p2, "p_messages_view"

    .line 44
    .line 45
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic Q(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;Lcom/p1/mobile/android/app/Act;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;->X(Lcom/p1/mobile/android/app/Act;Ll/bkj0;)V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lrx/c;
    .locals 5

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-virtual {p0, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 10
    .line 11
    .line 12
    const/16 v0, 0xb

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p0, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 16
    .line 17
    .line 18
    const/16 v0, 0xc

    .line 19
    .line 20
    invoke-virtual {p0, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 21
    .line 22
    .line 23
    const/16 v0, 0xd

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 26
    .line 27
    .line 28
    const/16 v0, 0xe

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 31
    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 36
    .line 37
    const-string v1, "svip"

    .line 38
    .line 39
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 60
    .line 61
    .line 62
    move-result-wide v3

    .line 63
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/core/api/g;->aq(J)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Lrx/c;->onBackpressureDrop()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    new-instance v2, Ll/xj6;

    .line 72
    .line 73
    invoke-direct {v2}, Ll/xj6;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-static {v0, v1, p0, v2}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0
.end method


# virtual methods
.method public final V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zj6;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public W(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 3
    .line 4
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o7()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/tj6;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/tj6;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/uj6;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/uj6;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/vj6;

    .line 43
    .line 44
    invoke-direct {v1, p0, p1}, Ll/vj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;Lcom/p1/mobile/android/app/Act;)V

    .line 45
    .line 46
    .line 47
    new-instance p0, Ll/wj6;

    .line 48
    .line 49
    invoke-direct {p0}, Ll/wj6;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic X(Lcom/p1/mobile/android/app/Act;Ll/bkj0;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/aw90;->R()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v1, Ll/vg60;

    .line 21
    .line 22
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    iget-object v1, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v1, Ll/vg60;

    .line 33
    .line 34
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-static {}, Ll/gra;->Q0()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-lt v1, v3, :cond_0

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;->d:Lv/VFrame;

    .line 47
    .line 48
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;->e:Lv/VDraweeView;

    .line 52
    .line 53
    iget-object v3, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v3, Ll/vg60;

    .line 56
    .line 57
    iget-object v3, v3, Ll/vg60;->a:Ljava/util/List;

    .line 58
    .line 59
    invoke-virtual {p0, v1, v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;->Y(Lv/VDraweeView;ILjava/util/List;)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;->f:Lv/VDraweeView;

    .line 63
    .line 64
    iget-object v2, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v2, Ll/vg60;

    .line 67
    .line 68
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 69
    .line 70
    invoke-virtual {p0, v1, v0, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;->Y(Lv/VDraweeView;ILjava/util/List;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;->g:Lv/VDraweeView;

    .line 74
    .line 75
    iget-object v1, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v1, Ll/vg60;

    .line 78
    .line 79
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 80
    .line 81
    const/4 v2, 0x2

    .line 82
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;->Y(Lv/VDraweeView;ILjava/util/List;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;->d:Lv/VFrame;

    .line 87
    .line 88
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;->j:Lv/VText;

    .line 92
    .line 93
    const-string v1, "\u8ba4\u8bc1\u540e\u914d\u5bf9\u65e0\u4e0a\u9650"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    new-instance v0, Ll/yj6;

    .line 99
    .line 100
    invoke-direct {v0, p1, p2}, Ll/yj6;-><init>(Lcom/p1/mobile/android/app/Act;Ll/bkj0;)V

    .line 101
    .line 102
    .line 103
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;->i:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 107
    .line 108
    new-instance p1, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    const-string v0, "\u672a\u8ba4\u8bc1\u6bcf\u65e5\u914d\u5bf9\u4e0a\u9650"

    .line 111
    .line 112
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-static {}, Ll/gra;->Q0()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string v0, "\u6b21"

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    .line 133
    .line 134
    iget-object p0, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 135
    .line 136
    check-cast p0, Ll/vg60;

    .line 137
    .line 138
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 139
    .line 140
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    invoke-static {}, Ll/gra;->Q0()I

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    const-string p1, "match_status"

    .line 157
    .line 158
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    filled-new-array {p0}, [Ll/pf60;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    const-string p1, "e_messages_verify_guide"

    .line 167
    .line 168
    const-string p2, "p_messages_view"

    .line 169
    .line 170
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_1
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public final Y(Lv/VDraweeView;ILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv/VDraweeView;",
            "I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {}, Ll/gra;->Q0()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    if-ge p2, p0, :cond_2

    .line 15
    .line 16
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 21
    .line 22
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p2, p0}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const/4 p3, 0x1

    .line 55
    invoke-virtual {p2, p1, p0, p3}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    :goto_0
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 60
    .line 61
    sget p2, Ll/dbc0;->i0:I

    .line 62
    .line 63
    invoke-virtual {p0, p1, p2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 68
    .line 69
    .line 70
    sget p0, Ll/dbc0;->x4:I

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRealEcrGuideLayout;->V(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
