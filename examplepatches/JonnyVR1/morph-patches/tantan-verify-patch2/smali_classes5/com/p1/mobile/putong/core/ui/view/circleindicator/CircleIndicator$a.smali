.class public Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$a;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$a;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->l(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;)Landroidx/viewpager/widget/ViewPager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$a;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->l(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;)Landroidx/viewpager/widget/ViewPager;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-gtz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$a;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->b(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method
