.class public Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->e(Ljava/lang/String;IILjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Runnable;

.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;ILjava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView$a;->d:Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView$a;->b:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView$a;->c:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView$a;->a:Z

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public onStep(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/tantan/library/svga/AnimListener;->onStep(I)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView$a;->a:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView$a;->b:I

    .line 9
    .line 10
    if-lt p1, v0, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView$a;->c:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView$a;->a:Z

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView$a;->c:Ljava/lang/Runnable;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
