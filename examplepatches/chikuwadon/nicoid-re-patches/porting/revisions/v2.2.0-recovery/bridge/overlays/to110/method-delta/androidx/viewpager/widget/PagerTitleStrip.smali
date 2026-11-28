.class public Landroidx/viewpager/widget/PagerTitleStrip;
.super Landroid/view/ViewGroup;
.source ""


# annotations
.annotation runtime Landroidx/viewpager/widget/ViewPager$e;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/viewpager/widget/PagerTitleStrip$a;,
        Landroidx/viewpager/widget/PagerTitleStrip$b;
    }
.end annotation


# static fields
.field public static final p:[I

.field public static final q:[I


# instance fields
.field public a:Landroidx/viewpager/widget/ViewPager;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:I

.field public f:F

.field public g:I

.field public i:I

.field public j:Z

.field public k:Z

.field public final l:Landroidx/viewpager/widget/PagerTitleStrip$a;

.field public m:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ld/x/a/a;",
            ">;"
        }
    .end annotation
.end field

.field public n:I

.field public o:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 10

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, -0x1

    iput v0, p0, Landroidx/viewpager/widget/PagerTitleStrip;->e:I

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Landroidx/viewpager/widget/PagerTitleStrip;->f:F

    new-instance v0, Landroidx/viewpager/widget/PagerTitleStrip$a;

    invoke-direct {v0, p0}, Landroidx/viewpager/widget/PagerTitleStrip$a;-><init>(Landroidx/viewpager/widget/PagerTitleStrip;)V

    iput-object v0, p0, Landroidx/viewpager/widget/PagerTitleStrip;->l:Landroidx/viewpager/widget/PagerTitleStrip$a;

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/viewpager/widget/PagerTitleStrip;->b:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/viewpager/widget/PagerTitleStrip;->c:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/viewpager/widget/PagerTitleStrip;->d:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    move-object v0, p0

    move-object v1, p1

    sget-object v2, Landroidx/viewpager/widget/PagerTitleStrip;->p:[I

    move-object v3, p2

    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v0 .. v6}, Landroidx/core/view/ViewCompat;->saveAttributeDataForStyleable(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    move-object p2, v4

    const/4 v0, 0x0

    invoke-virtual {p2, v0, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    if-eqz v1, :cond_0

    iget-object v2, p0, Landroidx/viewpager/widget/PagerTitleStrip;->b:Landroid/widget/TextView;

    invoke-static {v2, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->d(Landroid/widget/TextView;I)V

    iget-object v2, p0, Landroidx/viewpager/widget/PagerTitleStrip;->c:Landroid/widget/TextView;

    invoke-static {v2, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->d(Landroid/widget/TextView;I)V

    iget-object v2, p0, Landroidx/viewpager/widget/PagerTitleStrip;->d:Landroid/widget/TextView;

    invoke-static {v2, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->d(Landroid/widget/TextView;I)V

    :cond_0
    const/4 v2, 0x1

    invoke-virtual {p2, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    if-eqz v2, :cond_1

    int-to-float v2, v2

    invoke-virtual {p0, v0, v2}, Landroidx/viewpager/widget/PagerTitleStrip;->a(IF)V

    :cond_1
    const/4 v2, 0x2

    invoke-virtual {p2, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {p2, v2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iget-object v3, p0, Landroidx/viewpager/widget/PagerTitleStrip;->b:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v3, p0, Landroidx/viewpager/widget/PagerTitleStrip;->c:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v3, p0, Landroidx/viewpager/widget/PagerTitleStrip;->d:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_2
    const/4 v2, 0x3

    const/16 v3, 0x50

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v2

    iput v2, p0, Landroidx/viewpager/widget/PagerTitleStrip;->i:I

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    iget-object p2, p0, Landroidx/viewpager/widget/PagerTitleStrip;->c:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p2

    iput p2, p0, Landroidx/viewpager/widget/PagerTitleStrip;->o:I

    const p2, 0x3f19999a    # 0.6f

    invoke-virtual {p0, p2}, Landroidx/viewpager/widget/PagerTitleStrip;->setNonPrimaryAlpha(F)V

    iget-object p2, p0, Landroidx/viewpager/widget/PagerTitleStrip;->b:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object p2, p0, Landroidx/viewpager/widget/PagerTitleStrip;->c:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object p2, p0, Landroidx/viewpager/widget/PagerTitleStrip;->d:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    if-eqz v1, :cond_3

    sget-object p2, Landroidx/viewpager/widget/PagerTitleStrip;->q:[I

    invoke-virtual {p1, v1, p2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p2

    invoke-virtual {p2, v0, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    :cond_3
    iget-object p2, p0, Landroidx/viewpager/widget/PagerTitleStrip;->b:Landroid/widget/TextView;

    if-eqz v0, :cond_4

    invoke-static {p2}, Landroidx/viewpager/widget/PagerTitleStrip;->setSingleLineAllCaps(Landroid/widget/TextView;)V

    iget-object p2, p0, Landroidx/viewpager/widget/PagerTitleStrip;->c:Landroid/widget/TextView;

    invoke-static {p2}, Landroidx/viewpager/widget/PagerTitleStrip;->setSingleLineAllCaps(Landroid/widget/TextView;)V

    iget-object p2, p0, Landroidx/viewpager/widget/PagerTitleStrip;->d:Landroid/widget/TextView;

    invoke-static {p2}, Landroidx/viewpager/widget/PagerTitleStrip;->setSingleLineAllCaps(Landroid/widget/TextView;)V

    goto :goto_0

    :cond_4
    invoke-virtual {p2}, Landroid/widget/TextView;->setSingleLine()V

    iget-object p2, p0, Landroidx/viewpager/widget/PagerTitleStrip;->c:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->setSingleLine()V

    iget-object p2, p0, Landroidx/viewpager/widget/PagerTitleStrip;->d:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->setSingleLine()V

    :goto_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 p2, 0x41800000    # 16.0f

    mul-float p1, p1, p2

    float-to-int p1, p1

    iput p1, p0, Landroidx/viewpager/widget/PagerTitleStrip;->g:I

    return-void
.end method
