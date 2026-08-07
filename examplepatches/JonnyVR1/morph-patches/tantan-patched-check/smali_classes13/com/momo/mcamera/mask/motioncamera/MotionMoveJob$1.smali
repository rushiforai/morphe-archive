.class Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->start(FLandroid/graphics/RectF;Landroid/graphics/RectF;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob$1;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob$1;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;->access$000(Lcom/momo/mcamera/mask/motioncamera/MotionMoveJob;)Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
