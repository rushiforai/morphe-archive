.class public Ll/e4n0;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;Landroid/view/View;)V
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
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->a:Lv/VDraweeView;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Landroid/view/ViewGroup;

    .line 18
    .line 19
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lv/VDraweeView;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->b:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/view/ViewGroup;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Landroid/widget/TextView;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->c:Landroid/widget/TextView;

    .line 40
    .line 41
    const/4 v0, 0x2

    .line 42
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 49
    .line 50
    const/4 v0, 0x3

    .line 51
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Lv/VImage;

    .line 56
    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->e:Lv/VImage;

    .line 58
    .line 59
    return-void
.end method
