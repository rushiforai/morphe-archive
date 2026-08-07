.class public Ll/kk40;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/NewUIBuzzComboEntranceView;Landroid/view/View;)V
    .locals 4

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
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/NewUIBuzzComboEntranceView;->d:Landroid/view/View;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Lv/VImage;

    .line 16
    .line 17
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/NewUIBuzzComboEntranceView;->e:Lv/VImage;

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Lv/VLinear;

    .line 25
    .line 26
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/NewUIBuzzComboEntranceView;->f:Lv/VLinear;

    .line 27
    .line 28
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Landroid/view/ViewGroup;

    .line 33
    .line 34
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lv/VText;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/NewUIBuzzComboEntranceView;->g:Lv/VText;

    .line 41
    .line 42
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Landroid/view/ViewGroup;

    .line 47
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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/NewUIBuzzComboEntranceView;->h:Lv/VText;

    .line 55
    .line 56
    const/4 v0, 0x3

    .line 57
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/NewUIBuzzComboEntranceView;->i:Landroid/view/View;

    .line 62
    .line 63
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/NewUIBuzzComboEntranceView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/mec0;->f:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/kk40;->a(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/NewUIBuzzComboEntranceView;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
