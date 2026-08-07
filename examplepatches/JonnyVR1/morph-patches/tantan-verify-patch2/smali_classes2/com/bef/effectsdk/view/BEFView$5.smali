.class Lcom/bef/effectsdk/view/BEFView$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bef/effectsdk/view/BEFView;->dealWithTouches(Landroid/view/MotionEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bef/effectsdk/view/BEFView;

.field final synthetic val$idsParam:[I

.field final synthetic val$pointerCount:I

.field final synthetic val$xsParam:[F

.field final synthetic val$ysParam:[F


# direct methods
.method public constructor <init>(Lcom/bef/effectsdk/view/BEFView;[I[F[FI)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/view/BEFView$5;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/bef/effectsdk/view/BEFView$5;->val$idsParam:[I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/bef/effectsdk/view/BEFView$5;->val$xsParam:[F

    .line 6
    .line 7
    iput-object p4, p0, Lcom/bef/effectsdk/view/BEFView$5;->val$ysParam:[F

    .line 8
    .line 9
    iput p5, p0, Lcom/bef/effectsdk/view/BEFView$5;->val$pointerCount:I

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$5;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 4
    .line 5
    iget-object v3, p0, Lcom/bef/effectsdk/view/BEFView$5;->val$idsParam:[I

    .line 6
    .line 7
    iget-object v4, p0, Lcom/bef/effectsdk/view/BEFView$5;->val$xsParam:[F

    .line 8
    .line 9
    iget-object v5, p0, Lcom/bef/effectsdk/view/BEFView$5;->val$ysParam:[F

    .line 10
    .line 11
    iget v6, p0, Lcom/bef/effectsdk/view/BEFView$5;->val$pointerCount:I

    .line 12
    .line 13
    invoke-static/range {v1 .. v6}, Lcom/bef/effectsdk/view/ViewControllerInterface;->touchEndEvent(J[I[F[FI)I

    .line 14
    .line 15
    .line 16
    return-void
.end method
