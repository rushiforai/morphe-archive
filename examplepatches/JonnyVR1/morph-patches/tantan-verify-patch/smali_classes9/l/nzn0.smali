.class public Ll/nzn0;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;Landroid/view/View;)V
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;

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
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;->b:Landroid/view/View;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VImage;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;->c:Lv/VImage;

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;->d:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 32
    .line 33
    return-void
.end method
