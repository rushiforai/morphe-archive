.class public Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$b;
.super Landroid/database/DataSetObserver;
.source "SourceFile"


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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$b;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/database/DataSetObserver;->onChanged()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$b;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->l(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;)Landroidx/viewpager/widget/ViewPager;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$b;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;

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
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const/4 v0, 0x0

    .line 31
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$b;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-ne v0, v1, :cond_2

    .line 38
    .line 39
    :goto_1
    return-void

    .line 40
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$b;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;

    .line 41
    .line 42
    iget v2, v1, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 43
    .line 44
    if-ge v2, v0, :cond_3

    .line 45
    .line 46
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->l(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;)Landroidx/viewpager/widget/ViewPager;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iput v0, v1, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_3
    const/4 v0, -0x1

    .line 58
    iput v0, v1, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 59
    .line 60
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator$b;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;

    .line 61
    .line 62
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;->m(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method
