.class public Ll/yng;
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

.method public static a(Ll/xng;Landroid/view/View;)V
    .locals 3

    .line 1
    sget v0, Ll/hdc0;->A1:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VFrame;

    .line 8
    .line 9
    iput-object v0, p0, Ll/xng;->a:Lv/VFrame;

    .line 10
    .line 11
    move-object v0, p1

    .line 12
    check-cast v0, Landroid/view/ViewGroup;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Lv/VPullDownRefreshLayout;

    .line 20
    .line 21
    iput-object v2, p0, Ll/xng;->b:Lv/VPullDownRefreshLayout;

    .line 22
    .line 23
    sget v2, Ll/hdc0;->b1:I

    .line 24
    .line 25
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lv/VRecyclerView;

    .line 30
    .line 31
    iput-object p1, p0, Ll/xng;->c:Lv/VRecyclerView;

    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lv/VLinear;

    .line 39
    .line 40
    iput-object v2, p0, Ll/xng;->d:Lv/VLinear;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Landroid/view/ViewGroup;

    .line 47
    .line 48
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lv/VImage;

    .line 53
    .line 54
    iput-object v1, p0, Ll/xng;->e:Lv/VImage;

    .line 55
    .line 56
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Landroid/view/ViewGroup;

    .line 61
    .line 62
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lv/VText;

    .line 67
    .line 68
    iput-object p1, p0, Ll/xng;->f:Lv/VText;

    .line 69
    .line 70
    return-void
.end method

.method public static b(Ll/xng;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->A:I

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
    invoke-static {p0, p1}, Ll/yng;->a(Ll/xng;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public static c(Ll/xng;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/xng;->a:Lv/VFrame;

    .line 3
    .line 4
    iput-object v0, p0, Ll/xng;->b:Lv/VPullDownRefreshLayout;

    .line 5
    .line 6
    iput-object v0, p0, Ll/xng;->c:Lv/VRecyclerView;

    .line 7
    .line 8
    iput-object v0, p0, Ll/xng;->d:Lv/VLinear;

    .line 9
    .line 10
    iput-object v0, p0, Ll/xng;->e:Lv/VImage;

    .line 11
    .line 12
    iput-object v0, p0, Ll/xng;->f:Lv/VText;

    .line 13
    .line 14
    return-void
.end method
