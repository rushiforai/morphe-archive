.class public final synthetic Lcom/ss/bytertc/base/media/camera/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

.field public final synthetic b:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/f;->a:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    iput-object p2, p0, Lcom/ss/bytertc/base/media/camera/f;->b:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/f;->a:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/f;->b:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->g(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Ljava/util/concurrent/atomic/AtomicReference;)V

    return-void
.end method
