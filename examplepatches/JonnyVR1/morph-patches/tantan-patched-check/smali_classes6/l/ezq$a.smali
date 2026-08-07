.class public Ll/ezq$a;
.super Landroidx/recyclerview/widget/n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ezq;->c(Landroidx/recyclerview/widget/RecyclerView;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/n;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public calculateDxToMakeVisible(Landroid/view/View;I)I
    .locals 1

    .line 1
    const/4 p2, -0x1

    .line 2
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/n;->calculateDxToMakeVisible(Landroid/view/View;I)I

    .line 3
    .line 4
    .line 5
    move-result p2

    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-super {p0, p1, v0}, Landroidx/recyclerview/widget/n;->calculateDxToMakeVisible(Landroid/view/View;I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/2addr p2, p0

    .line 12
    div-int/lit8 p2, p2, 0x2

    .line 13
    .line 14
    return p2
.end method

.method public calculateSpeedPerPixel(Landroid/util/DisplayMetrics;)F
    .locals 0

    .line 1
    iget p0, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 2
    .line 3
    int-to-float p0, p0

    .line 4
    const/high16 p1, 0x42c80000    # 100.0f

    .line 5
    .line 6
    div-float/2addr p1, p0

    .line 7
    return p1
.end method
