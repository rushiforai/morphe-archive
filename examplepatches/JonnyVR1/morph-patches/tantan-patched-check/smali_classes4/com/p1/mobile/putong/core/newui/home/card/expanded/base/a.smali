.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o4m;


# instance fields
.field public a:Ll/dmf;

.field public b:Z

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

.field public n:Z

.field public o:I


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->b:Z

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->n:Z

    .line 10
    .line 11
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 12
    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->o:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a()Ll/dmf;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public getView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/dmf;->a:Landroid/view/View;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method
