.class public final Lkf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/view/View;

.field public final c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLandroid/view/View;Ljava/lang/Object;)V
    .registers 4

    .line 12
    iput-byte p1, p0, Lkf;->a:B

    iput-object p2, p0, Lkf;->b:Landroid/view/View;

    iput-object p3, p0, Lkf;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/widget/LinearLayout;Lzt5;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/custom_views/DialogTitle;)V
    .registers 8

    const/16 p2, 0x9

    iput-byte p2, p0, Lkf;->a:B

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lkf;->b:Landroid/view/View;

    .line 18
    iput-object p3, p0, Lkf;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/custom_views/FadingRecyclerView;)V
    .registers 5

    const/4 p2, 0x3

    iput-byte p2, p0, Lkf;->a:B

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lkf;->b:Landroid/view/View;

    .line 21
    iput-object p4, p0, Lkf;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/favorites/NonCollapsingCardView;Lcom/opera/android/custom_views/FadingRecyclerView;Landroid/widget/TextView;)V
    .registers 4

    const/16 p2, 0xe

    iput-byte p2, p0, Lkf;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkf;->b:Landroid/view/View;

    iput-object p3, p0, Lkf;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lpq3;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/custom_views/CircleImageView;)V
    .registers 8

    const/16 p1, 0x8

    iput-byte p1, p0, Lkf;->a:B

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p2, p0, Lkf;->b:Landroid/view/View;

    .line 15
    iput-object p3, p0, Lkf;->c:Ljava/lang/Object;

    return-void
.end method

.method public static a(Landroid/view/View;)Lkf;
    .registers 4

    const v0, 0x7f0a02a7

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/CheckBox;

    if-eqz v1, :cond_14

    new-instance v0, Lkf;

    check-cast p0, Landroid/widget/FrameLayout;

    const/4 v2, 0x2

    invoke-direct {v0, v2, p0, v1}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    return-object v0

    :cond_14
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

.method public static b(Landroid/widget/FrameLayout;)Lkf;
    .registers 4

    const v0, 0x7f0a01d1

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/startpage/SoftwareClipMaxWidthLinearLayout;

    if-eqz v1, :cond_13

    new-instance v0, Lkf;

    const/16 v2, 0x1d

    invoke-direct {v0, v2, p0, v1}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    return-object v0

    :cond_13
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

.method public static c(Landroid/view/View;)Lkf;
    .registers 4

    const v0, 0x7f0a0822

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_14

    new-instance v0, Lkf;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;

    const/4 v2, 0x6

    invoke-direct {v0, v2, p0, v1}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    return-object v0

    :cond_14
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

.method public static d(Landroid/view/View;)Lkf;
    .registers 4

    const v0, 0x7f0a0454

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v1, :cond_36

    const v0, 0x7f0a0455

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_36

    const v0, 0x7f0a0456

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/startpage/common/SnappingRecyclerView;

    if-eqz v2, :cond_36

    const v0, 0x7f0a0457

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v2, :cond_36

    new-instance v0, Lkf;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    const/16 v2, 0xd

    invoke-direct {v0, v2, p0, v1}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    return-object v0

    :cond_36
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

.method public static e(Landroid/view/View;)Lkf;
    .registers 5

    const v0, 0x7f0a00f9

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    if-eqz v1, :cond_2d

    move-object v0, p0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    const v1, 0x7f0a0797

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    if-eqz v2, :cond_2c

    const v1, 0x7f0a0bba

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/appcompat/widget/Toolbar;

    if-eqz v3, :cond_2c

    new-instance p0, Lkf;

    const/16 v1, 0xf

    invoke-direct {p0, v1, v0, v2}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    return-object p0

    :cond_2c
    move v0, v1

    :cond_2d
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

.method public static f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lkf;
    .registers 4

    const v0, 0x7f0d0230

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const p1, 0x7f0a0321

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v0, :cond_49

    const p1, 0x7f0a0325

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_49

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const p1, 0x7f0a0326

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_49

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const p1, 0x7f0a0604

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v0, :cond_49

    const p1, 0x7f0a0aab

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/BestHorizontalFitLayout;

    if-eqz v1, :cond_49

    new-instance p1, Lkf;

    check-cast p0, Landroid/widget/RelativeLayout;

    const/16 v1, 0x10

    invoke-direct {p1, v1, p0, v0}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    return-object p1

    :cond_49
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

.method public static g(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;)Lkf;
    .registers 4

    const v0, 0x7f0d0107

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz p0, :cond_17

    check-cast p0, Lcom/opera/android/custom_views/RadioButton;

    new-instance p1, Lkf;

    const/16 v0, 0xa

    invoke-direct {p1, v0, p0, p0}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    return-object p1

    :cond_17
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static h(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lkf;
    .registers 4

    const v0, 0x7f0d0304

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const p1, 0x7f0a02ef

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2f

    new-instance p1, Lb98;

    check-cast v0, Landroid/widget/FrameLayout;

    const/4 v1, 0x3

    invoke-direct {p1, v0, v1}, Lb98;-><init>(Landroid/widget/FrameLayout;B)V

    const v0, 0x7f0a08f1

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    if-eqz v1, :cond_2e

    new-instance v0, Lkf;

    check-cast p0, Landroid/widget/FrameLayout;

    const/16 v1, 0x14

    invoke-direct {v0, v1, p0, p1}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    return-object v0

    :cond_2e
    move p1, v0

    :cond_2f
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

.method public static i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lkf;
    .registers 4

    const v0, 0x7f0d03a4

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz p0, :cond_17

    check-cast p0, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;

    new-instance p1, Lkf;

    const/16 v0, 0x1b

    invoke-direct {p1, v0, p0, p0}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    return-object p1

    :cond_17
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lkf;
    .registers 4

    const v0, 0x7f0d03a9

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const p1, 0x7f0a0a7f

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v0, :cond_1d

    new-instance p1, Lkf;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    const/16 v1, 0x1c

    invoke-direct {p1, v1, p0, v0}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    return-object p1

    :cond_1d
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

    iget-byte v0, p0, Lkf;->a:B

    iget-object p0, p0, Lkf;->b:Landroid/view/View;

    packed-switch v0, :pswitch_data_5e

    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_a
    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    return-object p0

    :pswitch_d
    check-cast p0, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;

    return-object p0

    :pswitch_10
    check-cast p0, Lcom/opera/android/StatusBarDrawingFrameLayout;

    return-object p0

    :pswitch_13
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_16
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_19
    check-cast p0, Lcom/opera/android/custom_views/OperaRadioGroup;

    return-object p0

    :pswitch_1c
    check-cast p0, Lcom/opera/android/custom_views/FadingRecyclerView;

    :pswitch_1e
    return-object p0

    :pswitch_1f
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_22
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_25
    check-cast p0, Landroid/widget/RelativeLayout;

    return-object p0

    :pswitch_28
    check-cast p0, Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;

    return-object p0

    :pswitch_2b
    check-cast p0, Landroid/widget/RelativeLayout;

    return-object p0

    :pswitch_2e
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    return-object p0

    :pswitch_31
    check-cast p0, Lcom/opera/android/favorites/NonCollapsingCardView;

    return-object p0

    :pswitch_34
    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    return-object p0

    :pswitch_37
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_3a
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_3d
    check-cast p0, Lcom/opera/android/custom_views/RadioButton;

    return-object p0

    :pswitch_40
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_43
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_46
    check-cast p0, Lcom/opera/android/suggestion/CompactSuggestionView;

    return-object p0

    :pswitch_49
    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;

    return-object p0

    :pswitch_4c
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    return-object p0

    :pswitch_4f
    check-cast p0, Lcom/opera/android/theme/ThemeableRecyclerView;

    return-object p0

    :pswitch_52
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_55
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_58
    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    return-object p0

    :pswitch_5b
    check-cast p0, Lcom/opera/android/suggestion/adapter/SuggestionListActionItem;

    return-object p0

    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_5b
        :pswitch_58
        :pswitch_55
        :pswitch_52
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
        :pswitch_1e
        :pswitch_1c
        :pswitch_19
        :pswitch_16
        :pswitch_13
        :pswitch_10
        :pswitch_d
        :pswitch_a
    .end packed-switch
.end method
