.class public Ll/usc0;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/RedPacketGiftView;Landroid/view/View;)V
    .locals 1

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/RedPacketGiftView;->d:Landroid/view/View;

    .line 9
    .line 10
    const/4 v0, 0x5

    .line 11
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lv/VDraweeView;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/RedPacketGiftView;->e:Lv/VDraweeView;

    .line 18
    .line 19
    const/4 v0, 0x7

    .line 20
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lv/VText;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/RedPacketGiftView;->f:Lv/VText;

    .line 27
    .line 28
    const/16 v0, 0x8

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lv/VText;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/RedPacketGiftView;->g:Lv/VText;

    .line 37
    .line 38
    return-void
.end method
