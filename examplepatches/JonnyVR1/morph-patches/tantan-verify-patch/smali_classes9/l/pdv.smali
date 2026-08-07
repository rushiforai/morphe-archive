.class public Ll/pdv;
.super Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/hj2;",
        ">",
        "Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder<",
        "TP;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public f:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public g:Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView;

.field public h:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

.field public i:Lcom/p1/mobile/putong/live/livingroom/virtual/call/userleaderboard/page/VoiceUserLeaderBoardPage;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/yec0;->mb:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    move-object p2, p1

    .line 9
    check-cast p2, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/pdv;->u(Landroid/view/ViewGroup;)V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method

.method public u(Landroid/view/ViewGroup;)V
    .locals 2

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/pdv;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 5
    .line 6
    iput-object v0, p0, Ll/pdv;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string v0, "_root"

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    :goto_0
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView;

    .line 20
    .line 21
    iput-object v1, p0, Ll/pdv;->g:Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView;

    .line 22
    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    const-string v0, "_animView"

    .line 26
    .line 27
    :cond_1
    const/4 v1, 0x1

    .line 28
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 33
    .line 34
    iput-object v1, p0, Ll/pdv;->h:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 35
    .line 36
    if-nez v1, :cond_2

    .line 37
    .line 38
    const-string v0, "_title_bar"

    .line 39
    .line 40
    :cond_2
    const/4 v1, 0x2

    .line 41
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/call/userleaderboard/page/VoiceUserLeaderBoardPage;

    .line 46
    .line 47
    iput-object p1, p0, Ll/pdv;->i:Lcom/p1/mobile/putong/live/livingroom/virtual/call/userleaderboard/page/VoiceUserLeaderBoardPage;

    .line 48
    .line 49
    if-nez p1, :cond_3

    .line 50
    .line 51
    const-string v0, "_leader_board_content_view"

    .line 52
    .line 53
    :cond_3
    if-nez v0, :cond_4

    .line 54
    .line 55
    return-void

    .line 56
    :cond_4
    const-string p0, "Missing required view with ID:"

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
