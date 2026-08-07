.class Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->cancel()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->access$000(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob$2;->this$0:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;->access$000(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterJob;)Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
