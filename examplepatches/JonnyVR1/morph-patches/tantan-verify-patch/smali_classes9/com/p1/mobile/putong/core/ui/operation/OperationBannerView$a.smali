.class public Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->C(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$a;->c:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

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
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$a;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$a;->b:Z

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    if-nez p1, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$a;->b:Z

    .line 16
    .line 17
    :cond_1
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$a;->a:I

    .line 18
    .line 19
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$a;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$a;->c:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->u(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;)Ll/kcg0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$a;->c:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->u(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$a;->c:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

    .line 27
    .line 28
    add-int/lit8 p1, p1, 0x1

    .line 29
    .line 30
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->v(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
