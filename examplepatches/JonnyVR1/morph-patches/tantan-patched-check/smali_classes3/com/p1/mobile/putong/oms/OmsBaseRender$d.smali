.class public Lcom/p1/mobile/putong/oms/OmsBaseRender$d;
.super Ll/lb2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/oms/OmsBaseRender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSDialog;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic f:Lcom/p1/mobile/putong/oms/OmsBaseRender;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender$d;->f:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->q(Lcom/p1/mobile/putong/oms/OmsBaseRender;Lcom/p1/mobile/putong/data/OMSDialog;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender$d;->e:Ljava/util/List;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/oms/OmsBaseRender$d;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender$d;->e:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender$d;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender$d;->e:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    if-ne p1, p2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender$d;->f:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender$d;->e:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->V(Lcom/p1/mobile/putong/data/OMSDialog;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method
