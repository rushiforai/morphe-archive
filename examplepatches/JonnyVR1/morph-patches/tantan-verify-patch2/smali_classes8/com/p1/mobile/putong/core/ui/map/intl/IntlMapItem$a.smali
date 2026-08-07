.class public Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem$a;->b(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Landroid/view/View;)V

    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Landroid/view/View;)V
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
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->W(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Landroid/widget/LinearLayout;)V

    .line 12
    .line 13
    .line 14
    sget v0, Ll/adc0;->K8:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->X(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Lv/VText;)V

    .line 23
    .line 24
    .line 25
    move-object v0, p1

    .line 26
    check-cast v0, Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Landroid/view/ViewGroup;

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Landroid/widget/LinearLayout;

    .line 40
    .line 41
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->T(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Landroid/widget/LinearLayout;)V

    .line 42
    .line 43
    .line 44
    sget v1, Ll/adc0;->v2:I

    .line 45
    .line 46
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Lv/VText;

    .line 51
    .line 52
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->V(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Lv/VText;)V

    .line 53
    .line 54
    .line 55
    sget v1, Ll/adc0;->r2:I

    .line 56
    .line 57
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Lv/VText;

    .line 62
    .line 63
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->S(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Lv/VText;)V

    .line 64
    .line 65
    .line 66
    sget v1, Ll/adc0;->f1:I

    .line 67
    .line 68
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Lv/VImage;

    .line 73
    .line 74
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->R(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Lv/VImage;)V

    .line 75
    .line 76
    .line 77
    const/4 p1, 0x2

    .line 78
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Lv/VText;

    .line 83
    .line 84
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;->Q(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapItem;Lv/VText;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method
