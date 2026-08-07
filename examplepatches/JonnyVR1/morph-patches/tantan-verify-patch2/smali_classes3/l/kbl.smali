.class public Ll/kbl;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/home/virtualcard/HomeNewBizCardView;Landroid/view/View;)V
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
    check-cast v1, Lv/VImage;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/virtualcard/HomeNewBizCardView;->a:Lv/VImage;

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
    check-cast v0, Lv/VImage;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/virtualcard/HomeNewBizCardView;->b:Lv/VImage;

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
    check-cast v0, Lv/VText;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/virtualcard/HomeNewBizCardView;->c:Lv/VText;

    .line 40
    .line 41
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Landroid/view/ViewGroup;

    .line 46
    .line 47
    const/4 v1, 0x2

    .line 48
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lv/VText;

    .line 53
    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/virtualcard/HomeNewBizCardView;->d:Lv/VText;

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lv/VDraweeView;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/virtualcard/HomeNewBizCardView;->e:Lv/VDraweeView;

    .line 63
    .line 64
    const/4 v0, 0x3

    .line 65
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Lv/VButton;

    .line 70
    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/home/virtualcard/HomeNewBizCardView;->f:Lv/VButton;

    .line 72
    .line 73
    return-void
.end method
