.class public Lcom/opera/android/custom_views/TabCountButton;
.super Lcom/opera/android/custom_views/StylingImageButton;
.source "SourceFile"


# static fields
.field public static final synthetic l:I


# instance fields
.field public final k:Lm3l;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const v0, 0x7f040026

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/StylingImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v1, Lm3l;

    invoke-direct {v1, p1, p2}, Lm3l;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v1, p0, Lcom/opera/android/custom_views/TabCountButton;->k:Lm3l;

    invoke-virtual {p0, v1}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    const v1, 0x1010098

    filled-new-array {v1}, [I

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v1, v0, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    if-eqz p2, :cond_28

    invoke-virtual {p0, p2}, Lcom/opera/android/custom_views/TabCountButton;->f(Landroid/content/res/ColorStateList;)V

    :cond_28
    return-void
.end method


# virtual methods
.method public final f(Landroid/content/res/ColorStateList;)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/custom_views/TabCountButton;->k:Lm3l;

    iget-object v0, p0, Lm3l;->g:Landroid/content/res/ColorStateList;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    iput-object p1, p0, Lm3l;->g:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method
