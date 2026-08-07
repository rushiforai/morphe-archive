.class public Ll/v0p0;
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

.method public static a(Ll/u0p0;Landroid/view/View;)V
    .locals 1

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lv/VImage;

    .line 9
    .line 10
    iput-object v0, p0, Ll/u0p0;->k:Lv/VImage;

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetHouseView;

    .line 18
    .line 19
    iput-object v0, p0, Ll/u0p0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetHouseView;

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;

    .line 27
    .line 28
    iput-object v0, p0, Ll/u0p0;->m:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetLimitedTimeHouseView;

    .line 29
    .line 30
    const/4 v0, 0x5

    .line 31
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;

    .line 36
    .line 37
    iput-object v0, p0, Ll/u0p0;->n:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;

    .line 38
    .line 39
    const/4 v0, 0x6

    .line 40
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lv/VImage;

    .line 45
    .line 46
    iput-object p1, p0, Ll/u0p0;->o:Lv/VImage;

    .line 47
    .line 48
    return-void
.end method
