.class public Ll/b5c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

.field public b:Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;

.field public c:Ljava/lang/Boolean;

.field public d:Lcom/p1/mobile/putong/core/data/VirtualCardType;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 5
    .line 6
    iput-object v0, p0, Ll/b5c0;->c:Ljava/lang/Boolean;

    .line 7
    .line 8
    iput-object p1, p0, Ll/b5c0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Landroid/view/View;
    .locals 0

    .line 1
    sget p0, Ll/kec0;->K:I

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-virtual {p1, p0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p3, p0, Ll/b5c0;->d:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    iget-object p2, p0, Ll/b5c0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 4
    .line 5
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    iget-object p2, p0, Ll/b5c0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 14
    .line 15
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    iget-object p2, p0, Ll/b5c0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 22
    .line 23
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/b;->P2()V

    .line 26
    .line 27
    .line 28
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;

    .line 29
    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;

    .line 33
    .line 34
    iput-object p1, p0, Ll/b5c0;->b:Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;

    .line 35
    .line 36
    iget-object p2, p0, Ll/b5c0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 37
    .line 38
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyInvitationCardView;->m(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/b5c0;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 3

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, p2, :cond_1

    .line 5
    .line 6
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 7
    .line 8
    if-ne p1, p2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    goto :goto_1

    .line 13
    :cond_1
    :goto_0
    move p1, v0

    .line 14
    :goto_1
    invoke-virtual {p0}, Ll/b5c0;->h()Lcom/p1/mobile/putong/core/data/QuickChatPartyType;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    if-eqz p1, :cond_2

    .line 19
    .line 20
    invoke-static {}, Ll/i5c0;->i()Ll/i5c0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v2, p0, Ll/b5c0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->q1()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2, p2}, Ll/i5c0;->g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatPartyType;)V

    .line 31
    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_2
    invoke-static {}, Ll/i5c0;->i()Ll/i5c0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v2, p0, Ll/b5c0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 39
    .line 40
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->q1()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v1, v2, p2}, Ll/i5c0;->m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatPartyType;)V

    .line 45
    .line 46
    .line 47
    :goto_2
    invoke-static {}, Ll/i5c0;->i()Ll/i5c0;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-boolean v0, v1, Ll/i5c0;->b:Z

    .line 52
    .line 53
    iget-object p0, p0, Ll/b5c0;->c:Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-nez p0, :cond_5

    .line 60
    .line 61
    if-eqz p1, :cond_3

    .line 62
    .line 63
    const-string p0, "like"

    .line 64
    .line 65
    goto :goto_3

    .line 66
    :cond_3
    const-string p0, "dislike"

    .line 67
    .line 68
    :goto_3
    const-string p1, "direction"

    .line 69
    .line 70
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string p1, "quickchat"

    .line 75
    .line 76
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_4

    .line 81
    .line 82
    const-string p1, "quickchat_party"

    .line 83
    .line 84
    goto :goto_4

    .line 85
    :cond_4
    const-string p1, "voice_quickchat_party"

    .line 86
    .line 87
    :goto_4
    const-string p2, "quickchat_activity_card_type"

    .line 88
    .line 89
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    const-string p1, "e_card_quickchat_activity"

    .line 98
    .line 99
    const-string p2, "p_suggest_users_home_view"

    .line 100
    .line 101
    invoke-static {p1, p2, p0}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 102
    .line 103
    .line 104
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 105
    .line 106
    return-object p0
.end method

.method public final h()Lcom/p1/mobile/putong/core/data/QuickChatPartyType;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/b5c0;->d:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->AudioQuickChatPartyInvitationCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const-string p0, "voiceQuickchat"

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/QuickChatPartyType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/QuickChatPartyType;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "quickchat"

    .line 15
    .line 16
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/QuickChatPartyType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/QuickChatPartyType;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
