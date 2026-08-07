.class public Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->f()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$b;->a:Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$b;->a:Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$b;->a:Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->d(Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;)Landroid/graphics/Paint;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$b;->a:Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;

    .line 17
    .line 18
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->a(Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v1, v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$b;->a:Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->b(Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;)Landroid/graphics/Paint;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView$b;->a:Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;->a(Lcom/p1/mobile/putong/core/newui/immersionvideo/view/StepProgressView;)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    int-to-float p0, p0

    .line 39
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
