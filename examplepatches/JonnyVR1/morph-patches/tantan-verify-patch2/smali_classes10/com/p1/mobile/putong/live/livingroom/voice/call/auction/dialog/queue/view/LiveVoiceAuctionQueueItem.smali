.class public final Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/queue/view/LiveVoiceAuctionQueueItem;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0015\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\'\u0010\u0013\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0017\u0010\u0017\u001a\u00020\n2\u0006\u0010\u0016\u001a\u00020\u0015H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/queue/view/LiveVoiceAuctionQueueItem;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "Ll/fpm0;",
        "model",
        "",
        "h",
        "(Ll/fpm0;)V",
        "",
        "isFemale",
        "",
        "age",
        "Landroid/widget/TextView;",
        "tv_age",
        "i",
        "(ZILandroid/widget/TextView;)V",
        "",
        "role",
        "g",
        "(Ljava/lang/String;)V",
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
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/queue/view/LiveVoiceAuctionQueueItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static b(Ll/fpm0;Landroid/view/View;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fpm0;->H()Ll/z20;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const-string v0, "reject"

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/fpm0;->J()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p1, v0, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 20
    .line 21
    return-object p0
.end method

.method public static c(Ll/fpm0;Landroid/view/View;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fpm0;->H()Ll/z20;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const-string v0, "accept"

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/fpm0;->J()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p1, v0, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 20
    .line 21
    return-object p0
.end method

.method public static d(Ll/fpm0;Landroid/view/View;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fpm0;->H()Ll/z20;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const-string v0, "invite"

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/fpm0;->J()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p1, v0, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 20
    .line 21
    return-object p0
.end method

.method public static e(Ll/fpm0;Landroid/view/View;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fpm0;->H()Ll/z20;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const-string v0, "abort"

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/fpm0;->J()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p1, v0, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 20
    .line 21
    return-object p0
.end method

.method public static f(Ll/fpm0;Landroid/view/View;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fpm0;->H()Ll/z20;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const-string v0, "apply"

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/fpm0;->J()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p1, v0, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 20
    .line 21
    return-object p0
.end method


# virtual methods
.method public final g(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "anchor"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    const-string v1, "manager"

    .line 10
    .line 11
    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->e:Lv/VText;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->e:Lv/VText;

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->e:Lv/VText;

    .line 36
    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    const-string p1, "\u623f\u4e3b"

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    const-string p1, "\u7ba1\u7406"

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->e:Lv/VText;

    .line 51
    .line 52
    const-string p1, "#f89438"

    .line 53
    .line 54
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    const/4 v0, 0x4

    .line 59
    invoke-static {p1, v0}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final h(Ll/fpm0;)V
    .locals 5
    .param p1    # Ll/fpm0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/fpm0;->J()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ll/fpm0;->I()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "apply"

    .line 18
    .line 19
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->f:Landroid/widget/TextView;

    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->f:Landroid/widget/TextView;

    .line 32
    .line 33
    const-string v3, "\u62d2\u7edd"

    .line 34
    .line 35
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->f:Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    new-instance v3, Ll/i3v;

    .line 44
    .line 45
    invoke-direct {v3, p1}, Ll/i3v;-><init>(Ll/fpm0;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1, v3}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->g:Landroid/widget/TextView;

    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->g:Landroid/widget/TextView;

    .line 57
    .line 58
    const-string v2, "\u901a\u8fc7"

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->g:Landroid/widget/TextView;

    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    new-instance v2, Ll/j3v;

    .line 69
    .line 70
    invoke-direct {v2, p1}, Ll/j3v;-><init>(Ll/fpm0;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v1, v2}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 74
    .line 75
    .line 76
    goto/16 :goto_0

    .line 77
    .line 78
    :cond_0
    invoke-virtual {p1}, Ll/fpm0;->I()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    const-string v3, "invite"

    .line 83
    .line 84
    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    const/4 v3, 0x0

    .line 89
    if-eqz v1, :cond_3

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->f:Landroid/widget/TextView;

    .line 92
    .line 93
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->g:Landroid/widget/TextView;

    .line 97
    .line 98
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->userId:Ljava/lang/String;

    .line 102
    .line 103
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 104
    .line 105
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_1

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->g:Landroid/widget/TextView;

    .line 116
    .line 117
    const-string v2, "\u4e0a\u62cd"

    .line 118
    .line 119
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->g:Landroid/widget/TextView;

    .line 123
    .line 124
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 125
    .line 126
    .line 127
    new-instance v2, Ll/k3v;

    .line 128
    .line 129
    invoke-direct {v2, p1}, Ll/k3v;-><init>(Ll/fpm0;)V

    .line 130
    .line 131
    .line 132
    invoke-static {v1, v2}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_1
    invoke-virtual {p1}, Ll/fpm0;->J()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;->state:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionInviteState;

    .line 141
    .line 142
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    const-string v2, "invited"

    .line 147
    .line 148
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->g:Landroid/widget/TextView;

    .line 153
    .line 154
    if-eqz v1, :cond_2

    .line 155
    .line 156
    const-string v1, "\u5df2\u9080\u8bf7"

    .line 157
    .line 158
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_2
    const-string v1, "\u9080\u8bf7"

    .line 163
    .line 164
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    .line 166
    .line 167
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->g:Landroid/widget/TextView;

    .line 168
    .line 169
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 170
    .line 171
    .line 172
    new-instance v2, Ll/l3v;

    .line 173
    .line 174
    invoke-direct {v2, p1}, Ll/l3v;-><init>(Ll/fpm0;)V

    .line 175
    .line 176
    .line 177
    invoke-static {v1, v2}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 178
    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_3
    invoke-virtual {p1}, Ll/fpm0;->I()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    const-string v4, "list"

    .line 186
    .line 187
    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    if-eqz v1, :cond_4

    .line 192
    .line 193
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->f:Landroid/widget/TextView;

    .line 194
    .line 195
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 196
    .line 197
    .line 198
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->f:Landroid/widget/TextView;

    .line 199
    .line 200
    const-string v2, "\u53d6\u6d88"

    .line 201
    .line 202
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 203
    .line 204
    .line 205
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->f:Landroid/widget/TextView;

    .line 206
    .line 207
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 208
    .line 209
    .line 210
    new-instance v2, Ll/m3v;

    .line 211
    .line 212
    invoke-direct {v2, p1}, Ll/m3v;-><init>(Ll/fpm0;)V

    .line 213
    .line 214
    .line 215
    invoke-static {v1, v2}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 216
    .line 217
    .line 218
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->g:Landroid/widget/TextView;

    .line 219
    .line 220
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 221
    .line 222
    .line 223
    :cond_4
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->b:Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 224
    .line 225
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->avatar:Ljava/lang/String;

    .line 226
    .line 227
    sget v3, Ll/qa00;->A:I

    .line 228
    .line 229
    const-string v4, "context_single_room"

    .line 230
    .line 231
    invoke-static {v4, v1, v2, v3}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 232
    .line 233
    .line 234
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->c:Lv/VText;

    .line 235
    .line 236
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->userName:Ljava/lang/String;

    .line 237
    .line 238
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 239
    .line 240
    .line 241
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->gender:Ljava/lang/String;

    .line 242
    .line 243
    const-string v2, "female"

    .line 244
    .line 245
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->age:I

    .line 250
    .line 251
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionQueueItemBindings;->d:Lv/VText;

    .line 252
    .line 253
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 254
    .line 255
    .line 256
    invoke-virtual {p0, v1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/queue/view/LiveVoiceAuctionQueueItem;->i(ZILandroid/widget/TextView;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {p1}, Ll/fpm0;->J()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;->role:Ljava/lang/String;

    .line 264
    .line 265
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 266
    .line 267
    .line 268
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/queue/view/LiveVoiceAuctionQueueItem;->g(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    return-void
.end method

.method public final i(ZILandroid/widget/TextView;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget p0, Ll/obc0;->n0:I

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget p0, Ll/obc0;->D:I

    .line 7
    .line 8
    :goto_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    sget p1, Ll/obc0;->La:I

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_1
    sget p1, Ll/obc0;->Ma:I

    .line 14
    .line 15
    :goto_1
    invoke-static {p1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p3, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p3, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
