.class public final synthetic Lcom/ss/bytertc/base/media/camera/j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

.field public final synthetic b:F

.field public final synthetic c:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;FLjava/util/concurrent/atomic/AtomicInteger;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/j;->a:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    iput p2, p0, Lcom/ss/bytertc/base/media/camera/j;->b:F

    iput-object p3, p0, Lcom/ss/bytertc/base/media/camera/j;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/j;->a:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    iget v1, p0, Lcom/ss/bytertc/base/media/camera/j;->b:F

    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/j;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-static {v0, v1, p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->c(Lcom/ss/bytertc/base/media/camera/CameraCapturer;FLjava/util/concurrent/atomic/AtomicInteger;)V

    return-void
.end method
