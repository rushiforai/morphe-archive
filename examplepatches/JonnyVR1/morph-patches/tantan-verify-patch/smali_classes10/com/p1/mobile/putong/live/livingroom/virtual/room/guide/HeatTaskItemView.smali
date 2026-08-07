.class public final Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J!\u0010\r\u001a\u00020\u000c2\u0006\u0010\t\u001a\u00020\u00082\n\u0010\u000b\u001a\u0006\u0012\u0002\u0008\u00030\n\u00a2\u0006\u0004\u0008\r\u0010\u000eJ#\u0010\u000f\u001a\u00020\u000c2\u0006\u0010\t\u001a\u00020\u00082\n\u0010\u000b\u001a\u0006\u0012\u0002\u0008\u00030\nH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u000e\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;",
        "item",
        "Ll/i1l;",
        "presenter",
        "",
        "j0",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;Ll/i1l;)V",
        "k0",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static i0(Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;Ll/i1l;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;Ll/i1l;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->isDone()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->buttonToast:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_5

    .line 17
    .line 18
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->buttonToast:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->type:Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTaskType;

    .line 25
    .line 26
    const-string p3, "call"

    .line 27
    .line 28
    invoke-static {p0, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    invoke-virtual {p2, p1}, Ll/i1l;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->type:Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTaskType;

    .line 39
    .line 40
    const-string p3, "notifyFans"

    .line 41
    .line 42
    invoke-static {p0, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    invoke-virtual {p2, p1}, Ll/i1l;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->type:Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTaskType;

    .line 53
    .line 54
    const-string p3, "notifySettled"

    .line 55
    .line 56
    invoke-static {p0, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_3

    .line 61
    .line 62
    invoke-virtual {p2}, Ll/i1l;->j4()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->type:Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTaskType;

    .line 67
    .line 68
    const-string p3, "shareRoom"

    .line 69
    .line 70
    invoke-static {p0, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_4

    .line 75
    .line 76
    invoke-virtual {p2}, Ll/i1l;->l4()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->type:Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTaskType;

    .line 81
    .line 82
    const-string p3, "starRedPacket"

    .line 83
    .line 84
    invoke-static {p0, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-eqz p0, :cond_5

    .line 89
    .line 90
    invoke-virtual {p2, p1}, Ll/i1l;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;)V

    .line 91
    .line 92
    .line 93
    :cond_5
    return-void
.end method


# virtual methods
.method public final j0(Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;Ll/i1l;)V
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/i1l;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;",
            "Ll/i1l<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->f:Lv/VText;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->name:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->g:Lv/VText;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->description:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->h:Lv/VText;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->buttonName:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->buttonTip:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->i:Lv/VText;

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    const/4 v3, 0x0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->i:Lv/VText;

    .line 48
    .line 49
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->buttonTip:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->isDone()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->h:Lv/VText;

    .line 59
    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    sget v0, Ll/obc0;->T0:I

    .line 63
    .line 64
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    sget v0, Ll/obc0;->o0:I

    .line 69
    .line 70
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 71
    .line 72
    .line 73
    :goto_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->type:Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTaskType;

    .line 74
    .line 75
    const-string v1, "notifySettled"

    .line 76
    .line 77
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    invoke-virtual {p2}, Ll/i1l;->g4()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_3

    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->h:Lv/VText;

    .line 90
    .line 91
    const-string v1, "\u5df2\u53ec\u5524"

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->h:Lv/VText;

    .line 97
    .line 98
    sget v1, Ll/obc0;->T0:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->h:Lv/VText;

    .line 104
    .line 105
    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 106
    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->h:Lv/VText;

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 112
    .line 113
    .line 114
    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->e:Lv/VDraweeView;

    .line 115
    .line 116
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->icon:Ljava/lang/String;

    .line 117
    .line 118
    sget v2, Ll/qa00;->D:I

    .line 119
    .line 120
    const-string v3, "context_single_room"

    .line 121
    .line 122
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->getRoot()Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    new-instance v1, Ll/p0l;

    .line 130
    .line 131
    invoke-direct {v1, p0, p1, p2}, Ll/p0l;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;Ll/i1l;)V

    .line 132
    .line 133
    .line 134
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public final k0(Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;Ll/i1l;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;",
            "Ll/i1l<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->type:Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTaskType;

    .line 2
    .line 3
    const-string v0, "call"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p2, p1}, Ll/meo0;->i(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->type:Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTaskType;

    .line 16
    .line 17
    const-string v0, "notifyFans"

    .line 18
    .line 19
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-static {p2, p1}, Ll/meo0;->c(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->type:Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTaskType;

    .line 30
    .line 31
    const-string v0, "notifySettled"

    .line 32
    .line 33
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    invoke-virtual {p2}, Ll/i1l;->g4()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-static {p2, p0}, Ll/meo0;->f(Ll/i6t;Z)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->type:Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTaskType;

    .line 48
    .line 49
    const-string v0, "shareRoom"

    .line 50
    .line 51
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_3

    .line 56
    .line 57
    invoke-static {p2}, Ll/meo0;->j(Ll/i6t;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->type:Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTaskType;

    .line 62
    .line 63
    const-string p1, "starRedPacket"

    .line 64
    .line 65
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_4

    .line 70
    .line 71
    sget-object p0, Ll/meo0;->INSTANCE:Ll/meo0;

    .line 72
    .line 73
    invoke-virtual {p0, p2}, Ll/meo0;->g(Ll/i1l;)V

    .line 74
    .line 75
    .line 76
    :cond_4
    return-void
.end method
