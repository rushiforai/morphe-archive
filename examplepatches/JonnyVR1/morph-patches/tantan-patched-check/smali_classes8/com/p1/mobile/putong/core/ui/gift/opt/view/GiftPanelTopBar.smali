.class public Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lcom/google/android/material/tabs/TabLayout;

.field public b:Lv/VMarqueeText;

.field public c:Lv/VLinear;

.field public d:Lv/VIcon;

.field public e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private K(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Landroid/widget/TextView;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/widget/TextView;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getText()Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 31
    .line 32
    .line 33
    const/16 p0, 0x11

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 36
    .line 37
    .line 38
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 39
    .line 40
    const/4 v1, -0x1

    .line 41
    const/4 v2, -0x2

    .line 42
    invoke-direct {p0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public static synthetic p(Ljava/lang/String;Ll/bwj;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_chat_gift_bar_svip_entrance"

    .line 2
    .line 3
    invoke-static {p2, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p1}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string p2, "p_chat,gift_svipguide"

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 19
    .line 20
    invoke-interface {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic s(Ll/bwj;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bwj;->t()Ll/qvj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->E()V

    return-void
.end method

.method public static synthetic v(Ljava/lang/String;Ll/bwj;Landroid/view/View;)V
    .locals 7

    .line 1
    const-string p2, "e_chat_gift_bar_diamond"

    .line 2
    .line 3
    invoke-static {p2, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v3, Ll/hwj;

    .line 19
    .line 20
    invoke-direct {v3, p1}, Ll/hwj;-><init>(Ll/bwj;)V

    .line 21
    .line 22
    .line 23
    const/4 v5, 0x0

    .line 24
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondGreetings:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 25
    .line 26
    const-string v2, "p_chat,gift_odiamond"

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    invoke-interface/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wh(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->F()V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->K(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/iwj;->a(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C(Lv/VPager;Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv/VPager;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->setTabsVisibility(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setTabMode(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setTabIndicatorFullWidth(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 17
    .line 18
    sget v2, Ll/g9c0;->Y:I

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Lcom/google/android/material/tabs/TabLayout;->setTabRippleColorResource(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setTabGravity(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 29
    .line 30
    new-instance v1, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar$a;

    .line 31
    .line 32
    invoke-direct {v1, p0, p2}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar$a;-><init>(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic E()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;

    .line 2
    .line 3
    invoke-static {}, Ll/tvj;->b()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->setTextColorList(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;

    .line 11
    .line 12
    invoke-static {}, Ll/tvj;->c()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->setTextList(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;

    .line 20
    .line 21
    const-wide/16 v1, 0x3e8

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->setAnimTime(J)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->i()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic F()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;

    .line 2
    .line 3
    invoke-static {}, Ll/tvj;->d()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->setTextList(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;

    .line 11
    .line 12
    const-wide/16 v1, 0x3e8

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->setAnimTime(J)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->e:Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->i()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public G(Ll/bwj;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/bwj;->m()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->c:Lv/VLinear;

    .line 23
    .line 24
    sget v2, Ll/ibc0;->g0:I

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->d:Lv/VIcon;

    .line 30
    .line 31
    sget v2, Ll/ibc0;->h0:I

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ll/bwj;->t()Ll/qvj;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/qvj;->L()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v2, "e_chat_gift_bar_diamond"

    .line 45
    .line 46
    invoke-static {v2, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->c:Lv/VLinear;

    .line 50
    .line 51
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->c:Lv/VLinear;

    .line 55
    .line 56
    new-instance v2, Ll/dwj;

    .line 57
    .line 58
    invoke-direct {v2, v0, p1}, Ll/dwj;-><init>(Ljava/lang/String;Ll/bwj;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    new-instance p1, Ll/ewj;

    .line 65
    .line 66
    invoke-direct {p1, p0}, Ll/ewj;-><init>(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;)V

    .line 67
    .line 68
    .line 69
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fs()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_1

    .line 86
    .line 87
    invoke-virtual {p1}, Ll/bwj;->t()Ll/qvj;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ll/qvj;->L()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const-string v2, "e_chat_gift_bar_svip_entrance"

    .line 96
    .line 97
    invoke-static {v2, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->c:Lv/VLinear;

    .line 101
    .line 102
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->c:Lv/VLinear;

    .line 106
    .line 107
    new-instance v2, Ll/fwj;

    .line 108
    .line 109
    invoke-direct {v2, v0, p1}, Ll/fwj;-><init>(Ljava/lang/String;Ll/bwj;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 113
    .line 114
    .line 115
    new-instance p1, Ll/gwj;

    .line 116
    .line 117
    invoke-direct {p1, p0}, Ll/gwj;-><init>(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;)V

    .line 118
    .line 119
    .line 120
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->c:Lv/VLinear;

    .line 125
    .line 126
    const/4 p1, 0x0

    .line 127
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->B(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->b:Lv/VMarqueeText;

    .line 8
    .line 9
    const-string v0, "\u9001\u4e2a\u5c0f\u793c\u7269\u8868\u8fbe\u8bda\u610f\u5427"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setTabsVisibility(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->b:Lv/VMarqueeText;

    .line 2
    .line 3
    xor-int/lit8 v1, p1, 0x1

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setTips(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->setTabsVisibility(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->b:Lv/VMarqueeText;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
