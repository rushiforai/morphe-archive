.class public Ll/e420;
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

.method public static a(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileAudioItemView;Landroid/view/View;)V
    .locals 3

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
    move-result-object v1

    .line 8
    check-cast v1, Lv/VDraweeView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileAudioItemView;->d:Lv/VDraweeView;

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lv/VImage;

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileAudioItemView;->e:Lv/VImage;

    .line 20
    .line 21
    const/4 v1, 0x3

    .line 22
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Landroid/widget/FrameLayout;

    .line 27
    .line 28
    iput-object v2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileAudioItemView;->f:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Landroid/view/ViewGroup;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileAudioItemView;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 43
    .line 44
    const/4 v0, 0x4

    .line 45
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Landroid/widget/TextView;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileAudioItemView;->h:Landroid/widget/TextView;

    .line 52
    .line 53
    const/4 v0, 0x5

    .line 54
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Landroid/widget/TextView;

    .line 59
    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileAudioItemView;->i:Landroid/widget/TextView;

    .line 61
    .line 62
    return-void
.end method
