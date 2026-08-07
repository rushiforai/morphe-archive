.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    move v2, v0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move v2, v1

    .line 8
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 9
    .line 10
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->h:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 11
    .line 12
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->h(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 16
    .line 17
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->l:Lv/VLinear;

    .line 18
    .line 19
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 23
    .line 24
    invoke-static {v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->d(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)Ll/y20;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 35
    .line 36
    invoke-static {v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->d(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)Ll/y20;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->values()[Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    aget-object v3, v3, p1

    .line 45
    .line 46
    invoke-interface {v2, v3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    if-ne p1, v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 52
    .line 53
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->c(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)Ll/jxd0;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    goto :goto_1

    .line 58
    :cond_2
    const/4 v0, 0x2

    .line 59
    if-ne p1, v0, :cond_3

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 62
    .line 63
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->b(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)Ll/jxd0;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    goto :goto_1

    .line 68
    :cond_3
    const/4 v0, 0x0

    .line 69
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_4

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    sget p1, Ll/mdc0;->Z4:I

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 97
    .line 98
    invoke-virtual {v0, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    :cond_4
    return-void
.end method
