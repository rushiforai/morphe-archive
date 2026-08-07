.class public Lcom/p1/mobile/putong/oms/OmsBaseRender$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/oms/OmsBaseRender;->A(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/OMSDialog;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/oms/OmsBaseRender;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender$a;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

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

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender$a;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->p(Lcom/p1/mobile/putong/oms/OmsBaseRender;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/p1/mobile/putong/oms/OmsBaseRender$c;

    .line 22
    .line 23
    iget-object v2, v1, Lcom/p1/mobile/putong/oms/OmsBaseRender$c;->c:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-lt p1, v2, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender$a;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 33
    .line 34
    iget-object v3, v1, Lcom/p1/mobile/putong/oms/OmsBaseRender$c;->a:Landroid/view/View;

    .line 35
    .line 36
    iget-object v4, v1, Lcom/p1/mobile/putong/oms/OmsBaseRender$c;->d:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 37
    .line 38
    invoke-static {v2, v3, v4, p1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->r(Lcom/p1/mobile/putong/oms/OmsBaseRender;Landroid/view/View;Lcom/p1/mobile/putong/data/OMSDialog;I)V

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender$a;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/oms/OmsBaseRender$c;->b:Landroid/widget/TextView;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/oms/OmsBaseRender$c;->c:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 52
    .line 53
    invoke-static {v2, v3, v1}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->s(Lcom/p1/mobile/putong/oms/OmsBaseRender;Landroid/widget/TextView;Lcom/p1/mobile/putong/data/OMSDialog;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    :goto_1
    return-void
.end method
