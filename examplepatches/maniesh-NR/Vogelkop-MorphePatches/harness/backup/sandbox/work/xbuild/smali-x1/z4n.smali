.class public final Lz4n;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/widget/FrameLayout;

.field public final b:Lcom/opera/android/widget/ClickAwareCardView;

.field public final c:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final d:Lcom/opera/android/custom_views/StylingTextView;

.field public final e:Lcom/opera/android/custom_views/StylingTextView;

.field public final f:Lcom/opera/android/custom_views/StylingImageView;

.field public final g:Lcom/opera/android/custom_views/StylingImageButton;

.field public final h:Lcom/opera/android/widget/RoundedImageView;

.field public final i:Lcom/google/android/material/button/MaterialButton;

.field public final j:Landroidx/constraintlayout/widget/ConstraintLayout;


# direct methods
.method public constructor <init>(Landroid/widget/FrameLayout;Lcom/opera/android/widget/ClickAwareCardView;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/widget/RoundedImageView;Lcom/google/android/material/button/MaterialButton;Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lz4n;->a:Landroid/widget/FrameLayout;

    iput-object p2, p0, Lz4n;->b:Lcom/opera/android/widget/ClickAwareCardView;

    iput-object p3, p0, Lz4n;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p4, p0, Lz4n;->d:Lcom/opera/android/custom_views/StylingTextView;

    iput-object p5, p0, Lz4n;->e:Lcom/opera/android/custom_views/StylingTextView;

    iput-object p6, p0, Lz4n;->f:Lcom/opera/android/custom_views/StylingImageView;

    iput-object p7, p0, Lz4n;->g:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p8, p0, Lz4n;->h:Lcom/opera/android/widget/RoundedImageView;

    iput-object p9, p0, Lz4n;->i:Lcom/google/android/material/button/MaterialButton;

    iput-object p10, p0, Lz4n;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_6e

    instance-of v0, p1, Lz4n;

    if-eqz v0, :cond_6c

    check-cast p1, Lz4n;

    iget-object v0, p0, Lz4n;->a:Landroid/widget/FrameLayout;

    iget-object v1, p1, Lz4n;->a:Landroid/widget/FrameLayout;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6c

    iget-object v0, p0, Lz4n;->b:Lcom/opera/android/widget/ClickAwareCardView;

    iget-object v1, p1, Lz4n;->b:Lcom/opera/android/widget/ClickAwareCardView;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6c

    iget-object v0, p0, Lz4n;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v1, p1, Lz4n;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6c

    iget-object v0, p0, Lz4n;->d:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p1, Lz4n;->d:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6c

    iget-object v0, p0, Lz4n;->e:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p1, Lz4n;->e:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6c

    iget-object v0, p0, Lz4n;->f:Lcom/opera/android/custom_views/StylingImageView;

    iget-object v1, p1, Lz4n;->f:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6c

    iget-object v0, p0, Lz4n;->g:Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v1, p1, Lz4n;->g:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6c

    iget-object v0, p0, Lz4n;->h:Lcom/opera/android/widget/RoundedImageView;

    iget-object v1, p1, Lz4n;->h:Lcom/opera/android/widget/RoundedImageView;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6c

    iget-object v0, p0, Lz4n;->i:Lcom/google/android/material/button/MaterialButton;

    iget-object v1, p1, Lz4n;->i:Lcom/google/android/material/button/MaterialButton;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6c

    iget-object p0, p0, Lz4n;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object p1, p1, Lz4n;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6e

    :cond_6c
    const/4 p0, 0x0

    return p0

    :cond_6e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lz4n;->a:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lz4n;->b:Lcom/opera/android/widget/ClickAwareCardView;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lz4n;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lz4n;->d:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lz4n;->e:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lz4n;->f:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lz4n;->g:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    const/4 v1, 0x0

    iget-object v2, p0, Lz4n;->h:Lcom/opera/android/widget/RoundedImageView;

    if-nez v2, :cond_45

    move v2, v1

    goto :goto_49

    :cond_45
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_49
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lz4n;->i:Lcom/google/android/material/button/MaterialButton;

    if-nez v2, :cond_52

    move v2, v1

    goto :goto_56

    :cond_52
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_56
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lz4n;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz p0, :cond_61

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_61
    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
