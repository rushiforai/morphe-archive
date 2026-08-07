.class public Ll/tuv;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;Landroid/view/View;)V
    .locals 5

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    check-cast v1, Lv/VText;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;->L:Lv/VText;

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lv/VImage;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;->M:Lv/VImage;

    .line 20
    .line 21
    const/4 v2, 0x3

    .line 22
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lv/VText;

    .line 27
    .line 28
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;->N:Lv/VText;

    .line 29
    .line 30
    const/4 v2, 0x4

    .line 31
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lv/VText;

    .line 36
    .line 37
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;->O:Lv/VText;

    .line 38
    .line 39
    const/4 v2, 0x7

    .line 40
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Landroid/view/ViewGroup;

    .line 45
    .line 46
    const/4 v4, 0x0

    .line 47
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;

    .line 52
    .line 53
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;->P:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;

    .line 54
    .line 55
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Landroid/view/ViewGroup;

    .line 60
    .line 61
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;->Q:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;

    .line 68
    .line 69
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Landroid/view/ViewGroup;

    .line 74
    .line 75
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;

    .line 80
    .line 81
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;->R:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;

    .line 82
    .line 83
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/yec0;->a1:I

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
    invoke-static {p0, p1}, Ll/tuv;->a(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
