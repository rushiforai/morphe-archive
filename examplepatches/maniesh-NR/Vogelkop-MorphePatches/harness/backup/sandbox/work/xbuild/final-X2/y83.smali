.class public final Ly83;
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

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingTextView;Ljava/lang/Object;Ljava/lang/Object;Lmlc;B)V
    .registers 9

    .line 23
    iput-byte p8, p0, Ly83;->a:B

    iput-object p1, p0, Ly83;->g:Ljava/lang/Object;

    iput-object p2, p0, Ly83;->b:Landroid/view/ViewGroup;

    iput-object p3, p0, Ly83;->c:Ljava/lang/Object;

    iput-object p4, p0, Ly83;->d:Ljava/lang/Object;

    iput-object p5, p0, Ly83;->e:Ljava/lang/Object;

    iput-object p6, p0, Ly83;->f:Ljava/lang/Object;

    iput-object p7, p0, Ly83;->h:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;B)V
    .registers 9

    .line 22
    iput-byte p8, p0, Ly83;->a:B

    iput-object p1, p0, Ly83;->b:Landroid/view/ViewGroup;

    iput-object p2, p0, Ly83;->c:Ljava/lang/Object;

    iput-object p3, p0, Ly83;->d:Ljava/lang/Object;

    iput-object p4, p0, Ly83;->e:Ljava/lang/Object;

    iput-object p5, p0, Ly83;->f:Ljava/lang/Object;

    iput-object p6, p0, Ly83;->g:Ljava/lang/Object;

    iput-object p7, p0, Ly83;->h:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/view/View;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/FrameLayout;Lcom/google/android/material/progressindicator/CircularProgressIndicator;Landroid/widget/TextView;)V
    .registers 9

    const/16 v0, 0xb

    iput-byte v0, p0, Ly83;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly83;->b:Landroid/view/ViewGroup;

    iput-object p2, p0, Ly83;->c:Ljava/lang/Object;

    iput-object p3, p0, Ly83;->g:Ljava/lang/Object;

    iput-object p4, p0, Ly83;->d:Ljava/lang/Object;

    iput-object p5, p0, Ly83;->e:Ljava/lang/Object;

    iput-object p6, p0, Ly83;->h:Ljava/lang/Object;

    iput-object p7, p0, Ly83;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/widget/GraphView;Lcom/google/android/material/button/MaterialButton;)V
    .registers 9

    const/4 p8, 0x1

    iput-byte p8, p0, Ly83;->a:B

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Ly83;->b:Landroid/view/ViewGroup;

    .line 26
    iput-object p2, p0, Ly83;->c:Ljava/lang/Object;

    .line 27
    iput-object p3, p0, Ly83;->d:Ljava/lang/Object;

    .line 28
    iput-object p4, p0, Ly83;->e:Ljava/lang/Object;

    .line 29
    iput-object p5, p0, Ly83;->f:Ljava/lang/Object;

    .line 30
    iput-object p6, p0, Ly83;->g:Ljava/lang/Object;

    .line 31
    iput-object p7, p0, Ly83;->h:Ljava/lang/Object;

    return-void
.end method

.method public static a(Landroid/view/View;)Ly83;
    .registers 12

    const v0, 0x7f0a00f9

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    if-eqz v4, :cond_5a

    move-object v3, p0

    check-cast v3, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    const v0, 0x7f0a037c

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/opera/android/custom_views/AnimationEmptyListView;

    if-eqz v5, :cond_5a

    const v0, 0x7f0a0384

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    if-eqz v6, :cond_5a

    const v0, 0x7f0a08ae

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v7, :cond_5a

    const v0, 0x7f0a0944

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    if-eqz v8, :cond_5a

    const v0, 0x7f0a0aad

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    if-eqz v9, :cond_5a

    const v0, 0x7f0a0bba

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/appcompat/widget/Toolbar;

    if-eqz v1, :cond_5a

    new-instance v2, Ly83;

    const/4 v10, 0x0

    invoke-direct/range {v2 .. v10}, Ly83;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;B)V

    return-object v2

    :cond_5a
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

.method public static b(Landroid/view/View;)Ly83;
    .registers 12

    const v0, 0x7f0a0783

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_55

    invoke-static {v1}, Lor2;->b(Landroid/view/View;)Lor2;

    move-result-object v4

    const v0, 0x7f0a0784

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_55

    invoke-static {v1}, Lor2;->b(Landroid/view/View;)Lor2;

    move-result-object v5

    const v0, 0x7f0a0785

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v6, :cond_55

    const v0, 0x7f0a0786

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/TextView;

    if-eqz v7, :cond_55

    const v0, 0x7f0a078d

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_55

    invoke-static {v1}, Lor2;->b(Landroid/view/View;)Lor2;

    move-result-object v8

    const v0, 0x7f0a0885

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/ImageView;

    if-eqz v9, :cond_55

    new-instance v2, Ly83;

    move-object v3, p0

    check-cast v3, Landroid/widget/FrameLayout;

    const/4 v10, 0x5

    invoke-direct/range {v2 .. v10}, Ly83;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;B)V

    return-object v2

    :cond_55
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

.method public static c(Landroid/view/View;)Ly83;
    .registers 12

    const v0, 0x7f0a01b6

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/OperaButtonBarLayout;

    if-eqz v1, :cond_73

    const v0, 0x7f0a0276

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/view/ViewStub;

    if-eqz v4, :cond_73

    move-object v3, p0

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    const v0, 0x7f0a0322

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v5, :cond_73

    const v0, 0x7f0a06b5

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v6, :cond_73

    const v0, 0x7f0a074b

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v7, :cond_73

    const v0, 0x7f0a084d

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v8, :cond_73

    const v0, 0x7f0a092c

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/FadingScrollView;

    if-eqz v1, :cond_73

    const v0, 0x7f0a0a9f

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Space;

    if-eqz v1, :cond_73

    const v0, 0x7f0a06c5

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Lcom/opera/android/custom_views/DialogTitle;

    if-eqz v9, :cond_73

    new-instance v2, Ly83;

    const/4 v10, 0x6

    invoke-direct/range {v2 .. v10}, Ly83;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;B)V

    return-object v2

    :cond_73
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

.method public static d(Landroid/view/View;)Ly83;
    .registers 11

    const v0, 0x7f0a01c8

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/TextView;

    if-eqz v4, :cond_4e

    const v0, 0x7f0a02f4

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_4e

    const v0, 0x7f0a0322

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v6, :cond_4e

    const v0, 0x7f0a0565

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/FrameLayout;

    if-eqz v7, :cond_4e

    const v0, 0x7f0a0871

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    if-eqz v8, :cond_4e

    const v0, 0x7f0a06c5

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/TextView;

    if-eqz v9, :cond_4e

    new-instance v2, Ly83;

    move-object v3, p0

    check-cast v3, Landroid/widget/LinearLayout;

    invoke-direct/range {v2 .. v9}, Ly83;-><init>(Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/view/View;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/FrameLayout;Lcom/google/android/material/progressindicator/CircularProgressIndicator;Landroid/widget/TextView;)V

    return-object v2

    :cond_4e
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

.method public static e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ly83;
    .registers 4

    const v0, 0x7f0d0395

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Ly83;->d(Landroid/view/View;)Ly83;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 3

    iget-byte v0, p0, Ly83;->a:B

    iget-object v1, p0, Ly83;->g:Ljava/lang/Object;

    iget-object p0, p0, Ly83;->b:Landroid/view/ViewGroup;

    packed-switch v0, :pswitch_data_34

    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_c
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_f
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_12
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_15
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_18
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_1b
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_1e
    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_21
    check-cast p0, Landroid/widget/FrameLayout;

    return-object p0

    :pswitch_24
    check-cast v1, Landroid/view/View;

    return-object v1

    :pswitch_27
    check-cast v1, Landroid/view/View;

    return-object v1

    :pswitch_2a
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_2d
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_30
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    return-object p0

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_30
        :pswitch_2d
        :pswitch_2a
        :pswitch_27
        :pswitch_24
        :pswitch_21
        :pswitch_1e
        :pswitch_1b
        :pswitch_18
        :pswitch_15
        :pswitch_12
        :pswitch_f
        :pswitch_c
    .end packed-switch
.end method
