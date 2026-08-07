.class public Lcom/p1/mobile/putong/oms/OmsBaseRender$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/oms/OmsBaseRender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/TextView;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSDialog;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/data/OMSDialog;


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/widget/TextView;Ljava/util/List;Lcom/p1/mobile/putong/data/OMSDialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/widget/TextView;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSDialog;",
            ">;",
            "Lcom/p1/mobile/putong/data/OMSDialog;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender$c;->a:Landroid/view/View;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender$c;->b:Landroid/widget/TextView;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender$c;->c:Ljava/util/List;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/p1/mobile/putong/oms/OmsBaseRender$c;->d:Lcom/p1/mobile/putong/data/OMSDialog;

    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(Landroid/view/View;Landroid/widget/TextView;Ljava/util/List;Lcom/p1/mobile/putong/data/OMSDialog;Ll/ji50;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/oms/OmsBaseRender$c;-><init>(Landroid/view/View;Landroid/widget/TextView;Ljava/util/List;Lcom/p1/mobile/putong/data/OMSDialog;)V

    return-void
.end method
