.class public final Lvs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/view/ViewGroup;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 6

    .line 16
    iput-byte p5, p0, Lvs;->a:B

    iput-object p1, p0, Lvs;->b:Landroid/view/ViewGroup;

    iput-object p2, p0, Lvs;->c:Ljava/lang/Object;

    iput-object p3, p0, Lvs;->d:Ljava/lang/Object;

    iput-object p4, p0, Lvs;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/widget/FrameLayout;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .registers 6

    const/4 v0, 0x5

    iput-byte v0, p0, Lvs;->a:B

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lvs;->b:Landroid/view/ViewGroup;

    .line 19
    iput-object p2, p0, Lvs;->d:Ljava/lang/Object;

    .line 20
    iput-object p3, p0, Lvs;->c:Ljava/lang/Object;

    .line 21
    iput-object p4, p0, Lvs;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/widget/RelativeLayout;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/custom_views/StylingImageView;)V
    .registers 6

    const/16 v0, 0x12

    iput-byte v0, p0, Lvs;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvs;->b:Landroid/view/ViewGroup;

    iput-object p2, p0, Lvs;->e:Ljava/lang/Object;

    iput-object p3, p0, Lvs;->c:Ljava/lang/Object;

    iput-object p4, p0, Lvs;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/custom_views/CardView;Lov0;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/view/TouchIgnoringViewPager;Lcom/opera/android/custom_views/StylingImageView;)V
    .registers 6

    const/16 p4, 0xd

    iput-byte p4, p0, Lvs;->a:B

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lvs;->b:Landroid/view/ViewGroup;

    .line 24
    iput-object p2, p0, Lvs;->c:Ljava/lang/Object;

    .line 25
    iput-object p3, p0, Lvs;->e:Ljava/lang/Object;

    .line 26
    iput-object p5, p0, Lvs;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingTextView;)V
    .registers 7

    const/16 p4, 0xe

    iput-byte p4, p0, Lvs;->a:B

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lvs;->b:Landroid/view/ViewGroup;

    .line 29
    iput-object p2, p0, Lvs;->c:Ljava/lang/Object;

    .line 30
    iput-object p3, p0, Lvs;->d:Ljava/lang/Object;

    .line 31
    iput-object p6, p0, Lvs;->e:Ljava/lang/Object;

    return-void
.end method

.method public static a(Landroid/view/View;)Lvs;
    .registers 9

    const v0, 0x7f0a07ca

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-eqz v1, :cond_50

    const v0, 0x7f0a07cb

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/TextView;

    if-eqz v4, :cond_50

    const v0, 0x7f0a07db

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-eqz v1, :cond_50

    const v0, 0x7f0a07dc

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/TextView;

    if-eqz v5, :cond_50

    const v0, 0x7f0a06c5

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_50

    const v0, 0x7f0a0ba1

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/widget/Barrier;

    if-eqz v1, :cond_50

    new-instance v2, Lvs;

    move-object v3, p0

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/16 v7, 0x10

    invoke-direct/range {v2 .. v7}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v2

    :cond_50
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static b(Landroid/view/View;)Lvs;
    .registers 5

    const v0, 0x7f0a026e

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v1, :cond_29

    const v0, 0x7f0a0514

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v2, :cond_29

    const v0, 0x7f0a0571

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v3, :cond_29

    new-instance v0, Lvs;

    check-cast p0, Landroid/widget/RelativeLayout;

    invoke-direct {v0, p0, v1, v2, v3}, Lvs;-><init>(Landroid/widget/RelativeLayout;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/custom_views/StylingImageView;)V

    return-object v0

    :cond_29
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static c(Landroid/view/View;)Lvs;
    .registers 7

    move-object v1, p0

    check-cast v1, Lcom/opera/android/search/behavior/ScrollableToolbarLinearLayout;

    const v0, 0x7f0a020d

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lcom/google/android/material/chip/ChipGroup;

    if-eqz v3, :cond_2f

    const v0, 0x7f0a092c

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Landroid/widget/HorizontalScrollView;

    if-eqz v4, :cond_2f

    const v0, 0x7f0a0add

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    if-eqz v2, :cond_2f

    new-instance v0, Lvs;

    const/16 v5, 0x13

    move-object v2, v1

    invoke-direct/range {v0 .. v5}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0

    :cond_2f
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static d(Landroid/view/LayoutInflater;)Lvs;
    .registers 10

    const v0, 0x7f0d01c4

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const v0, 0x7f0a0279

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v1, :cond_4e

    const v0, 0x7f0a02df

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/core/widget/NestedScrollView;

    if-eqz v1, :cond_4e

    const v0, 0x7f0a0514

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/FrameLayout;

    if-eqz v5, :cond_4e

    const v0, 0x7f0a07c6

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/LinearLayout;

    if-eqz v6, :cond_4e

    move-object v4, p0

    check-cast v4, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    const v0, 0x7f0a06c5

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v7, :cond_4e

    new-instance v3, Lvs;

    const/16 v8, 0xf

    invoke-direct/range {v3 .. v8}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v3

    :cond_4e
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v2
.end method

.method public static e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lvs;
    .registers 9

    const v0, 0x7f0d0075

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const p1, 0x7f0a01c8

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v3, :cond_36

    const p1, 0x7f0a0682

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/widget/ImageView;

    if-eqz v4, :cond_36

    const p1, 0x7f0a0ad7

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_36

    new-instance v1, Lvs;

    move-object v2, p0

    check-cast v2, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    const/4 v6, 0x3

    invoke-direct/range {v1 .. v6}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v1

    :cond_36
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lvs;
    .registers 5

    const v0, 0x7f0d007f

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const p1, 0x7f0a0322

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_3c

    const p1, 0x7f0a05ef

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_3c

    const p1, 0x7f0a0af4

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-eqz v1, :cond_3c

    const p1, 0x7f0a06c5

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    if-eqz v2, :cond_3c

    new-instance p1, Lvs;

    check-cast p0, Landroid/widget/FrameLayout;

    invoke-direct {p1, p0, v0, v1, v2}, Lvs;-><init>(Landroid/widget/FrameLayout;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/TextView;)V

    return-object p1

    :cond_3c
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lvs;
    .registers 9

    const v0, 0x7f0d03a5

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p1, 0x7f0a021a

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/widget/TextView;

    if-eqz v3, :cond_3a

    const p1, 0x7f0a0388

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;

    if-eqz v4, :cond_3a

    const p1, 0x7f0a0ac0

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/widget/TextView;

    if-eqz v5, :cond_3a

    new-instance v1, Lvs;

    move-object v2, p0

    check-cast v2, Landroid/widget/LinearLayout;

    const/16 v6, 0x15

    invoke-direct/range {v1 .. v6}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v1

    :cond_3a
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lvs;->a:B

    iget-object p0, p0, Lvs;->b:Landroid/view/ViewGroup;

    packed-switch v0, :pswitch_data_56

    check-cast p0, Lcom/opera/android/weather/view/WeatherWidgetView;

    return-object p0

    :pswitch_a
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_d
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    return-object p0

    :pswitch_10
    check-cast p0, Lcom/opera/android/vpn/LocationButton;

    return-object p0

    :pswitch_13
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_16
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_19
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_1c
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_1f
    check-cast p0, Lcom/opera/android/search/behavior/ScrollableToolbarLinearLayout;

    return-object p0

    :pswitch_22
    check-cast p0, Landroid/widget/RelativeLayout;

    return-object p0

    :pswitch_25
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_28
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_2b
    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    return-object p0

    :pswitch_2e
    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    return-object p0

    :pswitch_31
    check-cast p0, Lcom/opera/android/custom_views/CardView;

    return-object p0

    :pswitch_34
    check-cast p0, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;

    return-object p0

    :pswitch_37
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_3a
    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    return-object p0

    :pswitch_3d
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_40
    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;

    return-object p0

    :pswitch_43
    check-cast p0, Lcom/opera/android/widget/SelectableRelativeLayout;

    return-object p0

    :pswitch_46
    check-cast p0, Lcom/opera/android/settings/BigSwitchButton;

    return-object p0

    :pswitch_49
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_4c
    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    return-object p0

    :pswitch_4f
    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    :pswitch_51
    return-object p0

    :pswitch_52
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    nop

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_52
        :pswitch_51
        :pswitch_51
        :pswitch_4f
        :pswitch_4c
        :pswitch_49
        :pswitch_46
        :pswitch_43
        :pswitch_40
        :pswitch_3d
        :pswitch_3a
        :pswitch_37
        :pswitch_34
        :pswitch_31
        :pswitch_2e
        :pswitch_2b
        :pswitch_28
        :pswitch_25
        :pswitch_22
        :pswitch_1f
        :pswitch_1c
        :pswitch_19
        :pswitch_16
        :pswitch_13
        :pswitch_10
        :pswitch_d
        :pswitch_a
    .end packed-switch
.end method
