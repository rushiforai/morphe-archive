.class public final Ln4l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final b:Landroid/widget/TextView;

.field public final c:Landroid/widget/TextView;

.field public final d:Landroid/widget/TextView;

.field public final e:Lcom/opera/android/custom_views/StylingImageButton;

.field public final f:Lcom/opera/android/custom_views/StylingImageButton;

.field public final g:Lcom/opera/android/custom_views/StylingImageButton;

.field public final h:Ljava/util/List;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Ljava/util/List;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln4l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p2, p0, Ln4l;->b:Landroid/widget/TextView;

    iput-object p3, p0, Ln4l;->c:Landroid/widget/TextView;

    iput-object p4, p0, Ln4l;->d:Landroid/widget/TextView;

    iput-object p5, p0, Ln4l;->e:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p6, p0, Ln4l;->f:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p7, p0, Ln4l;->g:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p8, p0, Ln4l;->h:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_5a

    instance-of v0, p1, Ln4l;

    if-eqz v0, :cond_58

    check-cast p1, Ln4l;

    iget-object v0, p0, Ln4l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v1, p1, Ln4l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Ln4l;->b:Landroid/widget/TextView;

    iget-object v1, p1, Ln4l;->b:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Ln4l;->c:Landroid/widget/TextView;

    iget-object v1, p1, Ln4l;->c:Landroid/widget/TextView;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Ln4l;->d:Landroid/widget/TextView;

    iget-object v1, p1, Ln4l;->d:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Ln4l;->e:Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v1, p1, Ln4l;->e:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Ln4l;->f:Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v1, p1, Ln4l;->f:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Ln4l;->g:Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v1, p1, Ln4l;->g:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object p0, p0, Ln4l;->h:Ljava/util/List;

    iget-object p1, p1, Ln4l;->h:Ljava/util/List;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5a

    :cond_58
    const/4 p0, 0x0

    return p0

    :cond_5a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ln4l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Ln4l;->b:Landroid/widget/TextView;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    const/4 v0, 0x0

    iget-object v2, p0, Ln4l;->c:Landroid/widget/TextView;

    if-nez v2, :cond_18

    move v2, v0

    goto :goto_1c

    :cond_18
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_1c
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Ln4l;->d:Landroid/widget/TextView;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    iget-object v1, p0, Ln4l;->e:Lcom/opera/android/custom_views/StylingImageButton;

    if-nez v1, :cond_2e

    move v1, v0

    goto :goto_32

    :cond_2e
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_32
    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    iget-object v1, p0, Ln4l;->f:Lcom/opera/android/custom_views/StylingImageButton;

    if-nez v1, :cond_3b

    move v1, v0

    goto :goto_3f

    :cond_3b
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_3f
    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    iget-object v1, p0, Ln4l;->g:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v1, :cond_4a

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :cond_4a
    add-int/2addr v2, v0

    mul-int/lit8 v2, v2, 0x1f

    iget-object p0, p0, Ln4l;->h:Ljava/util/List;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
