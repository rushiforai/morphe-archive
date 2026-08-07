.class public Ll/g9x$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g9x;->w(Lcom/p1/mobile/putong/data/User;Ll/cf60;ILjava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/g9x;


# direct methods
.method public constructor <init>(Ll/g9x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g9x$a;->a:Ll/g9x;

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
    iget-object p0, p0, Ll/g9x$a;->a:Ll/g9x;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g9x;->v()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g9x$a;->a:Ll/g9x;

    .line 2
    .line 3
    const/high16 v1, 0x42c80000    # 100.0f

    .line 4
    .line 5
    mul-float/2addr v1, p2

    .line 6
    float-to-int v1, v1

    .line 7
    invoke-virtual {v0, p1, v1}, Ll/g9x;->I(II)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/g9x$a;->a:Ll/g9x;

    .line 11
    .line 12
    iget-object p0, p0, Ll/g9x;->e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->onPageScrolled(IFI)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g9x$a;->a:Ll/g9x;

    .line 2
    .line 3
    iget-object v0, v0, Ll/g9x;->e:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->b(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/g9x$a;->a:Ll/g9x;

    .line 9
    .line 10
    invoke-static {v0}, Ll/g9x;->k(Ll/g9x;)Ll/v8x;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p1}, Ll/v8x;->l1(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/g9x$a;->a:Ll/g9x;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, p1, v0}, Ll/g9x;->I(II)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
