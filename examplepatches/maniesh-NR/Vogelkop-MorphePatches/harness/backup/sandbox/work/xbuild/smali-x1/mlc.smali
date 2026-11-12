.class public final Lmlc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final c:Lcom/opera/android/custom_views/StylingTextView;

.field public final d:Lcom/opera/android/custom_views/StylingTextView;

.field public final e:Lcom/opera/android/custom_views/StylingTextView;

.field public final f:Landroid/view/View;

.field public final g:Landroid/view/View;

.field public final h:Ljava/lang/Object;

.field public final i:Landroid/view/View;

.field public final j:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/opera/android/startpage/livescore/LiveScoreAudioCommentaryView;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Ly83;Lcom/opera/android/startpage/livescore/LiveScoreCarouselStarButton;Lmlc;)V
    .registers 11

    const/4 v0, 0x0

    iput-byte v0, p0, Lmlc;->a:B

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lmlc;->f:Landroid/view/View;

    .line 27
    iput-object p2, p0, Lmlc;->g:Landroid/view/View;

    .line 28
    iput-object p3, p0, Lmlc;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 29
    iput-object p4, p0, Lmlc;->c:Lcom/opera/android/custom_views/StylingTextView;

    .line 30
    iput-object p5, p0, Lmlc;->d:Lcom/opera/android/custom_views/StylingTextView;

    .line 31
    iput-object p6, p0, Lmlc;->e:Lcom/opera/android/custom_views/StylingTextView;

    .line 32
    iput-object p7, p0, Lmlc;->h:Ljava/lang/Object;

    .line 33
    iput-object p8, p0, Lmlc;->i:Landroid/view/View;

    .line 34
    iput-object p9, p0, Lmlc;->j:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/ImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/ImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;)V
    .registers 11

    const/4 v0, 0x1

    iput-byte v0, p0, Lmlc;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmlc;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p2, p0, Lmlc;->f:Landroid/view/View;

    iput-object p3, p0, Lmlc;->g:Landroid/view/View;

    iput-object p4, p0, Lmlc;->c:Lcom/opera/android/custom_views/StylingTextView;

    iput-object p5, p0, Lmlc;->d:Lcom/opera/android/custom_views/StylingTextView;

    iput-object p6, p0, Lmlc;->h:Ljava/lang/Object;

    iput-object p7, p0, Lmlc;->i:Landroid/view/View;

    iput-object p8, p0, Lmlc;->e:Lcom/opera/android/custom_views/StylingTextView;

    iput-object p9, p0, Lmlc;->j:Ljava/lang/Object;

    return-void
.end method

.method public static a(Landroid/view/View;)Lmlc;
    .registers 13

    const v0, 0x7f0a0136

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v4, :cond_69

    const v0, 0x7f0a0137

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/ImageView;

    if-eqz v5, :cond_69

    const v0, 0x7f0a0138

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v6, :cond_69

    const v0, 0x7f0a013a

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v7, :cond_69

    const v0, 0x7f0a0543

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v8, :cond_69

    const v0, 0x7f0a0545

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/ImageView;

    if-eqz v9, :cond_69

    const v0, 0x7f0a0546

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v10, :cond_69

    const v0, 0x7f0a0548

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v11, :cond_69

    move-object v3, p0

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v2, Lmlc;

    invoke-direct/range {v2 .. v11}, Lmlc;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/ImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/ImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;)V

    return-object v2

    :cond_69
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

    iget-byte v0, p0, Lmlc;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lmlc;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lmlc;->f:Landroid/view/View;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
