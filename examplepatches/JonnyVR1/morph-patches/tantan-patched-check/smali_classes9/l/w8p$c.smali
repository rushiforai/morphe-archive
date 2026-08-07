.class public final Ll/w8p$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/w8p;->h0()V
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
        "l/w8p$c",
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
        "pay_intlGmsRelease"
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
.field public final synthetic a:Ll/w8p;


# direct methods
.method public constructor <init>(Ll/w8p;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w8p$c;->a:Ll/w8p;

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

    .line 1
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w8p$c;->a:Ll/w8p;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w8p;->T(Ll/w8p;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    iget-object v0, p0, Ll/w8p$c;->a:Ll/w8p;

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/w8p;->V(Ll/w8p;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/w8p$c;->a:Ll/w8p;

    .line 19
    .line 20
    invoke-static {v0, p1}, Ll/w8p;->W(Ll/w8p;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/w8p$c;->a:Ll/w8p;

    .line 24
    .line 25
    invoke-static {v0, p1}, Ll/w8p;->U(Ll/w8p;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/w8p$c;->a:Ll/w8p;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/w8p;->c0()Lcom/p1/mobile/putong/core/ui/purchase/intlpage/IntlPurchasePageTabsContainerView;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/intlpage/IntlPurchasePageTabsContainerView;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/w8p$c;->a:Ll/w8p;

    .line 38
    .line 39
    invoke-static {p0}, Ll/w8p;->S(Ll/w8p;)Ll/y8p;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    if-eqz p0, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/y8p;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method
