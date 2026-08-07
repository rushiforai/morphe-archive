.class public Ll/mqj;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;Landroid/view/View;)V
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
    check-cast v1, Landroid/widget/ImageView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->d:Landroid/widget/ImageView;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->e:Landroid/view/View;

    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Landroid/widget/FrameLayout;

    .line 25
    .line 26
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->f:Landroid/widget/FrameLayout;

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Landroid/view/ViewGroup;

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/google/android/material/tabs/TabLayout;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->g:Lcom/google/android/material/tabs/TabLayout;

    .line 41
    .line 42
    const/4 v0, 0x4

    .line 43
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabEntranceView;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabEntranceView;

    .line 50
    .line 51
    const/4 v0, 0x5

    .line 52
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lv/VPager;

    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->i:Lv/VPager;

    .line 59
    .line 60
    const/4 v0, 0x6

    .line 61
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Landroid/view/ViewStub;

    .line 66
    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->j:Landroid/view/ViewStub;

    .line 68
    .line 69
    return-void
.end method
