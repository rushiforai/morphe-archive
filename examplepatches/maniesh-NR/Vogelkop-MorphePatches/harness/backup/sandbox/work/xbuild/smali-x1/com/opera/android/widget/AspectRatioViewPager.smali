.class public Lcom/opera/android/widget/AspectRatioViewPager;
.super Lcom/opera/android/custom_views/LayoutDirectionViewPager;
.source "SourceFile"


# static fields
.field public static final synthetic d:I


# instance fields
.field public final c:Lrn9;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6

    invoke-direct {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Lrn9;

    new-instance v1, Lva2;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Lrn9;-><init>(Lla2;)V

    iput-object v0, p0, Lcom/opera/android/widget/AspectRatioViewPager;->c:Lrn9;

    invoke-virtual {v0, p1, p2}, Lrn9;->B(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final onMeasure(II)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/widget/AspectRatioViewPager;->c:Lrn9;

    invoke-virtual {p0, p1, p2}, Lrn9;->H(II)Z

    return-void
.end method

.method public final synthetic s(II)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroidx/viewpager/widget/ViewPager;->onMeasure(II)V

    return-void
.end method
