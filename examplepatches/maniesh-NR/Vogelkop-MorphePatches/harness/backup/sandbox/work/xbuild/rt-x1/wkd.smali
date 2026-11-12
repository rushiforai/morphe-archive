.class public final Lwkd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final a:Lcom/opera/android/media/PlayerControlView;

.field public final b:Lcom/opera/android/custom_views/StylingImageButton;

.field public final c:Lcom/opera/android/custom_views/StylingImageButton;

.field public final d:Lcom/opera/android/custom_views/StylingImageButton;

.field public final e:Lcom/opera/android/custom_views/StylingImageButton;

.field public final f:Lcom/opera/android/custom_views/StylingImageButton;

.field public final g:Lcom/opera/android/media/PlayerControlView;

.field public final h:Lcom/opera/android/custom_views/StylingImageButton;

.field public final i:Lcom/opera/android/custom_views/StylingImageButton;

.field public final j:Lcom/opera/android/custom_views/StylingImageButton;

.field public final k:Lcom/google/android/material/slider/Slider;

.field public final l:Landroid/widget/Space;

.field public final m:Landroid/widget/Space;

.field public final n:Lcom/opera/android/custom_views/StylingTextView;

.field public final o:Lcom/opera/android/custom_views/StylingTextView;

.field public final p:Lcom/opera/android/custom_views/StylingTextView;

.field public final q:Lcom/opera/android/custom_views/StylingTextView;

.field public final r:Landroid/widget/RelativeLayout;

.field public final s:Lcom/opera/android/custom_views/StylingImageButton;

.field public final t:Lcom/opera/android/custom_views/StylingImageButton;


# direct methods
.method public constructor <init>(Lcom/opera/android/media/PlayerControlView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/media/PlayerControlView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/google/android/material/slider/Slider;Landroid/widget/Space;Landroid/widget/Space;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/RelativeLayout;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;)V
    .registers 21

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwkd;->a:Lcom/opera/android/media/PlayerControlView;

    iput-object p2, p0, Lwkd;->b:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p3, p0, Lwkd;->c:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p4, p0, Lwkd;->d:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p5, p0, Lwkd;->e:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p6, p0, Lwkd;->f:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p7, p0, Lwkd;->g:Lcom/opera/android/media/PlayerControlView;

    iput-object p8, p0, Lwkd;->h:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p9, p0, Lwkd;->i:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p10, p0, Lwkd;->j:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p11, p0, Lwkd;->k:Lcom/google/android/material/slider/Slider;

    iput-object p12, p0, Lwkd;->l:Landroid/widget/Space;

    iput-object p13, p0, Lwkd;->m:Landroid/widget/Space;

    iput-object p14, p0, Lwkd;->n:Lcom/opera/android/custom_views/StylingTextView;

    iput-object p15, p0, Lwkd;->o:Lcom/opera/android/custom_views/StylingTextView;

    move-object/from16 p1, p16

    iput-object p1, p0, Lwkd;->p:Lcom/opera/android/custom_views/StylingTextView;

    move-object/from16 p1, p17

    iput-object p1, p0, Lwkd;->q:Lcom/opera/android/custom_views/StylingTextView;

    move-object/from16 p1, p18

    iput-object p1, p0, Lwkd;->r:Landroid/widget/RelativeLayout;

    move-object/from16 p1, p19

    iput-object p1, p0, Lwkd;->s:Lcom/opera/android/custom_views/StylingImageButton;

    move-object/from16 p1, p20

    iput-object p1, p0, Lwkd;->t:Lcom/opera/android/custom_views/StylingImageButton;

    return-void
.end method

.method public static a(Landroid/view/View;)Lwkd;
    .registers 25

    move-object/from16 v0, p0

    const v1, 0x7f0a0748

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_f7

    const v1, 0x7f0a083e

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v5, :cond_f7

    const v1, 0x7f0a0840

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v6, :cond_f7

    const v1, 0x7f0a0841

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v7, :cond_f7

    const v1, 0x7f0a0842

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v8, :cond_f7

    const v1, 0x7f0a0843

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v9, :cond_f7

    move-object v4, v0

    check-cast v4, Lcom/opera/android/media/PlayerControlView;

    const v1, 0x7f0a0895

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v11, :cond_f7

    const v1, 0x7f0a0896

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v12, :cond_f7

    const v1, 0x7f0a0a57

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v13, :cond_f7

    const v1, 0x7f0a0a87

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/google/android/material/slider/Slider;

    if-eqz v14, :cond_f7

    const v1, 0x7f0a0aa2

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Landroid/widget/Space;

    if-eqz v15, :cond_f7

    const v1, 0x7f0a0aa3

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Landroid/widget/Space;

    if-eqz v16, :cond_f7

    const v1, 0x7f0a0af4

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v17, v2

    check-cast v17, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v17, :cond_f7

    const v1, 0x7f0a0b94

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v18, v2

    check-cast v18, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v18, :cond_f7

    const v1, 0x7f0a0b96

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v19, v2

    check-cast v19, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v19, :cond_f7

    const v1, 0x7f0a06c5

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v20, v2

    check-cast v20, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v20, :cond_f7

    const v1, 0x7f0a0baf

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v21, v2

    check-cast v21, Landroid/widget/RelativeLayout;

    if-eqz v21, :cond_f7

    const v1, 0x7f0a0bd8

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v22, v2

    check-cast v22, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v22, :cond_f7

    const v1, 0x7f0a0bd9

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v23, v2

    check-cast v23, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v23, :cond_f7

    new-instance v3, Lwkd;

    move-object v10, v4

    invoke-direct/range {v3 .. v23}, Lwkd;-><init>(Lcom/opera/android/media/PlayerControlView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/media/PlayerControlView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/google/android/material/slider/Slider;Landroid/widget/Space;Landroid/widget/Space;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/RelativeLayout;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;)V

    return-object v3

    :cond_f7
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lwkd;->a:Lcom/opera/android/media/PlayerControlView;

    return-object p0
.end method
