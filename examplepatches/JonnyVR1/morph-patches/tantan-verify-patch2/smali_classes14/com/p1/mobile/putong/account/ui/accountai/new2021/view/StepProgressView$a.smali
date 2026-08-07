.class public Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView$a;->a:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public doFrame(J)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView$a;->a:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->a(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView$a;->a:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;->b(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-ge p1, p2, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView$a;->a:Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/StepProgressView;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
