.class public Ll/a0b;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/view/ViewGroup;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    check-cast v2, Lv/VRelative;

    .line 10
    .line 11
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->z:Lv/VRelative;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Landroid/view/ViewGroup;

    .line 18
    .line 19
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lv/VImage;

    .line 24
    .line 25
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->A:Lv/VImage;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Landroid/view/ViewGroup;

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lv/VImage;

    .line 39
    .line 40
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->B:Lv/VImage;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Landroid/view/ViewGroup;

    .line 47
    .line 48
    const/4 v2, 0x2

    .line 49
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lv/VImage;

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->C:Lv/VImage;

    .line 56
    .line 57
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lv/VPullDownRefreshLayout;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->D:Lv/VPullDownRefreshLayout;

    .line 64
    .line 65
    sget v0, Ll/adc0;->yc:I

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->E:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 74
    .line 75
    check-cast p1, Landroid/view/ViewGroup;

    .line 76
    .line 77
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Lv/VLinear;

    .line 82
    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->F:Lv/VLinear;

    .line 84
    .line 85
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->hc:I

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
    invoke-static {p0, p1}, Ll/a0b;->a(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
