.class public Ll/cxw;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;Landroid/view/View;)V
    .locals 3

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
    move-result-object v0

    .line 9
    check-cast v0, Landroid/widget/LinearLayout;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->c:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    sget v0, Ll/adc0;->K8:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lv/VText;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->d:Lv/VText;

    .line 22
    .line 23
    move-object v0, p1

    .line 24
    check-cast v0, Landroid/view/ViewGroup;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Landroid/view/ViewGroup;

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Landroid/widget/LinearLayout;

    .line 38
    .line 39
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->e:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    sget v1, Ll/adc0;->v2:I

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lv/VText;

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->f:Lv/VText;

    .line 50
    .line 51
    sget v1, Ll/adc0;->r2:I

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lv/VText;

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->g:Lv/VText;

    .line 60
    .line 61
    sget v1, Ll/adc0;->f1:I

    .line 62
    .line 63
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Lv/VImage;

    .line 68
    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->h:Lv/VImage;

    .line 70
    .line 71
    const/4 p1, 0x2

    .line 72
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Lv/VText;

    .line 77
    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/map/MapPoiItem;->i:Lv/VText;

    .line 79
    .line 80
    return-void
.end method
