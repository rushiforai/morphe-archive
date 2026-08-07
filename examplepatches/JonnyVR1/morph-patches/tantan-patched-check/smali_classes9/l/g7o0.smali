.class public Ll/g7o0;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;Landroid/view/View;)V
    .locals 2

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;

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
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lv/VLinear;

    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->c:Lv/VLinear;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Landroid/view/ViewGroup;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Landroid/widget/TextView;

    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->d:Landroid/widget/TextView;

    .line 39
    .line 40
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/yec0;->F9:I

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
    invoke-static {p0, p1}, Ll/g7o0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
