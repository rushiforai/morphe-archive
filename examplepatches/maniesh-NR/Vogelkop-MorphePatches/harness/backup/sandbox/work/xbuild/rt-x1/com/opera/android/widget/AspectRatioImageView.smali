.class public Lcom/opera/android/widget/AspectRatioImageView;
.super Lcom/opera/android/custom_views/StylingImageView;
.source "SourceFile"


# static fields
.field public static final synthetic l:I


# instance fields
.field public final k:Lrn9;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/StylingImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Lrn9;

    new-instance v1, Lbi;

    const/16 v2, 0x1d

    invoke-direct {v1, p0, v2}, Lbi;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Lrn9;-><init>(Lla2;)V

    iput-object v0, p0, Lcom/opera/android/widget/AspectRatioImageView;->k:Lrn9;

    invoke-virtual {v0, p1, p2}, Lrn9;->B(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final synthetic f(II)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/widget/AspectRatioImageView;->k:Lrn9;

    invoke-virtual {p0, p1, p2}, Lrn9;->H(II)Z

    return-void
.end method
