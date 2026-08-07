.class public final Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansBoardMeItemView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualFansBoardItemMeBindings;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u001d\u0010\r\u001a\u00020\u000c2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\r\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansBoardMeItemView;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualFansBoardItemMeBindings;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;",
        "item",
        "Ll/osn0;",
        "listener",
        "",
        "i0",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;Ll/osn0;)V",
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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualFansBoardItemMeBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansBoardMeItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final i0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;Ll/osn0;)V
    .locals 5
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/osn0;
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
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualFansBoardItemMeBindings;->g:Lv/VText;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->name:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualFansBoardItemMeBindings;->e:Lv/VText;

    .line 17
    .line 18
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->rank:J

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/usn0;->e(J)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualFansBoardItemMeBindings;->e:Lv/VText;

    .line 28
    .line 29
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->rank:J

    .line 30
    .line 31
    const-wide/16 v2, 0x63

    .line 32
    .line 33
    cmp-long v2, v0, v2

    .line 34
    .line 35
    const-wide/16 v3, 0x0

    .line 36
    .line 37
    if-gtz v2, :cond_1

    .line 38
    .line 39
    cmp-long v0, v0, v3

    .line 40
    .line 41
    if-gtz v0, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/high16 v0, 0x41900000    # 18.0f

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    :goto_0
    const/high16 v0, 0x41400000    # 12.0f

    .line 48
    .line 49
    :goto_1
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualFansBoardItemMeBindings;->i:Lv/VText;

    .line 53
    .line 54
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->amount:J

    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/usn0;->d(J)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualFansBoardItemMeBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 64
    .line 65
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    const/high16 v0, 0x42920000    # 73.0f

    .line 69
    .line 70
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    invoke-static {p2, p1, v0}, Ll/usn0;->f(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;I)V

    .line 75
    .line 76
    .line 77
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualFansBoardItemMeBindings;->h:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/LiveGenderMedalView;

    .line 78
    .line 79
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->gender:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 84
    .line 85
    .line 86
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 87
    .line 88
    iget-wide v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->age:J

    .line 89
    .line 90
    long-to-int v1, v1

    .line 91
    const/4 v2, 0x1

    .line 92
    invoke-virtual {p2, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/LiveGenderMedalView;->Q(Ljava/lang/String;IZ)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualFansBoardItemMeBindings;->i:Lv/VText;

    .line 96
    .line 97
    iget-wide p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->amount:J

    .line 98
    .line 99
    cmp-long p1, p1, v3

    .line 100
    .line 101
    if-gtz p1, :cond_2

    .line 102
    .line 103
    sget p1, Ll/n9c0;->m1:I

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_2
    sget p1, Ll/n9c0;->p0:I

    .line 107
    .line 108
    :goto_2
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 113
    .line 114
    .line 115
    return-void
.end method
