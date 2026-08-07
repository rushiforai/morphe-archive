.class public Ll/w3j0;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;Landroid/view/View;)V
    .locals 2

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Landroidx/cardview/widget/CardView;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->e:Landroidx/cardview/widget/CardView;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/view/ViewGroup;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->f:Landroid/view/View;

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lv/VDraweeView;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->g:Lv/VDraweeView;

    .line 37
    .line 38
    const/4 v0, 0x2

    .line 39
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lv/VDraweeView;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->h:Lv/VDraweeView;

    .line 46
    .line 47
    const/4 v0, 0x3

    .line 48
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lv/VText;

    .line 53
    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->i:Lv/VText;

    .line 55
    .line 56
    const/4 v0, 0x4

    .line 57
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 62
    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/topchat/TopChatView;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 64
    .line 65
    return-void
.end method
