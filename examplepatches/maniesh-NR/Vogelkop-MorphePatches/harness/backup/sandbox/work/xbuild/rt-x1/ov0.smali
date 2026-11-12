.class public final Lov0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/view/View;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 14
    iput-byte p4, p0, Lov0;->a:B

    iput-object p1, p0, Lov0;->b:Landroid/view/View;

    iput-object p2, p0, Lov0;->c:Ljava/lang/Object;

    iput-object p3, p0, Lov0;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/LinearLayout;)V
    .registers 5

    const/16 v0, 0x11

    iput-byte v0, p0, Lov0;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lov0;->b:Landroid/view/View;

    iput-object p2, p0, Lov0;->d:Ljava/lang/Object;

    iput-object p3, p0, Lov0;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/bookmarks/ImportBookmarksBanner;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/TextView;Lcom/google/android/material/button/MaterialButton;)V
    .registers 5

    const/16 p3, 0x13

    iput-byte p3, p0, Lov0;->a:B

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lov0;->b:Landroid/view/View;

    .line 17
    iput-object p2, p0, Lov0;->c:Ljava/lang/Object;

    .line 18
    iput-object p4, p0, Lov0;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;Lpq3;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/widget/AspectRatioImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;Lcom/opera/android/custom_views/DialogTitle;Lcom/opera/android/custom_views/DialogTitle;)V
    .registers 11

    const/16 p2, 0x12

    iput-byte p2, p0, Lov0;->a:B

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lov0;->b:Landroid/view/View;

    .line 21
    iput-object p3, p0, Lov0;->c:Ljava/lang/Object;

    .line 22
    iput-object p6, p0, Lov0;->d:Ljava/lang/Object;

    return-void
.end method

.method public static a(Landroid/view/View;)Lov0;
    .registers 5

    const v0, 0x7f0a0322

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v1, :cond_1f

    const v0, 0x7f0a069d

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v2, :cond_1f

    new-instance v0, Lov0;

    check-cast p0, Landroid/widget/RelativeLayout;

    const/4 v3, 0x6

    invoke-direct {v0, p0, v1, v2, v3}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0

    :cond_1f
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

.method public static b(Landroid/view/View;)Lov0;
    .registers 5

    const v0, 0x7f0a01c0

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2e

    invoke-static {v1}, Lov0;->c(Landroid/view/View;)Lov0;

    move-result-object v0

    const v1, 0x7f0a0322

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v2, :cond_2d

    const v1, 0x7f0a06b5

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    if-eqz v2, :cond_2d

    new-instance v1, Lov0;

    check-cast p0, Lcom/opera/android/custom_views/CardView;

    const/16 v3, 0xd

    invoke-direct {v1, p0, v0, v2, v3}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v1

    :cond_2d
    move v0, v1

    :cond_2e
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

.method public static c(Landroid/view/View;)Lov0;
    .registers 5

    const v0, 0x7f0a074b

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/CapturableButton;

    if-eqz v1, :cond_20

    const v0, 0x7f0a084d

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/CapturableButton;

    if-eqz v2, :cond_20

    new-instance v0, Lov0;

    check-cast p0, Landroid/widget/LinearLayout;

    const/16 v3, 0xe

    invoke-direct {v0, p0, v1, v2, v3}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0

    :cond_20
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

.method public static d(Landroid/view/View;)Lov0;
    .registers 5

    const v0, 0x7f0a0357

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-eqz v1, :cond_20

    const v0, 0x7f0a0322

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_20

    new-instance v0, Lov0;

    check-cast p0, Landroid/widget/LinearLayout;

    const/16 v3, 0xf

    invoke-direct {v0, p0, v1, v2, v3}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0

    :cond_20
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

.method public static e(Landroid/view/View;)Lov0;
    .registers 5

    const v0, 0x7f0a0201

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v1, :cond_20

    const v0, 0x7f0a06c5

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    if-eqz v2, :cond_20

    new-instance v0, Lov0;

    check-cast p0, Landroid/widget/LinearLayout;

    const/16 v3, 0x17

    invoke-direct {v0, p0, v1, v2, v3}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0

    :cond_20
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

.method public static f(Landroid/view/View;)Lov0;
    .registers 5

    const v0, 0x7f0a0517

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1e

    const v0, 0x7f0a076c

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v2, :cond_1e

    new-instance v0, Lov0;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    const/16 v3, 0x18

    invoke-direct {v0, p0, v1, v2, v3}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0

    :cond_1e
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

.method public static g(Landroid/view/View;)Lov0;
    .registers 5

    const v0, 0x7f0a04f5

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1c

    const v0, 0x7f0a0874

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/widget/Guideline;

    if-eqz v2, :cond_1c

    new-instance v0, Lov0;

    const/16 v3, 0x1d

    invoke-direct {v0, p0, v1, v2, v3}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0

    :cond_1c
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

.method public static h(Landroid/view/LayoutInflater;)Lov0;
    .registers 5

    const v0, 0x7f0d00ed

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const v0, 0x7f0a0578

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-eqz v1, :cond_29

    const v0, 0x7f0a057b

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_29

    new-instance v0, Lov0;

    check-cast p0, Landroid/widget/LinearLayout;

    const/16 v2, 0xa

    invoke-direct {v0, p0, v1, v3, v2}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

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

    return-object v2
.end method

.method public static i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lov0;
    .registers 5

    const v0, 0x7f0d0303

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

    const v0, 0x7f0a0571

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    if-eqz v1, :cond_2e

    new-instance v0, Lov0;

    check-cast p0, Landroid/widget/FrameLayout;

    const/16 v2, 0x1a

    invoke-direct {v0, p0, p1, v1, v2}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

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

.method public static j(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;)Lov0;
    .registers 4

    const v0, 0x7f0d0108

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const p1, 0x7f0a0362

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/OperaEditText;

    if-eqz v0, :cond_1d

    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    new-instance p1, Lov0;

    const/16 v1, 0xb

    invoke-direct {p1, p0, v0, p0, v1}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

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

    iget-byte v0, p0, Lov0;->a:B

    iget-object p0, p0, Lov0;->b:Landroid/view/View;

    packed-switch v0, :pswitch_data_60

    return-object p0

    :pswitch_8
    check-cast p0, Lcom/opera/android/custom_views/FitWindowsFrameLayoutWithToolbar;

    return-object p0

    :pswitch_b
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_e
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_11
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_14
    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    return-object p0

    :pswitch_17
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_1a
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_1d
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_20
    check-cast p0, Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;

    return-object p0

    :pswitch_23
    check-cast p0, Lcom/opera/android/bookmarks/ImportBookmarksBanner;

    return-object p0

    :pswitch_26
    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;

    return-object p0

    :pswitch_29
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_2c
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_2f
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_32
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_35
    check-cast p0, Lcom/opera/android/custom_views/CardView;

    return-object p0

    :pswitch_38
    check-cast p0, Lcom/opera/android/custom_views/AnimationEmptyListView;

    return-object p0

    :pswitch_3b
    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    return-object p0

    :pswitch_3e
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_41
    check-cast p0, Lcom/opera/android/custom_views/FadingNestedScrollView;

    return-object p0

    :pswitch_44
    check-cast p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    return-object p0

    :pswitch_47
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_4a
    check-cast p0, Landroid/widget/RelativeLayout;

    return-object p0

    :pswitch_4d
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_50
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_53
    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    return-object p0

    :pswitch_56
    check-cast p0, Lcom/opera/android/custom_views/FitWindowsFrameLayoutWithToolbar;

    return-object p0

    :pswitch_59
    check-cast p0, Lcom/opera/android/custom_views/FitWindowsFrameLayoutWithToolbar;

    return-object p0

    :pswitch_5c
    check-cast p0, Lcom/opera/android/widget/SelectableRelativeLayout;

    return-object p0

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_5c
        :pswitch_59
        :pswitch_56
        :pswitch_53
        :pswitch_50
        :pswitch_4d
        :pswitch_4a
        :pswitch_47
        :pswitch_44
        :pswitch_41
        :pswitch_3e
        :pswitch_3b
        :pswitch_38
        :pswitch_35
        :pswitch_32
        :pswitch_2f
        :pswitch_2c
        :pswitch_29
        :pswitch_26
        :pswitch_23
        :pswitch_20
        :pswitch_1d
        :pswitch_1a
        :pswitch_17
        :pswitch_14
        :pswitch_11
        :pswitch_e
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method
