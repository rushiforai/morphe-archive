.class public final Ll/neb0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer$a;


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
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0006\u00a8\u0006\u0008"
    }
    d2 = {
        "l/neb0$c",
        "Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer$a;",
        "",
        "position",
        "",
        "b",
        "(I)V",
        "a",
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
    iput-object p1, p0, Ll/neb0$c;->a:Ll/neb0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/neb0$c;->a:Ll/neb0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/neb0;->g(Ll/neb0;)Ll/ceb0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, "pagerAdapter"

    .line 10
    .line 11
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    :cond_0
    invoke-virtual {p0, p1}, Ll/ceb0;->q(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public b(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/neb0$c;->a:Ll/neb0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/neb0;->u()Lcom/p1/mobile/putong/core/ui/view/VPagerInPurchaseDialog;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/neb0$c;->a:Ll/neb0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/neb0;->g(Ll/neb0;)Ll/ceb0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    const-string v0, "pagerAdapter"

    .line 19
    .line 20
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    :cond_0
    invoke-virtual {v0, p1}, Ll/ceb0;->r(I)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/neb0$c;->a:Ll/neb0;

    .line 28
    .line 29
    invoke-static {p0, p1}, Ll/neb0;->i(Ll/neb0;I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
