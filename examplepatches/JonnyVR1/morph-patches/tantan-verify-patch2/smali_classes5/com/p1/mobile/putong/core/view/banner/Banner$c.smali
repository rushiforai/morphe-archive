.class public final Lcom/p1/mobile/putong/core/view/banner/Banner$c;
.super Landroidx/recyclerview/widget/RecyclerView$i;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/view/banner/Banner;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u000b*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J)\u0010\u0008\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0004\u001a\u00020\u00022\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0005H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u001f\u0010\n\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0004\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\'\u0010\u000e\u001a\u00020\u00072\u0006\u0010\u000c\u001a\u00020\u00022\u0006\u0010\r\u001a\u00020\u00022\u0006\u0010\u0004\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0012"
    }
    d2 = {
        "com/p1/mobile/putong/core/view/banner/Banner$c",
        "Landroidx/recyclerview/widget/RecyclerView$i;",
        "",
        "positionStart",
        "itemCount",
        "",
        "payload",
        "",
        "onItemRangeChanged",
        "(IILjava/lang/Object;)V",
        "onItemRangeInserted",
        "(II)V",
        "fromPosition",
        "toPosition",
        "onItemRangeMoved",
        "(III)V",
        "onChanged",
        "()V",
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
.field public final synthetic a:Lcom/p1/mobile/putong/core/view/banner/Banner;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/view/banner/Banner;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$c;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$i;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/banner/Banner$c;->a:Lcom/p1/mobile/putong/core/view/banner/Banner;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/banner/Banner;->getCurrentPager()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/view/banner/Banner;->l(Lcom/p1/mobile/putong/core/view/banner/Banner;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onItemRangeChanged(IILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/banner/Banner$c;->onChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onItemRangeInserted(II)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    if-le p1, p2, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/banner/Banner$c;->onChanged()V

    .line 5
    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public onItemRangeMoved(III)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/banner/Banner$c;->onChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
