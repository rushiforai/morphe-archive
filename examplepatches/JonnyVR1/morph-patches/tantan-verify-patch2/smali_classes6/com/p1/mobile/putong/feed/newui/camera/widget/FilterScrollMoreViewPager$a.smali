.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/newui/camera/widget/g$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->setOnVerticalFlingListener(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->b0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;)Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->b0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;)Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    int-to-float p0, p0

    .line 26
    div-float/2addr p1, p0

    .line 27
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;->a(F)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public b(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->b0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;)Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->b0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;)Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;->b(F)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public c(ZF)V
    .locals 1

    .line 1
    const/high16 v0, 0x40400000    # 3.0f

    .line 2
    .line 3
    mul-float/2addr p2, v0

    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v0, v0

    .line 11
    cmpl-float p2, p2, v0

    .line 12
    .line 13
    if-lez p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;

    .line 16
    .line 17
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->b0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;)Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->b0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;)Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;->c(Z)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public onCancel()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->b0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;)Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;->b0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager;)Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterScrollMoreViewPager$c;->onCancel()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
