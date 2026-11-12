.class public final Luwe;
.super Lh8n;
.source "SourceFile"


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:Lxwe;


# direct methods
.method public constructor <init>(Lxwe;Landroid/widget/TextView;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Luwe;->a:Landroid/widget/TextView;

    iput-object p1, p0, Luwe;->b:Lxwe;

    return-void
.end method


# virtual methods
.method public final onPageScrolled(IFI)V
    .registers 4

    int-to-float p1, p1

    add-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iget-object p2, p0, Luwe;->b:Lxwe;

    iget-object p2, p2, Lxwe;->f:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    invoke-virtual {p2}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    if-ne p1, p2, :cond_1a

    const p1, 0x7f14059a

    goto :goto_1d

    :cond_1a
    const p1, 0x7f140b36

    :goto_1d
    iget-object p0, p0, Luwe;->a:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method
