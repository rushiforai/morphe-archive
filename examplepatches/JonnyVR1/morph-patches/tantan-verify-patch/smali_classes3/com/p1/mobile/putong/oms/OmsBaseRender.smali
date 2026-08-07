.class public Lcom/p1/mobile/putong/oms/OmsBaseRender;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;,
        Lcom/p1/mobile/putong/oms/OmsBaseRender$d;,
        Lcom/p1/mobile/putong/oms/OmsBaseRender$c;
    }
.end annotation


# static fields
.field public static o:I = 0x64


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

.field public c:Lcom/p1/mobile/android/app/Dialog$e;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/oms/OmsBaseRender$c;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/oms/view/OmsViewPager;

.field public f:Lcom/p1/mobile/putong/data/OMSDialog;

.field public g:Ll/kcg0;

.field public h:Z

.field public i:Landroid/view/View;

.field public j:Z

.field public k:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/p1/mobile/putong/data/OMSAction;",
            "Lcom/p1/mobile/putong/data/OMSDialog;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/l4g0;

.field public m:Landroid/content/DialogInterface$OnDismissListener;

.field public n:Landroid/content/DialogInterface$OnShowListener;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->d:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->k:Ljava/util/Map;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    iput-object p2, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->F(Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/oms/OmsBaseRender;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->O(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->G(Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->J(Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->K(Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/oms/OmsBaseRender;Landroid/view/View;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->M(Landroid/view/View;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/oms/OmsBaseRender;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->P(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->I(Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/oms/OmsBaseRender;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->L(Landroid/view/View;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic m()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/oms/OmsBaseRender$d;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->H(Lcom/p1/mobile/putong/oms/OmsBaseRender$d;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->N(Lcom/p1/mobile/putong/data/OMSDialog;ILandroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/oms/OmsBaseRender;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->d:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->S(Lcom/p1/mobile/putong/data/OMSDialog;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/putong/oms/OmsBaseRender;Landroid/view/View;Lcom/p1/mobile/putong/data/OMSDialog;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->X(Landroid/view/View;Lcom/p1/mobile/putong/data/OMSDialog;I)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/oms/OmsBaseRender;Landroid/widget/TextView;Lcom/p1/mobile/putong/data/OMSDialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a0(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/OMSDialog;)V

    return-void
.end method


# virtual methods
.method public final A(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V
    .locals 5

    .line 1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, -0x2

    .line 5
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Lcom/p1/mobile/putong/oms/view/OmsViewPager;

    .line 9
    .line 10
    iget-object v3, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-direct {v1, v3}, Lcom/p1/mobile/putong/oms/view/OmsViewPager;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->e:Lcom/p1/mobile/putong/oms/view/OmsViewPager;

    .line 16
    .line 17
    new-instance v1, Lcom/p1/mobile/putong/oms/OmsBaseRender$d;

    .line 18
    .line 19
    invoke-direct {v1, p0, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender$d;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->e:Lcom/p1/mobile/putong/oms/view/OmsViewPager;

    .line 23
    .line 24
    invoke-virtual {v3, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 25
    .line 26
    .line 27
    iget-object v3, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->e:Lcom/p1/mobile/putong/oms/view/OmsViewPager;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/oms/OmsBaseRender$d;->getCount()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    invoke-virtual {v3, v4}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 34
    .line 35
    .line 36
    iget-object v3, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->e:Lcom/p1/mobile/putong/oms/view/OmsViewPager;

    .line 37
    .line 38
    iget-object v4, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 39
    .line 40
    iget-boolean v4, v4, Lcom/p1/mobile/putong/data/OMSBaseStyle;->canSlide:Z

    .line 41
    .line 42
    invoke-virtual {v3, v4}, Lv/VPager;->setScrollble(Z)V

    .line 43
    .line 44
    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->e:Lcom/p1/mobile/putong/oms/view/OmsViewPager;

    .line 46
    .line 47
    new-instance v4, Lcom/p1/mobile/putong/oms/OmsBaseRender$a;

    .line 48
    .line 49
    invoke-direct {v4, p0}, Lcom/p1/mobile/putong/oms/OmsBaseRender$a;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, v4}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 53
    .line 54
    .line 55
    iget-object v3, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->e:Lcom/p1/mobile/putong/oms/view/OmsViewPager;

    .line 56
    .line 57
    new-instance v4, Ll/ii50;

    .line 58
    .line 59
    invoke-direct {v4}, Ll/ii50;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p1, v3, v0, v4}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->t(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;Ll/x20;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 66
    .line 67
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->showIndicator:Z

    .line 68
    .line 69
    if-eqz v0, :cond_0

    .line 70
    .line 71
    new-instance v0, Lv/VPagerCircleIndicator;

    .line 72
    .line 73
    iget-object v3, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    invoke-direct {v0, v3}, Lv/VPagerCircleIndicator;-><init>(Landroid/content/Context;)V

    .line 76
    .line 77
    .line 78
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 79
    .line 80
    invoke-direct {v3, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 81
    .line 82
    .line 83
    iget-object v2, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 84
    .line 85
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    invoke-virtual {v0, v2}, Lv/VPagerCircleIndicator;->setFillColor(I)V

    .line 92
    .line 93
    .line 94
    iget-object v2, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 95
    .line 96
    iget v2, v2, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorRadius:F

    .line 97
    .line 98
    invoke-static {v2}, Ll/bnl0;->w(F)I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    int-to-float v2, v2

    .line 103
    invoke-virtual {v0, v2}, Lv/VPagerCircleIndicator;->setRadius(F)V

    .line 104
    .line 105
    .line 106
    iget-object v2, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 107
    .line 108
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    invoke-virtual {v0, v2}, Lv/VPagerCircleIndicator;->setPageColor(I)V

    .line 115
    .line 116
    .line 117
    iget-object v2, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 118
    .line 119
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 120
    .line 121
    const-string v4, "v"

    .line 122
    .line 123
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    invoke-virtual {v0, v2}, Lv/VPagerCircleIndicator;->setOrientation(I)V

    .line 128
    .line 129
    .line 130
    iget-object v2, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->e:Lcom/p1/mobile/putong/oms/view/OmsViewPager;

    .line 131
    .line 132
    invoke-virtual {v2}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    invoke-virtual {v0, v2, v4}, Lv/VPagerCircleIndicator;->c(Landroidx/viewpager/widget/ViewPager;I)V

    .line 137
    .line 138
    .line 139
    const/4 v2, 0x1

    .line 140
    iput v2, v3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 141
    .line 142
    new-instance v2, Ll/vh50;

    .line 143
    .line 144
    invoke-direct {v2}, Ll/vh50;-><init>()V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0, p1, v0, v3, v2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->t(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;Ll/x20;)V

    .line 148
    .line 149
    .line 150
    :cond_0
    iget-object p1, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 151
    .line 152
    iget-boolean p2, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitch:Z

    .line 153
    .line 154
    if-eqz p2, :cond_1

    .line 155
    .line 156
    iget p1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitchTime:I

    .line 157
    .line 158
    int-to-long p1, p1

    .line 159
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 160
    .line 161
    invoke-static {p1, p2, v0}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    new-instance p2, Ll/wh50;

    .line 178
    .line 179
    invoke-direct {p2, p0, v1}, Ll/wh50;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/oms/OmsBaseRender$d;)V

    .line 180
    .line 181
    .line 182
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    iput-object p1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->g:Ll/kcg0;

    .line 191
    .line 192
    :cond_1
    return-void
.end method

.method public final B(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V
    .locals 7

    .line 1
    sget v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->o:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    sput v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->o:I

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->T(Lcom/p1/mobile/putong/data/OMSDialog;)Lcom/p1/mobile/putong/data/OMSDialog;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->u(Lcom/p1/mobile/putong/data/OMSDialog;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    sget-object v2, Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;->relative:Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;

    .line 22
    .line 23
    invoke-virtual {p0, v2, v0, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->C(Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/ViewGroup;)Landroid/view/ViewGroup$LayoutParams;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 28
    .line 29
    iget-object v3, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 30
    .line 31
    iget v3, v3, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginLeft:F

    .line 32
    .line 33
    float-to-int v3, v3

    .line 34
    int-to-float v3, v3

    .line 35
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    iget-object v4, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 40
    .line 41
    iget v4, v4, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginTop:F

    .line 42
    .line 43
    float-to-int v4, v4

    .line 44
    int-to-float v4, v4

    .line 45
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    iget-object v5, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 50
    .line 51
    iget v5, v5, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginRight:F

    .line 52
    .line 53
    float-to-int v5, v5

    .line 54
    int-to-float v5, v5

    .line 55
    invoke-static {v5}, Ll/bnl0;->w(F)I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    iget-object v6, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 60
    .line 61
    iget v6, v6, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginBottom:F

    .line 62
    .line 63
    float-to-int v6, v6

    .line 64
    int-to-float v6, v6

    .line 65
    invoke-static {v6}, Ll/bnl0;->w(F)I

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 70
    .line 71
    .line 72
    sget v3, Lcom/p1/mobile/putong/oms/OmsBaseRender;->o:I

    .line 73
    .line 74
    invoke-virtual {v1, v3}, Landroid/view/View;->setId(I)V

    .line 75
    .line 76
    .line 77
    iget-object v3, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 78
    .line 79
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    if-eqz v4, :cond_0

    .line 90
    .line 91
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    check-cast v4, Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 96
    .line 97
    invoke-static {v4}, Ll/el50;->e(Lcom/p1/mobile/putong/data/OMSLocationType;)I

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    invoke-virtual {v2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_0
    new-instance v3, Ll/fi50;

    .line 106
    .line 107
    invoke-direct {v3, p0, v0, v1}, Ll/fi50;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, p1, v1, v2, v3}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->t(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;Ll/x20;)V

    .line 111
    .line 112
    .line 113
    :cond_1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->S(Lcom/p1/mobile/putong/data/OMSDialog;)Ljava/util/List;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_5

    .line 126
    .line 127
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 132
    .line 133
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 134
    .line 135
    const-string v2, "extra"

    .line 136
    .line 137
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_2

    .line 142
    .line 143
    iput-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->f:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;->relative:Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;

    .line 147
    .line 148
    invoke-virtual {p0, v1, v0, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->C(Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/ViewGroup;)Landroid/view/ViewGroup$LayoutParams;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 153
    .line 154
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->u(Lcom/p1/mobile/putong/data/OMSDialog;)Landroid/view/View;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    iget-object v3, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 159
    .line 160
    iget v3, v3, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginLeft:F

    .line 161
    .line 162
    float-to-int v3, v3

    .line 163
    int-to-float v3, v3

    .line 164
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 165
    .line 166
    .line 167
    move-result v3

    .line 168
    iget-object v4, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 169
    .line 170
    iget v4, v4, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginTop:F

    .line 171
    .line 172
    float-to-int v4, v4

    .line 173
    int-to-float v4, v4

    .line 174
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 175
    .line 176
    .line 177
    move-result v4

    .line 178
    iget-object v5, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 179
    .line 180
    iget v5, v5, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginRight:F

    .line 181
    .line 182
    float-to-int v5, v5

    .line 183
    int-to-float v5, v5

    .line 184
    invoke-static {v5}, Ll/bnl0;->w(F)I

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    iget-object v6, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 189
    .line 190
    iget v6, v6, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginBottom:F

    .line 191
    .line 192
    float-to-int v6, v6

    .line 193
    int-to-float v6, v6

    .line 194
    invoke-static {v6}, Ll/bnl0;->w(F)I

    .line 195
    .line 196
    .line 197
    move-result v6

    .line 198
    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 199
    .line 200
    .line 201
    iget-object v3, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 202
    .line 203
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 204
    .line 205
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 210
    .line 211
    .line 212
    move-result v4

    .line 213
    if-eqz v4, :cond_4

    .line 214
    .line 215
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    check-cast v4, Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 220
    .line 221
    iget-boolean v5, v0, Lcom/p1/mobile/putong/data/OMSDialog;->needApplyChild:Z

    .line 222
    .line 223
    if-eqz v5, :cond_3

    .line 224
    .line 225
    invoke-static {v4}, Ll/el50;->e(Lcom/p1/mobile/putong/data/OMSLocationType;)I

    .line 226
    .line 227
    .line 228
    move-result v4

    .line 229
    sget v5, Lcom/p1/mobile/putong/oms/OmsBaseRender;->o:I

    .line 230
    .line 231
    invoke-virtual {v1, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 232
    .line 233
    .line 234
    goto :goto_2

    .line 235
    :cond_3
    invoke-static {v4}, Ll/el50;->e(Lcom/p1/mobile/putong/data/OMSLocationType;)I

    .line 236
    .line 237
    .line 238
    move-result v4

    .line 239
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 240
    .line 241
    .line 242
    goto :goto_2

    .line 243
    :cond_4
    new-instance v3, Ll/gi50;

    .line 244
    .line 245
    invoke-direct {v3, p0, v0, v2}, Ll/gi50;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {p0, p1, v2, v1, v3}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->t(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;Ll/x20;)V

    .line 249
    .line 250
    .line 251
    goto/16 :goto_1

    .line 252
    .line 253
    :cond_5
    return-void
.end method

.method public final C(Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/ViewGroup;)Landroid/view/ViewGroup$LayoutParams;
    .locals 6

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 4
    .line 5
    const-string v1, "ratio"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object v0, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 17
    .line 18
    iget v3, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->height:F

    .line 19
    .line 20
    float-to-int v3, v3

    .line 21
    iget v1, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->width:F

    .line 22
    .line 23
    cmpl-float v4, v1, v2

    .line 24
    .line 25
    if-lez v4, :cond_0

    .line 26
    .line 27
    float-to-int v1, v1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    :goto_0
    iget-object v4, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 34
    .line 35
    iget v4, v4, Lcom/p1/mobile/putong/data/OMSBaseStyle;->ratio:F

    .line 36
    .line 37
    invoke-virtual {p0, v0, v3, v1, v4}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->D(Lcom/p1/mobile/putong/data/OMSSizeType;IIF)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget-object v1, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 44
    .line 45
    iget v4, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->width:F

    .line 46
    .line 47
    float-to-int v4, v4

    .line 48
    iget v1, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->height:F

    .line 49
    .line 50
    cmpl-float v2, v1, v2

    .line 51
    .line 52
    if-lez v2, :cond_1

    .line 53
    .line 54
    float-to-int p3, v1

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    .line 57
    .line 58
    .line 59
    move-result p3

    .line 60
    :goto_1
    iget-object v1, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 61
    .line 62
    iget v1, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->ratio:F

    .line 63
    .line 64
    invoke-virtual {p0, v3, v4, p3, v1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->D(Lcom/p1/mobile/putong/data/OMSSizeType;IIF)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    goto :goto_4

    .line 69
    :cond_2
    iget-object v0, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 70
    .line 71
    iget v3, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->width:F

    .line 72
    .line 73
    float-to-int v3, v3

    .line 74
    iget v1, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->height:F

    .line 75
    .line 76
    cmpl-float v4, v1, v2

    .line 77
    .line 78
    if-lez v4, :cond_3

    .line 79
    .line 80
    float-to-int v1, v1

    .line 81
    goto :goto_2

    .line 82
    :cond_3
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    :goto_2
    iget-object v4, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 87
    .line 88
    iget v4, v4, Lcom/p1/mobile/putong/data/OMSBaseStyle;->ratio:F

    .line 89
    .line 90
    invoke-virtual {p0, v0, v3, v1, v4}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->D(Lcom/p1/mobile/putong/data/OMSSizeType;IIF)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iget-object v1, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 95
    .line 96
    iget-object v3, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 97
    .line 98
    iget v4, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->height:F

    .line 99
    .line 100
    float-to-int v4, v4

    .line 101
    iget v1, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->width:F

    .line 102
    .line 103
    cmpl-float v2, v1, v2

    .line 104
    .line 105
    if-lez v2, :cond_4

    .line 106
    .line 107
    float-to-int p3, v1

    .line 108
    goto :goto_3

    .line 109
    :cond_4
    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    .line 110
    .line 111
    .line 112
    move-result p3

    .line 113
    :goto_3
    iget-object v1, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 114
    .line 115
    iget v1, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->ratio:F

    .line 116
    .line 117
    invoke-virtual {p0, v3, v4, p3, v1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->D(Lcom/p1/mobile/putong/data/OMSSizeType;IIF)I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    move v5, v0

    .line 122
    move v0, p0

    .line 123
    move p0, v5

    .line 124
    :goto_4
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 125
    .line 126
    const-string p3, "page"

    .line 127
    .line 128
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    if-eqz p2, :cond_5

    .line 133
    .line 134
    const/4 v0, -0x2

    .line 135
    :cond_5
    sget-object p2, Lcom/p1/mobile/putong/oms/OmsBaseRender$b;->a:[I

    .line 136
    .line 137
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    aget p1, p2, p1

    .line 142
    .line 143
    const/4 p2, 0x1

    .line 144
    if-eq p1, p2, :cond_7

    .line 145
    .line 146
    const/4 p2, 0x2

    .line 147
    if-eq p1, p2, :cond_6

    .line 148
    .line 149
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 150
    .line 151
    invoke-direct {p1, p0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 152
    .line 153
    .line 154
    return-object p1

    .line 155
    :cond_6
    new-instance p1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 156
    .line 157
    invoke-direct {p1, p0, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 158
    .line 159
    .line 160
    return-object p1

    .line 161
    :cond_7
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 162
    .line 163
    invoke-direct {p1, p0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 164
    .line 165
    .line 166
    return-object p1
.end method

.method public final D(Lcom/p1/mobile/putong/data/OMSSizeType;IIF)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, -0x1

    .line 13
    sparse-switch p1, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    :goto_0
    move p0, v0

    .line 17
    goto :goto_1

    .line 18
    :sswitch_0
    const-string p1, "match_parent"

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p0, 0x2

    .line 28
    goto :goto_1

    .line 29
    :sswitch_1
    const-string p1, "wrap_content"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/4 p0, 0x1

    .line 39
    goto :goto_1

    .line 40
    :sswitch_2
    const-string p1, "ratio"

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_2

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    const/4 p0, 0x0

    .line 50
    :goto_1
    packed-switch p0, :pswitch_data_0

    .line 51
    .line 52
    .line 53
    int-to-float p0, p2

    .line 54
    invoke-static {p0}, Ll/bnl0;->w(F)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0

    .line 59
    :pswitch_0
    return v0

    .line 60
    :pswitch_1
    const/4 p0, -0x2

    .line 61
    return p0

    .line 62
    :pswitch_2
    int-to-float p0, p3

    .line 63
    invoke-static {p0}, Ll/bnl0;->w(F)I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    int-to-float p0, p0

    .line 68
    mul-float/2addr p0, p4

    .line 69
    float-to-int p0, p0

    .line 70
    return p0

    .line 71
    :sswitch_data_0
    .sparse-switch
        0x674500b -> :sswitch_2
        0x1476c184 -> :sswitch_1
        0x529e9464 -> :sswitch_0
    .end sparse-switch

    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final E(Lcom/p1/mobile/putong/data/OMSTemplateModeType;)Z
    .locals 0

    .line 1
    const-string p0, "hstack"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "vstack"

    .line 10
    .line 11
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-string p0, "overlap"

    .line 18
    .line 19
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    const-string p0, "button"

    .line 26
    .line 27
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    const-string p0, "page"

    .line 34
    .line 35
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method public final synthetic F(Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->E(Lcom/p1/mobile/putong/data/OMSTemplateModeType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p2, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->w(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic G(Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->E(Lcom/p1/mobile/putong/data/OMSTemplateModeType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p2, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->w(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/oms/OmsBaseRender$d;Ljava/lang/Long;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->e:Lcom/p1/mobile/putong/oms/view/OmsViewPager;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender$d;->q(Lcom/p1/mobile/putong/oms/OmsBaseRender$d;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v0, 0x1

    .line 16
    sub-int/2addr p1, v0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->e:Lcom/p1/mobile/putong/oms/view/OmsViewPager;

    .line 18
    .line 19
    if-ne p2, p1, :cond_0

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    add-int/2addr p1, v0

    .line 31
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->E(Lcom/p1/mobile/putong/data/OMSTemplateModeType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p2, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->w(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->E(Lcom/p1/mobile/putong/data/OMSTemplateModeType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p2, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->w(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->E(Lcom/p1/mobile/putong/data/OMSTemplateModeType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p2, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->w(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic L(Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-direct {v0, p0, p2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic M(Landroid/view/View;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    new-instance v0, Ll/zh50;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1, p3}, Ll/zh50;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Landroid/view/View;Landroid/graphics/Bitmap;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string p3, "OMSDialogRender identifer:"

    .line 21
    .line 22
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string p0, " bgUrl:"

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget-object p0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance p1, Ljava/lang/RuntimeException;

    .line 47
    .line 48
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const/16 p0, 0x64

    .line 52
    .line 53
    invoke-static {p1, p0}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/data/OMSDialog;ILandroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/uk50;->f()Ll/uk50;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Ll/uk50;->b()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    if-nez p3, :cond_3

    .line 14
    .line 15
    iget-object p3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    check-cast p3, Lcom/p1/mobile/putong/data/OMSAction;

    .line 22
    .line 23
    invoke-static {}, Ll/uk50;->f()Ll/uk50;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/uk50;->b()Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ll/c4k0;

    .line 46
    .line 47
    invoke-virtual {v1, p3, p0}, Ll/c4k0;->a(Lcom/p1/mobile/putong/data/OMSAction;Lcom/p1/mobile/putong/oms/OmsBaseRender;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    iget-object p3, p3, Lcom/p1/mobile/putong/data/OMSAction;->preCondition:Ljava/util/List;

    .line 54
    .line 55
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    const/4 v0, 0x1

    .line 60
    xor-int/2addr p3, v0

    .line 61
    goto :goto_0

    .line 62
    :cond_1
    const/4 v0, 0x0

    .line 63
    move p3, v0

    .line 64
    :goto_0
    if-nez v0, :cond_2

    .line 65
    .line 66
    new-instance v0, Ll/w660;

    .line 67
    .line 68
    invoke-direct {v0}, Ll/w660;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, p0}, Ll/c4k0;->e(Lcom/p1/mobile/putong/oms/OmsBaseRender;)Ll/c4k0;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    check-cast p2, Lcom/p1/mobile/putong/data/OMSAction;

    .line 82
    .line 83
    invoke-virtual {v0, p2}, Ll/c4k0;->c(Lcom/p1/mobile/putong/data/OMSAction;)Z

    .line 84
    .line 85
    .line 86
    :cond_2
    if-nez p3, :cond_3

    .line 87
    .line 88
    iget-object p2, p1, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 89
    .line 90
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OmsMerCuryData;->id:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    if-nez p2, :cond_3

    .line 97
    .line 98
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 99
    .line 100
    iget-object p2, p1, Lcom/p1/mobile/putong/data/OmsMerCuryData;->id:Ljava/lang/String;

    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->id:Ljava/lang/String;

    .line 107
    .line 108
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OmsMerCuryData;->server:Ljava/util/Map;

    .line 109
    .line 110
    invoke-static {p2, p0, p1}, Ll/el50;->g(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 111
    .line 112
    .line 113
    :cond_3
    return-void
.end method

.method public final synthetic O(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->Z()Z

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->l:Ll/l4g0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->n:Landroid/content/DialogInterface$OnShowListener;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0, p1}, Landroid/content/DialogInterface$OnShowListener;->onShow(Landroid/content/DialogInterface;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic P(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->g:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->l:Ll/l4g0;

    .line 7
    .line 8
    invoke-static {v0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/uk50;->f()Ll/uk50;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/uk50;->i()Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->m:Landroid/content/DialogInterface$OnDismissListener;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-interface {p0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public Q()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->Y()Lcom/p1/mobile/android/app/Dialog;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->Y()Lcom/p1/mobile/android/app/Dialog;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->g:Ll/kcg0;

    .line 39
    .line 40
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->l:Ll/l4g0;

    .line 44
    .line 45
    invoke-static {v0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->Y()Lcom/p1/mobile/android/app/Dialog;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    return-void
.end method

.method public R()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSDialogContent;->morph:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->V(Lcom/p1/mobile/putong/data/OMSDialog;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->i:Landroid/view/View;

    .line 20
    .line 21
    return-void
.end method

.method public final S(Lcom/p1/mobile/putong/data/OMSDialog;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/OMSDialog;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSDialog;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->nodesJson:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

    .line 14
    .line 15
    invoke-direct {v1, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-ge p1, v2, :cond_1

    .line 24
    .line 25
    sget-object v2, Lcom/p1/mobile/putong/data/OMSDialog;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 26
    .line 27
    invoke-virtual {v1, p1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v2, v3}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 36
    .line 37
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    add-int/lit8 p1, p1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catch_0
    move-exception p1

    .line 44
    goto :goto_1

    .line 45
    :catch_1
    move-exception p1

    .line 46
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    iput-boolean v1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->h:Z

    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    :cond_1
    return-object v0
.end method

.method public final T(Lcom/p1/mobile/putong/data/OMSDialog;)Lcom/p1/mobile/putong/data/OMSDialog;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->childJson:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/data/OMSDialog;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialog;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception p1

    .line 18
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->h:Z

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    :goto_0
    return-object p1
.end method

.method public U(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->k:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ljava/util/Map$Entry;

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Lcom/p1/mobile/putong/data/OMSAction;

    .line 29
    .line 30
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSAction;->type:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-eqz v3, :cond_0

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    move-object p1, v2

    .line 46
    :goto_0
    if-nez p1, :cond_2

    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lcom/p1/mobile/putong/data/OMSAction;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSAction;->preCondition:Ljava/util/List;

    .line 59
    .line 60
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Lcom/p1/mobile/putong/data/OMSAction;

    .line 67
    .line 68
    iput-object v2, v3, Lcom/p1/mobile/putong/data/OMSAction;->preCondition:Ljava/util/List;

    .line 69
    .line 70
    invoke-static {}, Ll/uk50;->f()Ll/uk50;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v2}, Ll/uk50;->b()Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-nez v2, :cond_5

    .line 83
    .line 84
    invoke-static {}, Ll/uk50;->f()Ll/uk50;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v2}, Ll/uk50;->b()Ljava/util/List;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    if-eqz v3, :cond_4

    .line 101
    .line 102
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    check-cast v3, Ll/c4k0;

    .line 107
    .line 108
    iget-object v4, p1, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 109
    .line 110
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    check-cast v4, Lcom/p1/mobile/putong/data/OMSAction;

    .line 115
    .line 116
    invoke-virtual {v3, v4, p0}, Ll/c4k0;->a(Lcom/p1/mobile/putong/data/OMSAction;Lcom/p1/mobile/putong/oms/OmsBaseRender;)Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-eqz v3, :cond_3

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_4
    new-instance v2, Ll/w660;

    .line 124
    .line 125
    invoke-direct {v2}, Ll/w660;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v2, p0}, Ll/c4k0;->e(Lcom/p1/mobile/putong/oms/OmsBaseRender;)Ll/c4k0;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    iget-object v2, p1, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 133
    .line 134
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    check-cast v2, Lcom/p1/mobile/putong/data/OMSAction;

    .line 139
    .line 140
    invoke-virtual {p0, v2}, Ll/c4k0;->c(Lcom/p1/mobile/putong/data/OMSAction;)Z

    .line 141
    .line 142
    .line 143
    :cond_5
    :goto_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 144
    .line 145
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    check-cast p0, Lcom/p1/mobile/putong/data/OMSAction;

    .line 150
    .line 151
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSAction;->preCondition:Ljava/util/List;

    .line 152
    .line 153
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/data/OMSDialog;)Landroid/view/View;
    .locals 7

    .line 1
    new-instance v0, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;->frame:Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;

    .line 9
    .line 10
    invoke-virtual {p0, v1, p1, v0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->C(Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/ViewGroup;)Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->u(Lcom/p1/mobile/putong/data/OMSDialog;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 21
    .line 22
    iget v3, v3, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginLeft:F

    .line 23
    .line 24
    float-to-int v3, v3

    .line 25
    int-to-float v3, v3

    .line 26
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    iget-object v4, p1, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 31
    .line 32
    iget v4, v4, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginTop:F

    .line 33
    .line 34
    float-to-int v4, v4

    .line 35
    int-to-float v4, v4

    .line 36
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    iget-object v5, p1, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 41
    .line 42
    iget v5, v5, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginRight:F

    .line 43
    .line 44
    float-to-int v5, v5

    .line 45
    int-to-float v5, v5

    .line 46
    invoke-static {v5}, Ll/bnl0;->w(F)I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    iget-object v6, p1, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 51
    .line 52
    iget v6, v6, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginBottom:F

    .line 53
    .line 54
    float-to-int v6, v6

    .line 55
    int-to-float v6, v6

    .line 56
    invoke-static {v6}, Ll/bnl0;->w(F)I

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 61
    .line 62
    .line 63
    new-instance v3, Ll/uh50;

    .line 64
    .line 65
    invoke-direct {v3, p0, p1, v2}, Ll/uh50;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v0, v2, v1, v3}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->t(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;Ll/x20;)V

    .line 69
    .line 70
    .line 71
    return-object v0
.end method

.method public final W(Landroid/view/View;Lcom/p1/mobile/putong/data/OMSDialog;)V
    .locals 5

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->bgImage:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Ll/dsi0;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ll/pk50;->g()Ll/sj50;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, v0}, Ll/sj50;->a(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ll/pk50;->g()Ll/sj50;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, v0}, Ll/sj50;->b(Ljava/lang/String;)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 50
    .line 51
    new-instance v2, Ll/ci50;

    .line 52
    .line 53
    invoke-direct {v2, p0, p1, p2}, Ll/ci50;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Landroid/view/View;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v0, v2}, Ll/fsb0;->I(Ljava/lang/String;Ll/y20;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    iget-object p0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 63
    .line 64
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-nez p0, :cond_8

    .line 69
    .line 70
    iget-object p0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    const/4 v0, 0x1

    .line 79
    if-ne p0, v0, :cond_2

    .line 80
    .line 81
    const/4 p0, 0x2

    .line 82
    goto :goto_0

    .line 83
    :cond_2
    iget-object p0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    :goto_0
    new-array v0, p0, [I

    .line 92
    .line 93
    const/4 v1, 0x0

    .line 94
    move v2, v1

    .line 95
    :goto_1
    if-ge v2, p0, :cond_4

    .line 96
    .line 97
    iget-object v3, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 98
    .line 99
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 100
    .line 101
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    iget-object v4, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 106
    .line 107
    if-lt v2, v3, :cond_3

    .line 108
    .line 109
    iget-object v3, v4, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    check-cast v3, Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    aput v3, v0, v2

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_3
    iget-object v3, v4, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 125
    .line 126
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    check-cast v3, Ljava/lang/String;

    .line 131
    .line 132
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    aput v3, v0, v2

    .line 137
    .line 138
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_4
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 142
    .line 143
    iget-object v2, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 144
    .line 145
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 146
    .line 147
    const-string v3, "h"

    .line 148
    .line 149
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    if-eqz v2, :cond_5

    .line 154
    .line 155
    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 156
    .line 157
    goto :goto_3

    .line 158
    :cond_5
    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 159
    .line 160
    :goto_3
    invoke-direct {p0, v2, v0}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 164
    .line 165
    iget v0, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->cornerRadius:F

    .line 166
    .line 167
    const/4 v2, 0x0

    .line 168
    cmpl-float v0, v0, v2

    .line 169
    .line 170
    if-lez v0, :cond_6

    .line 171
    .line 172
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 176
    .line 177
    iget v0, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->cornerRadius:F

    .line 178
    .line 179
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 180
    .line 181
    .line 182
    :cond_6
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 183
    .line 184
    iget v1, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderWidth:F

    .line 185
    .line 186
    cmpl-float v1, v1, v2

    .line 187
    .line 188
    if-lez v1, :cond_7

    .line 189
    .line 190
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 191
    .line 192
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    if-nez v0, :cond_7

    .line 197
    .line 198
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 199
    .line 200
    iget v0, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderWidth:F

    .line 201
    .line 202
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 207
    .line 208
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 209
    .line 210
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 211
    .line 212
    .line 213
    move-result p2

    .line 214
    invoke-virtual {p0, v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 215
    .line 216
    .line 217
    :cond_7
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 218
    .line 219
    .line 220
    :cond_8
    return-void
.end method

.method public final X(Landroid/view/View;Lcom/p1/mobile/putong/data/OMSDialog;I)V
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->k:Ljava/util/Map;

    .line 18
    .line 19
    iget-object v1, p2, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/data/OMSAction;

    .line 26
    .line 27
    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/hi50;

    .line 31
    .line 32
    invoke-direct {v0, p0, p2, p3}, Ll/hi50;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final Y(Lv/VDraweeView;Lcom/p1/mobile/putong/data/OMSDialog;Z)V
    .locals 4

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 4
    .line 5
    invoke-static {v0}, Ll/el50;->d(Lcom/p1/mobile/putong/data/OMSImageScaleType;)Ll/h1e0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ll/wlj;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ll/wlj;->w(Ll/h1e0;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 25
    .line 26
    iget v0, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->cornerRadius:F

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    cmpl-float v3, v0, v2

    .line 30
    .line 31
    if-lez v3, :cond_1

    .line 32
    .line 33
    invoke-static {v0}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    if-eqz p3, :cond_2

    .line 41
    .line 42
    iget-object p3, p2, Lcom/p1/mobile/putong/data/OMSDialog;->image:Ljava/lang/String;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    iget-object p3, p2, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

    .line 46
    .line 47
    :goto_0
    invoke-static {p3}, Ll/dsi0;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_3

    .line 58
    .line 59
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->foreImage:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v0}, Ll/dsi0;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Ll/pk50;->g()Ll/sj50;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v1, v0}, Ll/sj50;->b(Ljava/lang/String;)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    invoke-virtual {p0, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p1, p0}, Lv/VDraweeView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 88
    .line 89
    .line 90
    :cond_3
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Ll/pk50;->g()Ll/sj50;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0, p3}, Ll/sj50;->a(Ljava/lang/String;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-eqz p0, :cond_4

    .line 103
    .line 104
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p0}, Ll/pk50;->g()Ll/sj50;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p0, p3}, Ll/sj50;->b(Ljava/lang/String;)Ljava/lang/Integer;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_4
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    if-nez p0, :cond_6

    .line 129
    .line 130
    iget-object p0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 131
    .line 132
    iget p0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurRadius:F

    .line 133
    .line 134
    cmpl-float v0, p0, v2

    .line 135
    .line 136
    if-nez v0, :cond_5

    .line 137
    .line 138
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 139
    .line 140
    invoke-virtual {p0, p1, p3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_5
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 145
    .line 146
    const/4 v1, 0x4

    .line 147
    float-to-int p0, p0

    .line 148
    invoke-virtual {v0, p1, p3, v1, p0}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 149
    .line 150
    .line 151
    :cond_6
    :goto_1
    iget-object p0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 152
    .line 153
    iget p3, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderWidth:F

    .line 154
    .line 155
    cmpl-float p3, p3, v2

    .line 156
    .line 157
    if-lez p3, :cond_7

    .line 158
    .line 159
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 160
    .line 161
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-nez p0, :cond_7

    .line 166
    .line 167
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 168
    .line 169
    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 170
    .line 171
    .line 172
    iget-object p3, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 173
    .line 174
    iget p3, p3, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderWidth:F

    .line 175
    .line 176
    invoke-static {p3}, Ll/bnl0;->w(F)I

    .line 177
    .line 178
    .line 179
    move-result p3

    .line 180
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 181
    .line 182
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 183
    .line 184
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    move-result p2

    .line 188
    invoke-virtual {p0, p3, p2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 192
    .line 193
    .line 194
    :cond_7
    return-void
.end method

.method public Z()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->f:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->Y()Lcom/p1/mobile/android/app/Dialog;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog;->x:Landroid/widget/TextView;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->f:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 19
    .line 20
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a0(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->Y()Lcom/p1/mobile/android/app/Dialog;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog;->x:Landroid/widget/TextView;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->f:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 32
    .line 33
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->X(Landroid/view/View;Lcom/p1/mobile/putong/data/OMSDialog;I)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_0
    return v1
.end method

.method public final a0(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/OMSDialog;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->needLanguage:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {p0, p2}, Ll/dsi0;->d(Lcom/p1/mobile/putong/data/OMSDialogInfo;Lcom/p1/mobile/putong/data/OMSDialog;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->content:Ljava/util/List;

    .line 15
    .line 16
    :goto_0
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-static {v0, p0, v1, v2, v3}, Ll/dsi0;->f(Landroid/app/Activity;Ljava/util/List;DLl/pf60;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 26
    .line 27
    const-string v1, "unknown_"

    .line 28
    .line 29
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 38
    .line 39
    invoke-static {v0}, Ll/el50;->c(Lcom/p1/mobile/putong/data/OMSLocationType;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v0, Ljava/lang/CharSequence;

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 54
    .line 55
    iget p2, p2, Lcom/p1/mobile/putong/data/OMSBaseStyle;->lineSpacing:F

    .line 56
    .line 57
    const/high16 v0, 0x3f800000    # 1.0f

    .line 58
    .line 59
    invoke-virtual {p1, p2, v0}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 63
    .line 64
    check-cast p0, Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_2

    .line 71
    .line 72
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->t()Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_3

    .line 84
    .line 85
    const/16 p0, 0x8

    .line 86
    .line 87
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_3
    const/4 p0, 0x4

    .line 92
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 93
    .line 94
    .line 95
    :goto_1
    sget-object p0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 96
    .line 97
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    sget p2, Ll/b9c0;->o:I

    .line 105
    .line 106
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public b0(Landroid/content/DialogInterface$OnDismissListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->m:Landroid/content/DialogInterface$OnDismissListener;

    .line 2
    .line 3
    return-void
.end method

.method public c0()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->i:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->l:Ll/l4g0;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->server:Ljava/util/Map;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const/4 v1, 0x0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->server:Ljava/util/Map;

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-lez v0, :cond_1

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OmsMerCuryData;->server:Ljava/util/Map;

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    new-array v0, v0, [Ll/pf60;

    .line 67
    .line 68
    iget-object v2, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 69
    .line 70
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 71
    .line 72
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OmsMerCuryData;->server:Ljava/util/Map;

    .line 73
    .line 74
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    move v3, v1

    .line 83
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-eqz v4, :cond_0

    .line 88
    .line 89
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    check-cast v4, Ljava/util/Map$Entry;

    .line 94
    .line 95
    new-instance v5, Ll/pf60;

    .line 96
    .line 97
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v6

    .line 101
    check-cast v6, Ljava/lang/String;

    .line 102
    .line 103
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    check-cast v4, Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {v4}, Ll/dsi0;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-direct {v5, v6, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    aput-object v5, v0, v3

    .line 117
    .line 118
    add-int/lit8 v3, v3, 0x1

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->l:Ll/l4g0;

    .line 122
    .line 123
    invoke-virtual {v2, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 124
    .line 125
    .line 126
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->f:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 127
    .line 128
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-eqz v0, :cond_2

    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 135
    .line 136
    const-string v2, "temp"

    .line 137
    .line 138
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->r0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 139
    .line 140
    .line 141
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 142
    .line 143
    iget-object v2, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 144
    .line 145
    iget-boolean v2, v2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->cancelAble:Z

    .line 146
    .line 147
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iget-object v2, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->i:Landroid/view/View;

    .line 152
    .line 153
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    new-instance v1, Ll/ai50;

    .line 158
    .line 159
    invoke-direct {v1, p0}, Ll/ai50;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->B0(Landroid/content/DialogInterface$OnShowListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    new-instance v1, Ll/bi50;

    .line 167
    .line 168
    invoke-direct {v1, p0}, Ll/bi50;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 175
    .line 176
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 177
    .line 178
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSDialogContent;->morph:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 179
    .line 180
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSDialog;->baseStyle:Lcom/p1/mobile/putong/data/OMSMorphBaseStyle;

    .line 181
    .line 182
    const-string v1, "bigScreen"

    .line 183
    .line 184
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-eqz v0, :cond_3

    .line 189
    .line 190
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 191
    .line 192
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->Q()Lcom/p1/mobile/android/app/Dialog$e;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    sget v1, Ll/zfc0;->j:I

    .line 197
    .line 198
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 199
    .line 200
    .line 201
    goto :goto_1

    .line 202
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 203
    .line 204
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->content:Lcom/p1/mobile/putong/data/OMSDialogContent;

    .line 205
    .line 206
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSDialogContent;->morph:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 207
    .line 208
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 209
    .line 210
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 211
    .line 212
    const-string v1, "new_type"

    .line 213
    .line 214
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    iget-object v1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 219
    .line 220
    if-eqz v0, :cond_4

    .line 221
    .line 222
    sget v0, Ll/zfc0;->f:I

    .line 223
    .line 224
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 225
    .line 226
    .line 227
    goto :goto_1

    .line 228
    :cond_4
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 229
    .line 230
    .line 231
    :goto_1
    invoke-static {}, Ll/uk50;->f()Ll/uk50;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {v0, p0}, Ll/uk50;->j(Lcom/p1/mobile/putong/oms/OmsBaseRender;)V

    .line 236
    .line 237
    .line 238
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->c:Lcom/p1/mobile/android/app/Dialog$e;

    .line 239
    .line 240
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 241
    .line 242
    .line 243
    return-void
.end method

.method public d0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->needLanguage:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/dsi0;->e(Lcom/p1/mobile/putong/data/OMSDialogInfo;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final t(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;Ll/x20;)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->h:Z

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p4}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/data/OMSDialog;)Landroid/view/View;
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x1

    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, -0x1

    .line 17
    sparse-switch v1, :sswitch_data_0

    .line 18
    .line 19
    .line 20
    goto/16 :goto_0

    .line 21
    .line 22
    :sswitch_0
    const-string v1, "checkbox"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :cond_0
    const/16 v4, 0xa

    .line 33
    .line 34
    goto/16 :goto_0

    .line 35
    .line 36
    :sswitch_1
    const-string v1, "space"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    goto/16 :goto_0

    .line 45
    .line 46
    :cond_1
    const/16 v4, 0x9

    .line 47
    .line 48
    goto/16 :goto_0

    .line 49
    .line 50
    :sswitch_2
    const-string v1, "image"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_2

    .line 57
    .line 58
    goto/16 :goto_0

    .line 59
    .line 60
    :cond_2
    const/16 v4, 0x8

    .line 61
    .line 62
    goto/16 :goto_0

    .line 63
    .line 64
    :sswitch_3
    const-string v1, "view"

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_3

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    const/4 v4, 0x7

    .line 74
    goto :goto_0

    .line 75
    :sswitch_4
    const-string v1, "text"

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_4

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_4
    const/4 v4, 0x6

    .line 85
    goto :goto_0

    .line 86
    :sswitch_5
    const-string v1, "page"

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_5

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_5
    const/4 v4, 0x5

    .line 96
    goto :goto_0

    .line 97
    :sswitch_6
    const-string v1, "switch_btn"

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_6

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_6
    const/4 v4, 0x4

    .line 107
    goto :goto_0

    .line 108
    :sswitch_7
    const-string v1, "vstack"

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_7

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_7
    const/4 v4, 0x3

    .line 118
    goto :goto_0

    .line 119
    :sswitch_8
    const-string v1, "overlap"

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_8

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_8
    const/4 v4, 0x2

    .line 129
    goto :goto_0

    .line 130
    :sswitch_9
    const-string v1, "hstack"

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-nez v0, :cond_9

    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_9
    move v4, v2

    .line 140
    goto :goto_0

    .line 141
    :sswitch_a
    const-string v1, "button"

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_a

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_a
    move v4, v3

    .line 151
    :goto_0
    const/4 v0, 0x0

    .line 152
    packed-switch v4, :pswitch_data_0

    .line 153
    .line 154
    .line 155
    goto/16 :goto_1

    .line 156
    .line 157
    :pswitch_0
    new-instance v1, Lv/VCheckBox;

    .line 158
    .line 159
    iget-object v2, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 160
    .line 161
    invoke-direct {v1, v2}, Lv/VCheckBox;-><init>(Landroid/content/Context;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatCheckBox;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 168
    .line 169
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->checked:Z

    .line 170
    .line 171
    invoke-virtual {v1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 172
    .line 173
    .line 174
    move-object v0, v1

    .line 175
    goto/16 :goto_1

    .line 176
    .line 177
    :pswitch_1
    new-instance v0, Landroidx/legacy/widget/Space;

    .line 178
    .line 179
    iget-object v1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 180
    .line 181
    invoke-direct {v0, v1}, Landroidx/legacy/widget/Space;-><init>(Landroid/content/Context;)V

    .line 182
    .line 183
    .line 184
    goto/16 :goto_1

    .line 185
    .line 186
    :pswitch_2
    new-instance v0, Lv/VDraweeView;

    .line 187
    .line 188
    iget-object v1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 189
    .line 190
    invoke-direct {v0, v1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0, v0, p1, v3}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->Y(Lv/VDraweeView;Lcom/p1/mobile/putong/data/OMSDialog;Z)V

    .line 194
    .line 195
    .line 196
    goto :goto_1

    .line 197
    :pswitch_3
    new-instance v0, Landroid/view/View;

    .line 198
    .line 199
    iget-object v1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 200
    .line 201
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 202
    .line 203
    .line 204
    goto :goto_1

    .line 205
    :pswitch_4
    new-instance v0, Lv/VText;

    .line 206
    .line 207
    iget-object v1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 208
    .line 209
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a0(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 213
    .line 214
    .line 215
    goto :goto_1

    .line 216
    :pswitch_5
    new-instance v0, Landroid/widget/LinearLayout;

    .line 217
    .line 218
    iget-object v1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 219
    .line 220
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 224
    .line 225
    .line 226
    goto :goto_1

    .line 227
    :pswitch_6
    new-instance v0, Lv/VSwitchButton;

    .line 228
    .line 229
    iget-object v1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 230
    .line 231
    invoke-direct {v0, v1}, Lv/VSwitchButton;-><init>(Landroid/content/Context;)V

    .line 232
    .line 233
    .line 234
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 235
    .line 236
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->checked:Z

    .line 237
    .line 238
    invoke-virtual {v0, v1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 239
    .line 240
    .line 241
    goto :goto_1

    .line 242
    :pswitch_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 243
    .line 244
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-eqz v0, :cond_b

    .line 249
    .line 250
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->childJson:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 251
    .line 252
    if-nez v0, :cond_b

    .line 253
    .line 254
    new-instance v0, Lv/VFrame;

    .line 255
    .line 256
    iget-object v1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 257
    .line 258
    invoke-direct {v0, v1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 259
    .line 260
    .line 261
    goto :goto_1

    .line 262
    :cond_b
    new-instance v0, Lv/VRelative;

    .line 263
    .line 264
    iget-object v1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 265
    .line 266
    invoke-direct {v0, v1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 267
    .line 268
    .line 269
    goto :goto_1

    .line 270
    :pswitch_8
    new-instance v0, Lv/VLinear;

    .line 271
    .line 272
    iget-object v1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 273
    .line 274
    invoke-direct {v0, v1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 275
    .line 276
    .line 277
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 278
    .line 279
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 280
    .line 281
    invoke-static {v1}, Ll/el50;->c(Lcom/p1/mobile/putong/data/OMSLocationType;)I

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 286
    .line 287
    .line 288
    goto :goto_1

    .line 289
    :pswitch_9
    new-instance v0, Lv/VFrame;

    .line 290
    .line 291
    iget-object v1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 292
    .line 293
    invoke-direct {v0, v1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 294
    .line 295
    .line 296
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 297
    .line 298
    .line 299
    move-result v1

    .line 300
    if-eqz v1, :cond_c

    .line 301
    .line 302
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->W(Landroid/view/View;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {p0, v0, p1, v3}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->X(Landroid/view/View;Lcom/p1/mobile/putong/data/OMSDialog;I)V

    .line 306
    .line 307
    .line 308
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 309
    .line 310
    iget p0, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingLeft:F

    .line 311
    .line 312
    float-to-int p0, p0

    .line 313
    int-to-float p0, p0

    .line 314
    invoke-static {p0}, Ll/bnl0;->w(F)I

    .line 315
    .line 316
    .line 317
    move-result p0

    .line 318
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 319
    .line 320
    iget v1, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingTop:F

    .line 321
    .line 322
    float-to-int v1, v1

    .line 323
    int-to-float v1, v1

    .line 324
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 325
    .line 326
    .line 327
    move-result v1

    .line 328
    iget-object v2, p1, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 329
    .line 330
    iget v2, v2, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingRight:F

    .line 331
    .line 332
    float-to-int v2, v2

    .line 333
    int-to-float v2, v2

    .line 334
    invoke-static {v2}, Ll/bnl0;->w(F)I

    .line 335
    .line 336
    .line 337
    move-result v2

    .line 338
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 339
    .line 340
    iget p1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingBottom:F

    .line 341
    .line 342
    float-to-int p1, p1

    .line 343
    int-to-float p1, p1

    .line 344
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 345
    .line 346
    .line 347
    move-result p1

    .line 348
    invoke-virtual {v0, p0, v1, v2, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 349
    .line 350
    .line 351
    :cond_c
    return-object v0

    .line 352
    nop

    .line 353
    :sswitch_data_0
    .sparse-switch
        -0x521dd8ce -> :sswitch_a
        -0x47fd3ce0 -> :sswitch_9
        -0x410bbbb9 -> :sswitch_8
        -0x3019642e -> :sswitch_7
        -0x14ae552f -> :sswitch_6
        0x34628f -> :sswitch_5
        0x36452d -> :sswitch_4
        0x373aa5 -> :sswitch_3
        0x5faa95b -> :sswitch_2
        0x688f106 -> :sswitch_1
        0x5b9b1bc3 -> :sswitch_0
    .end sparse-switch

    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_8
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public v(Lcom/p1/mobile/putong/data/OMSAction;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->k:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    const-string v2, "switch_btn"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_1

    .line 28
    .line 29
    const-string v2, "checkbox"

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    :goto_0
    return-void

    .line 38
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 39
    .line 40
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->checked:Z

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/OMSDialog;->clone()Lcom/p1/mobile/putong/data/OMSDialog;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 47
    .line 48
    xor-int/lit8 v1, v1, 0x1

    .line 49
    .line 50
    iput-boolean v1, v2, Lcom/p1/mobile/putong/data/OMSBaseStyle;->checked:Z

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->k:Ljava/util/Map;

    .line 53
    .line 54
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final w(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V
    .locals 3

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 2
    .line 3
    const-string v1, "button"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->nodes:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->nodesJson:Ljava/util/List;

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 25
    .line 26
    const-string v2, "vstack"

    .line 27
    .line 28
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_6

    .line 33
    .line 34
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 35
    .line 36
    const-string v2, "hstack"

    .line 37
    .line 38
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 46
    .line 47
    const-string v2, "overlap"

    .line 48
    .line 49
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->child:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->childJson:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 64
    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->y(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->B(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_3
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 76
    .line 77
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_4

    .line 82
    .line 83
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->x(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_4
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 88
    .line 89
    const-string v1, "page"

    .line 90
    .line 91
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_5

    .line 96
    .line 97
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->A(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 98
    .line 99
    .line 100
    :cond_5
    :goto_0
    return-void

    .line 101
    :cond_6
    :goto_1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->z(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final x(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V
    .locals 11

    .line 1
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    const/16 v2, 0x11

    .line 8
    .line 9
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->S(Lcom/p1/mobile/putong/data/OMSDialog;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-lez v2, :cond_1

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 33
    .line 34
    iget-object v4, v3, Lcom/p1/mobile/putong/data/OMSDialog;->src:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    const/4 v5, 0x1

    .line 41
    if-nez v4, :cond_0

    .line 42
    .line 43
    iget-object v4, v3, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 44
    .line 45
    iget-object v4, v4, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-nez v4, :cond_0

    .line 52
    .line 53
    iget-object v4, v3, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 54
    .line 55
    iget-object v4, v4, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-le v4, v5, :cond_0

    .line 62
    .line 63
    new-instance v4, Landroid/widget/RelativeLayout;

    .line 64
    .line 65
    iget-object v7, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    invoke-direct {v4, v7}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 68
    .line 69
    .line 70
    new-instance v7, Landroid/widget/RelativeLayout$LayoutParams;

    .line 71
    .line 72
    iget-object v8, v3, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 73
    .line 74
    iget-object v8, v8, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v8

    .line 80
    check-cast v8, Ljava/lang/Integer;

    .line 81
    .line 82
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    int-to-float v8, v8

    .line 87
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 88
    .line 89
    .line 90
    move-result v8

    .line 91
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 92
    .line 93
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 94
    .line 95
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    check-cast v3, Ljava/lang/Integer;

    .line 100
    .line 101
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    int-to-float v3, v3

    .line 106
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    invoke-direct {v7, v8, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 111
    .line 112
    .line 113
    new-instance v3, Lv/VDraweeView;

    .line 114
    .line 115
    iget-object v8, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 116
    .line 117
    invoke-direct {v3, v8}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 118
    .line 119
    .line 120
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v8

    .line 124
    check-cast v8, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 125
    .line 126
    invoke-virtual {p0, v3, v8, v5}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->Y(Lv/VDraweeView;Lcom/p1/mobile/putong/data/OMSDialog;Z)V

    .line 127
    .line 128
    .line 129
    const/16 v8, 0xf

    .line 130
    .line 131
    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 132
    .line 133
    .line 134
    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;

    .line 135
    .line 136
    invoke-direct {v9, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 137
    .line 138
    .line 139
    new-instance v1, Landroid/widget/TextView;

    .line 140
    .line 141
    iget-object v10, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 142
    .line 143
    invoke-direct {v1, v10}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 144
    .line 145
    .line 146
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    check-cast v2, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 151
    .line 152
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a0(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 153
    .line 154
    .line 155
    sget v2, Lcom/p1/mobile/putong/oms/OmsBaseRender;->o:I

    .line 156
    .line 157
    add-int/2addr v2, v5

    .line 158
    sput v2, Lcom/p1/mobile/putong/oms/OmsBaseRender;->o:I

    .line 159
    .line 160
    invoke-virtual {v3, v2}, Landroid/view/View;->setId(I)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v9, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 164
    .line 165
    .line 166
    sget v2, Lcom/p1/mobile/putong/oms/OmsBaseRender;->o:I

    .line 167
    .line 168
    invoke-virtual {v9, v5, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 169
    .line 170
    .line 171
    iget-object v2, p2, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 172
    .line 173
    iget v2, v2, Lcom/p1/mobile/putong/data/OMSBaseStyle;->spacing:F

    .line 174
    .line 175
    float-to-int v2, v2

    .line 176
    int-to-float v2, v2

    .line 177
    invoke-static {v2}, Ll/bnl0;->w(F)I

    .line 178
    .line 179
    .line 180
    move-result v2

    .line 181
    iput v2, v9, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 182
    .line 183
    invoke-virtual {v4, v3, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v4, v1, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 187
    .line 188
    .line 189
    new-instance v2, Ll/xh50;

    .line 190
    .line 191
    invoke-direct {v2}, Ll/xh50;-><init>()V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0, p1, v4, v0, v2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->t(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;Ll/x20;)V

    .line 195
    .line 196
    .line 197
    goto :goto_0

    .line 198
    :cond_0
    new-instance v1, Landroid/widget/TextView;

    .line 199
    .line 200
    iget-object v3, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 201
    .line 202
    invoke-direct {v1, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 203
    .line 204
    .line 205
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    check-cast v2, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 210
    .line 211
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a0(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 212
    .line 213
    .line 214
    new-instance v2, Ll/yh50;

    .line 215
    .line 216
    invoke-direct {v2}, Ll/yh50;-><init>()V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p0, p1, v1, v0, v2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->t(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;Ll/x20;)V

    .line 220
    .line 221
    .line 222
    :goto_0
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-le v0, v5, :cond_1

    .line 227
    .line 228
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->d:Ljava/util/List;

    .line 229
    .line 230
    new-instance v3, Lcom/p1/mobile/putong/oms/OmsBaseRender$c;

    .line 231
    .line 232
    const/4 v8, 0x0

    .line 233
    move-object v4, p1

    .line 234
    move-object v7, p2

    .line 235
    move-object v5, v1

    .line 236
    invoke-direct/range {v3 .. v8}, Lcom/p1/mobile/putong/oms/OmsBaseRender$c;-><init>(Landroid/view/View;Landroid/widget/TextView;Ljava/util/List;Lcom/p1/mobile/putong/data/OMSDialog;Ll/ji50;)V

    .line 237
    .line 238
    .line 239
    invoke-interface {p0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    :cond_1
    return-void
.end method

.method public final y(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V
    .locals 7

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->S(Lcom/p1/mobile/putong/data/OMSDialog;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 20
    .line 21
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 22
    .line 23
    const-string v2, "extra"

    .line 24
    .line 25
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->f:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;->frame:Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;

    .line 35
    .line 36
    invoke-virtual {p0, v1, v0, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->C(Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/ViewGroup;)Landroid/view/ViewGroup$LayoutParams;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->u(Lcom/p1/mobile/putong/data/OMSDialog;)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget-object v3, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 47
    .line 48
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 49
    .line 50
    invoke-static {v3}, Ll/el50;->b(Ljava/util/List;)I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 55
    .line 56
    iget-object v3, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 57
    .line 58
    iget v3, v3, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginLeft:F

    .line 59
    .line 60
    float-to-int v3, v3

    .line 61
    int-to-float v3, v3

    .line 62
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    iget-object v4, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 67
    .line 68
    iget v4, v4, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginTop:F

    .line 69
    .line 70
    float-to-int v4, v4

    .line 71
    int-to-float v4, v4

    .line 72
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    iget-object v5, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 77
    .line 78
    iget v5, v5, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginRight:F

    .line 79
    .line 80
    float-to-int v5, v5

    .line 81
    int-to-float v5, v5

    .line 82
    invoke-static {v5}, Ll/bnl0;->w(F)I

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    iget-object v6, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 87
    .line 88
    iget v6, v6, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginBottom:F

    .line 89
    .line 90
    float-to-int v6, v6

    .line 91
    int-to-float v6, v6

    .line 92
    invoke-static {v6}, Ll/bnl0;->w(F)I

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 97
    .line 98
    .line 99
    new-instance v3, Ll/ei50;

    .line 100
    .line 101
    invoke-direct {v3, p0, v0, v2}, Ll/ei50;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, p1, v2, v1, v3}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->t(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;Ll/x20;)V

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_1
    return-void
.end method

.method public final z(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V
    .locals 7

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/widget/LinearLayout;

    .line 3
    .line 4
    iget-object v1, p2, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 5
    .line 6
    const-string v2, "vstack"

    .line 7
    .line 8
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->S(Lcom/p1/mobile/putong/data/OMSDialog;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 34
    .line 35
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialog;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 36
    .line 37
    const-string v2, "extra"

    .line 38
    .line 39
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->f:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;->linear:Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;

    .line 49
    .line 50
    invoke-virtual {p0, v1, v0, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->C(Lcom/p1/mobile/putong/oms/OmsBaseRender$GroupLayoutType;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/ViewGroup;)Landroid/view/ViewGroup$LayoutParams;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->u(Lcom/p1/mobile/putong/data/OMSDialog;)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    iget-object v3, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 61
    .line 62
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 63
    .line 64
    invoke-static {v3}, Ll/el50;->b(Ljava/util/List;)I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 69
    .line 70
    iget-object v3, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 71
    .line 72
    iget v3, v3, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginLeft:F

    .line 73
    .line 74
    float-to-int v3, v3

    .line 75
    int-to-float v3, v3

    .line 76
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    iget-object v4, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 81
    .line 82
    iget v4, v4, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginTop:F

    .line 83
    .line 84
    float-to-int v4, v4

    .line 85
    int-to-float v4, v4

    .line 86
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    iget-object v5, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 91
    .line 92
    iget v5, v5, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginRight:F

    .line 93
    .line 94
    float-to-int v5, v5

    .line 95
    int-to-float v5, v5

    .line 96
    invoke-static {v5}, Ll/bnl0;->w(F)I

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    iget-object v6, v0, Lcom/p1/mobile/putong/data/OMSDialog;->style:Lcom/p1/mobile/putong/data/OMSBaseStyle;

    .line 101
    .line 102
    iget v6, v6, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginBottom:F

    .line 103
    .line 104
    float-to-int v6, v6

    .line 105
    int-to-float v6, v6

    .line 106
    invoke-static {v6}, Ll/bnl0;->w(F)I

    .line 107
    .line 108
    .line 109
    move-result v6

    .line 110
    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 111
    .line 112
    .line 113
    new-instance v3, Ll/di50;

    .line 114
    .line 115
    invoke-direct {v3, p0, v0, v2}, Ll/di50;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;Landroid/view/View;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, p1, v2, v1, v3}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->t(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;Ll/x20;)V

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_1
    return-void
.end method
