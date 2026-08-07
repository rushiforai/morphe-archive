.class public final synthetic Lcom/ss/bytertc/media/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

.field public final synthetic b:Lcom/ss/android/ttvecamera/TECameraFrame;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;Lcom/ss/android/ttvecamera/TECameraFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/bytertc/media/a;->a:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    iput-object p2, p0, Lcom/ss/bytertc/media/a;->b:Lcom/ss/android/ttvecamera/TECameraFrame;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/a;->a:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    iget-object p0, p0, Lcom/ss/bytertc/media/a;->b:Lcom/ss/android/ttvecamera/TECameraFrame;

    invoke-static {v0, p0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->a(Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;Lcom/ss/android/ttvecamera/TECameraFrame;)V

    return-void
.end method
