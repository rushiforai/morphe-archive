.class public final Lowc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/widget/LinearLayout;

.field public final c:Lcom/opera/android/custom_views/StylingImageView;

.field public final d:Landroid/widget/LinearLayout;

.field public final e:Lcom/opera/android/custom_views/StylingTextView;

.field public final f:Lcom/opera/android/custom_views/StylingImageView;

.field public final g:Landroid/widget/FrameLayout;

.field public final h:Lcom/opera/android/custom_views/StylingTextView;

.field public final i:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Landroid/view/View;)V
    .registers 10

    const/4 v0, 0x0

    iput-byte v0, p0, Lowc;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lowc;->b:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lowc;->c:Lcom/opera/android/custom_views/StylingImageView;

    iput-object p3, p0, Lowc;->g:Landroid/widget/FrameLayout;

    iput-object p4, p0, Lowc;->f:Lcom/opera/android/custom_views/StylingImageView;

    iput-object p5, p0, Lowc;->d:Landroid/widget/LinearLayout;

    iput-object p6, p0, Lowc;->e:Lcom/opera/android/custom_views/StylingTextView;

    iput-object p7, p0, Lowc;->h:Lcom/opera/android/custom_views/StylingTextView;

    iput-object p8, p0, Lowc;->i:Landroid/view/View;

    return-void
.end method

.method public constructor <init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingTextView;Landroid/view/View;)V
    .registers 10

    const/4 v0, 0x1

    iput-byte v0, p0, Lowc;->a:B

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lowc;->b:Landroid/widget/LinearLayout;

    .line 25
    iput-object p2, p0, Lowc;->c:Lcom/opera/android/custom_views/StylingImageView;

    .line 26
    iput-object p3, p0, Lowc;->d:Landroid/widget/LinearLayout;

    .line 27
    iput-object p4, p0, Lowc;->e:Lcom/opera/android/custom_views/StylingTextView;

    .line 28
    iput-object p5, p0, Lowc;->f:Lcom/opera/android/custom_views/StylingImageView;

    .line 29
    iput-object p6, p0, Lowc;->g:Landroid/widget/FrameLayout;

    .line 30
    iput-object p7, p0, Lowc;->h:Lcom/opera/android/custom_views/StylingTextView;

    .line 31
    iput-object p8, p0, Lowc;->i:Landroid/view/View;

    return-void
.end method

.method public static a(Landroid/view/View;)Lowc;
    .registers 12

    const v0, 0x7f0a04b5

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v4, :cond_5a

    const v0, 0x7f0a0620

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/LinearLayout;

    if-eqz v5, :cond_5a

    const v0, 0x7f0a086e

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v6, :cond_5a

    const v0, 0x7f0a0955

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v7, :cond_5a

    const v0, 0x7f0a0956

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/FrameLayout;

    if-eqz v8, :cond_5a

    const v0, 0x7f0a0958

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v9, :cond_5a

    const v0, 0x7f0a0c88

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    if-eqz v10, :cond_5a

    new-instance v2, Lowc;

    move-object v3, p0

    check-cast v3, Landroid/widget/LinearLayout;

    invoke-direct/range {v2 .. v10}, Lowc;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingTextView;Landroid/view/View;)V

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


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lowc;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lowc;->b:Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lowc;->b:Landroid/widget/LinearLayout;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
