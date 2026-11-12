.class public final Lq5g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/view/ViewGroup;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 14
    iput-byte p4, p0, Lq5g;->a:B

    iput-object p1, p0, Lq5g;->b:Landroid/view/ViewGroup;

    iput-object p2, p0, Lq5g;->c:Ljava/lang/Object;

    iput-object p3, p0, Lq5g;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/widget/FrameLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V
    .registers 6

    const/16 p2, 0xe

    iput-byte p2, p0, Lq5g;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lq5g;->b:Landroid/view/ViewGroup;

    iput-object p3, p0, Lq5g;->c:Ljava/lang/Object;

    iput-object p5, p0, Lq5g;->d:Ljava/lang/Object;

    return-void
.end method

.method public static a(Landroid/view/View;)Lq5g;
    .registers 5

    const v0, 0x7f0a0ab0

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2d

    invoke-static {v1}, Lhi4;->b(Landroid/view/View;)Lhi4;

    move-result-object v0

    const v1, 0x7f0a0c72

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v2, :cond_2c

    const v1, 0x7f0a0c75

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v3, :cond_2c

    new-instance v1, Lq5g;

    check-cast p0, Landroid/widget/LinearLayout;

    const/4 v3, 0x3

    invoke-direct {v1, p0, v0, v2, v3}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v1

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

.method public static b(Landroid/widget/LinearLayout;)Lq5g;
    .registers 5

    const v0, 0x7f0a01d4

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    if-eqz v1, :cond_1d

    const v0, 0x7f0a01d5

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    if-eqz v2, :cond_1d

    new-instance v0, Lq5g;

    const/4 v3, 0x7

    invoke-direct {v0, p0, v1, v2, v3}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0

    :cond_1d
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

.method public static c(Landroid/view/LayoutInflater;)Lq5g;
    .registers 6

    const v0, 0x7f0d038e

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const v0, 0x7f0a02df

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/core/widget/NestedScrollView;

    if-eqz v1, :cond_35

    const v0, 0x7f0a07c6

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_35

    move-object v0, p0

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    const v3, 0x7f0a06c5

    invoke-static {v3, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v4, :cond_34

    new-instance p0, Lq5g;

    const/4 v2, 0x4

    invoke-direct {p0, v0, v1, v4, v2}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p0

    :cond_34
    move v0, v3

    :cond_35
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

.method public static d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lq5g;
    .registers 5

    const v0, 0x7f0d0399

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const p1, 0x7f0a0a3e

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz v0, :cond_27

    const p1, 0x7f0a0a3f

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    if-eqz v1, :cond_27

    new-instance p1, Lq5g;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    const/4 v2, 0x6

    invoke-direct {p1, p0, v0, v1, v2}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p1

    :cond_27
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

.method public static e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lq5g;
    .registers 5

    const v0, 0x7f0d03f2

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const p1, 0x7f0a04f1

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v0, :cond_28

    const p1, 0x7f0a06c5

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v1, :cond_28

    new-instance p1, Lq5g;

    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/16 v2, 0x9

    invoke-direct {p1, p0, v0, v1, v2}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p1

    :cond_28
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

    iget-byte v0, p0, Lq5g;->a:B

    iget-object p0, p0, Lq5g;->b:Landroid/view/ViewGroup;

    packed-switch v0, :pswitch_data_40

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    return-object p0

    :pswitch_a
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_d
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_10
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_13
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_16
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_19
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_1c
    check-cast p0, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;

    return-object p0

    :pswitch_1f
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_22
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_25
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_28
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_2b
    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    return-object p0

    :pswitch_2e
    check-cast p0, Lcom/opera/android/settings/SettingsStatisticView;

    return-object p0

    :pswitch_31
    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    return-object p0

    :pswitch_34
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_37
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_3a
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_3d
    check-cast p0, Lp5g;

    return-object p0

    :pswitch_data_40
    .packed-switch 0x0
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
