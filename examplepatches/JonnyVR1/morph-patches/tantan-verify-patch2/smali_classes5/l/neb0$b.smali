.class public final Ll/neb0$b;
.super Landroidx/viewpager/widget/ViewPager$m;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/neb0;->y()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0005*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\'\u0010\u0008\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\n\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "l/neb0$b",
        "Landroidx/viewpager/widget/ViewPager$m;",
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
.field public final synthetic a:Ll/neb0;


# direct methods
.method public constructor <init>(Ll/neb0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/neb0$b;->a:Ll/neb0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager$m;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/neb0$b;->a:Ll/neb0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/neb0;->v()Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->f(IF)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/neb0$b;->a:Ll/neb0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/neb0;->h(Ll/neb0;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/Collection;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/neb0$b;->a:Ll/neb0;

    .line 16
    .line 17
    invoke-static {v0}, Ll/neb0;->h(Ll/neb0;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-ge p1, v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ll/neb0$b;->a:Ll/neb0;

    .line 28
    .line 29
    invoke-static {v0}, Ll/neb0;->h(Ll/neb0;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 38
    .line 39
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/4 v0, 0x0

    .line 45
    :goto_0
    iget-object v1, p0, Ll/neb0$b;->a:Ll/neb0;

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/neb0;->v()Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->h(Z)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/neb0$b;->a:Ll/neb0;

    .line 55
    .line 56
    invoke-static {p0, p1}, Ll/neb0;->j(Ll/neb0;I)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
