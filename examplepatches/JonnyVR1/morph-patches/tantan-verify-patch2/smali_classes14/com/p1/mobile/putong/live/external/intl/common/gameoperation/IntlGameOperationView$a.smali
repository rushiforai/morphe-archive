.class public Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->v()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView$a;->a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;

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
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView$a;->a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView$a;->a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    iget-object p0, v0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->e(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    add-int/lit8 p1, p1, -0x2

    .line 26
    .line 27
    invoke-virtual {p0, p1, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->d(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView$a;->a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->e(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const/4 v2, 0x1

    .line 46
    sub-int/2addr v0, v2

    .line 47
    if-ne p1, v0, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView$a;->a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a:Lv/VPager;

    .line 52
    .line 53
    invoke-virtual {p0, v2, v1}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 54
    .line 55
    .line 56
    :cond_2
    :goto_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView$a;->a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->i(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView$a;->a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->e(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x1

    .line 17
    if-gt v0, v1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView$a;->a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;

    .line 21
    .line 22
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->f(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView$a;->a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->j(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
