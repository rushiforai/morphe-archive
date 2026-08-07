.class public final Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;->g(Lcom/p1/mobile/putong/app/PutongFrag;Lv/VSegmentBar;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0007*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\'\u0010\u0008\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\n\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0017\u0010\r\u001a\u00020\u00072\u0006\u0010\u000c\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000b\u00a8\u0006\u000e"
    }
    d2 = {
        "com/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$b",
        "Landroidx/viewpager/widget/ViewPager$j;",
        "",
        "position",
        "",
        "positionOffset",
        "positionOffsetPixels",
        "",
        "onPageScrolled",
        "(IFI)V",
        "onPageSelected",
        "(I)V",
        "state",
        "onPageScrollStateChanged",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;

.field public final synthetic b:Lv/VSegmentBar;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;Lv/VSegmentBar;Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$b;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$b;->b:Lv/VSegmentBar;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$b;->c:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$b;->b:Lv/VSegmentBar;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$b;->c:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {p1, p0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Lcom/google/android/material/tabs/TabLayout;->selectTab(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$b;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;->getBottomContentInterface()Ll/tb3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ll/tb3;->a(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout$b;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;

    .line 13
    .line 14
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;->e(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
